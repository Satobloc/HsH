#!/usr/bin/env python3
"""Source-indexed arithmetic on published GW170814 model-selection results.

Real event: GW170814, 2017-08-14 10:30:43 UTC, LIGO Hanford/Livingston/Virgo.
Original LIGO/Virgo (2017), PRL 119 141101, Sec VII: B_TV>200, B_TS>1000.
Takeda/Morisaki/Nishizawa (2021), PRD 103 064037, Sec VI.A:
ln B_TV=2.775, ln B_TS=3.636. Takeda Introduction additionally reports
earlier LVC ln B_TV=1.48 and ln B_TS=2.34; attribution to the 2017
paper remains under audit because its original bounds differ.

All values are published rounded inferences, not raw strain or SAT predictions.
Bayes factors depend on hypotheses, priors, waveform and likelihood versions.
"""
import json
import math

event = "GW170814"
event_time_utc = "2017-08-14T10:30:43Z"
inputs = {
    "tensor_over_vector": {"lvc_2017_bf_strict_lower": 200,
                           "takeda_2021_ln_bf": 2.775,
                           "takeda_cited_earlier_ln_bf": 1.48},
    "tensor_over_scalar": {"lvc_2017_bf_strict_lower": 1000,
                           "takeda_2021_ln_bf": 3.636,
                           "takeda_cited_earlier_ln_bf": 2.34},
}
out = {"event": event, "event_time_utc": event_time_utc,
       "units": "dimensionless", "uncertainty": "not supplied for printed ln BF",
       "inputs": inputs, "derived": {}}
for mode, item in inputs.items():
    a, b, lower = (item["takeda_2021_ln_bf"],
                   item["takeda_cited_earlier_ln_bf"],
                   item["lvc_2017_bf_strict_lower"])
    assert a > b and math.log(lower) > a
    out["derived"][mode] = {
        "takeda_bf": math.exp(a),
        "earlier_secondary_bf": math.exp(b),
        "takeda_to_earlier_secondary_ratio": math.exp(a-b),
        "lvc_2017_log_bf_strict_lower": math.log(lower),
        "lvc_2017_to_takeda_bf_strict_lower": lower/math.exp(a),
        "log_bf_difference": a-b,
    }
print(json.dumps(out, indent=2, sort_keys=True))
