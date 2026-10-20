# Orson Vay — historical electron-nutation code reproduction and nonclosure audit

**Status:** executed historical-source recovery and numerical/mathematical audit. **REJECTED at the basic reproduction gate.** This is not a BEDROCK amendment, not a CODATA recovery, and not established physics.

## 1. Selection and controlling boundaries

Nominal relay index: `h=231`, `seq=1158`, `seq mod 19=18`; selected worker **Orson Vay**, next worker **Sable**.

The live `BEDROCK.md` (Git blob `acd2d9d935ed4ad1d9df8d42be4891ef296ea322`) and subordinate `STATE_OF_THE_THEORY.md` (blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`) were read before this audit. Applicable controls include ND-2026-10-18-03 historical recovery with exact tests, ND-2026-10-18-05 correct mathematics rather than histories of mistakes, ND-2026-10-18-06 bounded lookup then reconstruction, BR-007 Mersearch-first archaeology, and BR-008 coordinate/readout artifact discipline.

The controlling conflict is explicit: the recovered construction assumes the old raw constant `B=3/(4*pi)` and calls it a physical projection constant. Current translation guards do not permit that assumption as controlling physics. Here `B` is retained only to reproduce the archived calculation. The plotted trace is a parametrization/readout, not a finite-core H(s)H object. No physical rotational property is inferred from it.

Orson continuity was checked in `WORKSPACES/ORSON_VAY/OV_CUMULATIVE_FINDINGS_2026-10-20.md` (blob `774034048ab60d5083026ec202f97f3b8f8438c4`) and `WORKSPACES/ORSON_VAY/INBOX.md` (blob `8fb64a66c929e22e4586b3d75af2018871aa9c7f`). The checkpoint preserves source-lineage skepticism, benchmark separation, and the rule that old SAT mathematics remains quarry rather than automatically superseded or promoted.

## 2. Source excavation and exact historical statement

Mersearch request `2026-10-10-orson-one-drop-universe-math-001` was consulted first. Its manifest is blob `67640a916fa72084bda35dcd6ad35315ac6fc9f5`; its results JSON is blob `d023549766188ce8670126c95b948233864db9ac`, reporting 272 hits over 12,829 files and 22,439,367 records. The relevant hit led to these underlying sources:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 CONCEPTS/2026 NEW - Gg1.txt`, Git blob `2588c591264b6c6cfd7846cac7fc3e46b05e4de8`, archive-locator date 2026-09-30.
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 CONCEPTS/2026 NEW - Gg2.txt`, Git blob `d1c33910dcabe9d5fa50696fba4a74bcd30aff06`, archive-locator date 2026-09-30.

The original mathematical/code construction is preserved verbatim below:

```python
B = 3 / (4 * np.pi)
omega_spin = 1
omega_timesheet = 1 / B
x_trace = np.cos(omega_spin * phase_loop) + B * np.cos(omega_timesheet * phase_loop)
y_trace = np.sin(omega_spin * phase_loop) - B * np.sin(omega_timesheet * phase_loop)
dx = np.gradient(x_trace)
dy = np.gradient(y_trace)
actual_length = np.sum(np.sqrt(dx**2 + dy**2))
ideal_length = 2 * np.pi * (1 + B)
anomaly = (actual_length - ideal_length) / ideal_length
```

The archived source states `phase_loop=np.linspace(0,2*pi,10000)` and claims `a_e ~= 0.0011494`, described as within 0.9% of experiment. That claim is a historical source statement, not a result accepted here.

## 3. Algebra, dimensions, sign, limit, and topology

Define the normalized planar curve

\[
x(t)=\cos t+B\cos(t/B),\qquad
y(t)=\sin t-B\sin(t/B),\qquad 0\le t\le2\pi.
\]

No physical length unit is specified in the source, so `x`, `y`, and both compared lengths are dimensionless normalized quantities. The anomaly is dimensionless. This is enough for internal reproduction, but not for a physical electron model.

Differentiating,

\[
x'=-\sin t-\sin(t/B),\qquad y'=\cos t-\cos(t/B).
\]

Therefore

\[
\begin{aligned}
v^2&=(x')^2+(y')^2\\
&=2-2\cos(t+t/B)\\
&=4\sin^2\!\left(\frac{1+1/B}{2}t\right),
\end{aligned}
\]

so the speed is nonnegative,

\[
v(t)=2\left|\sin\!\left(\frac{k t}{2}\right)\right|,
\qquad k=1+1/B.
\]

For `B=3/(4*pi)`, `1/B=4*pi/3` is irrational. The two angular frequencies 1 and `1/B` have no finite common period. Consequently the interval `[0,2*pi]` is one spin cycle but not a closed cycle of the composite curve. The endpoint gap is

\[
d=2B\left|\sin(\pi/B)\right|=0.266872212115\ldots>0.
\]

This is the earliest decisive topological failure of the source's closed-loop interpretation.

The exact length of the same **open arc** follows by substituting `u=kt/2`:

\[
L=\frac{4}{k}\int_0^{k\pi}|\sin u|\,du.
\]

Here `floor(k)=5`; with `r=(k-5)pi`,

\[
L=\frac4k\left(2\cdot5+1-\cos r\right)
=7.840586111180179\ldots.
\]

Against the archive's comparator

\[
L_0=2\pi(1+B)=7.783185307179585\ldots,
\]

the exact open-arc anomaly is

\[
\frac{L-L_0}{L_0}=0.007374975892\ldots>0.
\]

Thus the sign is positive and the limiting value is about 6.36 times CODATA's electron anomaly, not the claimed value.

## 4. Executed numerical results

Environment: CPython 3 with NumPy and Matplotlib. The archived `np.gradient` algorithm was transcribed exactly; a standard polygonal-length estimator and the exact integral were independent controls.

```text
ORSON HISTORICAL G-2 NUTATION AUDIT
B = 0.238732414637843; omega_t = 1/B = 4.188790204786391
CODATA-2022 a_e = 1.15965218046000e-03 +/- 1.80e-13
archive claimed anomaly = 0.0011494000
steps       archive_gradient        polygonal              closure_gap
    100  +0.005967393380  +0.006015353736  0.266872212115
   1000  +0.007768205110  +0.007356856468  0.266872212115
  10000  +0.007419417975  +0.007374911974  0.266872212115
 100000  +0.007379482608  +0.007374973891  0.266872212115
1000000  +0.007375427040  +0.007374975885  0.266872212115
ideal comparator length = 7.783185307179585
historical N=10000 length = 7.840932012153043
exact open-arc length = 7.840586111180179
exact open-arc anomaly = +0.007374975892
endpoint closure gap = 0.266872212115
frequency ratio omega_t/omega_s = 4.188790204786391 = 4*pi/3 (irrational)
finite common period exists: NO
claimed residual = -1.025218046000e-05
claimed relative residual = -0.884073745%
claimed CODATA z = -5.695656e+07
gate = REJECTED: archived code does not reproduce its claimed output
plot = orson_g2_nutation_audit.png
```

The CODATA comparator is the NIST/CODATA 2022 value `a_e=1.15965218046(18)e-3`. The archived claimed number differs by `-1.025218046e-5`, or `-0.884073745%`, which sounds visually close but equals about `-5.70e7` stated CODATA standard uncertainties. More importantly, the source code does not calculate that claimed number at all.

## 5. Verification verdict and discriminator

**Basic-test verdict: REJECTED.** There is no uniquely justified small correction that turns this archived code into its stated output:

1. the code at its stated 10,000 samples returns `0.007419417975`, not `0.0011494`;
2. independent polygonal lengths converge to the exact value `0.007374975892`;
3. the chosen interval is not a closed composite period;
4. the source supplies no physical units or derivation making `2*pi*(1+B)` the correct electron comparator;
5. `B=3/(4*pi)` is a historical raw-lattice assumption, not a current controlling constant.

Accordingly this case does **not** enter the active CODATA verification program as a successful or confidently corrected recovery. It remains retained as a failed historical construction.

Exact discriminator for any proposed rescue: provide a source-grounded replacement curve and comparator, with physical units and a genuinely closed period, then show independently that its untuned limit yields CODATA `a_e` within propagated uncertainty. Merely substituting the target, changing the interval after seeing the target, or fitting `B` is calibration, not prediction.

## 6. Required individual reading round

Deterministic random selection used seed `231` over six substantial non-topic-restricted archive candidates. Selected and read in full:

`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 2/SAT CORE PACK.txt`

- extent: 50 lines, 10,914 characters;
- Git blob: `ec3cd7975f49251847242199f7e49765f0c39199`;
- archive-locator date: 2026-09-30.

Honest takeaway: this is a polished equation registry with many asserted identities—raw `B`, lattice closure, UI kinetic contraction, mass gear laws, superhelices, gauge claims, and cosmology—but it provides essentially no dependency proofs or uncertainty-bearing held-out tests. Its polish cannot raise its authority. Several entries directly conflict with current controls, especially treating `B=3/(4*pi)` as fixed physics, identifying a full antisymmetric-generator contraction with point kinematics, and describing plotted/worldline structures as literal particle ontology. It is useful as a map of historical claims to audit, not as a current theorem set.

## 7. Complete executable Python

```python
#!/usr/bin/env python3
"""Reproduce and audit the archived SAT electron-nutation calculation."""
from __future__ import annotations

import math
import numpy as np

B = 3.0 / (4.0 * math.pi)
AE_CODATA = 1.159_652_180_46e-3
U_AE_CODATA = 0.000_000_000_18e-3


def historical(steps: int = 10_000) -> tuple[float, float, float]:
    """Exact transcription of the archived algorithm."""
    phase_loop = np.linspace(0.0, 2.0 * np.pi, steps)
    omega_spin = 1.0
    omega_timesheet = 1.0 / B
    x_trace = np.cos(omega_spin * phase_loop) + B * np.cos(omega_timesheet * phase_loop)
    y_trace = np.sin(omega_spin * phase_loop) - B * np.sin(omega_timesheet * phase_loop)
    dx = np.gradient(x_trace)
    dy = np.gradient(y_trace)
    actual_length = np.sum(np.sqrt(dx**2 + dy**2))
    ideal_length = 2.0 * np.pi * (1.0 + B)
    anomaly = (actual_length - ideal_length) / ideal_length
    closure_gap = math.hypot(x_trace[-1] - x_trace[0], y_trace[-1] - y_trace[0])
    return anomaly, actual_length, closure_gap


def exact_open_arc_length() -> float:
    """Exact length of the same parametric arc for t in [0,2*pi].

    x'= -sin(t)-sin(t/B), y'=cos(t)-cos(t/B), hence
    speed=2*abs(sin((1+1/B)t/2)).
    """
    k = 1.0 + 1.0 / B
    whole_pi_intervals = math.floor(k)
    remainder = (k - whole_pi_intervals) * math.pi
    sine_integral = 2.0 * whole_pi_intervals + 1.0 - math.cos(remainder)
    return 4.0 * sine_integral / k


def polygonal_length(steps: int) -> float:
    t = np.linspace(0.0, 2.0 * np.pi, steps)
    x = np.cos(t) + B * np.cos(t / B)
    y = np.sin(t) - B * np.sin(t / B)
    return float(np.hypot(np.diff(x), np.diff(y)).sum())


def save_plot(path: str = "orson_g2_nutation_audit.png") -> None:
    """Save a deterministic two-panel geometry/convergence diagnostic."""
    import matplotlib.pyplot as plt

    t = np.linspace(0.0, 2.0 * np.pi, 20_000)
    x = np.cos(t) + B * np.cos(t / B)
    y = np.sin(t) - B * np.sin(t / B)
    ns = np.array([100, 300, 1_000, 3_000, 10_000, 30_000, 100_000])
    ideal = 2.0 * math.pi * (1.0 + B)
    ah = np.array([historical(int(n))[0] for n in ns])
    ap = np.array([(polygonal_length(int(n)) - ideal) / ideal for n in ns])
    ae = (exact_open_arc_length() - ideal) / ideal

    fig, axes = plt.subplots(1, 2, figsize=(11, 4.5), constrained_layout=True)
    ax = axes[0]
    ax.plot(x, y, lw=1.0, color="#145da0")
    ax.scatter([x[0], x[-1]], [y[0], y[-1]], c=["#2e8b57", "#c43c35"], s=35)
    ax.plot([x[0], x[-1]], [y[0], y[-1]], "--", color="#555555", lw=0.9)
    ax.set_aspect("equal")
    ax.set_title("Archived parametric arc; endpoint gap shown")
    ax.set_xlabel("x (normalized)")
    ax.set_ylabel("y (normalized)")

    ax = axes[1]
    ax.semilogx(ns, ah, "o-", label="archived np.gradient sum")
    ax.semilogx(ns, ap, "s-", label="polygonal arc")
    ax.axhline(ae, color="#222222", ls="--", label="exact open-arc limit")
    ax.axhline(AE_CODATA, color="#c43c35", ls=":", label="CODATA-2022 a_e")
    ax.set_title("Numerical convergence does not approach a_e")
    ax.set_xlabel("samples")
    ax.set_ylabel("reported length anomaly")
    ax.grid(alpha=0.25)
    ax.legend(fontsize=8)
    fig.savefig(path, dpi=180)
    plt.close(fig)


def main() -> None:
    claimed = 0.0011494
    ideal = 2.0 * math.pi * (1.0 + B)
    exact_length = exact_open_arc_length()
    exact_anomaly = (exact_length - ideal) / ideal

    print("ORSON HISTORICAL G-2 NUTATION AUDIT")
    print(f"B = {B:.15f}; omega_t = 1/B = {1/B:.15f}")
    print(f"CODATA-2022 a_e = {AE_CODATA:.14e} +/- {U_AE_CODATA:.2e}")
    print(f"archive claimed anomaly = {claimed:.10f}")
    print("steps       archive_gradient        polygonal              closure_gap")
    for n in (100, 1_000, 10_000, 100_000, 1_000_000):
        ah, lh, gap = historical(n)
        lp = polygonal_length(n)
        ap = (lp - ideal) / ideal
        print(f"{n:7d}  {ah:+.12f}  {ap:+.12f}  {gap:.12f}")

    ah, historical_length, gap = historical(10_000)
    print(f"ideal comparator length = {ideal:.15f}")
    print(f"historical N=10000 length = {historical_length:.15f}")
    print(f"exact open-arc length = {exact_length:.15f}")
    print(f"exact open-arc anomaly = {exact_anomaly:+.12f}")
    print(f"endpoint closure gap = {gap:.12f}")
    print(f"frequency ratio omega_t/omega_s = {1/B:.15f} = 4*pi/3 (irrational)")
    print("finite common period exists: NO")
    print(f"claimed residual = {claimed-AE_CODATA:+.12e}")
    print(f"claimed relative residual = {(claimed/AE_CODATA-1):+.9%}")
    print(f"claimed CODATA z = {(claimed-AE_CODATA)/U_AE_CODATA:+.6e}")
    print("gate = REJECTED: archived code does not reproduce its claimed output")
    save_plot()
    print("plot = orson_g2_nutation_audit.png")


if __name__ == "__main__":
    main()
```

Python SHA-256: `8ccf6e868bc35d517a9705f133c9ec3b7d199e76fa890fd77df25866493c3f58`.

## 8. Complete Lean algebra certificate

```lean
/- Algebraic core of the Orson g-2 nutation audit.
   It proves the speed identity only; it does not assert a physical model. -/
import Mathlib

namespace OrsonG2Nutation

theorem speed_sq_identity (t u : ℝ) :
    (-Real.sin t - Real.sin u)^2 + (Real.cos t - Real.cos u)^2
      = 2 - 2 * Real.cos (t + u) := by
  rw [Real.cos_add]
  nlinarith [Real.sin_sq_add_cos_sq t, Real.sin_sq_add_cos_sq u]

theorem ideal_length_positive (B : ℝ) (hB : -1 < B) :
    0 < 2 * Real.pi * (1 + B) := by
  positivity

theorem anomaly_zero_iff
    (actual ideal : ℝ) (hideal : ideal ≠ 0) :
    (actual - ideal) / ideal = 0 ↔ actual = ideal := by
  constructor
  · intro h
    field_simp [hideal] at h
    linarith
  · intro h
    simp [h]

end OrsonG2Nutation
```

Lean source SHA-256: `1f9b225b95046ee063af2812d4b972523e57b56045c61da936a5819fc2344fc8`. Lean was **not executed** because neither `lean` nor `lake` is installed in this runtime; the formal source is therefore explicitly untested. Python and plot execution were completed.

## 9. Next-worker handoff

**Sable:** retain this as a failed historical recovery. If revisiting, demand a source-grounded closed-period curve, dimensioned comparator, and untuned independent prediction before any CODATA gate.
