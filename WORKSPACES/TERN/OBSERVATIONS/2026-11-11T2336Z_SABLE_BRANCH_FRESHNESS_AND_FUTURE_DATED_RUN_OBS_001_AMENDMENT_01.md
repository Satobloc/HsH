# Amendment 01: exact blob correction and unverified audit-count withdrawal

**Applies to:** `2026-11-11T2336Z_SABLE_BRANCH_FRESHNESS_AND_FUTURE_DATED_RUN_OBS_001.md`.

The initial observation contains incorrect blob SHA values and an unverified full-tree audit-count statement. Use the following corrected values; disregard the corresponding values in the original observation.

## Correct exact identities

| Object | Correct identity | Verified properties |
|---|---|---|
| `WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json` | `6c5a54d529df364f3487285ac66e6e27a93b6074` | Updated 2026-11-11T10:48Z; ACTIVE_SEED; 18 branch records |
| Main `tools/audit_revival_rotation_v3.py` | `448114daa497510eb936f4cbc76b50c68745bde4` | 219 lines; `self_test()` returns `checks: 7` |
| PR #1173 branch `tools/audit_revival_rotation_v3.py` | `cb1c4e0b42d1fbc97eeb35c1c58501a6fa01a9ff` | 600 lines; `self_test()` returns `checks: 30` |

The initial observation's task-graph, main-auditor, and PR-branch blob strings were incorrect. The PR-branch line count was also incorrect. The exact values above were freshly fetched from GitHub and inspected.

## Withdrawn statement

The initial observation stated that an earlier full-tree audit had reported 661 errors and 1,026 warnings. That count was not verified in this run and no corresponding exact run/log was recovered during this check. **Withdraw that numeric claim; do not use it as evidence.** No full-tree audit was executed in this run.

## Unchanged observations

The following remain as recorded, subject to their stated snapshot scope:
- Current main head `366c9bde54829e22850abc6a0bc42d1ab5065bf6`; its commit changes only `PUBLIC_SITE/generated/discovery.json`.
- PR #1098: 48 ahead / 14,151 behind main.
- PR #1173: 5 ahead / 8,696 behind main.
- PR #1533: 6 ahead / 8,696 behind main, stacked on PR #1173.
- PR #873: 106 ahead / 14,151 behind main; its inspected merge-reference build is not current-head validation.
- The :48 future-dated scheduler observation and its no-cause/no-retry classification.

No code, branch, PR, task, scheduler, or task-graph state was changed. This amendment is additive and supersedes only the incorrect identity/count fields above.
