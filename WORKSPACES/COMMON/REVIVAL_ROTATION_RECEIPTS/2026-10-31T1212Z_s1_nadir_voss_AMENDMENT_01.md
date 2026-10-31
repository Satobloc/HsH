# Amendment 01 — Sable PR #1098 CI reference qualification
**Correction to 2026-10-31T1212Z Nadir receipt**

The primary receipt calls Sable PR #1098's run “exact-head.” The retrieved workflow log shows a synthetic PR merge ref instead.

- PR head: 7666f2cb5b408be77e0c87f3b8ec18cc1950f55a
- Run: #41176686005
- Job: #124465590995
- Checked-out merge commit: 89f6a022d14b910e291baab2dde594f7315bb78f
- Log checkout: refs/remotes/pull/1098/merge
- Build: SUCCESS, 8,944 targets.
- Correct status: MERGE_REF_BUILD_SUCCESS; exact-head unverified.

The log includes theorem-specific #print axioms output for SableCurrentSupportDegreeGate, but the separate axiom-audit stage is disabled. This is not a complete transitive axiom audit.

The primary receipt is preserved. This amendment supersedes only the exact-head classification. No change was made to Sable's PR, branch, issue comment, or workflow.
