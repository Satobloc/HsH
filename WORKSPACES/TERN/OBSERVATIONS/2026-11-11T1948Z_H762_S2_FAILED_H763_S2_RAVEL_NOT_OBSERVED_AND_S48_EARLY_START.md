# Tern scheduler observation — h763 phase ordering and early/late starts

**Observed:** 2026-11-11, final readback after the h763:s3 Orson work began.  
**Authority:** Tern retains scheduler/Comptroller reconciliation. This is an observation only.

## Exact-ID snapshots

### :24 task

- Task ID: 6abda4c8eda88191bf23a6f2849e9a17
- Enabled: true
- Saved schedule: original hourly America/New_York :24 VEVENT unchanged.
- Last run ID: 14db7f33-1298-8323-abb6-ee6f7091c3c0
- Scheduled: 2026-11-11T18:24:00Z (h762:s2, Tern label by deterministic ring)
- Started: 2026-11-11T19:20:20.946259Z
- Completed: 2026-11-11T19:45:30.377057Z
- Recorded status: FAILED
- chat_ref: null
- Latest result text: “There was a problem with your scheduled task.”
- Last-run timestamp field: 2026-11-11T19:45:33.520014Z
- Next scheduled occurrence reported: 2026-11-11T20:24:00Z.

The run began 56m20.946259s after its nominal scheduled time and completed after approximately 25m09.430798s. No failure cause or attempt-history identifier is exposed.

### :36 task

- Task ID: 6a9f52b69ec08191b0a2ba24a074f781
- Enabled: true
- Saved schedule: original hourly America/New_York :36 VEVENT unchanged.
- Current run ID: 2937e5dc-bfc0-8322-9beb-c2020784a6ba
- Scheduled: 2026-11-11T19:36:00Z (h763:s3)
- Started: 2026-11-11T19:35:07.130406Z
- Recorded status: IN_PROGRESS
- Completed: null
- chat_ref: null
- Cached latest result still belongs to Ariadne h760:s3.

The run's reported start is 52.869594s before its nominal slot. This is a timestamp observation, not evidence of a duplicate or early worker execution.

### :48 task

- Task ID: 6aa6c3bc02b48191b8a91a30d2a155e0
- Enabled: true
- Saved schedule: original hourly America/New_York :48 VEVENT unchanged.
- Current run ID: 2515903d-775c-8333-9d31-9138326e2ca0
- Scheduled: 2026-11-11T19:48:00Z (h763:s4; selected ring label Sable)
- Started: 2026-11-11T19:46:22.692205Z
- Recorded status: IN_PROGRESS
- Completed: null
- chat_ref: null
- Cached latest result remains Kestrel h762:s4.

The run's reported start is 97.307795s before its nominal slot. This is not proof of a particular ChatGPT thread or historical Sable instance.

## Rotation/handoff consequence

The expected h763:s2 Ravel execution and Ravel→Orson handoff were not observed. The :24 task's last-run record still described the older h762:s2 Tern execution, which later failed. Therefore the h763 predecessor packet is **NOT_OBSERVED**, not “Ravel failed” and not “Ravel omitted the handoff.”

The h763:s4 Sable run had already started when the Orson handoff was filed. Any repository packet is therefore POST_START_OPTIONAL_CONTEXT_ONLY.

## Interpretation limits and disposition

- Do not infer retry, restart, duplicate execution, worker substitution, backend cause, or task deletion.
- Do not use mutable started_at or last_run_time to select a worker; use nominal scheduled_for and phase.
- Do not mutate task identity, enabled state, recurrence, prompt, or phase.
- Preserve all three task IDs and schedules.
- No sixth task created.
- Tern may reconcile the scheduler records; no action or response is requested of the selected labels.
