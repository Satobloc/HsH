# Calder calculation: external calibration repairs rapid-refresh HMM confounding

**Run key:** `REVROT3-19-20261015:15:s3`  
**Worker lane reconstructed:** Calder's empirical/null-design lane; no authenticated historical Calder participation claimed.  
**Status:** `GEN/DERIVED` exact finite-sequence Fisher calculation in a stipulated binary HMM.  
**Executed:** Python 3 exhaustive enumeration of every sign string for each tested track length.  
**Boundary:** This is not evidence for a physical correspondence process, chirality, or SAT/H(s)H mechanism.

## Question

Aldus's immediate handoff showed that when both hidden correspondence bias \(p\) and sign-error rate \(e\) are unknown, the weakest Fisher-information direction collapses approximately as \((1-\alpha)^4\) as the hidden correspondence refresh probability \(\alpha\to1\). Calder's requested operation was to calibrate either \(p\) or \(e\) externally and quantify the track length needed to keep the weakest remaining information eigenvalue above a declared threshold.

The declared numerical design threshold is

\[
\lambda_{\min}(\mathcal I)\ge 0.1.
\]

This threshold is a design convention in dimensionless parameter coordinates, not a universal statistical standard.

## Model

The observed sign is

\[
d_t=q\,s_tz_t,
\]

with fixed \(q=+1\), hidden \(s_t\in\{-1,+1\}\), stationary

\[
P(s_t=+1)=p,
\]

and independent sign noise

\[
P(z_t=-1)=e.
\]

The hidden sign is retained with probability \(1-\alpha\), or redrawn from stationarity with probability \(\alpha\). Its transition matrix is

\[
T=
\begin{pmatrix}
1-\alpha(1-p)&\alpha(1-p)\\
\alpha p&1-\alpha p
\end{pmatrix}.
\]

The retained fixture is

\[
p=0.7914541417127793,\qquad
e=0.03143198557693108.
\]

For each sequence \(y\in\{-1,+1\}^n\), the exact forward likelihood \(P_\theta(y)\) was evaluated. Central-difference scores form

\[
\mathcal I_{ij}
=\sum_y P_\theta(y)
\frac{\partial\log P_\theta(y)}{\partial\theta_i}
\frac{\partial\log P_\theta(y)}{\partial\theta_j},
\qquad
\theta=(p,e,\alpha).
\]

Three designs were compared:

1. **Uncalibrated:** all three parameters \((p,e,\alpha)\) unknown.
2. **Known \(p\):** external calibration fixes \(p\); infer \((e,\alpha)\).
3. **Known \(e\):** external calibration fixes \(e\); infer \((p,\alpha)\).

The calibrated Fisher matrices are the appropriate principal \(2\times2\) submatrices because the fixed parameter is not estimated.

## Exact result

At \(n=14\):

| \(\alpha\) | uncalibrated \(\lambda_{\min}\) | known \(p\) | known \(e\) |
|---:|---:|---:|---:|
| 0.90 | \(3.752601176\times10^{-2}\) | 6.249365854 | 7.904979602 |
| 0.95 | \(3.259770729\times10^{-3}\) | 7.778462531 | 8.330077178 |
| 0.99 | \(6.405622363\times10^{-6}\) | 8.731550735 | 8.757276315 |

At \(\alpha=0.99\), fixing \(p\) increases the weakest eigenvalue by approximately

\[
\frac{8.731550735}{6.405622363\times10^{-6}}
\approx1.363\times10^6,
\]

while fixing \(e\) gives approximately \(1.367\times10^6\). The near-iid collapse is therefore specifically a \(p/e\) confounding direction; it is not an unavoidable loss of all information about the remaining two parameters.

Across exactly enumerated lengths

\[
n\in\{1,2,3,4,5,6,8,10,12,14,16,18\},
\]

the first tested length satisfying the declared threshold was:

| \(\alpha\) | all three unknown | known \(p\) | known \(e\) |
|---:|---:|---:|---:|
| 0.90 | not reached by 18 | 2 | 2 |
| 0.95 | not reached by 18 | 2 | 2 |
| 0.99 | not reached by 18 | 2 | 2 |

A one-observation track cannot identify \(\alpha\), so all calibrated weakest eigenvalues are zero at \(n=1\). A two-observation track supplies one lag and crosses 0.1 for both calibration choices in all three fixtures.

At \(n=18,\alpha=0.99\), the uncalibrated weakest eigenvalue is only \(8.540830438\times10^{-6}\), while known-\(p\) and known-\(e\) values are 11.41727815 and 11.45179631 respectively.

## Controls and limitations

- Every enumerated law normalized within \(8.9\times10^{-16}\).
- Expected-score norms were at most \(4.4\times10^{-10}\).
- Halving all finite-difference steps at \(n=18,\alpha=.99\) changed the Fisher matrix by \(5.936\times10^{-11}\) relatively.
- Principal-submatrix eigenvalues never fell below the full-model weakest eigenvalue beyond numerical tolerance, as required when a nuisance parameter is fixed.
- The \(\alpha=1\) calculation is printed only as an algebraic boundary diagnostic. Central differences locally extend the transition formula past the stochastic “retention probability” interpretation, so no physical sample-size claim is made at that boundary.
- “Known \(p\)” or “known \(e\)” means exact external calibration. Finite calibration uncertainty would require adding calibration likelihood or prior information; it cannot be inferred from these idealized results.
- Fisher information is local curvature, not a finite-sample error probability.

## Bounded conclusion

Within this stipulated HMM, exact external calibration of either \(p\) or \(e\) eliminates the catastrophic rapid-refresh confounding of the three-unknown model. For the declared local-information threshold, two observations suffice in the calibrated fixtures, whereas the uncalibrated model remains below threshold through \(n=18\). The next useful design calculation is finite-precision calibration: add a calibration sample of size \(m\), form the joint Fisher matrix, and optimize \(m+n\) for a stated variance or decision-error target.

## Executed output

```text
p=0.791454141712779 e=0.031431985576931 target=0.1
alpha n full3 known_p(e,alpha) known_e(p,alpha) normerr scorenorm
0.90  1 -2.220446049e-16 0.000000000e+00 0.000000000e+00 0.0e+00 3.4e-11
0.90  2 -3.843356224e-16 5.493397958e-01 6.125212598e-01 0.0e+00 8.1e-11
0.90  3 3.123122452e-03 1.046597176e+00 1.221011307e+00 0.0e+00 1.1e-10
0.90  4 6.250730857e-03 1.529877079e+00 1.829016206e+00 0.0e+00 1.6e-10
0.90  5 9.378292703e-03 2.007425047e+00 2.436822091e+00 0.0e+00 1.7e-10
0.90  6 1.250583593e-02 2.482078793e+00 3.044522944e+00 0.0e+00 1.8e-10
0.90  8 1.876089682e-02 3.427024195e+00 4.259760110e+00 0.0e+00 2.3e-10
0.90 10 2.501594167e-02 4.369054963e+00 5.474883651e+00 1.1e-16 2.7e-10
0.90 12 3.127097885e-02 5.309627153e+00 6.689948671e+00 0.0e+00 3.1e-10
0.90 14 3.752601176e-02 6.249365854e+00 7.904979602e+00 2.2e-16 3.6e-10
0.90 16 4.378104206e-02 7.188583743e+00 9.119988938e+00 1.1e-16 4.0e-10
0.90 18 5.003607063e-02 8.127454529e+00 1.033498373e+01 1.1e-16 4.4e-10
0.95  1 -2.220446049e-16 0.000000000e+00 0.000000000e+00 0.0e+00 3.4e-11
0.95  2 -1.879509319e-15 6.230689493e-01 6.420058610e-01 0.0e+00 5.5e-11
0.95  3 2.715600420e-04 1.228656722e+00 1.282884801e+00 0.0e+00 6.0e-11
0.95  4 5.432291487e-04 1.828723426e+00 1.923635689e+00 0.0e+00 5.5e-11
0.95  5 8.148894524e-04 2.426322025e+00 2.564333941e+00 2.2e-16 8.7e-11
0.95  6 1.086546219e-03 3.022607561e+00 3.205004806e+00 2.2e-16 1.1e-10
0.95  8 1.629855179e-03 4.213115826e+00 4.486304160e+00 2.2e-16 1.0e-10
0.95 10 2.173161416e-03 5.402197574e+00 5.767574548e+00 4.4e-16 1.2e-10
0.95 12 2.716466409e-03 6.590544184e+00 7.048830146e+00 4.4e-16 1.2e-10
0.95 14 3.259770729e-03 7.778462531e+00 8.330077178e+00 6.7e-16 1.3e-10
0.95 16 3.803074645e-03 8.966109595e+00 9.611318804e+00 6.7e-16 1.5e-10
0.95 18 4.346378300e-03 1.015357400e+01 1.089255680e+01 8.9e-16 1.7e-10
0.99  1 -2.220446049e-16 0.000000000e+00 0.000000000e+00 0.0e+00 3.4e-11
0.99  2 -1.611581032e-15 6.728294160e-01 6.736900123e-01 2.2e-16 4.3e-11
0.99  3 5.337941146e-07 1.344849312e+00 1.347330857e+00 2.2e-16 8.1e-11
0.99  4 1.067598747e-06 2.016602268e+00 2.020966338e+00 2.2e-16 9.4e-11
0.99  5 1.601402056e-06 2.688232322e+00 2.694599588e+00 2.2e-16 1.3e-10
0.99  6 2.135204828e-06 3.359795682e+00 3.368231688e+00 2.2e-16 1.3e-10
0.99  8 3.202809625e-06 4.702815825e+00 4.715494130e+00 4.4e-16 1.9e-10
0.99 10 4.270413998e-06 6.045761161e+00 6.062755379e+00 4.4e-16 2.1e-10
0.99 12 5.338018213e-06 7.388667430e+00 7.410016021e+00 6.7e-16 2.4e-10
0.99 14 6.405622363e-06 8.731550735e+00 8.757276315e+00 6.7e-16 2.7e-10
0.99 16 7.473226440e-06 1.007441940e+01 1.010453639e+01 8.9e-16 3.1e-10
0.99 18 8.540830438e-06 1.141727815e+01 1.145179631e+01 8.9e-16 3.5e-10
first_tested_n_meeting_target
alpha=0.90 full3=None
alpha=0.90 known_p=2
alpha=0.90 known_e=2
alpha=0.95 full3=None
alpha=0.95 known_p=2
alpha=0.95 known_e=2
alpha=0.99 full3=None
alpha=0.99 known_p=2
alpha=0.99 known_e=2
alpha1_n14_full_eigs -2.813194122e-12 8.878819727e+00 9.721892451e+01
alpha1_n14_known_p_eigs 8.878819727e+00 2.712075886e+01
alpha1_n14_known_e_eigs 8.878819727e+00 7.009816565e+01
step_halving_relative_change=5.936e-11
ALL_CHECKS_PASSED
```

## Full executable Python

```python
#!/usr/bin/env python3
"""Exact Fisher-information effect of calibrating p or e in a binary HMM."""

from __future__ import annotations
import itertools
import numpy as np

P = 0.7914541417127793
E = 0.03143198557693108
ALPHAS = (0.90, 0.95, 0.99)
LENGTHS = (1, 2, 3, 4, 5, 6, 8, 10, 12, 14, 16, 18)
STEP = np.array([2e-6, 2e-6, 2e-6])
TARGET = 0.1


def sequences(n: int) -> np.ndarray:
    return np.array(list(itertools.product((-1., 1.), repeat=n)))


def probabilities(y: np.ndarray, p: float, e: float, alpha: float) -> np.ndarray:
    pi = np.array([p, 1-p])
    t = np.array([[1-alpha*(1-p), alpha*(1-p)],
                  [alpha*p, 1-alpha*p]])
    hidden = np.array([1., -1.])
    f = pi[None, :] * np.where(y[:, 0, None] == hidden, 1-e, e)
    for k in range(1, y.shape[1]):
        emission = np.where(y[:, k, None] == hidden, 1-e, e)
        f = (f @ t) * emission
    return f.sum(axis=1)


def fisher(n: int, alpha: float, steps: np.ndarray = STEP) -> tuple[np.ndarray, float, float]:
    y = sequences(n)
    theta = np.array([P, E, alpha])
    base = probabilities(y, *theta)
    score = np.empty((len(y), 3))
    for j, h in enumerate(steps):
        plus, minus = theta.copy(), theta.copy()
        plus[j] += h
        minus[j] -= h
        score[:, j] = (
            np.log(probabilities(y, *plus))
            - np.log(probabilities(y, *minus))
        ) / (2*h)
    info = (score.T * base) @ score
    return info, abs(base.sum()-1), float(np.linalg.norm(base @ score))


def mineig(m: np.ndarray) -> float:
    return float(np.linalg.eigvalsh((m+m.T)/2)[0])


def main() -> None:
    print(f"p={P:.15f} e={E:.15f} target={TARGET}")
    print("alpha n full3 known_p(e,alpha) known_e(p,alpha) normerr scorenorm")
    records = {}
    for alpha in ALPHAS:
        records[alpha] = []
        for n in LENGTHS:
            info, normerr, scorenorm = fisher(n, alpha)
            full = mineig(info)
            known_p = mineig(info[np.ix_([1,2],[1,2])])
            known_e = mineig(info[np.ix_([0,2],[0,2])])
            records[alpha].append((n, full, known_p, known_e))
            print(f"{alpha:.2f} {n:2d} {full:.9e} {known_p:.9e} "
                  f"{known_e:.9e} {normerr:.1e} {scorenorm:.1e}")
            assert normerr < 3e-13
            assert scorenorm < 3e-6
            assert known_p >= full - 2e-8
            assert known_e >= full - 2e-8

    print("first_tested_n_meeting_target")
    for alpha, rows in records.items():
        for label, col in (("full3",1),("known_p",2),("known_e",3)):
            hit = next((row[0] for row in rows if row[col] >= TARGET), None)
            print(f"alpha={alpha:.2f} {label}={hit}")

    # At alpha=1 the iid law depends only on ab; calibration of either p or e
    # leaves the remaining marginal parameter identifiable, while alpha's
    # boundary score supplies no stable interior persistence estimate.
    info1, _, _ = fisher(14, 1.0)
    print("alpha1_n14_full_eigs", *[f"{x:.9e}" for x in np.linalg.eigvalsh(info1)])
    print("alpha1_n14_known_p_eigs", *[f"{x:.9e}" for x in np.linalg.eigvalsh(info1[np.ix_([1,2],[1,2])])])
    print("alpha1_n14_known_e_eigs", *[f"{x:.9e}" for x in np.linalg.eigvalsh(info1[np.ix_([0,2],[0,2])])])

    # Step-halving control at the hardest tested point.
    baseline = fisher(18, .99)[0]
    refined = fisher(18, .99, STEP/2)[0]
    rel = float(np.linalg.norm(baseline-refined)/np.linalg.norm(refined))
    print(f"step_halving_relative_change={rel:.3e}")
    assert rel < 2e-8
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()
```
