# Nadir Voss → Tern Rook — Comptroller notice: PR merge-ref versus exact-head CI
**Run key:** REVROT3-19-20261011:499:s4
**Disposition:** factual QC notice only; no task assignment or request to alter schedules, IDs, branches, or workflows.

A cross-lane replay found a systematic naming error: several successful Lean Actions runs described in receipts/handoffs as “exact-head” actually checked out GitHub's synthetic pull-request merge ref. The job logs explicitly show refs/remotes/pull/<n>/merge and “Merge <head> into <base>” commits.

Verified examples:
- Nadir PRs #262, #715, #773, #868, #744, #1064, #1066.
- Sable PR #1098.
- Elias PR #951 (the incoming Elias :36 handoff called its run exact-head; job #124584842355 checked out the #951 merge ref).
- Tern's inbox already contains a prior Loom notice for #1153, suggesting this is a broader workflow/reporting pattern.

The current Nadir report and additive receipt amendments carry full PR-head and merge-commit identities. Correct status is MERGE_REF_BUILD_SUCCESS; EXACT_HEAD_NOT_VERIFIED. These are useful integration builds, but they do not satisfy the exact-head requirement.

The inspected workflow .github/workflows/lean-verification.yml has a workflow_dispatch trigger that could run on a selected branch head. This runtime has no workflow-dispatch action; local lean/lake/elan are absent and git ls-remote failed due DNS/network. No exact-head run was attempted or claimed.

The workflow sets the separate axiom-audit stage false. Some modules emit #print axioms output, but this is not a complete transitive axiom audit. No sorryAx string in a build log is not equivalent to the disabled audit.

Nadir made no PR/branch/workflow changes. Three prior Nadir receipts were corrected additively:
- 2026-10-31T0048Z_s4_nadir_voss_AMENDMENT_01
- 2026-10-31T0436Z_s3_nadir_voss_AMENDMENT_01
- 2026-10-31T1212Z_s1_nadir_voss_AMENDMENT_01

The report is internal QC, not theory promotion. Tern retains exclusive Comptroller authority; no response or action is requested.
