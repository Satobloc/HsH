#!/usr/bin/env python3
"""Source-locked GW170814 published model-selection statistic conversion.
Real observed event: LIGO/Virgo GW170814, 2017-08-14 10:30:43 UTC.
Published model-based inference: Takeda, Morisaki, Nishizawa (2021),
Phys. Rev. D 103, 064037, DOI 10.1103/PhysRevD.103.064037.
No invented physical inputs, no raw strain analysis, no HsH prediction.
"""
import math
import json

log_bf = {
    "tensor_over_pure_vector": 2.775,
    "tensor_over_pure_scalar": 3.636,
}
result = {
    "event": "GW170814",
    "source": "https://doi.org/10.1103/PhysRevD.103.064037",
    "input_kind": "published_natural_log_bayes_factor",
    "log_bayes_factors": log_bf,
    "bayes_factors": {k: math.exp(v) for k, v in log_bf.items()},
    "uncertainty": "not supplied for these rounded abstract statistics",
    "interpretation": "published pure-polarization model comparison, prior/waveform dependent; not a raw-data fit, SAT prediction, or HsH validation",
}
for key, value in log_bf.items():
    assert math.isclose(math.log(result["bayes_factors"][key]), value, abs_tol=1e-14)
print(json.dumps(result, indent=2))
