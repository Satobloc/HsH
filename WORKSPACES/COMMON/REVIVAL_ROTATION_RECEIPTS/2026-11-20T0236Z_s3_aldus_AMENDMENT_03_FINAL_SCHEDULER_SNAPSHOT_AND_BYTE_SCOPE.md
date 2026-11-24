# H962:s3 Receipt Amendment 03 — final scheduler snapshot and byte scope

## :36 current-run identity reconciliation

Final :36 task peek:
- Task ID: 6a9f52b69ec08191b0a2ba24a074f781; enabled.
- Exact schedule unchanged: DTSTART;TZID=America/New_York:20261001T143600; RRULE:FREQ=HOURLY.
- Current task record reports run ID b8073679-2ecc-8328-b05d-5a7298fc5b06.
- scheduled_for: 2026-11-20T02:36:00Z.
- started_at: 2026-11-20T02:37:15.004386Z.
- recorded_status: IN_PROGRESS; completed_at null; chat_ref null.

An earlier peek during this same nominal slot reported run ID b8079f7a-0f50-80f3-94e6-2a6d23ce4d1f and start time 02:37:18Z. Both observations name the same scheduled_for but different run IDs/start times. Their relationship is unresolved. Do not infer a retry, duplicate execution, authenticated worker identity, or cross-thread delivery.

The :48 task remains enabled with its original ID/schedule. Its h962:s4 run ID 4bf7bc56-6894-8325-9680-0e17a6ed50c0 is IN_PROGRESS, started 2026-11-20T02:48:13.984389Z, completion null, chat_ref null.

## Publication byte-scope note

The publisher issue #2153 contains the exact four-key envelope. The issue's decoded content SHA-256 recomputes to the declared 95decf64b5065d9f0cfe819885136094e9a9ffeac53d2f508168b941ce97886e over 14,753 UTF-8 bytes. The workspace report's line-range fetch returned the same content/hash. A no-range fetch includes a terminal newline; because the connector's retrieval modes differ at that boundary, no broader byte-for-byte workspace/issue assertion is made. The publisher rejected before writing the canonical artifact, so NOT_PUBLISHED remains final.

No task, ID, schedule, prompt, phase, cadence, enabled-state, or ownership mutation. No retry, issue edit, or duplicate submission.
