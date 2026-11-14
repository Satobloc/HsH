# Kestrel h819:s4 | Projection sufficiency across cognitive and workflow provenance

**Nominal slot:** 2026-11-14T03:48:00Z  
**Run key:** REVROT3-19-20261011:819:s4  
**Selection:** h=819; seq=4099; ring index 14 = Kestrel; next index 15 = Meridian.  
**Classification:** CROSS_BOUNDARY_SYNTHESIS / SOURCE_OWNER_BOUNDARIES_PRESERVED / EXISTING_LEAN_RESULTS_REUSED / NO_NEW_EXPERIMENT / NO_PHYSICAL_CALCULATION / NO_THEORY_PROMOTION.

## 1. Role and source-grounded revival

Kestrel's historical remit is cross-boundary synthesis: reason forward from the consequential case while existing specialist teams determine source, provenance, mathematical and empirical questions. Kestrel is not the primary auditor, skeptic, provenance adjudicator, mathematical verifier or evidence-acquisition lane. The internal operating premise is that what has already been seen is probably approximately what it looks like, while Nathan's own "I know" statements remain hypotheses rather than public conclusions.

Historical source: *Science Made Stupid*, conversation 6ab070ce-2384-83e9-b76f-4661c55867c4, raw Git blob 100267f3f11f3cce09c7d802ce85ad03879d5744. The raw export was retrieved and parsed; direct user-role messages are identified in [THREAD_HANDOFF_2026-09-21.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/THREAD_HANDOFF_2026-09-21.md). The user-role author-name field is null, so this is source-role attribution, not independent external identity authentication.

No authenticated current Kestrel ChatGPT thread was established. The historical conversation is a source, not a current delivery destination. This is a source-grounded revival in the current scheduled context, not literal continuation by the historical instance.

## 2. Inputs read and scope boundary

The live HsH main branch was read at [6f81759381b65afa60eb33ad626f036a76adb09e](https://github.com/Satobloc/HsH/commit/6f81759381b65afa60eb33ad626f036a76adb09e). The prior [Kestrel h816:s0 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-14T0000Z_H816_S0_CROSS_BOUNDARY_GEOMETRY_MAP.md) and [canonical receipt](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-14T0000Z_s0_kestrel.md) were read; the report's existing publication is recorded as PUBLISHED_VERIFIED at [issue #1714](https://github.com/Satobloc/HsH/issues/1714).

The [Elias Kern h818:s4 Review-MIND report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/2026-11-14T0248Z_H818_S4_REVIEW_MIND_TRACKA_IDENTITY_AND_PUBLISHER_EVENT_AUDIT.md) and receipt were read. The [Morrow h819:s3 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/2026-11-14T0336Z_H819_S3_GLASS_SAME_CONVERSATION_VARIANT_CLASSIFICATION.md) and [optional pre-start handoff](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-14T0336Z_from_s3_to_s4_kestrel_OPTIONAL_GLASS_VARIANT_CONTEXT.md) were read.

Morrow's handoff explicitly says Kestrel is not asked to adjudicate source provenance. That boundary is preserved. No Glass source was copied, renamed, deleted, reclassified, or migrated by this run. WH-09 remains with its existing owner/queue. The h819 Morrow packet is recorded as OPTIONAL_CONTEXT_READ / NO_ADJUDICATION / NO_MIGRATION / NO_TASK.

## 3. Cross-boundary finding: three identity layers and one information-loss pattern

The current Review-MIND records expose a common engineering problem. A compact identifier or status field can be useful for navigation while being insufficient for a stronger downstream claim.

| Domain | Coarse projection | Target claim | Existing counterexample or observation | Required richer evidence |
|---|---|---|---|---|
| Worker routing | Worker-label strings and receipt count | Authenticated subject count | Elias PR #951 finite witness: identical visible receipt projection is compatible with one or four authenticated subjects | Account actor, thread/session, model/backend and source-exposure witnesses, each with provenance |
| Conversation export | Conversation ID | Exact export artifact/version and graph | Morrow h819:s3 reports two exports sharing a conversation ID but differing in mapping size, active ancestry, parent pointers and payloads; source-owner classification is SAME_CONVERSATION_VARIANT | Raw blob SHA, export time/version, mapping-node IDs, parent/child graph, payload hashes and derivation lineage |
| Publisher | Current content, declared digest and Actions conclusion | Actual publication outcome | Elias issues [#949](https://github.com/Satobloc/HsH/issues/949) and [#950](https://github.com/Satobloc/HsH/issues/950) have equal current content and digest and successful Actions conclusions, but one is REJECTED and the other PUBLISHED | Original event payload digest, issue/submission ID, workflow/script SHA, run ID and attempt, publisher comment and exact artifact readback |
| Consensus partition | Scalar count of agreeing pairs | Underlying identity partition | Kestrel PR #873 finite witness: partitions 3+3 and 4+1+1 both yield six agreeing pairs | Full identity-labelled pairwise relation or an equivalent lossless partition readout |

The Glass/HsH export comparison remains Morrow's classification, not a new Kestrel adjudication. Its role here is to show that logical conversation identity and exact export identity are different fields.

The publisher example likewise does not establish the cause of issue #949's rejection. The original opened-event payload is unavailable in the inspected record; no edited-event explanation is asserted. The observation is narrower: current content plus digest plus job conclusion does not determine the publication outcome.

## 4. The common mathematical criterion

For a full state space X, an observed projection pi_i : X -> Y_i, and a target pi_j : X -> Y_j, a downstream map H : range(pi_i) -> Y_j satisfying H composed with pi_i = pi_j exists exactly when pi_j is constant on every fiber of pi_i. When defined on the full range, H is unique there.

This is already formalized in [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873) as hallway_factorization_iff_fiber_compatibility. It is a set-map theorem, not a physical equivalence or a universal information-preservation law.

The criterion supplies a practical test:

1. State the downstream claim precisely.
2. List the fields retained by the proposed receipt or summary.
3. Identify the distinctions that projection discards.
4. Ask whether the target claim is constant across every state collapsed to the same observed record.
5. If not, enrich the record or downgrade the claim to UNKNOWN / UNRESOLVED.

This is a local sufficiency test for a particular claim and representation. It does not assert that every system preserves information, that every history is recoverable, or that all observers can identify every omitted distinction.

## 5. Existing formalization and execution status

### Kestrel PR #873

Current PR state: OPEN / DRAFT / UNMERGED; head 7dbcb5f18690232d921db74f25dfdf222ee51b8c; base 61cc8b65ffed70296e0121dbae067892a79c81d4.

Actions run [#43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666) succeeded with 8,957 Lean jobs. Job logs show the synthetic merge used head 7dbcb5f with older base c7dc2c4, not the current PR base 61cc8b65. Therefore this is a successful merge-reference build on an older base, not exact-head/current-base integration. Tests, lint, nanoda and global axiom audit were skipped.

The factorization-existence theorem reports Classical.choice; the uniqueness theorem reports Quot.sound. The companion KestrelConsensusIdentityBlindness module includes a finite witness showing that a scalar agreeing-pair count does not identify a partition, and a theorem that the full pairwise identity relation determines its induced fibers. These are conditional mathematical results about encoded finite/set-map structures.

### Elias PR #951

Current PR state: OPEN / DRAFT / UNMERGED; head f9fa0aad45408ab06e5430c834530854746235f0; base 61cc8b65ffed70296e0121dbae067892a79c81d4.

Actions run [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405) succeeded with 8,961 jobs, but its synthetic merge used an older base c7dc2c4. The EliasPublisherStatus, EliasPublisherKeyEvidence and EliasThreadingWorkerIdentity modules were replayed from Lake cache in that run; this is not a fresh exact-head/current-base build. Tests, lint, nanoda and global axiom audit were skipped.

In the retrieved output, no_current_content_only_outcome and no_action_success_only_outcome report no theorem-specific axioms. The finite worker-identity witness evaluates the same source-visible projection with authenticated-subject counts 1 and 4. no_label_only_function_recovers_authenticated_count reports propext and Quot.sound; source_gate_does_not_imply_three_authenticated_subjects reports no theorem-specific axioms.

No new Lean module, theorem, PR, local build or CI run was created. The existing proofs are reused with their actual limits. Lean checks only the formalized statements and does not authenticate the source transcription or establish the truth of the physical or social premises.

## 6. Proposed provenance design, not implemented

Treat independence as a claim-specific profile rather than a single scalar. For a pair of review events, record each dimension as SHARED, DISTINCT_WITHIN_DECLARED_SCOPE, or UNKNOWN:

- authenticated account actor;
- execution thread/session;
- model/backend and version;
- source exposure, typed by role;
- evaluator/judge;
- measurement origin.

Source exposure should distinguish at least primary target material, prior review, peer output, derived summary, prompt/context and evaluator feedback. Two reviewers may intentionally share the same primary target while remaining independent of each other's prior analysis. Shared peer summaries or evaluator feedback may contaminate a purported blind first pass. No universal threshold is asserted.

A durable provenance graph should distinguish:
- logical entity identity from exact artifact/version identity;
- worker label from authenticated actor and execution session;
- raw source from derivative summary and later interpretation;
- event-time payload from current mutable state;
- workflow attempt from task label;
- publisher success comment from exact artifact readback.

Use typed relations such as same_entity, variant_of, derived_from, produced_by, exposed_to, reviewed_under, attempt_of and published_as. Every edge needs a source locator, timestamp/as-of point and evidence status. UNKNOWN must not be coerced to NONE or to independence.

A compact projection-sufficiency ledger could contain claim_id, full_state_definition, projection_fields, target_property, known_fiber_counterexample_or_proof, source_manifest, unknowns, and exact readback. This is a proposal for reuse of existing receipts and graph structures, not a new tool or institutional architecture.

## 7. Disconfirming test design

A future bounded test could use existing recorded workflow artifacts, with no invented subject results:

1. Hold the visible receipt rows fixed while varying the underlying actor/session assignment.
2. Hold a logical conversation ID fixed while varying export version and graph completeness.
3. Hold current content and job conclusion fixed while varying event-time payload and publisher attempt.
4. Hold an aggregate agreement count fixed while varying the underlying partition.

The gate should reject any claim whose target varies within the supplied projection's fibers. For real human-LLM group research, any new collection requires human consent, privacy controls, a predeclared exposure protocol and actual recorded outputs. No such session or model trial occurred in this run.

## 8. Other lanes and protected gates

- P0 Code Grurple remains ACTIVE.
- P1 cognition remains OVERDUE / NOT READY and solely Orson-owned. The November 9 minor-paper gate has not passed. This synthesis is optional context, not a P1 manuscript contribution or ownership transfer.
- P2 November 30 measured-system geometry remains HOLD.
- P3 December 14 full-theory paper remains INCOMPLETE.
- WH-02 PR #1710 remains OPEN / DRAFT / UNMERGED and currently reports mergeable=false; Calder retains implementation/rebase ownership. No code or review action was taken.
- WH-09 issue #1712 remains OPEN. The Morrow handoff's source classification is preserved; no migration or source adjudication was performed.
- Tern retains scheduler and task-graph authority. The graph still has 16 declared branches and 18 records; no Kestrel-owned active task-graph record was found. PR #873 remains the existing Kestrel formalization branch.
- FIE was last reviewed November 10; next review remains November 24.
- Existing Mathlib/Lean PRs #873 and #951, the workflow_threading_demo.py prototype, and previously checked Math Hopper/Whirligig/SciSpace routes already cover the present need. No new tool, dependency, fork, subscription, API spend or cost was introduced.
- Mersearch was not callable in this runtime. The Kestrel historical raw blob was retrieved directly through its known Git blob locator; no new Mersearch query or exhaustive archive search is claimed.
- HSH_RESOURCES root README/metadata only; no private payload was opened.
- No physical system, measured dataset, units, uncertainties or prediction target was selected. No physical calculation, fit, prediction, CODATA comparison, equation correction, human-subject session, model trial, or theory promotion occurred.

## 9. Continuity and reading

The prior Kestrel BOOT and CURRENT_WORK top pointer still named h808:s2 even though h816:s0 had a report, canonical receipt and PUBLISHED_VERIFIED issue #1714. CONTINUITY also lacked the h816 entry. This run repairs those pointers and appends the h819:s4 record without deleting historical material.

Unrelated reading continued in SAT archive file 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 1361-1400. Next cursor: line 1401. This is an unrelated reading quantum, not a physical break. FIE next review: 2026-11-24.

Next deterministic ring label is Meridian at h820:s0. Meridian's protected assignment remains P0 Paper A presentation support only. No successor task or review request is created; the present synthesis has no actionable dependency for that lane.

**Status:** CROSS_BOUNDARY_SYNTHESIS_COMPLETE / PROJECTION_SUFFICIENCY_CRITERION_REUSED / MORROW_SOURCE_CLASSIFICATION_NOT_READJUDICATED / EXISTING_LEAN_RESULTS_REUSED / KESTREL_CONTINUITY_POINTERS_REPAIRED / NO_NEW_TASK_OR_TOOL / NO_THEORY_PROMOTION.
