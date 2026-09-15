#!/usr/bin/env python3
"""Build a deterministic, non-semantic source inventory and stratified sample manifest.

Purpose
-------
Inventory allowed repository trees without interpreting theory content. Record
file identity/size/hash/basic text statistics and produce reproducible stratified
samples for later extraction/availability QA.

HARD QUARANTINE
---------------
Any directory whose path component is exactly ``PRIOR_ART`` is pruned before
traversal. No file beneath it is opened, hashed, sampled, indexed, or listed.
Only an aggregate count of pruned quarantine roots is reported.

This tool assigns no theory authority, relevance, authorship, or quality status.

Optional GitHub upload
----------------------
Pass ``--upload`` to publish ``inventory.csv``, ``sample.csv``, and ``summary.json``
to GitHub after successful local generation. Because a combined run may include
metadata from the private HSH_RESOURCES repository, the safe default destination is:

    Satobloc/HSH_RESOURCES / main / SOURCE_INVENTORY/SABLE/source_inventory_run/

The script refuses to upload a combined inventory containing HSH_RESOURCES metadata
to the known public project repositories unless the user explicitly supplies
``--allow-private-metadata-publication``.

Authentication is resolved in this order:
1. the environment variable named by ``--github-token-env`` (if supplied),
2. ``GH_TOKEN``,
3. ``GITHUB_TOKEN``,
4. ``gh auth token`` from an existing GitHub CLI login.

Tokens are never written to output files or printed.
"""

from __future__ import annotations

import argparse
import base64
import csv
import hashlib
import json
import os
import random
import subprocess
import sys
import urllib.error
import urllib.parse
import urllib.request
from collections import Counter, defaultdict
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any, Iterable

TOOL_VERSION = "sable-source-inventory/0.2.1"
QUARANTINED_COMPONENTS = {"PRIOR_ART"}
TEXT_SUFFIXES = {
    ".txt", ".md", ".json", ".jsonl", ".csv", ".tsv", ".tex", ".py",
    ".yml", ".yaml", ".toml", ".ini", ".lean", ".wl", ".m", ".rst",
}
DEFAULT_UPLOAD_REPO = "Satobloc/HSH_RESOURCES"
DEFAULT_UPLOAD_BRANCH = "main"
DEFAULT_UPLOAD_PATH = "SOURCE_INVENTORY/SABLE/source_inventory_run"
KNOWN_PUBLIC_PROJECT_REPOS = {
    "satobloc/hsh",
    "satobloc/sat_theory_archive_2023-25",
}
GITHUB_API = "https://api.github.com"


@dataclass(frozen=True)
class FileRecord:
    repository: str
    path: str
    topdir: str
    suffix: str
    kind: str
    size_bytes: int
    sha256: str
    line_count: int | None


def sha256_file(path: Path, chunk_size: int = 1024 * 1024) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        while True:
            chunk = handle.read(chunk_size)
            if not chunk:
                break
            digest.update(chunk)
    return digest.hexdigest()


def classify(path: Path) -> str:
    suffix = path.suffix.lower()
    if suffix in TEXT_SUFFIXES:
        return "text"
    if suffix == ".pdf":
        return "pdf"
    if suffix in {".png", ".jpg", ".jpeg", ".webp", ".gif", ".tif", ".tiff"}:
        return "image"
    return "other"


def line_count(path: Path) -> int | None:
    if path.suffix.lower() not in TEXT_SUFFIXES:
        return None
    try:
        with path.open("r", encoding="utf-8", errors="replace") as handle:
            return sum(1 for _ in handle)
    except OSError:
        return None


def contains_quarantined_component(relative: Path) -> bool:
    return any(part in QUARANTINED_COMPONENTS for part in relative.parts)


def iter_allowed_files(root: Path) -> tuple[Iterable[Path], int]:
    """Return allowed files plus count of quarantine roots pruned.

    ``os.walk`` pruning is intentional: files below PRIOR_ART are never touched.
    """
    allowed: list[Path] = []
    pruned_roots = 0
    for current, dirs, files in os.walk(root):
        current_path = Path(current)
        relative_current = current_path.relative_to(root)

        if contains_quarantined_component(relative_current):
            dirs[:] = []
            continue

        kept_dirs: list[str] = []
        for name in dirs:
            if name in QUARANTINED_COMPONENTS:
                pruned_roots += 1
            else:
                kept_dirs.append(name)
        dirs[:] = kept_dirs

        for name in files:
            path = current_path / name
            rel = path.relative_to(root)
            if not contains_quarantined_component(rel):
                allowed.append(path)
    return allowed, pruned_roots


def inventory_repo(label: str, root: Path) -> tuple[list[FileRecord], int]:
    files, pruned = iter_allowed_files(root)
    records: list[FileRecord] = []
    for path in sorted(files):
        rel = path.relative_to(root)
        stat = path.stat()
        topdir = rel.parts[0] if len(rel.parts) > 1 else "__ROOT__"
        records.append(
            FileRecord(
                repository=label,
                path=rel.as_posix(),
                topdir=topdir,
                suffix=path.suffix.lower(),
                kind=classify(path),
                size_bytes=stat.st_size,
                sha256=sha256_file(path),
                line_count=line_count(path),
            )
        )
    return records, pruned


def stratified_sample(
    records: list[FileRecord],
    per_stratum: int,
    seed: int,
) -> list[FileRecord]:
    groups: dict[tuple[str, str, str], list[FileRecord]] = defaultdict(list)
    for record in records:
        groups[(record.repository, record.topdir, record.kind)].append(record)

    rng = random.Random(seed)
    chosen: list[FileRecord] = []
    for key in sorted(groups):
        group = sorted(groups[key], key=lambda r: r.path)
        if len(group) <= per_stratum:
            chosen.extend(group)
        else:
            chosen.extend(rng.sample(group, per_stratum))
    return sorted(chosen, key=lambda r: (r.repository, r.topdir, r.kind, r.path))


def write_csv(path: Path, records: list[FileRecord]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fields = list(FileRecord.__dataclass_fields__)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        for record in records:
            writer.writerow(asdict(record))


def resolve_github_token(preferred_env: str | None) -> tuple[str, str]:
    """Resolve a GitHub token without printing or persisting it."""
    candidates: list[str] = []
    if preferred_env:
        candidates.append(preferred_env)
    candidates.extend(["GH_TOKEN", "GITHUB_TOKEN"])

    seen: set[str] = set()
    for name in candidates:
        if name in seen:
            continue
        seen.add(name)
        token = os.environ.get(name, "").strip()
        if token:
            return token, f"environment:{name}"

    try:
        result = subprocess.run(
            ["gh", "auth", "token"],
            check=True,
            capture_output=True,
            text=True,
        )
        token = result.stdout.strip()
        if token:
            return token, "github-cli"
    except (FileNotFoundError, subprocess.CalledProcessError):
        pass

    raise RuntimeError(
        "GitHub upload requested, but no authentication was found. "
        "Set GH_TOKEN or GITHUB_TOKEN, or run `gh auth login` first."
    )


def github_json_request(
    method: str,
    url: str,
    token: str,
    payload: dict[str, Any] | None = None,
) -> dict[str, Any]:
    body = None
    if payload is not None:
        body = json.dumps(payload).encode("utf-8")

    request = urllib.request.Request(
        url,
        data=body,
        method=method,
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "X-GitHub-Api-Version": "2022-11-28",
            "User-Agent": "sable-source-inventory-sampler",
            "Content-Type": "application/json",
        },
    )
    try:
        with urllib.request.urlopen(request, timeout=60) as response:
            raw = response.read()
            return json.loads(raw.decode("utf-8")) if raw else {}
    except urllib.error.HTTPError as exc:
        detail = exc.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"GitHub API {method} {url} failed: HTTP {exc.code}: {detail}") from exc


def existing_github_sha(
    repo: str,
    branch: str,
    remote_path: str,
    token: str,
) -> str | None:
    encoded_path = urllib.parse.quote(remote_path, safe="/")
    encoded_ref = urllib.parse.quote(branch, safe="")
    url = f"{GITHUB_API}/repos/{repo}/contents/{encoded_path}?ref={encoded_ref}"
    request = urllib.request.Request(
        url,
        method="GET",
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "X-GitHub-Api-Version": "2022-11-28",
            "User-Agent": "sable-source-inventory-sampler",
        },
    )
    try:
        with urllib.request.urlopen(request, timeout=60) as response:
            data = json.loads(response.read().decode("utf-8"))
            sha = data.get("sha")
            return str(sha) if sha else None
    except urllib.error.HTTPError as exc:
        if exc.code == 404:
            return None
        detail = exc.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"GitHub API GET {url} failed: HTTP {exc.code}: {detail}") from exc


def upload_file_to_github(
    *,
    local_path: Path,
    repo: str,
    branch: str,
    remote_path: str,
    token: str,
    commit_message: str,
) -> dict[str, str]:
    """Create or replace one file using current-SHA compare-and-swap semantics."""
    existing_sha = existing_github_sha(repo, branch, remote_path, token)
    encoded_path = urllib.parse.quote(remote_path, safe="/")
    url = f"{GITHUB_API}/repos/{repo}/contents/{encoded_path}"

    payload: dict[str, Any] = {
        "message": commit_message,
        "content": base64.b64encode(local_path.read_bytes()).decode("ascii"),
        "branch": branch,
    }
    if existing_sha:
        payload["sha"] = existing_sha

    result = github_json_request("PUT", url, token, payload)
    content = result.get("content") if isinstance(result.get("content"), dict) else {}
    commit = result.get("commit") if isinstance(result.get("commit"), dict) else {}
    return {
        "remote_path": remote_path,
        "content_sha": str(content.get("sha") or ""),
        "commit_sha": str(commit.get("sha") or ""),
        "html_url": str(content.get("html_url") or ""),
        "operation": "update" if existing_sha else "create",
    }


def upload_outputs(
    *,
    out_dir: Path,
    repo: str,
    branch: str,
    remote_dir: str,
    token: str,
    commit_message: str,
) -> list[dict[str, str]]:
    remote_dir = remote_dir.strip("/")
    results: list[dict[str, str]] = []
    for name in ("inventory.csv", "sample.csv", "summary.json"):
        local_path = out_dir / name
        remote_path = f"{remote_dir}/{name}" if remote_dir else name
        results.append(
            upload_file_to_github(
                local_path=local_path,
                repo=repo,
                branch=branch,
                remote_path=remote_path,
                token=token,
                commit_message=f"{commit_message}: {name}",
            )
        )
    return results


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--repo",
        action="append",
        required=True,
        metavar="LABEL=PATH",
        help="Repository label and local checkout root. Repeat for multiple repos.",
    )
    parser.add_argument("--out-dir", type=Path, required=True)
    parser.add_argument("--sample-per-stratum", type=int, default=3)
    parser.add_argument("--seed", type=int, default=20260914)

    parser.add_argument(
        "--upload",
        action="store_true",
        help="Upload inventory.csv, sample.csv, and summary.json to GitHub after generation.",
    )
    parser.add_argument("--upload-repo", default=DEFAULT_UPLOAD_REPO, metavar="OWNER/REPO")
    parser.add_argument("--upload-branch", default=DEFAULT_UPLOAD_BRANCH)
    parser.add_argument("--upload-path", default=DEFAULT_UPLOAD_PATH)
    parser.add_argument(
        "--github-token-env",
        default=None,
        metavar="ENV_VAR",
        help="Optional preferred environment variable containing a GitHub token.",
    )
    parser.add_argument(
        "--commit-message",
        default="Refresh Sable source inventory",
        help="Base commit message used for uploaded output files.",
    )
    parser.add_argument(
        "--allow-private-metadata-publication",
        action="store_true",
        help="Explicitly allow a run containing HSH_RESOURCES metadata to upload to a known public project repo.",
    )
    args = parser.parse_args()

    if args.sample_per_stratum < 1:
        parser.error("--sample-per-stratum must be >= 1")
    if "/" not in args.upload_repo:
        parser.error("--upload-repo must be OWNER/REPO")

    roots: list[tuple[str, Path]] = []
    for spec in args.repo:
        if "=" not in spec:
            parser.error(f"invalid --repo {spec!r}; expected LABEL=PATH")
        label, raw_path = spec.split("=", 1)
        root = Path(raw_path).expanduser().resolve()
        if not label.strip() or not root.is_dir():
            parser.error(f"invalid repository mapping: {spec!r}")
        roots.append((label.strip(), root))

    includes_private_resources = any(
        label.upper() == "RESOURCES" or root.name.upper() == "HSH_RESOURCES"
        for label, root in roots
    )
    if (
        args.upload
        and includes_private_resources
        and args.upload_repo.lower() in KNOWN_PUBLIC_PROJECT_REPOS
        and not args.allow_private_metadata_publication
    ):
        parser.error(
            "this run includes private HSH_RESOURCES metadata; refusing to upload the combined inventory "
            "to a known public project repository. Use the private default destination, choose another "
            "private repository with --upload-repo, or explicitly pass --allow-private-metadata-publication."
        )

    all_records: list[FileRecord] = []
    pruned_total = 0
    per_repo_pruned: dict[str, int] = {}
    for label, root in roots:
        records, pruned = inventory_repo(label, root)
        all_records.extend(records)
        pruned_total += pruned
        per_repo_pruned[label] = pruned

    all_records = sorted(all_records, key=lambda r: (r.repository, r.path))
    sample = stratified_sample(all_records, args.sample_per_stratum, args.seed)

    args.out_dir.mkdir(parents=True, exist_ok=True)
    write_csv(args.out_dir / "inventory.csv", all_records)
    write_csv(args.out_dir / "sample.csv", sample)

    inventory_sha = hashlib.sha256(
        "".join(
            f"{r.repository}\t{r.path}\t{r.size_bytes}\t{r.sha256}\n"
            for r in all_records
        ).encode("utf-8")
    ).hexdigest()

    summary: dict[str, Any] = {
        "tool": TOOL_VERSION,
        "seed": args.seed,
        "sample_per_stratum": args.sample_per_stratum,
        "file_count": len(all_records),
        "sample_count": len(sample),
        "inventory_sha256": inventory_sha,
        "kinds": dict(sorted(Counter(r.kind for r in all_records).items())),
        "repositories": dict(sorted(Counter(r.repository for r in all_records).items())),
        "prior_art_quarantine_roots_pruned": pruned_total,
        "prior_art_pruned_by_repository": per_repo_pruned,
        "quarantine_policy": "PRIOR_ART path components are pruned before descent; contents are not opened, hashed, sampled, indexed, or listed.",
    }

    if args.upload:
        summary["upload_target"] = {
            "repository": args.upload_repo,
            "branch": args.upload_branch,
            "path": args.upload_path.strip("/"),
        }

    summary_path = args.out_dir / "summary.json"
    summary_path.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )

    print(json.dumps(summary, indent=2, sort_keys=True))

    if args.upload:
        token, auth_source = resolve_github_token(args.github_token_env)
        print(f"GitHub authentication resolved via {auth_source}; token not displayed.")
        upload_results = upload_outputs(
            out_dir=args.out_dir,
            repo=args.upload_repo,
            branch=args.upload_branch,
            remote_dir=args.upload_path,
            token=token,
            commit_message=args.commit_message,
        )
        print("GitHub upload complete:")
        for item in upload_results:
            print(
                f"  {item['operation']:>6}  {item['remote_path']}  "
                f"commit={item['commit_sha'][:12] or 'unknown'}"
            )

    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except RuntimeError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        raise SystemExit(2)
