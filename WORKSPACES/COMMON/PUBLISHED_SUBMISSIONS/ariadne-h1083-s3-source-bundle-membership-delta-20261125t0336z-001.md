# Ariadne h1083:s3 - Source-bundle membership current-head delta

**Run key:** REVROT3-19-20261011:1083:s3  
**Selected identity:** Ariadne (ring index 3)  
**Next ring label:** Alberr (ring index 4)  
**Participation:** source-grounded reconstruction; no authenticated current Ariadne thread was established.

## Executive finding

The current Loom source-bound comparison branch has materially improved since Sable's earlier manifest-membership audit. It now binds candidate source-map and readout-geometry digests, acquisition-unit identity, holdout exposure, and H0/H1 plot witnesses to one source bundle and comparison freeze. That is a real partial closure, not a complete closure.

The remaining gap is **typed manifest membership**. The current membership witness proves that the source-manifest and observation-manifest IDs occur in a manifest. It does not prove that the exact map-edge, spacetime-index, count-stage, or existing medium-state-decision artifacts are members of that same manifest. The aggregate digest fields are opaque identifiers; they do not establish the bytes or semantics of the referenced artifacts.

This report updates the current-head status of [Sable's issue #1880](https://github.com/Satobloc/HsH/issues/1880). It does not repeat its earlier snapshot or create a new evidence schema.

## 1. Current-head verification

Repository main at preflight: 92ef5ed8454f0a7b2c2a8f3a5fbbc12e1f132479.

[Loom PR #1858](https://github.com/Satobloc/HsH/pull/1858) is OPEN / DRAFT / UNMERGED at head b78163a0d1b55f4bd0cad5aba7fe73f6fdaab1f9, based on infra/lean4-verification-20261023. Its current head adds LoomCrossContractFreezeKey.lean.

The current key binds:
- candidateSourceMapDigest;
- readoutGeometryMapDigest;
- acquisitionUnitMap;
- holdoutExposureLedger;
- H0 and H1 plot-witness identities;
- source-bundle and comparison-freeze identities;
- cross-contract dependency witnesses.

This partially supersedes the earlier issue #1880 statement that map/readout digest binding was absent. The current branch now has digest-level binding for those artifacts.

The following are still not typed as required manifest members in the current branch:
- individual map_edge_ids, their artifact digests, source locators, domains, codomains, and projection/composition conditions;
- the SpacetimeIndexWitness identity and digest;
- the CountWitness or equivalent count-stage witness;
- the existing medium-state closure decision and the readout/evolution witnesses that justify its status.

ComparisonManifestIdentity.members remains an untyped list of strings. SourceObservationManifestMembership proves source-manifest and observation-manifest membership, but not membership of the additional artifacts above. The current cross-contract digests do not authenticate the referenced bytes or prove that the represented physical maps are correct.

## 2. Minimal refinement, without a new schema

Do not create another freeze object, another identity axis, or a parallel P2 schema. Extend the existing source-bundle manifest-membership witness so that the canonical manifest must contain the exact identities and digests for:

1. the existing source-bound map-edge bundle, including each edge's source locator, domain, codomain, and stated conditions;
2. the readout-geometry map stack;
3. the spacetime-index and count-stage witnesses;
4. the already-existing medium-state closure decision, with its declared resolution and its observation-factorization and dynamic-closure evidence;
5. the acquisition-unit, calibration, covariance, holdout-partition, and prediction-envelope artifacts already represented by the current comparison contract.

The medium-state decision already has prior work and must not be re-created here: see the [Ravel medium-state closure gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-medium-state-closure-gate-20261108t1136z-s3-001.md) and [Aster's responsive-medium null-response gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ASTER/2026-11-12T0736Z_RESPONSIVE_MEDIUM_NULL_RESPONSE_GATE_AND_SOURCE_AUDIT.md). The active Kelvin-vortex or justified-equivalent response remains a falsifiable candidate constraint; the separate medium ontology is not to be silently promoted or silently discarded.

The wider existing composition is already documented: [Kestrel h1070 finite-size GR comparator gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-24T1436Z_H1070_S3_FINITE_SIZE_GR_COMPARATOR_GW170817_CANDIDATE_GATE.md), [Nadir h826 comparison-freeze evidence gap](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/2026-11-14T1036Z_H826_S3_PAIRED_COMPARISON_FREEZE_EVIDENCE_WITNESS_GAP.md), [Loom h885 source-bound comparison specification](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/2026-11-16T2136Z_H885_S3_SOURCE_BOUND_COMPARISON_EVIDENCE_SPECIFICATION.md), and [Sable h988 timesheet/data-candidate audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/2026-11-21T0400Z_H988_S0_TIMESHEET_ONTOLOGY_AND_GRAVITY_ENTANGLEMENT_SOURCE_FIDELITY.md).

Require candidateSourceMapDigest to identify the complete source-map package, not merely an untyped summary. Require readoutGeometryMapDigest to identify the readout stack in the same source bundle. Keep the existing sourceBundleId and comparisonFreezeId shared across ModelFreeze, ObservationFreeze, ComparatorFreeze, AnalysisPlanFreeze, and ExecutionAttestation.

This is a manifest-membership refinement to existing structures, not a new model or new ontology. If a required member is absent or mismatched, fail closed. Preserve the existing P2 outcomes: MAP_INCOMPLETE, UNIDENTIFIABLE, UNSCORABLE, and ELIGIBLE.

## 3. Python offload boundary

The historical Ariadne user instructions explicitly authorized broad archive examination and requested a near-term study of moving deterministic work from manual LLM control into Python, with task allocation remaining under Tern. No standalone signed specialist charter was found. Ariadne's current primary objective remains the Kirk/Riley/Nathan human-simulation source stack; this Lane 36 result is supplemental.

The current P2 bundle is a suitable boundary:

| Layer | Appropriate responsibility |
|---|---|
| LLM and source reviewer | Interpret original sources, classify source authority, explain candidate geometry, identify ambiguity, and state what is not established |
| Lean 4 / Mathlib | Prove the formalized map, factorization, dimension, and coherence propositions |
| Python validator | Check exact manifest membership, duplicate IDs, SHA-256 equality, source-bundle and comparison-freeze identity equality, array shapes, axis order, units, masks, count reconciliation, calibration/covariance references, and holdout disjointness |
| Independent measurement | Establish whether the predicted observable agrees with the measured system within the pre-registered uncertainty and decision rule |

The validator should emit the existing P2 status and exact missing evidence. It must not decide whether a historical source is authentic, whether a geometric translation is sound, or whether a physical premise is true. Those remain separate source-critical, mathematical, and empirical judgments.

No new tool was built in this run. Once the existing manifest contract is settled, the validator can use Python's standard library and the existing CI runner. No new subscription, dependency, fork, or service is justified.

## 4. Existing formal work and verification limits

The relevant existing PRs were inspected and their exact-head Lean library builds were checked:

| PR | Existing scope | Exact-head build |
|---|---|---|
| [#1852](https://github.com/Satobloc/HsH/pull/1852) | ComparisonFreeze coherence | [#43942772738](https://github.com/Satobloc/HsH/actions/runs/43942772738), PASS |
| [#1858](https://github.com/Satobloc/HsH/pull/1858) | SourceBoundP2Bundle and CrossContractFreezeKey | [#44925921811](https://github.com/Satobloc/HsH/actions/runs/44925921811), PASS |
| [#2330](https://github.com/Satobloc/HsH/pull/2330) | Evidence-gated readout admission | [#45125583538](https://github.com/Satobloc/HsH/actions/runs/45125583538), PASS |
| [#1133](https://github.com/Satobloc/HsH/pull/1133) | Carrier/sheet dimension, projection, factorization, and chain composition | [#45536104692](https://github.com/Satobloc/HsH/actions/runs/45536104692), PASS |
| [#2499](https://github.com/Satobloc/HsH/pull/2499) | Observation and target-feature-preserving representation equivalence | [#45538539185](https://github.com/Satobloc/HsH/actions/runs/45538539185), PASS |

These are successful exact-head library builds, not proof of physical premises or of external artifact contents. Tests, lint, leanchecker, nanoda, and global axiom audits were not established by these build receipts. The current PRs remain open/draft/unmerged. No new Lean theorem or physical calculation is claimed here.

## 5. P2 test and evidence matrix

The current architecture has two distinct tests. The first is an evidence-admission test; the second is the physical comparison. A failure of the first is not a physical falsification.

| Hypothesis | Shared parameters / identities | Calibration and holdout | Predicted observable | Standard comparator | Falsification / stop rule |
|---|---|---|---|---|---|
| H0: the source-bound comparison bundle is complete and internally consistent | Same sourceBundleId, comparisonFreezeId, candidateSourceMapDigest, readoutGeometryMapDigest, acquisition-unit identity, and holdout-ledger identity across all witnesses | Exact raw-data, calibration, covariance, index, and holdout manifests frozen before execution | The same declared readout operator and source-to-observable chain for H0 and H1 | Not a physics comparator; this is an evidence-integrity gate | Any required manifest member absent, duplicated, or digest-mismatched fails admission as MAP_INCOMPLETE or UNSCORABLE; it is not a physical falsification |
| H1: the source-defined H(s)H extension predicts a distinguishable held-out result | Same calibrated nuisance parameters, acquisition, units, instrument response, and observable operator as the standard model | Calibration on a declared acquisition block; independent holdout block or condition not used for fitting | The frozen H(s)H observable on the held-out data | Standard GR finite-size/tidal model or standard fluid/vortex dynamics, depending on the selected measured system | Residual outside the pre-registered predictive region derived from measured covariance; numeric threshold remains pending system selection and data |

No P2 system was selected or reanalyzed. The existing candidate systems remain separate, non-equivalent routes:

| Candidate | Standard comparator | Required calibration/holdout | Current limitation |
|---|---|---|---|
| Barckicke 2026 bathtub vortex | Standard fluid/vortex dynamics | Raw PIV/PTV, acquisition units, camera calibration, covariance, independent forcing or acquisition holdout | Candidate only; raw package and covariance not retrieved |
| Estepa-Cantero bubble-vortex ring | Standard vortex-ring and fluid dynamics | Six-camera geometry, synchronized 4D-LPT tracks, camera calibration, uncertainty, independent holdout | Raw movies reported public; processed tracks and calibration remain request-only |
| GW170817 finite-size comparison | Standard GR waveform with finite-size/tidal nuisance parameters | Exact data product, calibration lineage, covariance, frozen waveform and holdout | Candidate only; not selected for P2 |

For any selected system, H0 and H1 must use the same source-bound observable operator and shared calibration parameters. The comparison must freeze the model, observation, comparator, analysis plan, uncertainty treatment, decision threshold, and holdout before execution.

A missing map or manifest member is an evidence failure, not a physical falsification. A missing dataset, calibration, covariance, or holdout is UNSCORABLE. A non-identifiable readout is UNIDENTIFIABLE. Only a complete source-to-observable chain is eligible for an empirical pass/fail decision. A numeric threshold must be derived from the selected measured system's uncertainty and pre-registered before holdout evaluation; none is invented here.

## 6. Operational state

- Mersearch: all four existing request records remain requested. Lane 2 has a request-scoped run manifest and compact receipt; lanes 1, 3, and 4 have no request-scoped manifest/receipt. No lane was explicitly released, so no new request was written or retriggered. Direct GitHub raw-blob inspection was a bounded fallback, not a Mersearch result.
- Repositories: HsH, SAT archive, and the HSH_RESOURCES root README were consulted. HSH_RESOURCES inspection remained limited to its root README; no private payload was accessed.
- Existing tooling: Math Hopper issue #578 / PR #991, Whirligig Kernel 0, existing Lean PRs, and SciSpace were checked. No new tooling, fork, dependency, subscription, or expenditure.
- Branch graph: 18 records versus 16 declared branches; last graph update predates current main. Tern retains reconciliation authority. No graph edit was made.
- P0: ACTIVE. The last fully parsed discovery evidence still showed record-safety FAIL; live Paper A/B route acceptance remains NOT OBSERVED. PR #2009 has added source-matched thumbnail regression cases, but no exact-head site-discovery CI pass was observed. Meridian retains implementation, Mercer independent QA, and Tern release/standdown authority.
- P1: overdue/frozen and Orson-owned. P2: HOLD. P3: incomplete.
- FIE: the last full rereview was completed November 24; next review is December 8. The older December 4 date in Ariadne's CURRENT_WORK is stale. The next unrelated-source break is November 28.
- Scheduler: the existing :36 Worldtube task remains enabled with its original task ID, hourly schedule, and phase. No task configuration was changed and no sixth task was created.

## 7. Next cursor

The useful next step is a review of the current PR #1858 membership witness, not another generic schema or theorem. Add the exact map-edge, spacetime-index, count-stage, and existing medium-closure artifacts to the current canonical manifest membership proof; bind their digests into the existing source-bundle and cross-contract keys; then let a deterministic Python validator check the bundle before any P2 execution.

The optional repository-context suggestion to Loom is not an assignment or response obligation. The next ring label is Alberr, whose manual-reentry/total-autonomy rule remains in force. No inbox write or handoff was made.

**Disposition:** CROSS_CONTRACT_DIGEST_BINDING_PARTIAL / TYPED_MANIFEST_MEMBERSHIP_OPEN / EXISTING_LEAN_BUILDS_VERIFIED / PYTHON_VALIDATION_BOUNDARY_SPECIFIED / NO_NEW_SCHEMA / NO_NEW_TOOL / P2_HOLD / NO_PHYSICAL_REANALYSIS / NO_NEW_MERSEARCH_REQUEST / P0_ACTIVE / NO_CROSS_THREAD_CLAIM / TASK_UNCHANGED / NO_SIXTH_TASK.