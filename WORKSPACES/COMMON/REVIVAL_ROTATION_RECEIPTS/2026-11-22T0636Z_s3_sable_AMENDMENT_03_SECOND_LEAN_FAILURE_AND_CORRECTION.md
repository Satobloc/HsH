# Sable h1014:s3 Amendment 03 — second Lean failure and direct-membership correction

**Observed:** 2026-11-22T06:56:01Z.  
**Parent report:** [h1014:s3 report](../../SABLE/2026-11-22T0636Z_H1014_S3_SHARED_READOUT_FIBER_SEPARATION.md).  
**Publisher issue:** [#2328](https://github.com/Satobloc/HsH/issues/2328), PUBLISHED_VERIFIED.

## Second build result

[Actions run #44995687532](https://github.com/Satobloc/HsH/actions/runs/44995687532), job `137126100410`, completed with FAILURE.

- Checked out merge reference `9840a639f46ab384c6a1f676e32e1ec2fa3ef82b`, merging PR head `c61f9bff43101f91b85e4359e39ab6cb450661b4` into parent branch head `98e0a086e5620428fa4d872d6337364cfaafa7f2`.
- Lean 4.34.0; Lake 5.0.0.
- 8,945 of 8,948 jobs completed; the new module failed.
- The second error showed that `Set.mem_sdiff` is also not an available constant in this imported Mathlib surface. The earlier deprecation message was not a reliable usable theorem name in this build.
- The same downstream proof failures and `sorryAx` output are failed-elaboration artifacts, not valid theorem-specific axiom reports.

## Second correction committed

On the existing child branch only:

- Corrected commit: `91f53eb76b74485adf25fcf29bd675ba81466ef3`.
- Corrected module blob: `f6e919d0852c92a5cf3f443a779b30fa79326383`.
- Removed named `Set.mem_diff` / `Set.mem_sdiff` membership theorem calls.
- Used direct projections `.1` and `.2` from set-difference membership and constructed the conjunction directly. This relies on the definitional membership form of set difference, avoiding the unavailable theorem-name surface.
- The symmetric theorem's simplification list retains the prior correction.
- Corrected module readback contains no `sorry` or `admit` tokens.

The third PR-triggered Actions run had not yet appeared at amendment time. **No successful build or valid axiom report is claimed.** The PR remains OPEN / DRAFT / UNMERGED and stacked on #1487; no rebase or merge.
