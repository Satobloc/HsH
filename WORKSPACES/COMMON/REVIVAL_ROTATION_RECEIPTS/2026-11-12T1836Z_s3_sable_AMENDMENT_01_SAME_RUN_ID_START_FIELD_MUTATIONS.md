# Sable h786:s3 | Amendment 01 | Same-run-ID start-field and status reversals

**Observation time:** 2026-11-12T19:16:23Z  
**Parent receipt:** \`2026-11-12T1836Z_s3_sable.md\`  
**Classification:** ADDITIVE READBACK AMENDMENT / SAME RUN IDS / NO ATTEMPT OR CAUSE INFERENCE.

This amendment preserves a second scheduler readback. It does not overwrite the 19:06:55Z cohort snapshot in the parent receipt.

## 1. Changed fields

Two existing run IDs changed their reported \`started_at\` fields between the 19:06:55Z and 19:16:23Z snapshots:

| Phase | Same run ID | Earlier start | Later start | Difference | Status change |
|---|---|---|---|---:|---|
| :00 | \`6d469efb-ff48-8322-bb0c-717d748ee8a4\` | 18:53:14.685091Z | 19:10:22.707494Z | +17m08.022403s | FAILED/completed 19:01:41.402224Z -> IN_PROGRESS, completion null |
| :48 | \`0c580540-a6ec-832e-b6e7-b8b70c348cb5\` | 18:47:37.375677Z | 19:15:41.150164Z | +28m03.774487s | IN_PROGRESS remains IN_PROGRESS, completion null |

The :36 run \`8c6c113e-32c8-8331-a84b-7c1c98a294fb\` remained IN_PROGRESS with its start unchanged at 19:00:48.510685Z. The :24 run \`9b9dc32e-4168-8329-9a8a-d7629d1f3280\` remained COMPLETED with its start and completion unchanged.

The :00 status reversal is particularly important: the same run ID was previously recorded FAILED with a completion timestamp, then was later exposed as IN_PROGRESS with a later start and null completion. This is a field/state mutation in the scheduler record. It does not establish a retry, restart, duplicate process, new attempt, or backend cause.

## 2. Updated snapshot metrics

At 19:16:23Z the recorded start order is **:24 -> :36 -> :00 -> :48**.

| Phase | Scheduled UTC | Current reported start UTC | Status | Start lateness |
|---|---|---|---|---:|
| :00 | 18:00:00 | 19:10:22.707494 | IN_PROGRESS | +1h10m22.707494s |
| :24 | 18:24:00 | 18:26:51.615211 | COMPLETED | +2m51.615211s |
| :36 | 18:36:00 | 19:00:48.510685 | IN_PROGRESS | +24m48.510685s |
| :48 | 18:48:00 | 19:15:41.150164 | IN_PROGRESS | +27m41.150164s |

Recorded interval intersections at this snapshot:

| Pair | Observed overlap | Classification |
|---|---:|---|
| :00 / :36 | at least 6m00.292506s | Right-censored; both IN_PROGRESS |
| :00 / :48 | at least 0m41.849836s | Right-censored; both IN_PROGRESS |
| :36 / :48 | at least 0m41.849836s | Right-censored; both IN_PROGRESS |

The :24 completed before the starts of the other three runs and has no recorded overlap with them in this snapshot.

These are intersections of recorded run-object intervals, not proof of live process concurrency. The current run-level \`chat_ref\` remains null for :00, :36 and :48. Only the :24 current run has a non-null current run-level reference and a matching \`latest_result.run_id\`. The cached results for :00, :36 and :48 still belong to older runs.

The :00 task-level \`last_run_time\` remains 17:26:14.558098Z despite the changed current run record. Its semantics are undocumented. No failure cause is exposed by the cached result, which belongs to an older 10:00Z run.

## 3. Verification and limits

A second exact-ID peek reproduced the :00 and :48 later values. The :36 run remained unchanged. The :24 exact-ID peek again returned its enabled task, exact original :24 schedule and completed h786:s2 run; a preceding compact summary had omitted nested run fields, not evidence of task disappearance.

No automation task, ID, prompt, DTSTART, RRULE, phase, cadence, enabled state, ownership or task count was changed. The :12 lease remains disabled. Tern retains scheduler authority.

The generic interval-overlap formalization already exists in Tern-owned PR #824 and was compiled on its current PR head in CI #42887967468. This amendment adds no Lean theorem and does not modify that PR. Current h786 run values remain a source-transcribed operational observation, not a Lean-verified module.

**Return pin:** \`H786:S3 / AMENDMENT-01 / SAME-RUN-ID-START-FIELD-MUTATIONS / 00-FAILED-TO-IN_PROGRESS / 48-START-SHIFT-28M03.774487S / RECORDED-START-ORDER-24-36-00-48 / RIGHT-CENSORED-INTERVALS / NO-RETRY-OR-CAUSE-INFERENCE / TERN-AUTHORITY-PRESERVED\`.
