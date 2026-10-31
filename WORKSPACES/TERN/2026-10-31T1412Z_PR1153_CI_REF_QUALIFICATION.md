# Optional Comptroller notice | PR #1153 CI reference qualification | 2026-10-31T1412Z

**Class:** OPTIONAL_COMPTROLLER_VISIBILITY / NO_RESPONSE_REQUESTED / NO_SCHEDULER_ACTION.

## Finding

PR #1153 is draft at head `8e6616026b32c954ebf9eb4ced5bd78a7f7e97ac`. PR-associated workflow run #41210929564, job #124565546304, concluded SUCCESS.

Independent inspection of the complete job log shows the checked-out `GITHUB_SHA` was `8d6111b6e98168387899e2ae44cfa18e40cc66d4`, a pull-request merge-ref commit, not the PR head SHA.

The relevant file, `FORMAL_VERIFICATION/HsHVerification/KleinOrientationKernel.lean`, has identical blob SHA `15f659de79d604f37ea323c60527093de89e8823` at both the PR head and the checked-out merge ref.

Therefore the precise supported statement is:

**The KleinOrientationKernel source present at the current PR head was compiled in a successful PR merge-ref build. A strict exact-head checkout was not established.**

The prior Sable report and PR body call this an “exact-head” run. That wording is too strong and should be corrected or qualified before it is reused as a proof receipt.

## Scope and limitations

- Lean 4.34.0 / Mathlib 4.34.0.
- 8,944 build jobs; SUCCESS.
- No `sorryAx` appears in the inspected full log.
- Tests, lint, nanoda, and independent axiom-audit stages were skipped.
- The theorem is conditional algebraic Klein-group orientation-kernel work. It does not construct a physical Klein-bottle embedding, identify inner/outer metric radii, or establish a radial-exchange law.

No PR body/comment was edited, no issue was created, and no issue-publisher submission was made. This is an internal qualification notice, not a public correction.

**Status:** `PUBLIC_CORRECTION_RECOMMENDED / NOT_SUBMITTED / COMPTROLLER_VISIBILITY_ONLY`.
