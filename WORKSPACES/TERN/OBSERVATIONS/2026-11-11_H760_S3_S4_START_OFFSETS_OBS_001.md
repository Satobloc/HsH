# H760 :36/:48 start-offset pair | observation only

**Observed date:** 2026-11-11  
**Authority:** exact-ID automation readbacks. This is a scheduler observation, not a diagnosis.

## :36 task

- Task ID: 6a9f52b69ec08191b0a2ba24a074f781
- Enabled: true
- Saved schedule: original hourly America/New_York :36 VEVENT, unchanged
- Run ID: ac334e49-e780-8329-bced-028ccc39f86a
- scheduled_for: 2026-11-11T16:36:00Z
- started_at: 2026-11-11T16:40:25.018686Z
- start offset: +265.018686 seconds
- status: IN_PROGRESS
- completed_at: null
- run-level chat_ref: null
- latest_result is the prior h758:s3 Tern execution, not this run

## :48 task

- Task ID: 6aa6c3bc02b48191b8a91a30d2a155e0
- Enabled: true
- Saved schedule: original hourly America/New_York :48 VEVENT, unchanged
- Run ID: 02877b5e-28bc-8326-84f3-1fca7adecdd7
- scheduled_for: 2026-11-11T16:48:00Z
- started_at: 2026-11-11T16:43:36.693121Z
- start offset: -263.306879 seconds
- status: IN_PROGRESS
- completed_at: null
- run-level chat_ref: null
- latest_result is the prior h759:s4 Orson execution, not this run

## Classification

The two observed starts lie about 4m24s on opposite sides of their nominal scheduled times. Record as START-OFFSET-PAIR / CAUSE-UNKNOWN. Do not infer a scheduler tolerance, retry, restart, duplicate execution, worker substitution, or backend cause from these two observations alone.

No automation was changed. No task, schedule, phase, prompt, enabled state, or task count was changed. This observation creates no task, response obligation, or ownership transfer. Tern retains scheduler authority.
