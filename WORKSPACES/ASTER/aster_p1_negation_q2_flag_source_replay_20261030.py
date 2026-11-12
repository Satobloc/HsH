#!/usr/bin/env python3
"""Source-locked Aster P1 negation-Q2 flag/key provenance audit.

Usage: python aster_p1_negation_q2_flag_source_replay_20261030.py /path/to/ConsistencyBench
No model API calls. Read immutable original 17 CGD JSON blobs from the public
aayambansal/ConsistencyBench repository. This reproduces recorded *source-key*
agreement and flags, NOT independently adjudicated semantic contradiction.
"""
import hashlib
import json
import re
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

def git_blob_sha(data: bytes) -> str:
    return hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()

def main(root: Path) -> None:
    counts = {k: 0 for k in ("files", "sets", "negation_q2", "both_key_correct",
                            "q2_flags", "both_key_correct_flagged",
                            "both_key_correct_unflagged", "minimal_pair_flagged")}
    minimal_premises = set()
    by_model = {}
    for line in MANIFEST.splitlines():
        model, expected_sha = line.split()
        raw = (root / "results" / (model + "_cgd.json")).read_bytes()
        assert git_blob_sha(raw) == expected_sha, (model, "blob SHA mismatch")
        data = json.loads(raw)
        assert len(data["results"]) == 300, model
        counts["files"] += 1
        counts["sets"] += 300
        local = dict.fromkeys(("both", "flag", "both_flag", "minimal_flag"), 0)
        for record in data["results"]:
            if record["category"] != "negation":
                continue
            a, b = record["evaluation"]["results"][:2]
            counts["negation_q2"] += 1
            both = a["initial_answer"] == a["expected"] and b["initial_answer"] == b["expected"]
            flag = b["contradiction_detected"] is True
            if flag:
                counts["q2_flags"] += 1
                local["flag"] += 1
            if both:
                counts["both_key_correct"] += 1
                local["both"] += 1
                if flag:
                    counts["both_key_correct_flagged"] += 1
                    local["both_flag"] += 1
                else:
                    counts["both_key_correct_unflagged"] += 1
            bare = all(re.fullmatch(r"(yes|no)[.!]?\s*", r["initial_response"].strip(), re.I)
                       for r in (a, b))
            if both and flag and bare:
                counts["minimal_pair_flagged"] += 1
                local["minimal_flag"] += 1
                minimal_premises.add(record["premise"])
        by_model[model] = local
    counts["distinct_minimal_premises"] = len(minimal_premises)
    assert counts == {
        "files": 17, "sets": 5100, "negation_q2": 850,
        "both_key_correct": 593, "q2_flags": 159,
        "both_key_correct_flagged": 116,
        "both_key_correct_unflagged": 477,
        "minimal_pair_flagged": 7, "distinct_minimal_premises": 4
    }, counts
    print(json.dumps({"status": "PASS_SOURCE_LOCKED_17_CGD_NEGATION_Q2",
                      "aggregate": counts, "models": by_model,
                      "minimal_premises": sorted(minimal_premises)}, indent=2))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: script.py /path/to/ConsistencyBench")
    main(Path(sys.argv[1]))
