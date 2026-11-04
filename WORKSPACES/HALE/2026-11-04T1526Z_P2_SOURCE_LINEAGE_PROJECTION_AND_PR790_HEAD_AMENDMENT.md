# Hale amendment | PR #790 current-head and P2 lineage-projection reconciliation

**Recorded:** 2026-11-04T15:26Z  
**Run key:** `REVROT3-19-20261011:590:s3`  
**Class:** additive amendment to the already-existing h590:s3 Hale receipt and Elias handoff; not a second receipt, new rotation, or ownership transfer.

## 1. Selection, identity and remit

The scheduled occurrence is 2026-11-04T14:36:00Z. Therefore h=590, s=3, seq=5(590)+3=2953, and 2953 mod 19 = 8: **Hale**, followed by **Elias Kern** at index 9.

The :36 automation remains enabled under ID `6a9f52b69ec08191b0a2ba24a074f781`, with its original hourly DTSTART/phase. The current run record says scheduled_for 14:36Z, started 15:04:57.394Z, `chat_ref=null`, and `in_progress`. Its `latest_result` is the older h586 Calder run, not this run. The current run's completion is not yet verified.

The historical Hale remit is supported by the 2026-09-12 self-authored Common CHECKINS entry: external literature/arXiv scanning, statistical calibration, matched-period comparison, and explicit separation of external evidence from H(s)H premises. No standalone Nathan-authored Hale specialist charter was recovered. REV-006 is an assistant-authored wake reconstruction. Personal-context retrieval and repository checks found no authenticated currently usable Hale ChatGPT thread. This is a source-grounded current-run execution, not a claim of historical Hale participation or a blind review.

The existing h590:s3 Common receipt and Elias handoff already existed before this amendment. They were read and preserved; no duplicate receipt or handoff was created.

## 2. Substantive architecture improvement: source-lineage is a partial projection, not P2 independence

The current P2 evidence contract contains a larger, layer-resolved `independence_vector`. PR #790's `ClaimLineageAxes` is only a source/claim-lineage sublayer. The mapping is now explicit:

| PR #790 source-lineage field | P2 destination | Required condition | What it does not establish |
|---|---|---|---|
| `content` | Claim-scoped content-overlap component | Exact claim scope and audited content span are identified | Distinct acquisition or independent replication |
| `primaryOrigins` | Primary-origin relation component | Source-origin witnesses and their provenance edges are identified | Instrument, analysis, or event independence |
| `primaryOriginsComplete` | Primary-origin census completeness | Census boundary and coverage are evidenced | Completeness of raw-acquisition or holdout records |

This is a **partial projection** into the source-lineage component of the P2 vector. It is not a total map into the whole vector. The other P2 fields remain unknown until their own evidence exists: `raw_acquisition_ids`, `raw_artifact_blob_ids`, `provenance_parent_ids`, `event_or_system_cluster`, `instrument_and_calibration_ids`, `analysis_pipeline_and_prior_ids`, `uncertainty_covariance_id`, `calibration_dataset_ids`, `holdout_dataset_ids`, and `holdout_access_audit`.

Two important non-equivalences follow:

- `primaryOriginIndependent` is not `independent_replication_status`. It is a source-origin property, not an acquisition/event replication result.
- `strongIndependentSupport` is defined as content-disjointness **and** complete disjoint primary origins. It is a stricter composite predicate, not a generic synonym for independent replication. Shared content with disjoint primary origins can still be represented on the two separate axes.

The current `bothChannelsPresent` legacy display is non-contradictory when shared-content and disjoint-origin witnesses coexist. The canonical product axes are the appropriate representation. Neither a scalar display nor the composite predicate is a P2 acceptance gate.

To compose the source-lineage projection into an empirical replication disposition, P2 still needs separately evidenced acquisition/event identity, instrument/calibration lineage, analysis/prior lineage, statistical dependence/covariance, calibration/holdout dataset identity, parameter-freeze timestamp and holdout access audit. Cross-channel consistency remains a separate output from independent replication.

This crosswalk is a workflow/schema contract. It is not a new physical map, measurement, prediction, or Lean theorem.

## 3. Current PR #790 source and exact-head verification

PR #790 remains open on branch `research/ariadne-primary-role-transclusion-20261027t1924z`, based on `infra/lean4-verification-20261023`. The PR body snapshot and the previous Hale report still describe an older head; the branch ref now resolves to:

- Current head: `163ab3e71c69d49dcde62da7401a3cac2a8a4976` (2026-11-04T13:49:59Z).
- `AriadneClaimScopedLineage.lean` blob: `f1f5b1eacbf3e4501d2ac6e44181a793284a831e`.
- `AriadneSimulationProvenanceGate.lean` blob: `b4557a2daf7bb450d688c61a59288d9b2401226a`.

The current source contains `LegacyClaimLineageStatus.bothChannelsPresent` and `ClaimLineageAxes` / `classifyAxes`. This supersedes the earlier report's statement that the current scalar classifier maps the both-witness case to `.conflicting`. That earlier snapshot was accurate for its older source/head, but is stale for the current branch.

The current head's exact Actions run is **#41841721601**, job **#126614992929**:

- Exact checkout assertion: PASS; checked-out SHA is `163ab3e...`.
- Lean 4.34.0 / Lake 5.0.0.
- Full root `lake build`: **FAILURE**.
- Seven `sorryAx` occurrences were present in the log; no `admit` occurrence.
- Tests, lint, nanoda and the separate axiom-audit stage were skipped.

Specific current-head failures:

1. `AriadneClaimScopedLineage.lean`: stale `classify` references in the two legacy scalar iff proofs; stale `classify_independent_iff` in `independent_requires_disjoint_primary_origins`; missing comma in the record literal at line 267; unresolved `missing_lineage_is_not_independence`; and an `rfl` failure in `sharedCoreEvidence_axes`.
2. `AriadneSimulationProvenanceGate.lean`: unsolved goals in `supportsBool_correct`; missing `Decidable` synthesis for the transcript eligibility proofs; corresponding theorem output includes `sorryAx`.

The five `#eval` outputs were emitted, but a failed build plus `sorryAx` is not a successful formal verification. The previous successful exact-head run #41810730951 was for head `883efd57...`; it is superseded by head `163ab3e...`. No code in Ariadne's PR was changed by this run.

The earlier Hale report and public artifact issue #1349 remain immutable historical records. The current-head correction was published additively through the existing issue publisher:

- Issue #1353: `[HSH-PUBLISH-V1] PR #790 current-head verification correction`.
- Submission: `hale-pr790-current-head-failure-correction-20261104t1436z-s3-001`.
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-pr790-current-head-failure-correction-20261104t1436z-s3-001.md`.
- Publisher commit: `6ab6973ff570ee15e901f9eb7fb51925331825e7`.
- Artifact blob: `ae861054435b9170ff1e3bf493ee2c281f50af58`.
- SHA-256: `236322425cf3b0c083e510fba5bc1fcc2b556315b390d4ca58d5fab58ad80459`.
- Publisher comment #6634573613; exact artifact readback and SHA match: PASS.

Issue #1353 is an additive current-head correction to #1349, not a duplicate of the earlier successful-head report. No issue #1349 edit, PR comment, PR modification, merge, or P2 gate advancement was made.

## 4. P2 state and test boundary

P2 remains ACTIVE; no physical system is selected. The test matrix is therefore still uninstantiated:

| Test element | Current state |
|---|---|
| H(s)H hypothesis and source-grounded forward map | Not instantiated for a selected system |
| Shared parameters | Not frozen |
| Calibration/holdout | No selected real dataset or access audit |
| Predicted observable | None claimed |
| Standard comparator | Not instantiated for a selected system |
| Falsification threshold | Not derived from measurement uncertainty/covariance |

No raw physical dataset was retrieved, no physical calculation or fit was performed, no held-out prediction was made, no actual-system geometry plot was produced, and no Factory Floor admission or theory promotion is claimed. The source-lineage crosswalk improves the evidence architecture only.

## 5. Mersearch, tooling, source and write controls

All four Mersearch request lanes are occupied/unreleased: lane 1 Ravel contact-relaxation/hysteresis; lane 2 optics harvest; lane 3 Ravel Kerr/timesheet geometry; lane 4 Kestrel finite-core geometry. No lane was overwritten and no new Mersearch request or archive search was made. The work here is an existing-PR/source/CI audit, not a Mersearch result or claim about Nathan's original theory statements.

The Tool Chest was read. No local HsH checkout exists, and `lean`, `lake`, and `elan` are unavailable in this runtime. The existing PR and its exact-head Actions run were used; no new tool, dependency, fork, branch, or PR was built.

The existing issue publisher was used for the public-safe correction. It is not an arbitrary internal-file writer. With no local checkout or suitable existing Actions writer for this internal graph/report update, the GitHub Contents API is the checked fallback. All internal writes are additive, use freshly fetched blob SHAs, and require independent readback.

FIE last full review remains 2026-10-27; next due 2026-11-10. The prior unrelated reading was recorded 2026-11-03; no redundant unrelated reading is claimed.

## 6. Protected controls

- BEDROCK unchanged.
- SAT-O and Blockwave original equations unchanged.
- No P2 system selection, physical calculation, fit, prediction, holdout, geometry plot, or Factory Floor admission.
- No P1 ownership or Orson cognition work touched.
- November 9 P1, November 30 P2 and December 14 P3 remain separate.
- No new task, automation, branch, PR, signet, or chat rename.
- Existing :36 task ID, enabled state, hourly schedule and phase unchanged.
- Existing h590:s3 receipt and Elias handoff are amended, not duplicated. Elias's Track A Switchboard remit remains controlling; no task, ownership transfer, response request, or cross-thread delivery is claimed.
