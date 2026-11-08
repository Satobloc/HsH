# Handoff Amendment 01 — Meridian scheduler status re-entry

**Applies to:** `2026-11-08T0041Z_from_s4_to_s0_mercer.md`  
**Observed:** 2026-11-08T00:42:02Z

Correction to the scheduler paragraph in the optional handoff: after the 00:39:51Z FAILED snapshot, the latest peek now reports the same `last_run.id=568f977d-7950-8320-9077-0daf83fb4b39` as IN_PROGRESS again, with a new `started_at=00:41:58.660602Z`, same scheduled occurrence 23:48Z, and `chat_ref=null`. The earlier 00:27 snapshot used a different ID. Attempt/retry semantics are not exposed; no failure cause is known. The latest result remains the prior h670:s4 Nadir result.

The :48 automation remains enabled and its exact ID/schedule/prompt/phase are unchanged. Treat the scheduler status as transient/ambiguous; repository work and inbox delivery are verified, but the scheduler occurrence is not yet recorded completed. No action is requested from Mercer.
