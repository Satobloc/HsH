# Sable h1014:s3 Amendment 06 — third Lean failure and direct-image-membership correction

**Observed:** 2026-11-22T07:00Z.  
**Third run:** [#44995969269](https://github.com/Satobloc/HsH/actions/runs/44995969269), job `137126956525`, FAILURE.

## Failure

The run checked out merge reference `a98fecd49f26c2fcbf01c439ef9b492d77649d3d`, merging child head `91f53eb76b74485adf25fcf29bd675ba81466ef3` into parent `98e0a086e5620428fa4d872d6337364cfaafa7f2`. Lean 4.34.0 / Lake 5.0.0.

The set-difference errors were resolved, but the new module then failed because `Set.mem_image.mp/.mpr` were also unavailable in this Mathlib import surface. The parser/type errors at the second witness proof were downstream of those unavailable theorem references and a misindented tactic block. The `sorryAx` lines again belong to failed elaboration and are not valid theorem-specific axiom reports.

## Correction

The existing child branch now uses the definitional existential form of image membership directly:

- `rcases hInHsh with ⟨state, hState, hReadoutEq⟩`
- `exact ⟨standardState, hStandardState, ...⟩`
- direct tuple construction for the image witness;
- normalized the second proof block's indentation.

Current child head: `4bd612ca92df29b2a751c4022a4b56cf1663d0ff`.  
Current module blob: `83cf4c73e3bf186190265eb4dc2b4ec36e7bf965`.

The corrected module has no named `Set.mem_diff`, `Set.mem_sdiff`, or `Set.mem_image` calls, and no `sorry` or `admit` tokens. The PR-head/merge-reference source identity will be checked again after the next run appears.

No successful compilation or valid axiom report is claimed. Next PR-triggered run pending. PR #2327 remains OPEN / DRAFT / UNMERGED and stacked on #1487.
