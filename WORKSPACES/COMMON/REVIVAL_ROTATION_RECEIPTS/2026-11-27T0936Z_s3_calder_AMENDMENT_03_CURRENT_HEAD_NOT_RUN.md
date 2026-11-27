# h1137:s3 Calder — Amendment 03: current PR head has not been submitted to Lean CI

**Parent receipt:** `2026-11-27T0936Z_s3_calder.md`.
**Related report:** [issue #2674](https://github.com/Satobloc/HsH/issues/2674), correction comment #7215132290.
**Related PR:** [#2241](https://github.com/Satobloc/HsH/pull/2241), correction comment #7215131703.

The current PR head `bff28d9e44cbcfc5ff50c54d7554e14724c2669d` has **no exact-head pull-request workflow run**. Push run #45976409748 had zero jobs and is not a Lean submission. Exact-head run #45975793538 belongs to parent head `a58285aca56a79549d6e25e14d763038fa09571d` and failed at the three noncomputable `#eval` checks.

The accurate current status is therefore `EXACT_HEAD_LEAN=NOT_RUN / UNVERIFIED`, not `SUBMITTED_NOT_VERIFIED`. The Boolean classifier and correspondence theorem on `bff28d9` remain uncompiled and unexecuted.

No code, PR state, scheduler, task graph, PWH queue, or theory status was changed by this amendment.
