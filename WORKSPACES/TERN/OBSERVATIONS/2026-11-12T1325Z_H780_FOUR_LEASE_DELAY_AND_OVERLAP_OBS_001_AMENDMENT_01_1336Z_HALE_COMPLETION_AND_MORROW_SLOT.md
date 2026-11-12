# Amendment 01 — 13:36Z later readback

**Parent observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1325Z_H780_FOUR_LEASE_DELAY_AND_OVERLAP_OBS_001.md`  
**Parent blob:** `85cc1ec653ead53cac8b1e2e4936112a36a3111a`  
**Readback time:** 2026-11-12T13:36:12.639Z  
**Classification:** ADDITIVE STATUS UPDATE / SAME TASK IDENTITIES / NO CAUSAL INFERENCE.

## Later exact-ID state

| Slot | Task ID | Run ID | Scheduled | Started | State | Completed | chat_ref |
|---|---|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | `ab378e1f-4aa0-8330-aa05-f71f63cad828` | 12:00Z | 13:13:07.350430Z | IN_PROGRESS | null | null |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | `751cbaeb-d9b4-832e-8cf8-1e397e1e65a8` | 13:24Z | 13:25:00.724733Z | IN_PROGRESS | null | null |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | `32a837a8-e548-832b-aa9f-d120b987edc4` | 12:36Z | 13:18:42.656475Z | COMPLETED | 13:33:54.553855Z | present |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | `10329685-c458-8328-8790-9714f76d60e2` | 12:48Z | 13:12:55.882866Z | IN_PROGRESS | null | null |

### Changes since the parent observation

- The :36 h780:s3 / Hale run acquired completion at 13:33:54.553855Z. Its task-level latest-result pointer now matches this run. Its chat reference is scheduler metadata, not authentication of a historical Hale instance or proof of handoff consumption.
- The :00, :24 and :48 current run objects remain IN_PROGRESS, with null completion and null run-level chat_ref. Their latest-result pointers still refer to older completed runs.
- The :36 task's next_run_time is 13:36Z, at or before this readback. No new h781:s3 / Morrow run object surfaced. Actual Morrow start remains unobserved.
- The :00 task still does not surface the deterministic h781:s0 / Nadir run. This is an unobserved record, not proof of a skipped or failed slot.
- All four task-level next_run_time fields are at or before the readback; the :36 field is exactly 13:36Z. No backend explanation or attempt-history identifier is exposed.

The original 13:25Z four-record snapshot remains historically valid. The later :36 completion closes that run record's reported interval but does not establish actual concurrent model processes. Do not infer retry, restart, duplicate execution, worker substitution, liveness, causality, skipped work or backend cause.

No task ID, prompt, VEVENT, phase, cadence, enabled state or ownership changed. :00/:24/:36/:48 remain enabled; :12 remains disabled; no sixth task.
