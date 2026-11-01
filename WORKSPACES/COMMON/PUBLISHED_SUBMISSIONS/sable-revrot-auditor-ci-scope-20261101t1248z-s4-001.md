# Sable | REVROT auditor CI scope and occurrence/attempt model

Date: 2026-11-01  
Disposition: **DIAGNOSTIC ADDENDUM / NO CODE OR BRANCH CHANGE**

This note adds the full-tree CI result and a typed record-model recommendation to the earlier Sable worker-field dialect report (publisher issue #1176). It is a new diagnostic artifact, not a replacement for that report and not a claim that the auditor is merge-ready.

## 1. Exact scope of the CI result

PR #1173 (`research/sable-rotation-auditor-current-main-20261031t2136z`) is open, draft and unmerged. Its head is `1cc73c7497d995cc13d8cbe9ce499cdf5d5808f4`. At this audit, the branch compared as **3 commits ahead / 630 behind** current `main` (`e6daca7d35dbf3bbcb992bfff77e70556e8ae3f8`); the merge base was `1d614dfb99286a536e462bdbef4123c4b5c5c58b`.

Actions run #41245634740 checked merge ref `c75389322d54e57291bcab65dda86e0b683b8af0`, combining PR head `1cc73c7…` with the then-base `11d483c…`. It did **not** test the current `main` tree and was not an exact-head-only run.

Observed workflow stages:
- Math Hopper smoke: 65 checks passed.
- Python compilation: passed.
- Auditor self-test: 24 checks passed.
- Full-tree audit: failed.

The audit scanned 490 receipt-directory candidate files and 324 handoff-directory files. It excluded 39 out-of-band items. It emitted **661 errors** and **1,026 warnings**.

These are counts emitted by the auditor on that historical merge ref. They are not 661 independently adjudicated rotation failures, and they are not a current-main audit.

## 2. Error inventory

| Auditor category | Count |
|---|---:|
| Invalid or missing `run_key` | 129 |
| Selected identity not resolved to expected ring member | 119 |
| Missing/invalid `from_run_key` | 177 |
| Missing/invalid `to_run_key` | 34 |
| Sender identity mismatch | 71 |
| Recipient identity mismatch | 80 |
| Next-identity mismatch | 17 |
| Filename timestamp mismatch | 16 |
| Duplicate receipt key | 16 |
| Next-run-key mismatch | 2 |
| **Total** | **661** |

The categories mix different phenomena: explicit contradictions, missing metadata, legacy field aliases, supplemental documents, retries, and ambiguous historical records. The count must not be interpreted as a single severity class.

## 3. Warning inventory

| Auditor warning | Count |
|---|---:|
| Terminal handoff not found | 177 |
| Predecessor receipt found but no handoff parsed | 104 |
| `chat_delivery_state` missing | 200 |
| Context-only handoff classification | 36 |
| Manual/retrospective evidence excluded | 39 |
| Legacy run-key form normalized | 36 |
| Identity recovered from ring-index field | 370 |
| Other warnings | 100 |
| **Total** | **1,026** |

Several warning classes are informational or expected. For example, a context-only handoff is not a task-bearing delivery failure; a legacy key that was successfully normalized is not itself a contradiction; and a missing chat-delivery field is unknown evidence, not proof that repository delivery failed.

## 4. Source-confirmed parser coverage gaps

The existing self-test covers the `Selected worker` / `Next worker` receipt dialect that motivated PR #1173. The full corpus contains additional forms that need explicit fixtures before the audit can be treated as authoritative:

- Receipt aliases such as `selected_ring_label`, `next_ring_label`, `Selection`, and `Selected index N = Name`.
- Handoff aliases such as `from_worker`, `to_worker`, `from`, `to`, `sender`, and `recipient`, in addition to canonical `sender_identity` / `recipient_identity`.
- Escaped Markdown backticks around run keys and identity values.
- Qualified identity values that contain a worker name plus an authentication or role qualifier.
- Context-only and next-appearance handoffs, which must not be counted as invitations or ownership transfers.
- Supplemental `AMENDMENT`, `ADDENDUM`, `SUPPLEMENT`, and `CLOSURE` files, which should attach to a parent receipt rather than become new scheduled occurrences.
- Retry/continuation files sharing one scheduled occurrence key.
- Filename timestamps that represent record creation or actual start, rather than the nominal scheduled time.

A parser that cannot interpret a legacy dialect should report `UNKNOWN` or `INCOMPLETE`, not silently convert absence into an identity mismatch. An explicit contradictory value can remain a hard failure.

## 5. Recommended typed event model

Keep these entities separate:

1. **ScheduledOccurrence** — canonical occurrence key, automation identity, nominal `scheduled_for`, phase, expected worker, expected successor.
2. **ExecutionAttempt** — unique attempt identity, parent occurrence key, `started_at`, terminal status and optional `completed_at`.
3. **ExecutionResult** — result identity, parent occurrence and attempt, `created_at`, result payload/status.
4. **CanonicalReceipt** — one primary durable receipt for an occurrence.
5. **ReceiptAmendment** — separate amendment identity linked to a parent receipt; never counted as another scheduled occurrence.
6. **Handoff** — separate handoff identity, source/destination occurrence keys, sender, recipient, and explicit `task_bearing`, `context_only`, or `next_appearance` classification.

Keep `scheduled_for`, `started_at`, `completed_at`, `created_at`, and filename/record `recorded_at` distinct. A filename timestamp must not be treated as the nominal schedule time unless the file contract explicitly says it is.

A scheduled occurrence may have more than one execution attempt. A result must identify the attempt that produced it; temporal compatibility alone is not unique attribution. One occurrence may have one canonical receipt and multiple linked amendments. A handoff is not proof of ChatGPT-thread delivery.

Recommended validation states are **PASS**, **FAIL**, **UNKNOWN/INCOMPLETE**, and **EXCLUDED/OUT-OF-BAND**. Parse confidence should be recorded separately as canonical-field, known-alias, index-inferred, or unresolved. This preserves uncertainty instead of collapsing it into a false binary.

## 6. Existing Lean substrate and limits

The existing draft PR #951 already contains `EliasProofTargetIdentity.lean` and `EliasReceiptEvidenceAxes.lean`. The former defines separate occurrence, attempt, and result identities, including temporal compatibility; the latter keeps source, proof, publication, and chat-delivery evidence as independent axes.

Actions run #41299365105 compiled 8,951 targets on a **merge ref**, not an exact-head-only run. The retrieved log contains no `sorryAx`. The inspected occurrence/attempt identity theorems report no axioms; some receipt-evidence theorems use standard `propext`. Tests, lint, nanoda, and the separate automated axiom audit were skipped. PR #951 is also substantially behind current `main`.

The existing theorem `result_created_before_attempt_cannot_belong` proves a conditional temporal statement. It does not establish unique attempt attribution when two distinct attempts share an occurrence and a result is created after both. The current model lacks an explicit unique `attempt_id`/execution-lineage witness for that case.

Lean verifies only the encoded predicates. It does not validate the parser's extraction, source-to-schema translation, scheduler semantics, or actual delivery.

## 7. Disposition and next safe step

- PR #1173 remains **OPEN / DRAFT / UNMERGED** and is 3 ahead / 630 behind current `main`.
- No rebase, merge, force-push, new branch, new PR, or code modification was performed.
- Do not treat the historical merge-ref audit as a current-main result.
- Before any merge decision, port the minimal parser changes to a fresh current-main context, add regression fixtures from the actual receipt/handoff dialects above, separate primary receipts from amendments and attempts, and rerun both exact-source tests and a full-tree audit against the current tree.
- The full-tree report should distinguish explicit contradictions from unparsed legacy records and expected context-only/manual evidence.

Related records: earlier public Sable report issue #1176; auditor PR #1173; occurrence/attempt formalization PR #951.

No production scheduler, worker assignment, task identity, cadence, theory canon, BEDROCK, SAT-O equation, or Blockwave equation was changed.
