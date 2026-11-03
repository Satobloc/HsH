# Tern Rook | Comptroller audit: publisher retry gates and nominal rotation timebase

**Date:** 2026-11-03 01:24 UTC  
**Run key:** REVROT3-19-20261011:553:s2  
**Disposition:** SOURCE-GROUNDED CONTROL AUDIT / PUBLISHER RETRY PR NOT MERGE-READY / ONE SCHEDULER TIMEBASE MISMATCH OBSERVED / NO TASK OR CODE CHANGE

## 1. Rotation and execution evidence

The prescribed calculation is:

- Epoch: 2026-10-11T00:00:00Z
- Nominal scheduled time: 2026-11-03T01:24:00Z
- h = 553
- sequence = 5 × 553 + 2 = 2767
- 2767 mod 19 = 12

Selected identity: **Tern Rook**, ring index 12.  
Next identity: **Morrow**, ring index 13.  
Next nominal run key: REVROT3-19-20261011:553:s3, 2026-11-03T01:36:00Z.

The existing :24 automation is ID 6abda4c8eda88191bf23a6f2849e9a17. Its ID-specific readback showed enabled=true, DTSTART 2026-10-01 14:24 America/New_York, RRULE hourly, and unchanged :24 phase. The current run was e23f3767-6034-8325-80e3-7ad29d2c95ea, scheduled 01:24:00Z, started 01:24:18.930095Z, chat_ref=null. At final pre-response readback it was still recorded in_progress; this receipt does not claim a completed scheduler status or an authenticated Tern thread.

The :12 task remains disabled under the current automation roster. The :00, :24, :36 and :48 existing leases remain enabled. No task, ID, DTSTART, cadence, phase, prompt, or enabled state was changed. No sixth task was created.

## 2. Historical Tern authority and provenance

No standalone Nathan-authored Tern specialist-charter file was found. The controlling role is the Comptroller / signalbox remit, supported by:

- Historical conversation: Space Shuttle Roderick — Tern; conversation ID 6ab6609c-3e8c-83ea-b262-627322737cb3; raw export blob 27932a0ca8045c8d53bf01863e1a54e9dc809ae4.
- Historical direct-message locators recorded in the prior source audit: c4f0aae9-3290-42c6-a5d0-b42c19a88255 (2026-09-23 04:27:14Z) and e689eb6e-5814-4a27-a366-796605bd5f4d (2026-09-23 04:48:27Z).
- Current Scheduler Authority, Orchestrator/Comptroller Model, ACTIVE_AUTOMATION_ROSTER and the Tern source-reconciliation report.

The raw historical export fetch in this turn returned an empty content string despite a valid blob SHA, so the raw messages were not re-read from bytes here. The previous source-audited report and recorded direct-message locators were used. The 2026-11-02 01:21 literature-review request in Morrow's inbox is explicitly labelled "Nathan via current assistant" and was not treated as a raw Nathan Direct override. The "one object, one operation" phrase is assistant synthesis, not a Nathan-authored charter quotation.

## 3. Current control state

The following live HsH controls were read:

- BEDROCK.md, blob 38a5b8f4c9d573e54ca4a449be70d0a7d94a484c (568 lines, read in six ranges).
- Steering Charter 2026-10-26, blob 5f4263381afcb065e9062d5b5885593d0baa58db.
- Three Paper Campaign 2026-10-26, blob 9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0.
- New Instance Start Here, blob e1fa2fb7c582a1b4528e9507644bd3f481fce8e0.
- Three-repository onboarding, blob fe40260cda5ce360909f2adfd64a3cc3e2c92a05.
- Revival Rotation V3, blob 90863a2a2b82b2d8e37ba1bd9f796389066f5409.
- Revival Rotation V4, blob 6761337dfcd0847226ee7baad84db0a9c496760a.
- Thread-routing contract, blob d9ea7c3a04e03822c65ee231d0b9545bf37907bd.
- Scheduler Authority, blob 9f7ffbbf0fe77fd4c561a110c9dbb2b686a88b45.
- Current Workflow Orientation V2, blob 2bb6d996ca61f41b2b3fb34480cab1acf906bd4f.
- Orchestrator/Comptroller Model, blob 60fab27ec4699bb2a19c0595ca32a581ac32f28a.
- Task Branch Graph, blob 3c341c616aa893bf56ad5ad5919e09a17e0c2b46.
- Code Grurple Roster, blob cc96c0bfafc95c54e7960899c7306031e5abce17.
- Active Edge Signal Queue, blob 5e03a8754a5bd97cf6b1e59e04155ecfa2fbbd2c.
- Public presentation gate, blob 5f91020d0a71034ad6bed2de0a82ead1f1e48d98.
- Active Automation Roster, blob 6b0bf56316fe14bfd2b0e925154025bd8d04eaa1.

Current main head at inspection: c6ac12656334d68a0fea45eb879519871d2911cd. The task graph's last update remains 2026-10-30; it is a high-level branch map, not a complete PR inventory. No graph edit was made for this draft publisher PR.

Code Grurple remains ACTIVE. Both Paper A and Paper B reader routes remain PRESENTATION_PENDING. Paper A accepted R1 and Paper B reviewed/originator-accepted R1 remain pinned; no manuscript, peer-review, source-hardening or PRIOR_ART work was reopened. The separate P1 November 9, P2 November 30 and P3 December 14 campaign gates remain unchanged. Orson's protected cognition remit remains intact.

## 4. Bounded publisher retry audit

### Current main

- .github/workflows/issue-publisher.yml blob: 689984b19027ed84f0e949f01c4d8a89edf68fee.
- tools/issue_publish.py blob: 7067e8d9f27a273d90e443afb0493260d9a3ecbf.

The current workflow listens only to issues.opened. Its job condition checks the publisher title prefix and github.event.issue.author_association == OWNER. The current script validates the original issue author association. On validation exceptions it prints REJECTED, posts a rejection comment, then returns 0; sys.exit(main()) therefore exits successfully.

### Draft PR #1251

PR #1251 is OPEN / DRAFT / UNMERGED. Head commit f24c5184ff506888adbc635252e3541bd5d583a1, branch fix/issue-publisher-edit-retry-20261102t0536z. It changes three files, with 20 additions and 3 deletions. The three files are the workflow, publication intake guide and publisher script; no test file is added.

- PR workflow blob: 455222a761ca500fd2eb2dc7ca76762e4b35307f.
- PR script blob: 474162d45765c6fc6ab0af2457f1019b04fb8d24.
- The branch adds issues.edited, but the job gate still checks issue.author_association only.
- The script re-fetches the current issue body, then calls validate with only the re-fetched issue object. It drops webhook event.sender before validation.
- The script retains return 0 on validation rejection.

A Python static predicate reconstruction exercised three cases: owner opens an owner-authored valid issue; collaborator edits an owner-authored valid issue; outsider edits an owner-authored valid issue. All three satisfy the present title/author-association gate because the event sender is not part of the predicate. This is a source-derived truth-table check, not a live webhook test or observed exploit. No collaborator/outsider event was generated.

The PR branch is four commits ahead and 707 commits behind current main (compare status: diverged). The PR head has no combined status entries; fetch_commit_workflow_runs returned no PR-triggered runs for that head. The previously identified run #41395548217 has zero jobs. No current-head CI pass is established.

### Issue #1288 and carried issue #1272

Issue #1288 is an open owner-authored publisher issue for submission ariadne-source-strata-jan22-bounded-zero-20261102t2336z-s3-001. Its current body declares SHA-256 63a4a40917b7b953e0fef8c719cde635923c3f0d410bab74a762731892d0b04a and contains 5,145 characters. Issue comments state that the body was corrected after two SHA mismatch rejections from runs replaying the original issue-open event snapshot. The comment reports a green run despite a REJECTED publisher comment; the script's return-0 path explains that status mismatch. The exact issue run ID was not recovered and the current body digest was not independently recomputed in this turn.

Expected artifact path WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-source-strata-jan22-bounded-zero-20261102t2336z-s3-001.md returned 404.

Carried issue #1272 remains SUBMITTED_NOT_VERIFIED; its expected artifact path also returned 404. No duplicate issue was created and no direct-write publication bypass was attempted.

### Required acceptance gate before merge

1. Preserve webhook event.sender.login through validation and enforce an explicit repository-owner or authorized-actor allowlist in both workflow and script. Original issue author association and current editor authorization are separate checks.
2. Keep current-issue re-fetch to avoid stale event-body publication, but pass the authenticated event actor alongside the current issue.
3. After posting a REJECTED comment, return a nonzero process status or expose a machine-readable rejected result that the workflow explicitly treats as failure.
4. Add tests for owner open, owner edit, collaborator edit of owner-authored issue, outsider edit, stale event/current-body re-fetch, idempotent same-ID/same-bytes, same-ID/different-bytes collision, invalid schema/SHA and nonzero rejection status.
5. Rebase/reconcile against current main, then run exact-head CI and inspect actual job logs before any merge decision.

**Disposition:** PR #1251 is not merge-ready. The actor-authorization gap and false-green rejection semantics are source-confirmed. Existing PR comments already record the actor issue and the newer status issue; no duplicate review comment was posted. No code, workflow, PR, issue or branch was modified.

## 5. Nominal-hour versus start-time discrepancy

The :00 automation run c716a65d-d5e0-8332-9198-e885bb12beb1 was scheduled for 2026-11-03T01:00:00Z but started at 00:58:55.006490Z, 64.99351 seconds early. Its completed result reports h=552 and selects Mira (index 5).

Using the required nominal scheduled timestamp gives h=553, sequence 2765, index 10, which selects Nadir Voss. Using the actual start timestamp gives h=552, sequence 2760, index 5, which selects Mira. The recorded selection exactly matches the start-time basis, not the nominal scheduled-time basis.

This is one observed mismatch, consistent with using started_at/current time instead of scheduled_for. It is not evidence of a systematic scheduler defect. The current :24 run started after its 01:24 scheduled time and its Tern selection is consistent with h=553.

No task prompt or schedule was changed. Future runs should use the nominal scheduled_for timestamp whenever exposed; started_at is execution timing, not the rotation epoch input.

## 6. Lean, tools and evidence limits

Existing PR #824 and its modules TernSchedulerEvidence, TernSchedulerInferenceGate, TernH515SchedulerOverlapEvidence and TernH511Lane3DispatchEvidence were inspected. They formalize earlier finite scheduler snapshots, not this h=553 scheduled-versus-started discrepancy or the current publisher actor/status predicate.

The runtime has no local lean, lake or elan executable. No GitHub Actions workflow-dispatch tool is exposed, and PR #824 is an existing draft branch, not a safe current-base verification route. No new Lean module was added and no Lean compile is claimed. The Python arithmetic and predicate truth table are execution checks, not Lean proofs.

The HQ Tool Chest and Reference Desk were consulted. No new tooling, dependency, paid service, branch or PR was introduced. Local checkout is absent. The issue publisher was not used for this internal audit because its validation/exit semantics are under review and the public PR comments already carry the findings.

## 7. Reading, review and boundaries

Unrelated reading completed: Charles Babbage, Reflections on the Decline of Science in England, HSH_RESOURCES blob fa52e41ab73566a13109a0a7aeaed3e895b41163, lines 693-732. The passage discusses the delay between abstract scientific discovery and practical application, including Huygens' theorem, the hydrostatic paradox and Bramah's press. Next cursor: line 733.

Last full FIE review: 2026-10-27. Next review due 2026-11-10.

No physical calculation, CODATA comparison, measured-system fit, H(s)H prediction, paper-gate advancement, BEDROCK change or theory promotion occurred. No protected PRIOR_ART material was accessed. No signet was used and no conversation was renamed.

## 8. Successor

Next identity: Morrow, expected 2026-11-03T01:36:00Z. The optional handoff is repository-only context, not a task, ownership transfer or response obligation. Preserve Morrow's Team Archivist/archive-provenance remit and direct theory stop; training completion/status is not asserted. ChatGPT-thread delivery, consumption and acknowledgment are not claimed.
