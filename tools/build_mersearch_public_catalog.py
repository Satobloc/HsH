#!/usr/bin/env python3
"""Build a conservative PUBLIC conversation-title catalog for static GitHub Pages.

This is explicitly NOT the full-text Mersearch archive index.
Input is the PUBLIC Conversation Viewer catalog after curation, not raw archives.
Never fetch private HSH_RESOURCES or arbitrary source files.
"""
from __future__ import annotations

import argparse
import json
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urlsplit, unquote

DEFAULT_INPUT = Path("CONVERSATION_VIEWER/data/conversations.json")
DEFAULT_OUTPUT = Path("CONVERSATION_VIEWER/mersearch/data/catalog.json")
MAX_ENTRIES = 20000
MAX_CATALOG_BYTES = 12 * 1024 * 1024
PUBLIC_REPOS = {"Satobloc/HsH", "Satobloc/SAT_THEORY_ARCHIVE_2023-25"}
ACCEPTED_CORPORA = {"development", "live", "registered-external", "external"}


def iso_day(value: object) -> str:
    if not isinstance(value, str) or not value:
        return ""
    try:
        parsed = datetime.fromisoformat(value.replace("Z", "+00:00"))
        return parsed.date().isoformat() if parsed.tzinfo else ""
    except ValueError:
        return ""


def safe_source_link(value: object) -> tuple[str, str]:
    if not isinstance(value, str) or not value:
        return "", ""
    try:
        u = urlsplit(value)
    except ValueError:
        return "", ""
    if u.scheme != "https" or u.netloc != "github.com":
        return "", ""
    parts = [unquote(part) for part in u.path.strip("/").split("/")]
    if len(parts) < 5 or parts[2] != "blob":
        return "", ""
    repository = parts[0] + "/" + parts[1]
    if repository not in PUBLIC_REPOS:
        return "", ""
    if any(part.upper() in {"PRIOR_ART", "QUARANTINE"} or
           part in {".", ".."} or ("\\" in part) or ("/" in part)
           for part in parts):
        return "", ""
    return value, repository


def make_catalog(document: dict) -> dict:
    if not isinstance(document, dict) or not isinstance(document.get("conversations"), list):
        raise ValueError("Expected the published Conversation Viewer catalog format.")
    # Viewer-builder curation is authoritative for this limited public index.
    if not isinstance(document.get("curation"), dict):
        raise ValueError("Refuse uncurated conversation list.")
    rows, counts, rejected = [], set(), {}
    for source in document["conversations"]:
        if not isinstance(source, dict):
            rejected["not_an_object"] = rejected.get("not_an_object", 0) + 1
            continue
        ident = source.get("id")
        title = source.get("title")
        corpus = source.get("corpus")
        url, repository = safe_source_link(source.get("github_url"))
        if not (isinstance(ident, str) and ident.isalnum() and len(ident) <= 128
                and isinstance(title, str) and title.strip()
                and corpus in ACCEPTED_CORPORA and url):
            rejected["not_publicly_linkable"] = rejected.get("not_publicly_linkable", 0) + 1
            continue
        if ident in counts:
            rejected["duplicate_id"] = rejected.get("duplicate_id", 0) + 1
            continue
        counts.add(ident)
        start = iso_day(source.get("start_local"))
        end = iso_day(source.get("end_local"))
        timestamp = start + "T00:00:00+00:00" if start else ""
        hard = bool(start and source.get("timestamp_source") == "message.create_time")
        # A day value is a normalized display date; its source timezone remains
        # recorded in the underlying Conversation Viewer catalog.
        meta = {
            "earliest_message_at": start if hard else "",
            "latest_message_at": end if hard else "",
            "date_confidence": "direct-message-timestamps" if hard else "undetermined",
            "document_type": "structured-conversation-catalog-entry",
            "estimated_origin_start": start if hard else "",
            "estimated_origin_end": end if hard else "",
            "version_evidence": [],
            "date_evidence": [],
            "archive_date": "",
            "earliest_date_mentioned": "",
            "latest_date_mentioned": "",
            "earliest_version_mentioned": "",
            "latest_version_mentioned": "",
        }
        total = source.get("message_count")
        count = total if isinstance(total, int) and total >= 0 else None
        excerpt = (
            "Published conversation catalog entry"
            + (" · " + str(count) + " messages" if count is not None else "")
            + (" · recorded " + start if start else "")
            + ". The catalog searches titles and file paths, not message text."
        )
        rows.append({
            "title": title[:400],
            "path": str(source.get("path") or "")[:1200],
            "repository": repository,
            "source_url": url,
            "viewer_url": "../?c=" + ident,
            "conversation_id": ident,
            "timestamp": timestamp,
            "speaker": "",
            "role": "",
            "kind": "conversation-catalog",
            "excerpt": excerpt,
            "message_count": count,
            "chronology": meta,
            "passage_chronology": meta,
            "locator": "catalog",
        })
    if len(rows) > MAX_ENTRIES:
        raise ValueError("Public catalog too large for bounded static index.")
    rows.sort(key=lambda r: ((r["timestamp"] or "9999"), r["title"].casefold(), r["conversation_id"]))
    available = sorted({r["repository"] for r in rows})
    return {
        "schema_version": 1,
        "kind": "public-conversation-catalog",
        "profile": "public",
        "dataset": "curated-conversation-titles",
        "coverage_status": "partial",
        "scope_note": (
            "Only entries in the curated PUBLIC Conversation Viewer catalog. "
            "Title/path/date lookup only; NO message full-text, math or archive-wide chronology. "
            "Not a complete search of SAT, HsH, or HSH_RESOURCES."
        ),
        "archives_requested": [
            "Satobloc/SAT_THEORY_ARCHIVE_2023-25",
            "Satobloc/HsH",
            "Satobloc/HSH_RESOURCES",
        ],
        "archives_searched": available,
        "missing_archives": [
            r for r in ("Satobloc/SAT_THEORY_ARCHIVE_2023-25",
                        "Satobloc/HsH", "Satobloc/HSH_RESOURCES") if r not in available
        ],
        "catalog_entries": len(rows),
        "catalog_rejections": rejected,
        "source_curation": {
            "source": document["curation"].get("source"),
            "sha256_16": document["curation"].get("sha256_16"),
            "hidden_conversations": document["curation"].get("hidden_conversations"),
            "partially_curated_conversations": document["curation"].get("partially_curated_conversations"),
        },
        "source_state_at_utc": document.get("source_state_at_utc", ""),
        "generated_at_utc": datetime.now(timezone.utc).isoformat(),
        "hits": rows,
    }


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--catalog", type=Path, default=DEFAULT_INPUT)
    ap.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = ap.parse_args()
    doc = json.loads(args.catalog.read_text(encoding="utf-8"))
    output = make_catalog(doc)
    raw = (json.dumps(output, ensure_ascii=False, separators=(",", ":")) + "\n").encode("utf-8")
    if len(raw) > MAX_CATALOG_BYTES:
        raise SystemExit("Public catalog would exceed 12 MiB. Refusing to publish.")
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(raw)
    print(json.dumps({
        "kind": output["kind"],
        "entries": output["catalog_entries"],
        "bytes": len(raw),
        "archives": output["archives_searched"],
        "rejections": output["catalog_rejections"],
        "output": str(args.output),
        "coverage_status": "partial",
    }))


if __name__ == "__main__":
    main()
