#!/usr/bin/env python3
"""Source-locked replay: visibility of raw answers to the 500-character NLI gate.

Usage: python 2026_10_29_cgd_nli_500_visibility_replay.py /path/to/ConsistencyBench
Only reads genuine archived results/*_cgd.json. Does not call models,
reconstruct missing NLI responses, generate fixtures or claim causality.
The published evaluator compares raw[:500] (Python Unicode code points).
"""
from __future__ import annotations
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

FIELDS = ("answers", "raw_long", "eligible", "eligible_exposed",
          "flags", "flags_exposed", "candidate_pairs", "pairs_exposed",
          "fourth_flags", "fourth_flags_exposed")


def empty():
    return {field: 0 for field in FIELDS}


def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\\0" + data).hexdigest()


def analyze(path: Path, expected_sha: str):
    raw = path.read_bytes()
    assert git_blob_sha(raw) == expected_sha, f"Git blob mismatch: {path}"
    doc = json.loads(raw)
    assert len(doc["results"]) == 300
    out = empty()
    for item in doc["results"]:
        answers = item["evaluation"]["results"]
        lens = [len(a["initial_response"]) for a in answers]
        for j, a in enumerate(answers):
            is_long = lens[j] > 500
            prior_long = any(x > 500 for x in lens[:j])
            exposed = is_long or prior_long
            flagged = bool(a["contradiction_detected"])
            out["answers"] += 1
            out["raw_long"] += is_long
            if j > 0:
                out["eligible"] += 1
                out["eligible_exposed"] += exposed
                out["flags"] += flagged
                out["flags_exposed"] += flagged and exposed
            for k in range(j):
                out["candidate_pairs"] += 1
                out["pairs_exposed"] += is_long or lens[k] > 500
            if item["category"] == "modus_tollens" and j == 3:
                out["fourth_flags"] += flagged
                out["fourth_flags_exposed"] += flagged and exposed
    assert out["answers"] == 1150
    return out


def main(root: Path):
    total = empty()
    by_model = {}
    for line in MANIFEST.splitlines():
        model, sha = line.split()
        row = analyze(root / "results" / (model + "_cgd.json"), sha)
        by_model[model] = {"blob_sha": sha, **row}
        for k in FIELDS:
            total[k] += row[k]
    expected = {
        "answers": 19550, "raw_long": 1216,
        "eligible": 14450, "eligible_exposed": 1744,
        "flags": 6702, "flags_exposed": 1060,
        "candidate_pairs": 28050, "pairs_exposed": 3123,
        "fourth_flags": 849, "fourth_flags_exposed": 188,
    }
    assert total == expected, (total, expected)
    print(json.dumps({"status": "PASS_IF_EXECUTED_ON_LOCKED_SOURCE",
                      "total": total, "models": by_model}, indent=2, sort_keys=True))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: script.py /path/to/ConsistencyBench")
    main(Path(sys.argv[1]))
