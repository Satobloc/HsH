#!/usr/bin/env python3
"""Render the cross-repo catalog as split GitHub-native thumbnail index pages."""
from __future__ import annotations

import json
import math
import urllib.parse
from pathlib import Path

HERE = Path(__file__).resolve().parent
DATA = HERE / "derived" / "review_data.json"
OUTDIR = HERE / "index"
PAGE_SIZE = 180


def raw_url(item: dict) -> str:
    return "https://raw.githubusercontent.com/" + item["repo_full_name"] + "/main/" + urllib.parse.quote(item["path"], safe="/")


def chips(item: dict) -> str:
    s = item.get("suggestions", {})
    vals = []
    for key in ("what", "topic", "role", "style"):
        vals.extend(s.get(key, []))
    vals = list(dict.fromkeys(vals))
    return ", ".join(vals[:6]) if vals else "—"


def row(item: dict) -> str:
    url = raw_url(item)
    dim = f"{item.get('width') or '?'}×{item.get('height') or '?'}"
    fam = item.get("exact_family") or item.get("near_family") or "—"
    name = item.get("filename", "")
    path = item.get("path", "")
    repo = item.get("repo", "")
    return (
        f'| <a href="{url}"><img src="{url}" width="104"></a> | '
        f'**{name}**<br><sub>{repo} · {path}</sub><br>{dim} · {item.get("shape","unknown")}<br>'
        f'**suggest:** {chips(item)}<br><sub>family: {fam}</sub> |'
    )


def main() -> None:
    data = json.loads(DATA.read_text(encoding="utf-8"))
    items = data.get("items", [])
    OUTDIR.mkdir(parents=True, exist_ok=True)
    pages = max(1, math.ceil(len(items) / PAGE_SIZE))

    landing = [
        "# SAT/H(s)H Visual Catalog — all thumbnails",
        "",
        f"**{len(items)} images · {pages} pages · {PAGE_SIZE} per page**",
        "",
        "This is the complete cross-repo image index. Suggestions are path-derived until human-reviewed.",
        "",
    ]
    for i in range(pages):
        start = i * PAGE_SIZE + 1
        end = min((i + 1) * PAGE_SIZE, len(items))
        landing.append(f"- [Page {i+1} — images {start}–{end}](page-{i+1:03d}.md)")
    (OUTDIR / "README.md").write_text("\n".join(landing) + "\n", encoding="utf-8")

    for i in range(pages):
        chunk = items[i * PAGE_SIZE:(i + 1) * PAGE_SIZE]
        start = i * PAGE_SIZE + 1
        end = start + len(chunk) - 1
        lines = [
            f"# Visual Catalog — page {i+1}/{pages}",
            "",
            f"Images **{start}–{end}** of **{len(items)}** · [index](README.md)",
            "",
            "| Thumbnail | File / metadata / current suggestions |",
            "|---|---|",
        ]
        lines.extend(row(item) for item in chunk)
        lines += ["", f"[← index](README.md) · " + (f"[next →](page-{i+2:03d}.md)" if i + 1 < pages else "end")]
        (OUTDIR / f"page-{i+1:03d}.md").write_text("\n".join(lines) + "\n", encoding="utf-8")

    print(json.dumps({"images": len(items), "pages": pages, "page_size": PAGE_SIZE}))


if __name__ == "__main__":
    main()
