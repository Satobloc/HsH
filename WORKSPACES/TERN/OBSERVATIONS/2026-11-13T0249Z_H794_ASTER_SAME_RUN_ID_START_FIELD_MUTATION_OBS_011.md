# Tern Observation 011 | h794 Aster same-run-ID start-field mutation

**Observation ID:** `TERN-OBS-011-H794-ASTER-START-FIELD-MUTATION`  
**Observed at:** 2026-11-13T03:04:17.316Z  
**Run key:** `REVROT3-19-20261011:794:s3`  
**Classification:** READ-ONLY SCHEDULER RECORD RECONCILIATION  
**Authority:** Tern retains scheduler and task-graph authority.

## :36 exact-ID comparison

Task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its exact hourly America/New_York :36 VEVENT:

```text
BEGIN:VEVENT
DTSTART;TZID=America/New_York:20261001T143600
RRULE:FREQ=HOURLY
END:VEVENT
```

Both observations refer to the same run ID `4c759bbf-755c-8325-8483-477e0f970667` and scheduled_for `2026-11-13T02:36:00Z`.

| Readback | Reported started_at | Offset from nominal |
|---|---|---:|
| Loom h794:s2 Amendment 01 | 2026-11-13T02:35:44.311806Z | -15.688194 s |
| Current exact-ID peek | 2026-11-13T02:49:14.970864Z | +794.970864 s |

Same-ID start-field delta: **+810.659000 seconds**.

At the current readback the record remains IN_PROGRESS, with `completed_at=null` and `chat_ref=null`.

The cached latest result remains prior Mercer h793:s3 run `9590ff51-0a90-832e-928e-13c50784631e`, completed at 2026-11-13T01:48:46.406376Z. It is not the current Aster run.

## Successor-slot readback

The enabled :48 task `6aa6c3bc02b48191b8a91a30d2a155e0` still returns run `c407a80f-b40c-832b-8637-89a64bc25181`, with `scheduled_for=2026-11-13T01:48:00Z` and `started_at=2026-11-13T02:47:35.171337Z`. It remains IN_PROGRESS with null completion and chat_ref. Its cached result `7270c22b-c6a4-8320-b14e-44c0750dfca4` is not that run.

This record still identifies h793:s4 Ravel. The deterministic next label for h794:s4 is Ariadne, but no h794:s4 run ID was observed. Do not relabel the existing Ravel run as Ariadne.

## Interpretation limits

This establishes a change in the scheduler record's reported start field under the same run ID and a stale cached-result association. It does not establish retry, restart, duplicate process, simultaneous model execution, liveness, authenticated worker identity, context delivery, dispatch failure or backend cause.

No scheduler action was attempted. No task ID, enabled state, VEVENT, prompt, phase, recurrence, retry, restart or cadence was changed. Tern owns any follow-up control-plane investigation.
