#!/usr/bin/env python3
"""Synthetic preregistration gate for rounded angular targets.

No observational data and no SAT/H(s)H physical claim are used here.
The two centers are archival test inputs only.
"""

from __future__ import annotations

import json
import math


def union_measure(b: float, phi: float, f: float) -> tuple[float, float]:
    """Return (union length, signed overlap) for two relative windows."""
    overlap = b * (1.0 + f) - phi * (1.0 - f)
    if overlap >= 0.0:
        union = phi * (1.0 + f) - b * (1.0 - f)
    else:
        union = 2.0 * f * (b + phi)
    return union, overlap


def binom_sf(n: int, q: float, k: int) -> float:
    """P[X >= k] for X~Binomial(n,q), evaluated from the lower tail."""
    if k <= 0:
        return 1.0
    if k > n:
        return 0.0
    p0 = (1.0 - q) ** n
    cdf = p0
    pj = p0
    for j in range(1, k):
        pj *= (n - j + 1) / j * q / (1.0 - q)
        cdf += pj
    return max(0.0, 1.0 - cdf)


def critical_count(n: int, q: float, alpha: float = 0.05) -> int:
    for k in range(n + 2):
        if binom_sf(n, q, k) <= alpha:
            return k
    raise AssertionError("unreachable")


def instability_bands(q_lo: float, q_hi: float, n_max: int = 1000):
    bands = []
    start = previous = None
    pair = None
    for n in range(1, n_max + 1):
        current = (critical_count(n, q_lo), critical_count(n, q_hi))
        unstable = current[0] != current[1]
        if unstable and start is None:
            start = previous = n
            pair = current
        elif unstable and n == previous + 1 and current == pair:
            previous = n
        else:
            if start is not None:
                bands.append({"n_start": start, "n_end": previous,
                              "critical_counts_lo_hi": list(pair)})
                start = previous = pair = None
            if unstable:
                start = previous = n
                pair = current
    if start is not None:
        bands.append({"n_start": start, "n_end": previous,
                      "critical_counts_lo_hi": list(pair)})
    return bands


def main() -> None:
    b = 3.0 / (4.0 * math.pi)
    phi_display = 0.246
    phi_lo, phi_hi = 0.2455, 0.2465
    f = 0.015
    support = math.pi / 2.0
    phi_touch = b * (1.0 + f) / (1.0 - f)

    union_lo, overlap_lo = union_measure(b, phi_lo, f)
    union_display, overlap_display = union_measure(b, phi_display, f)
    union_hi, overlap_hi = union_measure(b, phi_hi, f)
    q_lo = union_lo / support
    q_display = union_display / support
    q_hi = union_hi / support

    n = 100
    k_lo = critical_count(n, q_lo)
    k_hi = critical_count(n, q_hi)
    assert k_lo == k_hi == 4

    result = {
        "status": "STANDARD_MATH_SYNTHETIC_NULL_NO_PHYSICAL_CLAIM",
        "inputs": {
            "b_rad_historical_test_input": b,
            "phi_display_rad": phi_display,
            "phi_rounding_interval_rad": [phi_lo, phi_hi],
            "relative_half_width": f,
            "uniform_support_rad": support,
        },
        "topology": {
            "phi_touch_rad": phi_touch,
            "rounding_interval_straddles_touch": phi_lo < phi_touch < phi_hi,
            "signed_overlap_at_phi_lo_rad": overlap_lo,
            "signed_overlap_at_display_phi_rad": overlap_display,
            "signed_overlap_at_phi_hi_rad": overlap_hi,
        },
        "uniform_null": {
            "q_hit_at_phi_lo": q_lo,
            "q_hit_at_display_phi": q_display,
            "q_hit_at_phi_hi": q_hi,
            "relative_q_span": (q_hi - q_lo) / q_display,
            "n_100_critical_counts_lo_hi": [k_lo, k_hi],
            "n_100_tail_probability_k_ge_4_lo_hi": [
                binom_sf(n, q_lo, 4),
                binom_sf(n, q_hi, 4),
            ],
            "first_critical_count_instability_bands_through_n_1000":
                instability_bands(q_lo, q_hi)[:10],
        },
        "gate": (
            "A rounded target may not determine whether preregistered windows "
            "overlap. Carry target precision as an interval; freeze the interval "
            "and independent-unit N before selecting the rejection count."
        ),
    }

    assert result["topology"]["rounding_interval_straddles_touch"]
    assert result["uniform_null"]["first_critical_count_instability_bands_through_n_1000"][0] == {
        "n_start": 39,
        "n_end": 40,
        "critical_counts_lo_hi": [2, 3],
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
