#!/usr/bin/env python3
"""Build the lightweight manifest consumed by the HsH Conversation Viewer.

The viewer deliberately does not duplicate multi-megabyte raw conversation exports.
Instead, it uses the existing conversation-date manifests to build a compact catalog,
then fetches the selected raw JSON conversation on demand in the browser.

Source conversations remain untouched.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from datetime import datetime, timezone
from pathlib import Path
from typing import Any
from urllib.parse import quote

DEFAULT_DEV = Path("indexes/manifests/development-conversation-dates.json")
DEFAULT_LIVE = Path("indexes/manifests/live-conversation-dates.json")
DEFAULT_OUTPUT = Path("CONVERSATION_VIEWER/data/conversations.json")
DATE_PREFIX_RE = re.compile(r"^\d{2}\.\d{2}\.\d{2}•\d{2}\.\d{2}\.\d{2}•")
RAW_SUFFIX_RE = re.compile(r"\s+[—-]\s+raw(?:\s*\(\d+\))?\.json$", re.I)


def load_json(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8-sig") as handle:
        data = json.load(handle)
    if not isinstance(data, dict):
        raise ValueError(f"expected object in {path}")
    return data


def canonical_path(record: dict[str, Any]) -> str | None:
    candidate = record.get("new_path") or record.get("old_path")
    if not isinstance(candidate, str) or not candidate.lower().endswith(".json"):
        return None
    return candidate.replace("\\", "/")


def display_title(path: str) -> str:
    name = Path(path).name
    name = DATE_PREFIX_RE.sub("", name, count=1)
    name = RAW_SUFFIX_RE.sub("", name)
    if name.lower().endswith(".json"):
        name = name[:-5]
    return name.strip() or Path(path).stem


def stable_id(path: str) -> str:
    return hashlib.sha1(path.encode("utf-8")).hexdigest()[:12]


def encoded_path(path: str) -> str:
    return quote(path, safe="/")


def normalize_record(record: dict[str, Any], corpus: str, owner: str, repo: str, branch: str) -> dict[str, Any] | None:
    path = canonical_path(record)
    if path is None:
        return None
    count = record.get("message_count")
    if not isinstance(count, int) or count <= 0:
        return None
    status = str(record.get("status") or "")
    if status in {"skipped", "collision", "blocked"}:
        return None

    encoded = encoded_path(path)
    return {
        "id": stable_id(path),
        "title": display_title(path),
        "path": path,
        "corpus": corpus,
        "start_local": record.get("start_local"),
        "end_local": record.get("end_local"),
        "message_count": count,
        "timestamp_source": record.get("timestamp_source"),
        "warnings": record.get("warnings") or [],
        "raw_url": f"https://raw.githubusercontent.com/{owner}/{repo}/{branch}/{encoded}",
        "github_url": f"https://github.com/{owner}/{repo}/blob/{branch}/{encoded}",
    }


def build_manifest(dev: Path, live: Path, owner: str, repo: str, branch: str) -> dict[str, Any]:
    conversations: list[dict[str, Any]] = []
    inputs = [(dev, "development"), (live, "live")]
    input_meta: list[dict[str, Any]] = []

    for path, corpus in inputs:
        if not path.exists():
            input_meta.append({"path": path.as_posix(), "corpus": corpus, "status": "missing"})
            continue
        payload = load_json(path)
        records = payload.get("records")
        if not isinstance(records, list):
            raise ValueError(f"missing records array in {path}")
        accepted = 0
        for record in records:
            if not isinstance(record, dict):
                continue
            item = normalize_record(record, corpus, owner, repo, branch)
            if item:
                conversations.append(item)
                accepted += 1
        input_meta.append({
            "path": path.as_posix(),
            "corpus": corpus,
            "status": "loaded",
            "records": len(records),
            "accepted_json_conversations": accepted,
            "source_generated_at_utc": payload.get("generated_at_utc"),
        })

    by_path: dict[str, dict[str, Any]] = {}
    for item in conversations:
        old = by_path.get(item["path"])
        if old is None or item["corpus"] == "live":
            by_path[item["path"]] = item
    conversations = list(by_path.values())

    def sort_key(item: dict[str, Any]) -> tuple[str, str]:
        return (str(item.get("start_local") or ""), item["path"].casefold())

    conversations.sort(key=sort_key, reverse=True)
    for index, item in enumerate(conversations):
        item["order"] = index

    return {
        "schema_version": 1,
        "generated_at_utc": datetime.now(timezone.utc).isoformat(),
        "repository": f"{owner}/{repo}",
        "branch": branch,
        "design": "manifest-only; raw conversation JSON fetched on demand",
        "counts": {
            "conversations": len(conversations),
            "development": sum(x["corpus"] == "development" for x in conversations),
            "live": sum(x["corpus"] == "live" for x in conversations),
        },
        "inputs": input_meta,
        "conversations": conversations,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--development-manifest", type=Path, default=DEFAULT_DEV)
    parser.add_argument("--live-manifest", type=Path, default=DEFAULT_LIVE)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--owner", default="Satobloc")
    parser.add_argument("--repo", default="HsH")
    parser.add_argument("--branch", default="main")
    args = parser.parse_args()

    payload = build_manifest(
        args.development_manifest,
        args.live_manifest,
        args.owner,
        args.repo,
        args.branch,
    )
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", encoding="utf-8", newline="\n") as handle:
        json.dump(payload, handle, ensure_ascii=False, indent=2)
        handle.write("\n")

    counts = payload["counts"]
    print(
        f"viewer_manifest={args.output}; conversations={counts['conversations']}; "
        f"development={counts['development']}; live={counts['live']}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
