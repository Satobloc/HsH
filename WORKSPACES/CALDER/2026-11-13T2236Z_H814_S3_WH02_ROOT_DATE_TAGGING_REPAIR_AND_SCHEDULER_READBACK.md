# H814:s3 — Calder — WH-02 root date-tagging repair and scheduler readback

**Run key:** `REVROT3-19-20261011:814:s3`  
**Nominal slot:** 2026-11-13T22:36Z  
**Selection:** `h=814`, `seq=5h+3=4073`, `4073 mod 19=7`  
**Worker:** Calder, ring index 7  
**Next:** Hale, ring index 8, h814:s4

## Authority and source custody

The historical Calder source recovered this run is the 2026-09-12 direct-user check-in in `WORKSPACES/COMMON/CHECKINS.md`. It describes an empirical/null-design specialty. No standalone signed Calder specialist charter was found. The current Calder BOOT preserves its separate :24 backseat/HOLD remit; this execution follows Nathan's current :36 architecture/workflow charter and does not reactivate Calder's :24 work.

Read: live BEDROCK; 2026-10-26 Steering Charter; Three Paper Campaign; onboarding and all three repository front doors; Revival V3/V4 and thread-first rules; shared-state write safety; current HsH main; task graph; current queue; current receipts; Calder historical source; incoming Aldus h814:s2 handoff/report; Tern Observation 026 and Amendment 01; Project Portfolio Register and orphan-scan receipts. HSH_RESOURCES was limited to its root README/metadata; no private payload was opened.

The incoming Aldus packet was repository-only optional context and was read. No authenticated historical Calder or Hale ChatGPT thread was established. No cross-thread delivery is claimed.

## Priority selection

WH-05 remains the highest-priority item overall, but its next controlled test is blocked: all four Mersearch request lanes remain occupied and no lane-release authority was available. Aster h813:s3 corrected the four-lane execution evidence: Lanes 1, 3 and 4 were cancelled after runner shutdown signals; Lane 2 search completed but publication failed on GitHub's 100 MB file limit / 50 MB recommended threshold. No lane was retried, overwritten or released. The bridge remains PUBLIC-QUERY-ONLY.

WH-02 was therefore selected as the highest-priority unblocked core archive/navigation repair. Issue #1702 already contains the acceptance criteria. Existing PR #1686, PR #1685, the date-tagging scripts, Viewer, chronology, and navigation workflows were inspected; no duplicate issue or new tool was created.

## Verified failure chain

1. Repository-root discovery had a `.json/.txt` suffix gate even though the existing bounded content sniffer supports JSON-looking `.md`, `.log`, unusual-suffix and extensionless exports.
2. Strict audit treated legitimate undatable conversations as blockers. The legacy `fully_tagged` field conflated two distinct conditions: all datable conversations correctly tagged, and every recognized conversation having a recoverable date.
3. The Viewer refresh wrapper now requires three source manifests, but the test still called it with two arguments. The earlier strict-audit failure prevented this downstream defect from surfacing in the failed run.
4. Both navigation/backfill workflows staged root renames with `git add -A -- '*.json' '*.txt'`, which misses arbitrary suffixes and extensionless root renames.
5. The main navigation warning step checked DEV/LIVE date-pass outcomes but omitted the root pass.
6. The scheduled/manual backfill workflow still gated on legacy `fully_tagged`, so the two legitimate undatable exceptions would continue to fail it.
7. PR CI path filters omitted the date-export test and audit/chronology/workflow changes; the compile list also omitted the audit and chronology scripts.

## Repair proposal in draft PR #1710

[WH-02 draft PR #1710](https://github.com/Satobloc/HsH/pull/1710) is open, mergeable, and intentionally unmerged. Head: `a967e908ceab048d219831ec799343643870daf3`. It changes seven existing files:

- `tools/date_conversation_exports.py`: remove the repository-root suffix gate; retain bounded content sniffing, full JSON parsing, ChatGPT mapping/message validation, and existing DEV/LIVE, PRIOR_ART, QUARANTINE, Viewer-generated and .git exclusions.
- `tools/audit_conversation_date_tags.py`: expose `all_datable_tagged`, `all_conversations_have_dates`, and preserve `fully_tagged` as their conjunction. Strict mode fails only for datable sources needing a prefix or unresolved filename collisions. Undatable exceptions remain visible and do not block strict navigation.
- `tools/index_conversation_chronology.py`: make labels extension-neutral for nonstandard root source suffixes.
- `tests/test_date_conversation_exports.py`: add suffix/extensionless root discovery, prose and arbitrary-JSON negative controls, chronology, Viewer root-source, strict non-blocker/blocker, collision, and three-manifest refresh coverage.
- `.github/workflows/maintain-navigation.yml`: include root pass failures in warnings and stage exact root rename paths from the root manifest with literal Git pathspecs, after audit and downstream validation.
- `.github/workflows/date-tag-all-conversations.yml`: use the same strict semantics and exact root rename staging; preserve the legacy `fully_tagged` completeness meaning.
- `.github/workflows/conversation-json-content-ci.yml`: expand PR path filters and Python compilation coverage.

The software invariant is explicit:

```text
all_datable_tagged =
    needs_renaming == 0 AND unresolved_collisions == 0

all_conversations_have_dates =
    undatable_conversations == 0

fully_tagged =
    all_datable_tagged AND all_conversations_have_dates
```

This is a Python/Actions workflow contract, not a physical theorem. No Lean theorem was added. Local `lean`, `lake`, `elan`, and `gh` are absent. No local repository checkout was available; `git clone` could not reach GitHub. No approved house-writer or Actions-dispatch writer was exposed in this runtime, so the GitHub connector's branch/update operations were used as the documented fallback. No new dependencies, subscriptions, tools, forks or expenditure.

The first draft PR #1709 was closed unmerged as superseded after its branch fell 15 commits behind main. The seven affected source files were unchanged between its base and the newer main snapshot. PR #1710 is the sole active draft for WH-02.

**Verification state:** no GitHub Actions CI run is currently observable for #1710. The only reported check is Vercel's daily deployment-rate limit, not a code-test result. No test pass is claimed. The full main-branch navigation/Viewer/chronology/structural-index/autotag/Pages workflow remains pending review, merge and independent readback. No source file was renamed and no main-branch code changed; only operational continuity documents were added. No date was fabricated for an undatable source.

Issue #1702 received a status comment linking #1710. No duplicate issue or public research artifact was created.

## Project and scheduler controls

Aldus h814:s2's Project Portfolio Register and orphan-scan receipts were read. The original worker-built dynamic tracker remains unrecovered; the Project Desk item is only a static prototype. No replacement tracker was built and no orphan was silently promoted or archived. The task graph remains ACTIVE_SEED with 16 declared branches and 18 records; no graph mutation was made.

Exact-ID scheduler readbacks show:

| Slot | Run | Recorded start | Latest evidence |
|---|---|---|---|
| :00 h814:s0 | `ec20af36-81b8-8325-ab1d-5f9756c59e22` | 22:58:00.804972Z | IN_PROGRESS; null completion/chat_ref; cached result belongs to prior h813:s0 |
| :24 h814:s2 | `893a3e1d-ab04-8321-ad95-57fca28b0e60` | 22:49:38.445949Z | Last successful exact-ID peek: IN_PROGRESS; null completion/chat_ref; cached result belongs to Loom h813:s2. A later exact-ID peek returned no current record |
| :36 h814:s3 | `78a1a0aa-70c0-8329-b340-2e34bdabd7fd` | 22:38:11.641455Z | IN_PROGRESS; null completion/chat_ref; cached result belongs to Aster h813:s3 |
| :48 h814:s4 | `ebe927f4-3348-8326-94ec-ad587b667807` | 22:44:35.999674Z | IN_PROGRESS; null completion/chat_ref; cached result belongs to Ariadne h813:s4 |

The latest successful recorded start order is s3 → s4 → s2 → s0, versus nominal phase order s0 → s2 → s3 → s4. The :24 exact-ID peek later returned no current record; its last successful readback remains the h814:s2 IN_PROGRESS snapshot above. The :00 h814:s0 run is now recorded IN_PROGRESS. These are scheduler-record ordering/access observations only: no process concurrency, retry, restart, deletion, disablement, missed dispatch or backend cause is inferred. Tern retains scheduler authority; the readback was routed to Tern's inbox. No scheduler task, ID, cadence, phase or prompt was changed.

## Campaign and maintenance

- P0 Code Grurple: ACTIVE.
- P1 cognition, Orson-owned: OVERDUE / NOT READY.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next rereview: November 24; last rereview November 10.
- Unrelated reading: *Alice's Adventures in Wonderland*, Project Gutenberg #11, lines 661–700 read. Next cursor: 701.
- No physical system, measured dataset, calibration, fit, prediction, independent measurement, SAT-O/Blockwave equation change, paper-gate advancement or theory promotion.

## Automation integrity

The existing :36 task remains enabled under ID `6a9f52b69ec08191b0a2ba24a074f781`, with its exact saved hourly America/New_York :36 schedule, prompt and phase unchanged. The :00, :24 and :48 task IDs/schedules/phases were also left unchanged. The :12 phase remains disabled. No sixth task, signet or chat rename.

The current :36 wrapper remains IN_PROGRESS with null completion and null chat_ref; its cached result belongs to Aster h813:s3. Repository work and readbacks are complete; scheduler-wrapper completion is not claimed.


## Amendment 03 — final PR and :24 readback

- PR #1710 remains draft/open and unmerged. Its mergeability flag has fluctuated across successive reads; the latest exact PR readback is `mergeable=false`. The seven touched files remain unchanged on main since the PR base, so this flag is not treated as proof of a code conflict. No GitHub Actions CI run is observable; Vercel's rate-limit failure is not code CI. No rebase, force update or merge was attempted.
- The :24 h814:s2 exact-ID peek that had temporarily returned no record subsequently restored the same run `893a3e1d-ab04-8321-ad95-57fca28b0e60`, still IN_PROGRESS with the same recorded start 22:49:38.445949Z and null completion/chat_ref. Treat the transient no-record response as readback unavailability, not deletion or disablement.
- The :00 h814:s0, :24 h814:s2, :36 h814:s3 and :48 h814:s4 records were all IN_PROGRESS at their latest successful peeks. Recorded start order remains s3 → s4 → s2 → s0; nominal phase order s0 → s2 → s3 → s4. No process concurrency, retry, restart or backend cause inferred.


## Amendment 04 — malformed JSON candidate classification and fresh PR comparison

This amendment is the additional work of a later current execution that found the h814:s3 base report and receipt already present on main before its own latest recorded start. The producer/attempt linkage of that pre-existing same-slot packet is not inferred. This execution adds the source-level QA finding below; it does not claim authorship of the base packet.

### New coverage distinction

The exact PR-head source was read at `a967e908ceab048d219831ec799343643870daf3`:

- `tools/conversation_json_sniff.py:29–33` keeps `.json` candidates eligible so malformed JSON is retained as a parse failure.
- `tools/date_conversation_exports.py:149–150` stores parse failures as generic `status="skipped"` records with the error text.
- `tools/audit_conversation_date_tags.py:41–53` catches `JSONDecodeError`, sets `is_conversation=False`, increments `skipped_not_conversations_or_bad_json`, and does not append the candidate path/error to `exceptions`.

Thus malformed JSON and valid non-conversation JSON collapse into the same aggregate skip category. A malformed candidate is **not proven to be a conversation**; it is an unresolved candidate whose parse failure is not represented in the audit exception list. The existing PR tests cover valid arbitrary JSON/prose and valid undatable ChatGPT-shaped records, but not a malformed `.json` candidate through this date-audit path.

A one-off Python logic replay of the exact source control flow used three software fixtures (not physical data and not the repository test suite):

| Candidate | Replayed audit state | Exception path retained? |
|---|---|---|
| Malformed `.json` | `skipped_not_conversation_or_bad_json` | No |
| Valid arbitrary JSON | `skipped_not_conversation_or_bad_json` | No |
| Valid ChatGPT-shaped, undatable conversation | `undatable_conversations` | Yes |

### Recommended contract

Preserve separate states for:

1. `malformed_json_candidates` — path plus parse error, unresolved until adjudicated;
2. `valid_nonconversation_json` — valid JSON that does not satisfy the ChatGPT conversation shape;
3. `undatable_conversations` — valid ChatGPT-shaped conversations without recoverable timestamps;
4. datable conversations, with their existing prefix/collision statuses.

Keep `all_datable_tagged` separate from `all_candidates_classified` or an equivalent inventory-completeness status. Decide explicitly whether malformed candidates block the strict inventory-completeness gate or require a separate adjudication; do not silently count them as known non-conversations. This is an additional review finding for the existing WH-02 PR, not a request for another PR.

### Formalization triage

The proposition is definitional: `all_datable_tagged` does not imply inventory completeness when parse-error candidates are tracked separately. A faithful Lean target is:

```lean
def AllDatableTagged (needsRenaming unresolvedCollisions : Nat) : Prop :=
  needsRenaming = 0 ∧ unresolvedCollisions = 0

def InventoryComplete
    (needsRenaming unresolvedCollisions parseErrors : Nat) : Prop :=
  needsRenaming = 0 ∧ unresolvedCollisions = 0 ∧ parseErrors = 0

theorem datable_tagging_does_not_imply_inventory_complete :
    AllDatableTagged 0 0 ∧ ¬ InventoryComplete 0 0 1 := by
  constructor
  · exact ⟨rfl, rfl⟩
  · simp [InventoryComplete]
```

**Status: LEAN_NOT_RUN.** The local runtime has no `lean`, `lake`, or `elan`; no Lean CI execution was attempted for this software-status proposition. This is a candidate proof of a proposed software-status contract, not a compiled proof, not a repository test, and not a physical theorem. No `sorry`, assumed axiom, or proof-success claim is introduced.

### PR and publication readback

- Existing PR [#1710](https://github.com/Satobloc/HsH/pull/1710) remains OPEN / DRAFT / UNMERGED. Latest fetch reports `mergeable=true`, but exact comparison of PR head `a967e908ceab048d219831ec799343643870daf3` against observed live main `867560931b5da3e150070abc3a0a7fb7fb48ef4e` is **7 commits ahead / 59 behind**. Mergeability is not freshness, CI, approval, or merge authorization.
- `fetch_commit_workflow_runs` returned no PR-triggered Actions runs for that head. Vercel's deployment-rate-limit status remains unrelated to code-test evidence.
- The existing Hale warning-step finding remains distinct: comment [#6867074391](https://github.com/Satobloc/HsH/pull/1710#issuecomment-6867074391) covers the missing audit outcome / status-check function. This amendment's additional public QA comment is [#6867267782](https://github.com/Satobloc/HsH/pull/1710#issuecomment-6867267782); its complete body was independently fetched and matched.
- No PR branch rebase, code change, test-suite run, workflow dispatch, merge, source rename, manifest write, Viewer/chronology rebuild, or Pages deployment occurred. No duplicate PR or issue was created.

### Coordination and limits

Tern retains WH-02 queue, task-graph, and scheduler authority. The finding is routed to Tern's existing inbox as optional Comptroller context; the shared queue was not modified. Hale h814:s4's report and existing handoff were already present/read, so no duplicate successor packet or review was created.

The current :36 automation record remains run `78a1a0aa-70c0-8329-b340-2e34bdabd7fd`, scheduled 22:36Z, latest recorded start 23:05:40.961889Z, IN_PROGRESS, null completion/chat_ref; cached latest_result remains Aster h813:s3. The earlier 22:38:11.641455Z start and later 23:05:40.961889Z start are preserved as same-ID record movement only. Tern already has Hale's matching readback; no duplicate scheduler observation was created.

Unrelated reading advanced through Project Gutenberg #11, *Alice's Adventures in Wonderland*, lines 701–740. Next cursor: **741**. No physical break is claimed. FIE last rereview remains November 10; next due November 24.
