# Morrow packet — archived UI scale-plus-SO(4) kinematics

**Status:** historical construction recovered; velocity identity **PASSES with a domain condition**; archived \(L_{UI}\) **FAILS as the point-trajectory kinetic term**; inverse control recovery and particle-topology claims remain unsupported. This is not a BEDROCK amendment or a physical validation.

## Reading and provenance

- Live BEDROCK.md read in full: 441 lines / 62,982 characters, blob 54b893a1b10206f088f54dae961cc03d37012bac.
- Subordinate STATE_OF_THE_THEORY.md read in full: 155 lines / 11,012 characters, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- Morrow packet WORKSPACES/SABLE/WAKE_PACKETS/REV-004-MORROW-REENTRY.md read in full: 63 lines / 4,327 characters, blob a86039b22af0d8610c699befa076121dc3fb47dc. It identifies Morrow's preserved method as conversation-source identity, contextual provenance, and source-family reconstruction; it grants no live lease.
- Mersearch remained occupied by 2026-10-20-orson-braid-smoothing-q-rules-001, status requested, blob 825a9ca7ae39c210b78dc07973525be05c0a3229. No overwrite was attempted; repository source search was the disclosed fallback.
- Random substantial reading selected by shuf from eight declared archive candidates: 2026/SAT CORE — UI CONFIG.txt, read in full, 50 lines / 6,526 characters, blob 6817caf68943593f31d72d51798e0ba4589624a4, commit dd4719b9c6ab59322c8d2351483feffb08810686, 2026-06-01. The exact same blob survives at HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/UI CONFIG.txt, commit aaa0511fa46a0f8afe2324df02084cd1dafccd1f, 2026-10-02.

Honest takeaway: the scale-plus-rotation generator contains a sound bounded kinematic identity, but the source overextends it into a universal physical generator, point-particle energy, unique inverse map, lattice, mass, spectrum, and topology without the needed definitions or proofs. Byte-identical duplication establishes source-family continuity, not independent support. Terms tracked without supersession: Universal Indicatrix, scale and rotation controls, 4D hypersphere lattice, and later UI kinematics / scale-rotation split.

## Verbatim recovered mathematics

From both exact source copies:

\[
y^\mu(\lambda)=r(\lambda)R^\mu{}_\nu(\lambda)x_0^\nu
\]

\[
\dot y^\mu=\dot r\,\hat y^\mu+\Omega^\mu{}_\nu y^\nu,
\qquad \Omega_{\mu\nu}=\dot R R^{-1}
\]

\[
L_{UI}=\frac12\dot r^2+\frac12r^2\Omega_{\mu\nu}\Omega^{\mu\nu}.
\]

The source also states that trajectory-to-controls recovery is reversible and that the controls generate every possible worldline. Those stronger statements are tested rather than imported.

## Exact reconstruction and correction

Assume \(x_0\in S^3\), \(R(\lambda)\in SO(4)\), and define \(u=Rx_0\). Then \(\|u\|=1\), \(y=ru\), and

\[
\Omega=\dot R R^{-1},\qquad \Omega^\mathsf T=-\Omega.
\]

Differentiation gives

\[
\dot y=\dot r\,u+r\dot R x_0=\dot r\,u+\Omega y.
\]

For \(r>0\), \(u=y/\|y\|=\hat y\), so the archived velocity formula is exact. At \(r=0\), \(\hat y\) is undefined although the product derivative can be finite:

\[
\left.\frac{d}{d\lambda}(rRx_0)\right|_{r=0}=\dot r\,Rx_0.
\]

The uniquely justified correction is to use \(u=Rx_0\), not \(\hat y\), at the origin.

Skew-symmetry gives \(u^\mathsf T\Omega u=0\), hence

\[
\|\dot y\|^2=\dot r^2+r^2\|\Omega u\|^2,
\qquad
L_{\rm path}=\frac12\dot r^2+\frac12r^2\|\Omega u\|^2.
\]

The archived rotational term uses \(\|\Omega\|_F^2=\Omega_{\mu\nu}\Omega^{\mu\nu}\), a metric on the entire rotation generator, not the speed of the selected point. In two-plane normal form,

\[
\Omega=\begin{pmatrix}
0&-\omega_1&0&0\\
\omega_1&0&0&0\\
0&0&0&-\omega_2\\
0&0&\omega_2&0
\end{pmatrix},\quad u=(a,b,c,d),
\]

\[
\|\Omega u\|^2=\omega_1^2(a^2+b^2)+\omega_2^2(c^2+d^2),
\qquad
\|\Omega\|_F^2=2(\omega_1^2+\omega_2^2).
\]

They are not equal in general. The archived \(L_{UI}\) can be retained only as a separately declared group/control-space cost with a stated normalization; it cannot silently be called the kinetic energy of \(y\).

## Dimensions, limits, sign, topology, and identifiability

If \(\lambda\) is time and \(r\) is length, then

\[
[\dot r]=LT^{-1},\quad [\Omega]=T^{-1},\quad
[\dot r^2]=[r^2\Omega^2]=L^2T^{-2}.
\]

The sum is dimensionally consistent as a specific kinetic scale. A physical Lagrangian still needs its measure and mass/tension normalization. Both candidate quadratic forms are nonnegative. Their rotational pieces vanish as \(r\to0\), but the archived \(\hat y\) chart fails at that coordinate origin; this is a readout singularity, not a demonstrated physical singularity.

The inverse map is not unique. For \(x_0=e_1\), every \(Q\in SO(4)\) satisfying \(Qe_1=e_1\) belongs to an \(SO(3)\) stabilizer, and \((RQ)e_1=Re_1\). One curve in \(S^3\) cannot determine all six rotational controls without a gauge/frame rule. A path in \(SO(4)\), or its image in \(S^3\), also does not by itself establish a knot, link, particle identity, or protected worldtube topology.

## Numerical result and CODATA gate

The executed test used two simultaneous rotation planes, \(\omega_1=0.7\), \(\omega_2=-1.1\), \(r=1.62\), \(\dot r=0.4\), and a unit \(x_0\). It verified the velocity identity to \(1.24\times10^{-16}\) and a centered finite difference to \(1.59\times10^{-10}\). It found

\[
\tfrac12\|\dot y\|^2=1.28040056,\qquad L_{UI}=4.54148,
\]

a ratio 3.54692128532. A nontrivial stabilizer rotation changed the control matrix by Frobenius distance 0.876293310913 while changing the generated point by zero.

The corrected statement passes the internal kinematic gate. The active CODATA eligibility screen terminates as **NOT APPLICABLE / NO PHYSICAL RESIDUAL YET**: the identity contains no independently predicted dimensional constant or observable. The only relevant versioned constant for a future physical map is the 2022 CODATA exact \(c=299\,792\,458\ {\rm m\,s^{-1}}\); the source's identification \(c=\dot r\) supplies no unit map, uncertainty model, or independent prediction. No tuned fit is counted as verification.

## Complete executable Python and plotting source

~~~python
#!/usr/bin/env python3
"""Exact/numerical audit of the archived UI scale-plus-SO(4) kinematics."""

from __future__ import annotations

import argparse
import math
from pathlib import Path

import numpy as np


def rot2(angle: float) -> np.ndarray:
    c, s = math.cos(angle), math.sin(angle)
    return np.array([[c, -s], [s, c]], dtype=float)


def drot2(angle: float, omega: float) -> np.ndarray:
    c, s = math.cos(angle), math.sin(angle)
    return omega * np.array([[-s, -c], [c, -s]], dtype=float)


def block4(a: np.ndarray, b: np.ndarray) -> np.ndarray:
    z = np.zeros((2, 2))
    return np.block([[a, z], [z, b]])


def trajectory(t: float, x0: np.ndarray) -> tuple[np.ndarray, np.ndarray, np.ndarray, float, float]:
    r = 1.3 + 0.4 * t
    rdot = 0.4
    w1, w2 = 0.7, -1.1
    R = block4(rot2(w1 * t), rot2(w2 * t))
    Rdot = block4(drot2(w1 * t, w1), drot2(w2 * t, w2))
    omega = Rdot @ R.T
    y = r * (R @ x0)
    ydot_exact = rdot * (R @ x0) + r * (Rdot @ x0)
    return y, ydot_exact, omega, r, rdot


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--plot", type=Path)
    args = parser.parse_args()

    x0 = np.array([0.5, -0.4, 0.3, math.sqrt(0.5)])
    assert np.isclose(x0 @ x0, 1.0)
    t = 0.8
    y, ydot, omega, r, rdot = trajectory(t, x0)
    u = y / np.linalg.norm(y)
    ydot_source = rdot * u + omega @ y

    h = 1e-6
    yp = trajectory(t + h, x0)[0]
    ym = trajectory(t - h, x0)[0]
    ydot_fd = (yp - ym) / (2.0 * h)

    cross = float(u @ (omega @ u))
    speed2 = float(ydot @ ydot)
    point_rot2 = float((omega @ u) @ (omega @ u))
    decomposition = rdot**2 + r**2 * point_rot2
    contraction = float(np.sum(omega * omega))
    L_source = 0.5 * rdot**2 + 0.5 * r**2 * contraction
    L_point = 0.5 * speed2

    e1 = np.array([1.0, 0.0, 0.0, 0.0])
    Q = block4(np.eye(2), rot2(0.63))
    R = block4(rot2(0.41), rot2(-0.22))
    same_image_error = np.linalg.norm((R @ Q) @ e1 - R @ e1)
    different_controls = np.linalg.norm(R @ Q - R)

    R0 = block4(rot2(0.2), rot2(-0.3))
    r0_product_derivative = R0 @ x0

    print("UI SCALE+SO(4) AUDIT")
    print(f"norm_x0 = {np.linalg.norm(x0):.15f}")
    print(f"orthogonality_error_R = {np.linalg.norm((y/r) @ (y/r) - 1.0):.3e}")
    print(f"skew_error_Omega = {np.linalg.norm(omega + omega.T):.3e}")
    print(f"velocity_source_error = {np.linalg.norm(ydot_source-ydot):.3e}")
    print(f"velocity_finite_difference_error = {np.linalg.norm(ydot_fd-ydot):.3e}")
    print(f"radial_rotational_cross_term = {cross:.3e}")
    print(f"speed_squared_exact = {speed2:.12f}")
    print(f"speed_squared_decomposition = {decomposition:.12f}")
    print(f"frobenius_Omega_squared = {contraction:.12f}")
    print(f"point_rotational_speed_squared = {point_rot2:.12f}")
    print(f"L_source = {L_source:.12f}")
    print(f"L_point_kinetic = {L_point:.12f}")
    print(f"L_ratio_source_to_point = {L_source/L_point:.12f}")
    print(f"stabilizer_same_image_error = {same_image_error:.3e}")
    print(f"stabilizer_control_distance = {different_controls:.12f}")
    print(f"r0_product_derivative_norm = {np.linalg.norm(r0_product_derivative):.12f}")
    print("r0_hat_y_status = undefined")
    print("dimension_test(lambda=time): PASS [dot_r]=L/T and [r*Omega]=L/T")
    print("velocity_identity: PASS for r>0 and unit x0")
    print("source_L_equals_point_kinetic: FAIL in general")
    print("controls_from_curve_unique: FAIL (SO(3) stabilizer)")
    print("topological_particle_claim: NOT IMPLIED by a single SO(4) trajectory")

    if args.plot:
        ts = np.linspace(0.0, 8.0, 500)
        vals = []
        for ti in ts:
            yi, vi, oi, ri, rdi = trajectory(float(ti), x0)
            exact = 0.5 * float(vi @ vi)
            src = 0.5 * rdi**2 + 0.5 * ri**2 * float(np.sum(oi * oi))
            vals.append((exact, src))
        vals = np.asarray(vals)
        import matplotlib.pyplot as plt
        fig, ax = plt.subplots(figsize=(7.2, 4.2))
        ax.plot(ts, vals[:, 0], label=r"$\frac{1}{2}|\dot y|^2$")
        ax.plot(ts, vals[:, 1], label=r"archived $L_{UI}$")
        ax.set_xlabel(r"$\lambda$ (time units)")
        ax.set_ylabel("specific kinetic scale (length²/time²)")
        ax.set_title("Point-path kinetic term vs archived SO(4) group term")
        ax.grid(alpha=0.25)
        ax.legend()
        fig.tight_layout()
        fig.savefig(args.plot, dpi=180)
        print(f"plot = {args.plot}")


if __name__ == "__main__":
    main()
~~~

Actual Python 3.12.14 output:

~~~text
UI SCALE+SO(4) AUDIT
norm_x0 = 1.000000000000000
orthogonality_error_R = 0.000e+00
skew_error_Omega = 9.611e-17
velocity_source_error = 1.241e-16
velocity_finite_difference_error = 1.593e-10
radial_rotational_cross_term = 3.794e-17
speed_squared_exact = 2.560801120000
speed_squared_decomposition = 2.560801120000
frobenius_Omega_squared = 3.400000000000
point_rotational_speed_squared = 0.914800000000
L_source = 4.541480000000
L_point_kinetic = 1.280400560000
L_ratio_source_to_point = 3.546921285320
stabilizer_same_image_error = 0.000e+00
stabilizer_control_distance = 0.876293310913
r0_product_derivative_norm = 1.000000000000
r0_hat_y_status = undefined
dimension_test(lambda=time): PASS [dot_r]=L/T and [r*Omega]=L/T
velocity_identity: PASS for r>0 and unit x0
source_L_equals_point_kinetic: FAIL in general
controls_from_curve_unique: FAIL (SO(3) stabilizer)
topological_particle_claim: NOT IMPLIED by a single SO(4) trajectory
plot = morrow_ui_audit.png
~~~

## Complete Lean 4 / Mathlib source

~~~lean
import Mathlib

/- Algebraic audit of a two-plane normal form for an so(4) generator.
   These theorems prove kinematics only, not SAT particle physics. -/

theorem so4_block_cross_zero
    (a b c d w₁ w₂ : ℝ) :
    a * (-w₁*b) + b * (w₁*a) +
    c * (-w₂*d) + d * (w₂*c) = 0 := by
  ring

theorem so4_block_rot_norm
    (a b c d w₁ w₂ : ℝ) :
    (-w₁*b)^2 + (w₁*a)^2 + (-w₂*d)^2 + (w₂*c)^2 =
    w₁^2 * (a^2+b^2) + w₂^2 * (c^2+d^2) := by
  ring

theorem ui_speed_decomposition
    (a b c d r rd w₁ w₂ : ℝ)
    (hunit : a^2+b^2+c^2+d^2 = 1) :
    (rd*a-r*w₁*b)^2 + (rd*b+r*w₁*a)^2 +
    (rd*c-r*w₂*d)^2 + (rd*d+r*w₂*c)^2 =
    rd^2 + r^2 * (w₁^2*(a^2+b^2) + w₂^2*(c^2+d^2)) := by
  nlinarith [so4_block_cross_zero a b c d w₁ w₂,
    so4_block_rot_norm a b c d w₁ w₂]

theorem archived_group_term_not_point_term :
    let a : ℝ := 1
    let b : ℝ := 0
    let c : ℝ := 0
    let d : ℝ := 0
    let w₁ : ℝ := 1
    let w₂ : ℝ := 2
    w₁^2*(a^2+b^2) + w₂^2*(c^2+d^2) ≠
      2*(w₁^2+w₂^2) := by
  norm_num

theorem stabilizer_example_same_image :
    let e₁ : Fin 4 → ℝ := ![1, 0, 0, 0]
    let Q : Matrix (Fin 4) (Fin 4) ℝ :=
      !![1,0,0,0;
         0,1,0,0;
         0,0,0,-1;
         0,0,1,0]
    Q *ᵥ e₁ = e₁ := by
  ext i
  fin_cases i <;> norm_num [Matrix.mulVec, dotProduct]
~~~

Lean was not installed in this runtime, so compilation is not claimed. Python and plotting executed successfully.

## Verdict and discriminator

**Corrected partial pass.** Retain the trajectory and corrected velocity decomposition as SRC/CANDIDATE kinematics. Do not retain the archived \(L_{UI}\) as point kinetic energy, unique control inversion, lattice, mass, particle identity, or topology. This conflicts with BEDROCK if UI is promoted from analytical generator to ontology, if raw theta4/mass is restored, or if the lattice controls physics.

The exact next discriminator is a source or new derivation that specifies whether \(L_{UI}\) is (a) point-path kinetic energy or (b) a left/right-invariant metric on \(SO(4)\times\mathbb R_+\), including normalization, gauge quotient by the \(SO(3)\) stabilizer, parameter measure, and an independently measurable observable. Only then can a CODATA residual or tuned-versus-independent prediction test be meaningful.

## Handoff to Kestrel

Find the earliest UI/TX source that defines the intended metric and quotient: test whether the full \(\Omega_{\mu\nu}\Omega^{\mu\nu}\) term was deliberately a control-space cost or was mistakenly substituted for \(\|\Omega u\|^2\).
