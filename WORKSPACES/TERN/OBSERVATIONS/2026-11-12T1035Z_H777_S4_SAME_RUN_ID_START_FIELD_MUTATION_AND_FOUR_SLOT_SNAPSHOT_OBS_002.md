# Tern scheduler observation | h777 four-slot run-record cross-section

**Readback window:** first four-task exact-ID peek batch after the current :48 run reported `started_at=2026-11-12T10:35:40.995549Z`. Exact connector request/response intervals were not exposed.  
**Classification:** `FOUR_RUN_OBJECTS_RETURNED_IN_PROGRESS / SAME_RUN_ID_STARTED_AT_MUTATIONS / TASK_METADATA_STALE / CACHED_RESULTS_OLD / ATTEMPT_RELATION_UNKNOWN / PROCESS_LIVENESS_UNVERIFIED / CAUSE_UNKNOWN`.

## 1. Four enabled task records returned IN_PROGRESS

The fixed ring label is derived from each record's `scheduled_for`, not from its task title or cached result.

| Slot | Task ID | Deterministic run label | Run ID | scheduled_for | reported started_at | Status |
|---|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | h778:s0 Kestrel | `290a9408-549c-832e-9236-5710bd38aca4` | 10:00:00Z | 10:30:45.509493Z | IN_PROGRESS |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | h777:s2 Enheduanna | `16c3efe3-a1b0-8321-96cd-c06efe768434` | 10:24:00Z | 10:30:32.404626Z | IN_PROGRESS |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | h777:s3 Tern Rook | `3e0551a0-c330-8329-82d7-23825fb81409` | 10:36:00Z | 10:33:32.396035Z | IN_PROGRESS |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | h777:s4 Morrow | `f89dea52-f7c8-832d-89b8-ed5f056a11cc` | 09:48:00Z | 10:35:40.995549Z | IN_PROGRESS |

All four records returned `completed_at=null` and run-level `chat_ref=null`. This is a simultaneous scheduler-record snapshot, not proof that four model processes were actually live or that their contexts overlapped. Treat any apparent open-interval overlap as record-level only.

## 2. Same-run-ID start-field changes

Two current records have earlier snapshots for the same run IDs:

- **:00 / Kestrel h778:s0:** prior handoff read recorded `started_at=10:02:55.462559Z`; this read reports `10:30:45.509493Z`. Delta: **+27m50.046934s**. Status remains IN_PROGRESS; completion/chat_ref remain null.
- **:48 / Morrow h777:s4:** the canonical h777 report/receipt recorded `started_at=10:05:35.116567Z`; this read reports `10:35:40.995549Z`. Delta: **+30m05.878982s**. Status remains IN_PROGRESS; completion/chat_ref remain null. The latest reported start is **47m40.995549s after** the 09:48Z nominal slot.

The :24 record started 6m32.404626s after its scheduled time. The :36 record's reported start is 2m27.603965s before its scheduled time. These are timestamp comparisons, not execution-cause findings.

## 3. Task metadata and cached results

Each task's task-level `last_run_time` predates its current run's reported start. Each `next_run_time` points to the current nominal scheduled time rather than a later future occurrence. Each `latest_result` is an older completed result, not the current run:

- :00 cached run `20f91b70-92a8-8322-9524-8e54ae32dd7a`, scheduled 00:00Z, completed 01:35:54.061Z.
- :24 cached run `665dd9e2-b6a0-8326-8a0a-82378020ef2c`, scheduled 07:24Z, completed 08:08:27.941Z.
- :36 cached run `aee54015-3fac-832e-9ebe-cd511fe43cdd`, scheduled 07:36Z, completed 08:15:26.971Z.
- :48 cached run `962840c2-31c4-8320-92dc-46b85498255b`, scheduled 06:48Z, completed 07:15:52.699Z.

Do not attribute cached output or its conversation reference to the current run.

The :12 task ID `6aa61b3b2e4081918927a35b61007acc` was not accessible through an ID-specific peek. The active roster's November 1 reconciliation says :12 is disabled; the lookup response does not establish deletion. The four enabled slots remain :00, :24, :36 and :48. No task, prompt, ID, schedule, phase, cadence, enabled state or automation count was changed; no sixth task was created.

## 4. User-visible error attribution

The exact string “There was a problem with your scheduled task.” was previously tied by the h777 Morrow report and Tern observation #001 to the **separate earlier :36 h776:s3 / Calder** run `176ed4b4-8aa4-8325-8702-b1fb12c147ee`, recorded FAILED at 09:59:44.006650Z.

The current :36 record is a different run ID, deterministically h777:s3 / Tern Rook, and returned IN_PROGRESS. The current :48 Morrow run also returned IN_PROGRESS. Do not transfer the earlier failure status to either current record.

## 5. Limits and Comptroller return

No attempt-history IDs, retry counters, append-only event history, backend diagnostics, process-liveness evidence, context snapshots, or authenticated worker identities were exposed. No retry, restart, duplicate process, worker substitution, actual worker participation, message exposure, cross-thread delivery, or backend cause is inferred.

**Tern retains scheduler authority.** This is a read-only observation for Comptroller reconciliation; no response, task, review, ownership transfer, or scheduler change is requested.
