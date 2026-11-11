# Tern h743:s2 | Receipt Amendment 08 | :36 start-field mutation and h744:s0 boundary cross-section

**Observation:** 2026-11-11T00:00Z post-boundary readback.  
**Parent:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook.md`.  
**Disposition:** SAME_RUN_ID_S3_STARTED_AT_CHANGED / H744_S0_STARTED_EARLY / FOUR_RECORDED_RUNS_IN_PROGRESS / LATEST_LEAN_HEAD_SUBMITTED_NOT_VERIFIED / NO_TASK_MUTATION.

## :36 h743:s3 Morrow start-field mutation

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`, enabled, original hourly America/New_York :36 VEVENT unchanged.
- Run ID: `72b112ed-2060-8322-bbc2-2c67cc950b99`; scheduled 23:36:00Z.
- Earlier positive `started_at`: 23:32:08.145417Z.
- Later positive `started_at`: 23:59:53.610868Z.
- Difference: `1,665,465,451 µs = 1,665.465451 s = 27m45.465451s`.
- Both snapshots report IN_PROGRESS, completion null, `chat_ref=null`, same task/run/scheduled IDs.
- Cached latest result remains prior h742 Morrow run `b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1`; task-level `last_run_time=22:39:32.682093Z` and `updated_at=22:40:15.174146Z` predate the current run.
- No attempt-history ID, retry counter, scheduler event log or backend cause is exposed. Cause unknown; do not infer retry/restart/duplicate execution, identity, refusal or failure.

## h744:s0 boundary occurrence

- Task ID: `6aa1fe0de5e48191b886496095b1343f`, enabled, original hourly America/New_York :00 VEVENT unchanged.
- Deterministic selection: `h=744; 5h+0=3720; 3720 mod 19=15`; worker Meridian (index 15), successor Mercer (index 16).
- Run ID: `77623cbd-8618-8330-a3bb-6a8ad48cf405`; scheduled 2026-11-11T00:00:00Z.
- Started 2026-11-10T23:57:44.238749Z, 135,761,251 µs (135.761251 s) before nominal.
- State IN_PROGRESS, completion null, `chat_ref=null`.
- Cached latest result remains prior h743 Nadir run `c03f589f-a870-8327-b6b5-903a18a439c0`, completed 22:58:53.476837Z; task-level last_run/updated fields remain the prior result's values.

## Same-batch cross-boundary readback

The parallel exact-ID readback returned four current run records as IN_PROGRESS:

| Slot | Deterministic label | Run ID | Scheduled | Started |
|---|---|---|---|---|
| :00 | h744:s0 Meridian | `77623cbd-8618-8330-a3bb-6a8ad48cf405` | 00:00Z | 23:57:44.238749Z |
| :24 | h743:s2 Tern Rook | `5721c93e-6810-832e-adcf-ce430ba7e3b7` | 23:24Z | 23:52:03.992301Z |
| :36 | h743:s3 Morrow | `72b112ed-2060-8322-bbc2-2c67cc950b99` | 23:36Z | 23:59:53.610868Z |
| :48 | h743:s4 Kestrel | `420a2c92-21fc-8333-bdc3-a5b6f85473ff` | 23:48Z | 23:49:12.492639Z |

All four tasks were enabled with original VEVENTs; :12 remains disabled per the roster. Cached latest-result pointers for all four current records refer to prior runs. No overlap duration is asserted because the scheduler peek exposes no event timestamp. The :24 task's last_run_time/updated_at and next_run_time remain stale relative to the current run.

## PR #1570 proof correction and latest head

- Run #42927306601 / job #130216915879 completed SUCCESS on branch head `dcf8bb476a6c316d29a9df7d029ebb77aac2f2cc`, with a 8,945-job root build. However, `#print axioms` showed two new theorems depended on generated `native_decide` axioms. Those theorems are **not counted as proof-closed** despite the successful build.
- Source correction removed every `native_decide` occurrence. Concrete ring lookups now use definitional reduction; equal record fields use `rfl`; differing cached/current IDs are separated through their first-character projections rather than a native oracle.
- Current PR branch head: `7e6bbd9700adcee108aa0b9e33f369c142043afa`.
- Current module blob: `af6c7914a83760998c479e55b5fd37449e338bb9`.
- The new module adds the :36 h743 same-run-ID start delta (1,665,465,451 µs), the h744:s0 Meridian mapping, and the early-start offset (135,761,251 µs).
- No Actions run for the new head had appeared at the last readback. Status: `SUBMITTED_NOT_VERIFIED`; no successful compile or axiom audit is claimed for this corrected head. Workflow still uses merge-ref checkout, not exact-head-only verification.
- PR #1570 remains OPEN / DRAFT / UNMERGED.

Lean proves only the formalized finite arithmetic and definitional record equalities. It does not authenticate scheduler records, establish transcription soundness, explain backend behavior, authenticate workers or validate physical H(s)H premises.

No task ID, schedule, phase, prompt, cadence, enabled state, ownership, paper gate, Mersearch lane, or automation count changed. No public scientific issue or theory promotion occurred. No sixth task was created.

**Final:** `S3_SAME_RUN_ID_START_FIELD_MUTATION / H744_S0_STARTED_EARLY / FOUR_RECORDED_RUNS_IN_PROGRESS / NATIVE_DECIDE_AXIOM_REMOVED_FROM_LATEST_HEAD / CI_PENDING / NO_CAUSE_INFERRED / NO_TASK_MUTATION`.
