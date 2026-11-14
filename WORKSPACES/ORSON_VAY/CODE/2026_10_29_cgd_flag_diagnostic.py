#!/usr/bin/env python3
"""Orson P1: source-key proxy diagnostic of recorded ConsistencyBench CGD flags.

Usage: python 2026_10_29_cgd_flag_diagnostic.py /path/to/ConsistencyBench
Uses the EXISTING Orson source-locked manifest and normalization routine.
No new model calls, invented fixtures, or claim of semantic NLI adjudication.
GitHub-connected JavaScript actually executed the 17-file analysis in the
2026-10-29 16:12 UTC relay. This portable Python replayer is a distinct,
not-yet-executed implementation unless its own log is supplied.
"""
from pathlib import Path
import json
import runpy
import sys

HERE = Path(__file__).resolve().parent
prior = runpy.run_path(str(HERE / "2026_10_28_cgd_revision_balance_replay.py"))
norm = prior["norm"]
git_blob_sha = prior["git_blob_sha"]
MANIFEST = [line.split() for line in prior["MANIFEST"].splitlines()]

def blank():
    return {"n":0,"tp":0,"fp":0,"fn":0,"tn":0,"flag":0,"wrong":0}

def add(dst, row):
    for k in dst:
        dst[k] += row[k]

def run(root):
    total, eligible, categories, models = blank(), blank(), {}, {}
    for model, sha in MANIFEST:
        path = root / "results" / (model + "_cgd.json")
        raw = path.read_bytes()
        assert git_blob_sha(raw) == sha, ("blob SHA mismatch", model)
        obj = json.loads(raw)
        assert len(obj["results"]) == 300
        m = blank()
        final_correct = 0
        for item in obj["results"]:
            cat = categories.setdefault(item["category"], blank())
            for j, answer in enumerate(item["evaluation"]["results"]):
                flag = bool(answer["contradiction_detected"])
                wrong = norm(answer["initial_answer"]) != norm(answer["expected"])
                final_correct += norm(answer["extracted_answer"]) == norm(answer["expected"])
                row = blank()
                row["n"] = 1
                row["flag"] = int(flag)
                row["wrong"] = int(wrong)
                row[("tp" if wrong else "fp") if flag else ("fn" if wrong else "tn")] = 1
                add(m,row); add(cat,row); add(total,row)
                if j > 0:
                    add(eligible,row)
                else:
                    assert not flag
        assert final_correct == obj["metrics"]["individual_correct"], model
        assert m["n"] == 1150
        models[model] = m
    assert len(models) == 17
    assert total == {"n":19550,"tp":3093,"fp":3609,"fn":3890,"tn":8958,"flag":6702,"wrong":6983}
    assert eligible == {"n":14450,"tp":3093,"fp":3609,"fn":2871,"tn":4877,"flag":6702,"wrong":5964}
    print(json.dumps({"status":"PASS_SOURCE_LOCKED","all":total,"eligible":eligible,
                      "categories":categories,"models":models},indent=2,sort_keys=True))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: script.py /path/to/ConsistencyBench")
    run(Path(sys.argv[1]))
