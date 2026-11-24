# Elias h974:s3 | Adaptive candidate-family freeze and holdout-exposure gate

**Date:** 2026-11-20  
**Run key:** `REVROT3-19-20261011:974:s3`  
**Classification:** assistant reconstruction; one-run Lane 36 architecture/workflow overlay. This is a proposed methods contract, not Nathan Direct, not a physical result, and not a production change.

## 1. Rotation and historical authority

The nominal UTC slot is 2026-11-20T14:36:00Z.

- `h = 974`
- `seq = 5(974) + 3 = 4873`
- `4873 mod 19 = 9`
- Selected ring label: **Elias Kern**, index 9.
- Next ring label: **Nadir Voss**, index 10.

The recoverable Nathan-direct Track A instruction is preserved in [`WORKSPACES/ELIAS_KERN/INBOX.md`](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/INBOX.md), dated 2026-09-24 13:47 ET. It asks Elias to work with Nathan and Orson on Track A of the Top/Central/Branch/Hydra prototype, independently but in communication with Sable and Tern, to exercise one bounded real-work mechanism per leased pass, record observed rather than intended behavior, and never treat the POC as production authority.

No originating raw conversation/message UUID, standalone signed specialist charter, or authenticated current Elias conversation was recovered. This is source-grounded assistant reconstruction, not historical Elias-instance participation. The Track A remit is preserved; this run does not alter the prototype, PR #951, Track B, or production authority.

## 2. New architecture improvement

I added a **candidate-family freeze and holdout-exposure gate** to the P2 comparison workflow.

The existing P2 materials already distinguish:

- source-admissible geometry and explicit composable maps;
- versioned measured systems, units, uncertainty and acquisition-unit identity;
- shared parameters, nuisance adjustment and matched standard comparators;
- calibration versus untouched holdout;
- prediction frozen before holdout access;
- predeclared falsification rules and uncertainty-justified thresholds.

The missing operational record is different: **which complete family of model variants was eligible for comparison, how many times the holdout was queried, what feedback was disclosed, and whether that feedback influenced later candidate construction.**

A conventional `holdoutUntouched` field is insufficient if a researcher repeatedly inspects holdout scores, changes thickness/twist/contact assumptions, and then tests the revised model on the same data. The final candidate may be selected by the very holdout later described as independent.

This is particularly relevant to geometric model development, where a succession of optional structures can be added after residuals are inspected. The risk is not merely the number of free parameters in the final model. It is the **history of candidate generation and information released from the evaluation data**.

## 3. Existing HsH architecture and exact gap

The current P2 docket is [issue #565](https://github.com/Satobloc/HsH/issues/565), OPEN / HOLD, with no final measured system selected and no raw dataset manifest accepted.

Hale's existing [prediction/holdout gate report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-11-10T0336Z_PREDICTION_HOLDOUT_GATE_STRENGTHENING.md) supplies the working M0–M4 matrix:

| Working label | Candidate meaning | Present status |
|---|---|---|
| M0 | Standard baseline | Comparator definition still system-dependent |
| M1 | Minimal source-defined H(s)H interaction | Requires source-authenticated forward map |
| M2 | Finite-core thickness | Optional; requires source-defined object, units and map |
| M3 | Twist/contact structure | Optional; requires source-defined structures and projection/composition maps |
| M4 | Cross-mode transfer | Optional calibrated bridge, not a native prediction |

These are **working labels, not a frozen candidate family**. No M2/M3 geometry is promoted merely because it could improve a fit.

The existing [Ariadne projection-aware evidence chain](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-11-10T2136Z_PROJECTION_AWARE_EVIDENCE_CHAIN_AND_HOLDOUT_GATE.md), [Kestrel snapshot-bound map-edge witness](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-16T1636Z_H880_S3_SOURCE_SNAPSHOT_BOUND_GEOMETRY_MAP_WITNESS.md), and [Aldus typed uncertainty ledger](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-08T0536Z_TYPED_UNCERTAINTY_LEDGER_AND_NUISANCE_GATE.md) already address map provenance, composition, uncertainty classes, nuisance parameters and identifiability. This proposal does not duplicate those structures.

The additional gap is **adaptive model-family selection and holdout feedback history**. A bounded HsH code/issue search found no P2-specific candidate-family exposure ledger; the issue search for `adaptive holdout` returned zero results. This is a bounded search, not an exhaustive repository census.

## 4. External methodological basis

Two primary sources establish why ordinary holdout language needs this additional control:

1. Nakkiran and Błasiok, [“The Generic Holdout: Preventing False-Discoveries in Adaptive Data Science”](https://arxiv.org/abs/1809.05596), 2018. The paper explains that a fixed-family correction such as Bonferroni can fail when hypotheses are adaptively chosen using previous test feedback. Its proposed Generic Holdout releases only a binary pass/fail response, not a fit score or p-value, and is framed for finding one or a few true hypotheses. It is not permission to expose full residuals repeatedly and continue tuning on the same holdout.

2. Dwork et al., [“The Reusable Holdout: Preserving Validity in Adaptive Data Analysis”](https://doi.org/10.1126/science.aaa9375), *Science* 349 (2015), 636–638. Reuse is possible under a specific privacy-based feedback mechanism and its guarantees. It is not equivalent to repeatedly opening an ordinary holdout and returning unrestricted scores.

The practical distinction is:

- A **fixed, predeclared finite family** can be evaluated using a predeclared simultaneous or multiplicity-adjusted procedure appropriate to its dependence structure.
- An **adaptively changing family**, where earlier holdout feedback influences later candidates, is not repaired merely by applying a correction to the final list of candidates.
- A reusable/adaptive holdout is a specialized method whose query channel, feedback budget and guarantees must be specified before use.

## 5. Proposed contract

### A. CandidateFamilyManifest

Before any confirmatory holdout access, create one immutable manifest containing:

- `family_id`, `family_version`, `family_sha256`, freeze timestamp and author;
- exact source snapshot and source-defined geometry version;
- complete candidate IDs, including every optional extension eligible for comparison;
- per-candidate source/map references and map versions/hashes;
- free parameters, parameter bounds, constraints, priors/regularization and model-discrepancy freedom;
- the shared-parameter and nuisance-parameter map across candidates;
- standard comparator version and any comparator alternatives;
- predicted observable definitions, units, instrument/readout operator and acquisition-unit map;
- calibration/development partition and confirmatory holdout partition;
- candidate-selection rule and the rule for comparing candidates;
- multiplicity/adaptive-inference method, planned query count and stopping rule;
- prediction and falsification rule frozen before holdout access.

The manifest hash is the identity of the tested family. Changing a candidate, map, free parameter, prior, comparator, observable, or selection rule creates a new family version.

### B. HoldoutExposureLedger

For every access to confirmatory data, append:

- dataset and split IDs;
- authenticated acquisition-unit map/version;
- candidate-family hash and candidate IDs tested;
- query ID, timestamp, caller/analysis version and tool/script version;
- feedback channel: `NONE`, `BINARY_PASS_FAIL`, `NOISY_AGGREGATE`, or `FULL_METRIC_OR_RESIDUAL`;
- query/look count and any predeclared budget;
- whether feedback was disclosed to anyone able to change the model;
- any subsequent candidate, map, parameter, threshold or selection-rule change;
- resulting validity state and whether a new independent holdout is required.

This is an append-only exposure history, not a mutable `holdoutUntouched=true` flag.

### C. Validity states

| State | Meaning |
|---|---|
| `SEALED` | No confirmatory result has been released |
| `FAMILY_FROZEN` | Complete candidate family and decision rule are hashed and frozen |
| `CONFIRMATORY_EVALUATION` | The predeclared family is evaluated under its predeclared procedure |
| `CONSUMED` | The family-level result has been released; this holdout is no longer fresh for later model development |
| `EXPOSED_FOR_SELECTION` | Holdout feedback influenced subsequent candidate construction or selection |
| `ADAPTIVE_GUARDED` | A named, valid adaptive mechanism is in force with declared feedback channel and query budget |
| `INVALIDATED_FOR_NEW_FAMILY` | The family changed after ordinary holdout feedback; a new independent holdout is required for confirmation |

### D. Admission rules

1. Do not open a confirmatory holdout until the complete candidate family, shared parameters, comparators, observable definitions, selection rule and falsification procedure are frozen.
2. If the family is fixed in advance, evaluate it with a predeclared simultaneous/multiplicity-adjusted procedure suited to the actual dependence and covariance structure. Do not choose the adjustment after inspecting results.
3. A predeclared complete family may be evaluated in one batch and its full family-level results released after evaluation, provided the simultaneous/multiplicity procedure and decision rule were frozen beforehand. That holdout is then consumed for later model development.
4. If holdout feedback is disclosed before the full family is evaluated and it influences later candidate generation, the process is adaptive. A correction applied only to the final candidate list is not automatically sufficient.
5. If unrestricted scores/residuals are disclosed and a model is then changed, the same holdout is development data for that changed family. Obtain a new independent holdout or use a specifically justified adaptive-inference mechanism.
6. A Generic-Holdout-style process must limit feedback to its specified binary decision channel; releasing full residuals or fit scores changes the method and invalidates that justification.
7. A Reusable-Holdout-style process must specify its actual privacy/noise mechanism, query budget and applicable guarantee. Merely naming the paper does not qualify.
8. Repeated looks require a predeclared sequential/adaptive procedure and stopping rule. Otherwise, treat the holdout as consumed after the confirmatory evaluation.
9. Standard and H(s)H candidates must use the same acquisition units, measurement operator, calibration policy, nuisance flexibility, uncertainty treatment and decision metric. A weak or differently tuned comparator cannot be used to manufacture a relative win.
10. If a new optional geometric structure is introduced after ordinary holdout feedback, its new family hash cannot inherit the old holdout's confirmatory status.

## 6. Geometry and P2 consequences

The existing M0–M4 labels remain exploratory until a real system and source-defined maps are selected.

Under the currently recovered P2 source set:

- finite-core thickness is not established as a forced addition; it needs a source-defined object, dimension, profile/map and independent observable;
- twist is not established as forced; it needs a source-defined frame/connection or equivalent map and an observable that distinguishes it from coordinate/frame choice;
- contact surfaces are not established as forced; the interacting objects, interface geometry and constitutive/readout law must be defined;
- a feature that is merely allowed by a drawing or can absorb residuals is not thereby geometrically required.

This is a source-state classification, not proof that no fuller historical derivation exists. The original source search remains subject to Mersearch-first recovery. All four Mersearch request lanes were occupied/requested in this run; no request was overwritten or retriggered. HSH_RESOURCES was consulted only at its root README/metadata boundary; no payload was opened.

The Barckicke air–water vortex remains a candidate only. Issue #565 records that its published dispersion parameters were fit before the PIV/PTV comparison, so that comparison is not a blind holdout prediction. Raw data bytes/version metadata were not retrieved in this run. No physical system was selected and no calculation was performed.

## 7. Lean/formalization triage

Existing [PR #1487](https://github.com/Satobloc/HsH/pull/1487) already formalizes the static non-compensatory hard gate, including source/map/data/comparator/identifiability, frozen shared parameters, acquisition-unit mapping, untouched/unrefitted holdout and prediction/falsification precommitment.

Its module blob `522e7ad0d86c6f29227b4fafc2badfbe41e80add` matches both the PR head and the inspected merge-reference checkout. Actions run [#42751414165](https://github.com/Satobloc/HsH/actions/runs/42751414165) completed successfully with 8,947 Lake jobs, but the workflow checked out merge ref `b39252b542ca0519b92bd2ed82a56c38ce348a7b`, not a standalone PR-head build. PR #1487 remains OPEN / DRAFT / UNMERGED.

The new adaptive-exposure layer is a workflow contract, not yet a source-defined statistical model. No specific query mechanism, dependence structure, sample design or data set has been selected. A Lean state-machine formalization would require choosing the query/feedback semantics and its guarantees; I did not invent those assumptions or create synthetic fixtures. Therefore **no new Lean module, proof, compile or physical theorem is claimed**. Formalization is deferred until the protocol and actual system are specified; this is not a Lean failure.

## 8. Current disposition and next gate

- P2 remains HOLD; no system selected.
- No raw data, fit, physical prediction, independent measurement or numerical falsification threshold was produced.
- No SAT-O/Blockwave equation was copied or corrected.
- No POC code, PR #951, Track B, production workflow, task graph, BEDROCK or paper gate was changed.
- This proposal does not assign work to Calder, Mercer, Meridian, Ravel, Morrow, Kestrel, Tern or any other P2 owner.

**Smallest next step when an authorized P2 owner selects a measured system:** freeze the complete candidate-family manifest and holdout exposure policy before any confirmatory result is disclosed. If the system/data cannot support an independent acquisition-level holdout, record that limitation rather than relabeling fitted data as prediction.

## Sources

- HsH P2 control: https://github.com/Satobloc/HsH/issues/565
- Hale prediction/holdout contract: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-11-10T0336Z_PREDICTION_HOLDOUT_GATE_STRENGTHENING.md
- Ariadne projection-aware evidence chain: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-11-10T2136Z_PROJECTION_AWARE_EVIDENCE_CHAIN_AND_HOLDOUT_GATE.md
- Kestrel snapshot-bound map-edge witness: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-16T1636Z_H880_S3_SOURCE_SNAPSHOT_BOUND_GEOMETRY_MAP_WITNESS.md
- Aldus typed uncertainty ledger: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-08T0536Z_TYPED_UNCERTAINTY_LEDGER_AND_NUISANCE_GATE.md
- Nakkiran & Błasiok (2018): https://arxiv.org/abs/1809.05596
- Dwork et al. (2015): https://doi.org/10.1126/science.aaa9375
