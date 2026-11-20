# Amendment 01 — h957 PR #2112 Lean build classification correction

**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T2124Z_s2_orson_vay.md`

**Classification:** ADDITIVE_STATUS_CORRECTION / NO_CODE_CHANGE / NO_NEW_LEAN_RUN

## Correction

The h957 receipt records PR #2112 head `ea298e2fb5cc0ff2dbd41812596d5e8c6003bc35` and successful workflow run #44618618439. The receipt also records the workflow merge-source commit, but the earlier h957 narrative described the result as an exact-head build. The actual job log resolves the distinction:

- PR head: `ea298e2fb5cc0ff2dbd41812596d5e8c6003bc35`.
- Base commit: `598a45b...`.
- Checked-out merge reference: `refs/remotes/pull/2112/merge`.
- Merge commit: `24716770657c1aa4986e53b20c50b98cf3b7ad98`.
- Run: [#44618618439](https://github.com/Satobloc/HsH/actions/runs/44618618439).
- Job: `135893909762`, conclusion SUCCESS.

The correct status is **LEAN_MERGE_REFERENCE_BUILD_SUCCESS**. A standalone build of the PR head `ea298e2...` was **NOT_OBSERVED**. The merge-reference build includes the PR head merged with its base, so the successful compile remains meaningful, but it must not be described as an isolated exact-head run.

## Scope of the successful run

- Lean 4.34.0 / Mathlib 4.34.0 build completed.
- `MemoryLifecycleProjection` compiled.
- Three `#eval` outputs: `some (none, none)`, `some (none, none)`, `true`.
- Five theorem-specific axiom reports list `propext` only.
- Workflow configuration allowed `sorry`; tests, lint, nanoda, leanchecker, and global axiom audit were skipped.
- No `sorryAx` appeared in the five target-module theorem reports, but no global axiom audit was run.

This verifies only the formalized statements in the checked merge-reference build. It does not establish the fidelity of the translation to the MemOps paper, actual LLM memory behavior, or any physical premise.

## Public additive correction

The source-fidelity and CI-status correction was added to existing issue #2115, comment [#7031017472](https://github.com/Satobloc/HsH/issues/2115#issuecomment-7031017472). The exact comment was independently read back. UTF-8 character count: 5,747. SHA-256:

`6e0b8bfb678b420a4ed5925e2d7211b507142aa6c4fbd924df62d92723a453a2`

No new issue, publisher artifact, PR, branch, code edit, workflow run, or theory claim was created.

**Supersession:** This amendment supersedes any unqualified reading of the h957 narrative as “standalone exact-head Lean verification.” The original receipt and published report remain immutable.
