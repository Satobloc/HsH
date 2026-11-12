# Amendment 01 | Control-hash correction and same-run scheduler readback

**Applies to:** `WORKSPACES/MERIDIAN/2026-11-12T0236Z_P0_WORKFLOW_TRIGGER_SCOPE_AND_ROUTE_READINESS_AUDIT.md`  
**Run key:** `REVROT3-19-20261011:770:s3`  
**Status:** ADDITIVE CORRECTION. The original report and canonical receipt remain preserved.

## 1. Corrected live control identities

The original report's Section 2 contains several incorrect control-file hash strings. Those strings are withdrawn as source identifiers. The following are the exact Git blob identities returned by fresh reads from the HsH default branch:

| Control | Exact blob SHA-1 |
|---|---|
| `BEDROCK.md` (667 lines) | `0253ace674bbc361464b7bbaac2c41aa3d8e8867` |
| Primary Operational Guideline, 2026-11-08 | `a8e333b1d5b5aa1d9772366945dd88769d24153c` |
| Steering Charter, 2026-10-26 | `04822f3e48f746e9e464d893636ed4a670d68683` |
| Three Paper Campaign, 2026-10-26 | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Common New Instance Start Here | `43b577d42b8cced83f8836934598081685ea3ff3` |
| Revival Rotation V3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| Revival Rotation V4 | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Current Workflow Orientation V2 | `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f` |
| Task Branch Graph | `6c5a54d529df364f3487285ac66e6e27a93b6074` |
| Code Grurple Roster | `cc96c0bfafc95c54e7960899c7306031e5abce17` |
| Meridian CURRENT_WORK at re-read | `52a3ce460f8c24642cf90ff2f32203a614be8f85` |
| Meridian New Instance Start Here | `0be5e3ca222dca099c4c8402a066316ceb9e408a` |

The Meridian historical remit was checked against three archived raw exports, not a standalone signed charter:

- Meridian [HsH] Michelstein-on-Meinorly: conversation `6a9aa91b-11f4-83ea-80a1-4d502522e441`, blob `d21e251df093013903cc19789ded562f83b6e6ea`, 343 mapping nodes.
- Meridian Free Build: conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, blob `7af1561b321f4d9364da5eb111df689efc652827`, 2,500 mapping nodes.
- Meridian Minkowski Ring Analysis: conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, 3,678 mapping nodes; latest direct user message observed 2026-10-21T18:53:24.402Z in the selected source sample, while the workspace's recorded final message is 2026-10-21T23:58:09.107Z.

The direct-source remit concerns graticule symmetry/parity/handedness, angular relations without adding an independent parameter, configurable/scriptable geometric solvers, preserving multiple admissible Whirligig solutions with a stated least-wild preference, and source-faithful GR-QM solver audit. No standalone signed Nathan-authored Meridian charter or authenticated current Meridian thread was recovered. The controlling current assignment remains Paper A accepted-R1 presentation support only.

## 2. Main-branch comparison refreshed

The original report's 162-ahead comparison was a historical prewrite snapshot at main `416799cc9180e3880d2b2a608189c0671a6bfd5e`.

A fresh comparison from P0 baseline `242a1318b590983b6d00ca4ca3558840a4b074cb` to main `d750a9312ac0184cd959416803aefbe246d2042e` returned:

- 172 commits ahead;
- 0 commits behind;
- 172 total commits;
- no Paper A/B source, Papers feed, presentation gate, reader-routing registry, presentation contract, generated papers index, or Viewer/Whirligig Pages workflow path in the returned changed-file list;
- the only `PUBLIC_SITE/` path in the returned comparison was `PUBLIC_SITE/generated/discovery.json`.

This is a repository diff observation only. It is not a deployment, derivative, browser, route, or visual acceptance witness. The eight protected P0 blob matches recorded in the original report remain the last direct blob re-fetch result; this amendment does not claim a new eight-file re-fetch.

## 3. Same-run :36 start-field mutation

The original Tern h770 observation recorded the :36 Meridian run as:

- task ID: `6a9f52b69ec08191b0a2ba24a074f781`;
- run ID: `de7e20db-6488-8333-b3c6-a3fa1578aa94`;
- scheduled_for: `2026-11-12T02:36:00Z`;
- earlier reported started_at: `2026-11-12T02:35:16.177509Z`.

Two later exact-ID reads returned the same run ID and scheduled_for, but a changed started_at:

- later reported started_at: `2026-11-12T03:02:46.570438Z`;
- exact field delta: **1,650,392,929 microseconds = 27 minutes, 30.392929 seconds**;
- recorded status: `IN_PROGRESS`;
- completed_at: null;
- run-level chat_ref: null.

The task-level summary still reports stale `next_run_time=2026-11-11T21:36:00-05:00` and `last_run_time=2026-11-12T01:47:08.817054Z`. Its cached latest_result is the prior Nadir h769:s3 run `62f4f496-5764-8328-b39d-56de10a9fdb8`, created at 01:47:03.235293Z, not the current Meridian run.

Classification: `SAME_RUN_ID_START_FIELD_MUTATION / TASK_SUMMARY_FIELDS_STALE / CAUSE_UNKNOWN`.

No retry, restart, duplicate execution, backend defect, worker substitution, actual process liveness, or causal ordering is inferred. Attempt-history identifiers and provider-side snapshot timestamps remain unavailable. The original Tern observation is preserved; see its additive Amendment 01.

## 4. P0 and proof boundary unchanged

The current Pages workflow source is blob `6f3e843b6a327db76b21e8b0b61a26c210b600ac`. Its push trigger is restricted to `main` and explicit Conversation Viewer, build-tool, manifest, and Whirligig paths. It also permits a separate `workflow_dispatch`. Paper A/B source, feed, reader routes and their derivatives are not in the listed automatic push path scope.

The current P0 status remains:

- source pins and feed binding: PASS as previously recorded;
- Paper A/B derivative identity: NOT_OBSERVED;
- Paper A/B deployment identity: NOT_OBSERVED;
- authorized observation capability: NOT_AVAILABLE;
- live route readback and visual acceptance: NOT_OBSERVED;
- route status: `PRESENTATION_PENDING / NOT_OBSERVED`, not PASS and not FAIL.

Existing PR #1471 remains OPEN / DRAFT / UNMERGED. No exact-head build was verified in this run. The missing `WorkflowTriggerScope` formalization remains `FORMALIZATION_BLOCKED_DEFINITION` until the exact branch/path glob semantics, event semantics, changed-path set, and separate manual-dispatch provenance are specified. No theorem, Lean build, physical calculation, measured dataset, fit, prediction, route probe, manuscript edit, or theory promotion is claimed.

## 5. Coordination and task preservation

The same-run observation amendment is routed to Tern's existing scheduler remit. The existing Mercer successor inbox marker is amended with a repository-only post-start optional handoff; it creates no task, review request, deadline, response obligation, or ownership transfer. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

The existing :36 task remains enabled under ID `6a9f52b69ec08191b0a2ba24a074f781`, with its original hourly America/New_York :36 schedule and prompt unchanged. No task, ID, cadence, phase, or enabled state was changed. No sixth task was created.
