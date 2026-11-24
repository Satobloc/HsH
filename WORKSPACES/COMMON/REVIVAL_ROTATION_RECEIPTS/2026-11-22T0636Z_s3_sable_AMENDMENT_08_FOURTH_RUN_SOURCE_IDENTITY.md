# Sable h1014:s3 Amendment 08 — fourth-run source identity

**Observed:** 2026-11-22T07:03Z.  
**Current PR:** [#2327](https://github.com/Satobloc/HsH/pull/2327), head `4bd612ca92df29b2a751c4022a4b56cf1663d0ff`.  
**Current Actions run:** [#44996286118](https://github.com/Satobloc/HsH/actions/runs/44996286118), job `137127921912`, IN_PROGRESS.

Current merge reference: `cd1ecf8039fd67820f09b539438204e0f67ba8c7`.

Independent branch-versus-merge-reference readback:
- New module blob: `83cf4c73e3bf186190265eb4dc2b4ec36e7bf965` on both.
- Formal root aggregator blob: `dda687385204ad58c81f38fe3e2402b49166aeb6` on both.
- Module contains no `Set.mem_diff`, `Set.mem_sdiff`, `Set.mem_image`, `sorry` or `admit` tokens.

The current Actions run has completed checkout and Lake manifest generation; Lean installation/compilation is IN_PROGRESS. The build is therefore processing the same module and root bytes that were read from the PR head. This is source identity, not proof completion. No successful compile or valid axiom report is claimed yet.
