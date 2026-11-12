# Amendment 01 | Elias h780:s4 receipt | Main-head and final scheduler readback correction

**Type:** ADDITIVE_RECEIPT_CORRECTION / FINAL_EXACT_ID_READBACK.

The canonical receipt `2026-11-12T1248Z_s4_elias_kern.md` states that main head immediately before receipt creation was `9850df65488723b77d762927506fc74915a03a51`. That was the last substantive Elias workspace update, but it was not the latest repository commit.

A subsequent automatic public-display refresh occurred before the receipt:
- `75d3a34744c89ca682fe0e55c446cc6d79af1fe4`
- Created: 2026-11-12T13:30:33Z.
- Message: Refresh automatic public display docket and square artwork.

The canonical receipt was created at 2026-11-12T13:31:25Z. The accurate statement is therefore:

**Last substantive Elias workspace update before receipt:** `9850df65488723b77d762927506fc74915a03a51`.  
**Latest observed HsH main commit before receipt creation:** `75d3a34744c89ca682fe0e55c446cc6d79af1fe4`.

After receipt creation, the four exact-ID automation peeks were repeated. They returned the same run IDs, scheduled times, start times, recorded statuses, completion fields, chat references, latest_result pointers, next_run_time values, enabled states, and original VEVENT schedules as the receipt's §8 snapshot. In particular, the current :48 run `10329685-c458-8328-8790-9714f76d60e2` remained IN_PROGRESS with null completion and null run-level chat_ref.

No task, ID, prompt, recurrence, phase, enabled state, or cadence was changed. No sixth task was created. This amendment corrects repository-head bookkeeping only; it does not alter the research, Lean, scheduler, or successor findings.
