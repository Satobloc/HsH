#!/usr/bin/env python3
"""Source-locked 17-model CGD within-file revision balance (Orson P1).

Run: python 2026_10_28_cgd_revision_balance_replay.py /path/to/ConsistencyBench
Reads original public results JSONs. NO model calls, no synthetic answers.
The two score definitions are published-key and disputed-negation-Q3-rekey.
Do not interpret scorer-relative repair as adjudicated semantic improvement.
Actual original JSONs were parsed in GitHub connector JavaScript; this
portable Python replay is preserved for independent execution.
"""
from __future__ import annotations
import collections
import hashlib
import json
import sys
from pathlib import Path

MANIFEST = """gpt-4o 3f94994e131e25bf9bf52f43867fbe6b229756b1
gpt-4.1 9ab86f214197d1c60279807850a07d9da75344b8
gemini-2.5-pro 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4
claude-opus-4.6 c9f6e92cc21a30497b2264e17e0b59a3a843b710
claude-3.5-sonnet 5e486f26e16bcd3d9994670ef3c85ad79a8d82bf
claude-sonnet-4.5 d259dfa14fcb901323191fd99dc06be0feebc0ac
claude-sonnet-4.6 a5b440f9d5e9e8b8294d68938d3fb667a83e6a75
deepseek-v3.2 5dd5ec233d563acdc385f56270b2868c2a439d09
gemini-2.0-flash 3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729
gemini-2.5-flash abf7a0b99c54ff8155700e80e283d1d7081f09f6
gpt-5-mini aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b
gpt-5.2 acf59928c7d754c78a93f648c76c6497fc7e5b11
gpt-5 25bb4f61e2454467626592396f20384c9858cb6b
llama-3.1-70b b7b9db7ff20a502f25064df9b786507b4d58a6a3
llama-3.3-70b c3845de12a952cfe050f1fbab9e91f8ab10a6a36
o3 4f408b9d207d50b2bbbd31b1283f50798173e602
qwen-2.5-72b 38393e09d44de963d109b00f66a1378f5b431720"""

FIELDS = ("n", "flag", "change", "initial", "final", "repair", "regress",
          "wrong_wrong", "unchanged_flag", "corrected_initial", "corrected_final",
          "corrected_repair", "corrected_regress")

def blank():
    return {k: 0 for k in FIELDS}

def norm(value):
    s = str(value).strip().lower()
    if s.startswith("yes"):
        return "yes"
    if any(t in s for t in ("cannot be determined", "cannot conclude",
                            "not necessarily", "we cannot", "insufficient",
                            "cannot determine")):
        return "cannot_determine"
    if s.startswith("no"):
        return "no"
    if s == "unclear":
        return "unclear"
    return s

def add(dst, src):
    for k in FIELDS:
        dst[k] += src[k]

def git_blob_sha(raw):
    return hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\\0" + raw).hexdigest()

def analyze(path, expected_sha):
    raw = path.read_bytes()
    assert git_blob_sha(raw) == expected_sha, ("SHA mismatch", path)
    obj = json.loads(raw)
    counts, categories, positions = blank(), {}, {}
    all_sets_correct = 0
    assert len(obj["results"]) == 300
    for item in obj["results"]:
        all_correct = True
        answers = item["evaluation"]["results"]
        for j, answer in enumerate(answers):
            initial = norm(answer["initial_answer"])
            final = norm(answer["extracted_answer"])
            key = norm(answer["expected"])
            corrected = norm(answers[0]["expected"]) if (
                item["category"] == "negation" and j == 2) else key
            row = blank()
            row["n"] = 1
            row["flag"] = int(bool(answer["contradiction_detected"]))
            row["change"] = int(initial != final)
            row["initial"] = int(initial == key)
            row["final"] = int(final == key)
            row["repair"] = int(initial != key and final == key)
            row["regress"] = int(initial == key and final != key)
            row["wrong_wrong"] = int(initial != key and final != key and initial != final)
            row["unchanged_flag"] = int(row["flag"] and not row["change"])
            row["corrected_initial"] = int(initial == corrected)
            row["corrected_final"] = int(final == corrected)
            row["corrected_repair"] = int(initial != corrected and final == corrected)
            row["corrected_regress"] = int(initial == corrected and final != corrected)
            add(counts, row)
            add(categories.setdefault(item["category"], blank()), row)
            add(positions.setdefault(str(j), blank()), row)
            all_correct &= bool(row["final"])
        all_sets_correct += int(all_correct)
    assert counts["n"] == 1150
    assert counts["final"] == obj["metrics"]["individual_correct"]
    assert all_sets_correct == obj["metrics"]["set_consistent"]
    return counts, categories, positions

def main(root):
    aggregate, categories, positions, models = blank(), {}, {}, {}
    for line in MANIFEST.splitlines():
        model, sha = line.split()
        counts, cats, pos = analyze(root / "results" / (model + "_cgd.json"), sha)
        models[model] = {"sha": sha, **counts}
        add(aggregate, counts)
        for cat, row in cats.items():
            add(categories.setdefault(cat, blank()), row)
        for j, row in pos.items():
            add(positions.setdefault(j, blank()), row)
    assert len(models) == 17
    assert aggregate == {
        "n": 19550, "flag": 6702, "change": 2010, "initial": 12567,
        "final": 13221, "repair": 1158, "regress": 504, "wrong_wrong": 348,
        "unchanged_flag": 4692, "corrected_initial": 12674,
        "corrected_final": 13229, "corrected_repair": 1122,
        "corrected_regress": 567
    }, aggregate
    assert categories["negation"]["final"] - categories["negation"]["initial"] == -10
    assert categories["negation"]["corrected_final"] - categories["negation"]["corrected_initial"] == -109
    assert aggregate["final"] - aggregate["initial"] == aggregate["repair"] - aggregate["regress"]
    assert aggregate["corrected_final"] - aggregate["corrected_initial"] == aggregate["corrected_repair"] - aggregate["corrected_regress"]
    print(json.dumps({"status": "PASS_SOURCE_LOCKED_17_CGD",
                      "aggregate": aggregate, "categories": categories,
                      "positions": positions, "models": models},
                     indent=2, sort_keys=True))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: script.py /path/to/ConsistencyBench")
    main(Path(sys.argv[1]))
