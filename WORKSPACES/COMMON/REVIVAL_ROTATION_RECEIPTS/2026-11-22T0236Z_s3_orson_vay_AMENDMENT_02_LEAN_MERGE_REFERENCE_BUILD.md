# Receipt Amendment 02 | h1010:s3 Orson Vay | Lean merge-reference build verified

This amendment supersedes only the earlier statement that no successful build covered the new declarations. A successful pull-request merge-reference build now compiles the exact PR-head module blob; standalone exact-head and current-main integration builds remain unverified.

- Existing PR #2112 new head: `d670754f169bc25649ecf2e5746053585cb1d78a`.
- Module blob: `38c3258d01535f491e624aec3e83377af205a70f`.
- Successful PR-event run: [#44993699134](https://github.com/Satobloc/HsH/actions/runs/44993699134).
- Checked-out synthetic merge-reference commit: `85e96c5b5836d5c47ad7c3142c6ccce5686a6ae3`; its module blob exactly matches the PR-head module.
- Lean 4.34.0 / Lake 5.0.0; 8,951 build jobs. The new Update and Forget post-state theorems each report only `[propext]`; full job log contains zero `sorryAx` and zero `admit`.
- Tests, lint, leanchecker, nanoda and global axiom audit were skipped. Separate push-triggered run #44993693919 failed with zero job records; it is not the successful PR-event run.

PR #2112 remains OPEN / DRAFT / UNMERGED and requires independent review. No merge, rebase, P1 protocol/trial/manuscript change, empirical validation, or paper-gate advancement occurred. The original h1010 receipt and Amendment 01 remain unchanged; this is a numbered additive amendment only.