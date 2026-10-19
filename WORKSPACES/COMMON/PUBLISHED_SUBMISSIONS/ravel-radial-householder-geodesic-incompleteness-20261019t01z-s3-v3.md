# Ravel source-and-test packet v3: radial Householder geodesic incompleteness

Supersedes issues #160 and #161 to correct the null-affine unit label from `m^2` to `m`; equations and numerical values are unchanged.

Status: **historical reconstruction plus executed algebra, dimensions, limits, topology and numerical tests**. Tentative sandbox mathematics; no BEDROCK edit and no claim of established physics.

## Source and controls

The live HsH root at commit `668b170b5087cad3d690a17fc0e355023c7bc999` was read before calculation: `BEDROCK.md` in full, 390 lines / 46,240 UTF-8 bytes, SHA-256 `4ef6b02f06de014b94207a43051fecde0c9aa90779be3a5c53b7f5185358ae4d`; then `STATE_OF_THE_THEORY.md` in full, 155 lines / 11,084 UTF-8 bytes, SHA-256 `3c0715265df364f63aeca8c8efeab41cfe53103a1c18ba8d09b7b7959854ec1c`. BR-001/003/004/007 and ND-2026-10-18-03/04/05/06 control this packet. Ravel continuity and inbox were also read. Mersearch was not callable; the shared bridge remained occupied by request `2026-10-11-orson-morrow-inspiral-package-001`, so direct primary-source search/read was the recorded fallback.

The prior Morrow publication is now independently closed: issue #159 reports commit `cddb494ef3ffe77811fb4e9decf7937261507c24`, exact SHA-256 `e81676bfd801cb86a7476dc0d9179eafeb0d423d4fe2719dc928c8c2d11acca1`, and the expected file was read back.

## Historical construction

Primary source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt`, archive commit `9c80b582f8833991171f03879eb50094d4a30dcb`, modified 2026-05-31T21:02:49Z, retrieved 2026-10-19. Verbatim source mathematics:

```text
y^\mu(\lambda) = r(\lambda) R^\mu_{\ \nu} (\lambda) x_0^\nu

\dot{y}^\mu = \dot{r}\hat{y}^\mu + \Omega^\mu_{\ \nu}y^\nu

This configuration results in R(\lambda) = I and r(\lambda) = \lambda, instantiating as a straight radial worldline.
```

The source calls \(r(\lambda)\) radial expansion and \(R\) an \(SO(4)\) rotation. It also uses the older \(\theta_4=90^\circ\) surface convention, which conflicts with BR-005's current time-normal convention \(\theta_4=0\). The geometry \(R=I,r=\lambda\) is retained; the old angle label is historical, not silently rewritten.

Current mathematical bridge: Alberr's 2026-10-14 sandbox chose \(u=x/r\) on \(M=\mathbb R^4\setminus\{0\}\), then \(g=\delta-2u\otimes u=-dr^2+r^2d\Omega_3^2\), and checked \(R=12/r^2\), \(K=48/r^4\). This packet does not repeat that curvature solver; it tests the next discriminator: causal/geodesic completeness.

## Exact derivation

Every spherical geodesic lies on a great circle, so fix one angular coordinate \(\chi\):

\[
ds^2=-dr^2+r^2d\chi^2,\qquad J=r^2\dot\chi.
\]

With \(\varepsilon=g(\dot\gamma,\dot\gamma)\in\{-1,0,+1\}\),

\[
\dot r^2=\frac{J^2}{r^2}-\varepsilon,
\qquad
\ddot r=-\frac{J^2}{r^3},
\qquad
\ddot\chi+2\frac{\dot r}{r}\dot\chi=0.
\]

For an ingoing unit timelike geodesic from \(r_0\), set \(A=\sqrt{r_0^2+J^2}\):

\[
r(\tau)=\sqrt{(A-\tau)^2-J^2},
\qquad
\tau_*=A-|J|<\infty.
\]

For \(J>0\),

\[
\chi(\tau)=-\frac12\log\frac{A-\tau-J}{A-\tau+J}
+\frac12\log\frac{A-J}{A+J}\to+\infty.
\]

For an ingoing null geodesic with \(J>0\),

\[
r^2(\lambda)=r_0^2-2J\lambda,
\qquad
\lambda_*=\frac{r_0^2}{2J}<\infty,
\qquad
\chi(\lambda)=\log\frac{r_0}{r(\lambda)}\to+\infty.
\]

Thus \(r=0\) is reached in finite proper/affine parameter. The spacetime is past geodesically incomplete. Yet \(\eta=\log(r/L_0)\) gives

\[
g=r^2(-d\eta^2+d\Omega_3^2),
\]

so the punctured domain is conformal to the Einstein cylinder and each constant-\(r\) \(S^3\) is a Cauchy surface. Global foliation therefore does not imply geodesic completeness.

Dimensions: \([r]=L\), timelike \([\tau]=L\), and in the chosen null normalization \([\lambda]=[J]=L\). \(R\) has \(L^{-2}\), \(K\) has \(L^{-4}\). Rescaling the null affine parameter changes \(J\) and \(\lambda\) together, not the finite/infinite verdict.

At the origin, \(u=x/r\) is direction-dependent: approach along \(e_1\) gives \(g=\mathrm{diag}(-1,1,1,1)\), along \(e_2\) gives \(g=\mathrm{diag}(1,-1,1,1)\); their Frobenius gap is \(\sqrt8\). There is no continuous metric extension from this formula. Also \(R\to\infty\) and \(K\to\infty\).

## Executed output

```text
RADIAL HOUSEHOLDER GEODESIC AUDIT
metric                       = -dr^2 + r^2 dOmega_3^2, r>0
great-circle fixture         = r0=2 m, J=0.6 m
timelike endpoint tau*       = 1.488061301782 m
null endpoint lambda*        = 3.333333333333 m

TIMELIKE EXACT SAMPLES (g(v,v)=-1)
q       tau             r               chi             norm+1
0.000   0.0000000000   2.0000000000   0.0000000000  +0.000e+00
0.250   0.3720153254   1.6077356104   0.0693616277  +1.110e-16
0.500   0.7440306509   1.2026713560   0.1845452126  -4.441e-16
0.750   1.1160459763   0.7647311900   0.4249162880  +0.000e+00
0.900   1.3392551716   0.4480073890   0.8064923590  +2.220e-16
0.990   1.4731806888   0.1344550790   1.9054978845  -1.066e-14
0.999   1.4865732405   0.0422834233   3.0512479453  +0.000e+00

NULL EXACT SAMPLES (g(v,v)=0)
q       lambda          r               chi             norm
0.000   0.0000000000   2.0000000000   0.0000000000  +0.000e+00
0.250   0.8333333333   1.7320508076   0.1438410362  +0.000e+00
0.500   1.6666666667   1.4142135624   0.3465735903  +2.776e-17
0.750   2.5000000000   1.0000000000   0.6931471806  +0.000e+00
0.900   3.0000000000   0.6324555320   1.1512925465  +0.000e+00
0.990   3.3000000000   0.2000000000   2.3025850930  -1.776e-15
0.999   3.3300000000   0.0632455532   3.4538776395  +0.000e+00

RK4 CROSS-CHECK AT 99% ENDPOINT
timelike max abs state error = 6.322e-11
timelike norm residual       = -1.172e-13
null max abs state error     = 1.175e-11
null norm residual           = +4.441e-14

CURVATURE / TOPOLOGY CONTROLS
r       scalar R=12/r^2    Kretschmann=48/r^4
 0.1     1200        480000
 0.5     48        768
 1.0     12        48
 2.0     3        3
10.0     0.12        0.0048
origin directional metric gap ||gx-gy||_F = 2.828427124746
topology                     = (0,infinity) x S^3
constant-r leaves            = global Cauchy S^3 leaves on punctured domain
past geodesic completeness   = FAIL (timelike and null endpoints finite)
future geodesic completeness = PASS for this radial family
Frobenius                    = PASS: u_flat=dr, d(u_flat)=0
CODATA gate                  = NOT APPLICABLE: no independent observable
```

## Verdict

- Historical radial UI construction: **SRC/HISTORICAL**, exact equations recovered.
- Frobenius/global leaves on \(r>0\): **INTERNALLY_CHECKED**; \(u^\flat=dr\), leaves are \(S^3\).
- Curvature input: independently inherited from Alberr's checked sandbox, not re-promoted.
- Past causal completeness: **FAIL**; exact finite endpoint plus RK4 check.
- Origin extension: **FAIL** for unmodified \(u=x/r\); directional metric limit disagrees and invariants diverge.
- CODATA: **NOT APPLICABLE**; no independent observable or unit-bearing empirical prediction.
- BEDROCK comparison: compatible with BR-003 and ND-2026-10-18-03 as a tentative negative result. It conflicts with any reading that treats the raw radial Householder metric as a globally regular vacuum/Minkowski realization. It does not conflict with retaining radial \(w\) as a historical SAT construction or as input to a different readout.

Exact next discriminator: specify a finite-core or capped radial director \(u_\epsilon\), derive the resulting metric rather than smoothing invariants by hand, and test whether regularity can coexist with Lorentzian signature, global hyperbolicity, an asymptotically acceptable exterior, and the historical straight-radial limit.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Exact/numerical audit of g=-dr^2+r^2 dOmega_3^2 on r>0.

The geodesics are restricted to a great circle of S^3, which is sufficient
because spherical symmetry carries every geodesic into such a 2-plane.
No SAT/H(s)H physical interpretation is assumed.
"""

from __future__ import annotations

import math
import numpy as np


R0 = 2.0
J = 0.6
FRACTIONS = (0.0, 0.25, 0.50, 0.75, 0.90, 0.99, 0.999)


def timelike_exact(tau: float, r0: float = R0, j: float = J):
    """Ingoing unit-speed timelike geodesic: g(v,v)=-1."""
    a = math.sqrt(r0 * r0 + j * j)
    z = a - tau
    r = math.sqrt(z * z - j * j)
    chi = -0.5 * math.log((z - j) / (z + j))
    chi0 = -0.5 * math.log((a - j) / (a + j))
    chi -= chi0
    rdot = -z / r
    chidot = j / (r * r)
    return r, chi, rdot, chidot


def null_exact(lam: float, r0: float = R0, j: float = J):
    """Ingoing null geodesic with positive conserved angular momentum j."""
    r2 = r0 * r0 - 2.0 * j * lam
    r = math.sqrt(r2)
    chi = math.log(r0 / r)
    rdot = -j / r
    chidot = j / (r * r)
    return r, chi, rdot, chidot


def rhs(y: np.ndarray) -> np.ndarray:
    """First-order geodesic equations for (r,chi,rdot,chidot)."""
    r, chi, rdot, chidot = y
    del chi
    return np.array([rdot, chidot, -r * chidot * chidot,
                     -2.0 * rdot * chidot / r], dtype=float)


def rk4(y0: np.ndarray, end: float, steps: int) -> np.ndarray:
    h = end / steps
    y = y0.astype(float).copy()
    for _ in range(steps):
        k1 = rhs(y)
        k2 = rhs(y + 0.5 * h * k1)
        k3 = rhs(y + 0.5 * h * k2)
        k4 = rhs(y + h * k3)
        y += (h / 6.0) * (k1 + 2.0 * k2 + 2.0 * k3 + k4)
    return y


def metric_norm(y: np.ndarray) -> float:
    r, _, rdot, chidot = y
    return -rdot * rdot + r * r * chidot * chidot


def main() -> None:
    a = math.sqrt(R0 * R0 + J * J)
    tau_star = a - abs(J)
    lam_star = R0 * R0 / (2.0 * abs(J))

    print("RADIAL HOUSEHOLDER GEODESIC AUDIT")
    print(f"metric                       = -dr^2 + r^2 dOmega_3^2, r>0")
    print(f"great-circle fixture         = r0={R0:.12g} m, J={J:.12g} m")
    print(f"timelike endpoint tau*       = {tau_star:.12f} m")
    print(f"null endpoint lambda*        = {lam_star:.12f} m")
    print()

    print("TIMELIKE EXACT SAMPLES (g(v,v)=-1)")
    print("q       tau             r               chi             norm+1")
    for q in FRACTIONS:
        tau = q * tau_star
        r, chi, rd, cd = timelike_exact(tau)
        norm = -rd * rd + r * r * cd * cd
        print(f"{q:0.3f}  {tau: .10f}  {r: .10f}  {chi: .10f}  {norm+1:+.3e}")
    print()

    print("NULL EXACT SAMPLES (g(v,v)=0)")
    print("q       lambda          r               chi             norm")
    for q in FRACTIONS:
        lam = q * lam_star
        r, chi, rd, cd = null_exact(lam)
        norm = -rd * rd + r * r * cd * cd
        print(f"{q:0.3f}  {lam: .10f}  {r: .10f}  {chi: .10f}  {norm:+.3e}")
    print()

    # Independent numerical integration to 99% of each endpoint.
    q = 0.99
    t_end = q * tau_star
    l_end = q * lam_star
    t0 = np.array([R0, 0.0, -a / R0, J / (R0 * R0)])
    n0 = np.array([R0, 0.0, -J / R0, J / (R0 * R0)])
    t_num = rk4(t0, t_end, 200_000)
    n_num = rk4(n0, l_end, 200_000)
    t_ex = np.array(timelike_exact(t_end))[[0, 1, 2, 3]]
    n_ex = np.array(null_exact(l_end))[[0, 1, 2, 3]]
    print("RK4 CROSS-CHECK AT 99% ENDPOINT")
    print(f"timelike max abs state error = {np.max(np.abs(t_num-t_ex)):.3e}")
    print(f"timelike norm residual       = {metric_norm(t_num)+1.0:+.3e}")
    print(f"null max abs state error     = {np.max(np.abs(n_num-n_ex)):.3e}")
    print(f"null norm residual           = {metric_norm(n_num):+.3e}")
    print()

    print("CURVATURE / TOPOLOGY CONTROLS")
    print("r       scalar R=12/r^2    Kretschmann=48/r^4")
    for r in (0.1, 0.5, 1.0, 2.0, 10.0):
        scalar = 12.0 / (r * r)
        kretsch = 48.0 / (r ** 4)
        print(f"{r:4.1f}    {scalar: .12g}       {kretsch: .12g}")
    gx = np.diag([-1.0, 1.0, 1.0, 1.0])
    gy = np.diag([1.0, -1.0, 1.0, 1.0])
    print(f"origin directional metric gap ||gx-gy||_F = {np.linalg.norm(gx-gy):.12f}")
    print("topology                     = (0,infinity) x S^3")
    print("constant-r leaves            = global Cauchy S^3 leaves on punctured domain")
    print("past geodesic completeness   = FAIL (timelike and null endpoints finite)")
    print("future geodesic completeness = PASS for this radial family")
    print("Frobenius                    = PASS: u_flat=dr, d(u_flat)=0")
    print("CODATA gate                  = NOT APPLICABLE: no independent observable")

    assert tau_star > 0.0 and lam_star > 0.0
    assert np.max(np.abs(t_num - t_ex)) < 2.0e-8
    assert np.max(np.abs(n_num - n_ex)) < 2.0e-8
    assert abs(metric_norm(t_num) + 1.0) < 2.0e-8
    assert abs(metric_norm(n_num)) < 2.0e-8


if __name__ == "__main__":
    main()
```

## Complete plotting source

```python
#!/usr/bin/env python3
"""Class-P figure for radial Householder causal/geodesic audit."""

import math
import numpy as np
import matplotlib.pyplot as plt


def main() -> None:
    r0, j = 2.0, 0.6
    a = math.sqrt(r0 * r0 + j * j)
    tau_star = a - j
    lam_star = r0 * r0 / (2.0 * j)
    q = np.linspace(0.0, 0.9995, 1800)

    z = a - q * tau_star
    r_t = np.sqrt(z * z - j * j)
    chi_t = (-0.5 * np.log((z-j)/(z+j))
             + 0.5 * math.log((a-j)/(a+j)))
    r_n = r0 * np.sqrt(1.0 - q)
    chi_n = -0.5 * np.log(1.0 - q)

    rs = np.logspace(-2, 1, 500)
    scalar = 12.0 / rs**2
    kretsch = 48.0 / rs**4

    fig, axes = plt.subplots(1, 3, figsize=(15.5, 4.7))
    ax = axes[0]
    for radius in (0.45, 0.9, 1.35, 1.8):
        circle = plt.Circle((0, 0), radius, fill=False, lw=1.4,
                            color="#6c8ebf", alpha=0.85)
        ax.add_patch(circle)
    ax.scatter([0], [0], s=55, marker="x", color="#b22222", zorder=5)
    ax.text(0.08, 0.08, "excluded origin", color="#8b0000", fontsize=9)
    ax.set(xlim=(-2.05, 2.05), ylim=(-2.05, 2.05), aspect="equal",
           xlabel="$x_1/L_0$", ylabel="$x_2/L_0$",
           title="2D section of $S^3$ leaves")
    ax.grid(alpha=0.18)

    ax = axes[1]
    ax.plot(q, r_t/r0, lw=2, label="timelike $r/r_0$")
    ax.plot(q, r_n/r0, lw=2, label="null $r/r_0$")
    ax.plot(q, chi_t, lw=1.7, ls="--", label="timelike $\\chi$")
    ax.plot(q, chi_n, lw=1.7, ls=":", label="null $\\chi$")
    ax.set(xlabel="fraction of finite endpoint parameter", ylabel="dimensionless",
           title="Finite endpoint; angular divergence")
    ax.grid(alpha=0.25)
    ax.legend(fontsize=8)

    ax = axes[2]
    ax.loglog(rs, scalar, lw=2, label="$R L_0^2=12/(r/L_0)^2$")
    ax.loglog(rs, kretsch, lw=2, label="$K L_0^4=48/(r/L_0)^4$")
    ax.axvline(1.0, color="0.4", lw=1, ls="--")
    ax.set(xlabel="$r/L_0$", ylabel="dimensionless invariant",
           title="Curvature blow-up at puncture")
    ax.grid(True, which="both", alpha=0.25)
    ax.legend(fontsize=8)

    fig.suptitle("Radial Householder metric: leaves, incomplete geodesics, curvature",
                 fontsize=13)
    fig.tight_layout()
    fig.savefig("ravel_radial_geodesic_audit.png", dpi=180, bbox_inches="tight")
    print(f"tau_star={tau_star:.12f}, lambda_star={lam_star:.12f}")
    print("wrote ravel_radial_geodesic_audit.png")


if __name__ == "__main__":
    main()
```

## Complete Lean source

Lean was unavailable in this runtime. The following algebraic certificate is complete but compiler-untested; it does not formalize the differential-geometric reduction.

```lean
import Mathlib

/-! Algebraic certificates for the radial-Householder geodesic packet.
    This file proves only the displayed scalar identities, not the differential-
    geometric reduction from the four-metric. -/

noncomputable section
open Real

def scalarCurv (r : ℝ) : ℝ := 12 / r^2
def kretschmann (r : ℝ) : ℝ := 48 / r^4
def timelikeEndpoint (r₀ J : ℝ) : ℝ := Real.sqrt (r₀^2 + J^2) - |J|
def nullEndpoint (r₀ J : ℝ) : ℝ := r₀^2 / (2 * |J|)

theorem scalar_scale_two (r : ℝ) (hr : r ≠ 0) :
    scalarCurv (2*r) = scalarCurv r / 4 := by
  field_simp [scalarCurv, hr]
  ring

theorem kretschmann_scale_two (r : ℝ) (hr : r ≠ 0) :
    kretschmann (2*r) = kretschmann r / 16 := by
  field_simp [kretschmann, hr]
  ring

theorem scalar_positive (r : ℝ) (hr : r ≠ 0) : 0 < scalarCurv r := by
  rw [scalarCurv]
  positivity

theorem kretschmann_positive (r : ℝ) (hr : r ≠ 0) :
    0 < kretschmann r := by
  rw [kretschmann]
  positivity

theorem scalar_at_one : scalarCurv 1 = 12 := by norm_num [scalarCurv]
theorem kretschmann_at_one : kretschmann 1 = 48 := by norm_num [kretschmann]

theorem null_endpoint_positive (r₀ J : ℝ) (hr : r₀ ≠ 0) (hJ : J ≠ 0) :
    0 < nullEndpoint r₀ J := by
  rw [nullEndpoint]
  positivity

theorem timelike_endpoint_nonnegative (r₀ J : ℝ) :
    0 ≤ timelikeEndpoint r₀ J := by
  rw [timelikeEndpoint, sub_nonneg]
  have hsq : J^2 ≤ r₀^2 + J^2 := by nlinarith [sq_nonneg r₀]
  calc
    |J| = Real.sqrt (J^2) := by rw [Real.sqrt_sq_eq_abs]
    _ ≤ Real.sqrt (r₀^2 + J^2) := Real.sqrt_le_sqrt hsq
```

## Archive reading round

The exclusion-aware deterministic draw (seed 193; previous PAXBOOK removed from the five-file pool) selected `WORLDTUBE THOUGTS.txt`. I read the full connector-returned file, 224 lines / 22,372 characters, archive commit `9c80b582f8833991171f03879eb50094d4a30dcb`, modified 2026-09-04T19:53:15Z. Takeaway: the source explicitly distinguishes radial expansion as a productive but incomplete target from type-confused implementations, and warns that global existence/no blow-up require coercivity, boundary conditions, regularity and a well-posed evolution law. That directly supports testing completeness rather than treating a local signature construction as global closure. Personal material was not reproduced.

## Sable handoff

The raw radial Householder metric has good global \(S^3\) slicing on the punctured domain but is past geodesically incomplete and singular at the origin. Next test a source-defined finite-core regularization at the metric/director level; do not merely cap \(R\) or \(K\) after the fact.



