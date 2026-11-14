# H830:S3 | Boundary provenance and mask-invariance gate

**Status:** Proposed observation/verification architecture. This is not a physical prediction, P2 system selection, empirical result, or theory promotion.

## The new gap

Existing open draft PRs contain useful conditional components, not merged theory claims:

- [PR #1098](https://github.com/Satobloc/HsH/pull/1098) distinguishes a full-core region intersecting a transverse timesheet from a boundary shell intersecting that timesheet. The corresponding section and rim dimensions are conditional on the stated geometric hypotheses; see the [source-exposure and support-map audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-11-14T1048Z_H826_S4_REVIEW_MIND_COMPARISON_FREEZE_SOURCE_EXPOSURE_QC.md).
- [PR #1594](https://github.com/Satobloc/HsH/pull/1594) formalizes a swept-carrier boundary contract with endpoint and side terms. Its product-boundary identity is a premise of the formal record, not an instantiated physical sweep map.
- [PR #1657](https://github.com/Satobloc/HsH/pull/1657) separates physical-law and instrument-calibration factors.
- [PR #1133](https://github.com/Satobloc/HsH/pull/1133) treats representation conversion and observable readout conditionally.
- [Issue #1735](https://github.com/Satobloc/HsH/issues/1735) binds mathematical, empirical, comparator, and analysis evidence to one frozen comparison.

The missing link is **boundary provenance**. A detected edge can arise from a physical worldtube boundary, a sweep endpoint or side, a finite timesheet-patch edge, an acquisition-window mask, or an instrument-response threshold. These are not interchangeable, and a single observed edge may contain overlapping contributions.

## 1. Keep carrier and edge types distinct

A full-core 4D region intersecting a 3D timesheet gives a 3D section under the conditions used in PR #1098. Its 3D boundary shell intersects the timesheet in a 2D rim under the corresponding transverse conditions. A swept carrier has separate endpoint and side-boundary terms. An instrument window and a response threshold belong to the observation channel, not automatically to the physical carrier.

The observed edge should therefore carry a set of source components, not one forced label:

- physical support boundary;
- sweep endpoint;
- sweep side;
- finite timesheet-patch edge;
- acquisition-window or aperture edge;
- response/threshold edge;
- unresolved overlap or corner stratum.

The overlap matters. A physical rim clipped by an acquisition window is not wholly physical or wholly instrumental.

## 2. Conditional boundary statement

Let **Section** be the physical section on a timesheet and **Window** the instrument's acquisition region within that timesheet. The observed support is their intersection. A candidate topological inclusion is:

\[
\partial_\Sigma(\mathrm{Section}\cap\mathrm{Window})\subseteq
(\partial_\Sigma\mathrm{Section}\cap\overline{\mathrm{Window}})
\cup
(\overline{\mathrm{Section}}\cap\partial_\Sigma\mathrm{Window}).
\]

This is a proposed formalization target, not a compiled theorem or an H(s)H equation. The inclusion separates possible section-boundary and acquisition-window contributions. Equality of smooth faces, dimensions, and corner structure requires additional regularity and clean-intersection hypotheses. If the timesheet itself is only a finite patch, its edge must be separately identified rather than silently absorbed into the physical boundary.

## 3. Proposed evidence object

Add a **BoundaryProvenanceWitness** to the existing **ComparisonFreeze**. It should bind:

- carrier kind and section/rim type;
- all applicable boundary-source components and their overlap/corner relations;
- source-map identity and source blob;
- timesheet and coordinate-frame identity;
- acquisition-mask version and instrument-response/threshold version;
- calibration and covariance identities;
- mask-perturbation plan and independently acquired run IDs;
- predicted edge signature, standard-comparator identity, holdout, and falsification rule.

Do not classify an edge as physical merely because it appears in a plot. The witness records competing origins and the evidence used to distinguish them.

## 4. Mask-perturbation test

Use at least two independently acquired runs of the same measured system with shifted or expanded acquisition windows and a registered overlapping physical field of view. Hold the physical model, time registration, calibration, response model, and shared parameters fixed. Calibrate on the designated calibration run; keep the other acquisition(s) untouched for holdout.

A physical edge should remain fixed in calibrated physical coordinates. A mask edge should track the changed window. A response-threshold edge should track the calibrated response or detection threshold. Re-cropping one raw acquisition is a robustness check, not an independent holdout.

For the standard comparator, use the established physical boundary model plus the measured mask and instrument response. An H(s)H contact or edge feature is distinguishable only if its source-defined signature remains invariant under the mask perturbation and produces a preregistered residual beyond the standard model's predictive envelope and measured uncertainty. If physical-boundary and mask-boundary sensitivities remain indistinguishable across the available windows, the edge origin is not identifiable.

| Test element | Required specification |
|---|---|
| Null comparator | Standard physical boundary plus acquisition mask and calibrated response |
| H(s)H candidate | Source-defined contact/edge map with no post-hoc edge parameter |
| Shared parameters | Physical geometry, time registration, calibration, response, mask geometry, threshold, and covariance |
| Calibration/holdout | Separate acquisition runs with different windows; no reuse of holdout for tuning |
| Predicted observable | Edge support, normal/curvature, time evolution, and cross-channel alignment in registered coordinates |
| Falsification | H(s)H candidate fails if the feature tracks the mask, disappears after response correction, or remains inside the standard predictive envelope. The standard comparator is challenged only by a preregistered H(s)H signature persisting across independent windows/runs beyond measured uncertainty. |

No numerical threshold is justified until the raw data, calibration, units, repeat-run structure, and covariance are available.

## 5. Grounded measurement candidate, not a result

The project has identified a published synchronized surface/volume vortex-ring measurement using stereoscopic surface measurement and 4D-PTV ([prior measurement-candidate audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-14T1336Z_H829_S3_COORDINATE_TO_INSTRUMENT_COMPOSITION_GATE.md)). Its moving free surface is both a physical boundary and an optical interface. The acquisition window is a third, distinct object. The raw image series, particle tracks, calibration matrices, optical-path record, repeat-run structure, and covariance have not been retrieved. This remains a candidate test design, not a selected P2 system or a completed measurement.

The independent method reference [Error analysis of 3D-PTV through unsteady interfaces](https://doi.org/10.1007/s00348-018-2509-0) motivates treating optical-interface uncertainty explicitly. Its numerical errors must not be transferred to another apparatus.

## 6. Source and authority boundary

The unbylined SAT-O1 source describes a 1D filament and calls its worldtube a 4D volume swept by that filament, but supplies no map from the curve to a finite 4D support. Its HsH blob is 7577aa1ee5a6c3850ce3b226c75377de6367aedc; the SAT archive records source timestamps 2025-06-07 and 2025-06-09. The July 2025 SAT4D_6 directive is a separate source, blob 167136310cdf33ca8f986f33634692314c1a0946.

The 2025-09-16 user-supplied BLOCKWAVE.txt attachment has Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d and SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664. User-supplied attachment status does not establish internal equation authorship; its embedded prose remains assistant-voiced. The original source equations remain untouched. The proposed sweep-boundary identity in PR #1594 is a separate conditional contract, not a correction to SAT-O1 or Blockwave. See the [source-equation custody amendment](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-11-11T1036Z_SWEEP_BOUNDARY_CONSERVATION_GATE_AMENDMENT_02_SOURCE_EQUATIONS.md).

## 7. Formalization and decision

The cited PRs remain OPEN / DRAFT / UNMERGED. Their relevant modules have limited CI evidence, not integration proof or empirical validation. PR #1098's latest root build failed even though its target module built; PR #1594's target module built but its separate axiom audit was skipped. The new boundary-provenance witness and mask-perturbation invariant have not been formalized or compiled. The local execution environment has no Lean, Lake, or Elan toolchain. No new theorem, physical calculation, fit, prediction, independent measurement, P2 selection, equation modification, or BEDROCK promotion is claimed.

**Decision rule:** a visible edge alone does not force an additional H(s)H contact surface. Such a surface remains optional or unresolved until a source-defined map requires it and a mask-invariant, independently held-out signature distinguishes it from the standard physical-boundary-plus-instrument model.
