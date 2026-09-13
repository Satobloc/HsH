#!/usr/bin/env python3
"""Extract and score Nathan/user messages from raw ChatGPT conversation JSON.

Topic detection uses BOTH speakers. Quote eligibility uses only raw author.role == 'user'.
Designed for provenance triage, not theory synthesis.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import re
import statistics
from collections import Counter, defaultdict
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Any, Iterable

WORDLISTS = {
    "sat": {
        # historical + current SAT/H(s)H vocabulary
        "sat": 8, "scalar angular torsion": 10, "h(s)h": 10, "hsh": 7,
        "blockwave": 8, "filament": 7, "filaments": 7, "timesheet": 10,
        "time surface": 8, "worldline": 8, "world line": 8, "worldtube": 9,
        "world tube": 9, "theta4": 9, "θ4": 9, "torsion": 5, "twist": 3,
        "braid": 4, "braids": 4, "superhelix": 8, "superhelical": 8,
        "nested helix": 8, "nested helices": 8, "whirligig": 10, "donut": 6,
        "graticule": 10, "hagalaz": 10, "electrogravity": 10, "interbraid": 10,
        "finite core": 8, "intersection readout": 10, "intersection propagation": 10,
        "w-axis": 8, "w axis": 8, "4dhh": 9, "sat-o": 8, "holonomy": 5,
        "t-boson": 9, "f-boson": 9, "macro-bundle": 8, "macro bundle": 8,
        # older / looser vocabulary retained deliberately
        "strand": 2, "strands": 2, "my strings": 5, "string theory like": 4,
        "coil": 3, "coils": 3, "helical worldline": 9, "particle worldline": 7,
        "quantized holonomy": 9, "filament-time": 9, "timesheet drag": 10,
    },
    "physics": {
        "spacetime": 4, "minkowski": 5, "relativity": 4, "general relativity": 5,
        "gravity": 3, "particle": 2, "electron": 3, "quark": 3, "photon": 3,
        "neutrino": 3, "boson": 3, "fermion": 3, "mass": 2, "momentum": 2,
        "energy": 1, "velocity": 2, "acceleration": 2, "field": 1, "metric": 3,
        "manifold": 3, "dimension": 2, "4d": 3, "lorentz": 4, "curvature": 2,
        "topology": 3, "quantum": 3, "qft": 4, "gauge": 3, "symmetry": 2,
        "spin": 2, "phase": 2, "wave": 1, "cosmology": 3, "black hole": 4,
        "kerr": 4, "schwarzschild": 4, "dirac": 4, "clifford": 4, "light cone": 4,
        "proper time": 4, "world sheet": 3, "worldsheet": 3, "lagrangian": 4,
        "hamiltonian": 4, "action": 2, "geodesic": 4, "vacuum": 2,
    },
    "science": {
        "geology": 3, "paleontology": 3, "conodont": 5, "stratigraphy": 4,
        "astronomy": 2, "planetary": 2, "planetology": 3, "biology": 2,
        "evolution": 2, "genetics": 3, "chemistry": 2, "molecule": 2,
        "atom": 2, "optics": 3, "lens": 1, "microscope": 3, "tem": 4,
        "neuroscience": 3, "cognition": 2, "ai": 1, "computation": 2,
        "algorithm": 2, "experiment": 2, "observation": 1, "measurement": 2,
        "data": 1, "hypothesis": 2, "model": 1, "simulation": 2,
    },
    "admin": {
        "repo": 3, "repository": 3, "github": 3, "archive": 3, "index": 2,
        "document": 2, "file": 1, "folder": 2, "upload": 3, "download": 2,
        "readme": 3, "conversation": 2, "search": 1, "rewrite": 2,
        "commit": 3, "branch": 3, "json": 3, "pdf": 2, "markdown": 2,
    },
}

TOKEN_RE = re.compile(r"[\wθ₄()+\-]+", re.UNICODE)


def norm_text(x: str) -> str:
    return re.sub(r"\s+", " ", x.lower()).strip()


def extract_text(message: dict[str, Any]) -> str:
    content = message.get("content") or {}
    parts = content.get("parts") or []
    out = []
    for p in parts:
        if isinstance(p, str):
            out.append(p)
        elif isinstance(p, dict):
            # Do not treat attachments/tool payload objects as authored prose.
            txt = p.get("text")
            if isinstance(txt, str):
                out.append(txt)
    return "\n".join(out).strip()


def phrase_hits(text: str, vocab: dict[str, int]) -> tuple[float, list[str]]:
    t = norm_text(text)
    score = 0.0
    hits: list[str] = []
    for phrase, weight in vocab.items():
        # word-ish boundaries for alphanumeric phrases; substring for symbolic forms
        if phrase.isalnum() or " " in phrase:
            pat = r"(?<!\w)" + re.escape(phrase) + r"(?!\w)"
            n = len(re.findall(pat, t))
        else:
            n = t.count(phrase)
        if n:
            # diminishing returns: first occurrence matters most
            score += weight * (1.0 + math.log1p(n - 1))
            hits.append(f"{phrase}:{n}")
    return score, hits


def length_adjust(raw: float, chars: int) -> float:
    # Avoid punishing short messages heavily while stopping giant messages winning by size.
    return raw / max(1.0, math.sqrt(max(chars, 40) / 160.0))


def robust_z(values: list[float]) -> list[float]:
    if not values:
        return []
    med = statistics.median(values)
    dev = [abs(v - med) for v in values]
    mad = statistics.median(dev)
    if mad == 0:
        # fallback when most messages are zero
        nz = [v for v in values if v > 0]
        scale = statistics.median(nz) if nz else 1.0
        return [(v - med) / max(scale, 1e-9) for v in values]
    return [0.67448975 * (v - med) / mad for v in values]


def load_conversation(path: Path) -> tuple[str, list[dict[str, Any]]]:
    obj = json.loads(path.read_text(encoding="utf-8"))
    # ChatGPT export may be one conversation object or a one-element list.
    if isinstance(obj, list):
        if not obj:
            return path.stem, []
        if len(obj) == 1 and isinstance(obj[0], dict) and "mapping" in obj[0]:
            obj = obj[0]
        else:
            # caller should split multi-conversation exports elsewhere; process each mapping if possible
            convs = [x for x in obj if isinstance(x, dict) and "mapping" in x]
            if len(convs) != 1:
                raise ValueError(f"Expected one conversation mapping in {path}; found {len(convs)}")
            obj = convs[0]
    title = obj.get("title") or path.stem
    mapping = obj.get("mapping") or {}
    rows = []
    for node_id, node in mapping.items():
        msg = (node or {}).get("message")
        if not isinstance(msg, dict):
            continue
        author = msg.get("author") or {}
        role = author.get("role")
        text = extract_text(msg)
        if not text:
            continue
        rows.append({
            "node_id": node_id,
            "message_id": msg.get("id") or node_id,
            "parent": (node or {}).get("parent"),
            "role": role,
            "author_name": author.get("name"),
            "create_time": msg.get("create_time"),
            "text": text,
        })
    rows.sort(key=lambda r: (r["create_time"] is None, r["create_time"] or 0, r["node_id"]))
    return title, rows


def score_conversation(path: Path, window: int = 4) -> list[dict[str, Any]]:
    title, rows = load_conversation(path)
    if not rows:
        return []

    for r in rows:
        r["title"] = title
        r["source_path"] = str(path)
        r["chars"] = len(r["text"])
        r["scores"] = {}
        r["hits"] = {}
        for family, vocab in WORDLISTS.items():
            raw, hits = phrase_hits(r["text"], vocab)
            r["scores"][family] = length_adjust(raw, r["chars"])
            r["hits"][family] = hits

    sat = [r["scores"]["sat"] for r in rows]
    phys = [r["scores"]["physics"] for r in rows]
    sci = [r["scores"]["science"] for r in rows]
    admin = [r["scores"]["admin"] for r in rows]
    zsat = robust_z(sat)

    # Topic context is intentionally computed from BOTH speakers.
    for i, r in enumerate(rows):
        lo, hi = max(0, i-window), min(len(rows), i+window+1)
        dists = [abs(j-i) for j in range(lo, hi)]
        weights = [1.0/(1+d) for d in dists]
        def wav(vals: list[float]) -> float:
            return sum(vals[j]*w for j, w in zip(range(lo, hi), weights)) / sum(weights)
        r["local_sat"] = wav(sat)
        r["local_physics"] = wav(phys)
        r["local_science"] = wav(sci)
        r["local_admin"] = wav(admin)
        r["z_sat"] = zsat[i]

    # Conversation prior: SAT signal relative to competing generic-science/admin signal.
    conv_sat = statistics.fmean(sat)
    conv_phys = statistics.fmean(phys)
    conv_admin = statistics.fmean(admin)
    prior = math.log1p(conv_sat + 0.35*conv_phys) - 0.20*math.log1p(conv_admin)

    # Simple hysteresis segmentation. High threshold opens a region; lower closes it.
    evidence = []
    for r in rows:
        e = (
            0.55*r["scores"]["sat"]
            + 0.95*r["local_sat"]
            + 0.12*r["local_physics"]
            - 0.06*r["local_admin"]
            + 0.25*prior
        )
        r["sat_evidence"] = e
        evidence.append(e)

    positives = [x for x in evidence if x > 0]
    if positives:
        medp = statistics.median(positives)
        open_thr = max(1.8, 0.85*medp)
        close_thr = max(0.65, 0.28*open_thr)
    else:
        open_thr, close_thr = 1e9, 1e9

    active = False
    weak_run = 0
    region_id = 0
    for r in rows:
        e = r["sat_evidence"]
        if not active and e >= open_thr:
            active = True
            weak_run = 0
            region_id += 1
        elif active:
            if e < close_thr:
                weak_run += 1
                if weak_run >= 3:
                    active = False
                    weak_run = 0
            else:
                weak_run = 0
        r["sat_region"] = active
        r["sat_region_id"] = region_id if active else None
        r["open_threshold"] = open_thr
        r["close_threshold"] = close_thr

    # Eligible quote candidates: RAW USER only. Topic context can come from either speaker.
    for r in rows:
        if r["role"] != "user":
            r["candidate_class"] = "CONTEXT_ONLY_NONUSER"
        elif r["scores"]["sat"] > 0:
            r["candidate_class"] = "DIRECT_HIT"
        elif r["sat_region"]:
            r["candidate_class"] = "SAT_RUN_CONTEXT"
        elif r["scores"]["physics"] > 0 and r["local_sat"] > 0:
            r["candidate_class"] = "RESIDUAL_CANDIDATE"
        else:
            r["candidate_class"] = "LIKELY_NON_SAT"
    return rows


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024*1024), b""):
            h.update(chunk)
    return h.hexdigest()


def discover(root: Path) -> list[Path]:
    paths = []
    for p in root.rglob("*"):
        if p.is_file() and p.suffix.lower() == ".json" and "raw" in p.name.lower():
            paths.append(p)
    return sorted(paths)


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("root", type=Path, help="Repo root or conversation subtree")
    ap.add_argument("--out", type=Path, default=Path("nathan_sat_candidates.jsonl"))
    ap.add_argument("--examples", type=Path, default=Path("nathan_sat_examples.md"))
    ap.add_argument("--window", type=int, default=4)
    ap.add_argument("--limit-files", type=int, default=None)
    args = ap.parse_args()

    files = discover(args.root)
    if args.limit_files:
        files = files[:args.limit_files]

    # Byte-level duplicate archive copies are processed once but recorded.
    by_sha: dict[str, list[Path]] = defaultdict(list)
    for p in files:
        by_sha[sha256(p)].append(p)

    all_rows: list[dict[str, Any]] = []
    errors = []
    for digest, copies in by_sha.items():
        primary = copies[0]
        try:
            rows = score_conversation(primary, args.window)
            for r in rows:
                r["source_sha256"] = digest
                r["duplicate_archive_paths"] = [str(x) for x in copies[1:]]
            all_rows.extend(rows)
        except Exception as exc:
            errors.append((str(primary), repr(exc)))

    # Exact-text recurrence is tagged, not deleted.
    user_text_groups: dict[str, list[int]] = defaultdict(list)
    for i, r in enumerate(all_rows):
        if r["role"] == "user":
            key = hashlib.sha256(norm_text(r["text"]).encode()).hexdigest()[:16]
            user_text_groups[key].append(i)
    for key, idxs in user_text_groups.items():
        if len(idxs) > 1:
            for i in idxs:
                all_rows[i]["duplicate_text_group"] = key
        else:
            all_rows[idxs[0]]["duplicate_text_group"] = None

    args.out.parent.mkdir(parents=True, exist_ok=True)
    with args.out.open("w", encoding="utf-8") as f:
        for r in all_rows:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")

    # Human tuning sample: strongest + boundary/context + likely false positives.
    users = [r for r in all_rows if r["role"] == "user"]
    direct = sorted((r for r in users if r["candidate_class"] == "DIRECT_HIT"), key=lambda r: r["sat_evidence"], reverse=True)[:25]
    context = sorted((r for r in users if r["candidate_class"] == "SAT_RUN_CONTEXT"), key=lambda r: r["sat_evidence"], reverse=True)[:25]
    residual = sorted((r for r in users if r["candidate_class"] == "RESIDUAL_CANDIDATE"), key=lambda r: r["sat_evidence"], reverse=True)[:25]
    nonsat_phys = sorted((r for r in users if r["candidate_class"] == "LIKELY_NON_SAT" and r["scores"]["physics"] > 0), key=lambda r: r["scores"]["physics"], reverse=True)[:25]

    with args.examples.open("w", encoding="utf-8") as f:
        f.write("# SAT/H(s)H Candidate Tuning Sample\n\n")
        f.write(f"Files discovered: {len(files)}; unique-by-SHA: {len(by_sha)}; rows: {len(all_rows)}; user rows: {len(users)}\n\n")
        counts = Counter(r["candidate_class"] for r in users)
        f.write("Candidate counts: " + json.dumps(counts, ensure_ascii=False) + "\n\n")
        if errors:
            f.write("## Parse errors\n\n")
            for p,e in errors:
                f.write(f"- `{p}` — `{e}`\n")
            f.write("\n")
        for label, sample in [("DIRECT_HIT", direct), ("SAT_RUN_CONTEXT", context), ("RESIDUAL_CANDIDATE", residual), ("PHYSICS_LIKELY_NON_SAT", nonsat_phys)]:
            f.write(f"## {label}\n\n")
            for r in sample:
                excerpt = r["text"].replace("\n", " ")
                if len(excerpt) > 500:
                    excerpt = excerpt[:497] + "..."
                f.write(f"### {r['title']} — {r['message_id']}\n")
                f.write(f"- source: `{r['source_path']}`\n")
                f.write(f"- score: `{r['sat_evidence']:.3f}`; sat={r['scores']['sat']:.3f}; physics={r['scores']['physics']:.3f}; local_sat={r['local_sat']:.3f}\n")
                f.write(f"- SAT hits: `{', '.join(r['hits']['sat'])}`\n")
                f.write(f"> {excerpt}\n\n")

    print(json.dumps({
        "files_discovered": len(files),
        "unique_file_shas": len(by_sha),
        "messages": len(all_rows),
        "user_messages": len(users),
        "candidate_counts": Counter(r["candidate_class"] for r in users),
        "parse_errors": len(errors),
        "out": str(args.out),
        "examples": str(args.examples),
    }, ensure_ascii=False, indent=2, default=dict))

if __name__ == "__main__":
    main()
