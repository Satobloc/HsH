# Calder h856:s2 | WH-02 current-head and regression revalidation

**Run key:** `REVROT3-19-20261011:856:s2`  
**Selected ring label:** Calder (index 7)  
**Next ring label:** Hale (index 8)  
**Disposition:** `WH02_CURRENT_HEAD_REVALIDATED / THREE_KNOWN_GAPS_STILL_PRESENT / NO_BRANCH_WRITE / P0_ACTIVE / LANE24_HOLD`

## 1. Selection, identity and historical authority

At the nominal UTC hour 2026-11-15T16Z, (h=856), (seq=5h+2=4282), and (4282\bmod19=7). The selected ring label is Calder; the next label is Hale.

The historical empirical-Calder role source is the direct-user check-in in `WORKSPACES/COMMON/CHECKINS.md`, 2026-09-12, lines 53-106, blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`. It self-reports adversarial empirical testing, angle-clustering null design, independent-unit discipline, statistical calibration/covariance, and source/provenance separation. It also flags earlier mixed empirical scanning and SAT interpretation as contamination-relevant and quarantines theory-bearing outputs from that mixed context.

No standalone signed Nathan-authored Calder specialist charter was recovered. `WORKSPACES/CALDER/BOOT.md` and later role summaries are assistant-maintained operational reconstructions, not replacements for the direct check-in. No authenticated current empirical-Calder thread was established. The separate archived Construction Story Retelling / Foundational Covariance identity remains excluded. This is a source-grounded Calder-label revival, not authenticated historical-instance participation or cross-thread delivery.

## 2. Current controls read

- HsH `BEDROCK.md`, current blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`, 667 lines. The current hierarchy says the 2026-11-08 Primary Operational Guideline supersedes BEDROCK where directly contradictory; FIE remains conceptually foundational.
- HsH Primary Operational Guideline `WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-08_METHODOLOGY_AND_MODEL_OVERVIEW.md`, blob `a8e333b1d5b5aa1d9772366945dd88769d24153c`, 511 lines. It retains real-measured-system requirements, source-first fidelity, minimal worldtube/timesheet primitives, and the distinction between mathematical clearance and physical validation.
- Steering Charter `WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md`, blob `be44c424674764c602b5f618dfce528c0f97b0ef`.
- Three Paper Campaign, New Instance Start Here, V3/V4 revival controls, thread-first rule, thread-routing protocol, navigation preflight, scheduler authority, current workflow orientation, task-branch graph and current Common check-ins were read.
- Calder `README.md`, `BOOT.md`, `CURRENT_WORK.md`, `INBOX.md`, latest available h837 receipt/report, h845 gyroscope source-fidelity report, and h848 Review-MIND report were read. The current pointers were stale: BOOT named h837 and CURRENT_WORK named h833, while later h845 and h848 reports already existed. This h856 report is the new return point.
- SAT archive root README was read (blob `8cc300ba25a98dda803f6a0005bee9d97c3814ef`). HSH_RESOURCES root README only was read (blob `1433b65480a04b1bd4ed64e4b234c3ecf1b576f0`); its private-reference boundary was preserved and no payload was opened.
- Repository metadata confirms HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES are the three relevant repositories. No repository fork, new tool, dependency, subscription or expenditure was introduced.

## 3. Live branch and WH-02 status

HsH default branch is `main`. The current main commit at the final pre-write source inspection was `616e39b53587bf07de4d98529473d793fc7b8211`, created by the automatic public-display refresh at 2026-11-15T16:21:16Z. It post-dates this run's recorded start. Its parent is `5804f8b11d3cce6349cd3aaa16569ca4e288609a`; its only changed path is `PUBLIC_SITE/generated/discovery.json`.

Canonical issue [#1702](https://github.com/Satobloc/HsH/issues/1702) remains OPEN. Existing [PR #1710](https://github.com/Satobloc/HsH/pull/1710) remains the sole active WH-02 proposal:
- State OPEN; DRAFT; UNMERGED.
- Base `main`, base SHA `7b00fa5da4ab683a1af145aa317ea9eba21376e2`.
- Head branch `fix/wh02-root-date-audit-semantics-20261113t2236z-main-7c400961`.
- Head SHA `a967e908ceab048d219831ec799343643870daf3`.
- Merge base `7c40096153861e531b4ba234f28b41a2260fba04`.
- Current-main comparison: 7 commits ahead, 2,398 behind; comparison status DIVERGED.
- GitHub PR metadata reports `mergeable=true`, but this does not establish current-main integration, exact-head CI, regression acceptance or formal review.
- Seven changed files, 277 additions and 22 deletions.
- No formal review submissions and no inline review threads.
- No PR-triggered Actions runs were returned for the head. The combined status contains only a Vercel daily deployment-rate-limit failure, not code-test evidence.

The branch is substantially stale. This pass did not establish whether all seven changed paths remain conflict-free relative to the merge base; no such claim is made.

## 4. Three existing defects revalidated in the PR-head source

The PR body describes the intended root suffix-independent discovery, datable/undatable separation, root-pathspec staging, workflow alignment and expanded regression suite. The actual PR-head source still contains three previously recorded gaps.

### 4.1 Strict-audit warning step is not reachable after the strict audit fails

In `.github/workflows/maintain-navigation.yml`, the strict audit step runs before Viewer construction. The later `Report date-tagging warnings` condition checks the development, live and root date-pass outcomes, but not the strict audit step outcome, and it does not use `always()`.

GitHub's default success gating can therefore skip the warning step when the strict audit itself is the failing step. The existing independent review note is [PR comment #6867074391](https://github.com/Satobloc/HsH/pull/1710#issuecomment-6867074391).

Minimal repair: give the audit step an ID and include its `outcome` in a warning condition using `always()`, while retaining the existing date-pass checks.

### 4.2 Malformed JSON is collapsed with valid non-conversation JSON

In `tools/audit_conversation_date_tags.py`, the skipped-record path catches `JSONDecodeError`, sets `is_conversation=False`, and increments `skipped_not_conversations_or_bad_json`. It does not preserve the malformed candidate path and parse error in the exception list.

A malformed JSON candidate is not thereby proven to be a conversation. It is an unresolved candidate whose parse failure disappears into the same aggregate as valid arbitrary JSON. The current tests include valid arbitrary JSON and valid undatable conversations, but no malformed `.json` candidate through this path.

The existing source-QA note is [PR comment #6867267782](https://github.com/Satobloc/HsH/pull/1710#issuecomment-6867267782).

Minimal repair: retain distinct states for `malformed_json_candidates` (path and parse error), `valid_nonconversation_json`, and `undatable_conversations`. Keep datable-tag success distinct from candidate-inventory classification completeness. Decide explicitly whether parse failures block the inventory-completeness gate or require adjudication.

### 4.3 Extensionless dotted titles are truncated

In `tools/index_conversation_chronology.py`, `title_from_path` applies generic `Path(name).suffix` removal after stripping recognized raw-export suffixes. For extensionless inputs, meaningful dotted text is treated as a file extension.

Previously executed exact-function counterexamples produce:
- `H(s)H 2.0` → `H(s)H 2`
- `SAT-O v1.2` → `SAT-O v1`
- `Conversation with Dr. X` → `Conversation with Dr`

These are synthetic software test strings, not claims that those exact source files exist. Existing note: [PR comment #6867321653](https://github.com/Satobloc/HsH/pull/1710#issuecomment-6867321653).

Minimal repair: use explicit source-extension metadata or a recognized-extension allowlist; preserve unknown/extensionless dotted text. Add exact-label regression assertions and recognized-extension controls.

## 5. Conditional Boolean contract and proof status

The PR-head audit separates the following Boolean quantities:

```text
all_datable_tagged :=
  needs_renaming == 0 AND unresolved_collisions == 0

all_conversations_have_dates :=
  undatable_conversations == 0

fully_tagged :=
  all_datable_tagged AND all_conversations_have_dates

strict_exit_nonzero :=
  strict AND NOT all_datable_tagged
```

This yields the intended conditional behavior: if every datable conversation has the correct prefix and there are no unresolved filename collisions, strict mode can succeed even while a legitimate undatable conversation keeps `fully_tagged=false`. That prevents invented dates.

The malformed-JSON collapse means this Boolean contract is not yet an inventory-completeness contract. A separate candidate-classification state is needed.

This is an explicit formalization target, but no Lean module or build was created or run in this pass. The existing PR is Python/workflow code; no local Lean/Lake/Elan runtime or exact-head Actions run was available. The Python source was inspected, not executed as a repository test suite. No proof or test pass is claimed.

## 6. Ownership, next action and boundaries

Issue #1702 defines the acceptance sequence: suffix-independent root discovery; explicit undatable exceptions without guessed dates; strict-mode behavior; warning-path coverage; exact root rename staging after downstream validation; manifests reconciled without double-counting; and a full navigation workflow plus Viewer/chronology acceptance tests.

Smallest next action remains an authorized maintainer with an authenticated checkout or approved branch-update route:
1. Reconcile/rebase the existing PR onto current main.
2. Fix the warning reachability, malformed-candidate classification and dotted-title fidelity gaps.
3. Add regression tests for malformed JSON and exact extensionless labels.
4. Run exact-head PR CI and the full navigation acceptance workflow.
5. Obtain independent formal review before any merge or standdown.

Calder retains WH-02 implementation ownership. Tern retains P0, task-graph, queue and scheduler authority. No ownership or task transfer occurred.

P0 Code Grurple remains ACTIVE under issue #1747. The public discovery-index / reader-policy mismatch remains a separate active interlock. Lane 24 remains BACKSEAT/HOLD while P0 is active; the h845 gyroscope source-recovery report still classifies the November 9 gyroscope discussion as retrieval-lead-only, raw source not recovered. The h848 Review-MIND report is a methodology proposal, not a P1 experiment or theory promotion.

No physical system was selected. No physical calculation, CODATA comparison, fit, prediction, independent measurement, Lean proof, manuscript/site edit, PR branch update, rebase, merge, workflow dispatch, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

Mersearch was not available as a callable action. The four existing request lanes remain occupied/requested per the latest verified Calder record; none was overwritten, released or retriggered. GitHub source inspection is not represented as Mersearch.

## 7. Unrelated reading and FIE

Read SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 1761-1800, blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`. It is a flattened language-game transcript, not raw role metadata and not an independently verified linguistic claim.

Next reading cursor: **1801**.

FIE last full rereview: 2026-11-10. Next scheduled rereview: 2026-11-24.

## 8. Automation readback

The existing Workshop Relay :24 task was privately peeked by its exact ID:
- ID `6abda4c8eda88191bf23a6f2849e9a17`.
- Enabled: true.
- Exact VEVENT preserved: `DTSTART;TZID=America/New_York:20261001T142400`, `RRULE:FREQ=HOURLY`.
- Current run ID at readback: `792393d0-dd24-8325-bc0d-668839680255`.
- Scheduled for 2026-11-15T16:24:00Z; recorded start 2026-11-15T16:20:29.650530Z; status IN_PROGRESS; completion and chat_ref null.
- The cached latest result belongs to the preceding Aster h855:s2 run `125bbbf5-8fec-832e-a890-2ed921f4a8cc`, not this Calder run.

The recorded start precedes the scheduled time by 210.349470 seconds. This is an observed scheduler timestamp difference only; no cause, liveness, retry, duplicate process or worker identity is inferred. No scheduler setting was changed.

## Final disposition

`H856_S2_CALDER / HISTORICAL_CHECKIN_ROLE_SOURCE / NO_AUTHENTICATED_CURRENT_THREAD / WH02_PR1710_OPEN_DRAFT_UNMERGED / 7_AHEAD_2398_BEHIND / THREE_KNOWN_GAPS_STILL_PRESENT / NO_EXACT_HEAD_CI / NO_FORMAL_REVIEW / NO_REBASE_OR_BRANCH_WRITE / P0_ACTIVE / LANE24_HOLD / NO_PHYSICAL_RESULT / READING_CURSOR_1801 / HALE_NEXT / AUTOMATION_UNCHANGED`
