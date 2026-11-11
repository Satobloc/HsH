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
