#!/usr/bin/env python3
"""Read-only replay of Tern's 2026-10-28 P1 temperature-Q2 key sensitivity.

Usage: python WORKSPACES/TERN/CODE/2026_10_28_p1_temperature_rekey_sensitivity.py /path/to/ConsistencyBench

Requires a complete, unmodified checkout of aayambansal/ConsistencyBench.
Reuses Orson's source-pinned manifest and normalize() function, rather than
creating a second scoring definition. No API calls, synthetic model responses,
or physical calculations. The alternative key policy is UNADJUDICATED.
"""
from __future__ import annotations
import json
import runpy
import sys
from collections import Counter
from pathlib import Path

SAMPLE_SHA = "10eb2da27c84c706d8e9e2325afca864fcae6a0d"
EXPECTED_IDS = {"CB-65302", "CB-20328", "CB-70068", "CB-46048", "CB-80468"}

def main(root: Path) -> None:
    hsh = Path(__file__).resolve().parents[3]
    original = runpy.run_path(str(hsh / "WORKSPACES/ORSON_VAY/CODE/2026_10_28_conjunction_null_replay.py"))
    manifest = original["MANIFEST"]
    normalize = original["normalize"]
    blob_sha = original["source_blob"]
    raw_sample = (root / "data/consistency_bench_sample.json").read_bytes()
    assert blob_sha(raw_sample) == SAMPLE_SHA, "sample blob mismatch"
    sample = json.loads(raw_sample)
    suspects = {
        s["id"] for s in sample["sets"]
        if s["category"] == "contrapositive"
        and any("temperature is below 10°C" in q["question"] for q in s["questions"])
    }
    assert suspects == EXPECTED_IDS, suspects
    for s in sample["sets"]:
        if s["id"] in suspects:
            assert normalize(s["questions"][1]["expected_answer"]) == "yes"
            assert "above 30°C" in s["premise"]

    def score(model: str, method: str, sha: str):
        raw = (root / "results" / f"{model}_{method}.json").read_bytes()
        assert blob_sha(raw) == sha, (model, method, "blob mismatch")
        data = json.loads(raw)
        assert len(data["results"]) == 300
        counts = Counter()
        per_set = {}
        for item in data["results"]:
            q = item["evaluation"]["results"]
            flag = item["set_id"] in suspects
            all_original = all(normalize(x["extracted_answer"]) == normalize(x["expected"]) for x in q)
            all_corrected = all(
                normalize(x["extracted_answer"]) ==
                (normalize(q[0]["expected"]) if item["category"] == "negation" and j == 2
                 else normalize(x["expected"]))
                for j, x in enumerate(q)
            )
            rest = all(normalize(q[j]["extracted_answer"]) == normalize(q[j]["expected"])
                       for j in (0, 2, 3)) if flag else False
            q2 = normalize(q[1]["extracted_answer"]) if flag else None
            strict = (rest and q2 == "no") if flag else all_corrected
            permissive = (rest and q2 in ("no", "cannot_determine")) if flag else all_corrected
            counts["original"] += int(all_original)
            counts["negation_corrected"] += int(all_corrected)
            counts["strict"] += int(strict)
            counts["permissive"] += int(permissive)
            if flag:
                counts["flagged"] += 1
                counts["flagged_q2_" + ("no_or_unknown" if q2 in ("no", "cannot_determine")
                                        else "yes" if q2 == "yes" else "other")] += 1
                assert not all_original and not all_corrected
            per_set[item["set_id"]] = (int(all_corrected), flag)
        assert counts["flagged"] == 5
        assert counts["original"] == data["metrics"]["set_consistent"]
        return counts, per_set

    rows = []
    total = Counter()
    pair = Counter()
    for model, vanilla_sha, cgd_sha in (line.split() for line in manifest):
        if cgd_sha == "-":
            continue
        v, vm = score(model, "vanilla", vanilla_sha)
        c, cm = score(model, "cgd", cgd_sha)
        assert vm.keys() == cm.keys()
        for key, (v_pass, flagged) in vm.items():
            c_pass, other_flag = cm[key]
            assert flagged == other_flag
            if not flagged:
                pair[(v_pass, c_pass)] += 1
        for label in ("original", "negation_corrected", "strict", "permissive"):
            total["v_" + label] += v[label]
            total["c_" + label] += c[label]
        for label in ("flagged_q2_no_or_unknown", "flagged_q2_yes", "flagged_q2_other"):
            total["v_" + label] += v[label]
            total["c_" + label] += c[label]
        rows.append({
            "model": model,
            "vanilla": dict(v),
            "cgd": dict(c),
            "strict_recovered_v": v["strict"] - v["negation_corrected"],
            "strict_recovered_c": c["strict"] - c["negation_corrected"],
            "permissive_recovered_v": v["permissive"] - v["negation_corrected"],
            "permissive_recovered_c": c["permissive"] - c["negation_corrected"],
        })
    assert len(rows) == 17
    assert [total["c_" + x] - total["v_" + x]
            for x in ("original", "negation_corrected", "strict", "permissive")] == [339, 281, 279, 283]
    assert [total["v_" + x] for x in ("negation_corrected", "strict", "permissive")] == [933, 952, 956]
    assert [total["c_" + x] for x in ("negation_corrected", "strict", "permissive")] == [1214, 1231, 1239]
    assert (total["v_flagged_q2_yes"], total["c_flagged_q2_yes"]) == (0, 0)
    assert (total["v_flagged_q2_no_or_unknown"], total["c_flagged_q2_no_or_unknown"]) == (83, 80)
    assert pair == Counter({(1, 0): 226, (0, 1): 507, (1, 1): 707, (0, 0): 3575})
    print(json.dumps({"status": "PASS_IF_COMPLETE_PINNED_SOURCE_CHECKOUT",
                      "sample_sha": SAMPLE_SHA, "suspect_ids": sorted(suspects),
                      "matched_models": len(rows), "totals": dict(total),
                      "corrected_unflagged_pair_counts": {
                          "vanilla_only": pair[(1, 0)], "cgd_only": pair[(0, 1)],
                          "both": pair[(1, 1)], "neither": pair[(0, 0)]},
                      "rows": rows}, indent=2))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: script.py /path/to/ConsistencyBench")
    main(Path(sys.argv[1]))
