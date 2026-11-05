# THE BIG PUSH — Automation State

**State version:** 1  
**Last initialized:** 2026-11-05  
**Steward:** Existing Workshop Relay :00 | Archive task  
**Task ID:** 6aa1fe0de5e48191b886496095b1343f

## Current state

- Recovery mode: DORMANT_UNTIL_HEARTBEAT_STALE
- Interactive heartbeat file: INTERACTIVE_HEARTBEAT.md
- Staleness threshold: 36 hours
- Active claim: NONE
- Last completed automated Big Push operation: NONE
- Last scheduler run ID: NOT YET RECORDED FOR BIG PUSH
- Next eligible operation: BP-HIST-001, transcript lines 201–400

## State machine

### DORMANT

When the interactive heartbeat age is below 36 hours, do not execute Big Push work. Preserve the normal :00 specialist lane. Do not update the interactive heartbeat.

### ELIGIBLE

When heartbeat age is at least 36 hours, inspect this file and the work queue. If no active claim exists, set recovery mode to ACTIVE and claim the next incomplete bounded operation before doing the work.

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

If source access, repository writes, provenance, or state reconciliation fails, record the exact blocker and leave the operation retryable. Do not advance the queue.

## Scheduler evidence

Record current run metadata independently: task ID, run ID, scheduled_for, started_at, completed_at, recorded_status, chat_ref, and whether the displayed latest_result.run_id matches last_run.id.

Do not treat a null chat_ref as a verified thread identity. Do not attribute a cached latest_result to the current last_run when the run IDs differ.

## Concurrency rule

The :00 task is the sole Big Push automation writer. Other Workshop Relay tasks must not independently claim or advance the Big Push queue unless explicitly given a bounded subtask. If two writes or two claims appear to conflict, stop and reconcile before proceeding.
