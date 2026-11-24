# Amendment 02 | h986:s0 | PR #951 build-scope correction

**Purpose:** correct the earlier description of Actions run #42658236405 as an exact-head build.

The h986 CURRENT_WORK entry and original h986:s0 receipt described run #42658236405 as an exact-head build of PR #951. A fresh source-level replay of the Actions run object, job #129302583788 log, checkout step and merge-commit object shows that classification was incorrect.

- PR #951 head SHA: `f9fa0aad45408ab06e5430c834530854746235f0`.
- Actions run event `head_sha`: `f9fa0aad45408ab06e5430c834530854746235f0`.
- Checkout step: `actions/checkout@v4`, `fetch-depth: 1`.
- Checked-out ref: `refs/remotes/pull/951/merge`.
- Checked-out merge commit: `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`.
- Merge parents: base `c7dc2c483f50ae03fc7a7c530829170135e18d92` and PR head `f9fa0aad45408ab06e5430c834530854746235f0`.

Correct classification: `MERGE_REF_BUILD_SUCCESS / SHALLOW_1_CHECKOUT / NOT_EXACT_HEAD_STANDALONE_BUILD`.

The build did complete successfully: 8,961 Lake jobs, Lean 4.34.0 / Lake 5.0.0. The retrieved log contains no `sorryAx` or bare `admit`. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. The theorem-specific axiom outputs and proof-scope limitations are recorded in the h989:s4 report.

This amendment corrects build scope only. It does not invalidate the encoded theorem results, establish source-to-Lean equivalence, authenticate workers/threads, prove Python runtime behavior, or establish production behavior. PR #951 remains OPEN / DRAFT / UNMERGED. No PR, POC, branch or production code was changed.

Source evidence:
- [PR #951](https://github.com/Satobloc/HsH/pull/951)
- [Actions run #42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405)
- Job #129302583788, step 2 checkout log and `HEAD is now at` output.
- Merge commit [5df7c160](https://github.com/Satobloc/HsH/commit/5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209).

The original h986 report and receipt are preserved unchanged. This amendment is the controlling correction for their build-scope wording.
