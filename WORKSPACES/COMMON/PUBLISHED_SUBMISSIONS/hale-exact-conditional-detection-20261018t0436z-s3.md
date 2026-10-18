# Hale | Exact conditional detection with a noisy reference audit

**Status:** executed GEN/DERIVED/SANDBOXED statistical calculation. The binomial calibration model is stipulated; this is not a SAT/H(s)H physical inference.

## BEDROCK comparison

Live BEDROCK.md was read completely with STATE_OF_THE_THEORY.md subordinate. This calculation changes no ND/FB/WB premise, does not use Q or inverse-Q (OC-001), makes no electromagnetic-support choice (OC-002), and does not alter BR-005. Under BR-003 it remains tentative worker-lane mathematics. It does not instantiate BR-006 worldtubes or claim a geometry-to-response-to-observation bridge.

Hale's preceding checkpoint used separately projected Clopper-Pearson intervals for the disagreement rate D and audit error c. That construction guarantees conservative coverage but excluded e=0 with probability only 0.000843512 at total budget 100. The present calculation targets that exact decision directly.

## Model and exact nuisance removal

Let

\[
X\sim\operatorname{Bin}(m,D),\qquad
Z\sim\operatorname{Bin}(b,c),\qquad X\perp Z,
\]

where

\[
D=e+c-2ec=c+e(1-2c),\qquad 0\le e,c\le \frac12,
\qquad B=m+b.
\]

Here e is the emission/error parameter of interest and c is the independently audited reference-label error. For c<1/2,

\[
e=0\iff D=c,\qquad e>0\iff D>c.
\]

Under the null e=0, all B Bernoulli observations share probability c. Conditional on the total

\[
T=X+Z,
\]

the nuisance c disappears:

\[
X\mid T=t,H_0
\sim\operatorname{Hypergeom}(B,m,t).
\]

For each t, choose the smallest integer k_t satisfying

\[
P_{H_0}(X\ge k_t\mid T=t)\le\alpha.
\]

Reject e=0 exactly when X>=k_T. For every c,

\[
P_{e=0,c}(\text{reject})
=\sum_t P_c(T=t)
P_{H_0}(X\ge k_t\mid T=t)
\le\alpha.
\]

Thus the test is finite-sample valid without estimating, plugging in, or profiling c. Discreteness makes it conservative.

## Exact power

Under e>0, conditioning on T yields Fisher's noncentral hypergeometric law with odds ratio

\[
\omega=
\frac{D/(1-D)}{c/(1-c)}>1.
\]

The exact power is

\[
\mathcal P(e,c;m,b)
=
\sum_{t=0}^{B}
P_{e,c}(T=t)\,
P_{\omega}(X\ge k_t\mid T=t),
\]

where P(T=t) is computed by convolving the Bin(m,D) and Bin(b,c) probability masses. No Monte Carlo or asymptotic cutoff is used.

## Executed fixture

The inherited synthetic parameters were

\[
e=0.03143198557693108,\qquad c=0.1,
\]

giving

\[
D=0.12514558846154486,\qquad D-c=0.025145588461544854.
\]

At alpha=0.05 and B=100, exhaustive integer allocation m=5,...,95 gave

\[
(m,b)_{\rm power}=(40,60),
\qquad
\mathcal P=0.0732593440842551.
\]

The local Fisher-variance allocation was

\[
(m,b)_{\rm Fisher}=(54,46),
\qquad
\mathcal P=0.06548868280921048.
\]

The predecessor projected rectangle excluded e=0 with probability 0.000843512, so the targeted conditional test improves the declared fixture's detection probability by

\[
\frac{0.0732593440842551}{0.000843512}=86.8504.
\]

This is not high absolute power: budget 100 remains inadequate for a 0.0251 rate difference.

A 500-point null audit over c in [0.001,0.5] found maximum rejection probability

\[
0.03308311228696648
\]

at c=0.492, below the nominal 0.05 ceiling. At e=0,c=0.1 the rejection probability was 0.03126527782161608. A wrong-direction control e=-0.01 reduced it to 0.022473386464605886.

Using the Fisher allocation fraction at larger budgets gave:

| B | m | b | Exact power |
|---:|---:|---:|---:|
| 100 | 54 | 46 | 0.0654886828 |
| 250 | 135 | 115 | 0.1080072526 |
| 500 | 270 | 230 | 0.1850849361 |
| 1000 | 541 | 459 | 0.3124119555 |
| 2000 | 1081 | 919 | 0.5236074841 |
| 5000 | 2703 | 2297 | 0.8679043040 |

## Limiting cases and boundary

- At e=0, D=c and the conditional null is exact for every unknown c.
- As c approaches 1/2, D-c=e(1-2c) approaches zero; reference noise destroys identifiability and power.
- For fixed e>0 and c<1/2, the test is consistent as both m and b grow.
- Independence of X and Z is essential. Shared latent or clustered calibration invalidates the conditional hypergeometric law and requires its own likelihood.
- The result is a detection test, not a complete confidence interval for e.

## Bounded conclusion

Directly testing the equality D=c is far more informative than asking whether a conservative projected rectangle happens to exclude e=0. Exact finite-sample validity is retained because conditioning removes c. However, the small effect remains expensive: even B=2000 provides only 52.36% power for the stipulated fixture. This result refines Hale's calibration design; it does not promote any SAT/H(s)H claim.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Exact nuisance-free detection gate for noisy-reference calibration.

Synthetic statistical model only.  It tests e=0 from independent binomial
comparison and audit counts; it makes no SAT/H(s)H physical inference.
"""

from __future__ import annotations

import hashlib
import json
import math
from pathlib import Path

import numpy as np
from scipy.stats import binom, hypergeom, nchypergeom_fisher


E_TRUE = 0.03143198557693108
C_TRUE = 0.1
D_TRUE = E_TRUE + C_TRUE - 2.0 * E_TRUE * C_TRUE
ALPHA = 0.05
A_FISHER = 0.17106901585962261
Q_FISHER = 0.12350024107896226


def rejection_threshold(B: int, m: int, total: int, alpha: float) -> int | None:
    """Smallest x with P_0(X>=x | X+Z=total) <= alpha."""
    lo = max(0, total - (B - m))
    hi = min(m, total)
    if hypergeom.sf(hi - 1, B, m, total) > alpha:
        return None
    left, right = lo, hi
    while left < right:
        mid = (left + right) // 2
        if hypergeom.sf(mid - 1, B, m, total) <= alpha:
            right = mid
        else:
            left = mid + 1
    return left


def exact_power(B: int, m: int, e: float, c: float, alpha: float = ALPHA):
    b = B - m
    D = e + c - 2.0 * e * c
    odds_ratio = (D / (1.0 - D)) / (c / (1.0 - c))
    total_pmf = np.convolve(
        binom.pmf(np.arange(m + 1), m, D),
        binom.pmf(np.arange(b + 1), b, c),
    )
    power = 0.0
    active_totals = 0
    for total, p_total in enumerate(total_pmf):
        if p_total == 0.0:
            continue
        threshold = rejection_threshold(B, m, total, alpha)
        if threshold is None:
            continue
        active_totals += 1
        power += p_total * nchypergeom_fisher.sf(
            threshold - 1, B, m, total, odds_ratio
        )
    return float(power), active_totals


def null_size(B: int, m: int, c: float, alpha: float = ALPHA) -> float:
    """Unconditional null rejection probability; H0 makes total~Bin(B,c)."""
    size = 0.0
    for total in range(B + 1):
        threshold = rejection_threshold(B, m, total, alpha)
        if threshold is None:
            continue
        conditional = hypergeom.sf(threshold - 1, B, m, total)
        size += binom.pmf(total, B, c) * conditional
    return float(size)


def main() -> None:
    B = 100
    searched = []
    for m in range(5, B - 4):
        power, _ = exact_power(B, m, E_TRUE, C_TRUE)
        searched.append((power, m))
    best_power, best_m = max(searched)
    fisher_m = round(B * math.sqrt(A_FISHER) / (
        math.sqrt(A_FISHER) + math.sqrt(Q_FISHER)
    ))
    fisher_power, fisher_active = exact_power(B, fisher_m, E_TRUE, C_TRUE)

    grid = np.linspace(0.001, 0.5, 500)
    sizes = np.array([null_size(B, best_m, float(c)) for c in grid])
    imax = int(np.argmax(sizes))

    budget_power = {}
    for budget in (100, 250, 500, 1000, 2000, 5000):
        m = round(budget * math.sqrt(A_FISHER) / (
            math.sqrt(A_FISHER) + math.sqrt(Q_FISHER)
        ))
        power, active = exact_power(budget, m, E_TRUE, C_TRUE)
        budget_power[str(budget)] = {
            "m_comparisons": m,
            "b_audits": budget - m,
            "exact_power": power,
            "active_conditioning_totals": active,
        }

    zero_effect_power, _ = exact_power(B, best_m, 0.0, C_TRUE)
    reversed_effect_power, _ = exact_power(B, best_m, -0.01, C_TRUE)
    assert best_power >= fisher_power
    assert sizes[imax] <= ALPHA + 1e-12
    assert zero_effect_power <= ALPHA + 1e-12
    assert reversed_effect_power < zero_effect_power
    assert D_TRUE > C_TRUE

    result = {
        "fixture": {
            "e": E_TRUE,
            "c": C_TRUE,
            "D": D_TRUE,
            "D_minus_c": D_TRUE - C_TRUE,
            "alpha": ALPHA,
        },
        "B100_exact_allocation_search": {
            "best_m": best_m,
            "best_b": B - best_m,
            "best_power": best_power,
            "fisher_variance_m": fisher_m,
            "fisher_variance_b": B - fisher_m,
            "fisher_allocation_power": fisher_power,
            "fisher_active_conditioning_totals": fisher_active,
            "projected_rectangle_exclude_zero_from_predecessor": 0.000843512,
        },
        "null_size_grid_500_points_c_0.001_to_0.5": {
            "maximum": float(sizes[imax]),
            "argmax_c": float(grid[imax]),
        },
        "negative_controls_B100_best_allocation": {
            "e_zero_rejection_probability": zero_effect_power,
            "e_minus_0.01_wrong_direction_probability": reversed_effect_power,
        },
        "power_at_fisher_fraction_by_budget": budget_power,
        "python_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "status": "PASS; GEN/DERIVED exact statistical gate; no physical claim",
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
```

## Actual stdout

```json
{
  "B100_exact_allocation_search": {
    "best_b": 60,
    "best_m": 40,
    "best_power": 0.0732593440842551,
    "fisher_active_conditioning_totals": 92,
    "fisher_allocation_power": 0.06548868280921048,
    "fisher_variance_b": 46,
    "fisher_variance_m": 54,
    "projected_rectangle_exclude_zero_from_predecessor": 0.000843512
  },
  "fixture": {
    "D": 0.12514558846154486,
    "D_minus_c": 0.025145588461544854,
    "alpha": 0.05,
    "c": 0.1,
    "e": 0.03143198557693108
  },
  "negative_controls_B100_best_allocation": {
    "e_minus_0.01_wrong_direction_probability": 0.022473386464605886,
    "e_zero_rejection_probability": 0.03126527782161608
  },
  "null_size_grid_500_points_c_0.001_to_0.5": {
    "argmax_c": 0.492,
    "maximum": 0.03308311228696648
  },
  "power_at_fisher_fraction_by_budget": {
    "100": {
      "active_conditioning_totals": 92,
      "b_audits": 46,
      "exact_power": 0.06548868280921048,
      "m_comparisons": 54
    },
    "1000": {
      "active_conditioning_totals": 618,
      "b_audits": 459,
      "exact_power": 0.31241195546869,
      "m_comparisons": 541
    },
    "2000": {
      "active_conditioning_totals": 907,
      "b_audits": 919,
      "exact_power": 0.5236074841422851,
      "m_comparisons": 1081
    },
    "250": {
      "active_conditioning_totals": 242,
      "b_audits": 115,
      "exact_power": 0.10800725263608459,
      "m_comparisons": 135
    },
    "500": {
      "active_conditioning_totals": 425,
      "b_audits": 230,
      "exact_power": 0.1850849360566377,
      "m_comparisons": 270
    },
    "5000": {
      "active_conditioning_totals": 1580,
      "b_audits": 2297,
      "exact_power": 0.8679043039508646,
      "m_comparisons": 2703
    }
  },
  "python_sha256": "6f72dc7d1d70f955d5eb62b556f3a0e0171900982ff73e9e53e876fb3d46dd12",
  "status": "PASS; GEN/DERIVED exact statistical gate; no physical claim"
}
```

