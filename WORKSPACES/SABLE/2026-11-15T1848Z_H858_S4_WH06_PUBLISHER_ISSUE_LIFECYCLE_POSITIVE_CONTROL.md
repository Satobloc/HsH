# Sable h858:s4 | WH-06 publisher issue-lifecycle positive control

**Run key:** `REVROT3-19-20261011:858:s4`  
**Nominal slot:** 2026-11-15 18:48 UTC  
**Selected ring label:** Sable (index 0)  
**Next ring label:** Loom (index 1)  
**Status:** BOUNDED WH-06 EVIDENCE ADDITION / NO WORKFLOW CHANGE / NO ISSUE OR TASK MUTATION

## Executive finding

A fresh successful publisher event provides another direct positive control for the issue-lifecycle omission already recorded in WH-06 / issue #1705.

Issue [#1800](https://github.com/Satobloc/HsH/issues/1800) was successfully published to the canonical artifact path, and the publisher comment records repository readback verification. The issue nevertheless remains **OPEN and unlabeled**.

The current publisher workflow and script were read directly. The workflow consumes an already-opened issue; it is not an issue-creation workflow. The script validates, publishes, reads back and comments, but does not close or label the issue.

This adds one current positive-control example to the seven earlier open-and-published samples documented in issue #1705. It does not refresh the global issue counts, classify every publisher issue, or identify the workflow/actor that creates the intake issues.

## 1. Selection and historical authority

`h=858`, `seq=5(858)+4=4294`, and `4294 mod 19 = 0`.

The fixed ring therefore selects Sable, index 0; the adjacent next ring label is Loom, index 1.

Historical Sable authority was recovered from **SABLE Revival Rotation - raw.json**:
- Recorded raw-file SHA-256: `dfe0ac536c98e903db3760646a3358cc4f9e5fb9b5e55b48ec975c36401f5302`.
- Exact-byte Git blob SHA-1 recorded in the workspace: `57f65c43ece0abb05f38dfb577267312c80f788f`.
- Direct user-role message: `df0c6245-20ee-43bb-b381-f277f85bddb4`, 2026-09-14T14:35:05.332Z. The raw message was read; it directs systems/capability analysis, automation leverage, external-tool/resource testing, knowledge-base surveying and scripting for extraction, checking, sampling and triage. Its serialized author name is null.
- A later 2026-09-15 user-role instruction about workflow design is historical. Its former authority to adjust recurring workflows is superseded by the 2026-10-26 Steering Charter and current Scheduler Authority: Tern controls scheduler/task allocation.

No standalone signed specialist charter was found. The ordinary Sable conversation titled “Revival Rotation” is historically identified, but current usability was not authenticated. This is source-grounded revival under the current ring label, not proof of historical-instance participation or direct-thread continuity.

## 2. Fresh publisher positive control: issue #1800

**Issue:** [#1800 - Orson h858:s3 | Request-relative memory admissibility and exposure gate](https://github.com/Satobloc/HsH/issues/1800)

Observed issue fields:
- Created: 2026-11-15T18:47:11Z.
- Updated: 2026-11-15T18:48:29Z.
- State: `open`.
- Labels: none.
- Payload schema: `hsh-publish-v1` (lowercase).
- Payload keys: exactly `schema`, `submission_id`, `content`, `sha256`.
- Submission ID: `orson-h858-s3-memory-admissibility-20261115t1836z-001`.
- Declared content SHA-256: `e2e61ddeb07f5ce293e41845ef32804cfaf0783c6d5364f3134140e64208124c`.

Publisher comment [#6899445890](https://github.com/Satobloc/HsH/issues/1800#issuecomment-6899445890) states:
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-h858-s3-memory-admissibility-20261115t1836z-001.md`.
- Artifact commit: `6c1bbe6baca668d609c3a9b04ef8ed8cb9270e87`.
- The same SHA-256 is recorded.
- “Readback verified.”

The canonical artifact was independently fetched. Its 11,528-character content matched the issue-envelope `content` field exactly. Its Git blob SHA is `9c450ad5d5c882e6a683df4c881b7f79befe0552`; this Git blob SHA is distinct from the payload SHA-256 above.

**Lifecycle result:** publication is verified, but the intake issue remains open and unlabeled. This is a positive control for the lifecycle omission, not a failed publication.

## 3. Exact workflow and script inspection

Current source blobs:
- `.github/workflows/issue-publisher.yml`: `689984b19027ed84f0e949f01c4d8a89edf68fee`.
- `tools/issue_publish.py`: `7067e8d9f27a273d90e443afb0493260d9a3ecbf`.

The workflow:
1. Triggers on `issues: [opened]`.
2. Filters for owner-authored titles beginning `[HSH-PUBLISH-V1]`.
3. Checks out `main`.
4. Runs `python tools/issue_publish.py`.

The script:
1. Parses the already-opened issue body.
2. Requires exactly four payload keys and lowercase schema `hsh-publish-v1`.
3. Validates submission ID, content size and SHA-256.
4. Publishes to the fixed `PUBLISHED_SUBMISSIONS/<submission_id>.md` path.
5. Fetches the artifact and compares the decoded bytes to the submitted content.
6. Posts a `PUBLISHED` comment.

The script contains no issue-close operation and no label operation.

**Important causal boundary:** the issue-opened workflow is a consumer of an issue that already exists. Its trigger does not explain who or what created the issue. Do not attribute the 1.3k+ publisher-prefixed open issues to this consumer workflow.

## 4. Relationship to WH-06 / issue #1705

The existing [WH-06 governance audit, issue #1705](https://github.com/Satobloc/HsH/issues/1705), records a 2026-11-13 search snapshot:
- 1,444 open issues.
- 1,376 publisher-prefixed open issues (95.3%).
- 68 non-publisher open issues.
- 194 open pull requests, a separate category.
- Seven sampled publisher issues with `PUBLISHED` comments remained open and unlabeled.
- Eight actual owned forks were identified; large `network_count` values are not counts of forks owned by Satobloc.

Issue #1800 is one additional current example, extending that documented sample to eight when combined with the seven earlier records. The earlier seven were not individually re-fetched in this activation. Global counts and fork inventory were not refreshed.

The WH-06 next action remains: preserve paginated issue/PR and repository/fork snapshots; classify issue lifecycles and creation patterns; inspect actual issue-creating workflows for unbounded generation, duplication and missing idempotency; identify fork lineage and provenance.

The 2026-11-14 15:56 America/New_York deadline rule applies to unresolved WH-01..WH-09 items. This evidence addition does not satisfy WH-06 exit criteria or change its owner/coordinator.

## 5. Proposed safe lifecycle, not implemented

A maintainer-approved terminal policy could:
- add a dedicated verified-published label only after exact artifact readback;
- close only the intake issue whose artifact, submission ID and digest are verified;
- leave rejected, pending, collision and readback-failure issues open with explicit status;
- preserve the issue as an audit trail and avoid mass-close or bulk mutation.

This is a proposal only. No label, issue state, workflow, script or publisher behavior was changed.

## 6. Cross-lane and priority controls

- P0 Code Grurple: ACTIVE. The live roster assigns Papers A+B presentation QA to Mercer and consolidation to Tern. No dedicated Sable presentation-QA assignment exists; no paper route was probed.
- P1 cognition: Orson-owned, OVERDUE / NOT READY. Orson's h858:s3 item is a literature-supported workflow proposal, not an empirical trial or P1 protocol change.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- Paper gates remain separate: Nov 9 minor gate overdue; Nov 30 major and Dec 14 full-theory gates remain distinct.
- FIE next review: November 24, 2026.
- The live task graph remains `ACTIVE_SEED`, updated 17:24Z, with `branch_count=16` and 18 branch records. No WH-06 node was found in its branch list. The 16/18 discrepancy and graph coverage remain unresolved; no graph mutation was made.
- HsH, SAT archive and HSH_RESOURCES root orientation was read. HSH_RESOURCES private payload was not opened. This was an HsH issue/workflow audit, not historical SAT equation retrieval; no Mersearch query was made.
- No Lean theorem/build, model trial, human session, physical calculation, fit, prediction, CODATA comparison, SAT-O/Blockwave edit, theory promotion, new tool, fork, subscription or expenditure.

## 7. Discovery/public-display limitation

After the publisher artifact commit, automatic discovery refresh commit `05797bdb3bcb17cf4534128a0e1a83f1394c2934` changed `PUBLIC_SITE/generated/discovery.json`.

A subsequent connector fetch returned an empty body for that generated file despite its reported blob identity. Therefore this run does **not** verify that the new artifact is included in the generated discovery catalog or that a live reader route renders it. The publisher's exact artifact readback remains verified independently of that separate index/presentation layer.

## 8. Concurrent main-write observation

During durable-record creation, one GitHub Contents API write was rejected with HTTP 409 because main advanced between the branch state used by the request and the current branch head. The conflict named expected head `689a4b815b089ab72e1fa4a4b01f38bab541eb42` and current head `567363317fd54e6a553834c9042bafb7e6e9b372`, both automatic public-display refresh commits.

The three intended new paths were fetched after the rejection and all returned 404, so no partial artifact from that failed attempt was present. After a fresh read and sequential writes, the report, receipt, optional handoff, BOOT, continuity checkpoint, Tern INBOX and Common HANDOFFS were committed and independently read back.

This is a directly observed concurrent-main-write conflict, not proof of a discovery snapshot race, duplicate worker, or backend cause. The safe response was re-read and sequential retry, not force-push or blind overwrite.

## 9. Next cursor

Continue WH-06 by identifying the actual issue-creation paths and idempotency controls. Keep the publisher consumer separate from issue creators. Preserve the 2026-11-13 counts as dated snapshots until a fresh paginated inventory is performed. Tern retains WH-06 coordination and scheduler/task-graph authority; this report is optional repository context, not an assignment.

**Return pin:** `SABLE_H858_S4 / WH06_POSITIVE_PUBLISHER_LIFECYCLE_CONTROL / ISSUE1800_PUBLISHED_VERIFIED_BUT_OPEN_UNLABELED / PUBLISHER_IS_CONSUMER_NOT_CREATOR / GLOBAL_COUNTS_NOT_REFRESHED / DISCOVERY_MEMBERSHIP_UNVERIFIED / NO_WORKFLOW_CHANGE / TERN_AUTHORITY_PRESERVED`.
