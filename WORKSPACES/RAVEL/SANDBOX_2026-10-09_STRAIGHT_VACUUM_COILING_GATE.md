# SANDBOXED — Ravel: straight-vacuum worldtubes and the minimal coiling gate
**Date:** 2026-10-09. **Status:** strictly Minkowski geometric test, not SAT particle prediction.  
**Controls:** Nathan Direct 9 Oct scope and [Common directive](../COMMON/NATHAN_DIRECT_2026-10-09_SCOPE_AND_REFERENCE_RULE.md); [BEDROCK](../../BEDROCK.md) BR-000/BR-001/BR-005 and ND-2026-10-09-02.

## SAT source-first provenance
- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt\`: read all 142 lines; Nathan insists on *worldline + timesheet* as primitive drawings, with constrained geometry first and no decorative mathematical ontology.
- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt\`: all 67 lines; historical radial-wavefront/filament, aligned-vacuum medium and wave excitation map. Older specifics remain dated, not canonical by mere age.
- \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt\`: complete readable unextended Fundamental Intuitions text, including Proposition E on aligned vacuum filaments and photons as traveling excitations.
- \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt\`: all 38 lines, original block-geometry force question.
- Previously read \`WORKSPACES/RAVEL/KERR_SCALE_SLICE_TRIANGULATION_2026-09-16.md\` and \`KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md\`: distinguish Kerr spin scale from physical core; ordinary electron-like Kerr is over-extreme.
- Separate \`THE FUNDAMENTAL INTUITIONS — EXTENDED.pdf\` and \`CANONICAL RMS_FULL_CANON.txt\` **not substantively extracted this run**; explicitly outstanding reading cursors. No nLab, direct Schreiber authored, or Hypothesis H sources used.

## 1. The straight ideal-vacuum reference, in 4D rather than as a rope around anything

Use local STD Minkowski coordinates \((w,x,y,z)\), \(w=ct\) in length units, \(\eta=\operatorname{diag}(-1,+1,+1,+1)\). A straight candidate vacuum history is
\[
X^\mu_{\rm str}(w)=(w,x_0,y_0,z_0).
\]
This has tangent parallel to the time normal; **90 degrees to the timesheet, 0 degrees to its propagation/normal**, and zero Minkowski four-acceleration. Its tangent is **timelike**, not a massless photon/null ray. The "perfect vacuum" assignment to this morphology is Nathan's current *candidate physical convention*, not something Minkowski theory alone derives.

H(s)H replaces the ideal 1D worldline by a 4D region around it (for simplicity, a spacelike normal ball):
\[
\mathcal T_\epsilon
=\{X^\mu(w,\xi^1,\xi^2,\xi^3)
=(w,x_0+\xi^1,y_0+\xi^2,z_0+\xi^3):
\|\vec\xi\|\le \epsilon\}.
\]
There is **no other object around which the history wraps**, and \(\epsilon\) is not equated to Kerr's rotation length. The shape of an ER/Kerr-like excluded core and its inductive shell is a later physical structure to derive.

## 2. The smallest nontrivial coiling comparison

As a LOCAL *geometrical test trajectory*, not a dynamical postulate, define:
\[
X^\mu_{\rm coil}(w)
=(w,R\cos(kw),R\sin(kw),\beta_z w).
\tag{1}
\]
Here \(R\) is its excursion relative to an inertial coordinate origin; the origin/axis is **not a material spindle or underlying carrier**. All geometric parameters are LOCAL:RAVEL-COIL: \(R\,[L]\), \(k\,[L^{-1}]\), \(\beta_z=v_z/c\,[1]\); \(\epsilon\,[L]\) is separate physical core thickness. No identification with SAT helical radius, Hagalaz, Kerr \(a\), or scale-independent universal constant is asserted.

**Exact Minkowski timelike requirement:**
\[
\mathrm ds^2=[-1+(Rk)^2+\beta_z^2]\,\mathrm dw^2,\qquad
(Rk)^2+\beta_z^2<1.
\tag{2}
\]
Define \(\gamma=[1-\beta_z^2-(Rk)^2]^{-1/2}\). The motion observable from intersections is a circular spatial component of speed \(cRk\), plus axial component \(c\beta_z\). Its spatial acceleration is \(c^2Rk^2\), orthogonal to velocity, and its **proper four-acceleration magnitude** is
\[
a_{\rm prop}=\gamma^2 c^2 Rk^2,\qquad
\kappa_4=a_{\rm prop}/c^2
=\frac{Rk^2}{1-\beta_z^2-(Rk)^2}.
\tag{3}
\]
Thus a **free** inertial timelike history in Minkowski (\(a^\mu=0\)) cannot have nontrivial \(Rk\). To obtain a physical coil, SAT/H(s)H must supply a nonzero curvature-inducing mechanism: Kelvin/wavefront forcing, interbraid/timesheet coupling, ER/Kerr core boundary stress, or an upstream cosmological constraint. These are *candidates*, not inserted standard model truths. In a block universe this is a constraint on static four-dimensional morphology, **not motion of an already existing filament through spacetime**.

A Fermi normal transverse worldtube of radius \(\epsilon\) avoids a **local** lapse-zero degeneracy when
\[
\epsilon\kappa_4<1
\;\Longleftrightarrow\;
\frac{\epsilon}{R}
\frac{(Rk)^2}{1-\beta_z^2-(Rk)^2}<1.
\tag{4}
\]
For fixed \(\epsilon/R\) and \(\beta_z\), the local tube criterion imposes
\[
(Rk)^2<\frac{1-\beta_z^2}{1+\epsilon/R}.
\tag{5}
\]
Equation (5) is a **coordinate normal-neighborhood** limit, **not** a Pauli exclusion, a global injectivity guarantee, or a Kerr horizon criterion. It is falsified as a *physical core bound* if the hypothesized finite ER/Kerr geometry does not use such a Fermi neighborhood.

**Illustration only:** \(\beta_z=0.2\), \(Rk=0.3\), \(\epsilon/R=0.15\) gives \(\gamma^2=1/0.87\) and \(\epsilon\kappa_4=0.0155172413793\). Numeric reproduction belongs with the optional Class-P fixture; none of these are particle data.

## 3. Proposed decisive test

Prepare two paths with identical asymptotic Minkowski \((p^\mu,\text{core parameters})\):
- **A:** straight aligned vacuum tube: no persistent coiling.
- **B:** candidate circularly coiled tube: nonzero \(\kappa_4\).

Derive both from **one** internally motivated worldtube constitutive action, including its candidate ER/Kerr tube/shell if necessary, rather than stipulating different geometries without different stresses. Show that the action selects a nonzero coil state only when its independently sourced boundary/interaction parameters cross a calculable threshold. If no threshold is derived, "coiling" remains an illustration, not an explanation.

For photon/photoneutrino creation, excite the *straight* candidate vacuum medium with a localized transient deformation and calculate traveling modes and conserved energy. Do not assign a mode a Standard-Model particle identity until it reproduces conventional dispersion/scattering properties. A *BEC ocean* needs independent many-body state/coherence evidence; network alignment alone is not literal Bose condensation.

For the ER/Kerr program, separately show how a Kerr-ring-like **intersection trace** arises from 4D tube singular-support geometry, and how an exchange of two tubes changes their quantum state by a \(-1\) sign; mere hard contact or a circular trace does not supply that sign.

## 4. External comparisons and quarantine handling
This note used **internal SAT/H(s)H only**, with ordinary Minkowski/relativistic kinematics as standard physics. New Nathan directive permits other previously quarantined scholarly prior art only after internal precedent checks and source typing; **Hypothesis H proper and directly Schreiber-authored material remain off limits**. No outside paper has been imported as an H(s)H premise.

**Ravel**
