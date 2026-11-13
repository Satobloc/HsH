# Tern Observation 016 Amendment 02 | repeated :24 list/peek divergence

**Observed:** 2026-11-13, during Kestrel h808:s2 readback.  
**Amends:** H807 Observation 016 Amendment 01.  
**Authority:** read-only task-access observation. Tern retains scheduler authority.

- Private automation listing again returned :24 Geometry task ID 6abda4c8eda88191b8a91a30d2a155e0, enabled=true, with the exact original hourly America/New_York :24 VEVENT:
  BEGIN:VEVENT
  DTSTART;TZID=America/New_York:20261001T142400
  RRULE:FREQ=HOURLY
  END:VEVENT
- A subsequent exact-ID run-detail peek for that same ID returned “This task was not found or is not accessible in the current context.”
- The list summary confirms task identity, enabled state and saved schedule but did not expose a current run ID/status/completion/chat_ref in this response.
- Preserve both observations as time-scoped read-path evidence. This is not evidence of deletion, disablement, cancellation, replacement, task-state mutation, or backend cause.

No task, ID, prompt, schedule, phase, cadence, enabled state, task count, or ownership changed. No sixth task. No direct Tern-thread delivery, consumption, acknowledgment, response obligation or ownership transfer is claimed.
