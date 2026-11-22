# Morrow h1028:s3 — Publisher conflict classification and bounded recovery

**Date:** 2026-11-22, nominal slot 20:36Z  
**Run key:** `REVROT3-19-20261011:1028:s3`  
**Disposition at report creation:** Layer 19 added and readback pending; prior h1024 publisher intake has one bounded retry in progress.

## 1. Deterministic selection and authority

- (h=1028); (seq=5h+3=5143); (5143\bmod19=13).
- Ring label: **Morrow**, index 13.
- Next label: **Kestrel**, index 14.

The role lineage is source-grounded in the HsH Morrow README and verified source-correction ledger:

- Nathan's provisional Team Archivist assignment is user-role message `402ade01-7116-4efb-9b14-31e477754458`.
- The later direct theory stop is user-role message `934e87de-4e61-4622-a0ea-e5047aa235c6`.
- The later archive/maintenance trial invitation `99ae959b-fbeb-4c1e-9326-a6723c2b9557` does not expressly release the stop.
- No separately signed specialist charter or authenticated current Morrow thread was established.

The authorized scope remains archive/source custody and operational provenance. This report does not perform theory integration, Lean theory proof, physical calculation, equation correction, prediction, fit, independent measurement, paper development or BEDROCK promotion. The deterministic label does not authenticate a historical Morrow instance.

## 2. Preflight and current-state reading

The live HsH `BEDROCK.md` was retrieved at blob `2629ab29a5838d933c31727455553d206577a258` (753 lines). The review covered the full file, with particular attention to the 2026-11-21 autonomous archive-stewardship and priority-intake directives, the 2026-11-08 Primary Operational Guideline precedence, the signet restriction, the 2026-10-25 real-data-first rule, and the theory/status boundaries. No BEDROCK edit or theory-status change was made.

Other current controls read:

- Primary Operational Guideline: `WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md`.
- Steering Charter and Three-Paper Campaign: current 2026-10-26 control documents, with their November 21 updates.
- New-instance onboarding, three-repository orientation, revival rotation v3 and scheduler authority.
- Morrow README, BOOT, CURRENT_WORK, INBOX, TRIAL_CHECKPOINT (targeted current/tail coverage), SOURCE_IDENTITY_GATE and recent h1013/h1024 reports and receipts.
- Current Tern h1028:s2 control-plane report and the PWH queue.
- HsH, SAT archive and HSH_RESOURCES front doors. HSH_RESOURCES inspection was limited to its README and `indexes/AI_START_HERE.md`; no private research payload was opened.

The Morrow continuity state had a specific pointer defect: CURRENT_WORK's latest checkpoint was h1024, while BOOT still pointed to h1013/h1009. The detailed trial log also needed this run's additive entry. These pointers are corrected in the accompanying continuity updates.

Mersearch is not available as a callable action in this runtime. All four canonical request files were read and remain `status=requested`; no lane was overwritten, released, retriggered or consumed. GitHub API search/readback is not represented as a Mersearch search.

Project controls remain: P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P2 measured-system paper HOLD; P3 full-theory paper INCOMPLETE. The task graph remains 18 records against 16 declared, with 17 reachable and one blocked branch. PWH remains Tern-coordinated; no queue ownership or priority was changed. FIE's latest full review is November 20, next December 4; the latest unrelated-reading break was November 21, so neither was repeated.

## 3. Applied publisher incident: issue #2359

The prior h1024:s4 Morrow report has one existing publisher intake:

- Issue: [#2359](https://github.com/Satobloc/HsH/issues/2359).
- Submission: `morrow-h1024-s4-open-carrier-source-custody-20261122t1648z-001`.
- Declared SHA-256: `d07bbeceefc4d38f070d1b5be878fbbc5227d1a8436550a96a7838f321051632`.
- Workspace report: 10,913 UTF-8 bytes.

Attempt 1 of [Actions run #45047667817](https://github.com/Satobloc/HsH/actions/runs/45047667817), job `137285700763`, failed at the Contents API PUT in `tools/issue_publish.py` line 66 with HTTP 409 Conflict.

The job reached the PUT after validation and an initial target-path GET. Therefore the failure was not the earlier SHA-256 rejection pattern. Before retry, the issue body was still unchanged, there were zero publisher comments, and the canonical target artifact returned 404.

The workflow checkout reported commit `39be1f81d0139f7aba20eb6296242f036e0e464c`. A later main commit `d3b4c73c2daed3ef200cb95cb5ade8c8a808b09a` is its direct child and has commit time 17:08:51Z; the failed PUT was logged at 17:08:57.827Z. This supports a concurrent main-ref advancement explanation, but the HTTPError response body was not captured. The exact 409 cause is therefore **UNCONFIRMED**.

The existing workflow concurrency group serializes publisher jobs, not every unrelated write to `main`. The current publisher script performs GET-then-PUT against `main` and has no explicit 409 recovery.

## 4. Substantive workflow improvement: Source Identity Gate Layer 19

Added **Layer 19 — Publisher write-conflict classification and bounded ref-race recovery** to the existing `WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md`.

The new layer separates:

1. Payload freeze/digest mismatch.
2. Publisher schema or authority rejection.
3. Target absent at precheck.
4. Write conflict HTTP 409.
5. Target collision.
6. Readback mismatch.
7. Published and independently verified.

It adds a bounded recovery rule: preserve the original issue; re-read envelope, comments, target and main head; permit exactly one rerun of the same failed publisher job only when the target remains absent, the envelope is unchanged and main advanced after the failed checkout. If the target exists with different content, stop. If the single rerun also conflicts, stop and escalate. No duplicate issue, manual canonical write, issue-body edit or third attempt.

This is an operational state-machine improvement, not a code change to the publisher, a universal fix for Contents API conflicts, or a claim that the precise cause of the observed 409 is proven.

Source Identity Gate update:
- Commit: `40a2239e935102368c83707747fb2104c4b9fcd9`.
- New blob: `9e86da377e1a58f71b810e410405121ecbb5979d`.
- File length after addition: 77,004 characters.

## 5. Bounded recovery attempt

After rechecking issue #2359, confirming the canonical target was absent, and observing that main had advanced from the failed checkout, one rerun of the failed publisher job was submitted on the same run and same issue.

- Run #45047667817, attempt 2.
- New job: `137348432379`.
- At the last poll, attempt 2 was still IN_PROGRESS in checkout; no publisher comment or artifact had appeared.
- Therefore the h1024 publication remains **SUBMITTED_NOT_VERIFIED / RETRY_IN_PROGRESS** at this report's cutoff. No publication success is claimed.

No second issue was created. The h1024 report and original issue envelope were not edited.

## 6. Repository, clone and scheduler boundaries

No local repository clone or checkout was performed in this run. Repository access used GitHub API/Contents/Issues/PR/Actions interfaces. The failed and retried publisher jobs are Actions checkout materializations, not GitHub Traffic clone counts. Traffic attribution remains UNKNOWN.

The existing :36 automation was not modified. Its ID, exact hourly schedule, prompt and phase remain unchanged. No sixth task, scheduler mutation, signet or conversation rename.

At the last exact-ID peek, the current :36 run was IN_PROGRESS with null completion and null `chat_ref`. Its cached result belonged to the preceding h1027 Hale run, not this Morrow execution. No current-thread identity or cross-thread delivery is claimed.

Kestrel remains next in the fixed ring. Its INBOX already has two optional Morrow source-custody packets, so no third packet, assignment or response obligation was created. No direct-thread delivery, consumption or acknowledgment is claimed.

## 7. Return cursor

- Source Identity Gate Layer 19, blob `9e86da377e1a58f71b810e410405121ecbb5979d`.
- Issue #2359, publisher run #45047667817 attempt 2, job `137348432379`.
- Morrow h1024:s4 report and receipt; append an amendment only after the actual retry outcome and canonical readback are known.
- Update Morrow BOOT/CURRENT_WORK/TRIAL_CHECKPOINT to this h1028:s3 state.
- Keep the direct theory stop active. No theory, Lean, physical or paper work is authorized by this run.
