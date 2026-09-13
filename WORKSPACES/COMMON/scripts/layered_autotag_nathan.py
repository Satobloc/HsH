#!/usr/bin/env python3
"""Three-level autotagger for Nathan/user messages in raw ChatGPT exports.

Purpose: broad provenance winnowing, NOT theory synthesis and NOT automatic promotion to
NATHAN_VERIFIED_WORDS_COMPENDIUM.md.

Relevance is tagged at three levels:
  1) conversation level (both speakers)
  2) adjacency level (nearby turns, both speakers; highest retrieval priority)
  3) message level (the user's own text)

Discourse/style tags are retrieval heuristics only. They are not psychological judgments,
authorship proof, or claim-status judgments.
"""

from __future__ import annotations

import argparse
import json
import math
import re
import statistics
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any

import extract_nathan_sat_candidates as base

# Open-ended seed ontology. Add rather than replace tags as the corpus teaches us more.
TOPICS: dict[str, tuple[str, ...]] = {
    "SAT-HSH": ("sat", "scalar angular torsion", "h(s)h", "hsh", "blockwave", "4dhh", "sat-o"),
    "4D-THINKING": ("4d", "four dimensional", "four-dimensional", "four space", "4-space", "orthogonal dimension"),
    "DIMENSIONALITY": ("dimension", "dimensional", "meters and meters", "metres and metres", "length-valued", "units"),
    "SPEED-OF-TIME": ("speed of time", "rate of time", "time speed"),
    "C-TYPING": ("w=ct", "w = ct", " c ", "speed of light", "intersection propagation"),
    "W-AXIS": ("w-axis", "w axis", "w direction", "w-direction", "w component"),
    "TIMESHEET": ("timesheet", "time sheet", "time surface", "wavefront"),
    "INTERSECTION-READOUT": ("intersection", "readout", "projection", "slice", "cross-section", "cross section"),
    "WORLDLINE": ("worldline", "world line"),
    "WORLDTUBE": ("worldtube", "world tube", "finite core"),
    "HELIX-GEOMETRY": ("helix", "helical", "pitch", "radius", "arc length", "arclength", "coil"),
    "NESTING": ("nested", "nesting", "recursive", "scale level", "scale order", "superhelix", "superhelical"),
    "TOPOLOGY-MORPHOLOGY": ("topology", "morphology", "knot", "braid", "chirality", "winding"),
    "UI": (" ui ", "user interface", "interface"),
    "WHIRLIGIG-DONUT": ("whirligig", "whirlygig", "donut", "torus"),
    "SPHERES": ("spheres", "sphere", "spheroid"),
    "GRATICULE": ("graticule", "graticulum", "graticula"),
    "HAGALAZ": ("hagalaz",),
    "INTERACTIONS": ("interaction", "interactions", "coupling", "force transfer", "energy transfer"),
    "ELECTROGRAVITY": ("electrogravity",),
    "INTERBRAID": ("interbraid",),
    "METRIC": ("metric", "minkowski", "lorentz", "signature"),
    "HOLONOMY": ("holonomy", "phase retardance", "phase"),
    "QUANTIZATION": ("quantization", "quantized", "discrete", "continuous spacetime", "emergent quant"),
    "LAGRANGIAN": ("lagrangian", "action", "euler-lagrange", "hamiltonian"),
    "MODEL-VS-REALITY": ("model", "physical claim", "ontology", "representation", "abstraction", "heuristic"),
    "PROVENANCE-HISTORY": ("first", "earliest", "original", "history", "timeline", "goes back", "used to", "later"),
}

BUNDLES: dict[str, tuple[str, ...]] = {
    "EPISTEMOLOGY": ("know", "knowledge", "evidence", "epistem", "justify", "confidence", "certain", "uncertain", "believe"),
    "METHODOLOGY": ("method", "approach", "procedure", "workflow", "test", "audit", "compare", "rule", "criterion", "rubric"),
    "REASONING": ("reason", "because", "therefore", "if ", "then ", "follows", "means", "implies", "chain"),
    "IDEATION": ("idea", "what if", "could we", "can we", "suppose", "imagine", "maybe try", "wonder"),
    "SPECULATION": ("maybe", "perhaps", "might", "could", "possibly", "hunch", "speculat", "i wonder"),
}

# Discourse tags requested by Nathan. These deliberately favor recall over precision.
DISCOURSE_PATTERNS: dict[str, tuple[str, ...]] = {
    "URGENCY": ("immediately", "right now", "urgent", "stop work", "do this now", "must"),
    "INSISTENCE": ("i insist", "do not", "don't", "must", "always", "never", "i cannot emphasize"),
    "DIDACTICISM": ("the point is", "what i mean is", "understand that", "the way to think", "remember"),
    "POINTEDNESS": ("the point", "specifically", "exactly what", "precisely", "in point of fact"),
    "BLUNTNESS": ("blunt", "simply", "just ", "no.", "wrong", "nonsense"),
    "COARSENESS": ("fuck", "fucking", "shit", "damn", "bullshit"),
    "CORRECTIVE": ("actually", "correction", "correct that", "take that back", "not exactly", "rather", "instead"),
    "NEGATING": (" no ", "not ", "isn't", "aren't", "doesn't", "don't", "cannot", "can't", "never"),
    "COUNTERMANDING": ("stop", "do not", "don't", "cancel", "ignore that", "forget that", "revert", "go back"),
    "COMPLAINING": ("problem", "issue", "not happy", "frustrat", "annoy", "why are you", "you keep"),
    "BLOVIATING": ("let me ramble", "long story", "i'm going on", "to belabor"),
    "LOGORRHEA": (),
    "ADVERSARIALISM": ("disagree", "challenge", "push back", "argue", "objection", "no, because"),
    "CHALLENGE": ("prove", "show me", "convince me", "check it", "audit", "test this"),
    "GENTLE-REDIRECTION": ("well,", "okay, but", "ok, but", "yes, but", "i think instead", "let's instead"),
    "CLARIFICATION": ("what i mean", "to clarify", "more precisely", "in other words", "by that i mean", "specifically"),
    "NUANCE": ("although", "however", "but", "except", "on the other hand", "at least", "mostly", "partly"),
    "HESITANCY": ("well,", "i'm not sure", "i am not sure", "my feeling is", "the way i see it", "i think", "i suspect", "maybe", "perhaps"),
    "ENTHUSIASTIC-AGREEMENT": ("precisely", "exactly", "correct", "that's right", "thats right", "i agree", "yes!", "yes.", "right."),
}


def norm(s: str) -> str:
    return re.sub(r"\s+", " ", s.lower()).strip()


def hits(text: str, phrases: tuple[str, ...]) -> list[str]:
    t = f" {norm(text)} "
    return [p for p in phrases if p and p in t]


def topic_tags(text: str) -> set[str]:
    out = set()
    for tag, phrases in TOPICS.items():
        if hits(text, phrases):
            out.add(tag)
    # Keep the older broad scorer as another independent detector.
    sat_score, _ = base.phrase_hits(text, base.WORDLISTS["sat"])
    phys_score, _ = base.phrase_hits(text, base.WORDLISTS["physics"])
    if sat_score:
        out.add("SAT-HSH")
    if phys_score:
        out.add("PHYSICS")
    return out


def rhetorical_tags(text: str) -> set[str]:
    t = norm(text)
    out = set()
    for tag, phrases in BUNDLES.items():
        if hits(text, phrases):
            out.add(tag)
    for tag, phrases in DISCOURSE_PATTERNS.items():
        if phrases and hits(text, phrases):
            out.add(tag)

    words = re.findall(r"\b\w+[’']?\w*\b", text, re.UNICODE)
    wc = len(words)
    if wc >= 220:
        out.add("LOGORRHEA")
    if wc >= 120:
        out.add("LONG-FORM")
    if wc <= 12:
        out.add("SHORT-TURN")

    # Precision / structure cues. Ellipsis is common, so it gets a tag but little score.
    if "—" in text or "--" in text:
        out.add("PRECISION:EM-DASH")
    if "..." in text or "…" in text:
        out.add("PRECISION:ELLIPSIS")
    if re.search(r"\([^\n]{3,}\)", text):
        out.add("PRECISION:PARENTHETICAL")
    if re.search(r"\[[^\n]{3,}\]", text) or re.search(r"\{[^\n]{3,}\}", text):
        out.add("PRECISION:BRACKETING")
    # Approximate tightly nested clause structure with punctuation density + subordinators.
    sub = len(re.findall(r"\b(although|because|unless|while|whereas|which|that|if|when|except|but)\b", t))
    punct = sum(text.count(x) for x in (",", ";", ":", "—", "("))
    if wc >= 45 and sub >= 3 and punct >= 6:
        out.add("PRECISION:NESTED-CLAUSES")
    if re.search(r"\b(NO|DO NOT|NEVER|STOP|WRONG|EXACTLY|PRECISELY)\b", text):
        out.add("EMPHASIS:ALL-CAPS")
    if text.count("!") >= 2:
        out.add("EMPHASIS:EXCLAMATORY")
    return out


def safe_mean(xs: list[float]) -> float:
    return statistics.fmean(xs) if xs else 0.0


def layer_score(tags: set[str]) -> float:
    # Topic count is intentionally simple; this is a sorter, not a truth metric.
    return min(12.0, float(len(tags)))


def process(path: Path, window: int) -> list[dict[str, Any]]:
    title, rows = base.load_conversation(path)
    if not rows:
        return []

    direct_topics = [topic_tags(r["text"]) for r in rows]
    all_conv_topics = set().union(*direct_topics) if direct_topics else set()
    sat_msgs = sum("SAT-HSH" in x for x in direct_topics)
    physics_msgs = sum("PHYSICS" in x for x in direct_topics)
    conv_density = (sat_msgs + 0.35 * physics_msgs) / max(1, len(rows))

    # Conversation-level tags come from BOTH speakers.
    conv_tags = {f"CONV:{t}" for t in all_conv_topics}
    if conv_density >= 0.10:
        conv_tags.add("CONV:HIGH-SAT-DENSITY")
    elif conv_density >= 0.03:
        conv_tags.add("CONV:SAT-ADJACENT")

    out = []
    for i, r in enumerate(rows):
        lo, hi = max(0, i-window), min(len(rows), i+window+1)
        near = set()
        weighted_adj = 0.0
        weight_total = 0.0
        for j in range(lo, hi):
            if j == i:
                continue
            d = abs(j-i)
            w = 1.0 / d
            near |= direct_topics[j]
            weighted_adj += w * layer_score(direct_topics[j])
            weight_total += w
        adj_strength = weighted_adj / weight_total if weight_total else 0.0

        msg_topics = direct_topics[i]
        msg_tags = {f"MSG:{t}" for t in msg_topics}
        adj_tags = {f"ADJ:{t}" for t in near}
        rhetoric = rhetorical_tags(r["text"]) if r["role"] == "user" else set()

        # Priority requested by Nathan: adjacency > own-message > conversation relevance.
        adj_rel = min(10.0, adj_strength + (2.0 if "SAT-HSH" in near else 0.0))
        msg_rel = min(10.0, layer_score(msg_topics) + (2.0 if "SAT-HSH" in msg_topics else 0.0))
        conv_rel = min(10.0, 25.0 * conv_density + (1.0 if "SAT-HSH" in all_conv_topics else 0.0))
        discourse_bonus = min(3.0, 0.22 * len(rhetoric - {"SHORT-TURN", "PRECISION:ELLIPSIS"}))
        retrieval_score = 3.0*adj_rel + 2.0*msg_rel + 1.0*conv_rel + discourse_bonus

        layers = []
        if adj_rel > 0.5:
            layers.append("ADJACENCY")
        if msg_rel > 0.5:
            layers.append("MESSAGE")
        if conv_rel > 0.5:
            layers.append("CONVERSATION")

        # Broad winnow: ordinary user turns get in if ANY relevance layer fires.
        # Rhetoric enriches ordering but cannot by itself make an unrelated conversation SAT-relevant.
        if r["role"] == "user":
            if adj_rel >= 1.0:
                bucket = "WINNOW:A-ADJACENCY"
            elif msg_rel >= 1.0:
                bucket = "WINNOW:B-MESSAGE"
            elif conv_rel >= 1.0:
                bucket = "WINNOW:C-CONVERSATION"
            else:
                bucket = "DROP-FOR-NOW"
        else:
            bucket = "CONTEXT-NONUSER"

        rec = dict(r)
        rec.update({
            "title": title,
            "source_path": str(path),
            "conversation_density": round(conv_density, 6),
            "conversation_tags": sorted(conv_tags),
            "adjacency_tags": sorted(adj_tags),
            "message_tags": sorted(msg_tags),
            "discourse_tags": sorted(rhetoric),
            "relevance_layers": layers,
            "adjacency_relevance": round(adj_rel, 4),
            "message_relevance": round(msg_rel, 4),
            "conversation_relevance": round(conv_rel, 4),
            "retrieval_score": round(retrieval_score, 4),
            "winnow_bucket": bucket,
            "AUTO_TAG_ONLY": True,
            "NOT_VERIFIED_COMPENDIUM_ENTRY": True,
        })
        out.append(rec)
    return out


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("roots", nargs="+", type=Path)
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--summary", type=Path, required=True)
    ap.add_argument("--window", type=int, default=4)
    ap.add_argument("--limit-files", type=int)
    args = ap.parse_args()

    files: list[Path] = []
    for root in args.roots:
        if root.exists():
            files.extend(base.discover(root))
    files = sorted(dict.fromkeys(files))
    if args.limit_files:
        files = files[:args.limit_files]

    # Exact byte duplicates are processed once. Prefix/superset cleanup is handled separately;
    # this file does not move/delete source material.
    by_sha: dict[str, list[Path]] = defaultdict(list)
    for p in files:
        by_sha[base.sha256(p)].append(p)

    records: list[dict[str, Any]] = []
    errors = []
    for digest, copies in by_sha.items():
        primary = copies[0]
        try:
            rs = process(primary, args.window)
            for r in rs:
                r["source_sha256"] = digest
                r["exact_duplicate_paths"] = [str(x) for x in copies[1:]]
            records.extend(rs)
        except Exception as exc:
            errors.append((str(primary), repr(exc)))

    args.out.parent.mkdir(parents=True, exist_ok=True)
    with args.out.open("w", encoding="utf-8") as f:
        for r in records:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")

    users = [r for r in records if r["role"] == "user"]
    kept = [r for r in users if r["winnow_bucket"].startswith("WINNOW")]
    ranked = sorted(kept, key=lambda r: r["retrieval_score"], reverse=True)
    bucket_counts = Counter(r["winnow_bucket"] for r in users)
    discourse_counts = Counter(t for r in users for t in r["discourse_tags"])
    layer_counts = Counter(t for r in users for t in r["relevance_layers"])

    with args.summary.open("w", encoding="utf-8") as f:
        f.write("# Layered Nathan Autotag Summary\n\n")
        f.write("Machine pre-tags only. Nothing here is automatically promoted to VERIFIED.\n\n")
        f.write(f"- raw files discovered: {len(files)}\n")
        f.write(f"- unique byte-level files: {len(by_sha)}\n")
        f.write(f"- user messages: {len(users)}\n")
        f.write(f"- bulk winnow: {len(kept)}\n")
        f.write(f"- parse errors: {len(errors)}\n")
        f.write(f"- buckets: `{dict(bucket_counts)}`\n")
        f.write(f"- relevance layers: `{dict(layer_counts)}`\n\n")
        f.write("## Most common discourse/precision tags\n\n")
        for tag, n in discourse_counts.most_common(35):
            f.write(f"- `{tag}`: {n}\n")
        f.write("\n## Highest-ranked user turns\n\n")
        for r in ranked[:100]:
            ex = r["text"].replace("\n", " ")
            if len(ex) > 360:
                ex = ex[:357] + "..."
            f.write(f"### {r['title']} — `{r['message_id']}`\n")
            f.write(f"- `{r['winnow_bucket']}` score `{r['retrieval_score']}` layers `{', '.join(r['relevance_layers'])}`\n")
            f.write(f"- message: `{', '.join(r['message_tags'])}`\n")
            f.write(f"- adjacency: `{', '.join(r['adjacency_tags'])}`\n")
            f.write(f"- discourse: `{', '.join(r['discourse_tags'])}`\n")
            f.write(f"> {ex}\n\n")
        if errors:
            f.write("## Parse errors\n\n")
            for p, e in errors:
                f.write(f"- `{p}` — `{e}`\n")

    print(json.dumps({
        "files": len(files),
        "unique_sha": len(by_sha),
        "user_messages": len(users),
        "winnow": len(kept),
        "buckets": dict(bucket_counts),
        "errors": len(errors),
    }, indent=2))


if __name__ == "__main__":
    main()
