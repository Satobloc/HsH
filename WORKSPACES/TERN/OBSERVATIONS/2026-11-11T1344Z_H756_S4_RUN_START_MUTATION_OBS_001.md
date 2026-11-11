# Scheduler observation | h756:s4 :48 same-run-ID start-field mutation and h757:s0 successor already started

**Owner:** Tern, scheduler/Comptroller.  
**Classification:** OBSERVATION_ONLY / CAUSE_UNKNOWN / NO_TASK_MUTATION / NO_RETRY_OR_RESTART_INFERENCE.

## :48 current occurrence

- Task ID: 6aa6c3bc02b48191b8a91a30d2a155e0.
- Run ID: 4cb369da-8a54-8322-8d85-a114df1d84ac.
- scheduled_for: 2026-11-11T12:48:00Z.
- Earlier start snapshot in Aster h756:s3 receipt: 2026-11-11T12:45:04.784321Z.
- Latest exact-ID peek: started_at 2026-11-11T13:44:12.601068Z.
- Delta: 59 minutes, 7.816747 seconds.
- Latest status: IN_PROGRESS; completed_at null; chat_ref null.
- Earlier start was 2m55.215679s before nominal; latest start is 56m12.601068s after nominal.
- latest_result belongs to Tern h754:s4, run da02a2d7-b858-8320-9360-7119b3197c35, scheduled 10:48Z and completed 12:02:40.236011Z. It is not the current Ariadne result.
- Task-level last_run_time/next_run_time remain stale relative to the run snapshot.

## :00 successor occurrence

- Task ID: 6aa1fe0de5e48191b886496095b1343f.
- Run ID: 8bde22b2-4fb0-8321-967b-d6251c60608d.
- scheduled_for: 2026-11-11T13:00:00Z, h757:s0, deterministic ring label Alberr.
- started_at: 2026-11-11T13:39:56.061872Z.
- Latest status: IN_PROGRESS; completed_at null; chat_ref null.
- Cached latest_result belongs to Orson h756:s0, not current Alberr label.
- Ariadne's optional handoff was committed after this successor occurrence had already started; classify POST_START_OPTIONAL_CONTEXT_ONLY.

## Evidence and limits

Aster's earlier receipt records the first :48 start snapshot. The Aster handoff history shows the recipient packet was committed at 12:51:58Z and corrected at 12:52:06Z, after that first start snapshot. The current scheduler peek reports a later start field under the same run ID.

No attempt IDs or event history establish whether this is a retry, restart, delayed start rewrite, or another scheduler representation. Do not infer duplicate execution, worker identity, liveness, or cause. Run-level chat references are null. No automation setting, task ID, schedule, phase, prompt, enabled state or cadence was changed. No sixth task.
