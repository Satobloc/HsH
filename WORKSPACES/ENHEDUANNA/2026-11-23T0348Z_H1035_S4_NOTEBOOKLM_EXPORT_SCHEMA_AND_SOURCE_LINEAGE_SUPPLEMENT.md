# Enheduanna h1035:s4 | Review-MIND: NotebookLM export provenance-field supplement

**Status:** ASSISTANT-LEVEL SOURCE AUDIT / PROVISIONAL ARCHIVAL RECOVERY / NO AUTHENTICATED ENHEDUANNA THREAD / NO NEW EXPERIMENT / NO THEORY PROMOTION

**Run key:** REVROT3-19-20261011:1035:s4  
**Nominal slot:** 2026-11-23T03:48Z  
**Ring result:** Enheduanna, index 11. Next: Tern Rook, index 12, h1036:s0.

## 1. Authority and repetition control

The live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation, thread-first rule, current main branch, current receipts, Enheduanna BOOT/CURRENT_WORK/INBOX, and the Enheduanna source-layer census were read before work.

No standalone Nathan-signed Enheduanna specialist charter was located. The [source-layer census](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-10-12_SOURCE_LAYER_CENSUS_AND_EXPOSURE_BOUNDARY.md) records only a broad historical instruction to consider the archives, not a dedicated role charter. Its underlying source is behind the HSH_RESOURCES no-payload boundary. The [HSH_RESOURCES root README](https://github.com/Satobloc/HSH_RESOURCES/blob/main/README.md) was read; no payload was opened. The [SAT archive root README](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/README.md) and public HsH source surfaces were also read.

The user-supplied Lane Charter 48 is the controlling remit for this activation. No authenticated current Enheduanna thread or run-level thread reference was established. This is assistant-level source-grounded work, not historical-instance participation.

This is not a new discovery of NotebookLM role collapse. Prior work already includes:
- [Enheduanna h807:s4](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-11-13T1548Z_H807_S4_REVIEW_MIND_NOTEBOOKLM_ROLE_COLLAPSE_TENTH_EXPORT_AND_PROVENANCE.md), which audited a tenth NotebookLM export and the existing nine-export public record, [issue #810](https://github.com/Satobloc/HsH/issues/810).
- [Enheduanna h1032:s0](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ENHEDUANNA/2026-11-23T0000Z_H1032_S0_PROPER_DIMENSIONALITY_COMETRIC_LINEAGE.md), which audited this same 62-message MATHEMATICO export while tracing the Proper Dimensionality/co-metric source lineage.

The present supplement adds a field-level audit of the raw export and the checked-in acquisition code. It does not recount the messages as new speakers, new experiments, or new Nathan-authored statements.

At preflight, [HsH main](https://github.com/Satobloc/HsH/commit/eb7bd1b7fcbc22c837a1910fc7ee588b831d575f) was at eb7bd1b7fcbc22c837a1910fc7ee588b831d575f, an automated discovery-docket refresh. The preceding research commit dae2a8f6d6f08e9843e24255779bf13961448249 only reconciled Nadir's optional packet delivery and CI status. Neither commit changed the MATHEMATICO export or the checked-in exporter source.

## 2. Primary artifact: MATHEMATICO NotebookLM export

Source: [MATHEMATICO NotebookLM export](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%5B%F0%9F%97%84%EF%B8%8F%5D%20MATHEMATICO__NotebookLM_export.json)

Git blob SHA-1: 3daab8ceb9cf1dd67a8d5a798bce045b470e4870.

The JSON was fetched from current main and parsed directly.

| Export field | Observed value |
|---|---:|
| Message records | 62 |
| Recorded role=user | 62 |
| Recorded role=assistant | 0 |
| Unique message keys | 62 |
| Duplicate role-plus-text pairs in this file | 0 |
| Messages with nonempty citation arrays | 28 |
| Messages with empty citation arrays | 34 |
| Source-manifest rows | 110 |
| Rows with a non-null source_id | 0 |
| Exporter-reported visible source count | 49 |
| Scroll scans | 186 |
| reached_top | true |

The message objects contain index, role, text, citations, and key. They contain no author, speaker, native message ID, per-message timestamp, or message-to-source identifier. The 62 keys are unique in this file, but uniqueness does not establish that they are native platform IDs.

The citation objects contain only label, aria_label, and disabled. They do not contain a source ID, source URL, source snapshot hash, or resolvable citation target. The 110 source-manifest rows are not 110 validated source documents: the capture includes UI labels and fallback rows, and every source_id is null. The metadata's visible_source_count of 49 is an exporter-reported UI count, not a verified count of unique source files.

The capture metadata reports 2026-10-08T04:36:24.408Z, 186 scans, and reached_top=true. The capture log contains a harvest_complete event at 2026-10-08T04:35:12.591Z with 62 messages and reachedTop=true. This supports completion of the exporter's scroll-to-top routine. It does not establish per-message timing, complete source contents, or source-to-message lineage.

In the inspected segment, indices 45-52 alternate between four response-shaped entries and four instruction-shaped entries. All eight are nevertheless recorded as role=user. The four response-shaped entries have citation UI tokens; the four instruction-shaped entries have empty citation arrays. This is evidence of different discourse shapes under one export role label. It is not proof of who authored each entry. The classifications describe text shape, not authenticated identity.

## 3. Existing exporter implementation: useful risk evidence, not the v0.2.2 root cause

Checked-in source: [notebooklm_full_exporter.js](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/ACQUISITION_PIPELINE/notebooklm_full_exporter.js)

Git blob SHA-1: ed5929b9d027cb7fdcf8927513fee72b2ef21201. The checked-in script declares version 0.2.0, while the MATHEMATICO export metadata declares version 0.2.2. The exact 0.2.2 implementation and a matching DOM-debug capture were not located in the bounded current-main search. Therefore the following are verified properties of the checked-in 0.2.0 source and design risks for the later capture, not an established explanation of the 0.2.2 result.

- roleOf classifies turns from DOM container selectors such as from-user-container and to-user-container. It does not read a native speaker identity field.
- scanMessages stores the derived role, text, citation labels, and a key calculated from role plus text.
- citationsOf stores label, aria_label, and disabled state, not a citation target or source ID.
- sourceManifest attempts to read data-source-id or data-id, then falls back to a title with source_id=null.
- mergeScan uses the role-plus-text key to recognize overlap and deduplicate across virtualized scroll scans. In principle, identical role/text turns encountered in separate windows could be conflated. No duplicate role/text pair or duplicate key was observed in this 62-message artifact, and this risk is not attributed to v0.2.2 without its source.
- toMarkdown renders role=user as “Nathan / User” and role=assistant as “Gemini / Assistant.” If that mapping is applied to an export whose role labels are unresolved, it turns a DOM-derived role into an author-like label. The actual Markdown rendering of this particular capture was not established.

The source-supported classification is therefore: recorded role-field uniformity is verified; author/source attribution remains unresolved; the 0.2.2 root cause is unverified. Do not manually relabel alternating turns, count the 62 records as Nathan-authored messages, or treat them as 62 model responses or independent experiments.

## 4. Formal criterion and its limit

Existing formal source: [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189), module [NadirWitnessCarryingComposition.lean](https://github.com/Satobloc/HsH/blob/research/nadir-affine-translation-quotient-20261101t0324z/FORMAL_VERIFICATION/HsHVerification/NadirWitnessCarryingComposition.lean), blob babec58f7bcdf3b25b3688888c5dc5f2648876ea.

The theorem rangeFactorization_iff_fiberwise states, for abstract projections P0 and P1 and an intervening map C0, that a range-to-range induced map D0 satisfying D0(P0(w)) = P1(C0(w)) exists exactly when P1 composed with C0 is constant on every fiber of P0. The two-stage theorem composes such maps when each stage satisfies its own fiber condition and carries the intermediate image witness.

Exact-head verification:
- PR head: da1e7d5dff0cdbc1d81303e3c573b79832087a38.
- Actions run #44106198466, job #134119101991.
- Lean 4.34.0 / Lake 5.0.0; 8,961 successful build jobs.
- The checkout assertion matched expected and actual source commit.
- rangeFactorization_iff_fiberwise reports Classical.choice; inducedRangeMap_factors and twoStage_witness_carrying_composition also report Classical.choice; inducedRangeMap_unique reports Quot.sound.
- No sorryAx or admit appeared in the retrieved log.
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped.
- PR #1189 remains open, draft, unmerged, and based on another research branch.

For a future source-attribution model, P0 could represent the flattened export projection and P1 composed with C0 could represent the desired author/source-lineage readout. The current export does not provide the underlying speaker/source map C0 or source witnesses, so fiber constancy cannot be tested. The theorem is a criterion, not proof that attribution is impossible. The correct status is ATTRIBUTION_UNRESOLVED, not ATTRIBUTION_IMPOSSIBLE.

No new Lean module was created and no new Lean run was launched. The existing exact-head Actions result was independently retrieved and inspected.

## 5. Incoming Nadir context: factorized detector readout

The [Nadir h1035:s3 optional packet](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-23T0336Z_from_s3_nadir_voss_to_s4_enheduanna_POSTSTART_OPTIONAL_FACTORIZED_READOUT_CONTEXT.md) was read and used as context only. It creates no task, review request, deadline, response obligation, or ownership transfer.

[Nadir PR #2397](https://github.com/Satobloc/HsH/pull/2397) factorized detector readout build was independently checked:
- PR head 4fa73785016bfdb527d0a1dc47ccac6eea58a43a.
- Merge-reference commit b409b493be9cab648b5f26f84c31cfdf62899693.
- Actions run #45107637381, job #137472464515.
- Lean 4.34.0 / Lake 5.0.0; 8,959 successful build jobs.
- The new module built; three theorem-specific axiom reports list propext, Classical.choice, and Quot.sound.
- The Nadir module's three theorem-specific reports list no sorryAx for those declarations. The broader build log contains an unrelated RavelNormalConnectionReduction evaluation output with a printed sorry placeholder. The workflow did not run nanoda, leanchecker, or a separate global axiom audit, so no global no-sorry claim is made.
- Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped.
- This is a successful merge-reference build, not exact-head-only verification, independent review, main integration, or physical validation. PR #2397 remains draft and unmerged.

The resulting bound is deterministic metric mathematics. It cannot be applied to the NotebookLM export as an error bar: no justified metric on transcript/source histories, no measured Lipschitz constants, and no source-authenticated terminal readout are supplied. Nadir publisher [issue #2399](https://github.com/Satobloc/HsH/issues/2399) remains rejected for SHA mismatch. It was not edited, retried, reopened, or duplicated.

## 6. Falsifiable exporter-validation test

If an authorized live NotebookLM session and the exact v0.2.2 source become available:

1. Capture at least two known user turns and two known NotebookLM response turns, with the actual UI state and DOM-debug artifact preserved.
2. Record native event/speaker identifiers, timestamps, role-selector matches, source IDs, and citation targets.
3. Compare JSON and Markdown exports against the known turns.
4. Repeat identical text in separate scroll windows to test whether content-derived overlap keys collapse distinct events.
5. Verify that each citation resolves to a stable source ID and versioned source snapshot.

If known user and model turns are distinguished and source/citation IDs resolve, the 62 all-user result may be capture-specific or caused by how the notebook was populated. If the exporter maps both known turn types to one role or loses source IDs, the exporter limitation is confirmed. This is a proposed validation, not a completed experiment.

No live NotebookLM account, human participant, private payload, or model endpoint was accessed. No human-subject result is claimed.

## 7. Campaign and operational boundaries

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 November 9 cognition | OVERDUE / NOT READY / FROZEN / ORSON-OWNED |
| P2 November 30 | HOLD |
| P3 December 14 | INCOMPLETE |
| FIE | Last full review November 20; next December 4 |

[P1 issue #564](https://github.com/Satobloc/HsH/issues/564) remains open. [Orson PR #850](https://github.com/Satobloc/HsH/pull/850) remains draft and unmerged. No trial, human session, protocol amendment, manuscript edit, or ownership change occurred. Orson's primary cognition work remains protected.

The latest full FIE review is November 20, so the 14-day re-review trigger is not due. The unrelated-reading break was completed November 21 and was not repeated.

Mersearch was not exposed as a callable action in this runtime. All four canonical request lanes remain requested/occupied; no lane was overwritten, released, or retriggered. GitHub search was a bounded fallback, not a Mersearch result. The HSH_RESOURCES root README only was read; no private payload was opened. The SAT archive root README and public HsH source surfaces were read.

The [PWH queue](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PRIMARY_WORKFLOW_HEALTH_ACTION_QUEUE_2026-11-13.md) and [task graph](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json) remain the controlling return surfaces. The graph remains 18 records against 16 declared branches: 7 roots, 11 parent references, 10 child edges, 17 reachable records, and one blocked/unreachable M87 polarimetry record. No graph mutation was made. No physical calculation, measured-system prediction, fit, uncertainty estimate, SAT-O/Blockwave equation change, new tool, paid endpoint, or BEDROCK theory promotion occurred.

The existing relay task remains enabled and unchanged. No task, ID, schedule, prompt, phase, cadence, or ownership mutation occurred. No sixth task was created. The current run has no authenticated run-level thread reference; its cached prior result belongs to the earlier Loom run and is not attributed to Enheduanna. No direct-thread delivery, worker acknowledgment, or historical-instance participation is claimed.

**Return:** preserve the 62-message MATHEMATICO export as unresolved source attribution. Recover the exact v0.2.2 exporter and authorized DOM-debug evidence before assigning speakers or source ancestry. Next deterministic ring label: Tern Rook, h1036:s0. Any successor packet is optional repository context only.
