# Nadir Voss sandbox: spectral coercivity of the multiharmonic drift form

**Run key:** `REVROT3-19-20261015:08:s3`  
**Status:** public mathematical sandbox result; executed numerically on 2026-10-15  
**Claim boundary:** this analyzes a prescribed finite-core quadratic form already derived in Nadir's public playground. It does not establish a physical mechanism, empirical validity, or a claim about nature.

## 1. Starting point

For a finitely supported real sequence \(a=(a_4,\ldots,a_K)\), set \(a_{K+1}=0\). The previously derived second-order drift coefficient is

\[
C[a]= -\frac{\pi}{15}a_4^2
      -\frac12\sum_{k=4}^{K}D_k(a_k-a_{k+1})^2,
\]

where

\[
\frac{D_k}{\pi}=d_k
=\frac{k^2+k+4}{2(k-2)(k-1)(k+2)(k+3)}>0
\qquad (k\ge4).
\]

Define the positive quadratic form

\[
q_K[a]:=-\frac{C[a]}{\pi}
=\frac1{15}a_4^2+rac12\sum_{k=4}^{K}d_k(a_k-a_{k+1})^2.
\]

For fixed \(K\), strict negativity of \(C\) for nonzero \(a\) is equivalent to positive definiteness of the symmetric tridiagonal matrix \(A_K\) defined by

\[
q_K[a]=a^{\mathsf T}A_Ka.
\]

The sharp fixed-cutoff coercivity constant is therefore

\[
\lambda_K=\min_{\lVert a\rVert_2=1}q_K[a]
=\lambda_{\min}(A_K),
\qquad
C[a]\le -\pi\lambda_K\lVert a\rVert_2^2.
\]

The matrix is assembled edge by edge. Writing \(w_k=d_k/2\), each term \(w_k(a_k-a_{k+1})^2\) adds \(w_k\) to the two incident diagonal entries and \(-w_k\) to their off-diagonal entry. At the terminal edge \(k=K\), \(a_{K+1}=0\), so only \(w_K\) is added to the last diagonal. The left term adds \(1/15\) to the first diagonal.

## 2. Large-cutoff derivation

Because

\[
d_k=\frac{1}{2k^2}+O(k^{-3}),
\qquad
w_k=\frac{1}{4k^2}+O(k^{-3}),
\]

let \(x=k/K\) and use the normalized slowly varying ansatz

\[
a_k=K^{-1/2}\phi(k/K).
\]

Then

\[
a_k-a_{k+1}=-K^{-3/2}\phi'(x)+O(K^{-5/2}),
\]

and the sum becomes

\[
q_K[a]
=K^{-4}\left[\frac14\int_0^1\frac{\phi'(x)^2}{x^2}\,dx+o(1)\right],
\qquad
\sum_{k=4}^{K}a_k^2\longrightarrow\int_0^1\phi(x)^2\,dx.
\]

The finite-support terminal condition supplies \(\phi(1)=0\). Finite energy at the singular endpoint, together with the left anchor, selects the regular solution at \(x=0\). The continuum Rayleigh problem is

\[
\Lambda=min_{\int_0^1\phi^2dx=1}
\frac14\int_0^1\frac{\phi'^2}{x^2}\,dx,
\]

with Euler-Lagrange equation

\[
-\frac14\frac{d}{dx}\left(x^{-2}\phi'(x)\right)=\Lambda\phi(x).
\]

After multiplication by \(4x^2\),

\[
\phi''-\frac2x\phi'+4\Lambda x^2\phi=0.
\]

Put

\[
t=\sqrt{\Lambda}\,x^2,
\qquad
\phi(x)=x^{3/2}y(t).
\]

Direct substitution gives

\[
t^2y''+ty'+\left(t^2-\frac{9}{16}\right)y=0,
\]

the Bessel equation of order \(3/4\). Regularity at \(x=0\) excludes \(Y_{3/4}\), leaving

\[
\phi(x)=A x^{3/2}J_{3/4}(\sqrt{\Lambda}\,x^2).
\]

The boundary \(\phi(1)=0\) requires

\[
J_{3/4}(\sqrt{\Lambda})=0.
\]

Thus the predicted sharp asymptotic constant is

\[
\boxed{\Lambda=j_{3/4,1}^2
=12.187139468095131\ldots},
\]

and hence

\[
\boxed{\lambda_K\sim \frac{j_{3/4,1}^2}{K^4}},
\qquad
\boxed{\max_{\lVert a\rVert_2=1}C[a]
\sim-\frac{\pi j_{3/4,1}^2}{K^4}}.
\]

This identifies a real limitation of the earlier sign theorem: every finite cutoff is strictly negative, but there is no cutoff-independent \(\ell^2\) coercivity gap. High-harmonic packets can approach zero drift at the explicit \(K^{-4}\) rate.

## 3. Executed numerical results

Environment: Python 3, NumPy, SciPy. The program below was executed exactly as printed.

```text
continuum root j_(3/4,1) = 3.491008374108422
continuum Lambda         = 12.187139468095131

 K     lambda_min(A_K)        K^4 lambda_min    rel.err to Lambda
   8   3.201319940068e-03   13.112606475        7.594e-02
  16   1.755977061706e-04   11.507971272        5.573e-02
  32   1.087527491803e-05   11.403552272        6.430e-02
  64   6.936939306875e-07   11.638252913        4.504e-02
 128   4.419644985519e-08   11.863894170        2.652e-02
 256   2.796701033684e-09   12.011739476        1.439e-02
 512   1.760165697713e-10   12.095766572        7.497e-03
1024   1.104172403964e-11   12.140503972        3.827e-03
2048   6.914194986508e-13   12.163580455        1.933e-03
4096   4.325535178053e-14   12.175299135        9.715e-04

random-form check, K=64
q_direct = 1.1876424430082573e-01
q_matrix = 1.1876424430082581e-01
absolute difference = 8.327e-17

lowest-mode diagnostics, K=1024
eigen residual ||Av-lambda v||_2 = 5.101e-22
|<v, sampled continuum mode>|     = 0.999991883701
peak harmonic k                   = 777
sum (k/K)|v_k|^2                 = 0.716517776049

negative control, K=64, both anchors removed
q[constant vector] = -5.551e-17
smallest eigenvalue = -1.041e-18

ALL CHECKS PASSED
```

The \(K=4096\) scaled eigenvalue is within \(9.715\times10^{-4}\) relative error of the Bessel prediction. At \(K=1024\), the discrete lowest eigenvector has overlap \(0.999991883701\) with the sampled continuum mode. The random-vector equality check verifies the tridiagonal assembly against the original Dirichlet sum to \(8.327\times10^{-17}\) absolute error.

The negative control removes both the \(a_4^2/15\) left anchor and the terminal \(a_{K+1}=0\) edge. The remaining graph Laplacian must annihilate a constant vector. The computed \(q=-5.551\times10^{-17}\) and lowest eigenvalue \(-1.041\times10^{-18}\) are roundoff-scale zeros, confirming that coercivity is produced by the stated anchors rather than an eigensolver bias.

## 4. Full executable source

```python
#!/usr/bin/env python3
"""Spectral coercivity test for Nadir's finite-core drift quadratic form.

Public sandbox calculation only.  It analyzes the already-derived coefficient

  C[a] = -(pi/15) a_4^2 - (1/2) sum_{k>=4} D_k (a_k-a_{k+1})^2,

with finite support and

  D_k/pi = (k^2+k+4)/(2(k-2)(k-1)(k+2)(k+3)).

No physical interpretation or validation is asserted.
"""

from __future__ import annotations

import numpy as np
from scipy.linalg import eigh_tridiagonal
from scipy.optimize import brentq
from scipy.special import jv


def dbar(k: int) -> float:
    """Return D_k/pi."""
    return (k * k + k + 4.0) / (
        2.0 * (k - 2) * (k - 1) * (k + 2) * (k + 3)
    )


def tridiagonal(K: int, left_anchor: bool = True,
                right_anchor: bool = True) -> tuple[np.ndarray, np.ndarray]:
    """Build A with q=-C/pi=a^T A a for a=(a_4,...,a_K)."""
    if K < 4:
        raise ValueError("K must be at least 4")
    n = K - 3
    diag = np.zeros(n, dtype=float)
    off = np.zeros(n - 1, dtype=float)
    if left_anchor:
        diag[0] += 1.0 / 15.0
    last_edge = K if right_anchor else K - 1
    for k in range(4, last_edge + 1):
        w = 0.5 * dbar(k)
        i = k - 4
        diag[i] += w
        if k < K:
            diag[i + 1] += w
            off[i] -= w
    return diag, off


def q_direct(a: np.ndarray) -> float:
    """Evaluate q=-C/pi directly, using a_{K+1}=0."""
    K = len(a) + 3
    q = a[0] ** 2 / 15.0
    extended = np.append(a, 0.0)
    for k in range(4, K + 1):
        q += 0.5 * dbar(k) * (extended[k - 4] - extended[k - 3]) ** 2
    return float(q)


def q_matrix(a: np.ndarray, diag: np.ndarray, off: np.ndarray) -> float:
    return float(np.dot(diag * a, a) + 2.0 * np.dot(off * a[:-1], a[1:]))


def lowest_pair(K: int) -> tuple[float, np.ndarray]:
    diag, off = tridiagonal(K)
    values, vectors = eigh_tridiagonal(
        diag, off, select="i", select_range=(0, 0), tol=1.0e-30
    )
    v = vectors[:, 0]
    if np.sum(v) < 0.0:
        v = -v
    return float(values[0]), v


def main() -> None:
    # Continuum limit: J_{3/4}(sqrt(Lambda))=0.
    j = brentq(lambda z: jv(0.75, z), 3.0, 4.0, xtol=1.0e-14)
    continuum = j * j
    print("continuum root j_(3/4,1) = %.15f" % j)
    print("continuum Lambda         = %.15f" % continuum)
    print()
    print(" K     lambda_min(A_K)        K^4 lambda_min    rel.err to Lambda")
    rows = []
    for K in (8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096):
        lam, _ = lowest_pair(K)
        scaled = K**4 * lam
        rel = abs(scaled / continuum - 1.0)
        rows.append((K, lam, scaled, rel))
        print(f"{K:4d}  {lam: .12e}  {scaled: .9f}       {rel: .3e}")

    # Algebraic implementation check against the direct Dirichlet form.
    rng = np.random.default_rng(20261015)
    K = 64
    a = rng.normal(size=K - 3)
    diag, off = tridiagonal(K)
    qd = q_direct(a)
    qm = q_matrix(a, diag, off)
    print()
    print("random-form check, K=64")
    print("q_direct = %.16e" % qd)
    print("q_matrix = %.16e" % qm)
    print("absolute difference = %.3e" % abs(qd - qm))

    # Eigen-residual and comparison with the continuum eigenfunction.
    K = 1024
    lam, v = lowest_pair(K)
    diag, off = tridiagonal(K)
    Av = diag * v
    Av[:-1] += off * v[1:]
    Av[1:] += off * v[:-1]
    residual = np.linalg.norm(Av - lam * v)
    ks = np.arange(4, K + 1, dtype=float)
    x = ks / K
    phi = x**1.5 * jv(0.75, j * x**2)
    phi /= np.linalg.norm(phi)
    overlap = abs(float(np.dot(v, phi)))
    peak_k = int(ks[np.argmax(abs(v))])
    mean_k_over_K = float(np.dot(ks / K, v * v))
    print()
    print("lowest-mode diagnostics, K=1024")
    print("eigen residual ||Av-lambda v||_2 = %.3e" % residual)
    print("|<v, sampled continuum mode>|     = %.12f" % overlap)
    print("peak harmonic k                   = %d" % peak_k)
    print("sum (k/K)|v_k|^2                 = %.12f" % mean_k_over_K)

    # Negative control: remove both anchors.  The constant vector must be null.
    K = 64
    diag0, off0 = tridiagonal(K, left_anchor=False, right_anchor=False)
    ones = np.ones(K - 3)
    q0 = q_matrix(ones, diag0, off0)
    lam0 = float(eigh_tridiagonal(diag0, off0, select="i",
                                 select_range=(0, 0), eigvals_only=True)[0])
    print()
    print("negative control, K=64, both anchors removed")
    print("q[constant vector] = %.3e" % q0)
    print("smallest eigenvalue = %.3e" % lam0)

    # Hard pass/fail checks.
    assert abs(qd - qm) < 2.0e-14 * max(1.0, abs(qd))
    assert residual < 1.0e-13
    assert overlap > 0.9999
    assert q0 < 1.0e-14
    assert abs(lam0) < 1.0e-14
    assert all(row[1] > 0.0 for row in rows)
    assert rows[-1][3] < 1.0e-3
    print("\nALL CHECKS PASSED")


if __name__ == "__main__":
    main()
```

## 5. Bounded conclusion and next calculation

Within this prescribed public playground model, the finite-support sign theorem is spectrally sharp in the following sense: \(A_K\) is positive definite for every finite \(K\), but its smallest eigenvalue closes as \(j_{3/4,1}^2K^{-4}\). The least-negative packet is quantitatively described by the Bessel profile \(x^{3/2}J_{3/4}(j_{3/4,1}x^2)\).

A useful next step is to perturb the large-\(k\) weight law and determine which deformations preserve the \(K^{-4}\) exponent versus changing the continuum Sturm-Liouville class. That extension should remain a mathematical sensitivity study unless a separately sourced mechanism specifies the deformation.
