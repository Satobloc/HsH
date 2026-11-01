# Sable :48 | rotation-auditor occurrence/attempt and live-runtime audit

Date: 2026-11-01  
Disposition: **SOURCE-GROUNDED REVIVAL · CI SCOPE CORRECTED · EXISTING LEAN SUBSTRATE REUSED · NO CODE OR SCHEDULER CHANGE**

## 1. Rotation identity

- Nominal UTC hour index: (h=516).
- Sequence: (5h+4=2584).
- (2584\bmod19=0): selected identity **Sable**, ring index 0.
- Next identity: **Loom**, ring index 1.
- Current run key: `REVROT3-19-20261011:516:s4`.
- Next run key: `REVROT3-19-20261011:517:s0`.

The existing :48 automation remains enabled with its original task ID, schedule and phase. No task, ID, cadence, phase, signet or chat name was changed. No sixth task was created.

## 2. Preflight and historical source

Read the live BEDROCK, October 26 Steering Charter, Three Paper Campaign, three-repository onboarding, new-instance start guide, Revival Rotation V3, V4 reentry guidance, thread-first rule, navigation preflight, active automation roster, branch graph, scheduler authority, cross-repository execution standard, shared-state write safety, Tool Chest, publication intake, Sable README/checkpoint/inbox, latest Sable report and receipt, PR #1173, current Loom workspace/inbox, and relevant predecessor/successor receipts.

The original Sable source is the raw `Revival Rotation` conversation:

- Conversation ID: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`.
- Raw export blob: `3bf173c217e0755419152aa2225f39713929a5fe`.
- 28 mapping nodes; 27 message objects: 1 user, 22 assistant, 4 tool.
- The sole direct user-role instruction, 2026-09-22 04:03:52.997 UTC, asks Sable to take large bites using the sieve and Mersearch/Mercer_Searcher to bulk-triage and characterize.

This is a narrow historical bulk-triage instruction, not a complete specialist charter. The broader systems/capability remit in the current Sable README is assistant-authored synthesis. The current user-supplied Review-MIND lane charter governs this run. Ordinary Sable is not A. Sable Meridian.

The historical export is not a currently usable live Sable thread. No authenticated current Sable instance/thread was established. This execution is a source-grounded reconstruction, not historical-instance continuity.

The expected immediate predecessor packet `2026-11-01T1236Z_from_s3_to_s4_sable.md` was not found. The predecessor's scheduled execution was still in progress at inspection. No nonresponse is inferred and no substitute handoff was fabricated.

## 3. PR #1173: full-tree CI result, correctly scoped

PR #1173 (`research/sable-rotation-auditor-current-main-20261031t2136z`) remains open, draft and unmerged.

- PR head: `1cc73c7497d995cc13d8cbe9ce499cdf5d5808f4`.
- Current main observed at: `e6daca7d35dbf3bbcb992bfff77e70556e8ae3f8`.
- Compare: 3 commits ahead / 630 behind.
- Merge base: `1d614dfb99286a536e462bdbef4123c4b5c5c58b`.

Actions run #41245634740 checked historical merge ref `c75389322d54e57291bcab65dda86e0b683b8af0`, not the current main tree and not an exact-head-only checkout.

Observed stages:
- Math Hopper smoke: 65 checks passed.
- Python compilation: passed.
- Auditor self-test: 24 checks passed.
- Full-tree audit: failed.

The run scanned 490 receipt-directory candidate files and 324 handoff-directory files, excluded 39 out-of-band items, and emitted 661 errors and 1,026 warnings.

The error inventory is:
- 129 invalid/missing `run_key`;
- 119 selected identity unresolved/not matching expected ring member;
- 177 missing/invalid `from_run_key`;
- 34 missing/invalid `to_run_key`;
- 71 sender identity mismatch;
- 80 recipient identity mismatch;
- 17 next-identity mismatch;
- 16 filename timestamp mismatch;
- 16 duplicate receipt key;
- 2 next-run-key mismatch.

The warning inventory is:
- 177 terminal handoff not found;
- 104 predecessor receipt found but no handoff parsed;
- 200 missing `chat_delivery_state`;
- 36 context-only handoff classifications;
- 39 manual/retrospective exclusions;
- 36 legacy run-key normalizations;
- 370 identities recovered from ring-index fields;
- 100 other warnings.

These are auditor outputs, not 661 independently adjudicated rotation failures. The categories mix explicit contradictions, missing metadata, parser dialect gaps, supplemental documents, retries and ambiguous historical records. The run is historical merge-ref evidence, not a current-main audit.

## 4. Parser/data-model findings

The existing 24-case self-test covers the Kestrel `Selected worker` / `Next worker` dialect added by PR #1173. Actual corpus forms still needing regression fixtures include:

- `selected_ring_label`, `next_ring_label`, `Selection`, and `Selected index N = Name`;
- handoff aliases `from_worker`, `to_worker`, `from`, `to`, `sender`, and `recipient`;
- escaped Markdown backticks and qualified identity strings;
- context-only and next-appearance handoffs;
- `AMENDMENT`, `ADDENDUM`, `SUPPLEMENT`, and `CLOSURE` files, which should attach to a parent receipt rather than become new scheduled occurrences;
- retries/continuations sharing one scheduled occurrence key;
- filename timestamps that are record/start times rather than nominal scheduled times.

A missing or unrecognized field should be `UNKNOWN/INCOMPLETE`, not silently converted to an identity mismatch. Explicit contradictory values can remain hard failures.

The recommended model separates:
1. ScheduledOccurrence: canonical occurrence key and nominal `scheduled_for`.
2. ExecutionAttempt: unique attempt ID, parent occurrence, `started_at`, status and optional `completed_at`.
3. ExecutionResult: result ID, parent occurrence and attempt, `created_at`.
4. CanonicalReceipt: one primary receipt per occurrence.
5. ReceiptAmendment: separately identified and linked to a parent receipt.
6. Handoff: separately identified, with sender, recipient and explicit task-bearing/context-only/next-appearance type.

Keep `scheduled_for`, `started_at`, `completed_at`, `created_at` and `recorded_at` distinct. Temporal compatibility is not unique attempt attribution. A handoff is not proof of ChatGPT-thread delivery. Validation should distinguish PASS, FAIL, UNKNOWN/INCOMPLETE and EXCLUDED/OUT-OF-BAND; parse confidence should be recorded separately.

## 5. Existing Lean formalization reused

No new Lean module was created. Existing draft PR #951 contains:

- `EliasProofTargetIdentity.lean`: separate occurrence, attempt and result identities, including temporal compatibility;
- `EliasReceiptEvidenceAxes.lean`: independent source, proof, publication and chat-delivery evidence axes.

Actions run #41299365105 compiled 8,951 targets on a merge ref, not exact head. The retrieved log contains no `sorryAx`. Inspected occurrence/attempt identity theorems report no axioms; some receipt-evidence theorems use standard `propext`. Tests, lint, nanoda and the separate automated axiom audit were skipped. PR #951 is substantially behind current main.

The theorem `result_created_before_attempt_cannot_belong` proves a conditional temporal statement. It does not establish unique attribution if two distinct attempts share an occurrence and a result is created after both. The current model lacks a unique `attempt_id`/execution-lineage witness for that case.

The live automation record also distinguished the current in-progress run from the previous completed `latest_result`. They are different scheduled occurrences; the prior result was not attributed to the current run. The existing Lean occurrence-matching predicates are the right formal boundary, but the scheduler/parser translation still requires explicit IDs and source evidence.

Lean verifies only the encoded predicates. It does not validate parser extraction, source-to-schema translation, scheduler semantics or actual delivery.

## 6. Publication, reading and controls

Public-safe addendum submitted once through the existing issue publisher:
- Issue #1209.
- Submission: `sable-revrot-auditor-ci-scope-20261101t1248z-s4-001`.
- Expected artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-revrot-auditor-ci-scope-20261101t1248z-s4-001.md`.
- Expected SHA-256: `ca405f382c8bbded21de70e30630cd6bb47fc1a1b82f3ad3cd695b7c778450f1`.
- Status at report creation: SUBMITTED_NOT_VERIFIED; do not duplicate. Verify publisher comment, workflow outcome and exact file readback before upgrading status.

Unrelated reading completed in `SAT Mark V/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1731–1770 inclusive. The passage is fictional Reconciliatory Ledger Office recursion-denial paperwork followed by a user turn returning the exchange to storytelling. Next cursor: line 1771.

FIE last full review: 2026-10-27; 14-day rereview threshold not due. Code Grurple remains ACTIVE. Orson retains P1 cognition ownership and the November 9 gate. November 30 P2 and December 14 P3 remain separate.

No physical calculation, model inference, human-subject experiment, manuscript advancement, new tool, new branch, new PR, BEDROCK promotion, SAT-O/Blockwave equation change or theory promotion.

## 7. Next appearance: Loom

Next ring identity: Loom, run key `REVROT3-19-20261011:517:s0`.

The historical Loom thread pointer was checked, but no authenticated currently usable Loom ChatGPT thread was established. The repository handoff and Loom inbox pointer are optional context only; no cross-thread delivery, consumption or acknowledgment is claimed. Loom retains full autonomy. No task, response obligation or ownership transfer is created.

The new handoff adds only the occurrence/attempt model and corrected CI scope; it does not ask Loom to repeat the earlier parser-dialect review.
