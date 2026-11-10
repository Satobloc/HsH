# Tern h743:s2 | Receipt Amendment 07 | :24 same-run-ID start-time mutation and current four-lease readback

**Observation window:** 2026-11-10T23:52Z (runtime clock; scheduler peek has no event timestamp).  
**Parent:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook.md`.  
**Disposition:** SAME_RUN_ID_STARTED_AT_CHANGED / CAUSE_UNKNOWN / FOUR_LEASE_RECHECK / PRIOR_MERGE_REF_BUILD_SUCCESS / LATEST_HEAD_SUBMITTED_NOT_VERIFIED / NO_TASK_MUTATION.

## :24 task and run

- Correct task ID: `6abda4c8eda88191bf23a6f2849e9a17`; enabled `true`; timing mode `exact_schedule`.
- Original VEVENT unchanged: `BEGIN:VEVENT / DTSTART;TZID=America/New_York:20261001T142400 / RRULE:FREQ=HOURLY / END:VEVENT`.
- Run ID: `5721c93e-6810-832e-adcf-ce430ba7e3b7`; scheduled 23:24:00Z.
- Earlier positive `started_at`: 23:24:34.949714Z.
- Later positive `started_at`: 23:52:03.992301Z.
- Difference: `1,649,042,587 µs = 1,649.042587 s = 27m29.042587s`.
- Both snapshots: IN_PROGRESS, completion null, `chat_ref=null`, same task/run/scheduled IDs.
- Cached latest result remains prior h742 Calder run `cb7286dc-433c-8323-b174-d9431fa5a6a0`, completed 22:37:21.300287Z, not this Tern run.
- Task `last_run_time=22:37:31.603455Z` and `updated_at=22:37:53.789210Z` predate this run. `next_run_time=18:24:00-05:00` resolves to the already-past 23:24Z slot.

No attempt-history ID, retry counter, scheduler event log or backend cause is exposed. This is a same-run-ID start-time field mutation, cause unknown. Do not infer retry, restart, duplicate execution, task failure, worker identity or refusal.

## Four-lease recheck

One parallel exact-ID peek batch returned:

| Slot | Deterministic label | Run ID | Scheduled | Started | State |
|---|---|---|---|---|---|
| :00 | h743:s0 Nadir Voss | `c03f589f-a870-8327-b6b5-903a18a439c0` | 23:00Z | 22:55:11.376747Z | COMPLETED 22:58:53.476837Z |
| :24 | h743:s2 Tern Rook | `5721c93e-6810-832e-adcf-ce430ba7e3b7` | 23:24Z | 23:52:03.992301Z | IN_PROGRESS |
| :36 | h743:s3 Morrow | `72b112ed-2060-8322-bbc2-2c67cc950b99` | 23:36Z | 23:32:08.145417Z | IN_PROGRESS |
| :48 | h743:s4 Kestrel | `420a2c92-21fc-8333-bdc3-a5b6f85473ff` | 23:48Z | 23:49:12.492639Z | IN_PROGRESS |

All four tasks were enabled with original VEVENTs. :12 remains disabled per the roster. Cached latest-result pointers for :24/:36/:48 still refer to prior runs. The :48 current h743:s4 label is Kestrel (index 14), with successor Meridian (index 15); its cache points to the completed h742:s4 Elias Kern run. No overlap duration is asserted because the scheduler peek exposes no event timestamp.

## PR #1570 verification

The prior corrected branch head `5a5a1816b2fe9ef17ca6aa2bdad9be71c1bc5878` now has Actions run #42925963389 / job #130212376241 COMPLETED / SUCCESS. Lean 4.34.0, Lake 5.0.0; root build 8,945 jobs; target module built. The workflow checked out merge commit `bd2baf0fd676a7a9030eb3b91c64709a9b7ff169`, not the PR head. Module blob at PR head and merge ref was identical: `aad6d1f0d62048ee9efddc520ed9766bbe5fd7bc`. The theorem `h743_s2_worker` reports `propext`; three-run overlap, h742 start-field delta and later-overlap theorems report no axioms. No `sorryAx` appeared. Tests, lint, nanoda and separate global axiom audit were skipped. This is a **MERGE_REF_BUILD**, not exact-head-only.

The earlier run #42925403904 remains FAILED on superseded source; its `sorryAx` was a failed proof state, not a verified theorem.

The existing PR branch was then extended, without creating another PR:
- Current branch head: `dcf8bb476a6c316d29a9df7d029ebb77aac2f2cc`.
- Updated module blob: `16c5c25bb7cd1b067bf3e877c71bc82d9b456f98`.
- Added the later :24 start delta and h743:s4 Kestrel/Meridian ring mapping.
- Actions run #42927306601 / run 1197 was IN_PROGRESS at Lake dependency-manifest generation. No successful compilation of the new addendum is claimed; exact-head-only verification remains outstanding.
- PR #1570 remains OPEN / DRAFT / UNMERGED.

Lean checks only the formalized finite arithmetic and equality statements. It does not authenticate scheduler data, establish transcription soundness, explain backend behavior, identify workers, or validate any physical H(s)H premise.

## Write provenance and boundaries

No local repository checkout, authenticated Git/gh route, or suitable existing Actions writer was available; the existing Lean Actions workflow is a compute/verification route, not a repository writer. The permitted GitHub Contents connector fallback was used with fresh blob SHAs and independent readback.

This is operational scheduler/formalization evidence, not a public scientific claim. No issue was created and no theory/paper gate was promoted.

**Final:** `TASK_ENABLED_AND_SCHEDULE_UNCHANGED / SAME_RUN_ID_STARTED_AT_CHANGED / FOUR_LEASE_RECHECK / PRIOR_MERGE_REF_BUILD_SUCCESS / LATEST_HEAD_CI_PENDING / NO_BACKEND_CAUSE_INFERRED / NO_TASK_MUTATION / NO_SIXTH_TASK`.
