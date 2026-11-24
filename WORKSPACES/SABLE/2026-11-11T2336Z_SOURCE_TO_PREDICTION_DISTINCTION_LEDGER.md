# Distinction ledger: preserving information from source selection to physical readout

**Date:** 2026-11-11  
**Run key:** `REVROT3-19-20261011:767:s3`  
**Status:** Workflow architecture and formal-evidence crosswalk. No physical calculation, fit, prediction, or theory promotion is claimed.

## Purpose

A source-derived claim can pass through selection, encoding, geometric reduction, instrument response, and statistical comparison. Each stage may discard distinctions. A later stage cannot recover information that an earlier stage erased unless it independently reopens the original source or acquires a new measurement.

The archive/continuity pipeline and the physical-model pipeline are not the same kind of system. They share a map-theoretic failure pattern; this is not an ontological equivalence between cognition and physics.

## 1. The distinction ledger

For any map `f : A -> B`, define the equivalence relation it induces:

`a ~f a'` exactly when `f(a) = f(a')`.

The equivalence classes are the distinctions that the downstream representation treats as identical. A target `q : A -> C` can be recovered deterministically from `f` exactly when it is constant on every class:

`f(a) = f(a')  implies  q(a) = q(a')`.

If `f` is non-injective, a later deterministic encoder `e : B -> D` cannot restore injectivity: `e o f` still maps every already-collapsed pair to the same result. Reopening the original source is not a decoder; it returns to `A` and permits a new inspection.

This gives each evidence pipeline a practical ledger:

| Field | Required record |
|---|---|
| Stage and source | Stable source/item ID, source role, immutable content identity |
| Map | Domain, codomain, version, conditions, and composition order |
| Induced equivalence | Which inputs become indistinguishable after this map |
| Retained distinctions | Which distinctions remain available downstream |
| Lost distinctions | Which distinctions cannot be recovered from this derivative |
| Recovery path | Original-source reopen, independent new measurement, or explicitly unrecoverable |
| Authority and status | Nathan Direct, historical source, assistant reconstruction, standard reference, proposal, formal proof, or independent measurement |

The ledger is not a new physical object. It is a way to prevent provenance loss and unearned inference.

## 2. Two applications of the same map discipline

**Source and continuity pipeline**

`candidate universe U -> selection S -> encoding E -> handoff H`

If `S` is non-injective, `E o S` remains non-injective. If a later task requires a distinction omitted by `S`, the correct action is `SOURCE_REOPEN_REQUIRED`. If the original cannot be accessed, record `UNRECOVERABLE_FROM_DERIVATIVE`; do not infer that the missing item was absent from the original source.

This conditional result is formalized in Orson PR #1115, theorem `noninjective_selection_remains_noninjective_after_encoding`. The current PR head `4b092a3b38c8a4e9fe7127cc2ae85574ccdd6b05` was checked out exactly by Actions run #43119833616. Lean 4.34.0 / Lake 5.0.0 completed the 8,976-job build. The theorem's `#print axioms` output reports no axioms. PR #1115 remains open, draft, and unmerged. This proves the formalized map statement, not that a particular archive selection actually lost a required item.

**Physical prediction pipeline**

`physical state X -> representation/reduction Pi -> geometric transition C -> observable O -> instrument response I -> predictive law K`

Every arrow needs an explicit domain, codomain, conditions, provenance, and composition rule. A named geometric object or analogy is not a substitute for the map.

For a deterministic target `Q`, the fibre-constancy condition above is the exact criterion for whether `Q` is determined by the proposed readout `Pi`. The corresponding conditional readout/factorization results appear in Kestrel PR #873, including `downstream_readout_cannot_restore_coarse_collapsed_pair` and `hallway_factorization_iff_fiber_compatibility`.

The inspected Actions run #42153410233 built merge commit `a2c3304edafa5274530ce5286cbe15ac1ed47b0b` (PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c` merged into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`), not the current PR head. The build completed 8,955 jobs. The downstream-collapse theorem reports no axioms; the factorization theorem reports `Classical.choice`. The PR branch has since advanced four commits and is 106 commits ahead / 14,151 behind current `main`; this historical merge-ref build is not current-head or current-main validation.

For a law-valued target `K : X -> Dist(Y)`, the same fibre condition applies: states collapsed by `Pi` must induce the same predictive distribution if that law is to factor through `Pi`. This is a conditional map statement, not a complete claim of classical statistical sufficiency unless the sampling model and likelihood factorization are specified.

## 3. Recovery and failure states

Keep these outcomes separate:

- `SOURCE_REOPEN_REQUIRED`: a needed source distinction may have been lost during selection or summarization.
- `UNRECOVERABLE_FROM_DERIVATIVE`: the original is unavailable; the derivative cannot establish what the source contained.
- `READOUT_INSUFFICIENT`: the target is not constant on the readout's fibres.
- `INSTRUMENT_MASKED`: different underlying states induce the same measured law on the available channel.
- `MODEL_UNIDENTIFIED_ON_READOUT`: an extension's predictive law can be matched by the allowed baseline/nuisance family on the available observables.
- `HOLDOUT_REJECTED_FOR_THIS_EXTENSION`: a preregistered independent holdout rejects the specific extension prediction.
- `NOT_TEST_READY`: the physical system, dataset, maps, uncertainty, or independent holdout is missing.

These are not synonyms and must not be collapsed into a single pass/fail field.

The existing [Kestrel readout-sufficiency and cross-scale prediction protocol](https://github.com/Satobloc/HsH/issues/1614) already specifies shared-parameter calibration, nuisance handling, independent holdout, and prediction-versus-fit separation. This note adds the upstream source-selection/reopening gate and a stage-by-stage ledger; it does not repeat or replace that protocol.

## 4. H(s)H application without adding machinery

Current BEDROCK retains the finite-core worldtube as the working reconstruction target and intrinsic filament thickness as an inherited historical commitment. That is not demoted to optional.

The precise core profile, the map from intrinsic thickness to slice morphology, timesheet support/intersection, medium response, and instrument readout remain separate construction questions. The general factorization theorem does not establish a new independent twist field, contact surface, or constitutive law. Add such structure only if it is source-defined, required to make a specified map well-defined, or independently required by measured evidence.

The relevant ledger is therefore:

`finite-core worldtube -> timesheet support/intersection -> instrument projection -> measured observable -> predictive law`

The map entries and their conditions are not yet instantiated for a real measured system. No physical system or versioned dataset was selected in this run. No measured values, units, uncertainties, covariance, calibration/holdout split, fitted parameter, numerical threshold, or independent measurement is claimed. The physical test remains `NOT_TEST_READY`.

The next legitimate step is to select an identifiable measured system and primary dataset, instantiate each map with source and measurement provenance, and then apply the existing #1614 calibration/holdout protocol. Until those inputs exist, no physical calculation should be run.

## 5. Verification scope

- Orson PR #1115: exact-head Lean build, 8,976 jobs; the non-injective-selection theorem reports no axioms; PR remains draft/unmerged.
- Kestrel PR #873: successful merge-reference build, 8,955 jobs; the checked-out merge commit is not the current PR head; PR remains draft/unmerged and stale relative to current `main`.
- These builds check only their formalized statements. They do not validate source-to-model translation, physical premises, instrument calibration, or observations.
- A green merge-ref build is not an exact-head build. Every formal result should preserve `head_sha`, `base_sha`, `merge_commit_sha`, actual checked-out SHA, Lean/Lake versions, theorem axiom output, and skipped checks.

## References

- [Orson PR #1115](https://github.com/Satobloc/HsH/pull/1115) and [exact-head Actions run #43119833616](https://github.com/Satobloc/HsH/actions/runs/43119833616).
- [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873) and [merge-reference Actions run #42153410233](https://github.com/Satobloc/HsH/actions/runs/42153410233).
- [Kestrel issue #1614: Readout sufficiency and the cross-scale prediction chain](https://github.com/Satobloc/HsH/issues/1614).
- [Current HsH BEDROCK](https://github.com/Satobloc/HsH/blob/main/BEDROCK.md).

**Disposition:** A reusable distinction ledger and source-reopen gate are now specified. They connect existing formal results without duplicating their theorems or claiming a physical test. No BEDROCK promotion is proposed.


---

## 2026-11-19 additive amendment | Claim-currentness and supersession gate

This is a Sable-local workflow amendment. It does not promote a theory claim, change BEDROCK, or alter the Three Paper Campaign.

The existing source-to-prediction chain now carries four independent status axes:

| Axis | Required field | Question |
|---|---|---|
| Source authority | source_authority | Who or what asserted the claim, and with what provenance? |
| Claim currentness | claim_currentness | Is it reaffirmed by a current source, explicitly historical, directly superseded, or unresolved? |
| Formalization | formalization_status | Is it verbal, equation-backed, source-verified, formalized, compiled, and independently reviewed? |
| Empirical status | empirical_status | Is there an identified system, dataset, calibrated fit, independent holdout, and replication? |

Allowed claim_currentness values:

- CURRENT_REAFFIRMED: an applicable later direct source or controlling current statement explicitly retains the claim.
- HISTORICAL_ONLY: the claim is explicitly scoped to an earlier theory version and is not asserted as current.
- SUPERSEDED_BY_DIRECT_SOURCE: a later source-authorized statement explicitly withdraws or replaces it.
- CURRENTNESS_UNRESOLVED: a historical source exists, but later status is ambiguous or supported only by derivative/assistant material.

Admission rule: only CURRENT_REAFFIRMED claims may enter the current H1 test-selection queue. HISTORICAL_ONLY claims may be studied as versioned history but not silently promoted. CURRENTNESS_UNRESOLVED is NOT_TEST_READY. This field tracks theory-version status, not truth.

### Applied row: Prime General Prediction Pathway

| Field | Status |
|---|---|
| source_authority | NATHAN_DIRECT, 2025-10-30, raw message f476afce-eba0-4312-8c2b-36b82dbe7f3f |
| claim_currentness | CURRENTNESS_UNRESOLVED |
| formalization_status | VERBAL_ONLY; no source-verified current past/future coupling law recovered |
| empirical_status | NOT_TEST_READY |
| H1 admission | BLOCKED |

The direct message proposes reciprocal past/future tensions and observable anomalies beyond the Standard Model, GR, and QM, but does not specify the coupling equation, observable, sign, magnitude, timescale, units, boundary conditions, or measurement operator.

The 2025-09-19 “Annotating intuitions with math” export marks the 7th intuition with a tentative assistant-authored strikethrough and says the core Lagrangian does not propagate backward causality. Nathan's follow-up requests conversational-mathematics rewriting; it does not explicitly endorse that classification. The later SAT_HISTORY_ROUNDUP synthesis says the prediction was rejected during formalization, but its authoring and underlying primary source chain are not established. Current BEDROCK and the 2026-11-08 methodology/model overview contain no explicit reaffirmation. Absence does not prove withdrawal.

Next source-recovery action: identify the exact primary Lagrangian/formalization items cited as [7]-[11] by the later synthesis, preserve original bytes, role/author, date, and hashes, and determine whether they remove, bound, or fail to instantiate pastward influence. Do not infer from the assistant annotation alone.

No physical system or dataset is selected. No fit, prediction, numerical threshold, independent measurement, or new Lean theorem is claimed.


---

## 2026-11-20 additive example | GW241011 symmetric multipole projection

This is a source-currentness example for the existing P3 inspiral comparator, not a P2 selection, new physical calculation, or H(s)H prediction. Full source record: [Sable h961:s2 report](2026-11-20T0124Z_H961_S2_GW241011_SOURCE_CURRENTNESS_AND_SYMMETRIC_PROJECTION_GATE.md).

| Axis | Status |
|---|---|
| Source authority | 2025 peer-reviewed LVK event paper and 2026 arXiv reanalysis of the same event |
| Claim currentness | External source currentness updated; no current H(s)H claim is thereby reaffirmed |
| Formalization | Generic fiber/readout theorem exists in Kestrel PR #873 and passed exact-head CI; the GW241011-specific projection is not instantiated in Lean |
| Empirical status | Observed event; H1/V1 strain and catalog PE products are publicly listed but not acquired here; no independent measurement beyond the event |
| H(s)H admission | NOT_TEST_READY; geometry-to-multipole map absent |

The 2026 source maps four component-specific deviations to two symmetric combinations:
`(δκ₁,δκ₂,δλ₁,δλ₂) ↦ ((δκ₁+δκ₂)/2,(δλ₁+δλ₂)/2)`.
Its fibers contain antisymmetric directions `(t,-t,s,-s)`. A readout that factors only through the symmetric projection cannot recover those component differences. The paper sets the antisymmetric combinations to zero because of reported degeneracy; this is a model restriction, not a direct measurement of equality.

Keep the two source equation conventions separate: the 2025 LVK paper writes `Q = -κ S²/(m c²)` in SI; the 2026 preprint writes `Q = -κ χ²m³` and `O = -λ χ³m⁴` in geometric units. No conversion is made in this ledger.

CODATA 2022 Version 9.0 remains the reference if a later SI/geometric conversion requires `G`; no CODATA constant was used in this source-only update. The Lane 24 cycle remains BACKSEAT/HOLD while P0 is active. No new Lean run, fit, prediction, holdout, paper-gate advancement, or theory promotion.


## 2026-11-20 additive amendment | Commitment-bound candidate-family composition

**Run:** `REVROT3-19-20261011:976:s3`  
**Status:** proposed workflow integration; not a P2 selection, production schema, physical result, or BEDROCK amendment.

The existing seven-layer source-to-observable chain already carries Claim, Source, Acquisition, Representation, Model, Readout and Decision. Add **Commitment-Bound Candidate Manifest (CBCM) v0.1** as a required binding inside the existing **Model** layer. It is not a new top-level evidence chain and does not duplicate the acquisition, map-class, uncertainty, identifiability, independence or holdout contracts.

The Model record must bind:
- immutable `source_commitment_map_hash`;
- immutable `geometry_map_stack_hash`;
- candidate-family ID/version/hash and freeze time;
- source commitment class/currentness separately from implementation status;
- candidate variant class and any approximation/optional-extension witness;
- shared/nuisance/candidate-specific parameter roles;
- comparator, observable/readout, uncertainty and holdout-exposure ledger IDs.

Admission classes are `SOURCE_COMPLIANT_BASELINE`, `CONTROLLED_APPROXIMATION`, `OPTIONAL_EXTENSION`, `STANDARD_COMPARATOR`, and `UNRESOLVED_NOT_ADMISSIBLE`. A source-committed feature cannot be switched off as an optional fit variant. A reduction of it requires an explicit projection/retraction and exact readout factorization or a calibrated, unit-consistent error bound fixed before holdout access. Optional extensions require a distinct source/data rationale, map and predeclared observable; fit improvement alone is insufficient. The family hash binds the source map, geometry map stack, complete candidate list, parameter roles/ranges, comparator, observable, decision rule and holdout policy.

**Source correction:** Kestrel h975's source audit supersedes Elias h974's M2 row. Intrinsic filament thickness is qualitatively recorded as a Nathan Direct premise in BEDROCK `ND-2026-10-18-07`; it is part of the source-compliant baseline, not an optional on/off candidate. Its magnitude, units, profile, support map and observable remain unresolved. Centerline/2D-worldsheet forms are controlled approximations requiring projection and readout-compatibility evidence. Separate twist/holonomy and active contact law remain optional/tentative. The first-order coil scale is not epsilon. The responsive-medium/Kelvin-vortex branch remains an inherited test constraint with independent necessity unresolved.

**Formalization reuse:** Ravel PR #1133 current head `fc7f92722fe5e0757d55f961b54a12bdee66d5da` passed exact-head Actions run #44709605971, including the fiber-constant readout-descent criterion and directed slice-chain composition with an explicit intermediate lift. Kestrel PR #873 current head matches run #44090154878. Nadir PR #1189 has advanced beyond its successful run #42114292197; the resolution section is unchanged but the expanded current head is not build-verified. These are conditional proofs, not physical maps.

**Gate dependencies:** source authority/currentness -> SourceCommitmentMap; geometry fidelity/typed map stack -> map freeze; both -> CBCM/family freeze; map + observable -> structural identifiability; identifiability + instrument metrics/covariance -> resolution stability; acquisition-unit/dependence manifest -> holdout eligibility; frozen family + resolution + acquisition independence -> holdout lock; holdout lock -> prediction lock; prediction + real acquisition -> independent validation. Factory Floor geometric review remains an orthogonal gate.

**Current P2 state:** `SOURCE_COMMITMENT_PARTIAL_QUALITATIVE / MAP_STACK_NOT_INSTANTIATED / CBCM_NOT_FROZEN / IDENTIFIABILITY_GENERIC_ONLY / RESOLUTION_GENERIC_ONLY / ACQUISITION_INDEPENDENCE_NOT_SELECTED / HOLDOUT_NOT_ACCESSED / EMPIRICAL_NOT_TEST_READY`. P2 issue #565 remains OPEN / HOLD. No measured system, raw data, physical calculation, fit, prediction, numerical threshold or independent measurement was produced.

Full contract and evidence limits: [Sable h976:s3 report](2026-11-20T1636Z_H976_S3_COMMITMENT_BOUND_CANDIDATE_FAMILY_GATE.md).
