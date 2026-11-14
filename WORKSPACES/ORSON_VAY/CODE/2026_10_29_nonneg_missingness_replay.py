#!/usr/bin/env python3
"""Replay source-conditional CGD missing-response bounds from 17 ORIGINAL
public ConsistencyBench JSON files, with Git blob SHA validation.

Run: python WORKSPACES/ORSON_VAY/CODE/2026_10_29_nonneg_missingness_replay.py /path/to/ConsistencyBench

No model calls, synthetic inputs, or physical calculations. This portable
Python mode was NOT executed on a local original checkout in the scheduled
2026-10-29 01Z run. The original JSONs were separately fetched and parsed
through the connected GitHub interface using JavaScript.
"""
import json
import sys
from pathlib import Path
from runpy import run_path

def analyze(root: Path):
    prior = run_path(str(Path(__file__).with_name("2026_10_28_cgd_revision_balance_replay.py")))
    manifest = [row.split() for row in prior["MANIFEST"].splitlines()]
    norm = prior["norm"]
    git_blob_sha = prior["git_blob_sha"]
    summary = {"n":0,"scored_net":0,"complete_n":0,"complete_net":0,
               "initial_only_missing":0,"known_final_correct":0,
               "final_only_missing":0,"known_initial_correct":0,
               "both_missing":0}
    per_model = {}
    def missing(raw):
        return not str(raw or "").strip() or str(raw).strip() == "[ERROR]"
    for model,sha in manifest:
        path = root/"results"/f"{model}_cgd.json"
        raw = path.read_bytes()
        assert git_blob_sha(raw) == sha, (model,"blob SHA mismatch")
        obj = json.loads(raw)
        assert len(obj["results"]) == 300
        x = {key:0 for key in summary}
        for item in obj["results"]:
            if item["category"] == "negation":
                continue
            for answer in item["evaluation"]["results"]:
                key = norm(answer["expected"])
                initial = int(norm(answer["initial_answer"]) == key)
                final = int(norm(answer["extracted_answer"]) == key)
                im = missing(answer.get("initial_response"))
                final_raw = answer.get("revision_response")
                if final_raw is None:
                    final_raw = answer.get("initial_response")
                fm = missing(final_raw)
                x["n"] += 1
                x["scored_net"] += final-initial
                if not im and not fm:
                    x["complete_n"] += 1
                    x["complete_net"] += final-initial
                elif im and fm:
                    x["both_missing"] += 1
                elif im:
                    x["initial_only_missing"] += 1
                    x["known_final_correct"] += final
                else:
                    x["final_only_missing"] += 1
                    x["known_initial_correct"] += initial
        assert x["n"] == 950, (model,x["n"])
        per_model[model] = {"sha":sha,**x}
        for key in summary:
            summary[key] += x[key]
    assert len(per_model) == 17
    assert summary == {
        "n":16150,"scored_net":664,"complete_n":15696,
        "complete_net":721,"initial_only_missing":8,
        "known_final_correct":2,"final_only_missing":159,
        "known_initial_correct":59,"both_missing":287
    }, summary
    base = summary["complete_net"]+summary["known_final_correct"]-summary["known_initial_correct"]
    lower = base-summary["initial_only_missing"]-summary["both_missing"]
    upper = base+summary["final_only_missing"]+summary["both_missing"]
    assert (base,lower,upper) == (664,369,1110)
    return {"status":"SOURCE_LOCKED_17_CGD_NONNEG_PASS",
            "summary":summary,"missing_response_bounds":[lower,upper],
            "per_model":per_model}

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: replay.py /path/to/ConsistencyBench")
    print(json.dumps(analyze(Path(sys.argv[1])),indent=2,sort_keys=True))
