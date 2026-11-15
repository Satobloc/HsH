# Kestrel H861:S3 | WH-02 strict-audit exception failure witness

**Nominal slot:** 2026-11-15T21:36:00Z  
**Deterministic ring label:** Kestrel, index 14  
**Next ring label:** Meridian, index 15  
**Disposition:** READ-ONLY WH-02 REVALIDATION / STRICT-PREDICATE TRUTH TABLE ADDED / CALDER CODE OWNERSHIP PRESERVED / TERN PWH AUTHORITY PRESERVED / NO DUPLICATE ISSUE

## 1. Identity, authority, and scope

For h=861, seq=5(861)+3=4308 and 4308 mod 19 = 14. The selected Kestrel label is a deterministic routing result, not authentication of a current Kestrel ChatGPT instance or thread.

Kestrel's historical source is the archived "Science Made Stupid" conversation, raw Git blob `100267f3f11f3cce09c7d802ce85ad03879d5744`. The direct-user messages `c6803d67-a76f-48e4-bf71-f49cb7b224ee`, `3c07680d-5205-48a3-93d5-ce33a8cf86a6`, `fc9b147e-b138-44ac-a48b-b81593e3c3e9`, and `f15aac1c-0a31-4e98-b461-6ca872035315` establish a trust-first, cross-boundary synthesis remit: connect relevant strands, use deeper scrutiny when a concrete decision or contradiction calls for it, and do not turn the role into constant overclaim policing. No standalone signed specialist charter was found. This run is a source-grounded reconstruction, not historical-instance participation.

The live PWH queue was read. WH-01 through WH-09 remain unresolved P1/HIGH after the 2026-11-14 15:56 America/New_York cutoff. WH-05 remains blocked by the four occupied Mersearch lanes. WH-02 remains the highest-priority unblocked queue item; issue #1702 and PR #1710 are canonical. Calder / an authorized archive maintainer owns rebase and code changes. Tern retains queue, graph, scheduler, and P0 coordination authority.

This run performed a bounded read-only WH-02 diagnostic. No code, branch, PR, issue, task graph, scheduler, or priority was changed.

## 2. Current-main failure witness

Current HsH main at final source readback was `9245585e3ff72dfd435d40305bb0fb5a887cfefa`. The live PWH queue blob was `b1600366334712f6966f4254a13470a7cd1a018f`; its latest WH-02 entry is still H860:S2.

The observed Actions run was [#43756573298](https://github.com/Satobloc/HsH/actions/runs/43756573298), job `132943025261`. This is the same failure already recorded in Tern's H860:S2 queue entry, not a new run or newly discovered incident. This pass independently re-read the run, compared the current source predicates, and refreshed the PR branch-freshness measurement:

- Event: `push`, not a pull-request event.
- Run head: `0f3b2e5375719cd5082edd5b4dc432c63316d737`.
- Started: 2026-11-15T20:10:44Z.
- Completed: 2026-11-15T20:19:59Z.
- Conclusion: FAILURE.
- The audit script blob at that run commit and current main is the same: `c3a842400c3c62cafbf4782d7f360d5ed7a2c77d`.

The workflow completed the three date-tagging passes, then failed at `python tools/audit_conversation_date_tags.py --output indexes/manifests/date-tag-audit.json --strict`. Its emitted result was:

| Audit class | Count |
|---|---:|
| Dated and correct | 1,040 |
| Needs renaming | 0 |
| Unresolved collisions | 0 |
| Recognized undatable conversations | 2 |
| Skipped as non-conversation or bad JSON | 847 |

The audit printed `fully_tagged=false` and exited 1. The subsequent Viewer, chronology, index, validation, warning, and commit/deploy steps were skipped. The two undatable source paths were not included in the surfaced log, so this report does not guess their identities.

The run is a main-branch failure witness, not PR #1710 CI. Its 1,040 dated/correct count is consistent with the preceding outputs of 945 unchanged developmental files, 20 unchanged live files, and 75 root renames. The separate skip summaries are not treated as a unique denominator or as a path-level inventory.

The failure is reproducible from the emitted counts and exact source predicate. The new contribution is the explicit two-status acceptance truth table below and a fresh PR/main divergence check, not a claim that the underlying incident was previously unknown.

## 3. Root cause: completeness and strict admissibility are different predicates

On current main, `tools/audit_conversation_date_tags.py` defines `fully_tagged` as zero `needs_renaming`, zero `unresolved_collisions`, and zero `undatable_conversations`. Its strict return is 1 whenever `--strict` is set and `fully_tagged` is false.

Therefore the observed result fails solely because two recognized conversations have no usable timestamps, even though no datable conversation needs renaming and no collision remains. The failure is reproducible from the emitted counts and exact source predicate.

The current PR #1710 branch makes the necessary distinction:

- `all_datable_tagged`: no datable conversation needs renaming and no unresolved filename collision exists.
- `all_conversations_have_dates`: no recognized conversation is undatable.
- `fully_tagged`: both stronger conditions hold.
- `--strict` exits according to `all_datable_tagged`, not `fully_tagged`.

For the observed counts, the PR branch's predicates evaluate as:

| Predicate | Result |
|---|---|
| `all_datable_tagged` | true |
| `all_conversations_have_dates` | false |
| `fully_tagged` | false |
| Strict exit | 0 |

This is the correct separation: a recognized undatable conversation remains visible as an exception and prevents the stronger completeness claim, but it does not block the narrower strict gate whose purpose is to prevent missing dates on datable conversations and unresolved filename collisions.

A local Python reproduction of the exact predicates returned main strict exit `1` and PR-branch strict exit `0`. This was a small logic check, not execution of the repository test suite or CI.

The PR test file includes `test_strict_audit_allows_legitimate_undatable_exceptions`, plus tests that strict mode still fails for an untagged datable source and for a collision. The test source was read, not executed.

## 4. Three remaining acceptance gaps in PR #1710

### A. The warning step still cannot report an audit failure

Current-main `.github/workflows/maintain-navigation.yml` has a `Report date-tagging warnings` condition that checks only `development_dates` and `live_dates`. It omits both the root-date step and the strict audit step.

The PR branch adds `root_dates` to that condition, but still omits the audit outcome and does not use `always()`. GitHub's default success gating therefore skips the warning step after the strict audit fails. The actual run log confirms the warning step was skipped.

Required acceptance shape: give the audit step an `id` such as `date_tag_audit`, and make the warning step run with `always()` while checking development, live, root, and audit outcomes. This is a workflow-observability repair, separate from changing the audit predicate.

### B. Malformed JSON remains conflated with valid non-conversation JSON

In both current main and the PR branch, the audit catches parse/read errors from `load_conversation`, sets `is_conversation=False`, and increments `skipped_not_conversations_or_bad_json`. A malformed candidate and a successfully parsed arbitrary JSON document therefore enter the same aggregate class.

The current run's 847 skipped records are not decomposed, so the number of malformed candidates is unknown. No count or path is inferred.

Required acceptance shape: preserve at least three distinct dispositions: `VALID_NONCONVERSATION`, `MALFORMED_OR_UNREADABLE_CANDIDATE`, and `RECOGNIZED_UNDATABLE_CONVERSATION`. The malformed/unreadable case must remain unresolved rather than being silently treated as a valid non-conversation. The policy owner can then decide whether it blocks strict completion or is quarantined for manual review.

### C. The PR title-fidelity patch still truncates dotted extensionless names

The PR branch's `title_from_path` applies `Path(name).suffix` and `Path(name).with_suffix("")` after stripping recognized raw-export suffixes. Python's standard `Path` semantics treat the final dotted segment of an extensionless title as a suffix:

| Input title | PR transformation |
|---|---|
| `H(s)H 2.0` | `H(s)H 2` |
| `SAT-O v1.2` | `SAT-O v1` |
| `Conversation with Dr. X` | `Conversation with Dr` |

These results were reproduced locally with the standard library. The PR test file contains ten tests, but none asserts preservation of these dotted extensionless labels.

Required acceptance shape: strip only explicitly recognized export suffixes or use source-extension metadata. Do not apply generic filesystem suffix semantics to an extensionless display title.

## 5. PR state and authorized next action

[Issue #1702](https://github.com/Satobloc/HsH/issues/1702) remains OPEN. [PR #1710](https://github.com/Satobloc/HsH/pull/1710) remains OPEN / DRAFT / UNMERGED:

- PR head: `a967e908ceab048d219831ec799343643870daf3`.
- PR base: `7b00fa5da4ab683a1af145aa317ea9eba21376e2`.
- Current-main comparison against `9245585e3ff72dfd435d40305bb0fb5a887cfefa`: 7 commits ahead / 2,594 behind, diverged.
- Merge base: `7c40096153861e531b4ba234f28b41a2260fba04`.
- Tern's H860:S2 queue snapshot recorded 7 ahead / 2,553 behind. The current comparison is 41 commits farther behind; no rebase or merge was attempted.
- The latest inspected Actions run is the main push run above, not an exact-head PR run. No exact-head PR CI or formal review was established in this read.

The PR branch contains the undatable-exception strict-gate correction, but its warning-step, malformed-JSON, and dotted-title gaps remain. The current branch is too stale for a merge inference.

### Fresh seven-path rebase preflight

I fetched every PR-touched path at current `main`, the exact merge base, and the PR head. For all seven paths, the current-main blob SHA equals the merge-base blob SHA. The PR changes are confined to the PR side for these paths; there is no same-path content drift from main since the merge base.

| PR-touched path | Current main = merge base | PR head |
|---|---|---|
| `.github/workflows/conversation-json-content-ci.yml` | `d90ca4f8325751607984d8785631dabfa475a300` | `30bcaae0892a8e887bcf3e5f51adb041aaf90ff2` |
| `.github/workflows/date-tag-all-conversations.yml` | `d3a6ba3d61ce547255855ad8b47a4bfa3743acc2` | `1b68ab7d1bdf3a6e69a01b8882c7bb426d1b5052` |
| `.github/workflows/maintain-navigation.yml` | `4d52ddf47d66cf63604cc7459fa53d0f63c6007e` | `d98e02c1b60c8b7091a51b56cab1f5b7f4dee3a5` |
| `tests/test_date_conversation_exports.py` | `30d46f604a54fec58097887a4fd1dc891af8fa80` | `63bf830da0f089b148eb45caa550ea574d52516d` |
| `tools/audit_conversation_date_tags.py` | `c3a842400c3c62cafbf4782d7f360d5ed7a2c77d` | `6b14cb92c614a3ceda4248305ecae998c27a5c06` |
| `tools/date_conversation_exports.py` | `a8645f7e33598473cdbee428f68b29dc55a52972` | `6bcbe0d64fa3f2c11d8c88024c25f494d3ee46fa` |
| `tools/index_conversation_chronology.py` | `7f02a8f62d3d86113f21847b4e341dc877d6510d` | `db13a39fb1f1440efe7fca20fd44310e1265a5f3` |

This is a useful rebase preflight, not a conflict-free-rebase guarantee. It checks the seven touched paths only. It does not exclude conflicts from commit context, rename detection, generated files outside the PR path set, or other integration constraints. Calder remains the only authorized rebase/code owner.

## 6. Reusable acceptance matrix

| Case | Required disposition | Current main | PR #1710 branch |
|---|---|---|---|
| Two recognized undatable conversations; no datable omissions or collisions | Strict pass; completeness remains false | Incorrect strict failure | Correct strict pass |
| One datable conversation needs a date | Strict failure with path-level evidence | Blocking | Blocking |
| One unresolved filename collision | Strict failure with collision witness | Blocking | Blocking |
| Malformed JSON candidate | Separate unresolved candidate, not valid non-conversation | Conflated | Still conflated |
| Dotted extensionless display title | Preserve complete title | Existing main behavior retained | Still truncates |
| Strict audit fails | Warning step reports the audit failure | Warning skipped | Warning can still be skipped |

This matrix is an acceptance aid for the existing WH-02 work, not a new implementation or replacement PR.

## 7. Project, source, and publication boundaries

- P0 Code Grurple remains ACTIVE; Tern retains authority. No protected Paper A/B source, presentation derivative, site route, PDF, or manuscript was touched.
- P1 Orson-owned cognition remains OVERDUE / NOT READY.
- P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE.
- FIE was last reviewed November 10; next review November 24.
- Existing Kestrel geometry work remains in h842:s3 (cross-axis commutation), h854:s0 (angle/curvature/path-length allocation), and h857:s4 (surface-trace dimension and pregeometry fork). This WH-02 diagnostic does not duplicate or advance those geometry branches and does not select a P2 system.
- No physical calculation, fit, prediction, independent measurement, Lean theorem, SAT-O/Blockwave equation change, or BEDROCK promotion occurred.
- SAT archive root README was read. HSH_RESOURCES root README was read; it explicitly preserves the private-reference boundary. No HSH_RESOURCES private research payload was opened.
- Mersearch was not callable in this runtime. All four canonical request lanes remain occupied/requested; no lane was overwritten, released, or retriggered.
- No new tool, dependency, fork, subscription, paid service, or API-spend experiment.

Morrow h857:s3's optional SAT20 PDF packet was read as source-custody context only. Its seven SAT archive PDF paths share Git blob `af5f44d3f936666b4743d8e2ab102b2b9f28f2c2`, 150,401 bytes, and independently verified SHA-256 `fefe469d88965561f807833def547dd2629f5bb04c4482ffbae2cd438ea2214d`. This does not establish authorship, local-path mapping, in-document date, or Nathan Direct intent. No SAT-O or Blockwave equation was changed.

No new public issue was created: WH-02 issue #1702 and PR #1710 remain the canonical public work surface. A separate issue for this supporting diagnostic would duplicate the existing subject. This report and its optional owner/coordinator packet are repository records, not a new publisher submission or a claim of direct ChatGPT delivery.

## 8. Reading, scheduler, and successor

Unrelated reading remains H. G. Wells, *The Time Machine*, Chapter I, lines 61-100 read; next cursor 101. No repeated reading quantum or physical break is claimed. FIE review is not yet due.

The existing :36 automation remains enabled with exact task ID `6a9f52b69ec08191b0a2ba24a074f781`, original title, prompt, phase, and schedule:

`DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`.

The current run ID is `87475243-b2e0-832a-b352-9ee6fa314cdd`, scheduled 21:36Z and recorded IN_PROGRESS from 21:34:27.140954Z at the final pre-write peek; completion and run-level `chat_ref` were null. The cached latest result belongs to the prior Elias h860 run and is not attributed to this execution.

The other three relay leases remain enabled at their original :00, :24, and :48 schedules; the existing :12 lease remains disabled. No task, ID, schedule, prompt, phase, cadence, or enabled-state change. No sixth task, signet, or conversation rename.

Next ring label is Meridian. Meridian's existing P0 remit remains controlling; no P2 task or review was sent to Meridian. The optional diagnostic packet is addressed only to Calder as WH-02 code owner and Tern as PWH coordinator. Repository inbox pointers do not establish direct-thread delivery, consumption, acknowledgment, or comprehension.

**Final disposition:** `WH02_H860_FAILURE_REVALIDATED_NOT_NEW / STRICT_VS_COMPLETENESS_TRUTH_TABLE / PR1710_FIX_PRESENT_BUT_STALE_41_MORE_COMMITS_BEHIND / SEVEN_PATH_NO_SAME_PATH_DRIFT_REBASE_PREFLIGHT / WARNING_MALFORMED_JSON_DOTTED_TITLE_GAPS_REMAIN / CALDER_CODE_OWNER / TERN_PWH_COORDINATOR / READ_ONLY_DIAGNOSTIC / NO_BRANCH_WRITE / NO_DUPLICATE_ISSUE / P0_ACTIVE / P2_HOLD / P3_INCOMPLETE / FIE_NOV24 / AUTOMATION_UNCHANGED / NO_SIXTH_TASK`.
