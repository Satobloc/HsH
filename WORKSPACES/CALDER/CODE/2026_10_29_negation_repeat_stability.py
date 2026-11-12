#!/usr/bin/env python3
"""Source-locked within-CGD repeated-prompt label-discordance replay.

Usage:
    python WORKSPACES/CALDER/CODE/2026_10_29_negation_repeat_stability.py \
        /path/to/ConsistencyBench

Uses original public recorded outputs, no new model calls or synthetic data.
Shares the 17-model Git-blob manifest and verifier with Orson's existing replay.
An identical question text is NOT an independent experimental trial.
"""
from __future__ import annotations

import collections
import json
import runpy
import sys
from pathlib import Path

HERE = Path(__file__).resolve()
ORSON_REPLAY = (HERE.parents[2] / "ORSON_VAY" / "CODE"
                / "2026_10_28_cgd_revision_balance_replay.py")
ORSON = runpy.run_path(str(ORSON_REPLAY))
MANIFEST = ORSON["MANIFEST"]
GIT_SHA = ORSON["git_blob_sha"]
SAMPLE_SHA = "10eb2da27c84c706d8e9e2325afca864fcae6a0d"
FIELDS = ("repeated_groups", "initial", "final", "gained", "lost", "both")


def analyze_position(rows, pos):
    groups = collections.defaultdict(list)
    for row in rows:
        answer = row["evaluation"]["results"][pos]
        groups[answer["question"]].append(answer)
    repeated = [g for g in groups.values() if len(g) > 1]
    out = {k: 0 for k in FIELDS}
    out["repeated_groups"] = len(repeated)
    for group in repeated:
        before = len({q["initial_answer"] for q in group}) > 1
        after = len({q["extracted_answer"] for q in group}) > 1
        out["initial"] += int(before)
        out["final"] += int(after)
        out["gained"] += int(not before and after)
        out["lost"] += int(before and not after)
        out["both"] += int(before and after)
    assert out["final"] - out["initial"] == out["gained"] - out["lost"]
    assert out["initial"] == out["both"] + out["lost"]
    assert out["final"] == out["both"] + out["gained"]
    return {"unique_prompts": len(groups), **out}


def replay(root):
    sample_path = root / "data" / "consistency_bench_sample.json"
    sample_raw = sample_path.read_bytes()
    assert GIT_SHA(sample_raw) == SAMPLE_SHA, "Sample source blob SHA mismatch"
    sample = json.loads(sample_raw)
    negation = {s["id"]: s for s in sample["sets"]
                if s["category"] == "negation"}
    assert len(negation) == 50
    assert len({s["premise"] for s in negation.values()}) == 19
    models = {}
    aggregate = [{k: 0 for k in FIELDS} for _ in range(4)]
    for line in MANIFEST.splitlines():
        model, sha = line.split()
        path = root / "results" / (model + "_cgd.json")
        raw = path.read_bytes()
        assert GIT_SHA(raw) == sha, ("Result source blob SHA mismatch", model)
        obj = json.loads(raw)
        assert len(obj["results"]) == 300
        rows = [r for r in obj["results"] if r["category"] == "negation"]
        assert len(rows) == 50
        assert {r["set_id"] for r in rows} == set(negation)
        for row in rows:
            expected = negation[row["set_id"]]["questions"]
            observed = row["evaluation"]["results"]
            assert len(observed) == 4
            assert all(q["question"] == o["question"]
                       for q, o in zip(expected, observed))
        positions = [analyze_position(rows, i) for i in range(4)]
        assert all(x["unique_prompts"] == 19 and
                   x["repeated_groups"] == 14 for x in positions[:3])
        assert positions[3]["unique_prompts"] == 50
        assert positions[3]["repeated_groups"] == 0
        for i, stats in enumerate(positions):
            for key in FIELDS:
                aggregate[i][key] += stats[key]
        models[model] = {"source_sha": sha, "positions": positions}
    assert len(models) == 17
    assert [(s["repeated_groups"], s["initial"], s["final"],
             s["gained"], s["lost"], s["both"]) for s in aggregate] == [
                 (238, 22, 22, 0, 0, 22),
                 (238, 19, 29, 12, 2, 17),
                 (238, 45, 79, 46, 12, 33),
                 (0, 0, 0, 0, 0, 0)]
    return {"status": "PASS_SOURCE_LOCKED_RECORDED_OUTPUTS",
            "source_sample_sha": SAMPLE_SHA, "aggregate": aggregate,
            "models": models,
            "limits": "Source label discordance, not semantic correctness, "
                      "independent trials, causal CGD effect, or physics"}


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: replay.py /path/to/ConsistencyBench")
    print(json.dumps(replay(Path(sys.argv[1])), indent=2, sort_keys=True))
