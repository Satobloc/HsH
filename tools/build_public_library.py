#!/usr/bin/env python3
"""Build the curated H(s)H public-library presentation layer.

The historical SAT archive remains immutable. This script reads selection metadata
from LIBRARY/library_manifest.toml, validates source paths against the public
GitHub archive, and optionally writes:

  LIBRARY/README.md
  LIBRARY/generated/<id>.md

Generated source bodies are verbatim after newline normalization. Editorial
metadata is kept outside the reproduced source text.
"""

from __future__ import annotations

import argparse
import html
import sys
import tomllib
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "LIBRARY" / "library_manifest.toml"
PUBLIC_SELECTIONS = {"showcase", "excerpt", "raw_pick"}
PAGE_SELECTIONS = {"showcase", "excerpt"}
VALID_SELECTIONS = PUBLIC_SELECTIONS | {"candidate"}
VALID_RENDER = {"verbatim", "manual"}
VALID_TIERS = {1, 2, 3}


@dataclass
class Source:
    repo: str
    branch: str
    path: str

    @property
    def raw_url(self) -> str:
        owner, name = self.repo.split("/", 1)
        encoded = "/".join(urllib.parse.quote(p, safe="") for p in self.path.split("/"))
        return f"https://raw.githubusercontent.com/{owner}/{name}/{urllib.parse.quote(self.branch, safe='')}/{encoded}"

    @property
    def blob_url(self) -> str:
        encoded = "/".join(urllib.parse.quote(p, safe="") for p in self.path.split("/"))
        return f"https://github.com/{self.repo}/blob/{urllib.parse.quote(self.branch, safe='')}/{encoded}"


def load_manifest() -> dict[str, Any]:
    if not MANIFEST.exists():
        raise SystemExit(f"Manifest not found: {MANIFEST}")
    with MANIFEST.open("rb") as fh:
        return tomllib.load(fh)


def fetch_text(source: Source) -> str:
    req = urllib.request.Request(source.raw_url, headers={"User-Agent": "HsH-public-library-builder/1.1"})
    try:
        with urllib.request.urlopen(req, timeout=60) as response:
            data = response.read()
    except urllib.error.HTTPError as exc:
        raise RuntimeError(f"HTTP {exc.code} for {source.path}") from exc
    except urllib.error.URLError as exc:
        raise RuntimeError(f"Could not fetch {source.path}: {exc.reason}") from exc
    try:
        return data.decode("utf-8").replace("\r\n", "\n").replace("\r", "\n")
    except UnicodeDecodeError as exc:
        raise RuntimeError(f"Source is not UTF-8 text: {source.path}") from exc


def validate_entry(doc: dict[str, Any], seen_ids: set[str]) -> list[str]:
    errors: list[str] = []
    required = ["id", "title", "source_path", "selection"]
    for key in required:
        if not doc.get(key):
            errors.append(f"missing required field {key!r}")

    doc_id = str(doc.get("id", ""))
    if doc_id:
        if doc_id in seen_ids:
            errors.append(f"duplicate id {doc_id!r}")
        seen_ids.add(doc_id)
        if any(c not in "abcdefghijklmnopqrstuvwxyz0123456789-_" for c in doc_id):
            errors.append("id may contain only lowercase letters, digits, '-' and '_'")

    selection = doc.get("selection")
    if selection not in VALID_SELECTIONS:
        errors.append(f"selection must be one of {sorted(VALID_SELECTIONS)}")

    render = doc.get("render", "verbatim")
    if render not in VALID_RENDER:
        errors.append(f"render must be one of {sorted(VALID_RENDER)}")

    tier = doc.get("tier")
    if tier is not None and tier not in VALID_TIERS:
        errors.append("tier must be 1, 2, or 3")

    ranges = doc.get("ranges", [])
    if selection == "excerpt" and not ranges:
        errors.append("excerpt entries require at least one [[documents.ranges]] block")
    for i, r in enumerate(ranges, start=1):
        start, end = r.get("start"), r.get("end")
        if not isinstance(start, int) or not isinstance(end, int) or start < 1 or end < start:
            errors.append(f"range {i} must have integer 1-based start/end with end >= start")
    return errors


def excerpt_text(text: str, ranges: list[dict[str, Any]], path: str) -> list[tuple[str, int, int, str]]:
    lines = text.splitlines()
    out: list[tuple[str, int, int, str]] = []
    for i, r in enumerate(ranges, start=1):
        start, end = r["start"], r["end"]
        if end > len(lines):
            raise RuntimeError(f"{path}: range {start}-{end} exceeds {len(lines)} lines")
        label = r.get("label") or f"Excerpt {i}"
        out.append((label, start, end, "\n".join(lines[start - 1 : end])))
    return out


def safe_pre(text: str) -> str:
    return "<pre style=\"white-space: pre-wrap; overflow-wrap: anywhere;\">\n" + html.escape(text) + "\n</pre>"


def render_page(doc: dict[str, Any], source: Source, text: str) -> str:
    title = doc["title"]
    note = doc.get("note", "")
    date = doc.get("date", "")
    phase = doc.get("phase", "")
    cats = ", ".join(doc.get("categories", []))
    selection = doc["selection"]
    tier = doc.get("tier")
    trial = bool(doc.get("trial", False))

    meta = [
        f"# {title}",
        "",
        "> **Presentation copy.** The historical SAT archive remains the source of truth. The reproduced source text below is not silently rewritten.",
        "",
        "| Field | Value |",
        "|---|---|",
        f"| Source | [`{source.path}`]({source.blob_url}) |",
        f"| Date | {date or '—'} |",
        f"| Development phase | {phase or '—'} |",
        f"| Library selection | {selection} |",
        f"| Candidate tier | {('I' if tier == 1 else 'II' if tier == 2 else 'III' if tier == 3 else '—')} |",
        f"| Presentation status | {'trial candidate' if trial else 'curated'} |",
        f"| Categories | {cats or '—'} |",
    ]
    if note:
        meta += ["", f"**Orientation:** {note}"]
    if trial:
        meta += ["", "_This page is currently being shown as a library-layout test. Inclusion and tier placement remain provisional._"]
    meta += ["", f"[Open the original source in the SAT Archive →]({source.blob_url})", "", "---", ""]

    if doc.get("render", "verbatim") == "manual":
        meta += [
            "_This item is reserved for a manually curated presentation. The generator does not reproduce it automatically._",
            "",
        ]
        return "\n".join(meta)

    if selection == "excerpt":
        blocks = excerpt_text(text, doc.get("ranges", []), source.path)
        body: list[str] = []
        for label, start, end, block in blocks:
            line_url = source.blob_url + f"#L{start}-L{end}"
            body += [
                f"## {label}",
                "",
                f"Source lines [{start}–{end}]({line_url}).",
                "",
                safe_pre(block),
                "",
            ]
    else:
        body = [safe_pre(text), ""]
    return "\n".join(meta + body)


def _entry_block(d: dict[str, Any]) -> list[str]:
    target = f"generated/{d['id']}.md" if d.get("render", "verbatim") != "manual" else d.get("presentation_path", "#")
    desc = d.get("note", "")
    context = " · ".join(x for x in [d.get("date", ""), d.get("phase", "")] if x)
    lines = [f"### [{d['title']}]({target})"]
    if context:
        lines.append(f"*{context}*")
    if desc:
        lines.append(desc)
    lines.append("")
    return lines


def render_index(docs: list[dict[str, Any]], settings: dict[str, Any]) -> str:
    showcase = [d for d in docs if d.get("selection") in PAGE_SELECTIONS]
    raw = [d for d in docs if d.get("selection") == "raw_pick"]
    established = [d for d in showcase if d.get("tier") is None]
    tiered = {tier: [d for d in showcase if d.get("tier") == tier] for tier in (1, 2, 3)}

    lines = [
        "# H(s)H Document Library",
        "",
        "A curated reading layer over the historical **SAT Theory Archive 2023–25**. The Archive remains the source record; this library selects standout papers, writings, and passages for cleaner presentation and easier reading.",
        "",
        "[Development timeline →](../HISTORY_TIMELINE.md) · [Historical SAT Archive →](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25)",
        "",
    ]

    if established:
        lines += ["## Current showcase", ""]
        for d in established:
            lines += _entry_block(d)

    if any(tiered.values()):
        lines += [
            "## Candidate showcase — layout trial",
            "",
            "These tiers are provisional editorial selections being displayed so we can judge the library presentation. A tier is not a scientific-confidence rating and does not make a historical document current theory.",
            "",
        ]
        labels = {
            1: "Tier I — primary showcase candidates",
            2: "Tier II — strong secondary candidates",
            3: "Tier III — broader candidate shelf",
        }
        for tier in (1, 2, 3):
            if not tiered[tier]:
                continue
            lines += [f"### {labels[tier]}", ""]
            for d in tiered[tier]:
                lines += _entry_block(d)

    if not showcase:
        lines += ["## Featured readings", "", "_Selections are being assembled._", ""]

    lines += ["## See the raw development record", "", "These links intentionally lead to the historical source material with minimal presentation. They are useful for readers who want the working record rather than the curated reading path.", ""]
    if not raw:
        lines += ["_Raw-log selections are being assembled._", ""]
    else:
        repo = settings["source_repo"]
        branch = settings.get("source_branch", "main")
        for d in raw:
            src = Source(repo, branch, d["source_path"])
            note = f" — {d['note']}" if d.get("note") else ""
            lines.append(f"- [{d['title']}]({src.blob_url}){note}")
        lines.append("")

    lines += [
        "---",
        "",
        "Library selections are maintained in [`library_manifest.toml`](library_manifest.toml). Candidate tags are deliberately kept separate from the immutable historical source files.",
    ]
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--check", action="store_true", help="validate manifest, sources and ranges; write nothing")
    mode.add_argument("--write", action="store_true", help="validate and rebuild public library files")
    args = parser.parse_args()

    manifest = load_manifest()
    settings = manifest.get("settings", {})
    docs = manifest.get("documents", [])
    repo = settings.get("source_repo")
    branch = settings.get("source_branch", "main")
    if not repo or "/" not in repo:
        raise SystemExit("[settings].source_repo must be owner/repo")

    seen: set[str] = set()
    problems: list[str] = []
    fetched: dict[str, str] = {}

    for doc in docs:
        for err in validate_entry(doc, seen):
            problems.append(f"{doc.get('id', '<unnamed>')}: {err}")
        if doc.get("selection") == "candidate":
            continue
        path = doc.get("source_path")
        if not path:
            continue
        src = Source(repo, branch, path)
        try:
            text = fetch_text(src)
            fetched[doc["id"]] = text
            if doc.get("selection") == "excerpt":
                excerpt_text(text, doc.get("ranges", []), path)
        except Exception as exc:
            problems.append(f"{doc.get('id', '<unnamed>')}: {exc}")

    if problems:
        print("Library manifest validation FAILED:", file=sys.stderr)
        for p in problems:
            print(f"  - {p}", file=sys.stderr)
        return 1

    print(f"Validated {len(docs)} manifest entries; {len(fetched)} public sources resolved.")
    if args.check:
        return 0

    outdir = ROOT / settings.get("generated_dir", "LIBRARY/generated")
    outdir.mkdir(parents=True, exist_ok=True)

    desired: set[Path] = set()
    for doc in docs:
        if doc.get("selection") not in PAGE_SELECTIONS or doc.get("render", "verbatim") == "manual":
            continue
        src = Source(repo, branch, doc["source_path"])
        target = outdir / f"{doc['id']}.md"
        target.write_text(render_page(doc, src, fetched[doc["id"]]), encoding="utf-8")
        desired.add(target.resolve())

    for old in outdir.glob("*.md"):
        if old.resolve() not in desired:
            old.unlink()

    index = ROOT / "LIBRARY" / "README.md"
    index.write_text(render_index(docs, settings), encoding="utf-8")
    print(f"Wrote {index.relative_to(ROOT)} and {len(desired)} generated presentation page(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
