# Ravel sandbox — SO(4) material-frame holonomy

**Status:** `GEN/CANDIDATE`  
**Question:** Does replacing the scalarized torsional variable by an explicitly transported material frame split the finite-core resonance ladder?  
**Answer in the controlled model:** not generically. A uniform pre-twist is spectrally removable on an open isotropic segment. Stable splitting requires nontrivial loop holonomy, anisotropic constitutive tensors, or non-covariant boundary/readout structure.

## Provenance and source boundary

### Controlling/current material refreshed

- `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and the role-relevant onboarding, reference-desk, symbol, citation, toolbox, workflow, and key pointers were refreshed before construction.
- HSH_RESOURCES was used for routing/tool familiarity only. No quarantined theory or historical constant was imported.

### Archive material substantially read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/PRE_HSH_ROUNDUP/3 H(S)H EQUATION ROUNDUP.txt`, blob `eee52dad4c4e0663e929c15e1c2670c6f9771dd7`, contiguous lines 750–1100. 
  - Retained as a historical motif: a persistent worldtube carries a material orientation; changing inertia axes can drive relative frame reorientation; finite-core persistence is not exhausted by a centerline.
  - Nathan's correction in the passage was retained: speculative large-scale geometry should not be promoted merely because it is visually suggestive.
  - Quarantined: the generated `Gr(3,6)` / `3+3` implementation, planetary-flip claims, numerical geophysics, `EI=Mc^2`, and all claims of inevitability. None controls the construction below.

This source was selected through the project Mersearch bridge, request `2026-10-07-ravel-material-director-frame-001`, query:

> `(“material frame” OR “director frame” OR “moving frame” OR “local frame” OR “body frame”) AND (torsion OR twist OR rotation OR filament OR worldline OR worldtube)`

Mersearch searched 3,987 files / 6,597,201 records and returned 224 discovery hits. The underlying source was then read directly. ⟦SRC:MERSEARCH-MATERIAL-FRAME-001·RESULTS⟧

### H(s)H material read completely

- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/KEY CONCEPT - IRI.txt`, blob `ba94d51313fb94fb6af69cb76ccfc84141838abe`, complete file, 18,074 decoded characters. 
  - Retained only after the independent construction: worldtube bending resistance should be tested by transfer across controlled cases; internal/bundled structure may matter; dynamics and observables must be explicit rather than static algebra alone.
  - Quarantined: the historical scalar `B`, particle labels, fitted constants, mass ratios, gravity formulae, and generated claims of cross-domain confirmation.

## Independent construction

Let a finite-core carrier possess a material director frame

\[
R(s,t)\in SO(4),
\]

with body strain and angular velocity

\[
A=R^{-1}R_s,\qquad \Omega=R^{-1}R_t.
\]

Linearize around a uniformly pre-twisted equilibrium

\[
R_0(s)=e^{sA_0},\qquad R=R_0e^{\xi},\qquad \xi\in\mathfrak{so}(4).
\]

Then

\[
A-A_0=D_s\xi+O(\xi^2),
\qquad
D_s\xi=\partial_s\xi+[A_0,\xi].
\]

The smallest inertial constitutive law consistent with the previous rod model is

\[
\mathcal I\,\xi_{tt}+\gamma\xi_t
-C D_s^\dagger D_s\xi+K\xi=T.
\tag{1}
\]

Here \(\mathcal I,\gamma,C,K\) remain sandbox coefficients. Equation (1) does not assert a new substrate or modify standard 4D kinematics; it tests what an explicit internal orientation would do to the prior finite-core mode law.

## Null result: an open isotropic segment does not split

Define

\[
\eta(s,t)=\operatorname{Ad}_{R_0(s)}\xi(s,t).
\]

Because the adjoint action preserves the isotropic inner product on \(\mathfrak{so}(4)\),

\[
\partial_s\eta
=\operatorname{Ad}_{R_0}D_s\xi.
\]

Thus \(D_s\) is unitarily equivalent to \(\partial_s\). With covariant free-end conditions \(D_s\xi=0\), (1) has exactly the previous unsplit pole ladder:

\[
\omega_{\mathrm{peak},n}^2
=\frac K{\mathcal I}
+\frac C{\mathcal I}\left(\frac{n\pi}{L}\right)^2
-\frac{\gamma^2}{2\mathcal I^2}.
\tag{2}
\]

**Consequence:** adding a material frame does not by itself justify extra spectral structure. Uniform pre-twist is a removable frame choice in the isotropic open problem.

## Exception: nontrivial loop holonomy creates root families

For a holonomy-twisted loop, the same transformation moves the connection into the boundary condition:

\[
\eta(L)=\operatorname{Ad}_{U}\eta(0),
\qquad U=e^{LA_0}.
\]

Put the constant generator into the canonical commuting form

\[
A_0=aJ_{12}+bJ_{34}.
\]

The adjoint action on \(\mathfrak{so}(4)\) has shifts

\[
\boxed{\mu\in\{0,0,\pm(a-b),\pm(a+b)\}}.
\tag{3}
\]

Therefore the periodic-loop resonances are

\[
\boxed{
\omega_{n,\mu}^2
=\frac K{\mathcal I}
+\frac C{\mathcal I}
\left(\frac{2\pi n}{L}+\mu\right)^2
-\frac{\gamma^2}{2\mathcal I^2}
}.
\tag{4}
\]

Two Cartan directions remain unshifted; four root directions form two paired families. For each positive shift \(\delta\in\{|a-b|,a+b\}\), the signed pair separation at \(q_n=2\pi n/L\) is

\[
\Delta_\delta\omega_n^2
=\omega_{n,+\delta}^2-\omega_{n,-\delta}^2
=4\frac C{\mathcal I}q_n\delta.
\tag{5}
\]

Hence

\[
\delta=\frac{\mathcal I\,\Delta_\delta\omega_n^2}{4Cq_n},
\quad
a=\frac{\delta_++\delta_-}{2},
\quad
b=\frac{\delta_+-\delta_-}{2},
\tag{6}
\]

after choosing the canonical ordering \(a\ge b\ge0\).

Only the conjugacy class of \(U\) is identifiable: \(a\) and \(b\) are aliased under shifts that relabel the integer mode number. A genuinely closed, generic material frame with trivial holonomy gives no new splitting at all. This is the key failure gate against mistaking a coordinate pre-twist for structure.

## Numerical controlled case

The solver constructed the full \(6\times6\) matrix of \(\operatorname{ad}_{A_0}\) rather than inserting (3) by hand.

Parameters:

\[
\mathcal I=0.1,\quad \gamma=0.2,\quad C=0.06,
\quad K=0.25,\quad L=1.2,\quad a=0.85,\quad b=0.30.
\]

The numerical adjoint eigen-shifts were

\[
(-1.15,-0.55,0,0,0.55,1.15),
\]

with zero discrepancy from (3) at stored precision.

At \(n=1\), \(q_1=5.235987756\):

| Root pair | \(\omega_-^2\) | \(\omega_+^2\) | recovered shift |
|---|---:|---:|---:|
| \(|a-b|\) | 13.675089 | 20.586593 | 0.550000 |
| \(a+b\) | 10.517178 | 24.968504 | 1.150000 |

With independent 0.2% Gaussian noise on each measured \(\omega^2\), 5,000 inversions gave

\[
a_{\rm rec}=0.84990\pm0.00295,
\qquad
b_{\rm rec}=0.30005\pm0.00293.
\]

These numbers demonstrate identifiability inside the sandbox fixture; they are not predictions of particle constants.

## H(s)H translation

### Source fact

The old archive proposed that persistent worldtubes can carry material orientation and that internal inertia structure can reorient relative to the larger carrier. The current H(s)H file insists that bending resistance must be transfer-tested and that internal structure can matter.

### Inference from taking the 4D map seriously

If a finite-core worldtube has observable cross-sectional orientation, then its state cannot be only a centerline plus scalar torsion amplitude. A frame or equivalent phase must be transported. But covariance immediately removes any uniform connection that has no holonomy, anisotropy, boundary mismatch, or orientation-sensitive intersection consequence.

### New sandbox conjecture

Particle-like persistence may reside not in a local twist density but in the conjugacy class of a transported finite-core frame around a closed carrier. In the present model, the minimal candidate is

\[
\bigl[U\bigr]
=\left[\mathcal P\exp\oint A_s\,ds\right]_{\rm conjugacy},
\]

while the local generator \(A_s\) by itself is representation-dependent.

This is weaker and cleaner than identifying every local frame rotation with a new particle degree of freedom.

## Discriminator and failure conditions

The architecture earns use only if a single dataset distinguishes these cases:

1. **Open isotropic segment:** no pole splitting; pre-twist changes polarization/readout weights at most.
2. **Closed or defected carrier with nontrivial holonomy:** two unshifted directions plus paired \(|a-b|\) and \(a+b\) families obeying (4)–(5).
3. **Anisotropic constitutive core:** additional splittings that do not reduce to the two holonomy shifts and vary with material-axis orientation.

Reject the holonomy interpretation if:

- an open, covariantly terminated isotropic segment shows the same splitting as the loop;
- pair separations fail the linear \(q_n\) law in (5);
- inferred \((a,b)\) changes with resolving width rather than only spectral weights;
- the shifts disappear after correct mode-number relabeling, revealing trivial holonomy;
- a scalar intersection observable cannot resolve the polarizations even when an explicitly anisotropic core is used.

## Next solver test

Evolve the full nonlinear frame equation on two matched carriers: one open with covariant free ends, one closed with declared holonomy. Drive both with the same localized noncommuting torque, pass them through the same finite-core intersection operator, and blind-fit the pole families. The decisive output is whether the loop alone returns stable \([U]\) while the open carrier collapses to (2).

## Reproducible artifacts

- `WORKSPACES/RAVEL/CODE/so4_material_frame_splitting.py`
- `WORKSPACES/RAVEL/DATA/so4_material_frame_splitting.json`
- `WORKSPACES/RAVEL/FIGURES/so4_material_frame_splitting.svg`

The script generates the numerical adjoint spectrum, the paired inversion, a 5,000-draw noise test, and the Class-P diagnostic figure.
