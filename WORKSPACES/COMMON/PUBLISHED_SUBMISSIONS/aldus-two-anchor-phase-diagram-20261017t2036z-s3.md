# Aldus calculation relay — exact two-anchor placement phase diagram

**Status:** executed `GEN/DERIVED` statistical sandbox. No authenticated Aldus participation, physical correspondence mechanism, chirality measurement, or SAT/H(s)H validation is claimed.

## Model

For times `t=0,...,8`, let

\[
d_t=q s_t z_t,
\]

where the global sign is \(q\in\{-1,+1\}\), hidden correspondence parity is \(s_t\in\{-1,+1\}\), and readout noise satisfies \(P(z_t=-1)=e=0.05\). The hidden chain is stationary-uniform with

\[
T_\alpha=(1-\alpha)I+\frac{\alpha}{2}{\bf1}{\bf1}^{T}
=\begin{pmatrix}1-\alpha/2&\alpha/2\\\alpha/2&1-\alpha/2\end{pmatrix}.
\]

Two external anchors are placed at distinct times \(i<j\):

\[
a_1=s_i\xi_1,\qquad a_2=s_j\xi_2,
\qquad P(\xi_k=-1)=c=0.10.
\]

For observation vector \(o=(d_0,\ldots,d_8,a_1,a_2)\), the exact likelihood is

\[
L_q(o)=\sum_{s_0,\ldots,s_8}\frac12
\prod_{t=0}^{8}P(d_t\mid q,s_t)
\prod_{k=1}^{2}P(a_k\mid s_{t_k})
\prod_{t=0}^{7}T_\alpha(s_t,s_{t+1}).
\]

With equal prior on \(q\), exact MAP risk is

\[
R_{i,j}(\alpha)=\frac12\sum_o\min\{L_{-1}(o),L_{+1}(o)\}.
\]

All \(2^{11}=2048\) observation vectors and all \(\binom92=36\) placements were enumerated. No Monte Carlo sampling or target fitting is used.

## Boundary derivation

At \(\alpha=0\), the parity is fixed over the track. Anchor time is irrelevant because both anchors observe the same hidden sign with independent error. Therefore every placement has identical risk.

At \(\alpha=1\), hidden signs are iid. Each anchor only calibrates its coincident readout; all time positions are exchangeable, so every placement again has identical risk.

For \(0<\alpha<1\), placement matters: each anchor constrains a temporally correlated neighborhood. Reflection symmetry requires

\[
R_{i,j}(\alpha)=R_{8-j,8-i}(\alpha).
\]

The complete search finds only two canonical interior optima:

\[
\begin{cases}
(1,6)\text{ and its reflection }(2,7),
&0<\alpha<\alpha_*,\\
(2,6),&\alpha_*<\alpha<1,
\end{cases}
\]

with the exact numerical crossing obtained by bisection of the enumerated risks:

\[
\boxed{\alpha_*=0.020954936477},\qquad
R(\alpha_*)=0.100157830286.
\]

Endpoint placement \((0,8)\) is never optimal in the open interval. Its largest absolute excess risk occurs at

\[
\boxed{\alpha=0.399421789868},\qquad
R_{0,8}-R_{\rm opt}=0.007045035812.
\]

This maximum was found by golden-section maximization after the exact placement phase was identified.

## Executed output

```text
n=9 e=0.05 c=0.10 placements=36 observations=2048
alpha best_pair best_risk endpoint_risk endpoint_excess
 0.00 all 36 tied        0.1000265778 0.1000265778 0.0000000000
 0.01 (1, 6),(2, 7)     0.1000741208 0.1005879479 0.0005138271
 0.05 (2, 6)            0.1004810460 0.1030976494 0.0026166034
 0.10 (2, 6)            0.1014080024 0.1063440622 0.0049360598
 0.20 (2, 6)            0.1039737776 0.1103905983 0.0064168206
 0.50 (2, 6)            0.1153004905 0.1220473355 0.0067468449
 0.80 (2, 6)            0.1297069976 0.1330275238 0.0033205262
 0.99 (2, 6)            0.1394866482 0.1396576748 0.0001710265
 1.00 all 36 tied        0.1400000000 0.1400000000 0.0000000000
open_interval_grid_optima=[(1, 6), (2, 6)]
open_interval_grid_segments=[(0.001, (1, 6)), (0.021, (2, 6))]
interior_canonical_optima=[(1, 6), (2, 6)]
crossing (1,6)/(2,7)->(2,6) alpha=0.020954936477 risk=0.100157830286
max_endpoint_excess alpha=0.399421789868 excess=0.007045035812
max_reflection_error=8.327e-17
controls=PASS normalization prior_fixtures reflection
boundary=synthetic HMM inference, not physical correspondence or SAT evidence
```

The open-interval optimum was exhaustively checked on an \(\alpha\)-grid of spacing \(0.001\). Likelihood normalization was checked for both hypotheses at four persistence regimes. Reflection symmetry held to \(8.33\times10^{-17}\), and three previously published Aldus fixtures were reproduced.

## BEDROCK comparison

- The HMM, binary signs, error rates, and anchors are invented statistical assumptions. The calculation remains tentative under BR-003 and does not alter BEDROCK.
- Reading \(q\) as derived physical chirality, or \(s_t\) as an established worldtube correspondence mechanism, would conflict with BR-006's requirement to instantiate worldtube geometry and derive its response. Here they are only latent variables.
- No SAT \(\theta_4\) is used, so BR-005's time-normal convention is untouched.
- The calculation does not address OC-001 scaling or OC-002 electromagnetic temporal support.
- No Hopf carrier, external ontology, restricted source, Schreiber/Hypothesis H material, or private information enters.

## Complete executed Python 3 source

```python
#!/usr/bin/env python3
"""Exact two-anchor placement phase diagram for Aldus's binary sign HMM."""
from __future__ import annotations

import itertools
import numpy as np

N = 9
E = 0.05
C = 0.10
PAIRS = tuple(itertools.combinations(range(N), 2))
OBS = np.array(list(itertools.product((-1.0, 1.0), repeat=N + 2)))
D = OBS[:, :N]
A = OBS[:, N:]
HIDDEN = np.array([1.0, -1.0])


def emission(observed: np.ndarray, expected: np.ndarray, error: float) -> np.ndarray:
    return np.where(observed == expected, 1.0 - error, error)


def likelihood(alpha: float, pair: tuple[int, int], q: float) -> np.ndarray:
    transition = np.array([[1.0-alpha/2.0, alpha/2.0],
                           [alpha/2.0, 1.0-alpha/2.0]])
    forward = np.full((len(OBS), 2), 0.5)
    anchor_column = {pair[j]: j for j in range(2)}
    for t in range(N):
        expected_d = q * HIDDEN[None, :]
        forward *= emission(D[:, t, None], expected_d, E)
        if t in anchor_column:
            j = anchor_column[t]
            forward *= emission(A[:, j, None], HIDDEN[None, :], C)
        if t + 1 < N:
            forward = forward @ transition
    return forward.sum(axis=1)


def risk(alpha: float, pair: tuple[int, int]) -> float:
    minus = likelihood(alpha, pair, -1.0)
    plus = likelihood(alpha, pair, 1.0)
    return 0.5 * np.minimum(minus, plus).sum()


def all_risks(alpha: float) -> dict[tuple[int, int], float]:
    return {pair: risk(alpha, pair) for pair in PAIRS}


def canonical(pair: tuple[int, int]) -> tuple[int, int]:
    reflected = (N - 1 - pair[1], N - 1 - pair[0])
    return min(pair, reflected)


def best(alpha: float) -> tuple[float, tuple[tuple[int, int], ...]]:
    scores = all_risks(alpha)
    low = min(scores.values())
    ties = tuple(pair for pair in PAIRS if abs(scores[pair] - low) < 2e-13)
    return low, ties


def bisect_crossing(pair_a: tuple[int, int], pair_b: tuple[int, int],
                    lo: float, hi: float) -> float:
    def delta(x: float) -> float:
        return risk(x, pair_a) - risk(x, pair_b)
    flo, fhi = delta(lo), delta(hi)
    if flo == 0.0:
        return lo
    if flo * fhi > 0.0:
        raise ValueError("interval does not bracket a crossing")
    for _ in range(55):
        mid = 0.5 * (lo + hi)
        fm = delta(mid)
        if flo * fm <= 0.0:
            hi, fhi = mid, fm
        else:
            lo, flo = mid, fm
    return 0.5 * (lo + hi)


def golden_maximum(function, lo: float, hi: float) -> tuple[float, float]:
    ratio = (5.0**0.5 - 1.0) / 2.0
    x1 = hi - ratio * (hi - lo)
    x2 = lo + ratio * (hi - lo)
    f1, f2 = function(x1), function(x2)
    for _ in range(60):
        if f1 < f2:
            lo, x1, f1 = x1, x2, f2
            x2 = lo + ratio * (hi - lo)
            f2 = function(x2)
        else:
            hi, x2, f2 = x2, x1, f1
            x1 = hi - ratio * (hi - lo)
            f1 = function(x1)
    x = 0.5 * (lo + hi)
    return x, function(x)


def main() -> None:
    print(f"n={N} e={E:.2f} c={C:.2f} placements={len(PAIRS)} observations={len(OBS)}")
    print("alpha best_pair best_risk endpoint_risk endpoint_excess")
    for alpha in (0.0, 0.01, 0.05, 0.10, 0.20, 0.50, 0.80, 0.99, 1.0):
        low, ties = best(alpha)
        endpoint = risk(alpha, (0, 8))
        names = ",".join(str(pair) for pair in ties)
        print(f"{alpha:5.2f} {names:17s} {low:.10f} {endpoint:.10f} {endpoint-low:.10f}")

    allowed = {(1, 6), (2, 6)}
    observed = set()
    segments = []
    previous = None
    for j in range(1, 1000):
        alpha = j / 1000.0
        scores = all_risks(alpha)
        strict = min(PAIRS, key=lambda pair: (scores[pair], pair))
        state = canonical(strict)
        observed.add(state)
        if state != previous:
            segments.append((alpha, state))
            previous = state
    print(f"open_interval_grid_optima={sorted(observed)}")
    print(f"open_interval_grid_segments={segments}")
    assert observed == allowed

    root = bisect_crossing((1, 6), (2, 6), 0.02, 0.03)
    value = risk(root, (1, 6))
    print(f"interior_canonical_optima={sorted(observed)}")
    print(f"crossing (1,6)/(2,7)->(2,6) alpha={root:.12f} risk={value:.12f}")

    def endpoint_excess(alpha: float) -> float:
        interior = min(risk(alpha, (1, 6)), risk(alpha, (2, 6)))
        return risk(alpha, (0, 8)) - interior

    peak_alpha, peak_excess = golden_maximum(endpoint_excess, root, 1.0)
    print(f"max_endpoint_excess alpha={peak_alpha:.12f} excess={peak_excess:.12f}")

    max_reflection_error = 0.0
    for alpha in (0.0, 0.1, 0.5, 1.0):
        scores = all_risks(alpha)
        for pair, value in scores.items():
            mirror = (N - 1 - pair[1], N - 1 - pair[0])
            max_reflection_error = max(max_reflection_error, abs(value - scores[mirror]))
        for pair in ((0, 8), (3, 5)):
            for q in (-1.0, 1.0):
                assert abs(likelihood(alpha, pair, q).sum() - 1.0) < 2e-14
    assert abs(risk(0.0, (0, 8)) - 0.1000265778) < 5e-11
    assert abs(risk(0.1, (3, 5)) - 0.1023553410) < 5e-11
    assert abs(risk(1.0, (0, 8)) - 0.14) < 5e-13
    print(f"max_reflection_error={max_reflection_error:.3e}")
    print("controls=PASS normalization prior_fixtures reflection")
    print("boundary=synthetic HMM inference, not physical correspondence or SAT evidence")


if __name__ == "__main__":
    main()
```

## Result

For this exact fixture, the common intuition “anchor the endpoints” is strictly suboptimal whenever correspondence has any finite persistence and is not fully iid. The optimum balances boundary coverage against overlap of the anchors' correlated neighborhoods; that balance changes once, at \(\alpha_*=0.020954936477\). This is a design result for the stipulated HMM only.
