#!/usr/bin/env python3
"""GW170814 published-log-base source calibration, CORRECTED.

Actual GW170814, 2017-08-14T10:30:43Z, LIGO Hanford/Livingston/Virgo.
LIGO/Virgo 2017 PRL 119 141101 Sec VII: B_TV >200 and B_TS >1000.
Takeda/Morisaki/Nishizawa 2021 PRD 103 064037: printed 2.775/3.636,
earlier LVC values 1.48/2.34 (secondary attribution).

CRITICAL SOURCE DISCREPANCY: Takeda Sec VI.A typesets 'ln B' yet its
Figures 7-8 plot Bayes factors at roughly 10^2.775 and 10^3.636, not
exp(2.775) and exp(3.636). We compute BOTH bases, LABEL CONDITIONAL,
and do not choose a source-independent BF. Earlier report issue #1020
incorrectly treated the printed values as natural logarithms; the
corrective publication is the authoritative numerical interpretation.

These are published rounded model inferences, not direct strain data
or a SAT prediction. Uncertainty of printed BF estimates not provided.
"""
import json
import math

data = {
    "event": "GW170814",
    "time_utc": "2017-08-14T10:30:43Z",
    "detectors": ["LIGO Hanford", "LIGO Livingston", "Virgo"],
    "unit": "dimensionless",
    "lvc2017_direct_BF_strict_lower": {"TV": 200, "TS": 1000},
    "takeda2021_printed_log": {"TV": 2.775, "TS": 3.636},
    "takeda2021_secondary_earlier_printed_log": {"TV": 1.48, "TS": 2.34},
    "log_base_status": "UNRESOLVED: text says ln; Figures 7-8 align with base10",
    "uncertainty": "not reported for the printed model-evidence values",
}
out = {"source": data, "conditional": {}}
for mode in ("TV", "TS"):
    x = data["takeda2021_printed_log"][mode]
    y = data["takeda2021_secondary_earlier_printed_log"][mode]
    lower = data["lvc2017_direct_BF_strict_lower"][mode]
    out["conditional"][mode] = {
        "if_natural_log": {
            "takeda_BF": math.exp(x),
            "earlier_secondary_BF": math.exp(y),
            "ratio_takeda_over_earlier": math.exp(x-y),
            "lvc2017_lower_over_takeda": lower/math.exp(x),
        },
        "if_base10_log": {
            "takeda_BF": 10**x,
            "earlier_secondary_BF": 10**y,
            "ratio_takeda_over_earlier": 10**(x-y),
            "lvc2017_lower_over_takeda": lower/(10**x),
        },
        "printed_log_difference": x-y,
    }
    assert 10**x > 10**y
    assert math.exp(x) > math.exp(y)
print(json.dumps(out, sort_keys=True, indent=2))
