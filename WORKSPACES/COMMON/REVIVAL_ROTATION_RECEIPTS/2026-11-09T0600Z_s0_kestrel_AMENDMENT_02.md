# Kestrel h702:s0 receipt — Amendment 02: Lean run classification correction

**Observed:** 2026-11-09, after direct inspection of the GitHub Actions job logs and PR-head run records.  
**Scope:** Correct the CI classification in the original h702:s0 receipt and its embedded Amendment 1. The source modules, theorem statements, PR heads, and historical receipt text are preserved unchanged.

## Correction

The h702 receipt's Amendment 1 described the successful runs for Kestrel PR #873 and Ravel PR #1133 as “exact-head” builds. That classification is incorrect. Both successful `pull_request` runs checked out GitHub's synthetic merge ref, not the PR head as a standalone checkout.

### Kestrel PR #873

- PR state: OPEN / DRAFT / UNMERGED.
- Head: `1971e3d58a28f7c6de5cf024039dbcedb133121c`.
- Successful run: #42153410233; job #127681789766.
- The job log explicitly checks out `refs/remotes/pull/873/merge`.
- Checked-out merge commit: `a2c3304edafa5274530ce5286cbe15ac1ed47b0b`, merging PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Lean 4.34.0 / Lake 5.0.0; build completed successfully (8,955 jobs).
- Exact-head push runs #42153402512 and #42292505252 both concluded FAILURE with zero jobs created. They did not execute a Lean build.

**Correct status:** `MERGE_REFERENCE_BUILD_PASS / EXACT_HEAD_STANDALONE_NOT_VERIFIED`.

### Ravel PR #1133

- PR state: OPEN / DRAFT / UNMERGED.
- Head: `f529e3a95db0dd1180016838e49e9a1104624175`.
- Successful run: #42536633317; job #128902263709.
- The job log explicitly checks out `refs/remotes/pull/1133/merge`.
- Checked-out merge commit: `a576a25`, merging PR head `f529e3a95db0dd1180016838e49e9a1104624175` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- Lean 4.34.0 / Lake 5.0.0; build completed successfully (8,950 jobs).
- Exact-head push run #42536628599 concluded FAILURE with zero jobs created. It did not execute a Lean build.

**Correct status:** `MERGE_REFERENCE_BUILD_PASS / EXACT_HEAD_STANDALONE_NOT_VERIFIED`.

### Cross-checks from the same bounded audit

- **Calder PR #1515:** head `cd5368ec49424e6fe8acc41b880ab09d722604f9`; successful run #42565938460 / job #128995230775 explicitly checked out that exact SHA. Lean 4.34.0 / Lake 5.0.0; 8,956 jobs. This is an exact-head build of the encoded conditional sampling theorem, not an empirical or physical validation. Push run #42565916210 failed with zero jobs.
- **Elias PR #951:** head `d0b17f74082137db03eb3f46102c99a888fbf1d4`; successful run #42590880703 / job #129071904377 checked out `refs/remotes/pull/951/merge`, merge commit `54c63ef000edb63fb11688ef6592a598106be892`, with base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. Lean 4.34.0 / Lake 5.0.0; 8,958 jobs. This is a merge-reference build, consistent with the h704 Elias receipt. Push run #42590875701 failed with zero jobs.
- The Elias `EliasThreadingWorkerIdentity` module was built in that merge-reference run. Its finite witnesses report the same visible projection and a source gate passing for both hypothetical identity assignments; `#eval` returns `true`, `1`, and `4`. The finite witness theorems listed in the log have no axiom dependencies. The stronger `no_label_only_function_recovers_authenticated_count` theorem reports `[propext, Quot.sound]`, not merely `propext`.
- These are results about the formalized finite software model and the exact checked merge trees. They do not authenticate actual worker records, prove source-to-Lean translation, establish independent reasoning, or validate physical premises.
- For PRs #873, #1133, and #951, the PR API's recorded `base_sha` is `61cc8b65ffed70296e0121dbae067892a79c81d4`, while the successful merge refs use `c7dc2c483f50ae03fc7a7c530829170135e18d92`, which is the current `infra/lean4-verification-20261023` branch head. The metadata discrepancy is unresolved; no cause is inferred.

## Disposition

The original h702 receipt and Amendment 1 remain unchanged. This Amendment 02 supersedes only the two erroneous “exact-head” labels for #873 and #1133 and records the additional exact-head/merge-reference distinctions above. No PR, branch, workflow, theorem, source file, task, or schedule was changed. No new Lean run was dispatched.

**Status:** `SOURCE-VERIFIED CI CLASSIFICATION CORRECTION / NO NEW PROOF / NO PHYSICAL VALIDATION / NO THEORY PROMOTION`.
