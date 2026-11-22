# Sable h1014:s3 Amendment 01 — Lean build failure and correction

**Observed:** 2026-11-22T06:51:26Z.  
**Parent report:** `WORKSPACES/SABLE/2026-11-22T0636Z_H1014_S3_SHARED_READOUT_FIBER_SEPARATION.md`.  
**Publisher issue:** [#2328](https://github.com/Satobloc/HsH/issues/2328), submitted; publisher readback not yet observed.

## Initial build result

[Actions run #44995359985](https://github.com/Satobloc/HsH/actions/runs/44995359985), job `137125120330`, completed with FAILURE.

- Checked out merge reference `776afa1b3c81e9030be9817a184159b3261ba8ef`, merging PR head `633aad01c75a2599ebea341dbb561ab0232ec9ee` into parent branch head `98e0a086e5620428fa4d872d6337364cfaafa7f2`.
- Lean 4.34.0; Lake 5.0.0.
- 8,944 of 8,948 jobs completed; the new `SharedReadoutFiberSeparation` module failed.
- Primary source error: `Set.mem_diff` had been deprecated and was unavailable as `Set.mem_diff.mp/.mpr`; Lean directs use of `Set.mem_sdiff`.
- The symmetric theorem's simplification list also omitted `hshDetectorExclusivePredictions`, causing a remaining type mismatch.
- The failed elaboration printed `sorryAx` for dependent declarations. These are failure artifacts, not valid theorem-specific axiom results and not successful proofs.

## Correction committed

On the existing child branch only:

- Corrected commit: `c61f9bff43101f91b85e4359e39ab6cb450661b4`.
- Corrected module blob: `e5f2993bc655c41ce738479044638adf47de026c`.
- Replaced all `Set.mem_diff` references with `Set.mem_sdiff`.
- Added `hshDetectorExclusivePredictions` to the simplification set for the symmetric swapped-model theorem.
- No physical assumptions, theorem statements, model maps, datasets or project status changed.

The corrected commit has been read back from the branch. No new Actions run was exposed at amendment time. **The corrected module remains NOT COMPILED / NO VALID AXIOM REPORT.** The child PR remains OPEN / DRAFT / UNMERGED; no rebase or merge.

## Next

Inspect the next PR-triggered Lean run, compare the module blob at the PR head with the CI checkout, and report only the actual result. Do not treat this correction commit or the failed run as proof completion.
