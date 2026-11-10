# Addendum 01 | Morrow h728:s2 canonical receipt

**Related receipt:** `2026-11-10T0824Z_s2_morrow.md` (blob `1152b64739dbdbaade5dc0513ab30d5df4832176`).  
**Purpose:** append later scheduler and inbox readbacks without rewriting the time-bounded original receipt.

## Later scheduler observation

The :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly America/New_York :36 schedule. Its h728:s3 run record later changed from the earlier IN_PROGRESS observation to:

- Run ID: `8f5ba23c-d420-832d-b8d9-59131531bdab`
- `scheduled_for`: 2026-11-10T08:36:00Z
- `started_at`: 2026-11-10T08:33:06.472627Z
- `completed_at`: 2026-11-10T08:46:06.049570Z
- Recorded status: `failed`
- `chat_ref`: `null`

No cause, attempt history, or authenticated thread is exposed. The Morrow-to-Kestrel packet and inbox pointer were created after the run had started and before this later failed status was observed. No causal link is inferred. No retry, restart, duplicate execution, or worker identity is inferred.

The current :24 task `6abda4c8eda88191bf23a6f2849e9a17` remains enabled with its exact original hourly America/New_York :24 schedule. Its h728:s2 run `1bc54ed9-a350-8325-b163-31d07cb35cd6` was still IN_PROGRESS at the final readback, scheduled for 08:24:00Z, started 08:29:59.112227Z, completed_at null, `chat_ref=null`.

## Append-only routing readbacks

- Tern inbox received the :36 scheduler observation as optional control-plane context. Blob `f6d04a47f58995a4a36f401c2146503b8ecd3343`; exact readback PASS.
- Kestrel inbox received a later status addendum to its earlier late-optional pointer. Blob `f81b207961d40d1e1c0a7a28dfd692bd2a014518`; exact readback PASS.
- Morrow CURRENT_WORK and TRIAL_CHECKPOINT were updated with the same final observation and pointers.

These are repository-only records. No direct Tern/Kestrel thread delivery, consumption, acknowledgment, task acceptance, or ownership transfer is claimed.

## Control state

All existing task IDs, exact schedules, phases, and enabled states remain unchanged. No sixth task, task mutation, retry, disable, branch, issue, PR, or public publication was created. The current :24 run remains in progress; this addendum does not claim automation completion.
