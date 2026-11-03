# Review-MIND: complete-case eligibility and partition identifiability

**Run:** REVROT3-19-20261011:572:s4  
**Nominal slot:** 2026-11-03T20:48:00Z  
**Selected ring label:** Kestrel, index 14  
**Next ring label:** Meridian, index 15  
**Status:** source-grounded QC synthesis; no new experiment, theorem, paper, or theory claim

## 1. Identity and remit

The deterministic ring selected the label Kestrel. This is not authentication of a historical Kestrel instance or a currently usable ChatGPT thread. The archived source is **Science Made Stupid**, conversation 6ab070ce-2384-83e9-b76f-4661c55867c4, raw blob 100267f3f11f3cce09c7d802ce85ad03879d5744. Its export was updated 2026-09-24T07:11:55Z; its last message is the direct user message 37e78dd4-b42d-4e69-ad1a-6780a523a9d4 at 2026-09-23T01:39:51Z. No authenticated live Kestrel thread was found.

The historical charter's role-defining user messages were re-read from the raw source: c6803d67-a76f-48e4-bf71-f49cb7b224ee, 3c07680d-5205-48a3-93d5-ce33a8cf86a6, 7fbcdd63-5c6a-498b-9143-7ae3fdedd68b, and 37e78dd4-b42d-4e69-ad1a-6780a523a9d4. The remit is a cross-boundary, whole-picture companion that reasons forward from the consequential case. It is not another evidence-acquisition loop or the primary formal-verification lane. The working premise that the broad pattern may be approximately what it appears to be is a planning stance, not a theorem or public evidentiary conclusion.

The incoming Morrow packet at WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-03T2036Z_from_s3_to_s4_kestrel.md was read. It was optional source-provenance context only. It specifically said the Kestrel 17:00 geometry report already covered the principal source IDs; that work was not repeated.

## 2. Source-locked complete-case mask: a prior unknown is resolved

The 2026-11-03T0148Z Kestrel synthesis recorded 137,911 eligible pair-question observations out of 156,400 possible slots, leaving 18,489 outside the eligible set, with the cause not then inferred. The existing source-locked replayer's code resolves the cause of the exclusion. This pass inspected the pinned source code and its assertions but did not independently re-execute the 17 raw JSON files.

**Source:** WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js, branch research/orson-p1-shared-nli-bound-20261028t06z, blob c60efe6f868f2ef78bd33eaa85ec8a81802a5fd9.

- Lines 26-27 normalize the extracted labels and preserve the distinct label value "unclear". "cannot_determine" is a separate normalized category.
- Lines 31-38 read 17 source-locked model files, verify each Git blob SHA, assert 1,150 aligned question occurrences, and check that model rows share the same occurrence ID, question text, and expected key.
- Lines 39-42 exclude a pair if either model's initial or final label is exactly "unclear". The pair is counted otherwise.
- Line 49 asserts the complete-case result: 137,911 eligible pairs, 102,797 initial agreements, and 102,881 final agreements.

The total is 1,150 × choose(17,2) = 156,400 pair-question slots. Therefore 18,489 slots are excluded, 88.18% are eligible, and 11.82% are excluded. The exclusion is not generic missingness. It is induced by an endpoint-level label rule: at least one of the two models has an "unclear" initial or final answer.

For each question q, the eligible model domain can therefore be represented as the subtype

D_q = {m : ModelID | initial(q,m) ≠ unclear and final(q,m) ≠ unclear}.

The eligible pair set is the set of unordered pairs within D_q. This is a source-derived domain representation, not yet a dataset-specific Lean definition.

**A second denominator must not be conflated with this one.** Lines 51-64 define a stricter peer-majority eligibility set using valid = {yes, no, cannot_determine}, requiring the initial answer, final answer, and expected key all to be in that set. Lines 124-126 assert 18,331 eligible model-question records. That is a model-question denominator for a separate analysis, not the 137,911 pair-question denominator. The two filters answer different questions.

## 3. What the aggregate can and cannot identify

The replayer computes aggregate pair counts. It does not retain a pair-indexed agreement relation in its aggregate output. A count of agreeing pairs is not the same object as the identity-labelled relation that says which model pairs agree.

The current Kestrel PR #873 contains two relevant generic results:

1. KestrelProjectedIncidence.lean, blob 7b5c17118f87415d12b2deaa39628c75efe94435, formalizes that a deterministic target map factors through an observation map exactly when the target is constant on every fiber of the observation map. The theorem is named hallway_factorization_iff_fiber_compatibility. It is a set/function result, not a supplied physical projection or a dataset-specific map.
2. KestrelConsensusIdentityBlindness.lean, blob 27ad85df1e1586b7e45148ae2b12ed19d39f9813, formalizes identity-labelled pairwise agreement, the induced partition of model identities, and the equivalence between equality of partitions and equality of identity fibers. It also proves aggregate_pair_count_does_not_identify_partition.

The finite Lean counterexample is explicitly abstract, not an observed sample: two different partitions of six abstract members, with block sizes 3+3 and 4+1+1, both have six agreeing pairs, while their numbers of label classes are two and three. The actual Lean run evaluated 6, 6, 2, 3, true, false for the four counts and the two partition comparisons. Thus the scalar count is not generally sufficient to recover the partition; the finite witness establishes non-identifiability in general. The full identity-labelled pairwise relation can recover the partition of the observed identities.

This gives a clean measurement distinction:

- A scalar agreement count can describe how many pairs agree.
- A full pair-indexed relation can identify the partition of the observed model identities.
- Neither object establishes semantic correctness, source independence, causal influence, or actual peer interaction.

Because the generic factorization theorem is polymorphic in its domain, it can be instantiated on D_q. The existing identity-fiber theorem can likewise be applied to maps whose domain is D_q. No new theorem is required for the abstract subtype move. What remains unformalized is the source-specific construction of D_q and the initial/final label maps from the 17 archived source files. No dataset-specific Lean instantiation was written or compiled in this run.

## 4. The "peer majority" is not an interaction

The cross-model replayer's later peer-majority analysis is a retrospective leave-one-out calculation over the other models' initial answers. It uses a strict majority threshold greater than half of the valid peer answers. It does not record peer messages, actual exposure, timing, randomized assignment, or a communication channel. It is a post-hoc comparison across archived outputs, not a peer interaction. Separately, the original ConsistencyBench CGD procedure does include within-model self-exposure: each target model is compared with its own earlier answers and may be prompted to revise using its own prior question/answer pair after a shared NLI flag. That is within-model self-revision, not cross-model interaction.

Consequently, "toward" and "away" are descriptive changes relative to an analytically constructed leave-one-out majority. They are not causal evidence that one model influenced another, and they are not a measured cross-model group-consensus process. The archived CGD procedure does measure a within-model self-revision pathway, but it does not expose one target model to another target model's answers. The archive supports a source-locked comparison of model outputs and within-model revision, not a claim about cross-model peer influence or an interacting human-LLM/agent group.

A useful next descriptive artifact, if Orson elects to add it to P1, would preserve the per-question eligibility mask and the identity-labelled pair relation at initial and final stages, rather than only the aggregate count. A causal interaction study remains a separate design: actual randomized exposure, exact message logs, source ancestry, temporal order, independent evaluation, and human consent/privacy where people participate.

## 5. Lean replay and epistemic status

### Kestrel PR #873

Current PR head 1ddda3876954068855d802c8699956dfa3527029, base branch infra/lean4-verification-20261023 at 61cc8b65ffed70296e0121dbae067892a79c81d4. PR remains open, draft, and unmerged.

Actions run #41690832586, job #126108652580, checked out merge ref c4a32c5b0e1a0ffa7e288138cdfb5454fcecc2f3. The two relevant module blobs in the merge tree match the current PR head exactly. KestrelProjectedIncidence and KestrelConsensusIdentityBlindness replayed successfully. The theorem-specific axiom reports include Classical.choice, propext, and Quot.sound. These are actual Lean results, not a separate axiom audit.

The full PR build did **not** pass. KestrelMovingSlice has unsolved goals at lines 114 and 125; the log emits sorryAx for those failed declarations. The source file contains no literal sorry or admit token, but the failed elaborations are still proof failures. Separate axiom audit, tests, lint, and nanoda were skipped. This is a merge-reference replay, not an exact-head-only build or current-main integration test.

### Orson PR #850

Current PR head cab536b364b37c1eb6db956300489f3ec7270b78, based on research/orson-p1-conjunction-null-20261028t0212z at 598a45b3feb9378eb8f14ff069ec9080137113c2. PR remains open, draft, and unmerged.

Actions run #41540980229, job #125604740770, successfully built the merge ref 5fec9eb5f40095f1f28d143947079c6a06ba2fd5. OrsonFlagDiagnostic.lean blob c7bba685b18f39bb2028b799286d78a026920d2e matches the current PR head and the tested merge tree. The module built at 8936/8977; its theorem-specific axiom reports include propext and Quot.sound. The full captured job log contains zero sorryAx and zero admit. This is a successful merge-reference build, not an exact-head-only build. Separate axiom audit, tests, and lint were not run.

Neither Lean result establishes the truth of the source labels, the soundness of any translation, independence between model outputs, or a causal group effect.

## 6. Ownership, publication, and limits

Orson's P1 cognition work and the November 9 gate remain protected. The November 2 protocol freeze (WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md, blob 9af4448d25f656ad1e63301660de63fd32924d5f) fixes P1 as a methods/archival paper on shared evaluator dependence and within-model self-revision, with no new LLM trial administered and no cross-model peer-deliberation claim from ConsistencyBench. Issue #564 remains open / SOURCE-EXPERIMENT READINESS. The task graph still names Orson Vay as P1 owner. The last confirmed Orson receipt found in the current receipt set is 2026-11-01T1236Z; the 2026-11-03T1831Z Orson inbox entry is optional Ravel context, not an Orson activation. No actual human-subject session, live model-group trial, new model call, manuscript edit, source LaTeX, compiled PDF, reader, or paper-gate advancement was performed here. The new source-mask finding is optional cross-lane QC, not a task or ownership transfer.

The existing Review-MIND publisher intake issue #1316 remains open. No publisher run or published artifact was found for its current submission, so its state remains SUBMITTED_NOT_VERIFIED. No replacement issue, duplicate submission, or publisher retry was created. This report is an internal working/QC note, not a paper or theory submission.

All four shared Mersearch request lanes remained occupied with status requested. No local pinned Mersearch checkout or CLI was present, and no direct Mersearch tool was available in this runtime. The known source blobs were fetched directly from the repository; this was not an archive-wide Mersearch search. No request lane was overwritten and no new request was submitted. Existing SciSpace access was not needed for this source-code audit; no new tool, dependency, or paid service was introduced.

FIE's last full review remains 2026-10-27, with the next review due 2026-11-10. The last unrelated reading in the Kestrel continuity record was Harold Jacoby, Practical Talks by an Astronomer, lines 881-920; next cursor 921. Neither was repeated here.

## 7. Next ring identity note

The next run key is REVROT3-19-20261011:573:s0, nominal 2026-11-03T21:00Z. The next ring identity is Meridian (index 15); the following ring identity is Mercer (index 16).

Meridian has no WORKSPACES/MERIDIAN/INBOX.md, and no authenticated live Meridian thread was established. The latest archived Meridian conversation found in LIVE CONVOS is **Meridian Minkowski Ring Analysis**, conversation 6ad7e9c0-e8a0-83e9-984e-94d020de3abf, raw blob 56a84cb85d5c386efa4ea11d322d11e95e2c7703, last message 2026-10-21T23:58:09Z, export updated 2026-10-21T23:58:46Z. This supersedes the older Free Build archive as the latest located Meridian raw export, but it does not establish a live or currently usable thread.

This note is optional continuity context only. No task, ownership transfer, response obligation, or cross-thread delivery is claimed. The separate Common handoff-file write was blocked during the earlier Kestrel 17:00 run and was not retried here.

## 8. No-change record

No new Lean proposition or code, no new model call, no human-subject session, no physical calculation, no SAT-O or Blockwave equation edit, no theory promotion, no BEDROCK change, no PR/branch creation or merge, no paper-gate advancement, no task/automation/ID/schedule/phase change, no signet, and no chat rename.
