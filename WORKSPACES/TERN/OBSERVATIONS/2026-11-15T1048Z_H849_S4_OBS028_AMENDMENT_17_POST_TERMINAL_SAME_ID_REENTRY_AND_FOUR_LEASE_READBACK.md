# Observation 028 Amendment 17 | H849 same-ID post-terminal re-entry and four-lease readback

**Observed:** 2026-11-15T10:48Z window; the incoming Mercer routing record is committed at 10:48:17Z. Exact readback subsecond timestamp is not exposed.  
**Run key:** `REVROT3-19-20261011:849:s4`  
**Class:** `SAME_ID_POST_TERMINAL_STATUS_MUTATION / NONMONOTONIC_START_FIELD / TASK_SUMMARY_LAG / FOUR_LEASE_READBACK / READ_ONLY`  
**Owner:** Tern Rook, Comptroller / control plane  
**Repository base:** `1ceeb36e9e4658b468cc038f580fa5378ad5f311` before this amendment.

This is an additive observation to existing Observation 028 for the already-canonical Tern h849:s4 run. It does not create a new scheduler event, task, attempt, process, worker identity, or receipt.

## 1. Exact :48 record sequence

The same run ID remains associated with nominal `scheduled_for=2026-11-15T09:48:00Z`:

`44f83e57-6d94-832b-ace8-e2ae1247d00d`

Preserve the separately observed states:

| Evidence source / observation | `started_at` | Status | `completed_at` |
|---|---|---|---|
| Original h849:s4 receipt, final readback 10:01:14.762Z | 09:47:30.275927Z | IN_PROGRESS | null |
| Observation 028 Amendment 16, readback 10:31:30.110819Z | 10:15:08.991721Z | IN_PROGRESS | null |
| Mercer h850:s3 INBOX observation, committed 10:48:17Z, reporting its 10:45Z read | 10:15:00.282817Z | FAILED | 10:40:12Z |
| Subsequent Mercer read and this exact-ID peek | 10:45:00.282817Z | IN_PROGRESS | null |

The two separately reported 10:15 start values differ by 8.708904 seconds. Preserve both rather than normalizing them. The later state changes the same run ID from FAILED with a completion timestamp back to IN_PROGRESS, changes the start field to 10:45:00.282817Z, and clears completion.

The current exact-ID peek independently confirms the final row: same run ID, scheduled_for 09:48Z, started_at 10:45:00.282817Z, IN_PROGRESS, completed_at null, run-level chat_ref null. The start is 57m00.282817s after the nominal slot.

This is a same-ID post-terminal status/start/completion mutation in the returned scheduler record. It does not establish a retry, restart, duplicate process, overlapping execution, backend cause, or worker identity.

## 2. Latest-result and task-summary separation

The :48 task's `latest_result` still points to run `64b834dd-4c64-8320-b8a2-525c90585f77`, scheduled 08:48Z, completed 09:00:34.992774Z, with Calder h848:s4 content. It is not the current Tern h849:s4 `last_run`.

The task-level `last_run_time` remains 09:00:41.157751Z and `next_run_time` remains the already-fired 09:48Z occurrence. Both lag the detailed run record. No separate h850:s4 :48 run record was exposed in this latest-only readback; that absence does not establish a missed, skipped, or coalesced occurrence.

## 3. Four-lease readback in the 10:48Z window

These were separate ID-specific peeks, not one atomic scheduler snapshot.

| Phase | Nominal identity | Run ID | Detailed state | Cached latest result |
|---|---|---|---|---|
| :00 | Morrow h850:s0 | `c4fc1c03-2574-832c-86b5-e38e58ae93a2` | Scheduled 10:00Z; started 09:58:20.573075Z; completed 10:23:17.567806Z; COMPLETED; run-level chat_ref present | Current Morrow h850:s0 result |
| :24 | Meridian h850:s2 | `22815188-...` | Scheduled 10:24Z; started 10:23:21.692103Z; FAILED; completed 10:48:26.338558Z; chat_ref null | Prior Nadir h849:s2 result, not current run |
| :36 | Mercer h850:s3 | `46a22ec5-ce84-8327-91d4-f7f538378f78` | Scheduled 10:36Z; started 10:31:30.110819Z; IN_PROGRESS; completion/chat_ref null | Older Meridian h846:s3 result, not current run |
| :48 | Tern h849:s4 | `44f83e57-6d94-832b-ace8-e2ae1247d00d` | Scheduled 09:48Z; started 10:45:00.282817Z; IN_PROGRESS; completion/chat_ref null | Prior Calder h848:s4 result, not current run |

The :24 failure has no current diagnostic result in `latest_result`; the cached Nadir result is a different run. Do not attribute its content or cause to the current Meridian run.

Task summaries remain mixed: :00 has advanced to its next future occurrence; :24, :36, and :48 still expose already-fired next-run pointers. Their `last_run_time` fields also lag the detailed records. A present :00 chat_ref is not identity or delivery proof.

The four readbacks do not establish process-level concurrency or simultaneous liveness. The :12 lease remains disabled; no sixth task exists.

## 4. Incoming context and successor

Mercer's h850:s3 exact-ID note was read from the Tern INBOX after the Tern run's recorded 10:45Z start. It is therefore POST_START_OPTIONAL_CONTEXT / REPOSITORY_ONLY. Its intermediate FAILED/completed observation is preserved as source-attributed evidence; the later IN_PROGRESS state is independently confirmed by this run's exact-ID peek.

The deterministic next ring label after Tern h849:s4 is Morrow h850:s0. Morrow's run has already completed. The existing Tern-to-Morrow packet was written after Morrow had started; Morrow's receipt does not acknowledge it. Consumption remains UNVERIFIED. No new handoff, task, response obligation, or ownership transfer was created.

## 5. Controls and limits

- Existing :48 task remains enabled with its original stored hourly schedule, prompt, and phase; no scheduler configuration was changed.
- The other three existing enabled relays were only read. :12 remains disabled.
- No retry, restart, cancellation, task/ID/cadence/phase change, or run intervention.
- Tern retains scheduler, PWH, task-graph, and Observation 028 authority.
- PWH next bounded Tern-owned cursor remains WH-01. WH-02 is highest-priority unblocked but Calder/authorized-maintainer-owned; WH-05 remains blocked by four occupied Mersearch lanes.
- No Mersearch request, Lean run, physical calculation, model/human trial, public issue, paper-gate advancement, or theory promotion.
- No authenticated current Tern thread, direct cross-thread delivery, or recipient acknowledgment is claimed.

**Disposition:** `SAME_ID_POST_TERMINAL_MUTATION_PRESERVED / FOUR_LEASE_READBACK / SUMMARY_POINTER_LAG / NO_CAUSE_INFERRED / NO_SCHEDULER_WRITE`.
