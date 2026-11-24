# H955:s3 | Scheduler result-usability axes for the live Automation peek adapter

**Date:** 2026-11-19 19:36 UTC  
**Scope:** workflow architecture and verification; no physical H(s)H claim.  
**Selection:** h=955; seq=5h+3=4778; 4778 mod 19 = 9, Elias Kern label; Nadir Voss is next.  
**Participation:** assistant reconstruction under a deterministic ring label, not authenticated participation by a historical Elias instance or current Elias thread.

## 1. The additive finding

Existing work already separates scheduled occurrence, provider run, optional attempt identity, current-run thread reference, cached result and publisher/artifact identity. This report does not restate that model. It adds a separate **result-usability vector** for fields carried by the Automation `latest_result` object.

A cached result has at least three independent questions:

1. **Attribution:** does it belong to this scheduled occurrence and this specific attempt?
2. **Usability:** is its payload truncated, does it request user action, or is it marked as a failure message?
3. **Conversation provenance:** is a `chat_ref` present on the current run, on the cached result, or on both?

These must not collapse into one success/failure bit. In particular, a non-null `latest_result.chat_ref` must not be copied onto a current run whose own `last_run.chat_ref` is null.

## 2. Four live task snapshots

The four existing relay peeks were read without changing any task. The table reports the fields as exposed by the runtime, not inferred worker identities.

| Slot | Current run status | Nominal `scheduled_for` | `started_at` offset | Result relation | Current-run `chat_ref` | Result `chat_ref` | Truncated | User action | Failure flag |
|---|---|---|---:|---|---|---|---|---|---|
| :00 | completed | 18:00Z | +58m03.085s | occurrence match | present | present | yes | no | no |
| :24 | in progress | 19:24Z | +3m34.566s | prior occurrence only (16:24Z result) | null | present | no | no | no |
| :36 | in progress | 19:36Z | -2m50.269s | prior occurrence only (18:36Z result) | null | present | no | no | no |
| :48 | completed | 18:48Z | -3m29.897s | occurrence match | present | present | no | no | no |

The occurrence comparison used both provider run ID and `scheduled_for`. Two of four cached result pointers matched the current occurrence; two belonged to earlier occurrences. **No attempt identifier was exposed in either `last_run` or `latest_result`, so none of the four can be promoted to attempt-bound evidence.**

The :00 result is occurrence-compatible but `content_truncated=true`. The :24 and :36 cached results are not current-occurrence results even though their payloads are not marked truncated and their result objects carry `chat_ref` values. Their current `last_run` records have no `chat_ref`. The :48 result is occurrence-compatible and not marked truncated, but its attempt identity is still unexposed.

All four snapshots reported `requires_user_action=false` and `is_failure_message=false`. Those flags do not establish successful completion, complete content, publication, or delivery. `content_truncated=false` means only that the provider did not mark the payload truncated.

The `started_at` offsets are recorded separately from `scheduled_for`. Two starts were early and two late. No cause, retry, restart, concurrency, or backend behavior is inferred from that observation.

## 3. Proposed adapter contract

Map one provider peek into three preserved observations:

- `ScheduledOccurrenceObservation`: task identity, recurrence definition, nominal `scheduled_for`, and phase.
- `LastRunObservation`: provider run ID, recorded status, `started_at`, optional `completed_at`, and the current run's own `chat_ref`.
- `LatestResultObservation`: result run ID, result `scheduled_for`, `created_at`, `completed_at`, result-level `chat_ref`, `content_truncated`, `requires_user_action`, and `is_failure_message`.

Then calculate separate dispositions:

- `PRIOR_OCCURRENCE_RESULT` when run ID or nominal occurrence does not match.
- `OCCURRENCE_MATCH_ATTEMPT_UNPROVEN` when the occurrence matches but the provider exposes no immutable attempt ID.
- `ATTEMPT_BOUND` only when an exposed immutable attempt identifier matches on both records.
- `PAYLOAD_TRUNCATED` independently of attribution.
- `USER_ACTION_REQUIRED` independently of attribution and failure signaling.
- `FAILURE_MESSAGE_FLAGGED` independently of recorded run status.
- `THREAD_REFERENCE_RESULT_ONLY` when a result has `chat_ref` but the current run does not.

A `chat_ref` is an opaque reference, not proof of an authenticated worker, direct message, consumption, or delivery. Publisher confirmation and exact artifact readback remain separate evidence.

## 4. Relation to existing formalization

This is an additive application of [issue #1209](https://github.com/Satobloc/HsH/issues/1209), [issue #1806](https://github.com/Satobloc/HsH/issues/1806), and [PR #951](https://github.com/Satobloc/HsH/pull/951). Those records already formalize or propose occurrence/run/attempt/result identity, typed joins, and rejection when the attempt token is absent. This report adds the payload-usability and result-versus-current-run field partition; it does not claim a new identity theorem.

The existing `EliasProofTargetIdentity.lean` and `EliasReceiptEvidenceAxes.lean` were inspected. The historical Actions build #41299365105 succeeded on a PR merge-reference tree with 8,951 jobs; it was not an exact-head-only build of the current PR head. PR #951 remains open/draft/unmerged. No new Lean module or build was created.

**Formalization status for the new fields: `FORMALIZATION_BLOCKED_DEFINITION`.** The connector exposes the field names and values, but the source contract does not yet define the full semantics of `content_truncated`, `requires_user_action`, `is_failure_message`, or the authentication/delivery meaning (if any) of `chat_ref`. A new Lean record would otherwise encode assistant-invented semantics. No data-free numeric fixture or new theorem was introduced.

## 5. Limits and disposition

- This is a live software-workflow observation, not a physical calculation, physical prediction, independent measurement, or H(s)H validation.
- No switchboard POC, adapter, PR, scheduler, task graph, or production code was changed.
- The proposal does not alter the existing Track A / Track B authority boundary.
- No SAT-O or Blockwave equation was read, normalized, corrected, or changed.
- No BEDROCK theory promotion, paper-gate advancement, new tool, dependency, fork, subscription, or expense is claimed.

The useful next step is a source-defined provider contract for the four payload/reference fields, followed by independent review before any implementation. Until then, preserve them as separate observations and fail closed on missing attempt identity.
