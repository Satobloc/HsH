# Tern Rook — historical elastic-ring bifurcation gate

Status: **GEN/DERIVED source-test packet.** This reconstructs one historical SAT elastic-filament equation and supplies one definite sign correction under the source's own positive-coefficient assumptions. It is not authenticated historical Tern participation, not BEDROCK, not a spacetime/field-equation solution, not an ER proof, and not established physics.

## One object, one operation, one result, one cursor

- **Object:** the historical single-filament elastic functional and its fourth-order Euler–Lagrange equation.
- **Operation:** substitute an exact closed circular mode, derive the amplitude branch, and test dimensions, sign, limiting behavior, topology, radial stability, and numerical residual.
- **Result:** a stable nonzero `S1` branch exists only below a critical wavenumber. It collapses with a square-root law. The historical expression `omega^4=-2 lambda_s r_h^2/kappa` is negative for positive `kappa,lambda_s,r_h`; it cannot be a real-frequency stability condition. The uniquely justified replacement is the amplitude balance `R^2=R_m^2-kappa q^4/(2 lambda_s)` for this ansatz.
- **Next cursor:** Morrow should recover the source's definition of the parameter and decide whether the closed mode is parameterized by arclength, coordinate length, or another native variable before coupling this branch to a finite resolving sheet.

## Controls, reading, and provenance

Live `BEDROCK.md` was read completely: 77,341 fetched characters, 509 lines, blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`. Subordinate `STATE_OF_THE_THEORY.md` was read completely: 11,012 characters, 155 lines, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. The latter is a subordinate 2026-09-16 snapshot, not a replacement for live BEDROCK.

Tern continuity reads were complete:

- `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-rook-cumulative-checkpoint-20261018-001.md`, blob `cd4eaaf0ae58598026fd28ba89cd946e96a07b44`.
- `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-delta-lambda-root-bifurcation-20261020t10z-s3.md`, blob `2f6d62020ea29e098b43ad0443e26f8ce4f885c4`.
- `WORKSPACES/TERN/INBOX.md`, blob `00e28042dde847ef2233e9257a21e13789126edb`.

Mersearch-first was honored. The shared request remains occupied by `2026-10-21-orson-nlm-big-haul-math-001` and was not overwritten. Its completed three-repository run manifest is blob `0f017d6f557d24c721e417d1fe3c49abf0653991`; the compact receipt is blob `579c3489dbd6e997653230cfcda509fa827fea81`, derived from results SHA-256 `8f5deb2a369fb59d4b14413ec9b1909253f6361342dfbb13a83f3151c1ddc4c5`. Coverage was 13,897 files, 23,825,506 records, 34,983 hits, and 1,627 distinct sources. This is navigation evidence, not source authority or exhaustive coverage.

Primary historical source:

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Cyclerev.txt`, full read, 43,300 characters, 1,949 lines, blob `0d02110e2787e49eb2bbe251fe15af56e35a8d4f`. Read at repository snapshot commit `8394f761d94fb2869266cb5b377a320ab4cfb235`, dated 2026-10-21T14:32:39Z.
- Terminology/normalization cross-record: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_H(s)H Skill Development — raw - .TXT`, full read, 482,384 characters, 4,585 lines, blob `27823a532a2f33d7c30c88efa6a5e1e819bfb3b9`. The equation appears there as historical `L_tube`/`N80-N81`; this cross-record is not promoted as authority.

Verbatim normalized math retained from that record:

```text
[N80] Single-filament elastic Lagrangian
L_tube =
(κ/2)|H''|^2
+
(λ_s/2)(|H|^2 - R_m^2)^2

[N81] Single-filament Euler-Lagrange equation
κH^(4) + 2λ_s(|H|^2 - R_m^2)H = 0
```

The older audit record also prints and then questions the proposed resonance form

```text
ω^4 = -2 λ_s r_h^2 / κ
```

and explicitly revokes premature validation while requesting a full variation, dimensions, and a justified resonance condition. This packet performs that narrow audit. It does not declare the historical construction superseded.

## Random substantial reading

An executed neutral GitHub search for `construction` produced a 40-path pool: 20 results from each of `Satobloc/SAT_THEORY_ARCHIVE_2023-25` and `Satobloc/HsH`. A runtime draw gave `u=0.26308232954740707`, index `floor(40u)=10`, selecting `Satobloc/SAT_THEORY_ARCHIVE_2023-25/WORKING_GROUP_1.txt`. The file was read completely: 29,984 characters, 384 lines, blob `dcadbd209733356a6b76c78d99df967e43842814`.

Honest takeaway: the file is a mixed working-group capture, not theory authority. Its durable scientific value here is the already-cautious distinction between a centerline and a positive-extent core plus a warning that finite-sheet thickness can confound readout dimension. That supports testing a geometric carrier without treating a curve solution as a finite core.

## BEDROCK comparison

The tested assumptions are narrower than BEDROCK and remain tentative:

1. The source uses a Euclidean four-vector `H` and an unspecified parameter. Live BEDROCK requires exact native geometry and local Minkowski recovery before physical interpretation. Therefore the Euclidean closed-ring ansatz is only an internal model calculation.
2. `R_m`, `kappa`, and `lambda_s` are free model parameters; none is a protected primitive or empirical constant.
3. A one-dimensional ring is not the BEDROCK finite core, resolving sheet, worldtube, or ER object. Its image topology is tested only as `S1 -> point`.
4. No lattice, raw theta-4 readout, `B`, Q-mass law, repair factor, or target value is used.
5. The result does not alter or promote BEDROCK. It corrects only a definite sign inconsistency inside the printed historical ansatz.

## Assumptions and units

Take `s` to have dimension length and `H(s)` to have dimension length. Interpret the printed `L_tube` as an energy-per-parameter-length density

\[
f[H]=\frac{\kappa}{2}|H''|^2+\frac{\lambda_s}{2}(|H|^2-R_m^2)^2.
\]

Then

\[
[s]=[H]=[R_m]=L,\quad [H'']=L^{-1},\quad
[\kappa]=E L,\quad [\lambda_s]=E L^{-5},\quad [f]=E L^{-1}.
\]

Both Euler–Lagrange terms have dimension `E/L^2`:

\[
[\kappa H^{(4)}]=(EL)(L^{-3})=EL^{-2},
\]

\[
[2\lambda_s(|H|^2-R_m^2)H]=(EL^{-5})(L^2)(L)=EL^{-2}.
\]

If the source intended a dimensionless parameter rather than length, the coefficient units change. That source ambiguity remains unresolved; the algebra below is unchanged.

## Exact derivation

The higher-order Euler–Lagrange equation for `f(H,H'')` is

\[
\frac{\partial f}{\partial H}+\frac{d^2}{ds^2}
\left(\frac{\partial f}{\partial H''}\right)=0,
\]

so

\[
\boxed{\kappa H^{(4)}+2\lambda_s(|H|^2-R_m^2)H=0}.
\]

Choose the exact closed planar mode embedded in four dimensions,

\[
H(s)=R(\cos qs,\sin qs,0,0),\qquad q=\frac{2\pi n}{L_p},\quad n\in\mathbb Z_{>0}.
\]

It satisfies

\[
|H|^2=R^2,\qquad H^{(4)}=q^4H.
\]

For `R>0`, substitution gives the scalar amplitude equation

\[
\kappa q^4+2\lambda_s(R^2-R_m^2)=0,
\]

and hence

\[
\boxed{R_*^2=R_m^2-\frac{\kappa q^4}{2\lambda_s}}.
\]

For positive coefficients the nonzero branch exists iff

\[
q<q_c,\qquad
\boxed{q_c=\left(\frac{2\lambda_sR_m^2}{\kappa}\right)^{1/4}}.
\]

The radial energy section is

\[
f_q(R)=\frac{\kappa}{2}q^4R^2+
\frac{\lambda_s}{2}(R^2-R_m^2)^2.
\]

Its stationary points are `R=0` and `R=R_*`. The Hessians are

\[
f_q''(0)=\kappa q^4-2\lambda_sR_m^2,
\]

\[
\boxed{f_q''(R_*)=4\lambda_sR_*^2>0}.
\]

Thus the nonzero circle is a strict radial minimum below criticality. The collapsed branch becomes radially stable above criticality. At `q=q_c` the branches meet.

Topology of the image:

\[
q<q_c: S^1,\qquad q\ge q_c:\{0\}
\]

for the minimum-energy branch. This is branch topology, not spacetime topology and not a two-ended throat.

Near criticality write `q=q_c-epsilon`. Since

\[
q_c^4-q^4=4q_c^3\epsilon+O(\epsilon^2),
\]

\[
\boxed{R_*=\sqrt{\frac{2\kappa q_c^3}{\lambda_s}}\sqrt{\epsilon}
+O(\epsilon^{3/2})}.
\]

Limits:

\[
q\to0,\;\kappa\to0,\;\text{or}\;\lambda_s\to\infty
\quad\Longrightarrow\quad R_*\to R_m.
\]

Definite sign correction: for positive `kappa`, `lambda_s`, and `r_h`,

\[
-\frac{2\lambda_s r_h^2}{\kappa}<0.
\]

Therefore the printed `omega^4` expression has no real nonzero `omega`. Within the printed functional the real circular balance is the radius/wavenumber relation above; changing the sign would require changing the functional or its coefficient assumptions, which this packet does not do.

## Executed fixture and output

Fixture: `kappa=0.02 J m`, `lambda_s=1 J/m^5`, `R_m=1 m`, `L_p=2pi m`, hence `q_n=n m^-1` and `q_c=3.16227766017 m^-1`. These are transparent test values, not a fit.

```text
TERN ELASTIC-RING BIFURCATION GATE
kappa=0.02 J m  lambda_s=1 J/m^5  R_m=1 m
period=6.28318530718 m  q_c=3.16227766017 1/m
n  q[1/m]  R_*[m]       topology  f(R_*)[J/m]  f''(R_*)[J/m^3]  max|EL|[J/m^2]
1   1.000   0.994987437        S1     0.009950000         3.960000000      8.810183e-10
2   2.000   0.916515139        S1     0.147200000         3.360000000      1.260142e-09
3   3.000   0.435889894        S1     0.481950000         0.760000000      1.477453e-09
4   4.000   0.000000000     point     0.500000000         3.120000000      0.000000e+00

Near-critical square-root branch, q=q_c-epsilon:
epsilon[1/m]  R_*[m]         R_*/sqrt(epsilon)[sqrt(m)]
     1.0e-02  1.1220176929e-01                1.1220176929
     1.0e-04  1.1246559764e-02               1.12465597644
     1.0e-06  1.1246823836e-03               1.12468238363
     1.0e-08  1.1246826310e-04               1.12468263095
predicted coefficient=1.12468265038 sqrt(m)
algebra/dimension/sign/topology assertions = PASS
historical omega^4=-2*lambda_s*r_h^2/kappa with positive inputs = NEGATIVE (no real omega)
plot bytes=108860
plot sha256=f9d60e3ab704d2e40bb4cc334633978f6aeb5b7339ec0e76c0b2c06c511d96b9
```

The periodic spectral fourth derivative gives maximum Euler–Lagrange residuals below `1.5e-9 J/m^2` for the three nonzero fixtures.

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
"""Exact circular branch of the historical SAT elastic-filament functional."""

from __future__ import annotations

import hashlib
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np

KAPPA = 0.02
LAMBDA_S = 1.0
R_M = 1.0
L_PERIOD = 2.0 * np.pi

def radius_sq(q: float) -> float:
    return R_M**2 - KAPPA * q**4 / (2.0 * LAMBDA_S)

def energy_density(R, q: float):
    return 0.5 * KAPPA * q**4 * R**2 + 0.5 * LAMBDA_S * (R**2 - R_M**2) ** 2

def radial_hessian(R: float, q: float) -> float:
    return KAPPA * q**4 + 2.0 * LAMBDA_S * (3.0 * R**2 - R_M**2)

def spectral_d4(values: np.ndarray, period: float) -> np.ndarray:
    n = values.shape[0]
    dx = period / n
    k = 2.0 * np.pi * np.fft.fftfreq(n, d=dx)
    return np.fft.ifft((k**4)[:, None] * np.fft.fft(values, axis=0), axis=0).real

def residual_norm(R: float, q: float, samples: int = 256) -> float:
    s = np.arange(samples) * L_PERIOD / samples
    H = np.column_stack((R * np.cos(q * s), R * np.sin(q * s),
                         np.zeros(samples), np.zeros(samples)))
    H4 = spectral_d4(H, L_PERIOD)
    residual = KAPPA * H4 + 2.0 * LAMBDA_S * (
        np.sum(H * H, axis=1) - R_M**2
    )[:, None] * H
    return float(np.max(np.linalg.norm(residual, axis=1)))

def main() -> None:
    q_c = (2.0 * LAMBDA_S * R_M**2 / KAPPA) ** 0.25
    print("TERN ELASTIC-RING BIFURCATION GATE")
    print(f"kappa={KAPPA:.8g} J m  lambda_s={LAMBDA_S:.8g} J/m^5  R_m={R_M:.8g} m")
    print(f"period={L_PERIOD:.12g} m  q_c={q_c:.12g} 1/m")
    print("n  q[1/m]  R_*[m]       topology  f(R_*)[J/m]  f''(R_*)[J/m^3]  max|EL|[J/m^2]")
    for n in range(1, 5):
        q = 2.0 * np.pi * n / L_PERIOD
        rsq = radius_sq(q)
        if rsq > 0.0:
            R = float(np.sqrt(rsq)); topology = "S1"; residual = residual_norm(R, q)
        else:
            R = 0.0; topology = "point"; residual = 0.0
        print(f"{n:d}  {q:6.3f}  {R:12.9f}  {topology:>8s}  "
              f"{energy_density(R, q):14.9f}  {radial_hessian(R, q):18.9f}  {residual:16.6e}")
    epsilons = np.array([1e-2, 1e-4, 1e-6, 1e-8])
    print("\nNear-critical square-root branch, q=q_c-epsilon:")
    print("epsilon[1/m]  R_*[m]         R_*/sqrt(epsilon)[sqrt(m)]")
    for eps in epsilons:
        q = q_c - eps; R = np.sqrt(radius_sq(q))
        print(f"{eps:12.1e}  {R:14.10e}  {R/np.sqrt(eps):26.12g}")
    predicted = np.sqrt(2.0 * KAPPA * q_c**3 / LAMBDA_S)
    print(f"predicted coefficient={predicted:.12g} sqrt(m)")
    for n in (1, 2, 3):
        q = float(n); R2 = radius_sq(q)
        assert R2 > 0.0
        assert abs(KAPPA * q**4 + 2.0 * LAMBDA_S * (R2 - R_M**2)) < 1e-14
        assert radial_hessian(np.sqrt(R2), q) > 0.0
    assert radius_sq(4.0) < 0.0
    assert radial_hessian(0.0, 4.0) > 0.0
    assert -2.0 * LAMBDA_S * R_M**2 / KAPPA < 0.0
    print("algebra/dimension/sign/topology assertions = PASS")
    print("historical omega^4=-2*lambda_s*r_h^2/kappa with positive inputs = NEGATIVE (no real omega)")
    radii = np.linspace(0.0, 1.25, 800)
    qs = np.linspace(0.0, 1.15 * q_c, 800)
    branch = np.sqrt(np.maximum(0.0, np.array([radius_sq(q) for q in qs])))
    fig, axes = plt.subplots(1, 2, figsize=(10.5, 4.2))
    for n in range(1, 5): axes[0].plot(radii, energy_density(radii, float(n)), label=f"n={n}")
    axes[0].set(xlabel="ring radius R [m]", ylabel="energy density f [J/m]",
                title="Historical elastic functional: radial sections")
    axes[0].legend(); axes[0].grid(alpha=0.25)
    axes[1].plot(qs, branch, color="black")
    axes[1].axvline(q_c, color="tab:red", ls="--", label=f"q_c={q_c:.4f} m^-1")
    axes[1].set(xlabel="wavenumber q [1/m]", ylabel="stationary radius R_* [m]",
                title="Closed-ring branch annihilation")
    axes[1].legend(); axes[1].grid(alpha=0.25)
    fig.tight_layout()
    out = Path("tern_elastic_ring_bifurcation_20261022.png")
    fig.savefig(out, dpi=180)
    data = out.read_bytes()
    print(f"plot bytes={len(data)}")
    print(f"plot sha256={hashlib.sha256(data).hexdigest()}")

if __name__ == "__main__": main()
```

Python file SHA-256: `3d158c28c876c9c0e136bc4ffb2a7f8ee3439f6efd234c3edc37e8bc43e49f8e`.

## Complete Lean source

```lean
import Mathlib

namespace TernElasticRing

variable {κ λ q R Rm : ℝ}

def amplitudeCoeff (κ λ q R Rm : ℝ) : ℝ :=
  κ * q^4 + 2 * λ * (R^2 - Rm^2)

theorem circular_branch_identity
    (hλ : λ ≠ 0)
    (hR : R^2 = Rm^2 - κ * q^4 / (2 * λ)) :
    amplitudeCoeff κ λ q R Rm = 0 := by
  dsimp [amplitudeCoeff]
  rw [hR]
  field_simp
  ring

theorem historical_negative_frequency
    (hκ : 0 < κ) (hλ : 0 < λ) (hr : 0 < R) :
    -2 * λ * R^2 / κ < 0 := by
  positivity

theorem branch_radius_positive
    (h : κ * q^4 < 2 * λ * Rm^2) (hλ : 0 < λ) :
    0 < Rm^2 - κ * q^4 / (2 * λ) := by
  have hd : 0 < 2 * λ := by positivity
  apply (sub_pos).2
  exact (div_lt_iff₀ hd).2 (by nlinarith)

theorem nonzero_branch_radial_hessian
    (hλ : 0 < λ) (hR : 0 < R) :
    0 < 4 * λ * R^2 := by
  positivity

theorem critical_coefficient_zero
    (h : κ * q^4 = 2 * λ * Rm^2) :
    κ * q^4 - 2 * λ * Rm^2 = 0 := by
  linarith

end TernElasticRing
```

Lean file SHA-256: `fda54183cafdc500a76520dc27243cf3e84c7e956c4eec4923f7e0e93c8a394b`. Lean was unavailable in the execution environment (`lean: command not found`), so this is an uncompiled formal certificate and no proof-check claim is made.

## Disposition

- Source reconstruction: **PASS**, with exact path, blob, snapshot commit/date, and retained original formulas.
- Euler–Lagrange algebra: **PASS** under the stated functional.
- Dimensions: **PASS conditionally** on length-parameter interpretation; source parameter units remain unresolved.
- Historical negative `omega^4` as real stability frequency for positive coefficients: **FAIL**.
- Circular amplitude relation, existence threshold, limits, radial sign, branch topology, and numerics: **PASS**.
- Full perturbative stability beyond the radial amplitude sector: **UNRESOLVED**.
- Finite core, resolving-sheet intersection, Minkowski causal structure, field equations, and physical particle identity: **UNRESOLVED / NOT INFERRED**.
- CODATA active-verification program: **NOT ELIGIBLE**. The fixture contains free parameters and supplies no independent observable or untuned prediction.
- BEDROCK: **unchanged**.

Morrow handoff: recover the original meaning and units of the curve parameter and `R_m`; then test the closed branch under the finite-sheet intersection `Sigma_t^(h) intersect N_epsilon(F)` without identifying the centerline ring with the finite core.
