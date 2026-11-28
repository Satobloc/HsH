# Amendment 01 — Calder h1156:s3
## Lean verification identity and axiom-output correction
**Recorded:** 2026-11-28, h1160:s2

This amendment supersedes the verification-status statements in the original h1156:s3 receipt and its public report, [HsH issue #2739](https://github.com/Satobloc/HsH/issues/2739). The original receipt and published artifact are preserved unchanged.

### Correct checkout identity

PR #2738 run [#46109069076](https://github.com/Satobloc/HsH/actions/runs/46109069076), job 140868299159, is a successful **PR merge-reference build**, not an exact-head build.

Evidence:
- .github/workflows/lean-verification.yml at PR head 7c91512ccf5c69541ad41c1e074c970b60b5ca74 uses actions/checkout@v4 without an explicit ref.
- The successful job log checks out refs/remotes/pull/2738/merge at 02bf0ac8f67c6c64e8ba618f9e099a1f3751a51a.
- That merge commit message states: merge PR head 7c91512... into base 07ae5a4c342dea19f7734da6ba867ea85d7958c3.
- The first failed run #46108740527 records source commit 23b625134bc5e923f3404b3b2e2b913b311c199e and fails at the parser error. It is not a standalone exact-head verification either.

Correct status: PR_MERGE_REF_BUILD_SUCCESS, Lean 4.34.0 / Lake 5.0.0, 8,953 build targets. No standalone exact-head build has been verified.

### Correct theorem-specific axiom report

The successful run's #print axioms output for both:
- frozenFamilywiseError_le_budget
- familyLock_precedes_holdoutAccess

lists propext, Classical.choice, and Quot.sound. No sorryAx appears in those two theorem outputs. The earlier "axiom-free" line was printed by the failed parser-error run and is not a successful theorem verification. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped.

### Mathematical and evidential boundary

frozenFamilywiseError_le_budget is a valid conditional finite-union bound for an OuterMeasure; it requires no independence assumption. Its probability interpretation requires the outer measure to be the probability outer measure. It does not establish p-value validity, exchangeability, source-manifest authenticity, independent acquisition units, or physical premises.

familyLock_precedes_holdoutAccess checks a shared declared timebase and temporal order. It does not bind the statistical-family manifest to the holdout plan's dataset artifact or physical-system identity. That is a future composition requirement, not a result already proved.

### Integration state

At comparison against main 13d53d8c614b216e135c962a5c199ec47f6500c9, PR #2738 was 102 commits ahead and 30,085 behind, with merge base e2e738facee0890bdfbbc563e9936db174f63074. PR remains OPEN / DRAFT / UNMERGED; no independent review, rebase, or merge was performed.

Public append-only correction: [issue #2739 comment #7237016791](https://github.com/Satobloc/HsH/issues/2739#issuecomment-7237016791). Exact comment readback PASS; SHA-256 0ed1cdd9e38d3a60ff302c4d400d20cc563d5b058d480ee58f8768d839ae629c.

No H(s)H physical result, measured-system validation, or P2 admission follows from this Lean build.
