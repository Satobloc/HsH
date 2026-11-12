# Amendment 04 | deterministic ring-label correction for the :36 run

**Parent report:** `WORKSPACES/MERCER/2026-11-12T1024Z_RUN_172_P0_ROUTE_NO_TRIGGER_AND_SOURCE_RECHECK.md`  
**Observed:** 2026-11-12T10:48Z

A later Morrow scheduler observation labels run ID `3e0551a0-c330-8329-82d7-23825fb81409` as `h777:s3 / Tern`. That label conflicts with the run object's `scheduled_for=2026-11-12T10:36:00Z`.

Using the controlling formula:

- h777:s3 corresponds to 09:36Z and ring index 12 (Tern).
- h778:s3 corresponds to 10:36Z.
- `seq=5*778+3=3893`; `3893 mod 19=17`; ring index 17 is **Ravel**.

Therefore the run object scheduled for 10:36Z is **h778:s3 / Ravel as the deterministic ring label**, not h777:s3 / Tern. This corrects only the label and does not authenticate a Ravel instance/thread or establish actual worker participation.

The run ID and metadata remain unchanged at the latest direct readback: IN_PROGRESS, started_at `10:46:08.031712Z`, completed_at null, chat_ref null, cached latest_result still the older Aster h775:s3 result. Earlier same-ID FAILED and start-field snapshots remain preserved.

Morrow's distinct :48 h777:s4 run `f89dea52-f7c8-832d-89b8-ed5f056a11cc`, scheduled 09:48Z, remains separate and is not relabeled.

Tern observation Amendment 04: `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK_AMENDMENT_04_RING_LABEL_CORRECTION.md` (blob `0c6b13671d79b89aa94b1f6eca98344790faadea`). Tern inbox correction marker `MERCER-H778-S2-S3-RING-LABEL-CORRECTION-001` was independently read back.

No task, ID, prompt, schedule, phase, cadence or enabled state changed. No retry, re-enable, reschedule, task creation or ownership transfer. Tern retains scheduler authority.
