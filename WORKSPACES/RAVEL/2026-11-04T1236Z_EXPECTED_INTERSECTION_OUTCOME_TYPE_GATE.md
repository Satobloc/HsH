# Ravel :36 — typed expected-intersection outcome gate

**Run key:** `REVROT3-19-20261011:588:s3`  
**Nominal slot:** 2026-11-04T12:36Z  
**Worker label:** Ravel (ring index 17)  
**Next label:** Orson Vay (ring index 18)  
**Status:** INTERNAL SANDBOX / EXISTING DRAFT-PR CODE UPDATE / MERGE-REF LEAN BUILD PASS / NO PHYSICAL PREDICTION / NO THEORY PROMOTION.

## 1. Identity and source provenance

The historical Ravel role was recovered from the saved source conversation, not inferred from the workspace summary. Nathan's direct role instruction asks Ravel to serve as primary co-theorist, with accuracy-first work and a citation-supported, accessible public record. The current Ravel workspace identifies the same head-co-theorist/source-reconstruction remit.

The historical conversation family is `🎼 Ravel [H(s)H] Syncmathcek`, native conversation ID `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`. The readable Library raw-export snapshot available in this run is an older 2026-09-15 snapshot (10,671,630 bytes); the live Ravel continuity record points to a later 12,408,770-byte export. The older snapshot contains the direct messages cited below, but it is not claimed to cover all later live turns. No authenticated current Ravel ChatGPT thread handle was available. This run is source-grounded continuity reconstruction, not a claim that a historical instance was reactivated.

Relevant Nathan-direct source messages:
- `638d13ba-1541-483d-853f-3b6d04b9b1b2`: primary co-theorist role and accuracy/public-record expectation.
- `3d0ad680-51db-4c79-ad4a-9bbacada24ef`: use a spatial Kerr section and extend it along the filament; do not treat the entire 4D Kerr spacetime as the cross-section.
- `b9805319-9d77-4b43-874a-5af50c0b6ef7`: force is identified as primitive; filament and timesheet distortions mutually accommodate as they exert force on one another.
- `496a15ea-0263-459d-b815-908f52155b90`: three active representations are distinguished (3D block diagram, full 4D bulk, and a 4D view with a 3D slice). The proposed induction-current connection within timesheet thickness is tentative wording, not a defined current.
- `62b85640-6a36-47b7-b064-94c97106f9b6`: do not presume that an arbitrary Kerr structure performs the proposed role; recover the actual 3D construction and its measurements.
- `c0d7fc1c-dc72-4cc7-b2a0-1e2cb686be4e`: Kerr/Pauli, shell/closed-string, and shell-deformation/string-vibration correspondences are proposals to test, not established equivalences.

The historical role statement is direct source. The current map interface and formal type below are assistant reconstructions/proposals. No independent physical measurement was obtained.

## 2. Geometry-to-observation map closure

The source-level operation is: select a spatial Kerr section, then extend that section along the filament. The source does **not** specify a product bundle, normal-bundle framing, transport connection, or embedding. Those are reconstruction choices, not Nathan-direct equations.

The required map chain is now stated as separate obligations:

1. **Section selection:** choose a spatial section of the Kerr geometry. Missing: foliation/time function, slice parameter, regularity/spacelike conditions, induced metric and boundary.
2. **Fiber placement/transport:** extend the selected section along the filament. Missing: base parameterization, fiber framing, transport/connection, scale, boundary and injectivity conditions.
3. **Ambient embedding:** provide an explicit map from the extended fibered object into the ambient 4D geometry. A candidate (B^1\times K_\tau^3\to M^4) is an assistant reconstruction, not a source-defined product.
4. **Timesheet incidence:** specify the timesheet embedding and its pullback against the core embedding. Existing PR #1133 formalizes conditional set-level pullback/projection identities; it does not instantiate the physical Kerr/timesheet maps.
5. **Interaction/response:** supply a paired filament/timesheet response object consistent with the direct force-primitive statement. No constitutive law, action-reaction symmetry, or electromagnetic current is assumed.
6. **Observer/readout:** specify the instrument/observer map and coarse-graining, including uncertainty and information loss.

The direct statement that force is primitive requires an interaction/response slot; it does not determine its functional form. The tentative “induction current” phrase is not a conserved-current definition. The three representational views require explicit projection maps and composition conditions; visual resemblance is insufficient.

## 3. Substantive formal improvement

The existing `RavelCarrierSheetDimensionGate.lean` used a Nat-valued expected-intersection helper:

`left + right - ambient`.

When `left + right < ambient`, natural subtraction truncates a negative expected dimension to zero. That conflates a generically empty transverse intersection with a genuine zero-dimensional expected intersection. Aldus had independently identified this edge case in the cross-read of PR #1133 (comment #6573688058).

I added a typed companion, `ExpectedTransverseIntersectionOutcome`, with two constructors:
- `genericEmpty deficit`
- `dimension value`

The old Nat helper remains available for its nonnegative regime, but its comment now directs generic cases to the typed result.

Formalized arithmetic cases:
- 1D/1D in 4D: `genericEmpty 2`.
- 1D/3D in 4D: `dimension 0`.
- 4D/3D in 4D: `dimension 3`.

A regression theorem shows the old Nat helper returns the same zero for the first two cases; a separate theorem shows the typed result distinguishes them. A conditional agreement theorem proves that, when `ambient ≤ left + right`, the typed result agrees with the legacy Nat helper.

This is a type-safe representation of the **expected** generic dimension, conditional on transversality. It does not prove that a particular intersection exists, that a physical carrier is smooth, that transversality holds, or that the proposed Ravel geometry is physically realized.

## 4. Lean execution and limits

The update was made on the existing Ravel branch, not a new branch or PR:

- PR: #1133, still OPEN / DRAFT / UNMERGED.
- Branch: `research/ravel-carrier-slice-reconstruction-20261031t0212z`.
- Branch commit: `ca0a57e55caef5df3cd291957c158384fd15d0c1`.
- Updated module blob: `dae31690baf7170b0c156f1c7e9a7987f890eb59`.
- CI run: #41836778560; job #126597618007; SUCCESS.
- Checked-out merge reference: `d59b161f066fccb43414374c71aefd7c3d408c7d`, merging PR head `ca0a57e` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- The target module blob at the PR branch and merge reference is identical.
- Lean 4.34.0; Lake 5.0.0; 8,950 build jobs completed successfully.
- Actual `#eval` output: `genericEmpty 2`, `dimension 0`, `dimension 3`.
- The three case theorems, the legacy-collision witness, and the typed-separation theorem report no axioms. The general nonnegative-agreement theorem reports standard `propext`; existing module theorems also use standard `propext` / `Quot.sound` where reported.
- Full log contains no `sorryAx` or `admit`.
- Tests, lint, nanoda and the separate automated axiom-audit stage were skipped.

This is a successful **merge-reference** build with the exact target-module blob present; it is not a standalone exact-head checkout. PR #1133 remains draft and is not merge-ready until its base is integrated and exact-head CI is green. Lean checks the formalized arithmetic only, not the source translation or physical premises.

No local Lean/Lake/Elan executable is installed in this runtime. Existing GitHub Actions on the current PR supplied the actual compile and `#eval`; no new tool, dependency, branch or PR was created.

## 5. Distinguishability and empirical status

The standard comparator remains the appropriate GR/Kerr geometry with the same declared measurement operator. A distinctive H(s)H result requires the complete source-to-observable composition, not merely a Kerr-like picture or a dimension label.

For a future real-system test, the H(s)H-only geometry/response parameters must produce an observable component that cannot be absorbed by standard shared parameters or instrument/calibration nuisance directions. Calibration parameters must be frozen before a genuinely independent holdout; the falsification threshold must be derived from the actual measurement covariance.

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Comparator | Falsification threshold |
|---|---|---|---|---|---|
| Standard GR/Kerr baseline | To be defined for a selected measured system | Real calibration block; separate holdout | Standard geometry through the same instrument map | GR/Kerr plus standard readout | To be derived from measured covariance |
| H(s)H extension | Same shared parameters plus independently identifiable H(s)H-only geometry/response parameters | Same calibration block; blinded independent holdout | (O\circ R\circ I\circ E) after explicit projection/coarse-graining | Same GR/Kerr baseline | Fail if the added effect is nuisance-degenerate or does not clear the predeclared held-out threshold |

This is an acceptance schema, not a populated empirical test matrix. No physical system was selected, no raw physical dataset was retrieved, and no physical calculation, fit, held-out prediction, or Factory Floor admission was performed. P2 remains ACTIVE with system selection unresolved.

## 6. Mersearch, tools, and publication

The existing Mersearch lane-3 request `ravel-kerr-timesheet-geometry-source-20261104-1235` is present, but no request-scoped `RUN_MANIFEST.json` or `SEARCH_RECEIPT` exists. All four shared request lanes are occupied; no lane was overwritten and no duplicate request was opened. The available saved raw-conversation snapshot and known HsH source/PR files were used as bounded fallback; this is not claimed as a Mersearch execution.

The existing Lean PR, Math Hopper/Whirligig routes and Tool Chest were checked before any tooling proposal. No new tooling or paid service was needed; the local runtime lacks Lean, while the existing CI provides Lean 4.34.0. SciSpace is available as a connected research app but was not needed for this formal arithmetic correction.

The code change is visible in the existing public draft PR #1133. Existing issue #1340 already publishes the earlier O5/O8 source-variant and geometry-fidelity report. No new issue-publisher submission, direct `PUBLISHED_SUBMISSIONS` write, duplicate issue, or publisher bypass was made.

## 7. Protected status and next cursor

- BEDROCK and STATE_OF_THE_THEORY unchanged; no theory promotion.
- SAT-O and Blockwave originals/equations unchanged.
- Main task graph unchanged; P2 remains ACTIVE, no system selected.
- November 9 P1, November 30 P2 and December 14 P3 gates remain separate.
- FIE last full review: 2026-10-27; next due 2026-11-10.
- Unrelated reading break: HsH `TheTANGLE.txt`, lines 1401–1440; next cursor line 1441.
- Existing Orson optional handoff remains the sole packet for the next deterministic Orson appearance `REVROT3-19-20261011:588:s4`. No new physics task, ownership transfer, response obligation, or P1 reassignment was created; Orson's cognition remit remains protected.
- No signet, conversation rename, automation/task ID, schedule, phase, cadence, enabled-state or sixth-task change.

Next Ravel cursor: recover the O5/O8 author/source conversations when a Mersearch lane becomes available; resolve the `ell_f` radius/diameter and `rho_link` support-measure ambiguity; specify the spatial Kerr section-to-fiber transport and ambient embedding; then define the paired force-response and observer/readout maps. Do not select a physical system or calculate until the real measured inputs, provenance, units, uncertainties, calibration, holdout and falsification threshold are available.
