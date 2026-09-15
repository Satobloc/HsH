#!/usr/bin/env python3
"""Discover public ChatGPT conversation exports outside HsH Viewer roots.

The script scans an explicitly supplied public repository checkout, recognizes
ChatGPT JSON conversation structure (including JSON stored in .txt files), skips
PRIOR_ART before descent, suppresses byte-identical copies already represented in
HsH's DEVELOPMENT_FULL_CONVOS/LIVE CONVOS, and merges discoveries with the hand-
registered EXTERNAL_CONVERSATIONS.json file.

It never scans private HSH_RESOURCES and never moves or rewrites source exports.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import quote
from zoneinfo import ZoneInfo

import date_conversation_exports as dates

ALLOWED_SUFFIXES = {".json", ".txt"}
PRUNE_DIRS = {".git", "PRIOR_ART", "__pycache__", ".pytest_cache"}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def walk_candidates(root: Path):
    for current, dirs, files in os.walk(root):
        dirs[:] = sorted([d for d in dirs if d not in PRUNE_DIRS], key=str.casefold)
        base = Path(current)
        for name in sorted(files, key=str.casefold):
            p = base / name
            if p.suffix.lower() in ALLOWED_SUFFIXES:
                yield p


def represented_hashes(root: Path) -> set[str]:
    found: set[str] = set()
    for rel in (Path("DEVELOPMENT_FULL_CONVOS"), Path("LIVE CONVOS")):
        base = root / rel
        if not base.is_dir():
            continue
        for p in walk_candidates(base):
            found.add(sha256(p))
    return found


def clean_title(path: Path) -> str:
    name = dates.PREFIX_RE.sub("", path.name, count=1)
    for suffix in (" — raw.json", " — raw.txt", " — raw - .txt", " — raw - .TXT", ".json", ".txt"):
        if name.lower().endswith(suffix.lower()):
            name = name[: -len(suffix)]
            break
    return name.strip() or path.stem


def discover(root: Path, repository: str, branch: str, known_hashes: set[str], tz: ZoneInfo):
    owner, repo = repository.split("/", 1)
    seen = set(known_hashes)
    records = []
    stats = {"candidates": 0, "recognized": 0, "duplicate_hash": 0, "not_conversation": 0}

    for path in walk_candidates(root):
        stats["candidates"] += 1
        digest = sha256(path)
        if digest in seen:
            stats["duplicate_hash"] += 1
            continue
        try:
            data = dates.load_conversation(path)
            start, end, source, count, warnings = dates.date_range(data)
            # Structural guard: a timestamp fallback alone is not enough. Require a
            # ChatGPT-style mapping and at least one human dialogue message.
            if not isinstance(data.get("mapping"), dict) or count <= 0:
                raise ValueError("not a ChatGPT mapping conversation")
        except (OSError, UnicodeError, json.JSONDecodeError, ValueError):
            stats["not_conversation"] += 1
            continue

        seen.add(digest)
        rel = path.relative_to(root).as_posix()
        viewer_path = f"{repo}/{rel}"
        encoded = quote(rel, safe="/")
        start_local = dates.local_datetime(start, tz).isoformat()
        end_local = dates.local_datetime(end, tz).isoformat()
        stable = hashlib.sha1(f"{repository}:{rel}".encode("utf-8")).hexdigest()[:12]
        records.append({
            "id": stable,
            "title": clean_title(path),
            "path": viewer_path,
            "corpus": "glass-public",
            "start_local": start_local,
            "end_local": end_local,
            "message_count": count,
            "timestamp_source": source,
            "warnings": warnings,
            "raw_url": f"https://raw.githubusercontent.com/{owner}/{repo}/{branch}/{encoded}",
            "github_url": f"https://github.com/{owner}/{repo}/blob/{branch}/{encoded}",
            "source_repository": repository,
            "source_path": rel,
            "source_sha256": digest,
            "discovery": "public-cross-repo-structural-scan",
        })
        stats["recognized"] += 1

    records.sort(key=lambda x: (x["start_local"], x["path"].casefold()), reverse=True)
    return records, stats


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--hsh-root", type=Path, default=Path("."))
    ap.add_argument("--external-root", type=Path, required=True)
    ap.add_argument("--external-repository", default="Satobloc/SAT_THEORY_ARCHIVE_2023-25")
    ap.add_argument("--external-branch", default="main")
    ap.add_argument("--manual", type=Path, default=Path("CONVERSATION_VIEWER/EXTERNAL_CONVERSATIONS.json"))
    ap.add_argument("--output", type=Path, default=Path("CONVERSATION_VIEWER/data/discovered_external_conversations.json"))
    ap.add_argument("--timezone", default=dates.DEFAULT_TIMEZONE)
    args = ap.parse_args()

    hsh = args.hsh_root.resolve()
    external = args.external_root.resolve()
    if not hsh.is_dir() or not external.is_dir():
        ap.error("both --hsh-root and --external-root must be directories")
    if args.external_repository.lower() == "satobloc/hsh_resources":
        ap.error("private HSH_RESOURCES is not eligible for public Viewer discovery")

    manual = json.loads((hsh / args.manual).read_text(encoding="utf-8"))
    if manual.get("schema_version") != 1 or not isinstance(manual.get("conversations"), list):
        ap.error("manual external conversation file has unsupported schema")

    known = represented_hashes(hsh)
    discovered, stats = discover(external, args.external_repository, args.external_branch, known, ZoneInfo(args.timezone))

    # Manual registrations win on ID/path; generated discoveries fill the rest.
    merged = list(manual["conversations"])
    ids = {str(x.get("id")) for x in merged}
    paths = {str(x.get("path")) for x in merged}
    added = 0
    for item in discovered:
        if item["id"] in ids or item["path"] in paths:
            continue
        merged.append(item)
        ids.add(item["id"])
        paths.add(item["path"])
        added += 1

    payload = {
        "schema_version": 1,
        "generated_at_utc": datetime.now(timezone.utc).isoformat(),
        "design": "manual registrations plus structurally discovered public cross-repo conversations; private resources excluded",
        "source_repository": args.external_repository,
        "source_branch": args.external_branch,
        "stats": {**stats, "manual": len(manual["conversations"]), "discovered_added": added, "merged": len(merged)},
        "conversations": merged,
    }
    out = hsh / args.output
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(payload["stats"], sort_keys=True))
    print(f"output={out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
