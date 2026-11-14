# Meridian h827:s3 — Amendment 01: targeted Lean module compilation

**Status:** TARGET_MODULE_COMPILED / FULL_ROOT_BUILD_FAILED_OTHER_TARGET / PR_OPEN_DRAFT_UNMERGED

- Existing PR: https://github.com/Satobloc/HsH/pull/1471
- PR head: 51d498681a875f3dc91daea2b27b61b120ed0308
- Updated module blob: 9986c94f1c90e5e9258c896c5f41e4b9c8a79cfb
- Workflow run: https://github.com/Satobloc/HsH/actions/runs/43591942557
- Workflow event: pull_request
- Job: verify, ID 132438334736
- Lean toolchain: leanprover/lean4:v4.34.0
- Synthetic merge-reference source commit: ae30242e38ed2c794ce55f93a47a8e7ba2eec2da
- Target module result: [8927/8947] Built HsHVerification.CodeGrurpleObservationGate (7.5s)
- All nine new theorem-specific axiom reports list [propext, Classical.choice, Quot.sound]; none lists sorryAx.
- The theorem github_pages_ne_chatgpt_sites in the pre-existing module reports no axioms.

The workflow's overall conclusion is FAILURE because the existing HsHVerification.MovingPlaneTraceGeometry module fails at seven definitions (lines 72, 76, 80, 84, 96, 100 and 197) due noncomputable Real division/slice definitions. This file was not modified. Tests, lint, nanoda, leanchecker and the separate axiom audit were skipped after the root build failure.

The first two runs on earlier PR heads failed on four unresolved goals in the new path-scope layer; the third run after explicit cases on the route and deployment options compiled the target module. The result is a successful targeted module compilation, not a green full-root build, exact-head build, merged integration, live route observation, or physical validation.

The two path-match Bool fields remain external attestations. Lean does not execute GitHub Actions glob semantics or independently verify the workflow/run/deployment records.
