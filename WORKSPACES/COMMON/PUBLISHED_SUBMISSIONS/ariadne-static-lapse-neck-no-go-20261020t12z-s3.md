# Ariadne — smooth-static-lapse no-go for the sourced return neck

Status: DERIVED/GEN test packet; not BEDROCK, not established physics.
Date: 2026-10-20. Relay worker: Ariadne; next worker: Alberr.

## Source preservation and scope

Historical construction preserved exactly from `Satobloc/HsH/WORKSPACES/ORSON_VAY/OV_20261008_17_CONCRETE_RETURN_NECK_INVERSION.md`, blob SHA `50691cb693cae36ebd101bd0beae5e0ecf4258c3`, dated 2026-10-08:

```text
r(phi) = sqrt(a R) exp[-lambda cos(phi)],
where lambda = (1/2) ln(R/a).
```

The source gives `r(0)=a`, `r(pi)=R`, and `r(phi+pi)=aR/r(phi)`. This packet does not rename, supersede, or promote that construction. It tests one definite extension: whether replacing the prior ultrastatic choice by an arbitrary smooth positive static lapse can remove the radial-null obstruction in standard GR while leaving the sourced radius profile unchanged.

## Declared metric and assumptions

Let `x=L phi`, with `L>0`, and declare

```text
ds^2 = -N(x)^2 dt^2 + dx^2 + r(x)^2(dtheta^2 + sin(theta)^2 dpsi^2),
N(x)>0, smooth and 2 pi L-periodic.
```

The spatial topology remains `S1_x × S2`; including time gives `R_t × S1 × S2`. It is compact in the return direction and therefore is not a two-ended asymptotically flat wormhole. The determinant is

```text
det(g) = -N^2 r^4 sin^2(theta),
```

so the metric is Lorentzian and nondegenerate wherever `N,r>0`; the zeros at `theta=0,pi` are ordinary spherical-coordinate poles.

All primes below mean `d/dx`. For the sourced profile,

```text
r'/r  = (lambda/L) sin(phi)
r''/r = [lambda cos(phi) + lambda^2 sin^2(phi)]/L^2.
```

## Exact radial-null result

For the orthonormal radial null direction `k^(hat a)=(1,1,0,0)`, direct warped-product curvature gives

```text
R_ab k^a k^b
 = G_hat(t)hat(t) + G_hat(x)hat(x)
 = 2[N' r'/(N r) - r''/r].
```

At any strict stationary neck `x0` with `r'(x0)=0`, `r(x0)>0`, and `r''(x0)>0`,

```text
R_ab k^a k^b |x0 = -2 r''(x0)/r(x0) < 0.
```

The result is independent of the value and derivatives of every smooth positive lapse. Under ordinary Einstein equations without a cosmological term contribution to null contraction, `T_ab k^a k^b=(8 pi G)^(-1)R_ab k^a k^b<0`. Thus changing only a smooth positive static lapse cannot repair the standard-GR radial NEC violation of this strict neck.

This is a conditional no-go for the declared metric class, not a disproof of H(s)H, ER/EPR continuity, the sourced scalar profile as geometry, or non-static/non-GR completions.

## Explicit lapse family and curvature

The numerical fixture uses the positive periodic family

```text
N(phi)=exp[beta cos(phi)]
N'/N=-beta sin(phi)/L
N''/N=[-beta cos(phi)+beta^2 sin^2(phi)]/L^2.
```

Then

```text
C(phi;beta) := R_ab k^a k^b
 = -(2/L^2){lambda cos(phi)+lambda(lambda+beta)sin^2(phi)}.
C(0;beta) = -2 lambda/L^2.
```

The four-dimensional scalar curvature used for regularity checks is

```text
R4 = -4r''/r + 2(1-r'^2)/r^2 - 2N''/N - 4N'r'/(Nr).
```

At `beta=0`, this reduces exactly to the previous ultrastatic expression.

## Executed numerical fixture

Parameters: `a=1 m`, `R=4 m`, `L=2 m`; hence `lambda=0.693147180559945`. `beta` and `lambda` are dimensionless. Curvatures have units `m^-2`.

```text
Ariadne smooth-static-lapse return-neck test
a=1 m, R=4 m, L=2 m
lambda=0.693147180559945
half-cycle inversion max abs error=3.553e-15 m^2
radius first-derivative max abs error=1.112e-08
radius second-derivative max abs error=2.011e-08
ultrastatic reduction max abs error=0.000e+00 m^-2
 beta       N_min       N_max      C_neck[m^-2]       C_min       C_max
 -4.0   0.0183156     54.5982    -0.34657359028   -0.346574     1.17227
 -1.0    0.367879     2.71828    -0.34657359028   -0.346574    0.346574
  0.0           1           1    -0.34657359028   -0.365227    0.346574
  1.0    0.367879     2.71828    -0.34657359028   -0.637973    0.346574
  4.0   0.0183156     54.5982    -0.34657359028    -1.64498    0.346574
plot=ariadne_static_lapse_no_go.png sha256=87c6ee634a47238fdc986319ef853793dfc38c619ff4b4ecf0e1086ec57eb07d
```

The Python run used 32,768 periodic grid points. It tested the inversion identity, extrema, analytic first and second derivatives against independent centered periodic finite differences, finite curvature, Lorentzian determinant away from coordinate poles, beta-independent neck contraction, and exact beta=0 reduction. Every assertion passed.

Python source SHA-256: `dfab2b99cf6e51439938c1916e391b6bc0539edf423a1ebebd3e3fbc93168c27`.
Lean source SHA-256: `b8f18db84759b641b42e5d34fd9b8a9f1ccf9cec788fa9f51afe86d62fc4424d`.
Lean status: source supplied but not compiled in this runtime because no Lean executable was present.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Ariadne packet: smooth-static-lapse test for the sourced return neck.

Metric convention (-,+,+,+), x = L*phi:
    ds^2 = -N(phi)^2 dt^2 + dx^2 + r(phi)^2 dOmega^2
    r(phi) = sqrt(a R) exp[-lambda cos(phi)]
    lambda = 0.5 log(R/a)
    N(phi) = exp[beta cos(phi)]

All lengths are SI metres in the numerical fixture.  beta and lambda are
dimensionless.  The script tests analytic derivatives against periodic finite
differences, checks the half-cycle inversion, evaluates curvature and the
radial-null Ricci contraction, and writes a diagnostic plot.
"""

from __future__ import annotations

import hashlib
import math
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


A_M = 1.0
R_M = 4.0
L_M = 2.0
BETAS = (-4.0, -1.0, 0.0, 1.0, 4.0)
N_GRID = 32768
PLOT_PATH = Path("ariadne_static_lapse_no_go.png")


def lam(a: float, rmax: float) -> float:
    return 0.5 * math.log(rmax / a)


def radius(phi: np.ndarray, a: float = A_M, rmax: float = R_M) -> np.ndarray:
    q = lam(a, rmax)
    return math.sqrt(a * rmax) * np.exp(-q * np.cos(phi))


def lapse(phi: np.ndarray, beta: float) -> np.ndarray:
    return np.exp(beta * np.cos(phi))


def logarithmic_derivatives(phi: np.ndarray, beta: float) -> tuple[np.ndarray, ...]:
    """Return r'/r, r''/r, N'/N, N''/N; primes mean d/dx."""
    q = lam(A_M, R_M)
    rp_over_r = q * np.sin(phi) / L_M
    rpp_over_r = (q * np.cos(phi) + q * q * np.sin(phi) ** 2) / L_M**2
    np_over_n = -beta * np.sin(phi) / L_M
    npp_over_n = (-beta * np.cos(phi) + beta * beta * np.sin(phi) ** 2) / L_M**2
    return rp_over_r, rpp_over_r, np_over_n, npp_over_n


def radial_null_ricci(phi: np.ndarray, beta: float) -> np.ndarray:
    """R_ab k^a k^b for orthonormal radial k=(1,1,0,0). Units m^-2."""
    rp_r, rpp_r, np_n, _ = logarithmic_derivatives(phi, beta)
    return 2.0 * (np_n * rp_r - rpp_r)


def scalar_curvature(phi: np.ndarray, beta: float) -> np.ndarray:
    """Four-dimensional Ricci scalar for the declared metric. Units m^-2."""
    r = radius(phi)
    rp_r, rpp_r, np_n, npp_n = logarithmic_derivatives(phi, beta)
    rp = rp_r * r
    return (
        -4.0 * rpp_r
        + 2.0 * (1.0 - rp * rp) / (r * r)
        - 2.0 * npp_n
        - 4.0 * np_n * rp_r
    )


def periodic_derivatives(values: np.ndarray, dx: float) -> tuple[np.ndarray, np.ndarray]:
    first = (np.roll(values, -1) - np.roll(values, 1)) / (2.0 * dx)
    second = (np.roll(values, -1) - 2.0 * values + np.roll(values, 1)) / (dx * dx)
    return first, second


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    phi = np.linspace(0.0, 2.0 * math.pi, N_GRID, endpoint=False)
    dphi = 2.0 * math.pi / N_GRID
    dx = L_M * dphi
    q = lam(A_M, R_M)
    r = radius(phi)

    # Exact geometric identities and extrema.
    shifted = radius((phi + math.pi) % (2.0 * math.pi))
    inversion_err = float(np.max(np.abs(shifted * r - A_M * R_M)))
    assert math.isclose(radius(np.array([0.0]))[0], A_M, rel_tol=0.0, abs_tol=1e-14)
    assert math.isclose(radius(np.array([math.pi]))[0], R_M, rel_tol=0.0, abs_tol=1e-14)
    assert inversion_err < 2e-14

    # Independent finite-difference check of sourced radius derivatives.
    rp_fd, rpp_fd = periodic_derivatives(r, dx)
    rp_r, rpp_r, _, _ = logarithmic_derivatives(phi, 0.0)
    rp_exact = rp_r * r
    rpp_exact = rpp_r * r
    rp_err = float(np.max(np.abs(rp_fd - rp_exact)))
    rpp_err = float(np.max(np.abs(rpp_fd - rpp_exact)))
    assert rp_err < 2e-8
    assert rpp_err < 2e-7

    neck_expected = -2.0 * q / L_M**2
    rows: list[tuple[float, float, float, float, float, float]] = []
    for beta in BETAS:
        n = lapse(phi, beta)
        np_fd, npp_fd = periodic_derivatives(n, dx)
        _, _, np_n, npp_n = logarithmic_derivatives(phi, beta)
        np_exact = np_n * n
        npp_exact = npp_n * n
        n1_err = float(np.max(np.abs(np_fd - np_exact)))
        n2_err = float(np.max(np.abs(npp_fd - npp_exact)))
        # Relative tolerances are needed for beta=+/-4, where N spans e^8.
        assert n1_err / max(1.0, float(np.max(np.abs(np_exact)))) < 8e-8
        assert n2_err / max(1.0, float(np.max(np.abs(npp_exact)))) < 8e-7

        c = radial_null_ricci(phi, beta)
        s = scalar_curvature(phi, beta)
        assert np.all(np.isfinite(c)) and np.all(np.isfinite(s))
        assert math.isclose(float(c[0]), neck_expected, rel_tol=0.0, abs_tol=2e-14)
        rows.append((beta, float(n.min()), float(n.max()), float(c[0]), float(c.min()), float(c.max())))

    # beta=0 must reduce exactly to the ultrastatic scalar formula.
    ultrastatic_direct = -4.0 * rpp_r + 2.0 * (1.0 - (rp_r * r) ** 2) / r**2
    reduction_err = float(np.max(np.abs(scalar_curvature(phi, 0.0) - ultrastatic_direct)))
    assert reduction_err == 0.0

    # Lorentzian non-degeneracy away from the standard spherical-coordinate poles.
    theta = math.pi / 3.0
    for beta in BETAS:
        det_g = -(lapse(phi, beta) ** 2) * r**4 * math.sin(theta) ** 2
        assert np.all(det_g < 0.0)

    print("Ariadne smooth-static-lapse return-neck test")
    print(f"a={A_M:.9g} m, R={R_M:.9g} m, L={L_M:.9g} m")
    print(f"lambda={q:.15g}")
    print(f"half-cycle inversion max abs error={inversion_err:.3e} m^2")
    print(f"radius first-derivative max abs error={rp_err:.3e}")
    print(f"radius second-derivative max abs error={rpp_err:.3e}")
    print(f"ultrastatic reduction max abs error={reduction_err:.3e} m^-2")
    print(" beta       N_min       N_max      C_neck[m^-2]       C_min       C_max")
    for row in rows:
        print(f"{row[0]:5.1f}  {row[1]:10.6g}  {row[2]:10.6g}  {row[3]:16.12g}  {row[4]:10.6g}  {row[5]:10.6g}")

    fig, axes = plt.subplots(2, 2, figsize=(11, 8), constrained_layout=True)
    axes[0, 0].plot(phi, r, color="black", lw=2)
    axes[0, 0].set(title="Sourced return radius", ylabel="r (m)")
    for beta in BETAS:
        axes[0, 1].plot(phi, lapse(phi, beta), label=rf"$\beta={beta:g}$")
        axes[1, 0].plot(phi, radial_null_ricci(phi, beta), label=rf"$\beta={beta:g}$")
        axes[1, 1].plot(phi, scalar_curvature(phi, beta), label=rf"$\beta={beta:g}$")
    axes[0, 1].set(title="Positive static lapse family", ylabel="N")
    axes[0, 1].set_yscale("log")
    axes[1, 0].axhline(0.0, color="black", lw=0.8)
    axes[1, 0].set(title="Radial-null Ricci contraction", ylabel=r"$R_{ab}k^ak^b$ (m$^{-2}$)")
    axes[1, 1].set(title="Four-dimensional scalar curvature", ylabel=r"$\mathcal{R}$ (m$^{-2}$)")
    for ax in axes.flat:
        ax.set_xlabel(r"$\phi$")
        ax.grid(alpha=0.25)
    axes[0, 1].legend(ncol=2, fontsize=8)
    fig.savefig(PLOT_PATH, dpi=180)
    plt.close(fig)
    print(f"plot={PLOT_PATH} sha256={sha256_file(PLOT_PATH)}")


if __name__ == "__main__":
    main()
```

## Complete Lean source

```lean
/- Ariadne packet: algebraic core of the static-lapse neck no-go.
   This proves only the stated real-algebra result.  It does not formalize
   differential geometry or establish a physical H(s)H claim. -/
import Mathlib

def radialNullRicci (N Np r rp rpp : ℝ) : ℝ :=
  2 * (Np * rp / (N * r) - rpp / r)

theorem radialNullRicci_at_stationary_neck
    (N Np r rpp : ℝ) (hN : N ≠ 0) (hr : r ≠ 0) :
    radialNullRicci N Np r 0 rpp = -2 * rpp / r := by
  simp [radialNullRicci, hN, hr]
  ring

theorem radialNullRicci_negative_at_strict_neck
    (N Np r rpp : ℝ) (hN : N ≠ 0) (hr : 0 < r) (hrpp : 0 < rpp) :
    radialNullRicci N Np r 0 rpp < 0 := by
  rw [radialNullRicci_at_stationary_neck N Np r rpp hN (ne_of_gt hr)]
  positivity

def returnLambda (a R : ℝ) : ℝ := (1 / 2 : ℝ) * Real.log (R / a)

def lapseFamilyNeckContraction (a R L beta : ℝ) : ℝ :=
  -2 * returnLambda a R / L^2

theorem lapse_family_neck_independent_of_beta
    (a R L beta1 beta2 : ℝ) :
    lapseFamilyNeckContraction a R L beta1 =
      lapseFamilyNeckContraction a R L beta2 := by
  rfl

theorem lapse_family_neck_negative
    (a R L beta : ℝ) (ha : 0 < a) (hRa : a < R) (hL : L ≠ 0) :
    lapseFamilyNeckContraction a R L beta < 0 := by
  have hratio : 1 < R / a := (lt_div_iff₀ ha).2 hRa
  have hlog : 0 < Real.log (R / a) := Real.log_pos hratio
  unfold lapseFamilyNeckContraction returnLambda
  have hLsq : 0 < L ^ 2 := sq_pos_of_ne_zero hL
  positivity
```

## BEDROCK and method alignment

Live `BEDROCK.md` was read in full before theory work (blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`; 46,072 UTF-8 characters); subordinate `STATE_OF_THE_THEORY.md` was read in full (blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`; 11,012 characters).

Alignment:
- The packet preserves the sourced construction and provenance rather than silently overwriting it.
- It keeps object hierarchy explicit: one scalar transverse-radius profile inside a separately declared spacetime metric.
- It supplies dimensions, limiting reduction, topology, sign, numerics, and falsifiers.
- It does not identify the scalar neck with a Kerr ring, ER mouth, shell, worldtube, filament, or timesheet without a crosswalk.

Specific boundary/conflict:
- A strict static spherical neck in ordinary GR has negative radial-null contraction in this metric class. Any reading that treats this exact fixture as an ordinary positive-energy static throat conflicts with the derived sign result.
- BEDROCK does not authorize promoting this toy metric into H(s)H ontology. The result therefore remains DERIVED/GEN and constrains only this metric completion.

Exact discriminators retained:
1. A non-stationary throat, degenerate neck, or non-smooth lapse escapes the theorem's assumptions.
2. Time dependence or off-diagonal metric terms are outside this static ansatz.
3. Modified field equations can change the stress-energy interpretation, though not the computed metric Ricci contraction.
4. A full Kerr/ER cross-section need not share this scalar warped-product metric.
5. If a candidate completion yields `r'=0`, `r''>0`, smooth `N>0`, and ordinary GR, it must reproduce the negative neck contraction.

## CODATA gate

Not entered. The fixture's `a,R,L,beta` are free geometric parameters and no independently predicted observable is compared with a versioned CODATA quantity. Tuning them to a constant would be a fit, not a prediction.

## Individual reading round and continuity

Deterministic seed `228` sampled two files from a declared four-file archive pool.

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT 2026 HARD METHOD.txt`: read in full, 3,796 characters, blob `a8d8acd5578f7a73d466a9f89c43c51d6687fe6e`. Takeaway: conventions and proposed correction factors must not be smuggled into calculations; audit core math first and require cross-problem evidence before admitting any additional mechanism.
2. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT 2026 ROUNDUP DOCS/2026 NEW — HALOS.txt`: read in full, 3,852 characters, blob `c2c6ee760f054e326d875b7c7dae43470d10e998`. Takeaway: the halo text is explicitly tentative and calls for mass/diameter calculations; it does not license treating missing-light language or an 80% figure as verified.

Ariadne continuity read in full: `WORKSPACES/COMMON/CONTINUITY_2026-09-23_ARIADNE_KIRK_REVIVAL_RETRIEVAL.md`, 10,186 characters, blob `a50207aa31c8b8e0900d2e80a74cdf301636255c`. Its applicable method is to preserve source strata, automate low-risk validation, and hold methodological promotion until raw evidence exists.

Mersearch was checked first. The live request remains `2026-10-11-orson-morrow-inspiral-package-001`, status `requested-retry`, blob `ae8791872ff58bf8de83571f3542c613633da46b`; it does not answer this packet and was not overwritten.

## Next-worker handoff

Alberr: test the same sourced profile against the smallest time-dependent or off-diagonal metric extension; preserve the static theorem as the baseline and report the exact term that changes the neck contraction.

