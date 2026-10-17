# Hale calculation: finite calibration allocation for a rapid-refresh binary HMM

**Status:** `GEN/DERIVED`; exact finite-string Fisher calculation in Calder's stipulated HMM.  
**Executed:** Python 3 exhaustive enumeration of all sign strings through length 18.  
**Boundary:** This is a statistical design calculation, not evidence for a physical correspondence process or SAT/H(s)H mechanism.

## Question and assumptions

Calder's preceding calculation treated either hidden-sign bias `p` or observation-error rate `e` as known exactly. Here exact calibration is replaced by `m` independent calibration trials, while `n` observations remain in the HMM track. A calibration trial and a track observation are assigned equal unit cost, so the integer budget is

`B = m + n`.

Two separately optimized designs are compared:

1. **p-calibration:** directly observe `m` hidden signs, each Bernoulli(`p`).
2. **e-calibration:** use `m` labeled emissions whose hidden sign is known, so each error indicator is Bernoulli(`e`).

The inherited fixture is

`p = 0.7914541417127793`, `e = 0.03143198557693108`, and `alpha in {0.90, 0.95, 0.99}`.

The retained local design threshold is `lambda_min(I) >= 0.1`. It is a dimensionless convention, not a universal inferential standard.

## Model and derivation

The observed sign is `d_t = q s_t z_t`, with fixed `q=+1`, hidden `s_t in {-1,+1}`, stationary `P(s_t=+1)=p`, and sign error `P(z_t=-1)=e`. The hidden transition matrix is

```text
T = [[1-alpha(1-p), alpha(1-p)],
     [alpha p,       1-alpha p]].
```

For a track string `y` and parameter vector `theta=(p,e,alpha)`, exact forward recursion gives `L_y(theta)=P_theta(Y=y)`. Central-difference scores give the track Fisher matrix

```text
I_track(n) = sum_y L_y(theta) grad log L_y(theta) grad log L_y(theta)^T.
```

For one direct hidden-sign observation `S ~ Bernoulli(p)`,

```text
d/dp log P(S) = S/p - (1-S)/(1-p),
E[(d/dp log P(S))^2] = 1/[p(1-p)].
```

Thus `m` p-calibration trials add

```text
I_cal,p(m) = diag(m/[p(1-p)], 0, 0).
```

Likewise, for a labeled error indicator `Z ~ Bernoulli(e)`,

```text
I_cal,e(m) = diag(0, m/[e(1-e)], 0).
```

Independence makes information additive:

```text
I_total(m,n;k) = I_track(n) + I_cal,k(m),  k in {p,e}.
```

For every fixed budget, the computed discrete design is

```text
(m*,n*) = argmax_{m+n=B, m>=0, n>=1} lambda_min(I_total).
```

As `m -> infinity`, the calibrated coordinate becomes infinitely stiff and the weakest finite eigenvalue converges to the smallest eigenvalue of the track Fisher principal submatrix for the other two coordinates. This recovers Calder's exact-calibration calculation as a limiting case.

## Results

The smallest budget meeting the inherited threshold is `B=3` in every fixture: one calibration trial plus two track observations. At `alpha=.99`, the weakest eigenvalue is `0.670488` for p-calibration and `0.673632` for e-calibration. The need for `n>=2` is structural: one track observation contains no transition information about `alpha`.

At the more discriminating fixed budget `B=18`:

| alpha | calibration | optimal `(m,n)` | max `lambda_min` |
|---:|:---:|:---:|---:|
| 0.90 | p | (6,12) | 3.746486 |
| 0.90 | e | (2,16) | 8.550158 |
| 0.95 | p | (6,12) | 5.254163 |
| 0.95 | e | (1,17) | 9.731647 |
| 0.99 | p | (6,12) | 6.993926 |
| 0.99 | e | (1,17) | 10.751977 |

For the hard `alpha=.99` fixture, one labeled error trial already supplies `1/[e(1-e)] = 32.8472` Fisher units along `e`, so the optimum spends the other 17 units on transition-bearing track data. Direct p calibration supplies only `1/[p(1-p)] = 6.05861` units per trial; balancing the weakest direction takes six p trials and 12 track observations.

At the two `B=18` optima, inverse-Fisher asymptotic standard deviations in `(p,e,alpha)` coordinates are:

| calibration | SD(p) | SD(e) | SD(alpha) |
|:---:|---:|---:|---:|
| p, `(m,n)=(6,12)` | 0.165859 | 0.338787 | 0.368118 |
| e, `(m,n)=(1,17)` | 0.153985 | 0.174482 | 0.304806 |

The e-calibrated worst-information unit eigenvector is `(-0.02435,-0.03879,+0.99895)`, nearly pure `alpha`: the original p/e confounding has been removed and transition persistence is now the bottleneck. For p calibration it remains mixed: `(-0.25198,-0.60932,+0.75182)`.

## Limiting cases, controls, and uncertainty

- `m=0,n=18,alpha=.99` reproduces Calder's uncalibrated `lambda_min = 8.540830438e-6`.
- `n=0` leaves either calibration matrix rank one, hence `lambda_min=0`: calibration alone cannot estimate all three parameters.
- At the p-calibrated optimum's `n=12`, `m->infinity` gives `7.388667430`, matching the exact known-p principal-submatrix eigenvalue.
- At the e-calibrated optimum's `n=17`, `m->infinity` gives `10.77816637`; `m=10^9` agrees to the printed precision.
- Every enumerated track law normalized within `3e-13`; expected-score norm stayed below `3e-6`.
- Halving every finite-difference step at `n=18,alpha=.99` changed the Fisher matrix by `5.936e-11` relatively.
- The reported standard deviations are local inverse-Fisher approximations, not finite-sample coverage guarantees. Equal trial cost and perfectly labeled calibration are explicit design assumptions.

## Executed output

```text
p=0.791454141712779 e=0.031431985576931 target=0.1 max_total=18
alpha kind first_B m n lambda_min best_at_B18(m,n,lambda_min)
0.90 p  3  1  2 4.613819447e-01 ( 6,12,3.746485729e+00)
0.90 e  3  1  2 6.077794134e-01 ( 2,16,8.550157532e+00)
0.95 p  3  1  2 5.834526034e-01 ( 6,12,5.254163051e+00)
0.95 e  3  1  2 6.406983628e-01 ( 1,17,9.731647461e+00)
0.99 p  3  1  2 6.704876516e-01 ( 6,12,6.993926316e+00)
0.99 e  3  1  2 6.736324052e-01 ( 1,17,1.075197702e+01)
alpha=.99 B=18 allocation_frontier
m n lambda_pcal lambda_ecal
 0 18 8.540830438e-06 8.540830438e-06
 1 17 1.622045032e+00 1.075197702e+01
 2 16 3.108556815e+00 1.009672160e+01
 3 15 4.443419090e+00 9.426806560e+00
 4 14 5.604721816e+00 8.754746674e+00
 5 13 6.543682946e+00 8.081967669e+00
 6 12 6.993926316e+00 7.408860842e+00
 7 11 6.609943496e+00 6.735577155e+00
 8 10 5.997945647e+00 6.062187174e+00
 9  9 5.348676110e+00 5.388728284e+00
10  8 4.688143121e+00 4.715222117e+00
11  7 4.022805503e+00 4.041682024e+00
12  6 3.354977083e+00 3.368116631e+00
13  5 2.685677216e+00 2.694531656e+00
14  4 2.015408936e+00 2.020930816e+00
15  3 1.344417186e+00 1.347316063e+00
16  2 6.727472071e-01 6.736865097e-01
17  1 0.000000000e+00 0.000000000e+00
alpha=.99 B=18 optimum_diagnostics
kind=p m=6 n=12 lambda_min=6.993926316e+00
  asymptotic_sd(p,e,alpha)= 1.658585724e-01 3.387869053e-01 3.681175110e-01
  worst_unit_vector(p,e,alpha)= -2.519842923e-01 -6.093177131e-01 7.518216816e-01
  m_to_infinity_limit=7.388667430e+00 numerical_large_m=7.388667430e+00
kind=e m=1 n=17 lambda_min=1.075197702e+01
  asymptotic_sd(p,e,alpha)= 1.539848154e-01 1.744821066e-01 3.048056407e-01
  worst_unit_vector(p,e,alpha)= -2.434858541e-02 -3.879434106e-02 9.989505220e-01
  m_to_infinity_limit=1.077816637e+01 numerical_large_m=1.077816637e+01
zero_calibration_equals_track=8.540830438e-06
zero_track_calibration_rank=1 lambda_min=0
step_halving_relative_change=5.936e-11
ALL_CHECKS_PASSED
```

## Full executable Python

```python
#!/usr/bin/env python3
"""Exact finite-calibration Fisher allocation for Calder's binary HMM."""

from __future__ import annotations
import itertools
import numpy as np

P = 0.7914541417127793
E = 0.03143198557693108
ALPHAS = (0.90, 0.95, 0.99)
STEP = np.array([2e-6, 2e-6, 2e-6])
TARGET = 0.1
MAX_TOTAL = 18


def sequences(n: int) -> np.ndarray:
    return np.array(list(itertools.product((-1.0, 1.0), repeat=n)))


def probabilities(y: np.ndarray, p: float, e: float, alpha: float) -> np.ndarray:
    pi = np.array([p, 1.0 - p])
    transition = np.array([
        [1.0 - alpha * (1.0 - p), alpha * (1.0 - p)],
        [alpha * p, 1.0 - alpha * p],
    ])
    hidden = np.array([1.0, -1.0])
    forward = pi[None, :] * np.where(y[:, 0, None] == hidden, 1.0 - e, e)
    for k in range(1, y.shape[1]):
        emission = np.where(y[:, k, None] == hidden, 1.0 - e, e)
        forward = (forward @ transition) * emission
    return forward.sum(axis=1)


def track_fisher(n: int, alpha: float, step: np.ndarray = STEP) -> np.ndarray:
    y = sequences(n)
    theta = np.array([P, E, alpha])
    base = probabilities(y, *theta)
    score = np.empty((len(y), 3))
    for j, h in enumerate(step):
        plus, minus = theta.copy(), theta.copy()
        plus[j] += h
        minus[j] -= h
        score[:, j] = (
            np.log(probabilities(y, *plus))
            - np.log(probabilities(y, *minus))
        ) / (2.0 * h)
    assert abs(base.sum() - 1.0) < 3e-13
    assert np.linalg.norm(base @ score) < 3e-6
    return (score.T * base) @ score


def calibration_fisher(m: int, kind: str) -> np.ndarray:
    """m direct Bernoulli trials of hidden sign p or labeled error e."""
    out = np.zeros((3, 3))
    if kind == "p":
        out[0, 0] = m / (P * (1.0 - P))
    elif kind == "e":
        out[1, 1] = m / (E * (1.0 - E))
    else:
        raise ValueError(kind)
    return out


def mineig(matrix: np.ndarray) -> float:
    return float(np.linalg.eigvalsh((matrix + matrix.T) / 2.0)[0])


def best_for_budget(info_by_n: dict[int, np.ndarray], budget: int, kind: str):
    choices = []
    for n in range(1, budget + 1):
        m = budget - n
        value = mineig(info_by_n[n] + calibration_fisher(m, kind))
        choices.append((value, m, n))
    return max(choices)


def first_target(info_by_n: dict[int, np.ndarray], kind: str):
    for budget in range(1, MAX_TOTAL + 1):
        value, m, n = best_for_budget(info_by_n, budget, kind)
        if value >= TARGET:
            return budget, m, n, value
    return None


def main() -> None:
    print(f"p={P:.15f} e={E:.15f} target={TARGET} max_total={MAX_TOTAL}")
    print("alpha kind first_B m n lambda_min best_at_B18(m,n,lambda_min)")
    for alpha in ALPHAS:
        info = {n: track_fisher(n, alpha) for n in range(1, MAX_TOTAL + 1)}
        for kind in ("p", "e"):
            first = first_target(info, kind)
            best18 = best_for_budget(info, MAX_TOTAL, kind)
            assert first is not None
            budget, m, n, value = first
            v18, m18, n18 = best18
            print(f"{alpha:.2f} {kind} {budget:2d} {m:2d} {n:2d} {value:.9e} "
                  f"({m18:2d},{n18:2d},{v18:.9e})")

    info99 = {n: track_fisher(n, 0.99) for n in range(1, MAX_TOTAL + 1)}
    print("alpha=.99 B=18 allocation_frontier")
    print("m n lambda_pcal lambda_ecal")
    for m in range(MAX_TOTAL):
        n = MAX_TOTAL - m
        vp = mineig(info99[n] + calibration_fisher(m, "p"))
        ve = mineig(info99[n] + calibration_fisher(m, "e"))
        print(f"{m:2d} {n:2d} {vp:.9e} {ve:.9e}")

    print("alpha=.99 B=18 optimum_diagnostics")
    for kind in ("p", "e"):
        value, m, n = best_for_budget(info99, MAX_TOTAL, kind)
        total = info99[n] + calibration_fisher(m, kind)
        covariance = np.linalg.inv(total)
        eigenvalues, eigenvectors = np.linalg.eigh((total + total.T) / 2.0)
        worst = eigenvectors[:, 0]
        if worst[np.argmax(np.abs(worst))] < 0:
            worst = -worst
        print(f"kind={kind} m={m} n={n} lambda_min={value:.9e}")
        print("  asymptotic_sd(p,e,alpha)=", *[f"{x:.9e}" for x in np.sqrt(np.diag(covariance))])
        print("  worst_unit_vector(p,e,alpha)=", *[f"{x:.9e}" for x in worst])
        remaining = [1, 2] if kind == "p" else [0, 2]
        exact_limit = mineig(info99[n][np.ix_(remaining, remaining)])
        huge_m = mineig(info99[n] + calibration_fisher(10**9, kind))
        print(f"  m_to_infinity_limit={exact_limit:.9e} numerical_large_m={huge_m:.9e}")

    base = info99[18]
    assert abs(mineig(base + calibration_fisher(0, "p")) - mineig(base)) < 1e-12
    assert mineig(calibration_fisher(18, "p")) == 0.0
    assert mineig(calibration_fisher(18, "e")) == 0.0
    refined = track_fisher(18, 0.99, STEP / 2.0)
    relative = float(np.linalg.norm(base - refined) / np.linalg.norm(refined))
    print(f"zero_calibration_equals_track={mineig(base):.9e}")
    print("zero_track_calibration_rank=1 lambda_min=0")
    print(f"step_halving_relative_change={relative:.3e}")
    assert relative < 2e-8
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```

## Bounded conclusion

Finite calibration does not need to be large to break the near-iid p/e confounding in this stipulated model. Under equal per-trial cost at `alpha=.99` and `B=18`, a single labeled error trial plus 17 track observations is locally optimal and retains 99.76% of the exact-e-calibration weakest eigenvalue for the same `n`. Direct p calibration is less information-dense and optimally uses six of 18 trials. This conclusion is conditional on local Fisher geometry, independent perfect labels, and the stated fixture; it is not a physical validation or a guaranteed finite-sample decision rate.
