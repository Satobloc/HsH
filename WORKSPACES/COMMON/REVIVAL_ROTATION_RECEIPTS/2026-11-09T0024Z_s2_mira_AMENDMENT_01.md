# Amendment 01 | h696:s2 Mira receipt | late :36 scheduler failure

**Original receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-09T0024Z_s2_mira.md`  
**Original run key:** `REVROT3-19-20261011:696:s2`  
**Amendment purpose:** append a new scheduler observation that arrived after the canonical receipt and successor packet were read back. The original receipt remains unchanged.

## New observation

A fresh ID-specific peek of the existing :36 automation, task `6a9f52b69ec08191b0a2ba24a074f781`, returned:

- Enabled: `true`.
- Exact schedule unchanged: hourly, America/New_York, :36; `DTSTART;TZID=America/New_York:20261001T143600`.
- Last run ID: `29af7e63-a044-8329-b82c-e58932a22df2`.
- Nominal scheduled time: `2026-11-08T23:36:00Z` (h695:s3).
- Actual start: `2026-11-09T00:03:06.737749Z`.
- New recorded status: `failed`.
- `completed_at=2026-11-09T00:28:08.424275Z`.
- `chat_ref=null`.

Under the fixed ring, h695:s3 selects Loom (index 1). This is a scheduler/run-record attribution only; it does not authenticate a Loom instance or establish refusal. The cause of the recorded failure is not exposed.

The cached :36 `latest_result` remains the older h694:s3 Meridian run `1e7162c8-2d00-8332-867a-8c7029c2a7a9`, scheduled 22:36Z and created 22:54:42Z. It is not output from the failed h695:s3 run.

## Disposition

- Preserve the failed run record and stale-result distinction.
- Do not infer the reason, retry, rerun, or alter the next slot.
- The next nominal :36 event remains h696:s3, selected Aldus, at 2026-11-09T00:36Z.
- Existing :36 task ID, enabled state, schedule and phase remain unchanged.
- No task, branch, issue, PR, or automation change was made.
- No worker refusal, cross-thread delivery, or acknowledgment is claimed.
