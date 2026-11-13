"""CONT17 published RMS comparison, source-conditional reproducibility.
Böhm et al. (2019), Advances in Geosciences 50, 9-15,
DOI: 10.5194/adgeo-50-9-2019, sections 3-4.
Published percentages are adjusted VLBI+ring-laser comparisons to full-network
VLBI reference solutions. No per-percentage uncertainty/covariance supplied.
This does not calculate a new H(s)H prediction or raw-data likelihood.
"""
from decimal import Decimal, getcontext
import json

getcontext().prec = 40
source = {
    "XB_deltaUT1": Decimal("0.24"),
    "XB_y_p": Decimal("0.14"),
    "XA_x_p": Decimal("0.09"),
}
result = {}
for name, reduction in source.items():
    remaining_rms = 1 - reduction
    remaining_squared_rms = remaining_rms**2
    squared_rms_reduction = 1 - remaining_squared_rms
    result[name] = {
        "published_rms_reduction_percent": str(reduction * 100),
        "remaining_rms_fraction": str(remaining_rms),
        "remaining_squared_rms_fraction": str(remaining_squared_rms),
        "squared_rms_reduction_percent": str(squared_rms_reduction * 100),
    }

assert result["XB_deltaUT1"]["squared_rms_reduction_percent"] == "42.2400"
assert result["XB_y_p"]["squared_rms_reduction_percent"] == "26.0400"
assert result["XA_x_p"]["squared_rms_reduction_percent"] == "17.1900"
assert source["XB_deltaUT1"] > source["XB_y_p"] > source["XA_x_p"]
assert all(0 < x < 1 for x in source.values())
assert all(0 < (1 - x)**2 < 1 for x in source.values())

print(json.dumps({
    "source_doi": "10.5194/adgeo-50-9-2019",
    "data_type": "published summary of measured VLBI+ring-laser adjusted residuals",
    "uncertainty": "not reported for percent reductions; no CI computed",
    "assertions_passed": 6,
    "results": result,
}, indent=2))
