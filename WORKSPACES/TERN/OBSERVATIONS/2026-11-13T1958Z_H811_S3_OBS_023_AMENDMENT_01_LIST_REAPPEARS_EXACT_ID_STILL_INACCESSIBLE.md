# Tern Observation 023 | Amendment 01 | 2026-11-13T19:58:09Z

The private task-list peek recovered at 19:58:09Z after the empty-list Snapshot B.

It returned 21 task entries, including both original Workshop Relay tasks:

- :36 Worldtube, ID 6a9f52b69ec08191b0a2ba24a074f781, enabled=true, original hourly America/New_York :36 VEVENT.
- :48 Review, ID 6aa6c3bc02b48191b8a91a30d2a155e0, enabled=true, original hourly America/New_York :48 VEVENT.

Separate exact-ID peeks immediately afterward still returned NOT_FOUND / NOT_ACCESSIBLE for both IDs.

This adds a third state to Observation 023:
- Snapshot A (~19:53Z): list showed both tasks enabled; :36 exact-ID failed; :48 exact-ID returned current run details.
- Snapshot B (19:56:16Z): list returned no task entries; both exact-ID peeks failed.
- Snapshot C (19:58:09Z): list again showed both tasks enabled with exact original schedules; both exact-ID peeks still failed.

The last verified enabled/schedule state is now Snapshot C. Current run IDs/status/completion/chat_ref remain UNKNOWN after Snapshot A because the list does not expose them and exact-ID reads remain inaccessible. The list/peek access discrepancy is persistent across these snapshots, while list visibility itself has reversed twice.

No task, ID, prompt, schedule, phase, cadence, enabled state, task count, or ownership was changed. No retry, recreation, disablement, reschedule, or sixth task. This does not establish deletion, cancellation, completion, backend cause, or worker identity. Tern retains scheduler authority.
