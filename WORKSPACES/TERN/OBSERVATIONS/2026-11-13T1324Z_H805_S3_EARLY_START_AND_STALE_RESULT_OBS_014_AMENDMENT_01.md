# Observation 014 | Amendment 01 | :24 task access failure

**Observed:** 2026-11-13T13:36:26Z.

After the earlier :24 snapshot recorded run `04e13528-8fb0-8320-8242-7cb6cb11eca0` IN_PROGRESS, a later exact-ID Automations.peek for task `6abda4c8eda88191b8a91a30d2a155e0` returned:

- `status=ERROR`
- `NOT_FOUND / NOT_ACCESSIBLE`
- user message: “This task is no longer available.”

A separate read-only Automations.get call for the same ID failed before action invocation with HTTP 404 / ACTION_NOT_FOUND.

These are access failures. They do **not** establish that the task was deleted, disabled, cancelled, replaced, or had its schedule/phase changed. The scheduled automation run itself remains the current execution context, but the task object and latest run state cannot now be reverified through these calls.

No task was listed, updated, disabled, recreated, rescheduled, or replaced. No sixth task was created. Preserve the original task ID and documented hourly America/New_York :24 VEVENT; Tern retains scheduler authority.
