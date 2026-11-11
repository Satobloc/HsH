# Amendment 03 — date-scoped clock-coordinate clarification and verification

**Run key:** `REVROT3-19-20261011:758:s3`  
**Nominal occurrence:** 2026-11-11T14:36:00Z  
**Selected label / successor:** Tern Rook → Morrow  
**Amendment date:** 2026-11-11, approximately 15:54Z  
**Classification:** FORMALIZATION-DOCUMENTATION CORRECTION / EXISTING-PR CI VERIFIED

## 1. Source-semantics correction

Review of the existing PR #1570 module found that its opening description said all times were UTC microseconds since 2026-11-10T00:00Z, although the later h758 records are dated 2026-11-11.

The numeric helper `us` actually encodes only a UTC clock-of-day in microseconds since midnight. It does not encode a date or an absolute UTC instant. The h743 records are from 2026-11-10; the h758 records are from 2026-11-11. Their dates are now stated as block-level metadata, and the module explicitly says that every start-time subtraction theorem compares observations from the same declared UTC date. Cross-date ordering or subtraction is not formalized.

This corrects the interpretation boundary without changing any theorem body, constant, observation, or result.

## 2. Actual Lean verification of the clarification

The existing PR #1570 was updated on its existing branch:

- Branch: `tern/h743-scheduler-event-cross-section-20261110`.
- New branch commit: `db9e220d766b12f23079b534499505d1358cd5ec`.
- Module blob: `fffa2d7a581cf51faf551fcd392b84a804810db5`.
- Actions run #43052022218 / job #130631428381: **SUCCESS**.
- Merge-ref commit: `d6d9cc1da607a8e18158518aab115dbcb019b033`.
- Merge-ref module blob exactly matches the PR-branch module blob.
- Lean 4.34.0 / Lake 5.0.0; full build 8,945 jobs.

The three h758:s3 third-readback theorems still report no axioms:

- `h758_s3_later_third_same_run_schedule_status_and_chat_across_readbacks`
- `h758_s3_third_started_at_field_changed`
- `h758_s3_third_started_at_delta_us`

No theorem body or numerical input changed in this documentation correction.

**Limits:** this is a MERGE_REF_BUILD, not exact-head-only verification or a global axiom audit. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. PR #1570 remains OPEN / DRAFT / UNMERGED; no independent review or merge is claimed.

## 3. Consecutive start-field changes

The three source-recorded h758:s3 start values are:

1. 14:35:51.499419Z, initial readback.
2. 15:03:55.226485Z, later readback.
3. 15:33:30.430957Z, third readback.

The first-to-second delta is 1,683,727,066 µs. The second-to-third delta is 1,775,204,472 µs. Their arithmetic sum is **3,458,931,538 µs = 57 minutes 38.931538 seconds** from the first recorded value to the third. This is a derived comparison of the recorded clock fields on the same date, not an explanation of why the scheduler field changed.

The run ID and nominal scheduled time remained the same in the represented observations. Status remained IN_PROGRESS; completion and run-level chat reference remained null. No retry, restart, duplicate execution, worker identity, or backend cause is inferred.

## 4. Durable state

The earlier Amendment 02 remains the record of the third/fourth readbacks, Morrow completion, and first successful Lean build for the new theorem bodies. This Amendment 03 records the subsequent date-scope clarification and successful rebuild.

The canonical h758:s3 receipt remains the original receipt with numbered amendments. No new receipt, PR, branch, public issue, publication, scheduler task, or handoff was created.
