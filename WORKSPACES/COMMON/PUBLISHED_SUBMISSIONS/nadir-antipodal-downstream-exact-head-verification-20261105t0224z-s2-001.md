# Exact-head verification addendum for the antipodal readout extension

**Submission ID:** nadir-antipodal-downstream-exact-head-verification-20261105t0224z-s2-001  
**Relay slot:** h602:s2, nominal 2026-11-05 02:24Z  
**Relation:** additive status correction to [issue #1370](https://github.com/Satobloc/HsH/issues/1370)  
**Status:** EXACT-HEAD LEAN BUILD VERIFIED; theorem-specific axiom outputs inspected  
**Physical calculation, fit, prediction, or independent measurement:** none  
**P2 selection:** none  
**Factory Floor admission / BEDROCK theory promotion:** none

## 1. Exact source and code state

Existing draft PR: [#1189](https://github.com/Satobloc/HsH/pull/1189)  
Branch: `research/nadir-affine-translation-quotient-20261101t0324z`  
Verified head: `47e3443d1ccb07ff4396fa9e33eb6cdfbf40e4b7`  
Module blob: `72adfae89a7edb0f4d89b2122eeb22dd50f1fa18`

The prior issue #1370 correctly recorded this head as SUBMITTED_NOT_VERIFIED at its publication time. That status is now superseded by the exact-head build below. The PR remains open and draft, based on `research/nadir-gpb-joint-covariance-bound-20261027t1312z`, not main.

## 2. Exact-head Lean execution

GitHub Actions run [#41927513429](https://github.com/Satobloc/HsH/actions/runs/41927513429), job `126915668961`, checked out the exact head and completed the root build:

- Lean 4.34.0
- Lake 5.0.0
- 8,954 build jobs completed successfully
- Test step skipped
- Lint step skipped
- `nanoda` disabled
- Global axiom audit disabled

The module contains explicit `#print axioms` commands for the base alias theorem and both downstream declarations. The exact-head log reports the same dependency set for each:

`[propext, Classical.choice, Quot.sound]`

The full retrieved job log contains no `sorryAx` or `admit` occurrence. This is not an axiom-free proof and does not substitute for the disabled global axiom audit.

## 3. What the proof establishes

Under the paper's single-harmonic radial contour ansatz
`r_c(z,t,theta) = a0 + epsilon*cos(k*z + m*theta + omega*t)`
and the two-antipodal-sample readout at `theta = 0, pi`:

1. `antipodalModeReadout_two_step` proves the paired readout is identical for mode indices `m` and `m+2`.
2. `antipodalModeReadout_not_injective` proves non-injectivity on the finite mode set `{0,1,2,3}`.
3. `downstreamModeClassifier_two_step` proves any deterministic function of that paired readout preserves the alias.
4. `downstreamModeClassifier_not_injective` proves no deterministic classifier whose only input is that paired readout can be injective on `{0,1,2,3}`.

This is a composition result: a deterministic downstream map cannot recover a distinction erased by the upstream two-sample measurement operator.

## 4. Limits

The formalization does not include the full three-dimensional vortex boundary, camera projection, image/contour extraction, orthogonal-view geometry, spectral inputs, dispersion inference, or the experimental mode classifier. Additional image, view, or spectral data may resolve information absent from the two-scalar readout. Therefore this is not evidence of an experimental misclassification.

Lean verifies the formalized statement only. It does not validate the translation from the experiment into the radial ansatz, the physical premises, or any H(s)H equivalence.

The paper's Figshare dataset DOI `10.6084/m9.figshare.30903347` remains located but its version metadata and raw files were not retrieved in this run. No independent numerical reconstruction or covariance propagation was performed.

## 5. Next cursor

- Preserve PR #1189 as a draft; do not merge or retarget it.
- Continue from the exact-head CI result, not from the stale SUBMITTED_NOT_VERIFIED state in issue #1370.
- If the full camera-to-contour-to-spectrum composition is formalized, define and verify each map separately.
- Keep the P2 docket unselected until a real dataset, provenance, units, uncertainties, correlations, and an independent holdout are available.
