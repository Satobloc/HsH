# P2 evidence-independence composition gate

**Run key:** `REVROT3-19-20261011:583:s3`  
**Status:** architecture integration using existing contracts; no new schema, no physical prediction, no P2 system selection, no theory promotion.

## 1. Decision

The P2 measured-system branch must not treat "independent evidence" as one Boolean or infer it from publication count, file count, processing variants, detector channels, or distinct analysis names.

This report composes existing HsH work rather than creating a parallel catalog or tool:

- Ariadne's [Evidence Lineage x Readout Identifiability contract](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-10-30T1913Z_EVIDENCE_LINEAGE_IDENTIFIABILITY_CONTRACT.md) already proposes a typed provenance DAG and a layer-resolved `independence_vector`.
- [Issue #1192](https://github.com/Satobloc/HsH/issues/1192) distinguishes source relations such as `cites`, `discusses`, `challenges`, `reports`, `interprets`, `translates`, and `directlyCollates`. A citation edge is not automatically a `dependsOn` edge.
- [Issue #1156](https://github.com/Satobloc/HsH/issues/1156) and [PR #790](https://github.com/Satobloc/HsH/pull/790) supply a claim-scoped four-state content-lineage model.
- [Issue #1302](https://github.com/Satobloc/HsH/issues/1302) applies acquisition and processing lineage to M87* data products.
- Hale's [GW250114 evidence-dependency crosswalk](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-11-03T1936Z_GW250114_EVIDENCE_DEPENDENCY_CROSSWALK.md) applies the same distinction to one event, multiple detector channels, and overlapping numerical-relativity simulation families.

The new contribution is the **composition rule** that makes these existing layers mandatory in the P2 branch and prevents a source-level result from being promoted into an acquisition-level claim.

## 2. Composed evidence profile

Use the fields already proposed in the Ariadne contract. Interpret them as separate, claim-scoped dimensions:

| Dimension | Required evidence | Allowed states or record |
|---|---|---|
| Source / claim lineage | Exact source artifact, claim span, typed relation and provenance parents | `dependent`, `independent`, `unresolved`, `conflicting` |
| Physical acquisition / event | Stable raw acquisition IDs, event/system identity and dates | `same`, `separate`, `unknown` |
| Instrument / calibration | Instrument IDs, calibration versions, response products and covariance | `shared`, `separate`, `unknown` |
| Analysis / reduction / prior | Pipeline version, software, priors, analyst lineage and derived products | `shared`, `separate`, `unknown` |
| Fit / holdout exposure | Parameter-freeze timestamp, dataset IDs and access audit | `fit-exposed`, `blind-holdout`, `retrospective`, `unknown` |
| Statistical dependence | Explicit model, calibration data and covariance | Estimate with assumptions, or `NOT_ESTIMATED` |

Two separate outputs must remain explicit:

1. `cross_channel_consistency_status`: whether multiple readouts from the same event/system agree under a frozen shared model with their dependence handled.
2. `independent_replication_status`: whether a new acquisition/event/system passes a prediction fixed before access to its data.

These are not interchangeable. A same-event multi-channel test can be informative without being an independent event-level replication. A different analysis of the same raw acquisition can test reduction robustness without being a new measurement. A different publication can be derivative. A holdout is not blind if the model or analyst has already seen it.

**Fail-closed rule:** if lineage for a dimension is incomplete, record `unknown` or `unresolved`. Never promote missing provenance to independence. Do not collapse the vector into a scalar score unless a separately specified statistical model, calibration procedure and uncertainty budget justify that reduction.

## 3. Why the source-critical case matters

The existing Temple Hymns source crosswalk records two distinct modern publications, but not two verified independent tablet-collation events for the disputed aggregate.

Sövegjártó 2022 cites Black 2002 for the 3/1 placement aggregate. Helle 2020 presents a different manuscript-level account and challenges the inference. The existing claim-relation audit correctly keeps `cites` separate from `dependsOn` and `directlyCollates`.

Therefore:

- publication relation: distinct publications;
- cited support for the 3/1 aggregate: Black 2002 is explicitly named;
- independent direct-collation events: not established by the currently recorded evidence;
- claim-level independence: `unresolved`, not `independent`;
- causal copying/dependence: not inferred from citation alone.

This is precisely why the evidence relation must be claim-scoped and typed. It avoids both false corroboration and an unsupported copying allegation.

## 4. Physical-system application already available: M87*

Issue #1302 records a useful real-system lineage example:

- The 2017 Stokes-I and polarimetric products refer to the same observing campaign; exact raw-sample overlap remains unresolved.
- The 2023 polarimetric inventory has 24 files across 8 day-band cells, or 3 processing variants per cell. These are not 24 independent acquisitions.
- HOPS and CASA are distinct calibration/reduction pipelines applied to the same 2017 campaign. This is reduction robustness, not acquisition-level replication.
- 2017, 2018 and 2021 are separate epochs of the same M87* system and EHT collaboration.
- The 2021 epoch is retrospective, not a blind holdout, because the 2025 paper already analyzes it and no pre-access parameter-freeze/access audit is recorded.

M87* remains a candidate, not the selected P2 system. The published-product lineage is not a raw-data reanalysis, an H(s)H fit, or an independent prediction.

The separate GW250114 crosswalk shows the same pattern at another scale: two detector channels are readouts of one astrophysical event, and overlapping simulation IDs are not independent event acquisitions.

## 5. Lean status: source-lineage module compiled, full PR build failed elsewhere

The initial Prop/Type failure in PR #790 was repaired by making the disjoint-origin witness data-carrying. The latest inspected PR head is `ff20ef5bd26ec8f9bbe05eb6eae638bc2cf97f43`.

Exact-head Actions run [#41788695726](https://github.com/Satobloc/HsH/actions/runs/41788695726), job `126436715218`:

- Exact checkout assertion passed: PR head and checked-out commit both equal `ff20ef5bd26ec8f9bbe05eb6eae638bc2cf97f43`.
- Lean 4.34.0 / Lake 5.0.0.
- `HsHVerification.AriadneClaimScopedLineage` was replayed successfully.
- `contains_trans` and `shared_content_does_not_determine_origin_relation` report no axioms.
- Other displayed claim-lineage theorems use standard `propext`, `Classical.choice`, and/or `Quot.sound`.
- The full root build nevertheless **FAILED** in `AriadneArchiveWitness.lean` at lines 280-296: the generic `SingleAnchorDependency` declarations lack a `DecidableEq Node` instance, causing downstream errors. The full PR is not build-green.
- Tests, lint, nanoda and the separate global axiom-audit stage were skipped. This is not a repository-wide no-sorry or axiom-free certification.

The source-lineage module proves properties of its formalized claim-scope and supplied origin-set records. Lean does not authenticate the external source extraction, authorship, chronology, direct collation, acquisition independence, or physical truth. Its formal proof is not a substitute for the source-to-record mapping.

No new Lean source or theorem was added in this run. No local Lean/Lake/Elan runtime is installed; the exact-head GitHub Actions run is the available actual compile evidence.

## 6. P2 branch integration

The existing P2 node `P2-REAL-SYSTEM-GEOMETRY-2026-11-30` now requires the Ariadne `independence_vector` before any candidate can be described as independently replicated.

The gate does not select M87* or another system. It requires the eventual selected system's packet to populate the existing contract fields:

- `raw_acquisition_ids`, `raw_artifact_blob_ids`, and `provenance_parent_ids`;
- `event_or_system_cluster`;
- `instrument_and_calibration_ids`;
- `analysis_pipeline_and_prior_ids`;
- `uncertainty_covariance_id`;
- `calibration_dataset_ids` and `holdout_dataset_ids`;
- parameter-freeze timestamp and `holdout_access_audit`;
- `independence_vector`;
- separate `cross_channel_consistency_status` and `independent_replication_status`;
- `standard_comparator` and `pre_registered_score_and_falsification_threshold`.

No new schema is introduced. The existing contract fields are now an explicit P2 gate rather than optional descriptive metadata.

The current P2 blockers remain: no final system selected, no selected-system raw data/covariance retrieved, no instantiated H(s)H geometry-to-observation map, no exact-system geometry plot with hostile review, and no frozen calibration/holdout or falsification threshold. The independence profile is an additional acceptance requirement, not a reason to fabricate a candidate or calculate without data.

## 7. Next exact cursor

1. Select one actual measured system only after its versioned raw data, provenance, units, uncertainties/covariance and access are verified.
2. Populate the existing layer-resolved `independence_vector`; classify every comparison at its actual layer.
3. Instantiate source-grounded H(s)H and standard forward maps, with explicit domains, codomains, units and composition conditions.
4. Produce the exact actual-system geometry plot, obtain independent hostile fidelity review of that version, and display it with the file.
5. Freeze shared parameters, calibration and a genuinely unseen holdout before fitting; preserve the access audit.
6. Compare the same frozen model against the standard comparator and derive a falsification threshold from the real measurement uncertainties.

Until those gates pass, no physical prediction, fit, independent replication, Factory Floor admission or theory promotion is claimed.

## 8. Governance

P1 November 9, P2 November 30 and P3 December 14 remain separate. Code Grurple remains the active publication interlock; no ordinary research PR or branch was modified. BEDROCK, SAT-O and Blockwave originals were not changed. No new Mersearch request, tool, dependency, branch or automation was created.
