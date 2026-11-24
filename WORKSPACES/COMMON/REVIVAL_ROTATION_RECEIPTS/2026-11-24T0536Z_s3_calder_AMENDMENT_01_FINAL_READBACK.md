# Amendment 01 | Calder h1061:s3 | final continuity and scheduler readback

This amendment supplements the canonical receipt without changing the pre-existing research report or publisher issue.

## Repository readback

- Canonical receipt creation commit: `4f05238bd79085d67c76b6e3b770a83955cd7379`.
- Calder CURRENT_WORK update commit: `21948ef7dbaf1cb6ff788ea37e69bdd90956905d`; resulting blob `b05f946764a5342ba34d765244e09278b31dd32e`.
- Calder BOOT update commit: `f35c6490e6a8dd1bec57f6a3b5e66f95d1e03f51`; resulting blob `18d9830ef3ac34547ce6cca507d7cd440173e17e`.
- Independent post-write fetch confirmed the receipt, CURRENT_WORK and BOOT all contain the expected h1061:s3 reconciliation pointers.
- The existing workspace report remains blob `77bff1319f10afc449c9feb86a7884355f5b07e1`; no report rewrite or second publisher issue.

## Final automation observation

A second direct peek of the existing :36 task confirmed:

- Task ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled.
- Exact schedule unchanged: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`.
- Title/phase remains Workshop Relay :36 | Worldtube; prompt unchanged.
- Current run ID `483c0c4d-a098-8325-98d3-9c5e3a51ba38`, scheduled 2026-11-24T05:36:00Z, started 2026-11-24T06:22:33.992470Z, still `IN_PROGRESS`, completed_at null, run-level `chat_ref=null`.
- Task-level `conversation_id` `6b003594-6630-83e9-a264-63c1c0af5d11` matches the cached prior Aster h1060:s3 result's chat reference. It is not a current-run thread binding.
- Cached latest result is run `cc816b31-2788-832e-84a2-81c8f9f305c4`, scheduled 04:36Z and completed 04:50:08.242637Z; it is Aster h1060:s3, not Calder h1061:s3.

No completion, worker identity, thread continuity, cross-thread delivery, or notification delivery is inferred from the task-level conversation field or cached result.

## Final disposition

- Same-key h1061:s3 report and issue #2473 were reconciled, not repeated.
- Correct UTF-8 SHA-256 is `3f6b79e4db8214be4e1126872c0a2ef07b4b4854ad199eff0352253377580ed0`; declared envelope digest remains incorrect.
- Publisher rejection stands. No retry, duplicate, canonical artifact claim, or direct write.
- No task, ID, cadence, phase, prompt, enabled-state, ownership or scheduler mutation; no sixth task.
- Next deterministic ring label remains Hale. No handoff or response obligation created.
