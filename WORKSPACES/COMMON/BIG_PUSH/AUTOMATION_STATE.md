# THE BIG PUSH — Automation State

**State version:** 1  
**Last reconciled:** 2026-11-05  
**Proposed steward:** Existing Workshop Relay :00 | Archive  
**Task ID:** 6aa1fe0de5e48191b886496095b1343f

## Deployment status

**Deployment status: NOT INSTALLED**

The repository-backed recovery state machine is designed, but the :00 task prompt overlay is not installed. An update was attempted on 2026-11-05 and rejected with the platform response: **“Your current plan allows only 3 scheduled tasks.”**

A current inspection found four enabled hourly relays (:00, :24, :36, :48). Their task IDs, schedules, phases, and enabled states remain unchanged. No task was paused or deleted. The platform limit prevents the prompt update while the current schedule count exceeds the plan allowance.

**Consequence:** the existing :00 task is not yet instructed to read this workspace. The 36-hour restart trigger is therefore a design, not an active automated guarantee. Human-directed sessions can still resume the project by following BOOT.md.

## Intended state machine after installation

### DORMANT

When the interactive heartbeat age is below 36 hours, the :00 steward should not execute Big Push work. It should preserve its normal specialist remit. It must not update the interactive heartbeat.

### ELIGIBLE

When heartbeat age is at least 36 hours, the :00 steward should inspect this file and the work queue. If no active claim exists, set recovery mode to ACTIVE and claim the next incomplete bounded operation before doing the work.

### ACTIVE

Perform no more than one bounded operation per scheduled occurrence. Before starting, write the claim with:
- task ID;
- scheduler run ID, if available;
- scheduled_for and started_at;
- operation ID and exact cursor;
- claim time and expected completion condition.

Then execute the operation and write its receipt. Update the work queue and cursor. Mark the claim COMPLETE and clear it. Do not update the interactive heartbeat.

If the scheduler restarts the same run ID, inspect the claim and existing artifact before repeating work. Never repeat a completed operation merely because the scheduler reports another start.

### HUMAN_RETURN

When a human-directed Big Push session refreshes the heartbeat, pause automated Big Push continuation at the next safe boundary. Preserve any unfinished claim with its precise state and return the active tray to the human operator. Do not erase work or fabricate completion.

### BLOCKED

If source access, repository writes, provenance, scheduler integration, or state reconciliation fails, record the exact blocker and leave the operation retryable. Do not advance the queue.

## Scheduler evidence

Record current run metadata independently: task ID, run ID, scheduled_for, started_at, completed_at, recorded_status, chat_ref, and whether the displayed latest_result.run_id matches last_run.id.

Do not treat a null chat_ref as a verified thread identity. Do not attribute a cached latest_result to the current last_run when their run IDs differ.

## Concurrency rule

The :00 task is intended to be the sole Big Push automation writer after installation. Other Workshop Relay tasks must not independently claim or advance the Big Push queue unless explicitly given a bounded subtask. If two writes or two claims appear to conflict, stop and reconcile before proceeding.

## Current state

- Recovery mode: NOT_ARMED
- Interactive heartbeat file: INTERACTIVE_HEARTBEAT.md
- Staleness threshold after installation: 36 hours
- Active claim: NONE
- Last completed automated Big Push operation: NONE
- Last scheduler run recorded for Big Push: NONE
- Next eligible operation: BP-HIST-001, transcript lines 201–400


## External Workshop Relay observation — 2026-11-05 11:20Z

This is an observed failure of the existing :24 Geometry task, not a Big Push automation run and not proof of a Big Push context cutoff.

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`
- Scheduled occurrence: `2026-11-05T10:24:00Z`
- Calculated hour: `h=610`
- Ring calculation: `(5*610+2) mod 19 = 12`, selecting Tern Rook; next ring label Morrow.
- Run ID: `566bd9a6-9f9c-8332-85cc-7c6b95125a61`
- Started: `2026-11-05T10:53:40.168464Z`
- Completed: `2026-11-05T11:18:43.489400Z`
- Recorded status: `failed`
- chat_ref: `null`
- Displayed latest_result run ID: `f692fed0-7ef4-8333-9dee-d39ac7db5e53` (does not match current last_run)
- Exact failure cause: UNKNOWN. A conversation/context limit is possible but not established by this scheduler record.

The :24 task remains enabled with its hourly :24 America/New_York schedule and original task ID. No task was modified. The failed occurrence is not treated as a completed research operation, and no cached older result is attributed to it.
