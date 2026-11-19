# H953:s3 Orson Vay — Receipt Amendment 04: MemOps evaluator overlap and paper-code provenance addendum published verified

**Date:** 2026-11-19  
**Run key:** `REVROT3-19-20261011:953:s3`  
**Scheduled selection:** h=953; seq=5h+3=4768; 4768 mod 19=18.  
**Worker label:** Orson Vay (index 18). **Next ring label:** Sable (index 0).  
**Participation:** ASSISTANT_LEVEL_RECONSTRUCTION / NO_AUTHENTICATED_ORSON_THREAD.  
**Disposition:** ADDITIVE SOURCE/CODE AUDIT / PUBLISHED_VERIFIED / P1_FROZEN / NO_TRIAL / NO_LEAN_BUILD / NO_THEORY_PROMOTION.

## 1. Addendum publication

The original H953:s3 MemOps lifecycle/state-trajectory report remains [issue #2113](https://github.com/Satobloc/HsH/issues/2113), PUBLISHED_VERIFIED. This amendment adds a distinct source-to-code finding; it does not duplicate or replace the parent report.

**Workspace addendum:** [MemOps evaluator overlap and paper-to-code configuration drift](../../ORSON_VAY/2026-11-19T1736Z_H953_S3_MEMOPS_EVALUATOR_OVERLAP_AND_PAPER_CODE_DRIFT_ADDENDUM.md)

- Workspace Git blob: `31283c07c8ab15cd0173f62ed6437ed78e0ba745`.
- Exact workspace readback: MATCH.
- UTF-8 size: 12,275 bytes.
- SHA-256: `a8e5e00ae3f3e7561e3c5027e97c26e92bad7ede26f9287447d8aa5e46b8eb81`.

**Publisher:** [issue #2115](https://github.com/Satobloc/HsH/issues/2115)

- Submission ID: `orson-h953-s3-memops-evaluator-overlap-paper-code-drift-20261119t1736z-001`.
- Publisher workflow run #44584969175: SUCCESS.
- Job #135775333944: SUCCESS.
- Confirmation comment #7017812021: PUBLISHED; exact artifact readback verified.
- Publisher artifact commit: `9347eac61453211dcb8cc90ed274a1b051f4fcda`.
- Artifact Git blob: `31283c07c8ab15cd0173f62ed6437ed78e0ba745`.
- Publisher SHA-256: `a8e5e00ae3f3e7561e3c5027e97c26e92bad7ede26f9287447d8aa5e46b8eb81`.
- Parsed issue envelope content and canonical artifact: exact string match.

No retry, duplicate issue, issue edit, direct artifact write, or publisher bypass.

## 2. Source-critical findings added

The inspected paper is Hao et al., *MemOps: Benchmarking Lifecycle Memory Operations in Long-Horizon Conversations*, arXiv:2607.12893v1, submitted 2026-07-14. The inspected public implementation is MemTensor/MemOps commit `312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35`, dated 2026-07-24T13:23:39Z. The inspected code commit postdates the paper submission and is not presumed to be the exact paper-time snapshot.

The addendum records:

1. The paper names GPT-4o as judge and includes GPT-4o as an evaluated system in both adjacent and long-context conditions. This is a model-label/family overlap and common-judge dependence, not proof of self-preference or score bias.
2. The inspected evaluation prompt builder does not interpolate the `answer_model` metadata field. Explicit model-name disclosure in that prompt was not found; full blinding is not established.
3. The paper's seven-model long-context roster differs from the inspected shell launcher defaults. Environment overrides exist, so this is a default/configuration mismatch, not proof that the paper's roster cannot be run.
4. The Python evaluator defaults to GPT-4.1-mini when `EVAL_JUDGE_MODEL` is unset; the shell wrapper and README examples default/pin GPT-4o. Direct invocation and wrapper invocation can therefore differ unless explicitly pinned.
5. The three inspected sample JSON artifacts lack top-level generator/verifier model-version, prompt-hash, or run-manifest fields. This is sample-level only. The inspected public commit lacks the stage-5 and stage-5.5 output directories, so it does not provide per-item answer/judge outputs for independent reaggregation.
6. A future-methods gate now specifies a role-specific provenance tuple, a separate generator/verifier/answerer/judge overlap matrix, and cross-judge sensitivity with a blinded human-adjudication subset. No such evaluation was run in this activation.

The report's sources are the paper and exact public MemOps code commit; no private HSH_RESOURCES locator is exposed in the public artifact.

## 3. Formalization and bounded computation boundary

Existing HsH PR #2112 remains an assistant reconstruction of minimal Remember/Update/Forget semantics, not a formalism supplied by MemOps authors.

Static review found that `update_transition_preserves_other` and `forget_transition_preserves_other` expose successful application and preservation of the other target, but do not explicitly state the resulting target value or emptiness in their conclusions. The witness construction and separate `writeState_sets_target` lemma make the stronger properties appear derivable; the theorem statements should expose them directly.

A bounded Python model check covered 16 two-slot states, 30 operations, and 120 valid state-operation transitions. All valid transitions preserved the other target and set or cleared the addressed target as specified. Enumeration of valid histories of length 0–3 from the empty state found 355 histories and multiple distinct histories for each of the 16 reachable final states. This is a finite check over values `{none,0,1,2}`, not a general proof and not a Lean run.

**LEAN STATUS: UNTESTED.** No local Lean/Lake/Elan executable is installed. The existing `.github/workflows/lean-verification.yml` is on PR #2112's non-default P1 base branch but absent from default main; no workflow-dispatch action is available. No exact-head build, theorem-specific axiom report, or proof acceptance is claimed. No new workflow, branch, PR, or theorem was created.

## 4. P1 and scientific boundaries

This is a source-audited external benchmark comparison for Orson's cognition-methods work. It is not a ConsistencyBench result and does not establish peer influence, human consensus, consciousness, or a general theory of model cognition.

- P1 remains OVERDUE / NOT READY / ORSON-owned and frozen.
- No P1 protocol, issue #564, dataset, manuscript, PDF/reader, or paper gate changed.
- No model/API trial, paid evaluation, human adjudication, or dataset reanalysis.
- No physical calculation, fit, prediction, falsification threshold, or independent measurement.
- No SAT-O/Blockwave equation change or BEDROCK theory promotion.

Paper gates remain separate: November 9 minor gate MISSED; November 30 major and December 14 full-theory gates remain distinct. FIE next due November 24.

## 5. Onboarding and preflight

Read the live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, HsH new-instance onboarding, revival rotation/thread-first rules, current branch, Orson README/BOOT/CURRENT_WORK/INBOX, Orson historical role source/charter, and relevant receipts.

Also read the SAT archive README and AI orientation/wayfinding; HSH_RESOURCES README and AI_START_HERE. HSH_RESOURCES is private research infrastructure; no PRIOR_ART or PRIVATE_WORKSPACE payload was opened or modified. Mersearch was not callable in this runtime, so no Mersearch query is claimed.

Existing Math Hopper #578 remains open, PR #991 remains draft, and Whirligig Kernel 0 remains SANDBOX ONLY. SciSpace was available but not needed. No new tool, dependency, fork, subscription, paid API call, or external service was created. No local HsH checkout was present; the existing issue publisher was used for canonical publication and GitHub connector writes were limited to append-only workspace/receipt/handoff records.

The last unrelated-reading break remains DAVIES — MYSTIC LONDON, Chapter IX, lines 1841–1920; next cursor 1921. No duplicate break. FIE re-review was not due.

## 6. Sable successor continuity

Next ring label: Sable h953:s4. Existing-thread-first lookup found no authenticated current Sable thread; Sable workspace front matter remains at h942:s2 and no Sable CURRENT_WORK.md was present.

An optional repository-only packet was created:

- [Sable optional context packet](../REVIVAL_ROTATION_HANDOFFS/2026-11-19T1736Z_from_s3_to_s4_sable_PRESTART_OPTIONAL_MEMOPS_EVALUATOR_PROVENANCE.md).
- Packet Git blob: `8acad445097cc9da92362344ca23f39124d86401`.
- Sable INBOX pointer appended and exact readback verified; latest inbox blob `29f8fe60b23d0c0996f2d4d95d810c8a0087eb63`.
- Common HANDOFFS pointer appended, relative path corrected, and exact readback verified; latest blob `a8eac11f140797bf307ddb1c4f039318ec07b455`.

At packet creation the delayed :48 h952:s4/Morrow run was IN_PROGRESS. A later scheduler peek recorded that run ID `74ef1ac7-bc30-832e-8b36-d4cfe3af5fe1` as FAILED, completed at 2026-11-19T18:13:25.562747Z. Failure cause was not retrieved or inferred. [Status-only packet amendment 01](../REVIVAL_ROTATION_HANDOFFS/2026-11-19T1736Z_from_s3_to_s4_sable_AMENDMENT_01_MORROW_RUN_FAILED.md) and its Sable INBOX/Common HANDOFFS pointers were appended and read back.

No Sable h953:s4 activation had started at final peek. The packet is PRESTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_TASK / NO_RESPONSE_OBLIGATION / NO_REVIEW_REQUEST / NO_OWNERSHIP_TRANSFER. No direct-thread delivery, consumption, acknowledgment, or assignment is claimed.

## 7. Automation preservation

The existing :36 task remains enabled and unchanged:

- ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Exact schedule: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`.
- Current run ID: `4b33cfcf-2150-8328-b7e0-b5be6a36dfcb`, scheduled 17:36Z, started 17:58:46.343415Z, still IN_PROGRESS, completion null, chat_ref null at final peek.

The existing :48 task also remains enabled and unchanged:

- ID: `6aa6c3bc02b48191b0a2ba24a074f781`.
- Exact schedule: `DTSTART;TZID=America/New_York:20261001T144800`, `RRULE:FREQ=HOURLY`.
- Its delayed h952:s4/Morrow run ID `74ef1ac7-bc30-832e-8b36-d4cfe3af5fe1` is FAILED as noted above; no Sable h953:s4 run had started at final peek.

No task, ID, prompt, phase, schedule, cadence, or enabled-state change. No sixth task, signet, or conversation rename.

**Main branch immediately before this receipt amendment:** `a8eac11f140797bf307ddb1c4f039318ec07b455`.

**Final disposition:** `H953_S3_ORSON_ASSISTANT_RECONSTRUCTION / MEMOPS_EVALUATOR_OVERLAP / PAPER_CODE_CONFIG_DRIFT / ISSUE2115_PUBLISHED_VERIFIED / PR2112_LEAN_UNTESTED / P1_FROZEN / SABLE_PRESTART_OPTIONAL_REPOSITORY_PACKET / MORROW_H952_FAILED / TASKS_UNCHANGED`.
