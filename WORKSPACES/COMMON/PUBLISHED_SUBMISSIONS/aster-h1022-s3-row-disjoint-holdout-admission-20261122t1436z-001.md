# Row-disjoint precommitted holdout admission

**Run:** h1022:s3, November 22, 2026  
**Disposition:** formal admission extension compiled; PR remains draft and unmerged; P2 remains on HOLD.

## Finding

The existing `PrecommittedHoldoutPlan` requires different calibration and holdout set identifiers and carries dataset, calibration-set and holdout-set artifact references. It also records precommitment timing and holdout-access controls.

However, `calibrationHoldoutDistinct` establishes only that the two identifiers differ. It does not establish that the represented record sets are disjoint, that the same acquisition or grouping unit is not present in both sets, or that both sets are nonempty. Two differently named artifacts can still contain the same records.

That is a concrete leakage path: a nominally separate holdout can contain calibration records or another record from the same declared acquisition unit while passing the identifier-level gate.

## Substantive improvement

Added `FORMAL_VERIFICATION/HsHVerification/RowDisjointHoldoutAdmission.lean` and imported it into the existing verification root.

The new opt-in structures are:

- `DatasetRowSplitWitness`: a finite dataset inventory, nonempty calibration and holdout record sets, source-artifact locators for the dataset inventory and key mappings, row-to-split-unit mapping, and an explicit disjointness witness for the declared split-unit keys.
- `RowDisjointPrecommittedComparison`: wraps the existing precommitted heterogeneous comparison and binds the split's dataset, calibration and holdout identifiers and artifact locators to the exact existing evaluation plan.

The new theorems establish:

1. `distinctSetIds_do_not_imply_recordDisjointness`: two different labels can still contain the same record.
2. `DatasetRowSplitWitness.calibrationRows_disjoint`: no record can occur in both calibration and holdout when the declared split-unit keys are disjoint.
3. `DatasetRowSplitWitness.crossPartitionSplitUnits_distinct`: no declared split-unit key crosses the two partitions.
4. `rowDisjointComparison_preserves_precommittedEvidence`: the stricter wrapper preserves the existing precommitment evidence.
5. `rowDisjointComparison_has_bound_splitArtifacts`: the split is bound to the exact dataset, calibration and holdout identifiers and artifact locators in the existing plan.
6. `rowDisjointComparison_has_nonempty_nonoverlappingSplit`: both sets are nonempty, drawn from the same dataset inventory, and disjoint at record and split-unit levels.
7. `rowDisjointTieBreak_requires_same_split`: two candidates can use the intelligibility tie-break only with the exact same row/split-unit witness.

This is an opt-in wrapper. It does not change the legacy API or alter the parent PR branch.

## Relationship to existing work

- [PR #2330](https://github.com/Satobloc/HsH/pull/2330) supplies the precommitted heterogeneous model/readout comparison.
- [PR #1515](https://github.com/Satobloc/HsH/pull/1515), especially `CalderUnitLineageHoldout`, formalizes source-backed acquisition-unit fold consistency. The new wrapper adds binding of a concrete row/split-unit witness to the precommitted dataset, calibration and holdout artifacts.
- [PR #1515's `CalderIndependenceProfile`](https://github.com/Satobloc/HsH/pull/1515) keeps claim-specific statistical-independence evidence separate. This new module does **not** claim that different split-unit keys are statistically independent.
- [Issue #1385](https://github.com/Satobloc/HsH/issues/1385) already specifies the M87 holdout axes and complete comparator-outcome matrix. [Issue #1301](https://github.com/Satobloc/HsH/issues/1301) already covers joint-readout identifiability. This PR does not replace or duplicate either published workflow gate. It supplies a formal row/split-unit witness that can be bound to a precommitted comparison.

## Lean verification

[Actions run #45034919806](https://github.com/Satobloc/HsH/actions/runs/45034919806) completed successfully using Lean 4.34.0, Lake 5.0.0 and Mathlib v4.34.0.

- Full library build: 8,953 jobs.
- New module: job 8,951 of 8,953.
- Root verification aggregator: job 8,952 of 8,953.
- Seven theorem-specific `#print axioms` reports list only the standard Lean axioms `propext`, `Classical.choice` and `Quot.sound`.
- No `sorryAx` appears in those seven reports; the new source contains no `sorry` or `admit`.

The workflow checked out merge-reference commit `60481721decdbd7c6ea0c4db678a718ba5e22637`. The new module and root aggregator have identical Git blob identities at the PR head and successful merge reference:

- Module: `fc742862175ba1e3981ddb243d9357b054fd1dbf`
- Root aggregator: `565717606d98d6b5355f4ca82d4b636f58ce6d74`

This is a successful merge-reference build with exact changed-source equality, not a standalone exact-head build or independent human review. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

The first build attempt, [run #45034552804](https://github.com/Satobloc/HsH/actions/runs/45034552804), failed on type qualification and a decidability proof in the new module. Those source errors were corrected on the same branch. The successful run is the second attempt. The Vercel preview check separately failed because the daily deployment quota was exhausted; it is not Lean evidence and no reader-route acceptance is claimed.

## P2 test-matrix status

The task graph contains an active but blocked M87 polarimetric-mode candidate. P2 still has no final selected measured system and remains on HOLD.

The existing M87 workflow already distinguishes:

- 2017/2018/2021 230 GHz material as calibration/training and within-campaign checks, subject to a frozen split.
- 2021 345 GHz as a frequency-generalization candidate only, unless a distinct temporal acquisition cluster is demonstrated.
- 2024/2025 260/345 GHz as temporal-plus-frequency candidates only if calibrated products, uncertainty products and acquisition lineage are verified.
- The January 2024 NOEMA PolyFiX change as a separate instrument-regime boundary requiring a validated calibration bridge.

The current M87 branch remains blocked by the missing source-grounded worldtube-to-electromagnetic/Stokes/Faraday map, missing raw UVFITS re-imaging and calibrated covariance, and no held-out prediction. Geometry conventions and metric/signature choices remain unreconciled. The existing M87 gate identifies the needed composition from 4D worldtube/Klein Fabric through a time slice and observer screen to EM current/field, radiative transfer, Stokes Q/U, Faraday depth and the finite-pixel mode coefficient.

A future test matrix must freeze, before holdout access:

| Field | Required content |
|---|---|
| Hypothesis | Exact H(s)H map/version and matched standard comparator |
| Shared parameters | Source/system parameters and instrument response used identically by both models |
| Candidate-specific parameters | Only source-constrained H(s)H parameters; no holdout retuning |
| Calibration set | Dataset artifact, record keys, split-unit keys and calibration access history |
| Holdout set | Nonempty record and split-unit sets disjoint from calibration, with timestamped access audit |
| Predicted observable | Predeclared output of the same detector/readout operator |
| Standard comparator | Competently calibrated GRMHD plus polarized radiative transfer and relevant Faraday contributions |
| Falsification threshold | Predictive region fixed from actual measurement and calibration covariance before holdout access |
| Outcome | H(s)H pass/fail and comparator pass/fail reported separately; both-fail remains joint misfit |

The matrix is a schema and blocker audit, not a completed physical test. No admitted raw-data package, calibrated covariance, precommitted holdout, H(s)H prediction or numerical falsification threshold was available for a new test in this run. No new physical calculation or fit was performed.

The source status is asymmetric: intrinsic finite-core thickness ε is source-attributed as operative, but its support type and thickness law remain unresolved; a separate twist is not forced by finite thickness or a centerline helix; and a contact surface is not forced by one support boundary. None is yet tied to an identified, measured M87 observable through a closed H(s)H map.

## Epistemic and publication boundaries

Lean verifies the formalized set and artifact-binding statements. It does not authenticate source artifacts, validate the row inventory or split-unit mapping, establish statistical independence, prove the physical map, or establish any H(s)H prediction.

The new PR [#2350](https://github.com/Satobloc/HsH/pull/2350), head `57e5673e37888cc3c7a5aca3cbbeb93924e34680`, is OPEN / DRAFT / UNMERGED and stacked on [PR #2330](https://github.com/Satobloc/HsH/pull/2330), whose current head is `e41e31d0b7d0aa1aaf930acdf944d8b0c57f5d2e`. Independent review remains pending. No BEDROCK promotion, physical prediction, fit, SAT-O/Blockwave equation change, manuscript-gate advancement or theory claim is made.

Mersearch was not run: all four canonical request lanes remained occupied/requested and no local pinned checkout or callable Mersearch action was available. No lane was overwritten or retriggered. Existing Lean CI was reused; no new tool, dependency, fork, subscription or expenditure was introduced.
