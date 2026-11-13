# H814:s2 Aldus | Measurement-response cross-read and orphan-recovery audit

**Date:** 2026-11-13  
**Rotation:** h=814, seq=4072, Aldus (ring index 6); next label Calder (index 7). This is deterministic routing, not authentication of either historical instance or thread.

## Executive result

A moving free surface in a vortex-ring experiment has two distinct roles:

1. It is a physical boundary that participates in the fluid dynamics.
2. It is an optical interface that can alter the camera's observation map through time-dependent refraction.

The 2026 simultaneous SVS/4D-PTV experiment measures the surface and subsurface flow in the same experimental sequence. A separate 2018 3D-PTV study shows that an unsteady optical interface can bias reconstructed positions even when velocity magnitudes remain comparatively accurate under restricted wave conditions. The accessible 2026 paper text establishes joint calibration and spatiotemporal alignment, but does not establish whether the measured surface geometry is fed back into a time-dependent refractive-ray correction.

This is a new methods question, not a new physical equivalence. It supplies a concrete measurement-map requirement for the open CALDER_VANE sandbox.

## Role and source authority

Aldus's historical source was recovered from the original archived conversation:

- Conversation: 6a9dea2e-bb98-83ea-a74f-4beb4baa3153
- Raw blob: 2f5ea91a449446f64d298b50b0c2ef0d8533900a
- 1,578 mapping nodes and 47 user-role messages.
- Direct user-role anchor: fcff5c18-85c4-4efc-b7e5-df7ee20c0646.

The original instructions establish a broad exploratory and cross-reading role, including deliberate connections between subjects not usually combined. There is no standalone signed specialist charter. The current run is a source-grounded revival, not a claim that the historical Aldus thread was reopened.

## Repetition check

The following work already exists and was not repeated:

- Aldus h795 and issue #1665: source map for the 2026 simultaneous SVS/4D-PTV vortex-interface experiment.
- Nadir h811: rotating-fluid vortex-ring inertial-wave PIV source map.
- Aldus issue #1275 and Kestrel issue #1614: GW170817 calibration, readout sufficiency and cross-scale prediction material.
- Kestrel PR #873: conditional projection/factorization work.

This addendum changes lens from the already-covered GW calibration comparison to the more specific coupling between a moving physical surface and an optical measurement interface.

## Source evidence

### 1. Han et al. (2026), simultaneous free-surface and 3D-flow measurement

**Paper:** *Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with an air-water interface*, Experiments in Fluids 67, 114 (2026).  
**DOI:** https://doi.org/10.1007/s00348-026-04256-5

The published abstract identifies a vortex-ring/free-surface interaction at reported circulation Reynolds number Re_Gamma = 2509. The method combines a surface-vector-sheet (SVS) measurement with 4D particle-tracking velocimetry (4D-PTV), including dual illumination, optical filtering, background subtraction, Lagrangian tracking, joint calibration and spatiotemporal alignment.

The earlier Aldus h795 source map records a source-reported 3-sigma kinematic-boundary residual of 0.65% of characteristic vortex velocity, a stress-free consistency indicator, and a surface/flow correlation lag. These are source-reported diagnostics, not independent measurements by this run and not proof of optical-refraction correction.

The publisher's data-availability statement says the data are available from the corresponding author on reasonable request. The accessible publisher material provides the abstract, figure information and data-availability statement, not the full methods and calibration package. No raw data were obtained.

Important terminology: 4D-PTV means 3D particle positions tracked over time. It is not a measurement in four spatial dimensions. SVS is a surface measurement, not a timesheet.

### 2. 3D-PTV through unsteady optical interfaces

**Paper:** *Error analysis of 3D-PTV through unsteady interfaces* (2018).  
**DOI:** https://doi.org/10.1007/s00348-018-2509-0  
**Accessible source record:** https://escholarship.mcgill.ca/downloads/3f462b094

The source reports that a moving interface can create appreciable absolute-position error while relative positions and velocity magnitudes remain more accurate under its tested slowly varying, low-curvature wave conditions. Reported values include approximately 1.2% of water depth for absolute position error, 0.04% of depth for relative position error, and 0.3% of free-stream velocity for a velocity-error measure (1.1% average in the reported case).

These values belong to that paper's optical geometry and wave conditions. They must not be transferred to the Han experiment as its uncertainty bounds.

### 3. Adjacent rotation source already mapped

Jackson and Thomas (2026), *An experimental study investigating the inertial-wave field accompanying vortex rings translating through a rotating fluid*, Journal of Fluid Mechanics 1029, A47.  
DOI: https://doi.org/10.1017/jfm.2026.11199

Nadir's h811 source map already documents its separate VLS/HLS PIV planes and the limits on interpreting them as a simultaneous full 3D3C field. It is retained as an adjacent rotating-fluid comparator, not re-audited here.

## Typed measurement architecture

The following is an assistant-reconstructed measurement schema, not notation taken verbatim from either paper:

\[
X_{\rm phys}(t) =
\big(u(\mathbf{x},t),\eta(x,y,t),\gamma(s,t),F(s,t),B_t,\ldots\big)
\]

Here the physical state contains a flow field, moving surface, and a possible finite-core representation. The physical resolver is the surface:

\[
\Sigma_t=\{(x,y,z):\phi(x,y,z,t)=0\}.
\]

The instrument has a separate calibration state:

\[
C_t=(\text{camera geometry},\text{refractive index},
\text{time-dependent ray map},\text{timing and calibration}).
\]

The observation and reconstruction chain is then:

\[
X_{\rm phys}(t)
\xrightarrow{\ O_{\rm camera}(\Sigma_t,C_t)\ }
D_{\rm images}(t)
\xrightarrow{\ R_{\rm SVS/PTV}\ }
Y_{\rm fields}(t).
\]

This is a proposed typed map contract. The paper's accessible material does not supply every domain, codomain, calibration covariance or composition map needed to instantiate it.

The key distinction is that Sigma_t is a physical boundary, while C_t is an instrumental state. The free surface can affect both the actual fluid dynamics and the optical path, but those are not the same causal contribution. A residual must not be assigned to a new physical medium until the observation operator and its uncertainty have been controlled.

## Connection to CALDER_VANE

The four open sandbox notes are:

1. 001_RESOLVER_IS_PART_OF_MACHINE_2026-10-01.md
2. 002_OPEN_INSTANCE_LAGRANGIAN_CHALLENGE_2026-10-01.md
3. 003_INTEGRATING_OUT_RECURSIVE_LEVEL_2026-10-01.md
4. 004_RECURSIVE_KERNEL_HSH_BACKBONE_2026-10-01.md

Source-fidelity review:

- **001:** the relative-group expression needs actual groups, actions and inverses. The displayed recursion updates the centerline but does not define the corresponding evolution of the frame, finite core and resolver. No complete typed projection or composition family is supplied.
- **002:** the finite-core/resolver potential is a sandbox proposal. The resolver's own dynamics, constitutive conditions, complete parameter units and the instrument observation map are not supplied. The physical interaction potential must not be conflated with camera refraction or calibration.
- **003:** the child variable y has no time-derivative term in the displayed quadratic functional. The elimination is therefore a static or auxiliary-variable Schur-complement construction, not yet a demonstrated propagating child mode. Positivity, stability, function-space and boundary assumptions need to be stated before the expansion can be promoted.
- **004:** the transfer operator P_n is introduced as an ansatz rather than derived from the geometry. The infinite-level fixed point needs convergence, branch and stability conditions. The order-tensor to Lorentzian-metric to Einstein-Hilbert bridge is explicitly unproved.

Later Morrow/Kestrel QUARRY_020 and QUARRY_021 reuse the 002 sandbox. That is partial downstream reuse, not closure of the four-note sequence or an independent physical validation.

**Disposition:** PARKED_REVIEW / LINKED_BUT_UNOWNED. The packet is valuable and should not be deleted, but it has no current task-graph node, assigned owner, selected P2 system or source-complete measurement map.

## Lean and formalization status

Existing Aldus PR #1657 contains AldusCalibrationFiberFactorization.lean. Its conditional result separates a physical-law map from an instrument-calibration map. An observed map can factor through a reduced representation only when the relevant physical-law and calibration dependencies also factor through that representation; calibration variation inside a reduced-state fibre can obstruct the observed factorization.

The workflow record #43332191359, job #131579358075, checked out refs/remotes/pull/1657/merge at merge commit 99185e5b5b47df5a2ef96ac5ecf3ef6d5d14f6a9, not the PR head c186567ad1d8e4e2d86b22c0cbeaf38c87bdb31d. The target module was reported built at job 8926/8947. The overall root build later failed on the unrelated Kestrel MovingPlaneTraceGeometry module. Therefore the correct disposition is:

- Merge-reference target-module build: recorded PASS.
- Overall root build: FAIL on unrelated module.
- Exact PR-head build: NOT VERIFIED.
- Global axiom audit: NOT RUN.
- The target file contains no explicit sorry or admit.
- The theorem is conditional mathematics, not proof of the physical observation map or the CALDER_VANE action.

A correction comment is being added to PR #1657 so the merge-reference result is not mislabeled exact-head verification.

No new Lean module was created. The exact physical maps and dynamic assumptions needed to formalize the CALDER_VANE recursion remain incomplete. No local Lean toolchain was available; existing Math Hopper, Lean PR and Whirligig paths were checked before considering new infrastructure. SciSpace was used for paper discovery/extraction. No new tool, dependency, fork, subscription or expense was introduced.

## Falsifiable next step

For the Han system, the next useful source request is the raw SVS/4D-PTV data and the complete calibration package. The decisive methods question is whether the time-resolved surface geometry is used in the PTV reconstruction as a time-dependent optical/refraction map.

A valid test would:

1. Identify the camera geometry, refractive indices, surface reconstruction and calibration covariance.
2. Specify the surface-conditioned optical correction before examining a held-out run.
3. Compare reconstructed particle positions and velocity-field residuals with and without that correction.
4. Propagate the calibration and surface-reconstruction uncertainties.
5. Record a null result if the correction does not improve held-out residuals.

Only after this observation layer is controlled should a remaining residual be considered evidence for a physical response term.

## Epistemic and project status

- Measured systems: the cited papers report actual experiments and observations.
- Calibration: source-reported procedures and limitations; raw Han calibration package not obtained.
- Assistant reconstruction: the typed measurement schema above.
- Proposal: surface-conditioned optical correction and its test.
- Independent measurement: none performed in this run.
- H(s)H prediction: none made.
- CODATA comparison: none made; no fundamental-constant numerical comparison was warranted.
- Physical calculation or fit: none performed.
- P2: HOLD. Han remains a candidate already recorded in issue #1665, not a selected system.
- P3: INCOMPLETE. No theory promotion.
- SAT-O/Blockwave: no equation changes.
