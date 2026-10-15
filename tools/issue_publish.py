#!/usr/bin/env python3
"""Publish one validated owner-authored issue payload to a fixed HsH directory."""
import base64, hashlib, json, os, re, sys, urllib.error, urllib.request
from pathlib import Path

PREFIX = "[HSH-PUBLISH-V1]"
REPO = "Satobloc/HsH"
ROOT = "WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS"
LIMIT = 45000

def api(method, path, payload=None):
    request = urllib.request.Request(
        "https://api.github.com" + path,
        data=json.dumps(payload).encode() if payload is not None else None,
        method=method,
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": "Bearer " + os.environ["GITHUB_TOKEN"],
            "X-GitHub-Api-Version": "2022-11-28",
            "User-Agent": "hsh-issue-publisher-v1",
        },
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        data = response.read()
        return json.loads(data) if data else {}

def comment(number, body):
    api("POST", f"/repos/{REPO}/issues/{number}/comments", {"body": body})

def validate(event):
    issue = event["issue"]
    if not issue["title"].startswith(PREFIX):
        raise ValueError("not a publisher issue")
    if issue.get("author_association") != "OWNER":
        raise ValueError("only the repository owner's submissions are accepted")
    p = json.loads(issue.get("body") or "")
    if set(p) != {"schema", "submission_id", "content", "sha256"}:
        raise ValueError("unexpected payload keys")
    if p["schema"] != "hsh-publish-v1":
        raise ValueError("invalid schema")
    sid = p["submission_id"]
    if not isinstance(sid, str) or not re.fullmatch(r"[a-zA-Z0-9][a-zA-Z0-9._-]{0,79}", sid):
        raise ValueError("invalid submission ID")
    content = p["content"]
    if not isinstance(content, str) or not 1 <= len(content.encode("utf-8")) <= LIMIT:
        raise ValueError("content must contain 1..45000 UTF-8 bytes")
    digest = hashlib.sha256(content.encode()).hexdigest()
    if p["sha256"] != digest:
        raise ValueError("SHA-256 mismatch")
    return sid, content, digest, issue["number"]

def publish(sid, content, digest, number):
    path = f"{ROOT}/{sid}.md"
    url = f"/repos/{REPO}/contents/{path}"
    try:
        existing = api("GET", url)
    except urllib.error.HTTPError as exc:
        if exc.code != 404:
            raise
        existing = None
    if existing is not None:
        if base64.b64decode(existing["content"]).decode("utf-8") != content:
            raise ValueError("submission ID collision; refusing overwrite")
        comment(number, f"PUBLISHED (idempotent): `{path}`, sha256 `{digest}`.")
        return
    response = api("PUT", url, {
        "message": f"Publish HsH submission {sid} from issue #{number}",
        "content": base64.b64encode(content.encode()).decode(),
        "branch": "main",
    })
    found = api("GET", url)
    if base64.b64decode(found["content"]).decode("utf-8") != content:
        raise RuntimeError("repository readback mismatch")
    comment(number, f"PUBLISHED: `{path}`; commit `{response['commit']['sha']}`; sha256 `{digest}`. Readback verified.")

def main():
    event = json.loads(Path(os.environ["GITHUB_EVENT_PATH"]).read_text())
    try:
        sid, content, digest, number = validate(event)
    except (ValueError, KeyError, TypeError, json.JSONDecodeError) as exc:
        print("REJECTED:", exc)
        if event.get("issue", {}).get("title", "").startswith(PREFIX):
            comment(event["issue"]["number"], "REJECTED: " + str(exc))
        return 0
    publish(sid, content, digest, number)
    print("Verified submission", sid)
    return 0

if __name__ == "__main__":
    sys.exit(main())
