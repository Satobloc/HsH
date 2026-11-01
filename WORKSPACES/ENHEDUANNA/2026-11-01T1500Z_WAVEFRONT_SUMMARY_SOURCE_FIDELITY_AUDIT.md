# Source-fidelity correction: SATv TIME_WAVEFRONT.txt

**Run:** REVROT3-19-20261011:519:s0 | **Date:** 2026-11-01  
**Classification:** derivative-summary audit; no physical validation or theory promotion.

## Finding

The unbylined SATv TIME_WAVEFRONT.txt summary is not a primary Nathan source. Its Git blob fe1a6f603798c31fa4e5bf704bb31cbcc5ec4ce9 is identical in three archive paths; these are duplicate copies, not independent corroboration. The earliest tracked SAT Mark V path commit is c2528883aac91f2aa62d8342084d1b856e3d5a25 (2025-10-27). The file itself gives no author or composition date.

The summary calls its “core properties” “not negotiable within SAT” and adds a fixed arrow-of-time/no-backward-pass rule, matter-generation language, angular-resonance threshold, drag-mass mechanism, selective energy transfer, and photon release. Those claims exceed the direct source trail.

## Primary-source boundary

- **May 4, 2025 raw conversation** Fundamental Physics Explanations, conversation 6816e398-af14-8002-ab29-cb2d84caf989, blob 9bcd42a355d05ebbbe6b6edec9744d1409d0cfd9: the user describes an **aSAT** picture in which particles are intersection/readout points between 4D filament-like structures and a time wavefront, then asks how mass might arise. The assistant proposes persistence/resistance/tangling. No mass law or resonance threshold is given by the user.
- **SAT4D bylined draft**, June 2025, blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7: contains a worldline action and a one-index filament-flux current placeholder; a later subsection substitutes a Dirac current without an explicit map.
- **SAT.O directives**, July 2025, blob 167136310cdf33ca8f986f33634692314c1a0946: describe a 4D carrier, 1D filaments and a propagating 3D wavefront, while keeping other assumptions and speculative models tentative.
- **July 11, 2026 raw user messages**, conversation 6a51def1-1224-83ea-8b56-d9405e694034, blob b7868607d89f66bbc0e638398182fb2d6b2da2ce: directly distinguish a finite-thickness worldline/tube from a field and propose that it may stir Kelvin vortices in a BEC-like responsive medium.
- **September 6, 2026 raw user messages**, conversation 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f, blob c49367b0faa424491e7b3520a034b9e44fe6897f: propose timesheet/filament mutual distortion and a Kelvin vortex or timesheet-bound soliton as a possible medium response. The wording is exploratory.
- **Nathan-signed THE NEW PHYSICS.txt**, blob 04c32dc83508d2e349ea0093e1935eb58acc62fd, uploaded 2026-10-23 but undated internally, uses tentative language and the heuristic inertia ~ resistance ~ viscosity. It supplies no constitutive law.

## Typed distinction

\[
\gamma:I\to M^4,\qquad W\subset M^4,\qquad \Sigma_t^3\subset M^4
\]

The centerline/worldline \(\gamma\), finite-core worldtube \(W\), and 3D time slice \(\Sigma_t^3\) are different objects. A possible medium vorticity \(\omega_U\) is also distinct:

\[
W\ne\omega_U.
\]

The direct hypothesis is that the tube may couple to or stir the medium. No coupling operator, constitutive law, or projection map from \(W\) to \(\omega_U\) has been supplied. Current HsH BEDROCK.md and AGENTS.md preserve this distinction.

## Verbatim equation provenance

SAT4D draft (Nathan-bylined document, June 2025):

\[
S[\gamma] = \int d\lambda\,L(\gamma^\mu,v^\mu),\qquad
L=\frac12mv^\mu v_\mu-V_{\mathrm{tension}}(\gamma).
\]

The same draft writes a one-index current placeholder:

\[
J_\mu(x)=\langle\text{Filament Flux and Linking Density}\rangle_{\mathcal F(x)}
\]

and later writes \(J_\mu=e\bar\psi\gamma_\mu\psi\), without a supplied derivation between them.

Blockwave assistant attachment, October 19, 2025, blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d:

\[
J^{\mu\nu}\ \text{is a conserved two-form “filament worldsheet” current},\qquad
\nabla_\mu J^{\mu\nu}=0.
\]

This is assistant-generated, not Nathan Direct, and its two-form/worldsheet support is not automatically the same as a 1D worldline or 4D finite core.

The wavefront summary alone proposes:

\[
\Theta(x)\cdot T_{\mathrm{filament}}(x)>\tau_{\mathrm{res}}.
\]

No types, units, or operational definitions are provided for these variables.

## Separate mathematical corrections

The October 19 assistant review notes:

\[
2\Lambda^4\sin^2(\theta/2)=\Lambda^4(1-\cos\theta).
\]

If \(A_\mu=\alpha_*\nabla_\mu\theta\), then for a smooth scalar and torsion-free connection:

\[
F_{\mu\nu}=\nabla_{[\mu}A_{\nu]}
=\alpha_*\nabla_{[\mu}\nabla_{\nu]}\theta=0
\]

locally. A nonzero field strength needs a non-gradient potential, singular/winding structure, defects, or another explicit construction.

A separate NotebookLM synthesis (SAT PRE-H(s)H TIGHTENING.txt, blob 054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e) introduces a 3-form \(J_{\mu\nu\rho}\) with \(d{*}J=0\). If \(J\) is the 3-form itself, the usual closure condition is \(dJ=0\); otherwise the dual form and degree must be stated.

## Lean status

Existing PR #873 exact-head run #41240068390 compiled KestrelProjectedIncidence and KestrelIntersectionDimensionGate. These contain conditional proofs about information lost under non-injective projection and transverse-slice dimension/Poincaré-dual degree. The overall PR workflow failed in the separate KestrelKelvinVortexReadout.lean module (noncomputable Real division instance and “No goals to be solved”). Therefore the full PR is not green and no Kelvin physical mechanism is proved.

## Disposition

No physical calculation, synthetic physical fixture, CODATA scoring, independent measurement, new Lean code, new PR, BEDROCK edit, or theory promotion. Existing issues #1096 (rope comparator), #1118 (Blockwave authorship), #1119 (worldtube/time-slice geometry), and #1157 (SAT action-family provenance) remain the adjacent records. This note is a distinct correction about the unbylined wavefront summary's provenance and authority.

**Next cursor:** recover a raw locator for THE NEW PHYSICS.txt; define the worldtube-to-medium coupling and the time-slice/bulk-medium map; type each current by support dimension; define \(\theta_4\) and pitch with units; retain rope mechanics as a heuristic only.