#!/usr/bin/env python3
"""Read-only real-source regression: Math Hopper's line-candidate coverage.

No synthetic source fixture, mathematical validation, physical computation,
or publication of extracted archive text. Prints aggregate metadata only.
"""
from __future__ import annotations
import hashlib
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from mersearch_math_structural import extract_math  # noqa: E402

SOURCE = ROOT / "DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 2/SAT MATH — BACKBONE.txt"
EXPECTED_BLOB = "1854995be3311f565739f2be64269cbb0385a82f"
FORMULA_TOKEN = re.compile(r"(?:=|≈|\\frac|\\sqrt|√|\^)")


def main() -> int:
    raw = SOURCE.read_bytes()
    blob = hashlib.sha1(b"blob " + str(len(raw)).encode() + b"\0" + raw).hexdigest()
    if blob != EXPECTED_BLOB:
        raise RuntimeError(f"Source changed: {blob}; pinned {EXPECTED_BLOB}")
    text = raw.decode("utf-8-sig")
    spans = extract_math(text)
    candidates = []
    offset = 0
    for number, segment in enumerate(text.splitlines(keepends=True), 1):
        line = segment.rstrip("\r\n")
        end = offset + len(line)
        if FORMULA_TOKEN.search(line):
            overlap = any(start < end and stop > offset for start, stop, _ in spans)
            candidates.append({
                "line": number, "length": len(line),
                "captured": overlap, "over405": len(line) > 405,
            })
        offset += len(segment)
    unspanned = [r for r in candidates if not r["captured"]]
    long = [r for r in candidates if r["over405"]]
    summary = {
        "source_git_blob": blob,
        "source_lines": len(text.splitlines()),
        "heuristic_formula_token_lines": len(candidates),
        "extract_math_spans": len(spans),
        "formula_token_lines_without_span": len(unspanned),
        "formula_token_lines_over_405": len(long),
        "over_405_without_span": sum(not r["captured"] for r in long),
        "no_span_short_or_equal_405": sum(r["length"] <= 405 for r in unspanned),
        "over405_example_line_numbers": [r["line"] for r in long[:12]],
        "interpretation": "Token-line heuristic, NOT count of true equations or validated math.",
    }
    print(json.dumps(summary, indent=2, sort_keys=True))
    assert summary["formula_token_lines_over_405"] > 0
    assert summary["over_405_without_span"] == summary["formula_token_lines_over_405"]
    assert summary["formula_token_lines_without_span"] > 0
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
