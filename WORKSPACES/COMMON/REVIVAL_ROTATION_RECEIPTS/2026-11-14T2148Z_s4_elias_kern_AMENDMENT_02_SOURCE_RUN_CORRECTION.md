# Amendment 02: exact-source correction of candidate-helper interpretation

**Disposition: PRIOR H837:S4 CANDIDATE-HELPER DEFECT CLAIM CORRECTED · SOURCE BYTES UNCHANGED · CANDIDATE-FREEZE DEFECT REMAINS.**

This amendment supersedes only the candidate-failure-helper interpretation in the original h837:s4 report. The original report and Amendment 01 remain immutable.

## Exact-source identity

The source file at the h837 report's pinned HSH_RESOURCES commit `d0a71f69062088c56d02a131933b3b1541d99dd9` and current main `0545b9d9a1b1c2941f2b30fa86ffec76a9f88178` has the same Git blob SHA-1 `49988a769389b2baf264a27d596ba7c3ff822b36` and raw SHA-256 `876393e188134f059a1e3f4f6daecd7465495e7124e7b6c1d9d44b7063dcdf2a`. No source change explains the difference.

## Re-execution

The exact source self-test passes 7/7. The preserved actor-registry sandbox patch, applied only to an isolated copy and verified against its exact patch blob, passes 13/13.

- Negative input: `math_check=fail`, stage `checked_fail`, Hydra spawns `prune_rebuild` and `salvage_lessons`.
- Positive input: `math_check=pass`, stage `checked_pass`, Hydra spawns `prediction_packet`, `paper_pipeline`, and `independent_reality_check`.
- Base and patched candidate-scenario outputs are identical; the patch does not alter the candidate helper.

Therefore the earlier statement that both branches return pass and that the negative case reaches `checked_pass` is an assistant source-interpretation error. The 7/7 and 13/13 test claims are reproducible in the isolated standard-library run.

## Separate finding preserved

The candidate-freeze coherence counterexample remains valid and was reproduced separately: `apply_checks` merges by check type without a candidate-freeze identifier, allowing checks from different candidate labels to combine into `checked_pass`, which remains after candidate mutation. This is the distinct finding already recorded at [issue #1727](https://github.com/Satobloc/HsH/issues/1727).

## Publication and authority

[Issue #1755](https://github.com/Satobloc/HsH/issues/1755) remains rejected for SHA-256 mismatch. It was not retried, edited, or duplicated. A separate public-safe correction was submitted as [issue #1768](https://github.com/Satobloc/HsH/issues/1768), submission `elias-h841-source-run-witness-correction-20261115t0136z-s3-001`, content SHA-256 `4b586e1d5349aac652265c9ace321d242a52770e711980968c3484cfbe751ab9`. Publisher verification was pending when this amendment was created.

No POC, PR, adapter, production workflow, or HSH_RESOURCES source was changed. ELIAS-2224 Track B disposition remains pending. No review request, task, response obligation, or ownership transfer is created by this correction.