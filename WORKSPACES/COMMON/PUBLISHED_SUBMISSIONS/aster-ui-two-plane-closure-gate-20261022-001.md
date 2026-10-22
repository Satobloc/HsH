# Aster source-and-test packet: UI two-plane closure and topology gate

**Status:** historical-source reconstruction plus exact and numerical audit; tentative mathematics, not BEDROCK and not established physics.  
**Worker:** Aster. **Next:** Ariadne. **Audit date:** 2026-10-22 UTC.

## Result

The archived UI construction

\[
y(\lambda)=r(\lambda)R(\lambda)x_0,\qquad R\in SO(4),\quad x_0\in S^3
\]

does generate a clean, exactly classifiable constant-radius two-plane orbit. Put

\[
x_0=(\rho_1,0,\rho_2,0),\quad \rho_1^2+\rho_2^2=1,
\]
\[
R(t)=R_2(\omega_1t)\oplus R_2(\omega_2t).
\]

Then

\[
y(t)=r(\rho_1\cos\omega_1t,\rho_1\sin\omega_1t,
          \rho_2\cos\omega_2t,\rho_2\sin\omega_2t).
\]

For nonzero \(\rho_1,\rho_2\), the image lies on the Clifford torus
\(S^1(r\rho_1)\times S^1(r\rho_2)\subset S^3(r)\). It is closed iff
\(\omega_1/\omega_2\in\mathbb Q\). If \(\omega_1:\omega_2=p:q\) with coprime
integers \(p,q\), the image is the \((p,q)\) torus knot. If the integers have
gcd \(g>1\), the same primitive \((p/g,q/g)\) image is traced \(g\) times over
\([0,2\pi]\). If the ratio is irrational, the orbit is not closed and is dense
on the Clifford torus. Thus the archive's phrase “worldtube/superhelix generator”
does not by itself supply closure, a knot class, or a particle identity: those
require a rational frequency constraint and nonzero occupation of both planes.

The exact constant speed and Euclidean curvature are

\[
\|\dot y\|^2=r^2(\rho_1^2\omega_1^2+\rho_2^2\omega_2^2),
\]
\[
\kappa={\sqrt{\rho_1^2\omega_1^4+\rho_2^2\omega_2^4}
\over r(\rho_1^2\omega_1^2+\rho_2^2\omega_2^2)}.
\]

For \(r=1.7\), \(\rho_1^2=0.3\), \(\rho_2^2=0.7\), and \((p,q)=(2,3)\),
the executed values are \(\|\dot y\|^2=21.675\) and
\(\kappa=0.615074005543\). Closure residual at \(2\pi\) was
\(1.14\times10^{-15}\). The non-coprime \((4,6)\) control returned already at
\(\pi\), confirming double traversal. The \((1,\sqrt2)\) control had return
error 2.741959643615 at \(2\pi\); its long phase sample filled all 40 bins with
maximum relative deviation 0.004. The numerical sample illustrates density; the
irrational-ratio theorem, not the histogram, proves it.

## Source ancestry and exact wording

All public files below were read on 2026-10-22. Git blob SHAs identify exact
bytes; they are not claims of original authorship date.

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — UI CONFIG.txt`, full
   file, 50 lines / 6,526 characters, blob
   `6817caf68943593f31d72d51798e0ba4589624a4`, repository snapshot
   `8394f761d94fb2869266cb5b377a320ab4cfb235`. Verbatim tested mathematics:

   ```text
   The Fundamental Trajectory Equation: $$y^\mu(\lambda) = r(\lambda) R^\mu_{\ \nu}(\lambda) x_0^\nu$$
   Velocity Decomposition: $$\dot y^\mu = \dot r \hat y^\mu + \Omega^\mu_{\ \nu} y^\nu$$ Where $\Omega_{\mu\nu} = \dot R R^{-1}$ is the six-component angular velocity tensor.
   The UI Lagrangian: $$L_{UI} = \frac{1}{2} \dot r^2 + \frac{1}{2} r^2 \Omega_{\mu\nu} \Omega^{\mu\nu}$$
   ```

2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 3/UI CONFIG.txt`,
   full file, 50 lines / 6,526 characters, the identical blob
   `6817caf68943593f31d72d51798e0ba4589624a4`. This proves byte-identical
   duplication across the archive-to-HsH source family, not independent support.

3. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/REUILIGIG.txt`, full file, blob
   `6d3de4693f0fc3e8fcd2586b07818718189bb56f`, preserves the terminology chain:

   ```text
   UI-5: UI trajectory Y = r R x0
   UI-6: connection Omega = Rdot R^-1
   UI-7: worldtube/superhelix generator
   ```

4. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/[🗄️] EQUATIONATOR__NotebookLM_export.json`,
   full connector-returned export, blob
   `282704a31472176889d0e0043ae0170f48662a51`, captured
   2026-10-11T13:13:43.473Z. Message index 21 repeats the chain and quadratic
   form. It is a user-side exported/pasted span and is therefore not treated as
   uniquely Nathan-authored. The export supplies no original timestamp for that
   span.

Earlier packets #203 and #213 already established the point-kinetic correction
\(\|\Omega u\|^2\) versus the full Frobenius contraction. This packet does not
repackage that result; it advances the unresolved closure/topology discriminator.

## Proof and gates

If a common period \(T>0\) exists, then for integers \(m,n\)

\[
\omega_1T=2\pi m,\qquad \omega_2T=2\pi n,
\]

so \(\omega_1/\omega_2=m/n\). Conversely, a rational ratio can be rescaled to
coprime integers \(p,q\), and \(T=2\pi/\omega_0\) closes both phases. Kronecker's
torus theorem supplies density for the irrational ratio.

Dimensions: if \(t\) is time, \([r]=L\), \([\omega_i]=T^{-1}\), then
\([\|\dot y\|^2]=L^2T^{-2}\) and \([\kappa]=L^{-1}\). The quadratic form is a
specific kinetic scale; a physical action still needs a mass/tension and measure.
The sign is nonnegative. As \(r\to0^+\), speed tends to zero linearly while
curvature diverges as \(1/r\); this coordinate-family limit is not a finite-core
material model. If \(\rho_2=0\), \(\omega_2\) is unobservable and the orbit is a
circle regardless of its value. If either angular rate vanishes with both radii
nonzero, the image is again a circle on the torus. These are exact degeneracy
controls against over-reading six rotational controls from one point trajectory.

## BEDROCK comparison and status

- Compatible with BR-003/BR-004: this is a tentative source-preserving audit and
  no source text or BEDROCK text was rewritten.
- Supports ND-2026-10-18-03 and ND-2026-10-22-03 by following the older explicit
  construction through terminology changes and testing it rather than replacing it.
- Conflicts with the archived unqualified claims that the UI automatically
  produces every physical worldline, physical identity, or stable topology. The
  map is a kinematic parametrization; closure and knot class need additional exact
  conditions, and physical status needs a constitutive/readout law.
- The archive's “4D hypersphere lattice” and automatic particle-law language are
  not promoted. Current BEDROCK requires exact Minkowski control first, finite-core
  H(s)H, and explicit sector propagation. This Euclidean \(S^3\) orbit is a
  bounded mathematical control only.
- No use is made of raw \(B\), inverse-\(Q\), lattice density, or a hidden
  \(\theta_4\) calibration. OC-001/OC-002 remain open.

The internal mathematical gate passes, but the versioned-CODATA program stops at
**NOT ELIGIBLE**: no independently predicted observable, unit map, uncertainty,
or dimensionful anchor is specified. Exact discriminator for entry: supply a
source-derived map from \((r,\rho_i,\omega_i,p,q)\) to one held-out observable,
with uncertainties and no reuse of that observable in parameter selection.

## Actual numerical output

```text
ASTER UI TWO-PLANE CLOSURE GATE
rho1^2+rho2^2               = 1.000000000000000
rational rates (p,q)        = (2,3)
gcd / primitive class       = 1 / (2,3)
fundamental period           = 6.283185307180
closure error                = 1.140e-15
constant speed^2             = 21.675000000000
curvature exact              = 0.615074005543
curvature numerical          = 0.615074005543
curvature residual           = 1.110e-16
NON-COPRIME MULTIPLICITY CONTROL
(4,6) fundamental period     = 3.141592653590
(4,6) return error at pi     = 1.140e-15
IRRATIONAL-RATIO CONTROL
return error at 2pi          = 2.741959643615
40-bin max relative deviation= 0.004000
classification               = dense torus orbit (analytic irrational-ratio theorem)
plot                         = aster_ui_closure_gate.png
```

## Complete executable Python and plotting source

```python
#!/usr/bin/env python3
"""Aster: closure/topology gate for constant-radius two-plane UI motion."""
import math
from math import gcd
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

def orbit(t, r, rho1, rho2, w1, w2):
    return r*np.array([rho1*np.cos(w1*t), rho1*np.sin(w1*t),
                       rho2*np.cos(w2*t), rho2*np.sin(w2*t)])

def velocity(t, r, rho1, rho2, w1, w2):
    return r*np.array([-rho1*w1*np.sin(w1*t), rho1*w1*np.cos(w1*t),
                       -rho2*w2*np.sin(w2*t), rho2*w2*np.cos(w2*t)])

def acceleration(t, r, rho1, rho2, w1, w2):
    return -r*np.array([rho1*w1*w1*np.cos(w1*t), rho1*w1*w1*np.sin(w1*t),
                        rho2*w2*w2*np.cos(w2*t), rho2*w2*w2*np.sin(w2*t)])

def curvature_numeric(v, a):
    v2, a2, va = v@v, a@a, v@a
    return math.sqrt(v2*a2-va*va)/(v2**1.5)

def main():
    r = 1.7
    rho1, rho2 = math.sqrt(0.3), math.sqrt(0.7)
    p, q = 2, 3
    T = 2*math.pi/gcd(abs(p), abs(q))
    y0, yT = orbit(0., r, rho1, rho2, p, q), orbit(T, r, rho1, rho2, p, q)
    v = velocity(0.37, r, rho1, rho2, p, q)
    a = acceleration(0.37, r, rho1, rho2, p, q)
    speed2 = r*r*(rho1*rho1*p*p+rho2*rho2*q*q)
    kappa_exact = math.sqrt(rho1*rho1*p**4+rho2*rho2*q**4)/(r*(rho1*rho1*p*p+rho2*rho2*q*q))
    kappa_num = curvature_numeric(v, a)
    T46 = 2*math.pi/gcd(4, 6)
    err46_half = np.linalg.norm(orbit(T46, r, rho1, rho2, 4, 6)-y0)
    wirr = math.sqrt(2)
    err_irr_2pi = np.linalg.norm(orbit(2*math.pi, r, rho1, rho2, 1., wirr)-y0)
    N = 20000
    ts = np.linspace(0., 400*math.pi, N, endpoint=False)
    phase2 = (wirr*ts)%(2*math.pi)
    bins = np.histogram(phase2, bins=40, range=(0., 2*math.pi))[0]
    max_rel_bin_deviation = np.max(np.abs(bins-N/40))/(N/40)
    print("ASTER UI TWO-PLANE CLOSURE GATE")
    print(f"rho1^2+rho2^2               = {rho1*rho1+rho2*rho2:.15f}")
    print(f"rational rates (p,q)        = ({p},{q})")
    print(f"gcd / primitive class       = {gcd(p,q)} / ({p//gcd(p,q)},{q//gcd(p,q)})")
    print(f"fundamental period           = {T:.12f}")
    print(f"closure error                = {np.linalg.norm(yT-y0):.3e}")
    print(f"constant speed^2             = {speed2:.12f}")
    print(f"curvature exact              = {kappa_exact:.12f}")
    print(f"curvature numerical          = {kappa_num:.12f}")
    print(f"curvature residual           = {abs(kappa_num-kappa_exact):.3e}")
    print("NON-COPRIME MULTIPLICITY CONTROL")
    print(f"(4,6) fundamental period     = {T46:.12f}")
    print(f"(4,6) return error at pi     = {err46_half:.3e}")
    print("IRRATIONAL-RATIO CONTROL")
    print(f"return error at 2pi          = {err_irr_2pi:.12f}")
    print(f"40-bin max relative deviation= {max_rel_bin_deviation:.6f}")
    print("classification               = dense torus orbit (analytic irrational-ratio theorem)")
    assert abs(rho1*rho1+rho2*rho2-1) < 1e-14
    assert np.linalg.norm(yT-y0) < 1e-14
    assert abs(kappa_num-kappa_exact) < 1e-14
    assert err46_half < 1e-14
    assert err_irr_2pi > 0.1
    assert max_rel_bin_deviation < 0.02
    tr = np.linspace(0., T, 1500)
    yr = np.array([orbit(t, r, rho1, rho2, p, q) for t in tr])
    ti = np.linspace(0., 80*math.pi, 12000)
    yi = np.array([orbit(t, r, rho1, rho2, 1., wirr) for t in ti])
    fig, ax = plt.subplots(1, 2, figsize=(10, 4.3))
    ax[0].plot(yr[:,0], yr[:,2], lw=1.2)
    ax[0].set(title="Closed (2,3) UI orbit: R4 projection", xlabel="Y1", ylabel="Y3")
    ax[0].axis("equal"); ax[0].grid(alpha=.25)
    ax[1].scatter(np.arctan2(yi[:,1],yi[:,0]), np.arctan2(yi[:,3],yi[:,2]), s=.2)
    ax[1].set(title="Irrational ratio samples the Clifford torus", xlabel="phase 1", ylabel="phase 2")
    ax[1].set_xlim(-math.pi,math.pi); ax[1].set_ylim(-math.pi,math.pi); ax[1].grid(alpha=.25)
    fig.tight_layout(); fig.savefig("aster_ui_closure_gate.png", dpi=170)
    print("plot                         = aster_ui_closure_gate.png")

if __name__ == "__main__":
    main()
```

## Complete Lean 4 / Mathlib source

Lean was unavailable in the execution environment. This is a complete but
compiler-untested algebraic kernel; the torus-density theorem is not formalized here.

```lean
import Mathlib

open Real

theorem common_period_forces_rational_ratio
    (w₁ w₂ T m n : ℝ)
    (hT : T ≠ 0) (hw₂ : w₂ ≠ 0)
    (h₁ : w₁ * T = 2 * Real.pi * m)
    (h₂ : w₂ * T = 2 * Real.pi * n)
    (hn : n ≠ 0) :
    w₁ / w₂ = m / n := by
  calc
    w₁ / w₂ = (w₁ * T) / (w₂ * T) := by field_simp
    _ = (2 * Real.pi * m) / (2 * Real.pi * n) := by rw [h₁, h₂]
    _ = m / n := by field_simp [Real.pi_ne_zero]

theorem weighted_speed_nonnegative
    (r ρ₁ ρ₂ w₁ w₂ : ℝ) :
    0 ≤ r^2 * (ρ₁^2*w₁^2 + ρ₂^2*w₂^2) := by positivity

example : Nat.gcd 2 3 = 1 := by norm_num
example : Nat.gcd 4 6 = 2 := by norm_num
```

## Required reading round

- Live `BEDROCK.md`: full read, 77,341 characters, blob
  `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`.
- Subordinate `STATE_OF_THE_THEORY.md`: full read, 11,012 characters, blob
  `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Aster reentry checkpoint: full read, blob
  `7d8a57addef8c17a2bab67aa96d25e637cc8b5ad`. Its authentic lane is exact
  wording, chronology, source ancestry, disclosure, and authorship-span control.
- Completed Mersearch receipt: request
  `2026-10-21-orson-nlm-big-haul-math-001`, manifest blob
  `0f017d6f557d24c721e417d1fe3c49abf0653991`, receipt blob
  `191acaf733c8e59920ca16c53ccb74d6be90f3c6`. It scanned 13,897 files across
  three repositories and reported 34,983 hits; it is navigation, not evidence.
- Actual random archive draw: from 36 non-tool text/Markdown hits for the neutral
  query `geometry`, a runtime random draw selected
  `Early SAT/A reaction.txt`. Full file read: 47 lines / 6,290 characters, blob
  `4d3c072cc55bde77c3a12940ab831a61567c3253`. Honest takeaway: the source is
  an explicitly skeptical reaction that repeatedly demands rigorous predictions
  and empirical contact; it supplies no equation for this packet and is not used
  as mathematical evidence.

## Ariadne handoff

Test whether a source-defined finite-core neighborhood of the closed \((p,q)\)
UI orbit remains embedded: derive the reach/thickness bound and identify the first
self-contact parameter. Do not infer contact, braid force, or particle identity
from centerline closure alone.
