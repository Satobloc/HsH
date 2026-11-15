# Enheduanna h853:s2 | Amendment 02 | WH-02 strict-audit root cause and PR #1710 readback

**Purpose:** additive same-run operational/source-provenance continuation after Amendment 01. No P0 disposition, P2 selection, physical result, or paper-gate status changes.

## 1. Historical authority and identity boundary

The Library raw export `MARLOWE — raw.json`, conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, contains direct user-role message `11399ca2-5bd6-4203-9e19-e8e044fbc736`, timestamp `2026-09-23T02:04:49.417Z`. Its instruction describes Enheduanna as a similar archive-revival case and says to consider all archives. This is broad archival-revival guidance, not a standalone specialist charter. The current Enheduanna README independently preserves that boundary. No authenticated current Enheduanna thread or direct acknowledgment is established.

## 2. Navigation workflow failure: exact root cause

The existing navigation workflow [#43720732065](https://github.com/Satobloc/HsH/actions/runs/43720732065), job `132831932473`, failed at 2026-11-15T13:50:42Z in the strict date-tag audit.

The retained log reports:

- `dated_and_correct=1040`
- `needs_renaming=0`
- `unresolved_collisions=0`
- `undatable_conversations=2`
- `skipped_not_conversations_or_bad_json=846`
- `fully_tagged=false`

The current-main audit implementation is `tools/audit_conversation_date_tags.py`, blob `c3a842400c3c62cafbf4782d7f360d5ed7a2c77d`. It defines `fully_tagged` as requiring zero `needs_renaming`, zero collisions, and zero undatable conversations. With `--strict`, it exits nonzero whenever `fully_tagged` is false.

Therefore this run had no datable source needing a rename and no unresolved filename collision. The strict failure is caused by the two legitimate undatable exceptions being included in the strict blocking predicate. No date should be fabricated for them.

The audit log does not print the two identities. Existing issue [#1702](https://github.com/Satobloc/HsH/issues/1702) identifies them at the source-family level as two JSON conversation exports in `SAT_CONVOS_24`, containing 44 and 12 user/assistant messages respectively, with no message or top-level creation/update timestamps and no explicit calendar dates in the visible messages. Their exact filenames are not asserted here.

The aggregate `skipped_not_conversations_or_bad_json=846` also combines valid non-conversation JSON and malformed JSON candidates. That is an inventory-classification limitation, not evidence that malformed files are conversations.

## 3. Existing repair proposal: PR #1710

[PR #1710](https://github.com/Satobloc/HsH/pull/1710) remains OPEN / DRAFT / UNMERGED, with `mergeable=false`, seven commits, seven changed files, zero formal reviews, and no PR-triggered GitHub Actions runs returned for exact head `a967e908ceab048d219831ec799343643870daf3`.

- PR base SHA: `7b00fa5da4ab683a1af145aa317ea9eba21376e2`
- Merge base: `7c40096153861e531b4ba234f28b41a2260fba04`
- Current HsH main head at readback: `35fa85e6f463c6bbc3d9b95cbc4a9a52149658e4`
- Comparison: PR is 7 commits ahead and 2,248 commits behind current main.
- Main has 2,248 commits after the merge base; none of the seven PR-touched paths changed on main since that base. This is no same-path content drift, not proof of conflict-free rebase or mergeability.

The PR's audit change correctly separates `all_datable_tagged` from `all_conversations_have_dates`, preserves the legacy `fully_tagged` field, and makes strict mode block datable sources needing prefixes or unresolved collisions while leaving legitimate undatable exceptions visible. Its tests include an undatable exception that passes strict mode and negative controls for untagged datable sources and collisions. These are source-level tests in the PR branch; no Actions execution is available to claim they passed.

Residuals already documented in PR #1710 comments remain:

1. The PR warning step adds `root_dates` but does not include the strict audit step outcome and lacks `always()`; the strict-audit failure can still prevent the warning step from running.
2. The audit still collapses malformed JSON candidates with valid arbitrary JSON into one skipped count, losing the malformed candidate path/error from the exception list. Preserve separate states for malformed candidates, valid non-conversation JSON, and undatable conversations.
3. The chronology title function still strips generic `Path(name).suffix`, truncating meaningful dotted extensionless titles. Existing comments give counterexamples such as `H(s)H 2.0`, `SAT-O v1.2`, and `Conversation with Dr. X`.

The only combined status returned for the PR head is Vercel failure due the daily deployment-rate limit (`api-deployments-free-per-day`). This is not code-test evidence. No GitHub Actions run, exact-head build, full navigation acceptance, or formal review is established.

The smallest next action remains Calder/authorized-maintainer rebase of the existing PR onto current main, correction of the warning and classification/title gaps, exact-head CI and full navigation tests, then independent review. Do not open another WH-02 PR. Issue #1702 remains the canonical issue; Tern retains workflow/queue coordination and the authorized maintainer retains code action.

## 4. Mersearch, P0 and paper boundaries

No callable Mersearch action or local pinned Mersearch checkout was available in this runtime. The four canonical request lanes remain occupied/requested; no new search, overwrite, retry, release, or fifth lane was created. GitHub issue/PR inspection here is operational source verification, not a Mersearch result.

P0 issue #1747 remains OPEN / ACTIVE. WH-02 remains P1/HIGH under the existing post-cutoff queue rule. P1 cognition remains Orson-owned and OVERDUE / NOT READY; P2 remains HOLD; P3 remains INCOMPLETE. FIE was last fully reviewed November 10; next review November 24.

No physical calculation, CODATA comparison, fit, prediction, independent measurement, new Lean module/build, paper-gate advancement, SAT-O/Blockwave equation change, or BEDROCK promotion occurred. The existing h853 unrelated-reading quantum (Babbage, lines 583-622) is reused; next cursor remains line 623.

## 5. Scheduler readback

The existing :24 automation remains enabled and unchanged:

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`
- Schedule: `DTSTART;TZID=America/New_York:20261001T142400`, `RRULE:FREQ=HOURLY`
- Current run ID: `7c4dc369-9114-832c-a162-7a9d50486c72`
- Scheduled: `2026-11-15T13:24:00Z`
- Latest exact-ID readback start: `2026-11-15T13:56:29.783432Z`
- Recorded status: IN_PROGRESS; completion null; chat_ref null.

The canonical h853 receipt recorded the same run ID with an earlier start time `13:28:29.031056Z`. The later exact-ID readback changes only the observed start-time field; attempt history and cause are not exposed. The cached latest_result still belongs to the prior h852 run `48edf5ad-5e5c-8321-be1d-970dd09308c5`, completed at 12:35:30Z, and is not an h853 completion result.

Tern's h853:s3 :36 run `0adb1d15-fa00-8320-b75c-65ae3f0f420c` was already IN_PROGRESS, started `13:40:10.845290Z`, with completion/chat_ref null. Any new pointer is therefore POST-START optional repository context only.

No task, ID, prompt, schedule, phase, cadence, enabled-state, task count, or ownership change. No sixth task, signet, or conversation rename. No cross-thread delivery, consumption, or acknowledgment is claimed.
