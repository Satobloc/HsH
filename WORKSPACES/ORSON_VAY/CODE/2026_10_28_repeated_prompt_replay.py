#!/usr/bin/env python3
"""Read-only, source-pinned replay of ConsistencyBench repeated-question identity.
Run from HsH checkout: python WORKSPACES/ORSON_VAY/CODE/2026_10_28_repeated_prompt_replay.py /path/to/ConsistencyBench
No model calls. Original Git blobs and archived answer labels only. This is NOT a causal experiment.
"""
import collections
import hashlib
import json
import re
import sys
from pathlib import Path

SAMPLE_SHA = "10eb2da27c84c706d8e9e2325afca864fcae6a0d"
FULL_SHA = "3171d2899fd1eb4292794df5952514666b0e2f43"

def read_pinned(path, expected):
    raw = path.read_bytes()
    actual = hashlib.sha1(b"blob " + str(len(raw)).encode() + bytes([0]) + raw).hexdigest()
    if actual != expected:
        raise AssertionError((str(path), "git blob mismatch", actual, expected))
    return json.loads(raw)

def question_counts(sets):
    return collections.Counter(q["question"] for s in sets for q in s["questions"])

def repeat_stats(sets):
    bycat = collections.defaultdict(list)
    for s in sets:
        bycat[s["category"]].append(s)
    summary = {}
    for cat, ss in sorted(bycat.items()):
        counts = question_counts(ss)
        premises = {s["premise"] for s in ss}
        summary[cat] = {
            "sets": len(ss), "unique_premises": len(premises),
            "question_positions": sum(counts.values()),
            "unique_question_texts": len(counts),
            "excess_positions": sum(counts.values()) - len(counts),
            "repeated_text_groups": sum(n > 1 for n in counts.values()),
            "positions_in_repeated_groups": sum(n for n in counts.values() if n > 1),
        }
    return summary

def main(root):
    sample = read_pinned(root / "data/consistency_bench_sample.json", SAMPLE_SHA)
    full = read_pinned(root / "data/consistency_bench.json", FULL_SHA)
    assert len(sample["sets"]) == 300 and len(full["sets"]) == 493
    full_by_id = {s["id"]: s for s in full["sets"]}
    assert all(full_by_id.get(s["id"]) == s for s in sample["sets"])
    expected_questions = question_counts(sample["sets"])
    assert len(expected_questions) == 977 and sum(expected_questions.values()) == 1150
    sample_stats, full_stats = repeat_stats(sample["sets"]), repeat_stats(full["sets"])
    assert sample_stats["negation"]["excess_positions"] == 93
    assert sample_stats["syllogistic"]["excess_positions"] == 80
    assert sum(s["excess_positions"] for s in sample_stats.values()) == 173
    assert sum(s["excess_positions"] for s in full_stats.values()) == 366

    prior_script = Path(__file__).with_name("2026_10_28_conjunction_null_replay.py").read_text()
    manifest_text = prior_script.split('MANIFEST = """', 1)[1].split('"""', 1)[0]
    if not manifest_text:
        raise AssertionError("source-pinned 35-file manifest missing")
    rows = []
    for line in manifest_text.strip().splitlines():
        model, vanilla, cgd = line.strip().split()
        rows.append((model, "vanilla", vanilla))
        if cgd != "-":
            rows.append((model, "cgd", cgd))
    assert len(rows) == 35

    result = {}
    for model, strategy, sha in rows:
        data = read_pinned(root / "results" / (model + "_" + strategy + ".json"), sha)
        answers = collections.defaultdict(list)
        observed_questions = collections.Counter()
        for s in data["results"]:
            for q in s["evaluation"]["results"]:
                observed_questions[q["question"]] += 1
                answers[q["question"]].append(q["extracted_answer"])
        assert observed_questions == expected_questions, (model, strategy, "question corpus mismatch")
        repeated = [v for v in answers.values() if len(v) > 1]
        result[(model, strategy)] = sum(len(set(v)) > 1 for v in repeated)
        assert len(repeated) == 81
    pairs = [model for model, strategy, _ in rows if strategy == "cgd"]
    assert len(pairs) == 17
    vanilla = sum(result[(model, "vanilla")] for model in pairs)
    cgd = sum(result[(model, "cgd")] for model in pairs)
    increases = sum(result[(model, "cgd")] > result[(model, "vanilla")] for model in pairs)
    decreases = sum(result[(model, "cgd")] < result[(model, "vanilla")] for model in pairs)
    assert (vanilla, cgd, increases, decreases) == (151, 261, 13, 4)
    print(json.dumps({
        "full_source": full_stats, "sample_source": sample_stats,
        "sample_unique_question_texts": len(expected_questions),
        "sample_question_positions": sum(expected_questions.values()),
        "sample_repeated_text_groups": sum(n > 1 for n in expected_questions.values()),
        "files_replayed": len(rows), "paired_model_labels": len(pairs),
        "discordant_repeated_text_groups_vanilla": vanilla,
        "discordant_repeated_text_groups_cgd": cgd,
        "paired_labels_increase": increases, "paired_labels_decrease": decreases,
        "per_file": [{"model":m,"strategy":s,"discordant_groups":result[(m,s)]}
                     for m,s,_ in rows],
        "status": "PASS_SOURCE_PINNED_REPLAY",
        "interpretation": "archived extracted-answer label variation, NOT semantic contradiction or causal CGD effect"
    }, indent=2))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: script.py /path/to/ConsistencyBench")
    main(Path(sys.argv[1]))
