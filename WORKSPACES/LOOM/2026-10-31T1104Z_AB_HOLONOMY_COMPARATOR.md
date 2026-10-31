# Aharonov–Bohm holonomy as a measured comparator for the Blockwave compact-phase construction

**Date:** 2026-10-31  
**Status:** PRIMARY EXPERIMENT IDENTIFIED / EXACT-SI COMPARATOR CALCULATED / CONDITIONAL LEAN IDENTITY ADDED / NO H(s)H PREDICTION

## 1. Exact source under review

The archived `🧱BLOCKWAVE.txt` attachment (HsH Git blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; first extant path commit `6e4415f62616b19ae5cb677984c85d1985834d9d`, 2026-10-08T02:42:49Z) contains the compact-phase construction:

\[
\theta\sim\theta+2\pi,\qquad
A_\mu(\theta)=\alpha_*\nabla_\mu\theta,\qquad
F_{\mu\nu}(\theta)=\nabla_{[\mu}A_{\nu]}.
\]

It separately states:

\[
\oint_\gamma A\cdot d\ell\in2\pi\mathbb Z
\]

and places a local term \(\frac{g_h}{2}F_{\mu\nu}J^{\mu\nu}\) in the action, labeling it “holonomy–trace coupling.”

Provenance is important. The equation set is in assistant-role message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, conversation `68f4d9b5-b908-832e-940e-6782db174a4a`, timestamp 2025-10-19T12:29:46.538Z, raw-export blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. The immediately preceding user message requests the full action and definitions; it does not author the assistant’s equations. The attachment also contains an embedded “Nathan McKnight:” passage whose internal author/turn provenance is unresolved. None of the action equations is therefore promoted to Nathan Direct.

## 2. Actual measured comparator

Tonomura et al. (1986) used electron holography around a toroidal ferromagnet covered by a superconducting layer and a copper layer. The electron beams passed through the toroid’s hole and outside it; the magnetic field was shielded from the electron waves. The experiment reported the expected relative Aharonov–Bohm phase shift and direct evidence of flux quantization.

The more detailed Osakabe et al. (1986) report states that below the superconducting transition temperature the measured relative phase shift was 0 or \(\pi\), associated with flux quantization in units \(h/(2e)\).

These are actual experimental observations. Primary references: Tonomura et al., *Phys. Rev. Lett.* 56, 792 (24 February 1986), DOI `10.1103/PhysRevLett.56.792`; Osakabe et al., *Phys. Rev. A* 34, 815 (1 August 1986), DOI `10.1103/PhysRevA.34.815`. The accessible APS abstracts do not expose the raw phase series or a numerical uncertainty budget, and the full papers were not retrieved in this run. The reported 0/\(\pi\) outcomes are therefore treated as categorical published observations, not as a residual with an invented error bar.

## 3. Exact-SI calculation

The BIPM's post-2019 SI defining-constants table gives exact values for the Planck constant and elementary charge (BIPM, `https://www.bipm.org/en/measurement-units/si-defining-constants`):

\[
h=6.62607015\times10^{-34}\ {\rm J\,s},\qquad
e=1.602176634\times10^{-19}\ {\rm C}.
\]

No CODATA adjustment or uncertainty is used for these two defining constants.

For one superconducting flux quantum,

\[
\Phi_0=\frac{h}{2e}
=2.0678338484619293\times10^{-15}\ {\rm Wb}.
\]

The electron Aharonov–Bohm phase magnitude is

\[
\Delta\phi=\frac{e\Phi_0}{\hbar}
=\frac{e}{\hbar}\frac{h}{2e}
=\pi.
\]

For \(n\) flux quanta, \(\Delta\phi=n\pi\); modulo \(2\pi\), the phase class alternates between 0 and \(\pi\). The sign depends on charge/orientation convention; the \(\pi\) class is unchanged modulo \(2\pi\).

This is an exact unit/phase relation anchored to the measured system. It is not a new measurement, a CODATA comparison, or an H(s)H prediction.

## 4. What the comparator clarifies

Local flatness does not imply trivial global holonomy on a multiply connected domain.

On a smooth patch with a globally real-valued phase and constant \(\alpha_*\), \(A=\alpha_*d\theta\) is exact and \(F=dA=0\). A compact, circle-valued phase can instead have winding: \(d\theta\) is locally closed but need not be globally exact on the exterior of a defect. A loop that cannot be contracted without crossing the excluded flux/core region can then have a nonzero period while the local curvature vanishes along the accessible path.

The source writes \(\nabla_{[\mu}A_{\nu]}\), while the existing Lean result formalizes the exterior derivative \(dA\). These coincide under a torsion-free connection. If a torsionful connection is intended, the torsion contribution must be specified and the zero-curvature conclusion is not automatic. The Blockwave attachment does not state the connection/torsion convention.

The Aharonov–Bohm experiment is a measured example of this local/global distinction. It does **not** identify the Blockwave connection with the electromagnetic vector potential. In the electromagnetic experiment the phase includes the factor \(q/\hbar\); the Blockwave source does not define a corresponding map from \(\alpha_*\) to charge/\(\hbar\).

For a circle-valued phase with winding number \(n\),

\[
\oint_\gamma A=2\pi\alpha_* n.
\]

The source’s condition \(\oint A\in2\pi\mathbb Z\) therefore requires an explicit normalization/unit convention for \(\alpha_*\) and the allowed winding sectors. That normalization is not supplied in the attachment.

## 5. Action-level gap, not a verdict

The action term \(F_{\mu\nu}J^{\mu\nu}\) is a local curvature–current pairing. The loop holonomy is a global period. The source does not derive the map connecting the local pairing to the loop integral on a timesheet trace.

A faithful construction would need to specify the defect/core support, the relevant relative 2-chain or boundary, the timesheet-intersection loop, and the normalization of the connection. The timesheet trace \(\mathcal W^2\cap\Sigma^3\) is a curve along the worldsheet; a meridian loop encircling a codimension-two core is a different cycle in the normal plane. Their identification requires an explicit projection or relative-homology map. If both \(F\) and the worldsheet current \(J\) are singular, the product also needs a regularization or finite-core prescription. A finite-core worldtube could provide a natural excluded neighborhood whose exterior supports noncontractible meridian loops, but that is presently a geometric proposal, not a derived H(s)H result.

The missing bridge is therefore:

\[
\text{finite-core worldtube}
\rightarrow
\text{exterior topology / connection periods}
\rightarrow
\text{timesheet loop readout}
\rightarrow
\text{action-level current coupling}.
\]

No equivalence is assumed, and no physical prediction follows yet.

## 6. Formalization boundary

The existing Loom Lean module already contains `constant_smul_exact_phase_has_zero_field_strength`, which formalizes the local exterior-calculus identity \(d(\alpha\,d\theta)=0\) for a sufficiently smooth globally real-valued 0-form and constant scalar. That statement does not formalize circle-valued phases, winding, nontrivial bundles, defect topology, or physical applicability.

A new theorem, `ab_phase_for_quantized_flux`, added on [PR #759](https://github.com/Satobloc/HsH/pull/759), formalizes only the algebraic identity

\[
\frac{q}{\hbar}\left(n\,\frac{2\pi\hbar}{2q}\right)=n\pi
\]

under \(q\ne0\) and \(\hbar\ne0\). It does not formalize the experiment’s shielding, topology, apparatus, measurement uncertainty, or any map to Blockwave \(\alpha_*\).

The first exact-head build (#41194708279, head `4b6473d8...`) failed because a redundant `ring` tactic followed `field_simp` after the goal was already closed. Removing that tactic produced head `834396a18bcec0d12c788f57049a17be1d29b4ec`. Exact-head [CI run #41194990361](https://github.com/Satobloc/HsH/actions/runs/41194990361) then **succeeded**: Lean 4.34.0 / Mathlib v4.34.0, 8,951 build jobs, zero `sorryAx` occurrences in the complete log. The new theorem's `#print axioms` output is `[propext, Classical.choice, Quot.sound]`; the existing local exact-phase theorem reports the same standard dependencies. Tests, lint, nanoda and the automated axiom-audit stage were skipped.

The tested merge commit was `72b3e989c82883447ffd6199ead4bff8c0d12dd9`, with parents current `main` `23602700fc8b5ab150ed8d7c6ed6b42b623ca501` and PR head `834396a...`. A previous receipt/comment treated the PR REST field `base.sha=d8a363...` as the current merge base; that interpretation was incorrect. The actual Actions merge-ref parents establish the tested base. PR #759 remains draft and unmerged; no independent review is recorded.

## 7. Epistemic disposition

- **Measured:** the 1986 electron-holography experiments report 0/\(\pi\) relative phase outcomes with flux quantization \(h/(2e)\).
- **Exact SI input:** \(h\) and \(e\) are defining constants with zero SI uncertainty.
- **Calculated:** one flux quantum gives phase magnitude \(\pi\).
- **Standard comparator:** nontrivial global holonomy can coexist with local field exclusion on a multiply connected accessible domain.
- **Assistant reconstruction:** the proposed finite-core-worldtube/exterior-topology bridge.
- **Unspecified in Blockwave source:** \(\alpha_*\) normalization, charge/\(\hbar\) mapping, defect/relative-chain readout, and regularization of any distributional \(FJ\) product.
- **Not established:** an H(s)H worldtube-to-medium coupling, a J3-to-J2 map, a new observable prediction, or physical validation of the Blockwave action.

No BEDROCK change or theory promotion follows from this comparator.
