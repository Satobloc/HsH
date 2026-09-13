#!/usr/bin/env python3
"""Precision-corrected wrapper for layered_autotag_nathan.py.

Keeps archive-wide discovery and output schemas, but corrects two v1 pathologies:
1) topic phrases use token-boundary matching instead of raw substrings;
2) adjacency rescues context-dependent user turns instead of auto-winnowing nearly every user message.

V1 outputs remain useful as a high-recall diagnostic. V2 is the preferred retrieval/index pass.
"""

from __future__ import annotations

import importlib.util
import math
import re
from collections import Counter
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
V1 = HERE / "layered_autotag_nathan.py"
spec = importlib.util.spec_from_file_location("layered_autotag_nathan_v1", V1)
if spec is None or spec.loader is None:
    raise RuntimeError(f"Could not load {V1}")
v1 = importlib.util.module_from_spec(spec)
spec.loader.exec_module(v1)


def strict_phrase_hit(text: str, phrase: str) -> bool:
    """Match a normalized literal phrase without allowing alphanumeric spillover.

    Examples: `art` no longer matches `particle`; `gene` no longer matches
    `general`; `sat` no longer matches `satisfaction`. Punctuation-bearing SAT
    terms such as `h(s)h` still work.
    """
    t = v1.norm(text)
    p = v1.norm(phrase)
    if not p:
        return False
    left = r"(?<!\w)" if p[0].isalnum() else ""
    right = r"(?!\w)" if p[-1].isalnum() else ""
    return re.search(left + re.escape(p) + right, t) is not None


def topic_tags(text: str) -> set[str]:
    return {
        tag for tag, phrases in v1.TOPICS.items()
        if any(strict_phrase_hit(text, phrase) for phrase in phrases)
    }


def word_count(text: str) -> int:
    return len(re.findall(r"\b\w+[’']?\w*\b", text, re.UNICODE))


def process_conversation(
    path: Path,
    title: str,
    conv_id: str | None,
    rows: list[dict[str, Any]],
    window: int,
    indexed_paths: set[str],
):
    direct_topics = [topic_tags(r["text"]) for r in rows]
    topic_message_counts = Counter(t for tags in direct_topics for t in tags)
    all_conv_topics = set(topic_message_counts)

    # A conversation-level tag should mean more than "the word occurred once in
    # a 2,000-message thread". Preserve all observed topics separately.
    salient_min = max(2, math.ceil(len(rows) * 0.01))
    salient_topics = {t for t, n in topic_message_counts.items() if n >= salient_min}

    user_rhetoric = [
        v1.rhetorical_tags(r["text"]) if r["role"] == "user" else set()
        for r in rows
    ]
    topicful_messages = sum(bool(x) for x in direct_topics)
    conv_density = topicful_messages / max(1, len(rows))

    conv_tags = {f"CONV:{t}" for t in salient_topics}
    if conv_density >= .45:
        conv_tags.add("CONV:HIGH-TOPIC-DENSITY")
    elif conv_density >= .15:
        conv_tags.add("CONV:TOPIC-DENSE")
    elif conv_density > 0:
        conv_tags.add("CONV:TOPIC-SPARSE")

    relpath = path.as_posix()
    index_present = relpath in indexed_paths if indexed_paths else None
    if index_present is False:
        conv_tags.add("INDEX-GAP-CANDIDATE")
    if "SAT-HSH" in salient_topics:
        conv_tags.add("CONV:SAT-HSH")
    if "ARCHIVE-INDEXING" in salient_topics:
        conv_tags.add("CONV:ARCHIVE-WORK")

    records = []
    for i, r in enumerate(rows):
        lo, hi = max(0, i - window), min(len(rows), i + window + 1)
        near_counts: Counter[str] = Counter()
        weighted_adj = 0.0
        weight_total = 0.0
        for j in range(lo, hi):
            if j == i:
                continue
            distance = abs(j - i)
            weight = 1.0 / distance
            for tag in direct_topics[j]:
                near_counts[tag] += 1
            weighted_adj += weight * v1.layer_score(direct_topics[j])
            weight_total += weight

        msg_topics = direct_topics[i]
        rhetoric = user_rhetoric[i]
        wc = word_count(r["text"])

        immediate_topics = set()
        for j in (i - 1, i + 1):
            if 0 <= j < len(rows):
                immediate_topics |= direct_topics[j]

        # Repeated nearby topics are stronger context than one broad assistant
        # turn that happens to mention many fields.
        repeated_near = {t for t, n in near_counts.items() if n >= 2}
        adjacency_topics = immediate_topics | repeated_near
        adj_strength = weighted_adj / weight_total if weight_total else 0.0

        msg_rel = min(16.0, v1.layer_score(msg_topics) + (3.0 if msg_topics else 0.0))
        adj_rel = min(10.0, adj_strength + min(3.0, len(adjacency_topics) * .5)) if adjacency_topics else 0.0
        conv_rel = min(6.0, 6.0 * conv_density + min(2.0, len(salient_topics) / 10.0))
        discourse_bonus = min(4.0, .22 * len(rhetoric - {"SHORT-TURN", "PRECISION:ELLIPSIS"}))

        # Direct Nathan content should outrank mere neighboring context.
        retrieval_score = 4 * msg_rel + 2 * adj_rel + conv_rel + discourse_bonus

        layers = []
        if msg_topics:
            layers.append("MESSAGE")
        if adjacency_topics:
            layers.append("ADJACENCY")
        if salient_topics:
            layers.append("CONVERSATION")

        if r["role"] == "user":
            context_dependent = wc <= 45 or bool(rhetoric & {
                "CORRECTIVE", "CLARIFICATION", "SELF-CORRECTION", "COUNTERMANDING",
                "DEFINITION", "DECISION", "METHODOLOGY", "TESTING-VALIDATION",
                "ENTHUSIASTIC-AGREEMENT", "GENTLE-REDIRECTION",
            })
            if msg_topics:
                bucket = "WINNOW:A-DIRECT-MESSAGE"
            elif adjacency_topics and context_dependent:
                bucket = "WINNOW:B-ADJACENCY-RESCUE"
            elif salient_topics and bool(rhetoric & {
                "METHODOLOGY", "EPISTEMOLOGY", "DEFINITION", "CORRECTIVE",
                "CLARIFICATION", "SELF-CORRECTION", "DECISION", "REVISION",
            }):
                bucket = "WINNOW:C-CONVERSATION-DISCOURSE"
            elif rhetoric:
                bucket = "WINNOW:D-DISCOURSE-ONLY"
            else:
                bucket = "DROP-FOR-NOW"
        else:
            bucket = "CONTEXT-NONUSER"

        rec = dict(r)
        rec.update({
            "title": title,
            "conversation_id": conv_id,
            "source_path": relpath,
            "conversation_density": round(conv_density, 6),
            "conversation_tags": sorted(conv_tags),
            "conversation_topics_all_observed": sorted(all_conv_topics),
            "conversation_topics_salient": sorted(salient_topics),
            "adjacency_tags": sorted(f"ADJ:{t}" for t in adjacency_topics),
            "message_tags": sorted(f"MSG:{t}" for t in msg_topics),
            "discourse_tags": sorted(rhetoric),
            "relevance_layers": layers,
            "adjacency_relevance": round(adj_rel, 4),
            "message_relevance": round(msg_rel, 4),
            "conversation_relevance": round(conv_rel, 4),
            "retrieval_score": round(retrieval_score, 4),
            "winnow_bucket": bucket,
            "structural_index_present": index_present,
            "AUTO_TAG_ONLY": True,
            "NOT_VERIFIED_COMPENDIUM_ENTRY": True,
            "TAGGER_VERSION": 2,
        })
        records.append(rec)

    user_rows = [r for r in records if r["role"] == "user"]
    times = [r["create_time"] for r in rows if isinstance(r["create_time"], (int, float))]
    summary = {
        "source_path": relpath,
        "title": title,
        "conversation_id": conv_id,
        "message_count": len(rows),
        "user_message_count": len(user_rows),
        "first_create_time": min(times) if times else None,
        "last_create_time": max(times) if times else None,
        "conversation_density": round(conv_density, 6),
        "topic_tags": sorted(salient_topics),
        "topic_tags_all_observed": sorted(all_conv_topics),
        "topic_message_counts": dict(sorted(topic_message_counts.items())),
        "conversation_tags": sorted(conv_tags),
        "discourse_tags": sorted(set().union(*user_rhetoric) if user_rhetoric else set()),
        "structural_index_present": index_present,
        "index_gap_candidate": index_present is False,
        "top_retrieval_score": max((r["retrieval_score"] for r in user_rows), default=0),
        "tagger_version": 2,
    }
    return records, summary


v1.topic_tags = topic_tags
v1.process_conversation = process_conversation

if __name__ == "__main__":
    v1.main()
