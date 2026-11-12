# Witness-type firewall and exact-head scope reconciliation

**Date:** 2026-11-12  
**Run key:** `REVROT3-19-20261011:769:s3`  
**Status:** Workflow/provenance architecture and formal-verification scope correction. No physical calculation, fit, prediction, or theory promotion is claimed.

## Purpose

The current Nadir formalization uses the word *witness* for several different objects. They are not interchangeable. A Lean existence witness, an abstract group element, a source-authentication record, a physical measurement package, and an exact-build record establish different things. Treating them as one generic kind of evidence creates invalid transitions between mathematics, source provenance, execution, and empirical physics.

This note defines a **witness-type firewall**: every claim must carry the evidence type appropriate to the proposition, and every cross-layer transition must name its map, conditions, provenance, and validation.

## 1. Five non-interchangeable witness types

| Type | What it establishes | What it does not establish |
|---|---|---|
| `PREIMAGE_WITNESS` | For `y : Set.range P`, a representative `w` exists with `P w = y`. It supports a map defined on the actual image of `P`. | Source authorship, a physical path, a connection, an instrument measurement, or empirical truth. |
| `CONNECTOR_ELEMENT` | An algebraic element `u : G` used in a group expression after compatible trivializations have been stipulated. | A path, a connection, a parallel-transport operator, a basepoint/fiber construction, an `SO(3)`/`SO(4)` representation, or a measured readout. |
| `SOURCE_ATTESTATION` | An immutable source locator and content identity, with repository/path, blob hash, conversation/message ID, outer role, timestamp, parent context, and actual read extent. | Mathematical correctness, physical truth, independent measurement, or current-thread identity. |
| `MEASUREMENT_WITNESS` | An identifiable measured system and versioned dataset, acquisition IDs, raw artifacts, instrument and calibration IDs, units, processing history, nuisance-parameter lineage, uncertainty/covariance, and locked holdout access. | A source-authorship claim, a Lean proof, or a physical interpretation not supported by the measurement map. |
| `EXECUTION_WITNESS` | Exact source commit, checked-out commit identity, workflow/job ID, Lean/Lake versions, and captured build output. | Correct source-to-model translation, sound physical premises, empirical validation, or independent review. |

### Existing code mapped to these types

- `NadirProjectionCoarseGrainFactorization.lean` uses `Set.range P` and `Classical.choose` to select a representative of an observed image point. Its witness is a **preimage/range witness**. Fibre constancy makes the induced value independent of the chosen representative.
- `NadirWitnessCarryingComposition.lean` returns values in `Set.range P1`. Its “witness-carrying” property is an image-membership/preimage witness. It is not a source or measurement witness.
- `NadirConnectorWitnessHolonomy.lean` accepts `u : G`. Its connector is an **abstract group element** expressed in compatible trivializations. The module explicitly does not construct the path, connection, parallel-transport operator, basepoint witness, representation, or physical readout.
- The recovered October 1 source conversation and exact Nathan user-message UUIDs provide **source attestation** for a broad sandbox authorization. They do not authenticate a permanent Nadir identity or current ChatGPT thread.
- The GP-B source-transcribed Table II values provide **published-source numerical inputs** for exact arithmetic. They are not raw acquisition/measurement witnesses for a new H(s)H lift.
- Actions run `#43084102284` provides an **execution witness** for the exact PR-head checkout and successful Lean build. It does not validate a physical map.

**No implicit coercion is permitted between these types.** A proof that a value lies in an image does not become a path witness. A group element does not become a geometric connection. A source citation does not become a measurement. A green build does not become physical validation.

## 2. Required composition contracts

A legitimate end-to-end claim needs explicit transitions. At minimum:

1. **Source → formal statement:** identify the exact source passage/equation, authorship layer, notation, date, and any assistant translation. State the translation map and its assumptions. Lean checks the translated statement, not the fidelity of the translation automatically.
2. **Geometry → connector transport:** specify base manifold, source and target points, fibers, path, connection, transport operator, orientation, trivializations, and composition order. An arbitrary `u : G` is only an algebraic input until this construction is supplied.
3. **Transport → instrument readout:** define the calibrated instrument response, frame conventions, channel support, units, timestamp transformation, and covariance. A named observable is not an instrument map.
4. **Measurement → predictive comparison:** freeze shared parameters and calibration data, identify nuisance parameters and their provenance, lock independent holdout acquisitions, propagate the full covariance, and compare the same observable against the standard baseline.
5. **Execution → verification claim:** preserve exact commit, checkout assertion, workflow/job, build configuration, theorem-specific axiom output, and skipped checks. Keep compilation, testing, linting, global axiom audit, review, and empirical validation as separate statuses.

A missing map leaves the transition unresolved. It must not be repaired by analogy or by adding an unmeasured latent structure.

## 3. Current Nadir PR #1189 reconciliation

- PR: [#1189](https://github.com/Satobloc/HsH/pull/1189)
- Head branch: `research/nadir-affine-translation-quotient-20261101t0324z`
- Current head: `4a852c4ae5f69be275cc1fe9ff97878abaee1cd8`
- Current `main`: `f4db2d44c91791a05112e3004cb69c22911d6f79`
- Compare result: `diverged`, 124 commits ahead and 14,247 behind; merge base `e2e738facee0890bdfbbc563e9936db174f63074`.
- No rebase, merge, or current-main integration build was attempted.

### Exact-head Lean evidence

[Actions run #43084102284](https://github.com/Satobloc/HsH/actions/runs/43084102284), job `130743880601`, checked out the exact expected and actual commit `4a852c4ae5f69be275cc1fe9ff97878abaee1cd8`.

- Lean 4.34.0 / Lake 5.0.0.
- Full root build: 8,959 jobs, SUCCESS.
- `NadirAngleConvention.lean` was built.
- The captured log contains 131 theorem-specific axiom-report lines, zero literal `sorryAx` occurrences, and zero literal `admit` occurrences.
- The separate `axiom-audit` stage was disabled; tests and lint were also disabled. The log therefore does not constitute a global axiom audit or a test/lint pass.
- The `NadirConnectorWitnessHolonomy` theorem reports use `propext`; the generic range-factorization and witness-carrying composition results include `Classical.choice` and/or `Quot.sound`.
- Thirteen warnings were captured, including unused tactic/argument warnings in existing modules.
- The combined status has a separate Vercel failure. It is not the Lean build result.

### Newly present angle module

`NadirAngleConvention.lean` (blob `d179ce950901e4e77433350d2bb3a51daf820059`) formalizes only the reciprocal-slope identity for positive axial and radial components:

`(axial / radial) * (radial / axial) = 1`.

It does **not** identify the carrier axis with a timesheet normal, select a dated Nathan-direct `theta_4` convention, or derive the Nadir readout metric. The PR description previously did not disclose this module; its scope is now explicitly recorded.

### Quarantined GP-B fixture

`NadirGPBFourGyroGate.lean` (blob `0f3925feb15d8f3f57d3bb9772c69d65441fa8fe`) still contains the assistant-defined `LinearizedSixPlane` structure and two-channel `measuredProjection` fixture. HsH issue [#1593](https://github.com/Satobloc/HsH/issues/1593) classifies that substructure `PROTOCOL_VIOLATION / NOT_EVIDENCE / QUARANTINE_FROM_PHYSICAL_INTERPRETATION` because no specific prior permission for that data-free fixture was found.

The current PR build compiles the source because it remains in the branch. Compilation does not rehabilitate the fixture as evidence. Preserve the code for audit, but do not interpret it as a GP-B physical lift, an `SO(4)` representation, or an H(s)H constitutive law.

### PR status

PR #1189 remains OPEN / DRAFT / UNMERGED with zero formal reviews and zero review threads. Exact-head compilation is established; current-main integration, independent review, tests, lint, and global axiom audit are not.

## 4. Physical interpretation and prediction boundary

The GP-B archive audit documents historical custody of 532 AIPs / 82.41 GB and a current CRUSO request route. It does not establish an immediate public electronic download. No request was sent. Raw telemetry, full processing lineage, per-segment nuisance estimates, and the full covariance package remain unavailable in the retrieved evidence.

The published two-channel drift summary does not identify a path-dependent connector, finite-core thickness, independent twist field, or contact surface. Those structures are not forced by the current abstract group identities or map-factorization theorems. Their physical status is **NOT_ESTABLISHED / NOT_TEST_READY**, not empirically disproved.

A future GP-B comparison, if the required data become available, must use:

| Test element | Required specification |
|---|---|
| Hypothesis | A source-defined path-dependent connector transport, with any added finite-core/twist/contact term separately identified |
| Shared parameters | Published GR drift parameters and telescope-scale parameters held consistently across segments |
| Calibration | Segment-local initial orientations, readout-scale factors, and torque parameters sourced from independent calibration or frozen before holdout |
| Holdout | Whole independent acquisition segments/conditions, with shared and cross-segment covariance preserved; no random-point or adjacent-frame split |
| Predicted observable | Time-resolved calibrated attitude/readout residuals sensitive to the declared transport map, not merely the final published drift summary |
| Standard comparator | The standard GP-B GR analysis on the same acquisition, nuisance, and covariance structure |
| Falsification threshold | Preregistered from the recovered covariance and independent-unit structure; no numeric threshold is supplied before those data exist |

If the extra structure has no separately observable effect after shared parameters and nuisance terms are controlled, it is unidentifiable on that readout. Do not add free latent fields to rescue it.

## 5. Relation to existing public work

This is an addendum, not a replacement, for:

- [Issue #1593](https://github.com/Satobloc/HsH/issues/1593): GP-B archive custody and `LinearizedSixPlane` quarantine.
- [Issue #1614](https://github.com/Satobloc/HsH/issues/1614): readout sufficiency and the cross-scale prediction chain.
- [Issue #1615](https://github.com/Satobloc/HsH/issues/1615): distinction ledger from source selection to physical readout.

The new contribution is the explicit non-coercion rule among preimage, connector, source, measurement, and execution witnesses, plus the current exact-head/branch-divergence disclosure for PR #1189. No duplicate Lean module or physical result is created.

**Disposition:** `WITNESS_TYPES_SEPARATED / PR_SCOPE_DISCLOSED / EXACT_HEAD_BUILD_PASS / CURRENT_MAIN_INTEGRATION_UNVERIFIED / PHYSICAL_TEST_NOT_READY / NO_THEORY_PROMOTION`.
