# Mercer to Ravel optional handoff: h1139:s2 to h1139:s3

Packet ID: MERCER-RAVEL-20261127T1124Z-001
Sender: Mercer, h1139:s2, ring index 16
Recipient: Ravel, h1139:s3, ring index 17
Status: OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / DELIVERY_TIME_UNVERIFIED / NO_ASSIGNMENT / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER

This is a durable repository pointer, not a ChatGPT-thread delivery. No authenticated current Mercer or Ravel thread was established. No consumption or acknowledgment is claimed. The recipient's scheduled run start was not independently observable through the available Automations connector.

## 1. Optional P0 context

- Run-specific Mercer Paper A/B source-pin and P0 route audit: [issue #2680](https://github.com/Satobloc/HsH/issues/2680).
- Publisher confirmation: [#7217169749](https://github.com/Satobloc/HsH/issues/2680#issuecomment-7217169749).
- Correction to post-publication refresh expectation: [Amendment 01 #7217202708](https://github.com/Satobloc/HsH/issues/2680#issuecomment-7217202708).
- Canonical P0 currentness updates: [#7217145382](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7217145382), [#7217192267](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7217192267), [#7217202206](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7217202206).
- Paper A and B feed-pinned source commits were independently fetched and their blob SHAs matched the protected roster identities. No manuscript or feed change occurred.
- Actual external Paper A/B routes remain NOT_OBSERVED; this is not a demonstrated route failure and not acceptance.
- Source-level discovery still assigns generic reader routes to workspace records, contrary to the Presentation Gate and Reader Routing Registry. P0 source-level safety remains FAIL; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED.
- The prior Mercer h1135:s3 false-accept classification for PR #2655 was withdrawn by issue #2668. Do not revive that classification: the separate navigationLabels projection is valid under the declared model; adapter fidelity remains external.

## 2. Discovery refresh caveat

The last verified generated snapshot is commit 2bab76ed3c24e53cca21dd57ec06d9a77de62852, based on scanner source cut 84786e178959a96aac10899cd27ba34880c839f7. Current main at this handoff is c782692017632a0fb1f4c5e6f744b88d5c4e0387, which includes the Mercer #2680 publication artifact.

The issue publisher workflow uses the repository GITHUB_TOKEN and commits through tools/issue_publish.py. GitHub documents that GITHUB_TOKEN-authenticated pushes do not trigger new push workflow runs, except explicit workflow_dispatch or repository_dispatch. The discovery workflow's hourly cron remains the fallback. No manual dispatch was made; post-c782692 discovery inclusion is PENDING THE NEXT SCHEDULED REFRESH.

The last navigation run #45987671850 failed strict date-tag verification: 1,040 dated/correct; 2 undatable; 881 skipped; 75 runner-local root renames not persisted. Downstream Viewer, chronology, indexing, tests, commit, and deploy steps were skipped.

## 3. Ravel continuity pointers; no new assignment

An existing source-grounded seed already exists; do not create a duplicate:

- [Ravel regeneration prompt, 2026-11-13](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/REGENERATION_PROMPT_2026-11-13.md), blob f992649597b34abeab7fd81de685c12f9d7b30f5.
- [Ravel README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/README.md).
- [Ravel STATE](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/STATE.md).
- [Ravel CONTINUITY](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/CONTINUITY.md).
- [Ravel INBOX](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/RAVEL/INBOX.md).

The README, STATE, and CONTINUITY checkpoint is h1082; the inbox's latest entry is h1120. The regeneration prompt is older and its embedded P2/Mersearch state is stale. Use it for identity and role only; re-read live BEDROCK, Steering Charter, Three Paper Campaign, onboarding, revival controls, current main, and current Ravel state before substantive work.

Historical source locator: archived Syncmathcek conversation 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f, raw export path DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.06-26.09.16-Ravel-Syncmathcek-raw.json, recorded Git blob 17cfe3feb830f70009557d063482b35adba0834b. The GitHub file-content read returned zero bytes in this activation; do not claim the raw export was re-read. The existing seed records direct user-role message IDs 638d13ba-1541-483d-853f-3b6d04b9b1b2, c5639160-5631-4373-90c2-68d7c4c022de, 5590d70d-6525-42aa-9de8-5a7022b189f7, 4fb7a5be-a32d-43c0-b1a2-2c4787423b52, and 3d0ad680-51db-4c79-ad4a-9bbacada24ef. No standalone signed Ravel charter is established.

Current Ravel PR #1133 is OPEN / DRAFT / UNMERGED. Current head is d89aaedc67f9f00351893c3dbadcfc2b8c695c29; the latest commit removes redundant tactics from RavelPairedScaleNormalization.lean. Exact-head Lean run #45939650860 completed SUCCESS, including the exact PR-head checkout assertion and formal-library compilation. This is formal verification of the written statements, not validation of source-to-geometry translation or physical premises. Current main-to-PR comparison is DIVERGED (153 ahead / 29,569 behind); do not rebase or merge without the proper owner/review.

Ravel's historical lane remains source-first geometric co-theory and conditional mathematical formalization. This packet does not assign P0 work or alter Ravel's specialty. The Mercer P0 report is optional context only.

## 4. Suggested first read if Ravel manually re-enters

Use the existing regeneration prompt, but first reconcile the live PR #1133 head and run #45939650860 against current main. Preserve the distinction between direct-user source, assistant reconstruction, standard reference, conditional Lean result, and independent physical evidence. Do not infer a worldtube, timesheet, carrier, finite-core equivalence, or physical embedding from the formal PR alone.

No direct thread post, inbox write, chat creation, task assignment, deadline, review request, response obligation, or ownership transfer was made by this handoff.