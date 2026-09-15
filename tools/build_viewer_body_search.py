#!/usr/bin/env python3
"""Build a compact sharded conversation-body search index for the public Viewer.

The index stores token -> conversation-number postings only; it does not duplicate
message bodies. Hidden conversations are absent because the input is the final Viewer
catalog. Partially curated conversations are indexed from their derived visible copy.
Public GLASS sources are read from the workflow's local GLASS checkout. Private
HSH_RESOURCES is never an input.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
from collections import defaultdict
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

import build_conversation_viewer as viewer

TOKEN_RE = re.compile(r"\w+", re.UNICODE)


def normalize_for_tokens(text: str) -> list[str]:
    text = re.sub(r"h\s*\(\s*s\s*\)\s*h", "hsh", text, flags=re.I)
    return [t for t in (x.casefold() for x in TOKEN_RE.findall(text)) if len(t) >= 2]


def shard_key(token: str) -> str:
    first = token[0] if token else "_"
    return first if first in "abcdefghijklmnopqrstuvwxyz0123456789" else "_"


def catalog_sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def parse_companion_composite(text: str) -> list[dict[str, Any]]:
    # The browser uses a richer overlap merge. For conversation-level token search we
    # only need all visible dialogue text, so indexing the structured header plus the
    # labeled tail is sufficient and harmless if an overlap repeats tokens.
    marker = text.find("#########")
    start = text.find("{")
    messages: list[dict[str, Any]] = []
    if marker >= 0 and start >= 0 and marker > start:
        try:
            head = json.loads(text[start:marker].strip())
            messages.extend(viewer.normalize_conversation(head))
        except Exception:
            pass
        tail = text[marker + len("#########"):]
    else:
        tail = text
    for match in re.finditer(r"(?m)^\s*(Nathan|Srena)\s*$", tail):
        body_start = match.end()
        next_match = re.search(r"(?m)^\s*(?:Nathan|Srena)\s*$", tail[body_start:])
        body_end = body_start + next_match.start() if next_match else len(tail)
        body = tail[body_start:body_end].strip()
        if body:
            messages.append({"role": "user" if match.group(1) == "Nathan" else "companion", "speaker": match.group(1), "text": body})
    return messages


def source_text(convo: dict[str, Any], hsh_root: Path, glass_root: Path | None) -> tuple[str, str]:
    if convo.get("curated"):
        raw = str(convo.get("raw_url") or "")
        if raw.startswith("http://") or raw.startswith("https://"):
            raise ValueError("curated conversation unexpectedly points to remote URL")
        path = hsh_root / "CONVERSATION_VIEWER" / raw
        return path.read_text(encoding="utf-8-sig"), "json"

    source_repo = str(convo.get("source_repository") or "")
    if source_repo == "Satobloc/SAT_THEORY_ARCHIVE_2023-25":
        if glass_root is None:
            raise ValueError("GLASS checkout is required for external body indexing")
        rel = convo.get("source_path")
        if not rel:
            rel = convo.get("path")
            prefix = "SAT_THEORY_ARCHIVE_2023-25/"
            rel = str(rel)[len(prefix):] if str(rel).startswith(prefix) else rel
        path = glass_root / str(rel)
    else:
        path = hsh_root / str(convo["path"])
    return path.read_text(encoding="utf-8-sig"), str(convo.get("parser") or "json")


def message_texts(convo: dict[str, Any], hsh_root: Path, glass_root: Path | None) -> list[str]:
    text, parser = source_text(convo, hsh_root, glass_root)
    if parser == "companion-composite":
        messages = parse_companion_composite(text)
    else:
        data = json.loads(text)
        messages = viewer.normalize_conversation(data)
    return [str(m.get("text") or "") for m in messages if str(m.get("text") or "").strip()]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--catalog", type=Path, default=Path("CONVERSATION_VIEWER/data/conversations.json"))
    ap.add_argument("--hsh-root", type=Path, default=Path("."))
    ap.add_argument("--glass-root", type=Path)
    ap.add_argument("--output-dir", type=Path, default=Path("CONVERSATION_VIEWER/data/body_search"))
    args = ap.parse_args()

    hsh = args.hsh_root.resolve()
    glass = args.glass_root.resolve() if args.glass_root else None
    catalog_path = (hsh / args.catalog).resolve() if not args.catalog.is_absolute() else args.catalog
    catalog = json.loads(catalog_path.read_text(encoding="utf-8"))
    conversations = catalog.get("conversations")
    if not isinstance(conversations, list) or not conversations:
        ap.error("catalog has no conversations")

    postings: dict[str, set[int]] = defaultdict(set)
    indexed = 0
    errors: list[dict[str, str]] = []
    for index, convo in enumerate(conversations):
        try:
            tokens: set[str] = set()
            for text in message_texts(convo, hsh, glass):
                tokens.update(normalize_for_tokens(text))
            for token in tokens:
                postings[token].add(index)
            indexed += 1
        except Exception as exc:
            errors.append({"id": str(convo.get("id")), "path": str(convo.get("path")), "error": f"{type(exc).__name__}: {exc}"})

    if errors:
        raise RuntimeError(f"body index could not read {len(errors)} visible conversations; first errors: {errors[:5]}")

    out = (hsh / args.output_dir).resolve() if not args.output_dir.is_absolute() else args.output_dir
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True, exist_ok=True)

    shards: dict[str, dict[str, list[int]]] = defaultdict(dict)
    for token in sorted(postings):
        shards[shard_key(token)][token] = sorted(postings[token])

    shard_meta = {}
    total_bytes = 0
    for key in sorted(shards):
        path = out / f"{key}.json"
        payload = {"schema_version": 1, "tokens": shards[key]}
        path.write_text(json.dumps(payload, ensure_ascii=False, separators=(",", ":")) + "\n", encoding="utf-8")
        size = path.stat().st_size
        total_bytes += size
        shard_meta[key] = {"tokens": len(shards[key]), "bytes": size}

    meta = {
        "schema_version": 1,
        "generated_at_utc": datetime.now(timezone.utc).isoformat(),
        "catalog_sha256": catalog_sha(catalog_path),
        "conversation_ids": [str(c["id"]) for c in conversations],
        "conversation_count": len(conversations),
        "indexed_conversations": indexed,
        "unique_tokens": len(postings),
        "posting_count": sum(len(v) for v in postings.values()),
        "shard_bytes": total_bytes,
        "shards": shard_meta,
        "tokenization": "Unicode word tokens casefolded; H(s)H normalized to hsh; tokens shorter than 2 omitted",
        "privacy": "Final public Viewer catalog only; private HSH_RESOURCES is not indexed",
    }
    (out / "meta.json").write_text(json.dumps(meta, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({k: meta[k] for k in ("conversation_count", "indexed_conversations", "unique_tokens", "posting_count", "shard_bytes")}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
