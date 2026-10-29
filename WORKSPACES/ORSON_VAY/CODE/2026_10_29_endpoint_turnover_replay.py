#!/usr/bin/env python3
"""Orson P1: source-locked CGD pair-agreement turnover by changed endpoints.

Run: python 2026_10_29_endpoint_turnover_replay.py /path/to/ConsistencyBench
The 17 original source blobs were independently analyzed in connected JS twice
on 2026-10-29 23:48 UTC. This Python port requires a local original checkout;
its existence alone is NOT a claim of local full-corpus execution.
"""
import hashlib
import json
import sys
from collections import Counter
from itertools import combinations
from pathlib import Path

MANIFEST = """
gpt-4o 3f94994e131e25bf9bf52f43867fbe6b229756b1
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
qwen-2.5-72b 38393e09d44de963d109b00f66a1378f5b431720
""".strip().splitlines()
LABELS = {"Yes", "No", "Cannot be determined"}
EXPECTED = [
    {"pairs": 116933, "up": 0, "down": 0},
    {"pairs": 18465, "up": 8719, "down": 8684},
    {"pairs": 2513, "up": 197, "down": 148},
]


def source_rows(root):
    models = []
    for line in MANIFEST:
        name, expected_sha = line.split()
        raw = (root / "results" / (name + "_cgd.json")).read_bytes()
        digest = hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\\0" + raw).hexdigest()
        assert digest == expected_sha, (name, digest, expected_sha)
        obj = json.loads(raw)
        assert obj["model"] == name and len(obj["results"]) == 300
        rows = []
        for s in obj["results"]:
            for j, q in enumerate(s["evaluation"]["results"]):
                rows.append((s["set_id"], j, q["question"], q["initial_answer"], q["extracted_answer"]))
        assert len(rows) == 1150
        models.append(rows)
    return models


def direct_pair_enumeration(models):
    out = [dict(pairs=0, up=0, down=0) for _ in range(3)]
    for i in range(1150):
        rs = [m[i] for m in models]
        assert all(r[:3] == rs[0][:3] for r in rs)
        for x, y in combinations(rs, 2):
            a, b = x[3:5], y[3:5]
            if not set(a + b) <= LABELS:
                continue
            changed = (a[0] != a[1]) + (b[0] != b[1])
            from_match = a[0] == b[0]
            to_match = a[1] == b[1]
            out[changed]["pairs"] += 1
            out[changed]["up"] += int(not from_match and to_match)
            out[changed]["down"] += int(from_match and not to_match)
    return out


def choose2(n):
    return n * (n - 1) // 2


def combinatorial_reconstruction(models):
    out = [dict(pairs=0, up=0, down=0) for _ in range(3)]
    for i in range(1150):
        rows = [m[i] for m in models if set(m[i][3:5]) <= LABELS]
        unchanged = [r for r in rows if r[3] == r[4]]
        changed = [r for r in rows if r[3] != r[4]]
        out[0]["pairs"] += choose2(len(unchanged))
        out[1]["pairs"] += len(unchanged) * len(changed)
        out[2]["pairs"] += choose2(len(changed))
        u = Counter(r[3] for r in unchanged)
        ca = Counter(r[3] for r in changed)
        cb = Counter(r[4] for r in changed)
        joint = Counter((r[3], r[4]) for r in changed)
        out[1]["down"] += sum(n * u[k] for k, n in ca.items())
        out[1]["up"] += sum(n * u[k] for k, n in cb.items())
        both = sum(choose2(n) for n in joint.values())
        out[2]["down"] += sum(choose2(n) for n in ca.values()) - both
        out[2]["up"] += sum(choose2(n) for n in cb.values()) - both
    return out


def main(root):
    models = source_rows(root)
    first = direct_pair_enumeration(models)
    second = combinatorial_reconstruction(models)
    assert first == second == EXPECTED, (first, second)
    print(json.dumps({"status": "PASS", "model_count": len(models),
                      "positions": 1150, "by_changed_endpoints": first,
                      "gross_turnover": sum(d["up"] + d["down"] for d in first)},
                     indent=2))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("Usage: script.py /path/to/ConsistencyBench")
    main(Path(sys.argv[1]))
