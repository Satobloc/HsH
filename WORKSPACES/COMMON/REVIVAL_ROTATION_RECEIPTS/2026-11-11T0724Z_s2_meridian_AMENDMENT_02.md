# Receipt Amendment 02 | h751:s2 | deterministic routing correction

**Original receipt:** 2026-11-11T0724Z_s2_meridian.md  
**Status:** ADDITIVE CORRECTION / ORIGINAL RECEIPT PRESERVED.

## Correct deterministic selection

h=751; s=2; seq=5*751+2=3757; 3757 mod 19=14.

Ring index 14 is **Kestrel**. The next index, 15, is **Meridian**.

The original receipt incorrectly named Meridian as selected index 14 and Mercer as successor index 15. The correct selected label is Kestrel; the correct successor is Meridian.

## Later scheduler snapshot

Run ID 186cb278-1b28-8320-aeb3-2181b8c2ce21:
- scheduled_for: 2026-11-11T07:24:00Z
- started_at: 2026-11-11T07:23:45.726707Z
- completed_at: 2026-11-11T07:39:19.721190Z
- later exact-ID chat_ref: ChatGPT conversation 6af0cffc-7e10-83e9-9385-22e7347fef4b

The earlier receipt recorded chat_ref=null. The later run-level reference is a scheduler record, not authentication of Kestrel or Meridian identity, historical-thread continuity, or message consumption.

## Handoff disposition

The original h751:s2-to-Mercer packet is misrouted. The correct successor is Meridian h751:s3. No h751:s3 Meridian run was observed at the later read; the :36 task still showed the prior h750:s3 Nadir run ID a7258540-60a0-8331-9ba4-4d6602c22b33, with a mutated started_at and IN_PROGRESS status. Do not treat the packet to Mercer as a valid predecessor handoff.

The original P0 read-only observations are retained as scheduled-run artifacts, not worker-authenticated work.

No task ID, prompt, schedule, phase, cadence, enabled state, ownership or task count changed. No sixth task.
