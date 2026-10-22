# Morrow source-and-test packet: curve-parameter ambiguity gate

**Status:** TENTATIVE HISTORICAL RECONSTRUCTION / EXACT ALGEBRAIC GATE / NUMERICAL CONTROL. No BEDROCK promotion and no claim of established physics.

## Result

The historical record itself contains both an early arclength declaration and a later correction that the fourth-order calculation is parameter-dependent because unit-speed is not enforced. That conflict cannot be repaired by silently setting the curve parameter equal to physical arclength.

For the exact planar ring

\[
H(s)=R(\cos qs,\sin qs,0,0),\quad H''''=q^4H,
\]

the recovered unconstrained equation

\[
\kappa H''''+2\lambda_s(|H|^2-R_m^2)H=0
\]

gives

\[
R^2=R_m^2-\frac{\kappa q^4}{2\lambda_s}.
\]

If one additionally sets `s` to arclength, then `|H'|=Rq=1`. Substituting this condition into the *unconstrained* equation yields a tempting but hybrid polynomial

\[
\eta y^3-y+1=0,\qquad y=(qR_m)^2,\qquad
\eta=\frac{\kappa}{2\lambda_sR_m^6}.
\]

It has positive roots only for \(0<\eta\le4/27\). This threshold is **not** a prediction of the correctly constrained problem. A genuine arclength/inextensibility constraint requires a multiplier:

\[
\mathcal L_c=\frac{\kappa}{2}|H''|^2+
\frac{\lambda_s}{2}(|H|^2-R_m^2)^2+
\frac{\tau}{2}(|H'|^2-1),
\]

\[
\kappa H''''-(\tau H')'+2\lambda_s(|H|^2-R_m^2)H=0.
\]

For constant \(\tau\), the unit-speed circle has \(R=q^{-1}\) and is stationary when

\[
\boxed{\tau(q)=-\kappa q^2-2\lambda_s(q^{-4}-R_m^2q^{-2})}.
\]

Thus every tested \(q>0\) can be balanced by the constraint reaction. The \(4/27\) gate diagnoses an omitted multiplier; it is not an independently testable physical bound.

## Provenance and exact historical record

- Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Cyclerev.txt`.
- Source blob: `0d02110e2787e49eb2bbe251fe15af56e35a8d4f`.
- Full read: 43,300 characters, 1,949 lines.
- Version snapshot: commit `8394f761d94fb2869266cb5b377a320ab4cfb235`, 2026-10-21T14:32:39Z.
- Original recovered mathematics, retained without replacing the source:

\[
L_{tube}=\frac{\kappa}{2}|H''|^2+
\frac{\lambda_s}{2}(|H|^2-R_m^2)^2,
\]

\[
\kappa H^{(4)}+2\lambda_s(|H|^2-R_m^2)H=0,
\]

and the historical harmonic substitution produced

\[
\omega^4=-\frac{2\lambda_s r_h^2}{\kappa}.
\]

- Exact source anchors: the Cycle-2 feedback at lines 1268–1272 says to define `H: R -> R^4` and either enforce `|H'(lambda)|=1` or drop the arclength assumption. Cycle-3 lines 1472–1473 explicitly mark `|H''|` parameter-dependent rather than intrinsic. Lines 1499–1509 state that unit-speed is not enforced. Lines 1825–1837 retain the fourth-order equation only under restricted parameterization assumptions.
- Terminology tracking: early `worldline parameterized by arc-length lambda` becomes `parameter-dependent kinematic baseline`; neither wording is declared superseded here. They are preserved as a historical conflict requiring an explicit model choice.

## Derivation and checks

### 1. Dimensions

Take `[s]=L`, `[H]=L`, and the functional integral to have energy. Then

\[
[\kappa]=EL,\qquad [\lambda_s]=EL^{-5},\qquad [\tau]=EL^{-1}.
\]

Every term in the constrained Euler–Lagrange equation has dimension \(EL^{-2}\):

\[
[\kappa H'''']=(EL)(L^{-3}),\quad
[(\tau H')']=(EL^{-1})(L^{-1}),\quad
[\lambda_s(|H|^2-R_m^2)H]=(EL^{-5})L^3.
\]

### 2. Algebraic threshold in the invalid hybrid

For \(f(y)=\eta y^3-y+1\),

\[
f'(y)=3\eta y^2-1,
\quad y_*=\frac{1}{\sqrt{3\eta}},
\quad f(y_*)=1-\frac{2}{3\sqrt3\sqrt\eta}.
\]

Therefore the positive minimum reaches zero iff \(\eta=4/27\). At the critical point,

\[
f(y)=\frac{(2y-3)^2(y+3)}{27},
\]

so \(y=3/2\) is a double positive root. For \(0<\eta<4/27\) there are two positive roots; for \(\eta>4/27\) there are none.

### 3. Correct constrained variation

Variation of the multiplier term gives `-(tau H')'`; it cannot be omitted after imposing unit speed. For the circle, `H''=-q^2H`, so

\[
\left[\kappa q^4+\tau q^2+2\lambda_s(q^{-2}-R_m^2)\right]H=0.
\]

Solving this scalar coefficient for \(\tau\) gives the boxed formula above. At \(q=1/R_m\), the radial potential vanishes and \(\tau=-\kappa/R_m^2\), a clean sign/limit check.

### 4. Topology and domain

On a fixed periodic domain of length \(L_0\), closure gives \(q=2\pi n/L_0\). Unit speed then gives \(R=L_0/(2\pi n)\). For \(n>1\), the image is still a circle (`S^1`), but the parametrization has degree \(n\) and covers that image repeatedly. It is not a once-covered embedded centerline. Image topology, parametrization degree, and any finite-core worldtube must remain distinct.

### 5. BEDROCK comparison

- Compatible: preserve the exact 4D Euclidean/Class-P coordinate geometry, source chronology, parameter typing, and object/representation/readout separation.
- Specific conflict: silently calling `s` arclength while retaining the unconstrained N81 equation violates the source's own Cycle-2/3 repair and BEDROCK's typed-variable requirement.
- Still missing: finite-core lift, worldtube non-self-overlap, physical calibration of `kappa`, `lambda_s`, `Rm`, or `tau`, and an independent observable.
- No CODATA entry: the packet contains free coefficients and a reaction multiplier but no independent prediction. Any CODATA comparison would be a tuned fit, so the active verification program is not entered.

## Actual numerical output

```text
MULTIPLIER-FREE HYBRID ROOT TEST
critical eta = 4/27 = 0.148148148148148
eta=0.010000000000000 positive y roots=[1.0103125788101082, 9.456492739235916] residuals=[0.0, 3.552713678800501e-15]
eta=0.050000000000000 positive y roots=[1.0594598013021008, 3.8472734917475315] residuals=[0.0, 1.3322676295501878e-15]
eta=0.148148148148148 positive y roots=[1.4999999907542094, 1.5000000092457932] residuals=[0.0, 0.0]
eta=0.160000000000000 positive y roots=[] residuals=[]
critical double root y=3/2: f=0.000e+00, f'=0.000e+00

CONSTRAINED ARCLENGTH TEST (Planck-normalized control: lambda=Rm=1)
eta=0.010000000 q=0.6 tau=-9.883743209877e+00 scalar_residual=+4.441e-16
eta=0.010000000 q=1.0 tau=-2.000000000000e-02 scalar_residual=+0.000e+00
eta=0.010000000 q=1.7 tau=+3.947807880653e-01 scalar_residual=-2.220e-16
eta=0.050000000 q=0.6 tau=-9.912543209877e+00 scalar_residual=+4.441e-16
eta=0.050000000 q=1.0 tau=-1.000000000000e-01 scalar_residual=+0.000e+00
eta=0.050000000 q=1.7 tau=+1.635807880653e-01 scalar_residual=+0.000e+00
eta=0.148148148 q=0.6 tau=-9.983209876543e+00 scalar_residual=+4.441e-16
eta=0.148148148 q=1.0 tau=-2.962962962963e-01 scalar_residual=+0.000e+00
eta=0.148148148 q=1.7 tau=-4.037155082310e-01 scalar_residual=+0.000e+00
eta=0.160000000 q=0.6 tau=-9.991743209877e+00 scalar_residual=+4.441e-16
eta=0.160000000 q=1.0 tau=-3.200000000000e-01 scalar_residual=+0.000e+00
eta=0.160000000 q=1.7 tau=-4.722192119347e-01 scalar_residual=-2.220e-16
eta=0.500000000 q=0.6 tau=-1.023654320988e+01 scalar_residual=+4.441e-16
eta=0.500000000 q=1.0 tau=-1.000000000000e+00 scalar_residual=+0.000e+00
eta=0.500000000 q=1.7 tau=-2.437419211935e+00 scalar_residual=+8.882e-16
FFT vector residual (eta=0.16, q=1.7, N=512) = 1.714e-06
ALL ASSERTIONS PASS
plot=morrow_parameterization_gate_20261022.png
```

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
from __future__ import annotations
import math
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np

def hybrid_polynomial(y, eta):
    return eta * np.asarray(y) ** 3 - np.asarray(y) + 1.0

def positive_real_roots(eta, tol=1e-9):
    roots = np.roots([eta, 0.0, -1.0, 1.0])
    return sorted(float(z.real) for z in roots if abs(z.imag) < tol and z.real > 0.0)

def required_tension(q, kappa, lam, rm):
    return -kappa * q**2 - 2.0 * lam * (q**-4 - rm**2 * q**-2)

def scalar_residual(q, kappa, lam, rm, tau):
    radius = 1.0 / q
    return kappa * q**4 + tau * q**2 + 2.0 * lam * (radius**2 - rm**2)

def spectral_vector_residual(q, kappa, lam, rm, tau, n=512):
    period = 2.0 * math.pi / q
    s = np.linspace(0.0, period, n, endpoint=False)
    h = np.column_stack(((1.0/q)*np.cos(q*s), (1.0/q)*np.sin(q*s)))
    wave = 2.0 * math.pi * np.fft.fftfreq(n, d=period/n)
    def derivative(values, order):
        transformed = np.fft.fft(values, axis=0)
        return np.fft.ifft((1j*wave[:, None])**order * transformed, axis=0).real
    h2, h4 = derivative(h, 2), derivative(h, 4)
    norm2 = np.sum(h*h, axis=1)
    residual = kappa*h4 - tau*h2 + 2.0*lam*(norm2-rm**2)[:, None]*h
    return float(np.max(np.linalg.norm(residual, axis=1)))

def main():
    threshold = 4.0/27.0
    etas = [0.01, 0.05, threshold, 0.16]
    print("MULTIPLIER-FREE HYBRID ROOT TEST")
    print(f"critical eta = 4/27 = {threshold:.15f}")
    for eta in etas:
        roots = positive_real_roots(eta, tol=1e-7)
        values = [float(hybrid_polynomial(y, eta)) for y in roots]
        print(f"eta={eta:.15f} positive y roots={roots} residuals={values}")
    critical_y = 1.5
    critical_residual = float(hybrid_polynomial(critical_y, threshold))
    critical_slope = 3.0*threshold*critical_y**2 - 1.0
    print(f"critical double root y=3/2: f={critical_residual:.3e}, f'={critical_slope:.3e}")
    print("\nCONSTRAINED ARCLENGTH TEST (Planck-normalized control: lambda=Rm=1)")
    for eta in [0.01, 0.05, threshold, 0.16, 0.50]:
        kappa, lam, rm = 2.0*eta, 1.0, 1.0
        for q in [0.6, 1.0, 1.7]:
            tau = required_tension(q, kappa, lam, rm)
            residual = scalar_residual(q, kappa, lam, rm, tau)
            print(f"eta={eta:.9f} q={q:.1f} tau={tau:+.12e} scalar_residual={residual:+.3e}")
    fft_residual = spectral_vector_residual(1.7, 0.32, 1.0, 1.0,
        required_tension(1.7, 0.32, 1.0, 1.0))
    print(f"FFT vector residual (eta=0.16, q=1.7, N=512) = {fft_residual:.3e}")
    assert abs(critical_residual) < 1e-14
    assert abs(critical_slope) < 1e-14
    assert len(positive_real_roots(0.05)) == 2
    assert len(positive_real_roots(0.16)) == 0
    for q in np.linspace(0.45, 2.5, 25):
        tau = required_tension(float(q), 0.32, 1.0, 1.0)
        assert abs(scalar_residual(float(q), 0.32, 1.0, 1.0, tau)) < 2e-13
    assert fft_residual < 2e-6
    print("ALL ASSERTIONS PASS")
    y = np.linspace(0.0, 5.0, 1200)
    q_grid = np.linspace(0.45, 2.5, 900)
    fig, axes = plt.subplots(1, 2, figsize=(11.5, 4.4))
    for eta in etas:
        axes[0].plot(y, hybrid_polynomial(y, eta), label=fr"$\eta={eta:.5g}$")
    axes[0].axhline(0.0, color="black", linewidth=0.8)
    axes[0].axvline(1.5, color="0.5", linestyle="--", linewidth=0.8)
    axes[0].set(xlabel=r"$y=(qR_m)^2$", ylabel=r"$f(y)=\eta y^3-y+1$",
                    title="Multiplier-free hybrid threshold", ylim=(-1.2, 5.0))
    axes[0].legend(fontsize=8)
    for eta in [0.05, threshold, 0.16, 0.50]:
        tau = [required_tension(float(q), 2.0*eta, 1.0, 1.0) for q in q_grid]
        axes[1].plot(q_grid, tau, label=fr"$\eta={eta:.5g}$")
    axes[1].axhline(0.0, color="black", linewidth=0.8)
    axes[1].set(xlabel=r"$qR_m$ (with $R_m=1$)", ylabel=r"$\tau$",
                    title="Constraint multiplier removes root threshold")
    axes[1].legend(fontsize=8)
    fig.tight_layout()
    out = Path(__file__).with_name("morrow_parameterization_gate_20261022.png")
    fig.savefig(out, dpi=180)
    print(f"plot={out.name}")

if __name__ == "__main__":
    main()
```

## Complete Lean source

```lean
import Mathlib

theorem critical_factorization (y : ℝ) :
    (4 / 27 : ℝ) * y^3 - y + 1 = ((2*y - 3)^2 * (y + 3)) / 27 := by
  ring

theorem critical_double_root_value :
    (4 / 27 : ℝ) * (3 / 2 : ℝ)^3 - (3 / 2 : ℝ) + 1 = 0 := by
  norm_num

theorem critical_double_root_slope :
    3 * (4 / 27 : ℝ) * (3 / 2 : ℝ)^2 - 1 = 0 := by
  norm_num

theorem arclength_radius (R q : ℝ) (hq : q ≠ 0) (hunit : R * q = 1) :
    R = 1 / q := by
  apply (eq_div_iff hq).2
  simpa [mul_comm] using hunit

theorem constrained_circle_cancellation
    (κ λ Rm q : ℝ) (hq : q ≠ 0) :
    let τ := -κ*q^2 - 2*λ*(1/q^4 - Rm^2/q^2)
    κ*q^4 + τ*q^2 + 2*λ*(1/q^2 - Rm^2) = 0 := by
  dsimp
  field_simp [hq]
  ring
```

Lean was not installed in this runtime, so these proofs are supplied but honestly marked **NOT COMPILED HERE**. Python 3 execution and plot generation passed.

## Individual reading round

- `BEDROCK.md`: full read, blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`, 77,341 characters / 509 lines. Takeaway: historical recovery is mandatory, variables must be typed, Minkowski/ordinary controls come first, and no parameter choice may be silently promoted.
- `STATE_OF_THE_THEORY.md`: full read, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 11,012 characters / 155 lines. Takeaway: subordinate status map only; it does not override BEDROCK.
- Morrow continuity: `morrow-frobenius-timesheet-gate-20261019t00z-s3.md`, full read, blob `f9d29937575f175be24d4b54a5bb24746bb52298`, 10,419 characters / 226 lines; and `WORKSPACES/MORROW/INBOX.md`, full read, blob `84924a6ba778279bdca1390b2cf76013771d3c34`, 7,584 characters / 55 lines. Takeaway: Morrow's authentic method is an exact theorem gate over a source reconstruction, not a free-form model extension.
- Random substantial draw: initial draw landed on an HSH_RESOURCES-only file unavailable in the live repository; an explicitly recorded redraw selected `WORKSPACES/MERIDIAN/SANDBOX/RUN_065_NESTED_EQUATION_GEOMETRY_CONTROL.md` with random variate `0.3484923416026604` (index 2 of 6). Full read: blob `b6b29b21b17df70abf26cc8ff4c84c3a99971792`, 5,635 characters / 183 lines. Takeaway: its frame-aware versus frame-blind control reinforces the same guard used here—representation or parameter choice may not manufacture a false optimum.
- Mersearch: shared request slot remains occupied by `2026-10-21-orson-nlm-big-haul-math-001`; receipt covers 13,897 files and 23,825,506 records, but its query does not target the curve-parameter ambiguity. The packet therefore used a bounded direct primary-source read without overwriting the shared slot.

## Disposition

The multiplier-free \(4/27\) result is retained as a useful failed discriminator. The corrected constrained equation passes algebraic, dimensional, sign, limit, topology, scalar numerical, and spectral numerical checks. It remains tentative because the historical source does not calibrate the reaction multiplier or lift the centerline to finite-core Class-P geometry.

**Kestrel handoff:** test whether a finite-core once-covered ring plus non-self-overlap and fixed material length constrains \(q\) or \(\tau\) without reintroducing the discarded hybrid threshold.
