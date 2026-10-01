#!/usr/bin/env python3
"""Build a cross-repo image inventory for SAT/H(s)H review.

This scanner intentionally performs only cheap, transparent measurements.
Semantic tags remain suggestions until reviewed.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from pathlib import Path

from PIL import Image

IMAGE_SUFFIXES = {".png", ".jpg", ".jpeg", ".webp", ".gif", ".bmp", ".tif", ".tiff"}
SKIP_PARTS = {".git", "_catalog_sources", "node_modules", "derived"}

REPOS = {
    "HsH": "Satobloc/HsH",
    "SAT_THEORY_ARCHIVE_2023-25": "Satobloc/SAT_THEORY_ARCHIVE_2023-25",
    "HSH_RESOURCES": "Satobloc/HSH_RESOURCES",
}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def dhash(path: Path, size: int = 8) -> str | None:
    try:
        with Image.open(path) as im:
            im = im.convert("L").resize((size + 1, size))
            px = list(im.getdata())
        bits = []
        stride = size + 1
        for y in range(size):
            row = px[y * stride:(y + 1) * stride]
            bits.extend(row[x] > row[x + 1] for x in range(size))
        value = 0
        for bit in bits:
            value = (value << 1) | int(bit)
        return f"{value:0{size * size // 4}x}"
    except Exception:
        return None


def hamming_hex(a: str | None, b: str | None) -> int:
    if not a or not b or len(a) != len(b):
        return 10**9
    return (int(a, 16) ^ int(b, 16)).bit_count()


def shape(width: int | None, height: int | None) -> str:
    if not width or not height:
        return "unknown"
    if abs(width - height) / max(width, height) <= 0.04:
        return "square"
    return "landscape" if width > height else "portrait"


def image_meta(path: Path) -> tuple[int | None, int | None]:
    try:
        with Image.open(path) as im:
            return int(im.width), int(im.height)
    except Exception:
        return None, None


def path_suggestions(rel: str) -> dict:
    s = rel.lower()
    what, topic, role, style = [], [], [], []
    if any(k in s for k in ["notebook", "moleskin", "moleskine", "sketch"]):
        what.append("notebook"); style.append("hand_drawn")
    if any(k in s for k in ["chart", "plot", "matplotlib", "graph"]):
        what.append("chart"); style.append("technical")
    if any(k in s for k in ["screenshot", "screen shot"]):
        what.append("screenshot")
    if any(k in s for k in ["podcast", "thumbnail", "stylesheet"]):
        what.append("podcast_art"); topic.append("podcast")
    if any(k in s for k in ["torus", "toroid", "donut"]): topic.append("torus")
    if any(k in s for k in ["cosmo", "universe", "klein"]): topic.append("cosmology")
    if any(k in s for k in ["hsh", "h(s)h", "hyperhelical", "worldtube"]): topic.append("H(s)H")
    if any(k in s for k in ["sat_", "/sat", "scalar", "torsion"]): topic.append("SAT")
    if any(k in s for k in ["hagalaz", "ui-h", "superhelix"]): topic.append("ᚼ")
    if any(k in s for k in ["gallery", "website", "site", "flavor"]): role.append("website_flavor")
    if any(k in s for k in ["histor", "archive", "old", "early"]): role.append("historical")
    return {
        "what": sorted(set(what)),
        "topic": sorted(set(topic)),
        "role": sorted(set(role)),
        "style": sorted(set(style)),
        "provenance": "path_derived",
    }


def scan_repo(name: str, root: Path) -> list[dict]:
    records = []
    if not root.exists():
        return records
    for path in root.rglob("*"):
        if not path.is_file() or path.suffix.lower() not in IMAGE_SUFFIXES:
            continue
        rel_path = path.relative_to(root)
        if any(part in SKIP_PARTS for part in rel_path.parts):
            continue
        rel = rel_path.as_posix()
        digest = sha256(path)
        width, height = image_meta(path)
        records.append({
            "id": f"sha256:{digest}",
            "repo": name,
            "repo_full_name": REPOS[name],
            "path": rel,
            "filename": path.name,
            "bytes": path.stat().st_size,
            "width": width,
            "height": height,
            "shape": shape(width, height),
            "sha256": digest,
            "dhash": dhash(path),
            "exact_family": None,
            "near_family": None,
            "suggestions": path_suggestions(rel),
            "review": {
                "status": "unreviewed",
                "what": [], "topic": [], "role": [], "style": [],
                "display": "unreviewed",
                "note": "", "reviewer": "", "reviewed_utc": None,
            },
        })
    return records


def assign_families(records: list[dict], near_distance: int = 6) -> None:
    exact = defaultdict(list)
    for r in records:
        exact[r["sha256"]].append(r)
    for digest, members in exact.items():
        if len(members) > 1:
            family = f"exact:{digest[:16]}"
            for r in members:
                r["exact_family"] = family

    reps: list[tuple[str, str]] = []
    family_num = 0
    for r in sorted(records, key=lambda x: (x["dhash"] or "", x["repo"], x["path"])):
        h = r.get("dhash")
        if not h:
            continue
        chosen = None
        for family, rep in reps:
            if hamming_hex(h, rep) <= near_distance:
                chosen = family
                break
        if chosen is None:
            family_num += 1
            chosen = f"near:{family_num:06d}"
            reps.append((chosen, h))
        r["near_family"] = chosen


def write_outputs(records: list[dict], outdir: Path) -> None:
    outdir.mkdir(parents=True, exist_ok=True)
    records.sort(key=lambda r: (r["repo"], r["path"].lower()))
    (outdir / "visual_catalog.jsonl").write_text(
        "".join(json.dumps(r, ensure_ascii=False, sort_keys=True) + "\n" for r in records), encoding="utf-8")
    compact = [{k: r[k] for k in ["id","repo","repo_full_name","path","filename","bytes","width","height","shape","sha256","dhash","exact_family","near_family","suggestions","review"]} for r in records]
    (outdir / "review_data.json").write_text(
        json.dumps({"schema_version": "0.1", "count": len(compact), "items": compact}, ensure_ascii=False), encoding="utf-8")
    summary = defaultdict(int)
    for r in records: summary[r["repo"]] += 1
    exact_groups = len({r["exact_family"] for r in records if r["exact_family"]})
    near_groups = len({r["near_family"] for r in records if r["near_family"]})
    (outdir / "summary.json").write_text(json.dumps({
        "total": len(records), "by_repo": dict(summary), "exact_duplicate_families": exact_groups,
        "near_duplicate_families": near_groups,
    }, indent=2), encoding="utf-8")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--hsh", type=Path, required=True)
    ap.add_argument("--sat", type=Path, required=True)
    ap.add_argument("--resources", type=Path, required=True)
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--near-distance", type=int, default=6)
    args = ap.parse_args()
    records = []
    records += scan_repo("HsH", args.hsh)
    records += scan_repo("SAT_THEORY_ARCHIVE_2023-25", args.sat)
    records += scan_repo("HSH_RESOURCES", args.resources)
    assign_families(records, args.near_distance)
    write_outputs(records, args.out)
    print(json.dumps({"images": len(records), "output": str(args.out)}))


if __name__ == "__main__":
    main()
