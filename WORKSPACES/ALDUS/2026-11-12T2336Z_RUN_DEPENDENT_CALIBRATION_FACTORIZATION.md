# h791:s3 Aldus | Run-dependent calibration and reduced-law factorization

**Disposition: SUBSTANTIVE REPRESENTATION REFINEMENT COMPLETED · EXACT-HEAD TARGET MODULE BUILT · FULL ROOT BUILD BLOCKED BY UNRELATED EXISTING MODULE · PUBLICATION VERIFIED · SUCCESSOR HANDOFF RECORDED · AUTOMATION UNCHANGED.**

## 1. Rotation and source authority

- Nominal hour: h=791.
- Sequence: 5h+3 = 3958.
- Ring index: 6.
- Selected label: Aldus.
- Next label: Calder.
- Run key: `REVROT3-19-20261011:791:s3`.

Aldus is a rotation label, not an authenticated ChatGPT identity. The historical source was recovered from the original raw conversation export:

- Conversation ID: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`.
- Raw Git blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`.
- Direct user-role source messages: `939e981d-72ec-451b-81a3-f0a07b3a2c48` and `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`.

The historical remit is broad cross-disciplinary synthesis, philosophical and artistic exploration, and combining information that is not usually combined. The source is direct user material, but it is not a standalone signed specialist charter. The current workspace role summaries remain assistant-maintained reconstructions.

The existing REV-002 wake packet remains MANUAL-REOPEN-REQUIRED. No authenticated current Aldus thread was established. No new thread was created and no cross-thread delivery is claimed. A clean independent first-blush was not captured because the historical source was read after current project/control context.

## 2. Substantive improvement

The existing law-factorization and instrument-masking discussion in issues #1591 and #1603 left a precise architectural question: when the instrument response depends on run/state calibration, can an observed law still factor through a proposed reduced representation?

Let:
- `pi : X -> R` be the proposed reduced representation;
- `physicalLaw : X -> P` be the physical-law map;
- `calibration : X -> C` be the run/state-dependent calibration state;
- `instrument : C x P -> O` be the deterministic instrument/readout map.

The observed map is:

`observed(x) = instrument(calibration(x), physicalLaw(x))`.

The new conditional results establish:

1. If both physicalLaw and calibration factor through pi, then the observed map factors through pi.
2. If two states share pi and the same physical-law value, but their calibration states produce different instrument outputs, then no deterministic observed-law factor map through pi exists.
3. If calibration is retained in the augmented representation `piPlus(x) = (pi(x), calibration(x))`, the observed map factors through piPlus whenever physicalLaw factors through pi.

This gives a concrete representation rule: calibration must be recoverable from the reduced state, fixed/controlled by the measurement protocol, or retained in the augmented state if it changes the readout.

This is not a new physical primitive. It is a conditional observability and instrument-state result.

## 3. Lean formalization and actual execution

Draft [PR #1657](https://github.com/Satobloc/HsH/pull/1657) adds `HsHVerification.AldusCalibrationFiberFactorization`.

- Branch: `research/aldus-calibration-fiber-factorization-20261112t2336z`.
- Base: `infra/lean4-verification-20261023`, not main.
- Exact head: `c186567b6b85c46076b0de2e6a498bb9fd3ae895`.
- Lean 4.34.0 / Lake 5.0.0.
- Actions run [#43332191359](https://github.com/Satobloc/HsH/actions/runs/43332191359), job #131579358075.

The target module built successfully at target 8926/8947. The theorem-specific axiom reports are:

| Theorem | Axiom report |
|---|---|
| `observed_law_factors_when_physical_and_calibration_factor` | None |
| `omitted_calibration_can_block_reduced_factorization` | None |
| `observed_law_factors_through_augmented_state` | `[propext]` |
| `measurable_observed_law_factors_through_reduced_state` | `[propext, Classical.choice, Quot.sound]` |

No `sorryAx` appears in this module's theorem axiom reports. One non-fatal style warning recommends `let` over `letI`.

The overall root build FAILED at the unrelated existing `HsHVerification.MovingPlaneTraceGeometry` module. Definitions at lines 72, 76, 80, 84, 96 and 197 require `noncomputable` because they depend on `Real.instDivInvMonoid`, `sliceParameter` and `sliceX`. That module was not changed. The successful target-module build is exact-head evidence, but not full-library success.

Tests, lint, nanoda, leanchecker and the separate global axiom audit were skipped. No repository-wide sorry-free claim is made. PR #1657 remains OPEN / DRAFT / UNMERGED and targets the existing verification branch, which is distinct from and divergent with main. No rebase or merge was attempted.

The measurable theorem uses Mathlib 4.34.0, `Mathlib/MeasureTheory/Function/FactorsThrough.lean`, theorem `Measurable.exists_eq_measurable_comp`. It requires a nonempty standard-Borel observed-output codomain and pullback measurability of the calibration and physical-law maps. This is a measurable-function factorization, not a probability-measure or Markov-kernel construction.

## 4. Independent test contract

| Element | Requirement |
|---|---|
| Hypothesis | A reduced-state-only observed predictor fails because calibration varies within a pi-fiber. |
| Shared parameters | Freeze pi, physical-law map, instrument map, calibration version, nuisance parameters, units and output metric. |
| Calibration | Characterize instrument response and calibration ancestry before holdout access. |
| Holdout | Independent acquisitions or matched states with raw provenance and full covariance. |
| Observable | Observed-law/readout differences among states sharing the proposed reduced representation and matched physical-law state. |
| Standard comparator | Fixed-calibration predictor through pi versus augmented predictor through (pi, calibration). |
| Falsification | A reproducible within-fiber observed difference exceeding a preregistered uncertainty tolerance rejects the reduced-state-only predictor for the declared domain. |

The tolerance-based experimental criterion is a test-design proposal, not a theorem in this module. Instrument masking remains possible: observed-law factorization does not imply physical-law factorization.

A stochastic instrument kernel, run-indexed pushforward, disintegration, and covariance-aware approximate factorization remain unformalized.

## 5. Mersearch, tools and source controls

Mersearch was not run. All four existing request lanes remain in REQUESTED state with no verified output manifests. No direct Mersearch connector was exposed and no local pinned checkout was present. No request was overwritten or duplicated. GitHub source retrieval was not represented as Mersearch coverage.

Existing Math Hopper issue #578 and PR #991 were checked. Whirligig Kernel 0 remains a sandbox route, not a replacement for this formalization. SciSpace was checked for Doob-Dynkin literature. Mathlib's version-pinned source theorem was used as the formal reference. No new tool, dependency, fork, subscription or expenditure was introduced.

The HsH, SAT archive and HSH_RESOURCES front doors were consulted. HSH_RESOURCES private payloads were not accessed or copied into public output.

## 6. Physical, source and theory boundaries

The factorization proposal is assistant-authored in issues #1591 and #1603, not Nathan Direct. No actual physical system, raw dataset, provenance package, units, calibration data, covariance, holdout, fit, numerical prediction or independent measurement was supplied or used.

The formalization does not establish that any H(s)H projection, worldtube thickness, twist, contact surface, medium response, calibration law or instrument map exists. It does not force those structures. No SAT-O or Blockwave equation was changed, no equation SHA/date was replaced, and no BEDROCK theory promotion occurred.

## 7. Campaign and upkeep

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: November 24, 2026. The last rereview was November 10, so the 14-day trigger has not been reached.
- No paper gate advanced and no task-graph, priority or ownership mutation was made.

Unrelated reading advanced through SAT archive `SAT Mark V/TheTANGLE.txt`, lines 2211-2250. Next cursor: 2251. No physical break is claimed.

## 8. Publication

[Issue #1658](https://github.com/Satobloc/HsH/issues/1658) is PUBLISHED_VERIFIED through the existing publisher.

- Publisher run: #43332537195, SUCCESS.
- Publisher comment: #6839453247.
- Publisher commit: `01a9c73c8b87975ca4dcfca50d7c9588b3d11c88`.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-calibration-fiber-factorization-20261112t2336z-s3-001.md`.
- Artifact blob: `8e8ae9e4a23fa3021bd3d21b840340a09bec441a`.
- SHA-256: `824fb852f6a6dc323bee63c4c68299323123d982e3970896addca06907e398cf`.
- Independent issue-body/artifact comparison: exact 5,169-character match.

The issue body is the immutable submission-time snapshot. A follow-up issue comment records the later exact-head target build and full-root failure.

## 9. Successor and automation

Calder is the next deterministic ring label. The repository handoff and Calder inbox pointer are optional context only. Successor run timing was not independently readable through the automation connector, so no pre-start or post-start classification, direct-thread delivery, consumption or acknowledgment is claimed. No task, response obligation, review request or ownership transfer was created.

The existing :36 automation lease was not modified. The active roster identifies the existing lease and recurrence; the direct automation read action was unavailable in this run. No task ID, schedule, prompt or phase change was attempted, and no sixth task was created. Scheduler-wrapper completion is not independently confirmed.

Final HsH main head before this report/receipt/handoff write: `01a9c73c8b87975ca4dcfca50d7c9588b3d11c88`.
