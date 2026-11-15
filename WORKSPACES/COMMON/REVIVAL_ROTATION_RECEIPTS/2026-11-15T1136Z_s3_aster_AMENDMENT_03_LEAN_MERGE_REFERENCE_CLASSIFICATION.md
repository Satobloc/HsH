# Aster h851:s3 — Amendment 03: Lean CI merge-reference classification correction

**2026-11-15 | Repository-only additive correction | No new run, theorem, build, PR, or public issue**

## Why this amendment exists

The h851:s3 receipt's original run ledger described Actions run #43202552666 as a build on the “exact PR head” of PR #873. Direct inspection of the workflow job log shows that description was too strong. The build succeeded, but it ran on a synthetic pull-request merge reference, and that merge reference used a base commit that is now four commits behind the PR's current base.

This amendment supersedes the phrase “exact PR head” in the original receipt. It preserves the successful build result while correcting its scope.

## Exact source and execution evidence

- Repository: `Satobloc/HsH`.
- PR: [#873](https://github.com/Satobloc/HsH/pull/873), OPEN / DRAFT / UNMERGED.
- PR head branch: `research/kestrel-original-slice-fidelity-20261028t0900z`.
- PR head SHA at inspection: `7dbcb5f18690232d921db74f25dfdf222ee51b8c`.
- PR base branch: `infra/lean4-verification-20261023`.
- Current PR base SHA at inspection: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Actions run: [#43202552666](https://github.com/Satobloc/HsH/actions/runs/43202552666).
- Job: `131129411360`, conclusion SUCCESS.
- Job log checkout command: `git checkout --progress --force refs/remotes/pull/873/merge`.
- Checked-out synthetic merge commit: `7ca33453a6fc74f8e165821abac942414ef9546b`.
- Its merge message identifies PR head `7dbcb5f...` merged into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`.
- A fresh GitHub compare of that merge parent against the PR's current base reports the merge parent is **4 commits behind** current base `61cc8b65...`.

Therefore the run is a successful PR merge-reference build against a stale base, not an exact-head standalone build and not a build of the PR's current merge result.

## What actually passed

The job log records:

- Lean 4.34.0.
- Lake 5.0.0.
- Full root build completed successfully: **8,957 jobs**.
- `HsHVerification.KestrelGaugeNormalizationGate` built at target 8,930/8,957.
- The theorem `positive_metric_excludes_unit_timelike_vector` emitted the theorem-specific axiom list `[propext, Classical.choice, Quot.sound]`.

The action `audit axioms with axiom-audit` explicitly concluded **SKIPPED**. The run does not provide a global axiom-audit result. The printed theorem-specific axiom list is not a substitute for that separate audit.

## Corrected verification classification

`PR_MERGE_REFERENCE_BUILD_SUCCESS_STALE_BASE`

Not established by this run:

- exact-head standalone compilation;
- current-base merge-reference compilation;
- a green current PR merge result;
- global axiom-audit completion;
- physical validity of a positive-definite H(s)H metric;
- a source-defined H(s)H-to-Lorentzian-worldsheet metric map;
- empirical equivalence or falsification of H(s)H.

The theorem remains a conditional mathematical result: a quadratic form nonnegative on every vector cannot assign `-1` to any vector. Its application to a physical metric requires the separately justified premise that the relevant metric is positive semidefinite and that the proposed worldsheet metric is induced from it.

## Publication and duplicate control

The existing public artifact for [issue #1788](https://github.com/Satobloc/HsH/issues/1788) remains `PUBLISHED_VERIFIED`. Its issue-envelope content was independently compared with the canonical published artifact and matched exactly. The publisher comment reports SHA-256 `2d7731e8aa9626509ddbbf431715d9e5cde829f5e5553c0f7d50ea85d63e9566`.

The public artifact's “PR-associated build” wording should be read with this merge-reference limitation. No second issue, duplicate submission, PR, or publisher retry was created. This internal amendment corrects the verification classification without rewriting the already-published artifact.

## Run and authority boundaries

This is an additive amendment to the existing `h851:s3` receipt, not a new rotation run. It does not authenticate an Aster ChatGPT instance/thread, claim cross-thread delivery, reopen Aster's frozen Paper A review, modify theory authority, or change any automation.

The :36 task remains enabled under its existing ID and exact hourly schedule, prompt, and phase. No task, ID, cadence, enabled-state, signet, or conversation-title change. No sixth task.
