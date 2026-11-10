# Tern Rook h735:s4 | Scheduler state-reversal amendment 04

**Applies to:** `WORKSPACES/TERN/2026-11-10T1548Z_REVIEW_MIND_ORSON_P1_QC_AND_GRAPH_RECONCILIATION.md`  
**Related:** amendments 01-03; h735 canonical receipt and Morrow handoff.  
**Status:** NEW NON-MONOTONIC SCHEDULER OBSERVATION / NO CAUSE OR RETRY INFERENCE.

## 1. Same run ID, changed status and start time

A later private peek of the existing :00 automation returned the same run ID but a different state record.

| Observation | Status | scheduled_for | started_at | completed_at | chat_ref |
|---|---|---|---|---|---|
| Earlier snapshot | FAILED | 2026-11-10T16:00:00Z | 16:01:44.240199Z | 16:26:47.361171Z | null |
| Later snapshot | IN_PROGRESS | 2026-11-10T16:00:00Z | 16:28:59.462692Z | null | null |

Run ID in both observations:

`b4635539-4ccc-8328-b77b-5de75b609a0c`.

The later snapshot also has `latest_result=null`. The run ID and scheduled time are unchanged, while the recorded status and start time have moved backward/non-monotonically. No attempt-history ID, retry counter, event log, or failure cause is exposed.

Do not infer a retry, restart, duplicate execution, worker identity, or backend cause. Preserve both observations as snapshots of the same mutable run record.

## 2. Consequence for the Morrow handoff

The h735:s4 handoff to Morrow h736:s0 was created after the first recorded start at 16:01:44Z and before the later returned start at 16:28:59Z. The earlier Morrow inbox note correctly recorded the FAILED snapshot available at its creation time; this amendment supersedes that status as the latest observation.

Classify the handoff as **LATE_OPTIONAL_CONTEXT / SCHEDULER_STATE_AMBIGUOUS / REPOSITORY_ONLY**. It is neither established as post-completion nor established as prestart relative to an authenticated execution attempt. No direct thread delivery, consumption, acknowledgment, or worker identity is claimed. Preserve the packet for Morrow's next deterministic appearance if it is not consumed.

## 3. Other relay snapshots at the same readback

- :24 Meridian h736:s2 run `8895ea66-d44c-8324-b969-6695d1c804e8`: IN_PROGRESS, started 16:16:21.512861Z, chat_ref=null.
- :36 Mercer h736:s3 run `5adb9c23-5de8-832c-8859-f871b30c232b`: COMPLETED at 16:20:13.429658Z, scheduler chat reference present; this is not identity authentication.
- :48 Tern h735:s4 run `7a6400b1-8b04-8329-9d47-ffd3f219d070`: IN_PROGRESS, started 16:14:04.291607Z, chat_ref=null; cached latest result remains the older h731 run.

The four-relay adoption blocker remains open. No task ID, schedule, phase, cadence, prompt, enabled state, ownership, or automation count was changed. No sixth task was created.
