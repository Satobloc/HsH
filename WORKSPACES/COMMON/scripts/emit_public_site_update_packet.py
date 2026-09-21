#!/usr/bin/env python3
"""Emit a collision-safe Glass Sausage Factory worker update packet.

This is repository-side feeder infrastructure. It does not publish or edit the
live ChatGPT Site. It writes one structured JSON handoff under
PUBLIC_SITE/live_influx/packets/ for later editorial/site-builder consumption.

Example:
  python WORKSPACES/COMMON/scripts/emit_public_site_update_packet.py \
    --instance MERIDIAN \
    --slug hagalaz-so4-interlingua \
    --title "Hagalaz / SO(4) framed-sphere interlingua" \
    --kind concept-update --kind diagram --kind current-work \
    --status candidate \
    --summary "Candidate 8-slot relation: six SO(4) rotation channels plus scale and rung advance." \
    --source current-sandbox:WORKSPACES/MERIDIAN/SANDBOX/RUN_091_HAGALAZ_SUPERHELIX_INTERLINGUA_V01.md \
    --asset P:PUBLIC_SITE/assets/diagrams/so4-six-rotation-planes-class-p-v01.svg \
    --destination current-work \
    --destination concept-page
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
from pathlib import Path

ALLOWED_STATUS = {
    "candidate", "ready", "needs-source-check", "parked", "rejected", "incorporated"
}
ALLOWED_KINDS = {
    "concept-update", "current-work", "diagram", "document", "quote", "news",
    "podcast", "glossary", "history", "workflow", "build-suggestion", "cross-link"
}
ALLOWED_CLASSES = {"P", "H", "I"}


def slugify(text: str) -> str:
    text = text.strip().lower()
    text = re.sub(r"[^a-z0-9]+", "-", text)
    return text.strip("-") or "update"


def split_tagged(values: list[str], default_tag: str) -> list[dict[str, str]]:
    out: list[dict[str, str]] = []
    for raw in values:
        if ":" in raw:
            tag, value = raw.split(":", 1)
        else:
            tag, value = default_tag, raw
        out.append({"role": tag.strip(), "path": value.strip()})
    return out


def split_assets(values: list[str]) -> list[dict[str, str]]:
    out: list[dict[str, str]] = []
    for raw in values:
        if ":" in raw:
            klass, value = raw.split(":", 1)
        else:
            klass, value = "P", raw
        klass = klass.strip().upper()
        if klass not in ALLOWED_CLASSES:
            raise SystemExit(f"invalid visual class {klass!r}; use P, H, or I")
        out.append({"class": klass, "path": value.strip()})
    return out


def next_free_path(directory: Path, stem: str) -> Path:
    target = directory / f"{stem}.json"
    if not target.exists():
        return target
    i = 2
    while True:
        candidate = directory / f"{stem}__{i}.json"
        if not candidate.exists():
            return candidate
        i += 1


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--repo-root", default=".")
    p.add_argument("--instance", required=True)
    p.add_argument("--slug", required=True)
    p.add_argument("--title", required=True)
    p.add_argument("--kind", action="append", dest="kinds", required=True)
    p.add_argument("--status", default="candidate")
    p.add_argument("--summary", required=True)
    p.add_argument("--source", action="append", default=[])
    p.add_argument("--asset", action="append", default=[])
    p.add_argument("--destination", action="append", default=[])
    p.add_argument("--public-copy")
    p.add_argument("--theory-status", default="unchanged / see controlling sources")
    p.add_argument("--publication-status", default="not published by this packet")
    p.add_argument("--time-sensitive", action="store_true")
    p.add_argument("--follow-up", action="append", default=[])
    p.add_argument("--task-id")
    p.add_argument("--branch-id")
    args = p.parse_args()

    if args.status not in ALLOWED_STATUS:
        raise SystemExit(f"invalid status {args.status!r}")
    bad_kinds = sorted(set(args.kinds) - ALLOWED_KINDS)
    if bad_kinds:
        raise SystemExit(f"invalid kind(s): {', '.join(bad_kinds)}")
    if not args.source:
        raise SystemExit("at least one --source is required")
    if not args.destination:
        raise SystemExit("at least one --destination is required")

    today = dt.date.today().isoformat()
    instance = re.sub(r"[^A-Za-z0-9_-]+", "_", args.instance.strip()).upper()
    slug = slugify(args.slug)
    packet_id = f"{today}__{instance}__{slug}"

    packet = {
        "schema_version": 1,
        "packet_id": packet_id,
        "created": today,
        "producer": {
            "instance": instance,
            "task_id": args.task_id,
            "branch_id": args.branch_id,
        },
        "title": args.title,
        "kinds": args.kinds,
        "status": args.status,
        "summary": args.summary,
        "public_copy": args.public_copy,
        "sources": split_tagged(args.source, "source"),
        "assets": split_assets(args.asset),
        "destinations": [{"surface": x} for x in args.destination],
        "epistemic": {
            "theory_status": args.theory_status,
            "publication_status": args.publication_status,
        },
        "time_sensitive": bool(args.time_sensitive),
        "follow_up": args.follow_up,
        "provenance": {
            "emitter": "WORKSPACES/COMMON/scripts/emit_public_site_update_packet.py",
            "note": "Packet is a public-site handoff, not an authority transform or publication event.",
        },
    }

    # Omit null routing fields for cleaner packets.
    packet["producer"] = {k: v for k, v in packet["producer"].items() if v is not None}
    if packet["public_copy"] is None:
        packet.pop("public_copy")
    if not packet["assets"]:
        packet.pop("assets")
    if not packet["follow_up"]:
        packet.pop("follow_up")

    repo_root = Path(args.repo_root).resolve()
    out_dir = repo_root / "PUBLIC_SITE" / "live_influx" / "packets"
    out_dir.mkdir(parents=True, exist_ok=True)
    target = next_free_path(out_dir, packet_id)
    target.write_text(json.dumps(packet, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(target.relative_to(repo_root))


if __name__ == "__main__":
    main()
