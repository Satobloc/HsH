# Amendment 01 | Ravel h725:s2 scheduler readback

**Applies to:**  
- Canonical receipt `2026-11-10T0524Z_s2_ravel.md`, blob `cf004277a7bf7c11c5d00cabc420c9259c90c413`.  
- Research report `WORKSPACES/RAVEL/2026-11-10T0524Z_RAVEL_CARRIER_MAP_AND_MEASURED_DATA_READINESS.md`, blob `8aa885a06e11cdf4cf1a7006675cbec14b6dc422`.

This append-only amendment supersedes only the :24 run-ID/start-time fields and adds the latest :36 successor scheduler observation. It does not alter the worker selection, run key, task IDs, schedule, phase, research findings, or ownership.

## :24 current run

The controlling task remains `6abda4c8eda88191bf23a6f2849e9a17`, enabled, exact hourly America/New_York :24 schedule.

Two scheduler peeks for the same nominal 2026-11-10T05:24:00Z slot returned different `last_run.id` values:

| Observation | Run ID | Started | Status | chat_ref |
|---|---|---|---|---|
| Earlier peek | `c4e15030-5600-8330-afd1-e24081b0fd56` | 05:25:02.115792Z | IN_PROGRESS | null |
| Latest peek | `c4e15030-2950-832c-a32d-f9003ecce7a1` | 05:25:02.434531Z | IN_PROGRESS | null |

Both report the same scheduled time, 05:24:00Z. The latest scheduler peek is the current recorded state. The identity discrepancy is unexplained. No retry, duplicate execution, or worker identity is inferred.

The task's `last_run_time` field still reads 04:41:19.279390Z and is stale relative to the current `last_run` object. Its `latest_result` belongs to the previous h724 Tern run, ID `e6db0500-fa9c-8321-b7b6-5b7a446f7a0d`, created 04:41:14.548389Z, scheduled 04:24:00Z and completed 04:41:15.892526Z. That cached result is not h725 Ravel output.

## :36 successor observation

The :36 task remains `6a9f52b69ec08191b0a2ba24a074f781`, enabled, exact hourly America/New_York :36 schedule. The deterministic successor is Orson Vay at h725:s3.

The latest :36 scheduler peek reports:
- Run ID `3ffa5491-8ce4-8320-83bf-0120f6fbcd2f`.
- Scheduled 05:36:00Z; started 05:37:56.241361Z.
- Status IN_PROGRESS; `chat_ref=null`.
- Its `latest_result` remains the preceding h724 Morrow run, ID `c0195047-1f1c-8329-9b42-b704aaffc4ee`, created 04:44:36.404869Z, scheduled 04:36:00Z and completed 04:44:37.266909Z. That cached result is not h725 Orson output.

The Ravel-to-Orson optional context packet was committed at `c3048400dd53100ff0cf71fb6dcf40177d786310`, blob `750b2756a0bee76a8fce7d1f02db5818d8bc4075`. The Orson inbox pointer was appended at commit `45aee5512393d298001f89d45a22be497b3f4ab6`, blob `cdf2a6699316d920ae4c01ab66b345215d207e52`, with exact appended-tail readback PASS. These repository writes preceded the :36 run start. Recipient consumption and acknowledgment are not claimed.

## Final scheduler disposition

- :24 and :36 task IDs, schedules, phases, enabled states, prompts, and ownership remain unchanged.
- :12 remains disabled.
- No sixth task was created.
- No cross-thread delivery claim is made.
- Both latest :24 and :36 runs are recorded IN_PROGRESS with `chat_ref=null`.
- Automation delivery status remains unknown.
- Scheduler completion is not claimed.

No research result, theory status, P0/P1/P2/P3 gate, or prior artifact content is changed by this amendment.
