# Sable h1014:s3 Amendment 05 — PR-head / merge-reference source identity

**Observed:** 2026-11-22T06:59Z.  
**Current PR:** [#2327](https://github.com/Satobloc/HsH/pull/2327), head `91f53eb76b74485adf25fcf29bd675ba81466ef3`.  
**Current Actions run:** [#44995969269](https://github.com/Satobloc/HsH/actions/runs/44995969269), IN_PROGRESS.

GitHub's current PR merge reference is `a98fecd49f26c2fcbf01c439ef9b492d77649d3d`. Independent file readback compared the PR branch with `refs/pull/2327/merge`:

- `SharedReadoutFiberSeparation.lean`: branch and merge-reference blob both `f6e919d0852c92a5cf3f443a779b30fa79326383`.
- `HsHVerification.lean` root aggregator: branch and merge-reference blob both `dda687385204ad58c81f38fe3e2402b49166aeb6`.
- Corrected module contains no `sorry` or `admit` tokens.
- No `Set.mem_diff` or `Set.mem_sdiff` theorem references remain; the remaining set-membership calls are `Set.mem_image`.

Therefore the source bytes now present at the PR head are identical to the source bytes in the current merge reference. This establishes which module content the PR workflow is expected to build; it does **not** establish that the build has completed or that the theorems compile. At last observation, Lake manifest generation was still running and the Lean compile step had not started.
