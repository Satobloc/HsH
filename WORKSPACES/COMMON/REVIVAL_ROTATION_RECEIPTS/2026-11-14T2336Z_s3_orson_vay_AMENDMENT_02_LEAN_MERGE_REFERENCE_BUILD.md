# H839:s3 Orson | Amendment 02: Lean merge-reference build

**Status:** TARGET_AND_ROOT_BUILD_SUCCESS / EXACT_HEAD_UNVERIFIED

- PR: [#850](https://github.com/Satobloc/HsH/pull/850), OPEN / DRAFT / UNMERGED.
- PR branch: `research/orson-p1-shared-nli-bound-20261028t06z`.
- PR head: `776f5df7cad655dd9a7a8d99720a1db3e2347872`.
- New module blob: `11a6aeb305d21a502fc20ccf2ad10aa28e157cee`.
- Successful Actions run: [#43655298253](https://github.com/Satobloc/HsH/actions/runs/43655298253).
- Synthetic merge-reference source commit: `a2e82fae2f3d510dd8b1402ee2f6440f3a969759`.
- Toolchain: Lean 4.34.0; Lake 5.0.0.
- Target `HsHVerification.OrsonJointReliabilityBounds` built at 8984/8986; root `HsHVerification` built at 8985/8986; full Lake build completed successfully (8,986 jobs).
- Both theorem-specific `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appears in either theorem report.
- Tests, lint, nanoda, leanchecker, and the separate global axiom-audit step were skipped.

This is successful formal verification of the formalized finite-table Fréchet statements on the PR merge reference. It does not establish source-to-data translation, empirical validity, or any P1 measurement claim. No exact-head standalone build, current-main integration, review, or merge is claimed. The canonical receipt and Amendment 01 remain unchanged.
