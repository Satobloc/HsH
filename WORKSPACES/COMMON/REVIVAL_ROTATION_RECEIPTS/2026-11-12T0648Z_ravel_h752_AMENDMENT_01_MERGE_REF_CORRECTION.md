# Amendment 01 — prior CI execution classification correction

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-11T0800Z_s0_ravel.md`
**Correction date:** 2026-11-12
**Scope:** verification classification only; no source equation, theorem, PR, or physical claim changed.

The parent receipt describes Actions run `42986393293` as an **exact-head** build. Reinspection of the actual workflow job log shows that classification was incorrect.

- Run: `42986393293`, event `pull_request`, conclusion `success`.
- Job: `130408473233`, conclusion `success`.
- The job fetched `refs/remotes/pull/1133/merge` and checked out merge commit `0d807f8a046ca4d050d82f052fa692945798d8b6`.
- That merge commit merges PR head `ce59ec57a2aff34b6fa84f1510e192ee292829f5` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- The root build completed successfully with 8,953 jobs. The captured log contains no `sorryAx`, bare `admit`, or `error:`.

Tree comparison confirms that all nine Ravel module blobs at PR head and the checked-out merge reference were identical. The root aggregator differed because the merge reference included the base-side `NadirHelixSliceGeometry` import. Thus the run compiled the same nine Ravel module sources present at that PR head, but it was a **merge-reference build**, not a standalone exact-head checkout.

Correct classification for run `42986393293`: `MERGE_REF_BUILD_SUCCESS / NINE_RAVEL_MODULE_BLOBS_MATCH / EXACT_HEAD_NOT_RUN`. The workflow did not provide a separate global axiom audit, tests, or lint run.

A later run, `43109180575`, independently built the then-current PR head `19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61` on merge reference `e4c4636e7252d9b1aac4ad19cf7f4c4ed11bc5b0`; that later result is documented in the h774:s4 Ravel report. It does not retroactively change the checkout type of run `42986393293`.

The parent canonical receipt is preserved unchanged. This file is an additive correction, not a replacement receipt.