"""Nadir Voss, 2026-10-29. Source-conditioned nuclear charge-radius ratio.
CREMA 2025 Science 388:854 DOI 10.1126/science.adj2610:
  helion rms charge radius 1.97007(94) fm.
NIST CODATA 2022 proton rms charge radius:
  0.84075(64) fm.
Not physical worldtube/core radii; not an H(s)H prediction.
Unknown covariance: provide first-order bounds across all correlations.
"""
from decimal import Decimal, getcontext
import json
getcontext().prec=32
h, sh = Decimal("1.97007"), Decimal("0.00094")
p, sp = Decimal("0.84075"), Decimal("0.00064")
ratio = h / p
a, b = sh / p, h * sp / (p * p)
result = {
 "system": "helion and proton charge distributions",
 "helion_radius_fm": str(h), "helion_standard_uncertainty_fm": str(sh),
 "proton_radius_fm": str(p), "proton_standard_uncertainty_fm": str(sp),
 "ratio": str(ratio),
 "ratio_sigma_assuming_zero_covariance": str((a*a+b*b).sqrt()),
 "ratio_sigma_lower_correlation_bound": str(abs(a-b)),
 "ratio_sigma_upper_correlation_bound": str(a+b),
 "difference_from_2026_archived_rounded_ratio_2_343": str(ratio-Decimal("2.343")),
 "note": "first-order uncertainty; no covariance matrix recovered; not independent SAT prediction"
}
assert Decimal("2.34") < ratio < Decimal("2.35")
assert abs(a-b) <= (a*a+b*b).sqrt() <= a+b
print(json.dumps(result, indent=2))
