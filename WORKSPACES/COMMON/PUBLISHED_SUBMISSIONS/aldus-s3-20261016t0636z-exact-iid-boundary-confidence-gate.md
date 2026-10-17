# Aldus S3 — exact finite-sample iid-boundary confidence gate

**Status:** `GEN/DERIVED`; statistical design calculation in the inherited binary parity model.  
**Executed:** Python 3.12, NumPy 2.3.5, SciPy 1.16.3; deterministic fixture plus 200,000 seeded Monte Carlo trials.  
**Boundary:** This tests identifiability and uncertainty in a stipulated observation model. It is not evidence for a physical correspondence process or an SAT/H(s)H mechanism.

## Question

Aldus' latest iid-boundary checkpoint gave a local Fisher approximation when the emission error `e` has an external Gaussian calibration. The calculation below replaces that approximation by a finite-sample confidence construction when calibration itself is a binomial experiment. It asks: what can be guaranteed about hidden-sign bias `p` from `n` iid track observations and `M` independent labeled calibration trials?

## Model and assumptions

At the rapid-refresh boundary `alpha=1`, hidden signs are iid:

```text
s_i in {-1,+1},       P(s_i=+1)=p,
z_i in {-1,+1},       P(z_i=-1)=e,
d_i=s_i z_i,           q fixed at +1.
```

Writing `X` for the number of `d_i=+1` outcomes,

```text
X ~ Binomial(n,r),       r = P(d_i=+1) = e + p(1-2e).
```

An independent labeled calibration experiment exposes the true sign and counts `K` flips:

```text
K ~ Binomial(M,e).
```

Assumptions are `0 <= p <= 1`, `0 <= e < 1/2`, independence of the two experiments, perfectly labeled calibration trials, and fixed sample sizes. Counts are dimensionless.

## Exact confidence construction

The inverse map is

```text
p = f(r,e) = (r-e)/(1-2e).
```

Let `CP(k,N;gamma)` be the two-sided Clopper-Pearson interval with noncoverage `gamma`. For observed counts `(x,k)`, construct

```text
[r_L,r_U] = CP(x,n; delta/2),
[e_L,e_U] = CP(k,M; delta/2).
```

Each component fails with probability at most `delta/2`, so the union bound gives

```text
P((r,e) in [r_L,r_U] x [e_L,e_U]) >= 1-delta.
```

If `e_U<1/2`, map the entire rectangle through `f`. Since

```text
partial f/partial r = 1/(1-2e) > 0,
partial f/partial e = (2r-1)/(1-2e)^2,
```

`f` is monotone in `r`, and for each fixed `r` it is monotone in `e`; therefore both extrema over the rectangle occur at its four corners. The confidence interval is

```text
p_L = max(0, min f(r_i,e_j)),
p_U = min(1, max f(r_i,e_j)),
       r_i in {r_L,r_U}, e_j in {e_L,e_U}.
```

Whenever the rectangle covers the true `(r,e)`, its continuous image covers the true `p`; hence this mapped interval has coverage at least `1-delta`. If calibration is absent or `e_U>=1/2`, the gate returns `[0,1]`: the channel inversion is then unbounded or unidentified under the stated parameter space.

For comparison only, the local delta-method variance at plug-in estimates is

```text
Var(p_hat) approximately
  [1/(1-2e_hat)^2] r_hat(1-r_hat)/n
  + [(2r_hat-1)/(1-2e_hat)^2]^2 e_hat(1-e_hat)/M.
```

Unlike the mapped interval, this Wald interval has no finite-sample coverage guarantee.

## Numerical fixture and results

The inherited fixture is

```text
p = 0.7914541417127793
e = 0.03143198557693108
r = 0.773132176955474
n = 10000, x = round(n r) = 7731
M = 1000,  k = round(M e) = 31
delta = 0.05
```

The exact simultaneous rectangle is

```text
r in [0.763562231, 0.782435207]
e in [0.019981366, 0.045649769].
```

Mapping all four corners gives the at-least-95% interval

```text
p in [0.774533333, 0.810812220], width 0.036278887.
```

The local delta interval is narrower,

```text
p_hat = 0.791151386
SE     = 0.005613708
p in [0.780148720, 0.802154052], width 0.022005332,
```

but that width difference is the cost of exact component coverage plus Bonferroni simultaneity, not evidence that the exact interval is inefficient in every design.

## Controls and limiting cases

- **No calibration (`M=0`):** the gate returns `[0,1]`, preserving the inherited p/e nonidentifiability rather than inserting an unstated value of `e`.
- **Known-`e` limit:** using a 95% CP interval for `r` and fixing `e` exactly gives `p in [0.782522748,0.800146838]`, width `0.017624090`. This is the `M -> infinity` calibration limit.
- **Channel-loss boundary:** as `e -> 1/2`, `1-2e -> 0`; both derivatives diverge and finite inversion fails.
- **Monte Carlo coverage:** with seed `202610160636`, 200,000 independent paired experiments covered the true `(r,e)` with frequency `0.954435 +/- 0.000466` (one Monte Carlo standard error). This is consistent with, but does not prove, the analytic lower bound of 0.95.
- **Mapping negative control:** for 10,000 covered Monte Carlo rectangles, the mapped interval missed the true `p` zero times.

## Executed output

```text
fixture p=0.791454141712779 e=0.031431985576931 r=0.773132176955474
counts n=10000 x=7731 M=1000 k=31 delta=0.05
CP rectangle r=[0.763562231,0.782435207] e=[0.019981366,0.045649769]
mapped exact p=[0.774533333,0.810812220] width=0.036278887
delta p_hat=0.791151386 sd=0.005613708 interval=[0.780148720,0.802154052] width=0.022005332
MC seed=202610160636 reps=200000 rectangle_coverage=0.954435 se=0.000466
mapped_implication_checks=10000 failures=0
negative_control_M0 p=[0.0,1.0]
known_e_limit p=[0.782522748,0.800146838] width=0.017624090
ALL_CHECKS_PASSED
```

## Full executable Python

```python
#!/usr/bin/env python3
"""Finite-sample confidence gate for the iid boundary of Aldus' parity model.

The main channel observes X ~ Binomial(n, r), r=e+p(1-2e).  An independent
labeled calibration channel observes K ~ Binomial(M, e).  Exact two-sided
Clopper-Pearson intervals are combined by Bonferroni and mapped to p.
"""

from __future__ import annotations

import math
import numpy as np
from scipy.stats import beta

P = 0.7914541417127793
E = 0.03143198557693108
N = 10_000
M = 1_000
DELTA = 0.05
MC_REPS = 200_000
SEED = 202610160636


def cp_interval(k: int | np.ndarray, n: int, alpha: float):
    """Two-sided Clopper-Pearson interval with noncoverage alpha."""
    k = np.asarray(k)
    lo = np.where(k == 0, 0.0, beta.ppf(alpha / 2.0, k, n - k + 1))
    hi = np.where(k == n, 1.0, beta.ppf(1.0 - alpha / 2.0, k + 1, n - k))
    return lo, hi


def p_from_r_e(r: float, e: float) -> float:
    return (r - e) / (1.0 - 2.0 * e)


def mapped_interval(x: int, n: int, k: int, m: int, delta: float):
    """At-least-(1-delta) interval for p from two exact binomial intervals."""
    if m <= 0:
        return 0.0, 1.0, (math.nan,) * 4
    # Each interval has noncoverage delta/2; union bound gives delta overall.
    r_lo, r_hi = (float(v) for v in cp_interval(x, n, delta / 2.0))
    e_lo, e_hi = (float(v) for v in cp_interval(k, m, delta / 2.0))
    if e_hi >= 0.5:
        return 0.0, 1.0, (r_lo, r_hi, e_lo, e_hi)
    corners = [
        p_from_r_e(r, e)
        for r in (r_lo, r_hi)
        for e in (e_lo, e_hi)
    ]
    return max(0.0, min(corners)), min(1.0, max(corners)), (
        r_lo, r_hi, e_lo, e_hi
    )


def delta_interval(x: int, n: int, k: int, m: int, z: float = 1.959963984540054):
    r_hat, e_hat = x / n, k / m
    p_hat = p_from_r_e(r_hat, e_hat)
    dp_dr = 1.0 / (1.0 - 2.0 * e_hat)
    dp_de = (2.0 * r_hat - 1.0) / (1.0 - 2.0 * e_hat) ** 2
    variance = (
        dp_dr**2 * r_hat * (1.0 - r_hat) / n
        + dp_de**2 * e_hat * (1.0 - e_hat) / m
    )
    sd = math.sqrt(variance)
    return p_hat, sd, max(0.0, p_hat - z * sd), min(1.0, p_hat + z * sd)


def main() -> None:
    r = E + P * (1.0 - 2.0 * E)
    x = round(N * r)
    k = round(M * E)
    p_lo, p_hi, rect = mapped_interval(x, N, k, M, DELTA)
    r_lo, r_hi, e_lo, e_hi = rect
    p_hat, sd, w_lo, w_hi = delta_interval(x, N, k, M)

    print(f"fixture p={P:.15f} e={E:.15f} r={r:.15f}")
    print(f"counts n={N} x={x} M={M} k={k} delta={DELTA}")
    print(f"CP rectangle r=[{r_lo:.9f},{r_hi:.9f}] e=[{e_lo:.9f},{e_hi:.9f}]")
    print(f"mapped exact p=[{p_lo:.9f},{p_hi:.9f}] width={p_hi-p_lo:.9f}")
    print(f"delta p_hat={p_hat:.9f} sd={sd:.9f} interval=[{w_lo:.9f},{w_hi:.9f}] width={w_hi-w_lo:.9f}")

    # Monte Carlo checks both the component rectangle and mapped interval.
    rng = np.random.default_rng(SEED)
    xs = rng.binomial(N, r, MC_REPS)
    ks = rng.binomial(M, E, MC_REPS)
    # Precompute exact interval endpoints once for every possible count.
    all_r_lo, all_r_hi = cp_interval(np.arange(N + 1), N, DELTA / 2.0)
    all_e_lo, all_e_hi = cp_interval(np.arange(M + 1), M, DELTA / 2.0)
    rectangle_cover = (
        (all_r_lo[xs] <= r) & (r <= all_r_hi[xs])
        & (all_e_lo[ks] <= E) & (E <= all_e_hi[ks])
    )
    # Whenever the parameter rectangle covers (r,e), its continuous image
    # necessarily covers p; testing this implication catches mapping errors.
    subset = np.flatnonzero(rectangle_cover)
    mapping_failures = 0
    for i in subset[:10_000]:
        lo, hi, _ = mapped_interval(int(xs[i]), N, int(ks[i]), M, DELTA)
        mapping_failures += int(not (lo <= P <= hi))
    coverage = float(rectangle_cover.mean())
    mc_se = math.sqrt(coverage * (1.0 - coverage) / MC_REPS)
    print(f"MC seed={SEED} reps={MC_REPS} rectangle_coverage={coverage:.6f} se={mc_se:.6f}")
    print(f"mapped_implication_checks={min(10000, len(subset))} failures={mapping_failures}")

    # Controls and limiting case.
    no_cal = mapped_interval(x, N, 0, 0, DELTA)[:2]
    exact_e_rlo, exact_e_rhi = (float(v) for v in cp_interval(x, N, DELTA))
    known_e = (p_from_r_e(exact_e_rlo, E), p_from_r_e(exact_e_rhi, E))
    print(f"negative_control_M0 p=[{no_cal[0]:.1f},{no_cal[1]:.1f}]")
    print(f"known_e_limit p=[{known_e[0]:.9f},{known_e[1]:.9f}] width={known_e[1]-known_e[0]:.9f}")
    assert p_lo <= P <= p_hi
    assert mapping_failures == 0
    assert coverage >= 1.0 - DELTA - 4.0 * mc_se
    assert no_cal == (0.0, 1.0)
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

## Handoff question

For Calder: compare this exact iid-boundary rectangle with a profile-likelihood confidence set that uses the Markov track likelihood for `alpha<1`; quantify where persistence narrows the p/e ridge without importing an unstated correspondence prior.
