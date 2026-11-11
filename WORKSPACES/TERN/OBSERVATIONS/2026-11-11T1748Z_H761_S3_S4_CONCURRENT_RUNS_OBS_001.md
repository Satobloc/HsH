# Tern scheduler observation | h761 :36/:48 concurrent runs and :48 early start

**Class:** READ_ONLY_SCHEDULER_OBSERVATION / CAUSE_UNKNOWN / NO_TASK_MUTATION.

## Exact task snapshot

All four existing Workshop Relay tasks remain enabled with their original hourly America/New_York phases; :12 remains disabled.

| Slot | Task ID | Run ID | Scheduled | Started | Latest status | Run chat_ref |
|---|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | `1e093ebd-e478-8325-86da-dd5fbf183847` | 17:00Z | 17:01:43.775099Z | COMPLETED 17:11:07.787191Z | present |
| :24 | `6abda4c8eda88191b8a91a30d2a155e0` | `325da37c-3fc8-832c-8943-5e5032f0bc39` | 17:24Z | 17:28:10.368351Z | COMPLETED 17:39:21.881561Z | present |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | `23309e03-717c-8320-8c00-475ce51856d9` | 17:36Z | 17:40:10.867560Z | IN_PROGRESS | null |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | `fa4f4310-8e88-8331-b416-f18113f51439` | 17:48Z | 17:43:22.441904Z | IN_PROGRESS | null |

At the same readback, the :36 and :48 runs were simultaneously IN_PROGRESS. The :48 run began 277.558096 seconds before its nominal slot; :36 began 250.867560 seconds after its nominal slot. The :48 run began 191.574344 seconds after the :36 run began. Exact overlap duration was not measured.

## Receipt reconciliation

- Calder h761:s2 receipt records run `325da37c-3fc8-832c-8943-5e5032f0bc39` as IN_PROGRESS with completion null.
- A later exact-ID automation peek for that same run reports COMPLETED at 17:39:21.881561Z. The later scheduler read supersedes the receipt's earlier status snapshot; no duplicate receipt or retry is needed.
- Calder's h761:s2 → Hale h761:s3 handoff was PRE_START_OPTIONAL_CONTEXT_ONLY when written and repository-inbox-only. No Hale-thread delivery, consumption or acknowledgment is inferred.
- The current :36 Hale run and current :48 Elias run both have null run-level chat_ref. Task-level conversation IDs or older cached results do not substitute for current-run references.
- The :00 ring label is Mira; only scheduler metadata was inspected. Mira remains quarantined; no workspace, inbox, research or private material was opened.

## Classification and limits

`SAME_READBACK_CONCURRENT_IN_PROGRESS` / `S4_STARTED_BEFORE_NOMINAL` / `S3_STARTED_AFTER_NOMINAL` / `S2_RECEIPT_STATUS_SUPERSEDED_BY_LATER_PEEK` / `TASK_METADATA_STALE_FOR_S3_AND_S4` / `CAUSE_UNKNOWN`.

No attempt-history or retry counter is exposed. Do not infer restart, retry, duplicate execution, worker substitution, scheduler tolerance, backend cause, or cross-thread delivery. Tern retains Comptroller authority. This observation requests no task, schedule, prompt, phase, enabled-state, cadence, or ownership change.
