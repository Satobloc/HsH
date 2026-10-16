# Enheduanna S3 — calibrated-anchor bias and tetrad diagnostic

**Status:** `GEN/DERIVED` statistical-identifiability sandbox.  
**Executed:** exact population calculation and seeded multinomial experiments in Python 3.12 / NumPy 2.3.5.  
**Boundary:** This is not authenticated Enheduanna participation, source-exposure evidence, authorship evidence, or SAT/H(s)H physics.

## Problem

The latest Enheduanna checkpoint identifies the parameters of a two-latent Bernoulli probe model by adding a calibrated session anchor. Its next open gate is calibration bias. This calculation derives exactly how incorrect anchor endpoints contaminate the exposure residual and shows that the resulting contamination is testable with a four-probe tetrad.

## Model and nominal inversion

Let independent latent variables be

```text
Z ~ Bernoulli(p),       H ~ Bernoulli(q),
E[Xi | Z,H] = fi + di Z + ci H,       i=1,...,4.
```

The calibrated binary anchor has nominal endpoints

```text
P(Y=1 | H=0)=r0,       P(Y=1 | H=1)=r1,
t=r1-r0 != 0.
```

Set

```text
A=p(1-p),       B=q(1-q).
```

With correct calibration,

```text
q = (E[Y]-r0)/t,
ci = Cov(Xi,Y)/(B t),
Rij = Cov(Xi,Xj)-B ci cj = A di dj.
```

Thus the off-diagonal residual `R` is rank one, and its tetrads vanish.

## Exact endpoint-bias derivation

Suppose the true anchor endpoints are instead

```text
r0* = r0 + epsilon0,
r1* = r1 + epsilon1,
t*  = t + epsilon1 - epsilon0,
```

while analysis still uses nominal `r0,t`. The inferred session prevalence is

```text
qhat = q + [(1-q) epsilon0 + q epsilon1]/t,
Bhat = qhat(1-qhat).
```

Because

```text
Cov(Xi,Y) = B ci t*,
```

the inferred loading is

```text
cihat = ci B t*/(Bhat t).
```

The residual after nominal session subtraction becomes

```text
Rhat_ij = Cov(Xi,Xj)-Bhat cihat cjat
         = A di dj + kappa ci cj,
```

where the exact contamination coefficient is

```text
kappa = B - B^2 (t*)^2/(Bhat t^2).
```

Therefore miscalibration generically changes a rank-one residual into a sum of two rank-one terms. For the tetrad

```text
Delta = Rhat_12 Rhat_34 - Rhat_13 Rhat_24,
```

direct expansion gives the factorization

```text
Delta = A kappa
        (d1 c4-c1 d4)
        (d2 c3-c2 d3).
```

This is an exact internal calibration diagnostic whenever the two loading directions are not locally proportional. It is not a universal detector: `Delta` also vanishes if `kappa=0` or either displayed loading wedge is zero.

For a common endpoint offset `epsilon0=epsilon1=delta`, `t*=t` and

```text
qhat=q+delta/t.
```

Near `delta=0`, the fixture below has

```text
d Delta/d delta = -1.936099199989e-3.
```

## Fixture

The inherited branch-P parameters are

```text
p=0.30, q=0.38,
f=(0.08, 0.22, 0.10, 0.22),
d=(0.61, 0.54, 0.50, 0.44),
c=(0.21,-0.16, 0.20,-0.15),
r0=0.05, r1=0.95, t=0.90.
```

Exact evaluation gives:

| bias case | `qhat` | `kappa` | tetrad `Delta` | mean recovered `p` | four-triplet `p` spread |
|---|---:|---:|---:|---:|---:|
| correct | 0.380000000 | 0 | 0 within `8.7e-19` | 0.300000000 | `5.0e-16` |
| common −1 point | 0.368888889 | `−2.823561853e-3` | `+2.050010942e-5` | 0.300090806 | `1.216982116e-3` |
| common +1 point | 0.391111111 | `+2.516050100e-3` | `−1.826745969e-5` | 0.299921316 | `1.143715534e-3` |
| common −2 points | 0.357777778 | `−5.974940360e-3` | `+4.338028969e-5` | 0.300194208 | `2.518258717e-3` |
| common +2 points | 0.402222222 | `+4.742097804e-3` | `−3.442939412e-5` | 0.299854355 | `2.223886469e-3` |
| contrast −4 points | 0.385333333 | `+2.161357929e-2` | `−1.569226259e-4` | 0.299023913 | `2.228935010e-3` |
| contrast +4 points | 0.374666667 | `−2.284291135e-2` | `+1.658480340e-4` | 0.300981682 | `2.508420452e-3` |

“Common +1 point” means both true anchor probabilities are 0.01 above their nominal values. “Contrast +4 points” means `epsilon0=-0.02`, `epsilon1=+0.02`, increasing anchor contrast by 0.04.

The four triplet-specific exposure estimates cease to agree under bias. Their spread is an additional internal diagnostic; averaging them happens to leave a small error in this fixture but is not a bias correction theorem.

## Sampling uncertainty and power

For each condition, the exact 32-cell law of `(X1,...,X4,Y)` was sampled with a multinomial generator. A two-sided threshold was set to the empirical 95th percentile of `|Delta|` under correct calibration, using 2,000 null replicates. Independent biased replicates then used that fixed threshold.

| `N` | condition | mean tetrad | SD | rejection rate |
|---:|---|---:|---:|---:|
| 100,000 | correct calibration | `+4.626e-9` | `6.132e-5` | 0.0500 |
| 100,000 | common +1 point | `−1.767e-5` | `6.040e-5` | 0.0530 |
| 100,000 | common +2 points | `−3.350e-5` | `6.058e-5` | 0.0810 |
| 100,000 | contrast +4 points | `+1.637e-4` | `5.971e-5` | 0.7565 |
| 1,000,000 | correct calibration | `+6.569e-8` | `1.932e-5` | 0.0500 |
| 1,000,000 | common +1 point | `−1.840e-5` | `1.891e-5` | 0.1625 |
| 1,000,000 | common +2 points | `−3.407e-5` | `1.877e-5` | 0.4265 |
| 1,000,000 | contrast +4 points | `+1.658e-4` | `1.888e-5` | 1.0000 |

These are Monte Carlo estimates, not analytic power guarantees. Their binomial Monte Carlo standard error is at most `sqrt(0.25/2000)=0.01118`.

## Controls and bounded conclusion

- Exact analytic and enumerated tetrads agreed within `2e-17` in every fixture.
- Correct calibration recovered `p` and `q` to floating-point precision.
- The empirical null rejection rate is exactly the constructed 0.05 in both sample-size fixtures.
- Calibration bias does not automatically imply a detectable tetrad: power depends on sample size, endpoint-error direction, and nonparallel `d,c` loadings.
- The result supplies a falsification/control test for the calibrated-anchor inversion; it does not establish that any recovered latent variable represents source exposure.

## Executed output

```text
case eps0 eps1 qhat kappa tetrad_exact tetrad_numeric pmean pspread
correct          +0.000 +0.000 0.380000000 +0.000000000e+00 -0.000000000e+00 +8.673617380e-19 0.300000000 4.996003611e-16
offset_-2pct     -0.020 -0.020 0.357777778 -5.974940360e-03 +4.338028969e-05 +4.338028969e-05 0.300194208 2.518258717e-03
offset_-1pct     -0.010 -0.010 0.368888889 -2.823561853e-03 +2.050010942e-05 +2.050010942e-05 0.300090806 1.216982116e-03
offset_+1pct     +0.010 +0.010 0.391111111 +2.516050100e-03 -1.826745969e-05 -1.826745969e-05 0.299921316 1.143715534e-03
offset_+2pct     +0.020 +0.020 0.402222222 +4.742097804e-03 -3.442939412e-05 -3.442939412e-05 0.299854355 2.223886469e-03
contrast_-4pct   +0.020 -0.020 0.385333333 +2.161357929e-02 -1.569226259e-04 -1.569226259e-04 0.299023913 2.228935010e-03
contrast_+4pct   -0.020 +0.020 0.374666667 -2.284291135e-02 +1.658480340e-04 +1.658480340e-04 0.300981682 2.508420452e-03
common_offset_local_tetrad_slope=-1.936099199989e-03
MC N=100000 reps=2000 seed_base=202610160736
null mean=+4.625931415e-09 sd=6.132059467e-05 abs95=1.216857040e-04 rejection=0.0500
offset_1pct mean=-1.766822371e-05 sd=6.039906143e-05 rejection=0.0530
offset_2pct mean=-3.349846231e-05 sd=6.058010047e-05 rejection=0.0810
contrast_4pct mean=+1.637308530e-04 sd=5.971395397e-05 rejection=0.7565
MC N=1000000 reps=2000 seed_base=202610160736
null mean=+6.569248747e-08 sd=1.932419281e-05 abs95=3.687995913e-05 rejection=0.0500
offset_1pct mean=-1.840057917e-05 sd=1.891340381e-05 rejection=0.1625
offset_2pct mean=-3.406997119e-05 sd=1.877167081e-05 rejection=0.4265
contrast_4pct mean=+1.658082314e-04 sd=1.887582989e-05 rejection=1.0000
ALL_CHECKS_PASSED
```

## Full executable Python

```python
#!/usr/bin/env python3
"""Calibration-bias diagnostic for Enheduanna's binary session anchor.

GEN/DERIVED statistical sandbox.  Exact population moments and seeded
multinomial experiments quantify how anchor miscalibration contaminates the
rank-one exposure residual.  This is not source-exposure evidence or physics.
"""

from __future__ import annotations

import itertools
import math
import numpy as np

P = 0.30
Q = 0.38
F = np.array([0.08, 0.22, 0.10, 0.22])
D = np.array([0.61, 0.54, 0.50, 0.44])
C = np.array([0.21, -0.16, 0.20, -0.15])
R0 = 0.05
R1 = 0.95
T = R1 - R0
REPS = 2_000
SEED = 202610160736

BITS = np.array(list(itertools.product((0, 1), repeat=5)), dtype=float)


def joint(eps0: float, eps1: float) -> np.ndarray:
    """Exact law of X1..X4,Y under true anchor endpoint errors eps0,eps1."""
    out = np.zeros(32)
    for z, h in itertools.product((0, 1), repeat=2):
        weight = (P if z else 1.0 - P) * (Q if h else 1.0 - Q)
        probs = np.r_[F + D * z + C * h,
                      (R1 + eps1) if h else (R0 + eps0)]
        if np.any((probs < 0.0) | (probs > 1.0)):
            raise ValueError("conditional probability outside [0,1]")
        out += weight * np.prod(np.where(BITS, probs, 1.0 - probs), axis=1)
    return out


def observed_moments(prob: np.ndarray):
    means = prob @ BITS
    pair = np.einsum("n,ni,nj->ij", prob, BITS, BITS)
    cov = pair - np.outer(means, means)
    third = np.zeros((4, 4, 4))
    for i, j, k in itertools.combinations(range(4), 3):
        raw = float(prob @ (BITS[:, i] * BITS[:, j] * BITS[:, k]))
        value = (raw - pair[i, j] * means[k] - pair[i, k] * means[j]
                 - pair[j, k] * means[i] + 2.0 * means[i] * means[j] * means[k])
        for perm in itertools.permutations((i, j, k)):
            third[perm] = value
    return means, cov, third


def inversion(prob: np.ndarray) -> dict:
    means, cov, third = observed_moments(prob)
    qhat = (means[4] - R0) / T
    bhat = qhat * (1.0 - qhat)
    chat = cov[:4, 4] / (bhat * T)
    residual = cov[:4, :4] - bhat * np.outer(chat, chat)
    tetrad = residual[0, 1] * residual[2, 3] - residual[0, 2] * residual[1, 3]

    phats = []
    for a, b, c in itertools.combinations(range(4), 3):
        va = math.sqrt(residual[a, b] * residual[a, c] / residual[b, c])
        vb = residual[a, b] / va
        vc = residual[a, c] / va
        corrected3 = third[a, b, c] - bhat * (1.0 - 2.0 * qhat) * chat[a] * chat[b] * chat[c]
        alpha = corrected3 / (va * vb * vc)
        phat = (1.0 - alpha / math.sqrt(alpha * alpha + 4.0)) / 2.0
        phats.append(phat)
    return dict(qhat=qhat, chat=chat, tetrad=tetrad,
                pmean=float(np.mean(phats)), pspread=float(np.ptp(phats)),
                phats=np.array(phats), residual=residual)


def analytic(eps0: float, eps1: float) -> dict:
    """Closed-form contamination coefficient and tetrad."""
    b = Q * (1.0 - Q)
    a = P * (1.0 - P)
    t_true = T + eps1 - eps0
    qhat = Q + ((1.0 - Q) * eps0 + Q * eps1) / T
    bhat = qhat * (1.0 - qhat)
    kappa = b - b * b * t_true * t_true / (bhat * T * T)
    wedge1 = D[0] * C[3] - C[0] * D[3]
    wedge2 = D[1] * C[2] - C[1] * D[2]
    tetrad = a * kappa * wedge1 * wedge2
    return dict(qhat=qhat, kappa=kappa, tetrad=tetrad, t_true=t_true)


def mc_power(n: int, eps0: float, eps1: float, threshold: float | None = None):
    rng = np.random.default_rng(SEED + n + round(1e5 * (eps0 + 2 * eps1)))
    prob = joint(eps0, eps1)
    values = np.empty(REPS)
    for j in range(REPS):
        freq = rng.multinomial(n, prob) / n
        values[j] = inversion(freq)["tetrad"]
    if threshold is None:
        threshold = float(np.quantile(np.abs(values), 0.95))
    return dict(mean=float(values.mean()), sd=float(values.std(ddof=1)),
                threshold=threshold, rejection=float(np.mean(np.abs(values) > threshold)))


def main() -> None:
    cases = [
        ("correct", 0.0, 0.0),
        ("offset_-2pct", -0.02, -0.02),
        ("offset_-1pct", -0.01, -0.01),
        ("offset_+1pct", 0.01, 0.01),
        ("offset_+2pct", 0.02, 0.02),
        ("contrast_-4pct", 0.02, -0.02),
        ("contrast_+4pct", -0.02, 0.02),
    ]
    print("case eps0 eps1 qhat kappa tetrad_exact tetrad_numeric pmean pspread")
    for name, e0, e1 in cases:
        ana = analytic(e0, e1)
        inv = inversion(joint(e0, e1))
        print(f"{name:16s} {e0:+.3f} {e1:+.3f} {ana['qhat']:.9f} "
              f"{ana['kappa']:+.9e} {ana['tetrad']:+.9e} "
              f"{inv['tetrad']:+.9e} {inv['pmean']:.9f} {inv['pspread']:.9e}")
        assert abs(ana["tetrad"] - inv["tetrad"]) < 2e-17

    # Local derivative of the tetrad under common endpoint offset.
    h = 1e-6
    slope = (analytic(h, h)["tetrad"] - analytic(-h, -h)["tetrad"]) / (2 * h)
    print(f"common_offset_local_tetrad_slope={slope:+.12e}")

    powers = []
    for n in (100_000, 1_000_000):
        null = mc_power(n, 0.0, 0.0)
        alt1 = mc_power(n, 0.01, 0.01, null["threshold"])
        alt2 = mc_power(n, 0.02, 0.02, null["threshold"])
        contrast = mc_power(n, -0.02, 0.02, null["threshold"])
        powers.append((null, alt1, alt2, contrast))
        print(f"MC N={n} reps={REPS} seed_base={SEED}")
        print(f"null mean={null['mean']:+.9e} sd={null['sd']:.9e} abs95={null['threshold']:.9e} rejection={null['rejection']:.4f}")
        print(f"offset_1pct mean={alt1['mean']:+.9e} sd={alt1['sd']:.9e} rejection={alt1['rejection']:.4f}")
        print(f"offset_2pct mean={alt2['mean']:+.9e} sd={alt2['sd']:.9e} rejection={alt2['rejection']:.4f}")
        print(f"contrast_4pct mean={contrast['mean']:+.9e} sd={contrast['sd']:.9e} rejection={contrast['rejection']:.4f}")

    zero = inversion(joint(0.0, 0.0))
    assert abs(zero["tetrad"]) < 2e-17
    assert abs(zero["pmean"] - P) < 5e-15
    assert abs(zero["qhat"] - Q) < 5e-15
    for null, alt1, alt2, contrast in powers:
        assert null["rejection"] <= 0.051
        assert alt2["rejection"] > alt1["rejection"] > null["rejection"]
        assert contrast["rejection"] > alt2["rejection"]
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

## Next calculation

For Tern Rook: design a calibration plan that allocates labeled endpoint trials and unlabeled five-probe trials to control both endpoint uncertainty and tetrad power under clustered sessions.
