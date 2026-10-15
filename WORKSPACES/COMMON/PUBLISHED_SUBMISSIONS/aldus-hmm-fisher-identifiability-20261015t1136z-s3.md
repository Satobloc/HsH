# Aldus sandbox: exact HMM information collapse versus three-moment inversion

Run: REVROT3-19-20261015:11:s3

Status: executed GEN/DERIVED statistical calculation, source-grounded in Aldus's current parity/correspondence sandbox. No authenticated Aldus participation is claimed.

Boundary: this audits identifiability in a stipulated binary hidden-Markov model. It is not empirical evidence for SAT/H(s)H, physical chirality, a correspondence mechanism, or an orientation measurement.

## Starting model

Aldus's checkpoint reduces the four-dimensional landmark experiment to

\[
d_t=q\,s_tz_t,
\]

where \(q\in\{-1,+1\}\) is a fixed global orientation sign; \(s_t\) is a hidden correspondence parity with stationary probability \(\Pr(s_t=+1)=p>1/2\); the prior hidden sign is retained with probability \(1-\alpha\) or redrawn from stationarity with probability \(\alpha\); and independent sign noise obeys \(\Pr(z_t=-1)=e<1/2\).

Set

\[
a=2p-1,\qquad b=1-2e,\qquad \rho=1-\alpha.
\]

The hidden transition matrix, ordered \(+1,-1\), is

\[
T=\begin{pmatrix}
1-\alpha(1-p)&\alpha(1-p)\\
\alpha p&1-\alpha p
\end{pmatrix}.
\]

The earlier moment calculation gives

\[
m=E[d_t]=qab,
\qquad
K_k=E[d_td_{t+k}]
=m^2+b^2(1-a^2)\rho^k,\quad k\geq1.
\]

The prior checkpoint inverted \((m,K_1,K_2)\) in the interior but found severe numerical failure as \(\alpha\to1\). This calculation tests whether that is merely a weakness of moment inversion or a genuine information loss in the complete sequence likelihood. For continuous-parameter information, \(q=+1\) can be fixed without loss: changing \(q\) flips every observed sign but leaves the Fisher spectrum for \((p,e,\alpha)\) unchanged.

## Exact moment-map singularity

Let \(F(p,e,\alpha)=(m,K_1,K_2)\) and \(V=b^2(1-a^2)\), so

\[
K_1=m^2+V\rho,\qquad K_2=m^2+V\rho^2.
\]

In coordinates \((a,b,\rho)\), subtracting \(2m\,dm\) from the differentials of \(K_1,K_2\) leaves rows proportional to \(d(V\rho)\) and \(d(V\rho^2)\). Replacing the third row by itself minus \(\rho\) times the second gives

\[
\det\frac{\partial(m,K_1,K_2)}{\partial(a,b,\rho)}
=2\rho^2b^4(1-a^2).
\]

Since

\[
\det\frac{\partial(a,b,\rho)}{\partial(p,e,\alpha)}
=2(-2)(-1)=4,
\]

\[
\boxed{
\det\frac{\partial(m,K_1,K_2)}{\partial(p,e,\alpha)}
=8\rho^2b^4(1-a^2)
}.
\]

The moment map necessarily loses rank at \(\rho=0\) (\(\alpha=1\)), \(b=0\) (\(e=1/2\)), or \(|a|=1\) (\(p=0\) or \(1\)). Near \(\rho=0\), its determinant collapses exactly as \(\rho^2\).

## Exact full-sequence Fisher information

For an observed sign string \(y=(d_1,\ldots,d_n)\), the exact HMM likelihood follows from

\[
f_1(s)=\pi(s)P(d_1\mid s),
\]

\[
f_t(s)=P(d_t\mid s)\sum_{s'}f_{t-1}(s')T_{s's},
\qquad
P_\theta(y)=\sum_s f_n(s),
\]

with \(\theta=(p,e,\alpha)\), \(\pi=(p,1-p)\), and emission probability \(1-e\) when \(d_t=s_t\), otherwise \(e\).

For \(n=14\), all \(2^{14}=16{,}384\) strings were enumerated. The expected Fisher matrix was calculated as

\[
\mathcal I_{ij}(\theta)
=\sum_yP_\theta(y)
\frac{\partial\log P_\theta(y)}{\partial\theta_i}
\frac{\partial\log P_\theta(y)}{\partial\theta_j},
\]

using centered finite-difference scores with step \(2\times10^{-6}\). The fixture retains

\[
p=0.7914541417127793,\qquad
e=0.03143198557693108.
\]

## Executed results

~~~text
exact_sequence_count=16384 n=14
alpha fisher_eigenvalues fisher_condition moment_singular_values moment_condition
0.02 [6.724363e+00,1.649265e+02,4.346684e+02] 6.464082e+01 [5.479928e+00,1.826174e+00,3.909517e-01] 1.401689e+01
  probability_sum_error=1.110e-16 mean_score_norm=2.049e-08
0.10 [9.525167e+00,3.029584e+01,3.588134e+02] 3.767004e+01 [5.135044e+00,1.728796e+00,3.716934e-01] 1.381527e+01
  probability_sum_error=1.110e-16 mean_score_norm=1.332e-08
0.50 [2.444601e+00,2.336813e+01,1.215505e+02] 4.972201e+01 [4.189753e+00,1.111905e+00,2.186108e-01] 1.916535e+01
  probability_sum_error=0.000e+00 mean_score_norm=1.756e-09
0.90 [3.752601e-02,9.977297e+00,8.616061e+01] 2.296024e+03 [4.060645e+00,4.881644e-01,2.055071e-02] 1.975915e+02
  probability_sum_error=2.220e-16 mean_score_norm=3.596e-10
0.95 [3.259771e-03,8.890787e+00,9.080639e+01] 2.785668e+04 [4.067868e+00,4.596184e-01,5.447078e-03] 7.467981e+02
  probability_sum_error=6.661e-16 mean_score_norm=1.317e-10
0.99 [6.405622e-06,8.781046e+00,9.577238e+01] 1.495130e+07 [4.075126e+00,4.608524e-01,2.169127e-04] 1.878694e+04
  probability_sum_error=6.661e-16 mean_score_norm=2.726e-10
collapse_power rho=0.10->0.05 fisher_min=3.525049 moment_smin=1.915633
collapse_power rho=0.05->0.01 fisher_min=3.872306 moment_smin=2.002774
fisher_step_halving_relative_change=2.997e-11
moment_jacobian_max_abs_error=1.222e-10
alpha=1 boundary fisher_eigenvalues=[-2.814804e-12,8.878820e+00,9.721892e+01] condition=inf
alpha=1 boundary moment_singular_values=[4.077100e+00,4.649182e-01,2.963769e-16] condition=inf
p->1 negative_control fisher_eigenvalues=[6.915380e-07,4.598392e+02,5.175715e+06] condition=inf
ALL_CHECKS_PASSED
~~~

## Interpretation and controls

The full likelihood does not rescue stable three-parameter inference as \(\alpha\to1\). Its smallest information eigenvalue falls from \(3.752601\times10^{-2}\) at \(\rho=0.10\) to \(6.405622\times10^{-6}\) at \(\rho=0.01\), while its condition number grows from \(2.30\times10^3\) to \(1.50\times10^7\).

The local collapse powers approach

\[
\lambda_{\min}(\mathcal I)\propto\rho^4,
\qquad
\sigma_{\min}(J_F)\propto\rho^2.
\]

This is the expected quadratic relationship between sensitivity and information. Therefore the earlier \(\alpha=0.95\) inversion failures are not merely an algebraic defect: they reflect genuine near-confounding of \(p\) and \(e\) in the complete distribution.

At \(\alpha=1\), observations are iid with

\[
\Pr(d_t=+1)=\frac{1+ab}{2}.
\]

Only \(ab\) is identifiable from marginal signs. The Fisher matrix has one roundoff-scale eigenvalue, \(-2.81\times10^{-12}\), and the moment Jacobian has smallest singular value \(2.96\times10^{-16}\). A second Fisher direction describes departure from the iid boundary through serial correlation; it does not separate \(p\) from \(e\) at the boundary.

Controls:

- every enumerated probability table sums to one within \(6.67\times10^{-16}\);
- expected score norms are at most \(2.05\times10^{-8}\);
- halving the score step changes the \(\alpha=0.95\) Fisher matrix by \(2.997\times10^{-11}\) relatively;
- analytic and finite-difference moment Jacobians agree within \(1.222\times10^{-10}\);
- exact \(\alpha=1\) and \(p\to1\) controls show the predicted rank loss.

## Bounded conclusion

Within this stipulated HMM, the complete sequence likelihood confirms rather than repairs rapid-refresh nonidentifiability. Near \(\alpha=1\), distinguishing hidden correspondence bias \(p\) from sign reliability \(e\) depends on vanishingly small serial correlations; for a fixed track length, the weakest full-likelihood direction collapses approximately as \((1-\alpha)^4\).

A numerically successful interior inversion is therefore unsafe without a Fisher-spectrum or equivalent conditioning check. External calibration of either \(p\) or \(e\), or an acquisition protocol deliberately preserving correspondence persistence, is needed near the iid boundary.

This does not validate the underlying landmark model, physical orientation, correspondence process, or any SAT/H(s)H mechanism.

## Full executable Python 3 source

~~~python
#!/usr/bin/env python3
"""Exact finite-track information audit for Aldus's sign HMM.

The binary observations are d_t = q s_t z_t.  Here q=+1 is fixed because the
continuous-parameter information is the same for either global orientation.
The hidden sign s_t has stationary P(s=+1)=p and is retained with probability
1-alpha or redrawn from stationarity with probability alpha.  Independent
sign noise has P(z=-1)=e.

This script:
  1. enumerates all 2^n observation strings;
  2. calculates their exact HMM probabilities;
  3. forms the expected Fisher information from central-difference scores;
  4. compares it with the Jacobian of the moment map (m,K1,K2);
  5. checks normalization, score centering, derivative convergence, and the
     analytic moment Jacobian against finite differences.
"""

from __future__ import annotations

import itertools
import math
import numpy as np


def all_sequences(n: int) -> np.ndarray:
    return np.array(list(itertools.product((-1.0, 1.0), repeat=n)))


def sequence_probabilities(
    sequences: np.ndarray, p: float, e: float, alpha: float
) -> np.ndarray:
    """Vectorized normalized forward algorithm for every observation string."""
    pi = np.array([p, 1.0 - p])  # hidden states +1,-1
    transition = np.array([
        [1.0 - alpha * (1.0 - p), alpha * (1.0 - p)],
        [alpha * p, 1.0 - alpha * p],
    ])
    hidden = np.array([1.0, -1.0])
    first = sequences[:, 0, None]
    emission = np.where(first == hidden[None, :], 1.0 - e, e)
    forward = pi[None, :] * emission
    for t in range(1, sequences.shape[1]):
        obs = sequences[:, t, None]
        emission = np.where(obs == hidden[None, :], 1.0 - e, e)
        forward = (forward @ transition) * emission
    return forward.sum(axis=1)


def scores_central(
    sequences: np.ndarray,
    theta: np.ndarray,
    steps: np.ndarray,
) -> tuple[np.ndarray, np.ndarray]:
    base = sequence_probabilities(sequences, *theta)
    scores = np.empty((len(base), 3))
    for j, h in enumerate(steps):
        plus = theta.copy()
        minus = theta.copy()
        plus[j] += h
        minus[j] -= h
        lp = np.log(sequence_probabilities(sequences, *plus))
        lm = np.log(sequence_probabilities(sequences, *minus))
        scores[:, j] = (lp - lm) / (2.0 * h)
    return base, scores


def fisher_exact(
    sequences: np.ndarray,
    theta: np.ndarray,
    steps: np.ndarray,
) -> tuple[np.ndarray, np.ndarray]:
    probs, scores = scores_central(sequences, theta, steps)
    fisher = (scores.T * probs) @ scores
    mean_score = probs @ scores
    return fisher, mean_score


def moment_map(theta: np.ndarray) -> np.ndarray:
    p, e, alpha = theta
    a = 2.0 * p - 1.0
    b = 1.0 - 2.0 * e
    rho = 1.0 - alpha
    m = a * b
    variance_amplitude = b * b * (1.0 - a * a)
    k1 = m * m + variance_amplitude * rho
    k2 = m * m + variance_amplitude * rho * rho
    return np.array([m, k1, k2])


def moment_jacobian(theta: np.ndarray) -> np.ndarray:
    """Analytic d(m,K1,K2)/d(p,e,alpha)."""
    p, e, alpha = theta
    a = 2.0 * p - 1.0
    b = 1.0 - 2.0 * e
    rho = 1.0 - alpha
    dm = np.array([2.0 * b, -2.0 * a, 0.0])
    # V=b^2(1-a^2)
    d_v = np.array([
        -4.0 * a * b * b,
        -4.0 * b * (1.0 - a * a),
        0.0,
    ])
    d_rho = np.array([0.0, 0.0, -1.0])
    d_k1 = 2.0 * (a * b) * dm + rho * d_v
    d_k1 += b * b * (1.0 - a * a) * d_rho
    d_k2 = 2.0 * (a * b) * dm + rho * rho * d_v
    d_k2 += 2.0 * rho * b * b * (1.0 - a * a) * d_rho
    return np.vstack((dm, d_k1, d_k2))


def finite_difference_jacobian(theta: np.ndarray, h: float = 1.0e-6):
    columns = []
    for j in range(3):
        plus, minus = theta.copy(), theta.copy()
        plus[j] += h
        minus[j] -= h
        columns.append((moment_map(plus) - moment_map(minus)) / (2.0 * h))
    return np.column_stack(columns)


def spectrum(matrix: np.ndarray) -> tuple[np.ndarray, float]:
    values = np.linalg.eigvalsh(0.5 * (matrix + matrix.T))
    positive = values[values > 1.0e-10 * max(1.0, values[-1])]
    rank = len(positive)
    condition = math.inf if rank < matrix.shape[0] else values[-1] / values[0]
    return values, condition


def singular_spectrum(matrix: np.ndarray) -> tuple[np.ndarray, float]:
    values = np.linalg.svd(matrix, compute_uv=False)
    condition = math.inf if values[-1] < 1.0e-12 * values[0] else values[0] / values[-1]
    return values, condition


def fmt_condition(value: float) -> str:
    return "inf" if not math.isfinite(value) else f"{value:.6e}"


def main() -> None:
    n = 14
    sequences = all_sequences(n)
    p = 0.7914541417127793
    e = 0.03143198557693108
    steps = np.array([2.0e-6, 2.0e-6, 2.0e-6])
    alphas = (0.02, 0.10, 0.50, 0.90, 0.95, 0.99)

    print(f"exact_sequence_count={len(sequences)} n={n}")
    print(
        "alpha fisher_eigenvalues "
        "fisher_condition moment_singular_values moment_condition"
    )
    records = []
    for alpha in alphas:
        theta = np.array([p, e, alpha])
        fisher, mean_score = fisher_exact(sequences, theta, steps)
        fvals, fcond = spectrum(fisher)
        jac = moment_jacobian(theta)
        svals, jcond = singular_spectrum(jac)
        probs = sequence_probabilities(sequences, *theta)
        records.append((alpha, fvals, fcond, svals, jcond))
        score_norm = float(np.linalg.norm(mean_score))
        print(
            f"{alpha:.2f} "
            f"[{fvals[0]:.6e},{fvals[1]:.6e},{fvals[2]:.6e}] "
            f"{fmt_condition(fcond)} "
            f"[{svals[0]:.6e},{svals[1]:.6e},{svals[2]:.6e}] "
            f"{fmt_condition(jcond)}"
        )
        assert abs(probs.sum() - 1.0) < 2.0e-13
        print(f"  probability_sum_error={abs(probs.sum()-1.0):.3e} "
              f"mean_score_norm={score_norm:.3e}")
        assert score_norm < 2.0e-6

    # Local collapse exponents as rho=1-alpha tends to zero.
    tail = records[-3:]
    for left, right in zip(tail[:-1], tail[1:]):
        rho_l, rho_r = 1.0 - left[0], 1.0 - right[0]
        fisher_power = math.log(left[1][0] / right[1][0]) / math.log(rho_l / rho_r)
        moment_power = math.log(left[3][-1] / right[3][-1]) / math.log(rho_l / rho_r)
        print(
            f"collapse_power rho={rho_l:.2f}->{rho_r:.2f} "
            f"fisher_min={fisher_power:.6f} moment_smin={moment_power:.6f}"
        )

    # Central-difference convergence at the difficult alpha=0.95 fixture.
    theta = np.array([p, e, 0.95])
    f1, _ = fisher_exact(sequences, theta, steps)
    f2, _ = fisher_exact(sequences, theta, steps / 2.0)
    relative_step_change = np.linalg.norm(f1 - f2) / np.linalg.norm(f2)
    print(f"fisher_step_halving_relative_change={relative_step_change:.3e}")

    analytic = moment_jacobian(theta)
    numeric = finite_difference_jacobian(theta)
    jacobian_max_error = float(np.max(np.abs(analytic - numeric)))
    print(f"moment_jacobian_max_abs_error={jacobian_max_error:.3e}")

    # Exact boundary negative controls.
    theta_alpha1 = np.array([p, e, 1.0])
    fisher_alpha1, _ = fisher_exact(
        sequences, theta_alpha1, np.array([2e-6, 2e-6, 1e-6])
    )
    vals_alpha1, cond_alpha1 = spectrum(fisher_alpha1)
    jac_alpha1 = moment_jacobian(theta_alpha1)
    s_alpha1, jcond_alpha1 = singular_spectrum(jac_alpha1)
    print(
        "alpha=1 boundary fisher_eigenvalues="
        f"[{vals_alpha1[0]:.6e},{vals_alpha1[1]:.6e},{vals_alpha1[2]:.6e}] "
        f"condition={fmt_condition(cond_alpha1)}"
    )
    print(
        "alpha=1 boundary moment_singular_values="
        f"[{s_alpha1[0]:.6e},{s_alpha1[1]:.6e},{s_alpha1[2]:.6e}] "
        f"condition={fmt_condition(jcond_alpha1)}"
    )

    # Use a one-sided-near-boundary interior point to avoid invalid p>1.
    theta_pnear = np.array([1.0 - 1.0e-7, e, 0.3])
    fisher_pnear, _ = fisher_exact(
        sequences, theta_pnear, np.array([2e-8, 2e-6, 2e-6])
    )
    vals_pnear, cond_pnear = spectrum(fisher_pnear)
    print(
        "p->1 negative_control fisher_eigenvalues="
        f"[{vals_pnear[0]:.6e},{vals_pnear[1]:.6e},{vals_pnear[2]:.6e}] "
        f"condition={fmt_condition(cond_pnear)}"
    )

    assert relative_step_change < 2.0e-8
    assert jacobian_max_error < 2.0e-9
    assert s_alpha1[-1] < 1.0e-12
    assert vals_alpha1[0] < 1.0e-8
    assert records[-1][2] > records[1][2]
    assert records[-1][4] > records[1][4]
    print("ALL_CHECKS_PASSED")


if __name__ == "__main__":
    main()

~~~
