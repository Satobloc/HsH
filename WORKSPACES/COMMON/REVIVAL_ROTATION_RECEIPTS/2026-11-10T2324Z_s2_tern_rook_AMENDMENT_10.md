# Tern h743:s2 | Receipt Amendment 10 | Lean arithmetic correction and proof-boundary cleanup

**Observation:** 2026-11-11T00:08Z.  
**Parent:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook.md`.  
**Disposition:** PRIOR_HEAD_CI_FAILED_ON_WRONG_CONSTANT / STANDARD_AXIOM_DEPENDENCIES_REMOVED_FROM_TWO_STRING_INEQUALITY_CLAIMS / CORRECTED_HEAD_SUBMITTED_NOT_VERIFIED.

## CI failure diagnosis

Actions run #42928188003 / job #130219947056 on superseded PR head `7e6bbd9700adcee108aa0b9e33f369c142043afa` failed at Lean compilation.

The sole reported error was the arithmetic constant in `h743_s3_later_start_after_nominal`. Source timestamps:
- Nominal: 23:36:00Z.
- Later `started_at`: 23:59:53.610868Z.
- Correct offset: `1,433,610,868 µs = 1,433.610868 s = 23m53.610868s`.
- The previous constant `1,073,610,868` was wrong by 360,000,000 µs.

The separate same-run-ID start-field delta theorem `1,665,465,451 µs` compiled without axioms in the failed run. The build did not complete, so the module as a whole is not verified.

## Proof-boundary cleanup

The two cached/current String-inequality theorems exposed `Classical.choice` and `Quot.sound` through the String quotient path. They were removed rather than counted as proof-closed. Exact cached/current ID fields remain recorded by definitional equality; their inequality is retained as a source-level observation, not a Lean theorem.

All `native_decide` occurrences are removed. Concrete ring lookup theorems use definitional reduction and still report standard `propext`; the numeric timing/status theorems report no axioms in the failed run's partial axiom output. No `sorryAx` was reported.

## Corrected current head

- PR #1570 branch head: `59773b00ddc6c514088574c149e840c89f46b03a`.
- Module blob: `a7775ee642843c60cd4dbe9fcb19306c0c309c78`.
- `native_decide` occurrences: 0.
- No Actions run for this corrected head had appeared at the last readback. Status: `SUBMITTED_NOT_VERIFIED`.
- PR remains OPEN / DRAFT / UNMERGED. Existing workflow uses merge-ref checkout; exact-head-only verification remains outstanding.

The PR body was updated and independently read back with the failure, corrected arithmetic, axiom boundary and pending status.

## Operational boundary

The existing :24 automation was rechecked separately and remained enabled with its original configuration; its current run remained IN_PROGRESS with no completion or thread reference. No task ID, schedule, phase, cadence, enabled state, ownership, automation count, Mersearch lane, paper gate or theory status changed. No sixth task was created.

**Final:** `WRONG_CONSTANT_CORRECTED / STRING_QUOTIENT_INEQUALITY_THEOREMS_REMOVED / ZERO_NATIVE_DECIDE / NEW_HEAD_CI_PENDING / NO_PROOF_SUCCESS_CLAIM_FOR_CORRECTED_HEAD / NO_TASK_MUTATION`.
