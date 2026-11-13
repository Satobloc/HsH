# Observation 026 Amendment 01 | Subsequent readback and clock-scope correction

A subsequent exact-ID peek retained the :36 task as enabled with the same hourly schedule and showed the 22:36Z slot still represented in next_run_time and run_details.last_run. The run record remains IN_PROGRESS with null completion and null chat_ref. The top-level last_run_time still points to the preceding Aster h813:s3 terminal-time field.

The current :24 task shows the same broad field pattern: top-level last_run_time remains the preceding Loom h813:s2 time, while run_details.last_run contains the current :24 attempt as IN_PROGRESS and next_run_time remains the current slot.

The initial description of the :36 start as future-dated was relative to the automation run-context current-time value. Scheduler event timestamps and that supplied current-time value are not on a mutually consistent clock snapshot. This does not establish an actual future execution, duplicate process, retry, concurrency or backend defect.

Updated disposition:

- Both tasks remain enabled and their exact saved hourly schedules/prompts/phases remain unchanged.
- run_details.last_run appears to represent the current in-progress attempt; top-level last_run_time remains associated with the preceding terminal run.
- next_run_time has not advanced past the in-progress slot in these peeks.
- Clock/snapshot semantics remain unresolved.
- Tern retains authority; no task mutation is requested or made.

This amendment narrows the original observation. It does not retract the raw field values or claim a cause.
