# REVROT3 schema-v2: unresolved role source and absent-charter regression gap

**Classification:** assistant-authored, source-derived test-coverage finding. This is not Nathan Direct, a policy amendment, a security boundary, a worker assignment, or evidence of worker/thread participation.

## Finding

The existing REVROT3 eligibility auditor can represent a real but currently untested provenance state:

- `eligibility_status = MANUAL_REENTRY_REQUIRED`
- `role_source_class = UNRESOLVED`
- `charter_access_status = NOT_PRESENT`
- `charter_read_performed = false`
- no role-source locator or source blob
- no payload, private-material access, inbox write, or missed-check-in count

This state is distinct from a charter that exists but is blocked by quarantine. `NOT_PRESENT` and `BLOCKED_BY_QUARANTINE` should not be collapsed.

The source basis is the current Alberr workspace README and Nathan's direct September 22 reentry signal. The README is assistant-maintained operating guidance, not a signed specialist charter. The 2025 young-Albert/Alberr historical conversation and the separate 2026 Pocket-TOE numerical-audit check-in are distinct source objects; neither is established as a signed specialist charter. The direct reentry signal requires manual reopening and a direct answer to Nathan before assigning a review, lease, or current-theory task.

## Exact code and CI inspection

Existing draft [PR #1533](https://github.com/Satobloc/HsH/pull/1533), stacked on [PR #1173](https://github.com/Satobloc/HsH/pull/1173), is the correct existing implementation surface. No new tool or parallel validator is warranted.

- Current PR head: `1b0a94b24303f6d36d677061270a5fd2e368f3f5`.
- Auditor file blob: `4382e2cf051b170853bf01a91f5305cc8e84fc22`.
- PR remains OPEN / DRAFT / UNMERGED.
- The code explicitly accepts `UNRESOLVED` and `NOT_PRESENT`, rejects a source locator/blob for `UNRESOLVED`, and rejects `charter_read_performed=true` for `NOT_PRESENT` or `MANUAL_REENTRY_REQUIRED`.
- The 60-check self-test uses `CLEARED_SHARED_ROLE_WITNESS` with `BLOCKED_BY_QUARANTINE` for its charter-provenance fixture. A source scan of the exact current file found no `UNRESOLVED` or `NOT_PRESENT` literal in the self-test body. Those values occur in validation logic, not in a positive regression fixture.
- Exact-head push Actions run [#43927173617](https://github.com/Satobloc/HsH/actions/runs/43927173617) checked out the current PR head. Python compilation and the auditor self-test passed; the read-only full-repository audit failed on historical corpus errors. The PR's follow-up records 660 pre-existing errors, 1,024 warnings, and zero eligibility-specific errors. This is not a full-audit pass.
- PR merge-reference run [#43927186291](https://github.com/Satobloc/HsH/actions/runs/43927186291) likewise reports the self-test step successful and the repository audit step failed.

## Proposed regression case

Add one positive fixture using the exact no-charter/manual-reentry state:

```text
eligibility_status: MANUAL_REENTRY_REQUIRED
eligibility_schema_version: 2
payload_to_selected: NONE
private_material_accessed: false
inbox_write: false
count_this_as_miss: false
role_source_class: UNRESOLVED
charter_access_status: NOT_PRESENT
charter_read_performed: false
role_source_locator:
role_source_blob_sha:
authorization_policy_blob_shas: be44c424674764c602b5f618dfce528c0f97b0ef;3e660680f66700b24b3c9d9151f3acbd93db1dfa
```

The two policy blob SHAs identify the current Steering Charter and direct reentry signal. Empty locator/blob fields are intentional: an unresolved role source must not be dressed up as an identified source.

Expected result by static inspection of the current validator: **accepted with no errors**. This exact fixture was not executed in this run, so no test pass is claimed.

Add negative mutations to the same fixture:
1. `charter_read_performed: true` must fail.
2. A nonempty `role_source_locator` or `role_source_blob_sha` while `role_source_class=UNRESOLVED` must fail.
3. `role_source_class: SIGNED_SPECIALIST_CHARTER` while `charter_access_status=NOT_PRESENT` must fail.
4. A research payload, private-material access, inbox write, or missed-check-in count under `MANUAL_REENTRY_REQUIRED` must fail.

These tests validate declared metadata consistency only. They do not authenticate a worker, prove that a source was actually read, enforce GitHub permissions, establish consent, or prove delivery to a ChatGPT thread.

## Current-run disposition

The nominal slot is `h973:s3` (`2026-11-20T13:36Z`): `seq=4868`, ring index `4`, Alberr; next label Mira, index `5`. This is deterministic bookkeeping only.

The current :36 provider run is `5e76d399-b704-832b-9fe9-a11c724bd450`, scheduled for 13:36Z, started at 13:32:23.929437Z, last observed IN_PROGRESS, completion null, and run-level `chat_ref=null`. The cached result belongs to the preceding Orson h972:s3 run `68affdae-f03c-8320-8f64-2c016a721185`; it is stale for this run. The task's configured conversation target is not substituted for a current-run thread binding.

Accordingly, this is assistant-level control-plane review only. No Alberr task, review, lease, first-blush, response obligation, workspace/inbox write, or successor handoff was created. No choice, decline, participation, or acknowledgment is inferred.

## Limits and preserved state

- No Mersearch action was available; the four existing request lanes were not changed or represented as searched.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, PR #1533 and PR #1173 were checked. No new tooling, dependency, fork, subscription, or cost.
- No local Lean/Lake/Elan executable is available. This is an operational metadata regression proposal, not a mathematical/geometric theorem. No Lean proof or compilation is claimed.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, manuscript edit, or BEDROCK promotion.
- P0 remains ACTIVE; P1 remains Orson-owned / NOT READY; P2 remains HOLD; P3 remains INCOMPLETE.
- Existing :36 task ID, enabled state, exact hourly schedule, prompt, and phase remain unchanged. No sixth task.

## Source controls

- `WORKSPACES/ALBERR/README.md`
- `WORKSPACES/COMMON/ALBERR_DIRECT_REENTRY_SIGNAL_2026-09-22.md`
- `WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md`
- `WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md`
- `WORKSPACES/COMMON/REVIVAL_ROTATION_THREAD_ROUTING_2026-10-11.md`
- `WORKSPACES/COMMON/REVIVAL_ROTATION_DUPLICATE_RUN_KEY_GUARD_2026-11-07.md`
- `WORKSPACES/COMMON/ISSUE_PUBLICATION_INTAKE_V1_2026-10-15.md`

**Disposition:** `TEST_GAP_IDENTIFIED / SOURCE_CLASS_UNRESOLVED / CHARTER_NOT_PRESENT / PR1533_UNMODIFIED / NO_ASSIGNMENT / NO_ALBERR_PARTICIPATION_CLAIM / NO_LEAN_RUN / TASKS_UNCHANGED`.
