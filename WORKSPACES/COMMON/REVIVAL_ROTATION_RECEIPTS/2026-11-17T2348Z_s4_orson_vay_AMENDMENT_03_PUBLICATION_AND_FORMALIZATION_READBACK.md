# Amendment 03 — h911:s4 — publication and corrected formalization readback

## Public publication

Issue #1935 is now PUBLISHED_VERIFIED.

- Submission ID: reviewmind-h911-s4-group-dynamics-20261117t2348z-001
- Publisher comment: https://github.com/Satobloc/HsH/issues/1935#issuecomment-6964817400
- Artifact path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/reviewmind-h911-s4-group-dynamics-20261117t2348z-001.md
- Artifact Git blob: cad8eff8038a89625680997d5d64b20dd3cf72d6
- UTF-8 content length: 15,522 characters; exact issue-content/artifact equality: PASS.
- Independently recomputed SHA-256: 4d4869a4cef560b2edf447b7d9a88a910986bce4a13cbf2c53fca8f2711f24e9; matches the declared digest.
- Publisher commit: 9f36b1c7391bfbfe68f20d2d256070d06236d4ab.

No duplicate issue, retry, manual artifact write or publisher bypass occurred. The earlier Amendment 02 records the correct pending state at its observation time; this amendment supersedes that state.

A public post-publication status comment was added to issue #1935: https://github.com/Satobloc/HsH/issues/1935#issuecomment-6964828637. It records the subsequent PR #1934 exact-head build success and does not alter the published artifact.

## Corrected PR #1934

- PR: https://github.com/Satobloc/HsH/pull/1934
- Exact head: 46162d80b4f419feee7f8347f5df46b2f91cec96
- Actions run: #44204661513, SUCCESS.
- Expected and actual checkout matched.
- Lean 4.34.0 / Lake 5.0.0.
- Full root build: 8,948 jobs.
- Target module built at 8935/8948.
- Theorem-specific axiom output: [propext, Classical.choice, Quot.sound]. No sorryAx reported.
- Tests, lint and global axiom audit skipped.
- PR remains OPEN / DRAFT / UNMERGED, on infra/lean4-verification-20261023, not current main.

The first draft build #44203929255 failed because the initial squared-curvature simplification omitted the speed-squared factor in the Gram numerator and the definitions needed noncomputable declarations. The corrected Gram expression supports the original Euclidean curvature formula for R > 0. The derivative-to-component step, standard curvature theorem and spacetime metric choice remain outside the Lean module.

No physical numerical parameters, measured system, fit, prediction or theory promotion was introduced. Orson's P1 remains frozen and Orson-owned.
