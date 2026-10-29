#!/usr/bin/env python3
"""Kestrel: finite-corpus information carried by recorded CGD flags.

Observed counts are from Orson's 2026-10-29 16:12Z source-locked audit of
17 original aayambansal/ConsistencyBench CGD model-output files.
This is a secondary calculation on an observed aggregate, NOT an
independent 17-file replay, semantic checker validation, or causal study.
Source: Satobloc/HsH/WORKSPACES/ORSON_VAY/
2026-10-29_1612Z_P1_FLAG_DIAGNOSTIC_SOURCE_AUDIT.md
Git blob daf8e8ec4882b281f2e951b8fae71aaf4ca073c6.

Rows: flag yes/no. Columns: initial answer wrong/right versus published key.
First-position records (n=5100) are excluded because no earlier response
exists to compare, so they are structurally ineligible for flagging.
"""
from __future__ import annotations
import json
import math

A, B, C, D = 3093, 3609, 2871, 4877
N = A + B + C + D
assert N == 14450
assert A + B == 6702 and C + D == 7748
assert A + C == 5964 and B + D == 8486
assert N + 5100 == 19550

rows = (A + B, C + D)
cols = (A + C, B + D)
cells = ((A, B), (C, D))
mutual_information_bits = sum(
    x / N * math.log2(x * N / (rows[i] * cols[j]))
    for i, row in enumerate(cells)
    for j, x in enumerate(row)
    if x
)
p = cols[0] / N
source_key_error_entropy_bits = -p * math.log2(p) - (1-p) * math.log2(1-p)
flagged_error_rate = A / rows[0]
unflagged_error_rate = C / rows[1]
result = {
    "status": "SECONDARY_CALCULATION_ON_REAL_RECORDED_COUNTS",
    "n_eligible": N,
    "n_structurally_ineligible": 5100,
    "flagged_error_rate": flagged_error_rate,
    "unflagged_error_rate": unflagged_error_rate,
    "error_rate_difference_percentage_points": 100*(flagged_error_rate-unflagged_error_rate),
    "risk_ratio": flagged_error_rate/unflagged_error_rate,
    "odds_ratio": (A*D)/(B*C),
    "mutual_information_bits": mutual_information_bits,
    "source_key_error_entropy_bits": source_key_error_entropy_bits,
    "fraction_source_key_error_entropy_explained": mutual_information_bits/source_key_error_entropy_bits,
    "cramers_phi": (A*D-B*C)/math.sqrt(rows[0]*rows[1]*cols[0]*cols[1]),
    "uncertainty": "descriptive finite corpus only; clustered/repeated rows, no IID CI",
    "meaning": "published-key disagreement, not semantic contradiction detection",
}
print(json.dumps(result, sort_keys=True, indent=2))
