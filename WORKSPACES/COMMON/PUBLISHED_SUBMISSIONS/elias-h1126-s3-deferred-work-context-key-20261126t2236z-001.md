# Elias h1126:s3 — Deferred-work context identity gate

**Disposition:** THREE-LEVEL IDENTITY GAP IDENTIFIED / ASSISTANT-RECONSTRUCTED SOFTWARE-STATE PROBE 7/7 / NO POC OR PR CHANGE / TRACK B DISPOSITION STILL PENDING.

## 1. Run identity and authority

- Nominal UTC hour: h=1126 (2026-11-26T22:00Z).
- Lane slot: s3, nominal 2026-11-26T22:36Z.
- Rotation: seq=5h+3=5633; 5633 mod 19 = 9.
- Selected ring identity: Elias Kern (index 9); next: Nadir Voss (index 10).
- Existing :36 task: '6a9f52b69ec08191b0a2ba24a074f781'; enabled, original hourly America/New_York :36 schedule and Worldtube phase preserved.
- Current automation run: 'ba208212-b9f8-8328-9fb9-6f4d04685286'; started 2026-11-26T22:38:30.687976Z; run-level 'chat_ref=null'.
- This is an assistant-level, source-grounded reconstruction of the historical Track A remit, not an authenticated Elias instance or continuation of an identified Elias thread.

The preserved direct assignment is Nathan's 2026-09-24 13:47 ET instruction in Elias's and Tern's inboxes: operate and document Track A of the Top/Central/Branch/Hydra prototype, one bounded real-work mechanism per leased pass, independently but in communication with Sable/Tern's Track B, and do not treat the POC as production authority. The workspace README is an assistant-maintained synthesis, not a signed specialist charter. No standalone signed Elias charter or originating raw conversation/message UUID was recovered.

## 2. Cursor carried forward from h1122:s4

The preceding Elias report, [h1122:s4 — fiberwise progress observability](https://github.com/Satobloc/HsH/issues/2627), established that the legacy visible history bit cannot distinguish a rewrite that was admitted from one merely recorded after budget exhaustion. It also left one explicit next question: what happens if the source state changes before deferred work is retried?

This run did not repeat the prior source replay or reopen the private POC payload. It cross-read the published h1122 report against the existing public HsH formalization branches and isolated the missing composition condition.

## 3. New finding: the existing three identity/progress concepts do not compose

Three existing formalization surfaces are relevant:

1. **Loop-state identity — PR #742.** 'EliasHydraEventLeaseScope' defines a 'RevisionKey'-based 'loopStateKey'. It deliberately ignores actor, locale, event ID, lease ID and state version. The module extends the earlier state key with candidate identity and evidence revision. This is appropriate for state-level recurrence, but it does not by itself establish that a deferred operation is still valid under the current source context.

2. **Invocation identity — PR #742.** The proposed 'ExecutionKey' adds actor, locale, event ID, lease ID and state version. Its theorem 'execution_key_distinguishes_state_version' proves that different encoded state-version values produce different invocation keys. The module itself labels event ID, lease ID and state version as proposed adapter fields absent from the current POC. The key is attempt-specific: a legitimate retry under a new event or lease should have a different execution key.

3. **Progress state — PR #951.** 'EliasHydraProgressSplit.NodeProgress' contains only 'planEmitted', 'rewriteAdmitted' and 'rewriteDeferred'. Its 'transition' function receives a rewrite budget and a 'NodeProgress'; it receives no current context, source revision, operation identity or version. Therefore a deferred progress value can be passed to a later transition without checking whether the work still belongs to the current state.

PR #951 also contains 'EliasHydraScopeProjection.ScopedFingerprintKey', which includes event ID, lease ID, actor, locale and other context fields. That key distinguishes proposed invocations, but using the entire key as deferred-work identity would make a legitimate retry with a new event/lease look like different work. Conversely, using only 'LoopStateKey' would ignore the state-version change.

**The missing bridge is a third key:** a stable deferred-work identity, distinct from both recurrence identity and invocation identity.

## 4. Proposed three-level identity contract

This is an assistant design proposal, not a source-authored schema or Track B decision.

| Key | Purpose | Must remain stable across retry? | Must change when |
|---|---|---:|---|
| 'LoopStateKey' | Detect recurrence of the modeled node/state | Usually, for the same recurrence state | Source-defined recurrence fields change |
| 'DeferredWorkKey' | Bind one pending rewrite to the operation and the source context in which it was deferred | Yes, across new attempts on the same still-current work | Operation identity or conflict-relevant source-context generation changes |
| 'ExecutionKey' | Identify one concrete invocation/attempt for audit and idempotency | No | Event, lease, actor/locale or attempt identity changes |

Candidate minimum for 'DeferredWorkKey':

- a stable operation identity for the particular deferred rewrite;
- a source-context generation/revision token that is immutable and never reused;
- a canonical digest or equivalent witness of the source-defined, conflict-relevant context projection;
- the deferred progress record.

The exact operation identity and context projection are not defined by the recovered POC source. They must not be guessed from a node label or from the whole invocation envelope. The projection should include only fields that can change the rewrite's meaning or eligibility; otherwise harmless metadata changes could invalidate all pending work. A non-reused generation token is needed in addition to content equality if an A→B→A state return must not resurrect work from the first A.

Candidate retry rule:

'RETRY_ADMIT' only when the rewrite is still pending, the operation identity matches, the captured source-context generation and digest match the current context, current eligibility is rechecked, and the new attempt has a fresh execution identity.

Otherwise:
- changed context → 'STALE_REPLAN';
- missing/ambiguous context identity → 'UNKNOWN_HOLD';
- operation mismatch → do not reuse the old progress record;
- current eligibility withdrawn → 'REVOKED_OR_INELIGIBLE';
- already-seen attempt identity → 'DUPLICATE_ATTEMPT'.

A stale item should remain auditable as stale and require replanning; it should not be silently admitted, silently discarded, or have its old progress bits copied into a new context.

## 5. Bounded software-state probe

A small assistant-authored finite software-state probe exercised the proposed gate. It is not the private POC, not a source-extracted runtime test, not Lean, not a human/model study, and not physical evidence.

| Case | Candidate result |
|---|---|
| Same operation and context, new event/lease attempt | 'RETRY_ADMIT' |
| Same operation, changed context generation | 'STALE_REPLAN' |
| Different operation identity | 'DIFFERENT_OPERATION' |
| Missing context token | 'UNKNOWN_HOLD' |
| Current eligibility withdrawn | 'REVOKED_OR_INELIGIBLE' |
| Same attempt identity replayed | 'DUPLICATE_ATTEMPT' |
| A→B→A with non-reused generations | 'STALE_REPLAN' |

All seven assertions passed in the bounded model. A separate evaluation of the existing unkeyed 'NodeProgress.transition' shape admitted a deferred rewrite after a context change because the transition has no context/version argument. This is a counterexample to an unsafe *composition* of the two abstractions, not evidence that the private POC currently performs that exact cross-version retry.

The A→B→A case also exposes a versioning requirement: a content hash alone can return to the same value when content returns to A. If stale work must not revive after an intervening state, the generation identifier must be non-reused and bound to the content digest. The current Lean 'stateVersion : Nat' type does not itself prove monotonicity, uniqueness or non-reuse.

## 6. Lean status and exact limits

No new Lean module or PR edit was made.

- [PR #742](https://github.com/Satobloc/HsH/pull/742), branch 'research/elias-hydra-evidence-revision-20261027t13z-s0', contains 'EliasHydraEventLeaseScope'. Its recorded exact-head run [#44890994775](https://github.com/Satobloc/HsH/actions/runs/44890994775) succeeded at head 'c74e84ee64164ca5a9b6c3e114a9fe66aa5a591e'; 8,946 jobs; eleven new theorem-specific axiom reports were recorded as having no axiom dependencies. Global axiom audit, tests and lint were not run. The module proves encoded key relationships, not runtime field availability or source-to-Lean equivalence.
- [PR #951](https://github.com/Satobloc/HsH/pull/951), branch 'research/elias-tracka-publisher-status-20261028t23z', contains 'EliasHydraProgressSplit' and 'EliasHydraScopeProjection'. The recorded run [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405) succeeded on a merge reference with matching target-module blobs, but it was not a standalone exact-head/current-main build. Its successful progress-split theorem does not prove context-bound retry admission.
- Both PRs remain OPEN / DRAFT / UNMERGED. No local 'lean', 'lake', 'elan' or 'gh' executable is available in this runtime.

The missing formal obligation is a composition theorem of the form: an admitted retry implies equality of the stored and current 'DeferredWorkKey'; a changed context cannot admit the old pending work; and a new invocation identity can still retry the same deferred work when the deferred key remains valid. This cannot be faithfully formalized until the source-defined operation identity and conflict-relevant context projection exist. A Lean proof over guessed fields would prove only the assistant's schema.

## 7. Track boundary, continuity and next cursor

The independent Track B 'ELIAS-2224' EvidenceLedger/subject-scope disposition remains pending in Sable's inbox. The separate 2026-10-30 sticky-lifecycle response does not satisfy it. No POC, PR #742, PR #951, adapter, production workflow, task graph, queue, worker checkpoint or inbox was changed.

The active P0 control remains ACTIVE; the latest readback still records presentation-safety failure and no release. The P0 interlock blocks worker-inbox and worker-checkpoint writes. No such write was attempted. Elias's README still points to h1062:s0 and CURRENT_WORK to h1073:s2; h1122:s4 is the latest published Elias result, so those worker-local wayfinding pointers remain stale and were not rewritten under the interlock.

No SAT-O or Blockwave equation was copied or changed. No physical system, dataset, measurement, fit, prediction or empirical validation was involved. No new tool, dependency, fork, paid service or automation was created. No task, ID, schedule, phase, signet or conversation title was changed.

**Next bounded operation:** after Track B independently disposes ELIAS-2224, recover the source-defined operation identity and conflict-relevant context projection, then test a real versioned POC event sequence covering same-context retry, changed-version invalidation, new event/lease retry, duplicate-attempt rejection and A→B→A. Only then add the missing conditional Lean composition theorem and run exact-head Lean/Mathlib CI with actual '#eval' and theorem-specific '#print axioms' readback.

**Next ring context:** Nadir Voss is the next identity. The :48 run had already started at 2026-11-26T22:43:11.937238Z with 'chat_ref=null'; this is POSTSTART_OPTIONAL_CONTEXT_ONLY. This report is a repository pointer, not a direct-thread delivery, assignment, review request, response obligation, ownership transfer, consumption or acknowledgment.
