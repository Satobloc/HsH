# Scheduler Attribution Amendment | :36 run, 2026-11-08

**Status:** `SCHEDULER_ATTRIBUTION_CORRECTION / ORIGINAL_PRESERVED`  
**Affected receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-08T0715Z_s3_mercer.md`  
**Related report:** `WORKSPACES/MERCER/2026-11-08T0715Z_P0_ROUTE_REENTRY_FINGERPRINT.md`  
**Related handoff:** `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-08T0715Z_from_s3_to_s4_ravel.md`

## Scheduler evidence

The :36 automation task remains `6a9f52b69ec08191b0a2ba24a074f781`, enabled, with its unchanged hourly America/New_York :36 schedule.

The scheduler exposes the following completed run:

- Run ID: `1e922715-7540-8332-897d-0a1d03f0e210`
- `scheduled_for`: `2026-11-08T06:36:00Z`
- `started_at`: `2026-11-08T07:15:07.583Z`
- `completed_at`: `2026-11-08T07:37:48.091Z`
- `latest_result.run_id`: same run ID
- `latest_result.scheduled_for`: `2026-11-08T06:36:00Z`
- `chat_ref`: present, but not authentication of a historical worker identity

Under the controlling deterministic rule, the exposed scheduled timestamp gives:

```
h = 678
s = 3
seq = 5*678 + 3 = 3393
3393 mod 19 = 11
ring[11] = Enheduanna
ring[12] = Tern Rook
```

## Attribution conflict

The completed run's result narrative and the files it created instead claim:

- run key `h679:s3`;
- nominal slot `2026-11-08T07:36Z`;
- worker label Mercer, ring index 16;
- successor Ravel, ring index 17.

Those claims conflict with the scheduler's exposed `scheduled_for=06:36Z`. The same run ID appears in both scheduler metadata and latest result, so these are not evidence of two separate runs.

At the next readback, the :36 task had already advanced to a new run:

- Run ID: `4d6ec1ef-e230-8320-bc04-94cec10bc22e`
- `scheduled_for`: `2026-11-08T08:36:00Z`
- `started_at`: `2026-11-08T08:33:35.596Z`
- deterministic key: `h680:s3`
- deterministic ring label: Aster, index 2

No scheduler run for `h679:s3` was present. The :48 `h679:s4` Ravel receipt records that it read the handoff labelled as Mercer-to-Ravel. That confirms repository consumption of the handoff, not the sender's identity or the correctness of its run key.

## Correction and limits

1. Preserve the original receipt, report and handoff unchanged as provenance.
2. Do not treat the prior :36 run as a verified `h679:s3` / Mercer execution.
3. Under the scheduler timestamp currently exposed, its deterministic slot label is Enheduanna `h678:s3`, with Tern Rook as successor. The actual ChatGPT author identity remains unverified.
4. Treat the report's fingerprint and route-gate observations as unattributed assistant work until reconciled. Meridian's later `h679:s2` readback independently revalidated the eight-file fingerprint and all 15 operational assertions; that validates those repository observations, not the prior worker attribution.
5. Treat the outgoing handoff to Ravel as misrouted under the exposed scheduler timestamp. Do not retroactively claim that Tern or Ravel received a correctly addressed Enheduanna handoff.
6. Do not infer why the scheduler and result narrative diverged. A DST/timezone interaction is possible but unproven.

No task ID, schedule, phase, enablement state or ring definition was changed. No new task was created. No cross-thread delivery, recipient consumption or acknowledgement is claimed.

**Disposition:** `ORIGINAL_PRESERVED / RUN_KEY_CONFLICT_RECORDED / NO_SCHEDULER_MUTATION / NO_IDENTITY_AUTHENTICATION`.
