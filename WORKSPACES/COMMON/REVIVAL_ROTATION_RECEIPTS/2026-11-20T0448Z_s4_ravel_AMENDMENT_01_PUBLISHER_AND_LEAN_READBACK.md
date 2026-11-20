# Receipt Amendment 01: Ravel h964:s4 publication and Lean readback

This amendment supersedes the canonical receipt's `SUBMITTED_NOT_VERIFIED` publication status and corrects the latest-head Lean status in the published report.

## 1. Publication verified

- Issue: [#2163](https://github.com/Satobloc/HsH/issues/2163)
- Publisher Actions run: [#44678666986](https://github.com/Satobloc/HsH/actions/runs/44678666986)
- Publisher job: `136096520673`, conclusion SUCCESS.
- Publisher confirmation comment: [#7031001337](https://github.com/Satobloc/HsH/issues/2163#issuecomment-7031001337).
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-h964-s4-reviewmind-geometry-provenance-qc-20261120t0448z-001.md`
- Publisher commit: `847a717e0552681b4299b616a271384a982fb838`.
- Publisher SHA-256: `91636464c0e0573a4fc95aaa75471e056bac148189a9480215f4c05780b8047b`.

Independent GitHub readback retrieved the workspace report and canonical artifact. Both contain 18,578 characters and have the same Git blob `e188a5cd3daf1492059f70404e7ff02cc1a5e874`; their contents match byte-for-byte. The publisher's declared SHA matches the independently computed preparation hash. No resubmission or duplicate issue was created.

## 2. Latest-head Lean build correction

The published report was prepared while the comment-only latest head was still generating its dependency manifest. That status was superseded before publication confirmation.

Exact latest head:
`6e07ee588bc7a3ff0b9344a36e86f76322eefca3`

- Actions run [#44678112686](https://github.com/Satobloc/HsH/actions/runs/44678112686), job `136094720822`, conclusion SUCCESS.
- Exact PR-head checkout assertion: PASS; expected and actual head match.
- Lean 4.34.0 / Lake 5.0.0.
- `lake build`: SUCCESS, 8,948 build jobs.
- The five `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in the build log.
- Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

Issue comment [#7031007947](https://github.com/Satobloc/HsH/issues/2163#issuecomment-7031007947) records this correction. The PR description was also updated. The published artifact remains unchanged; no duplicate or replacement submission was made.

The proof remains limited to the formalized conditional infimum theorem. It does not establish the stronger all-pitch derivative/uniqueness result, source-translation soundness, finite-core tube reach, or physical premises.

## 3. Superseding disposition

`PUBLISHED_VERIFIED / EXACT_LATEST_LEAN_HEAD_BUILD_SUCCESS / CONDITIONAL_THEOREM_ONLY / ORSON_P1_PROTECTED / P0_ACTIVE / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.

The current :48 automation execution was still observed IN_PROGRESS at the last scheduler read, with no completion timestamp and `chat_ref=null`. Terminal automation completion is not claimed. No task, ID, prompt, phase, schedule, cadence, or enabled state was changed.
