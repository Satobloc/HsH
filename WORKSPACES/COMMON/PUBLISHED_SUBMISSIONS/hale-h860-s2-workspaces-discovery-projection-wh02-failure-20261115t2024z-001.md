# Hale h860:s2 | Full WORKSPACES discovery projection and WH-02 failure revalidation

**Date:** 2026-11-15  
**Run key:** `REVROT3-19-20261011:860:s2`  
**Selection:** Hale, ring index 8; next ring label Elias Kern, index 9.  
**Identity:** deterministic routing only. This is a source-grounded revival, not an authenticated historical Hale instance or current-thread participation.  
**Disposition:** `P0_DISCOVERY_PROJECTION_SCOPE_EXPANDED / SOURCE_CONSISTENT_AT_PUBLICATION / WH02_STRICT_AUDIT_FAILURE_REPRODUCED / PWH_DEEP_SWEEP / P2_HOLD / NO_REPAIR_OR_THEORY_PROMOTION`.

## 1. Historical remit and current authority

The strongest historical Hale source is the 2026-09-12 Common check-in, `WORKSPACES/COMMON/CHECKINS.md`, entry “Hale — 2026-09-12”. It records a matched 2024-versus-2026 arXiv/literature-landscape scanner, Python/code/scoring/statistical analysis, control calibration, and explicit accounting of what was loaded versus merely accessible. The entry is a historical self-report, not a Nathan-authored specialist charter. The assistant-maintained `REV-006-HALE-REENTRY.md` packet preserves the exposure boundary: Hale was external-literature exposed by design and is not a blind theory reviewer. No authenticated current Hale thread was established.

The current Hale continuity and inbox, latest h852:s4 Knister PTV pressure-uncertainty report, and prior GW150914, GW170817 and GW250114 evidence reports were read to avoid repeating existing work. The user-supplied Lane 24 overlay governs this run, but P0 Code Grurple remains the controlling emergency interlock. No P2 work was allowed to displace it.

Preflight included live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3, thread-first and navigation-preflight rules, scheduler authority, task graph, PWH queue, current main, recent receipts, and all three repository front doors. HSH_RESOURCES was limited to its root README and private-reference boundary; no private payload was opened.

## 2. Current discovery snapshot: broader scope than the Paper A/B pair

The exact current `PUBLIC_SITE/generated/discovery.json` Git blob was fetched and parsed in full:

- Snapshot time: `2026-11-15T20:12:46Z`.
- Blob SHA-1: `ef2d8527939d44ce1b31c0c58f6bfddee7f969fa`.
- Embedded HsH source commit: `45c6c54b9e55e7db7c75b7c9c224dc57cb12e785`.
- Generated commit / current main at preflight: `5e7a02e98e2cfd826c09ad1ee496d39718b04462`.
- Source-to-generated comparison: one commit ahead, zero behind, only `PUBLIC_SITE/generated/discovery.json` changed.

Classification: **SOURCE_CONSISTENT_AT_PUBLICATION**. This is a fresh snapshot reproducing a source-layer policy mismatch, not a stale-at-publication race.

| Snapshot measure | Result |
|---|---:|
| Full documents catalog | 15,142 |
| Rolling docket | 48 |
| Visuals | 577 |
| Excerpt errors | 6 |
| `WORKSPACES/**` records | 8,211 |
| Workspace records with generic reader targets | 8,211 |
| Workspace records with embedded excerpts | 8,011 |
| Aggregate embedded workspace excerpt characters | 11,011,151 |

Every one of the 8,211 `WORKSPACES/**` records carries a generic reader target. Of these, 8,011 also carry an excerpt. All are labeled `Working record` in the discovery catalog.

The `WORKSPACES/PAPERS/**` subset contains 60 records. All 60 have generic reader targets; 57 have excerpts. Both protected R1 manuscripts remain present:

- Paper A: `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`, source blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`; generic reader target present; no excerpt.
- Paper B: `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md`, source blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`; generic reader target present; 1,400-character excerpt.

Neither is in the 48-item rolling docket. The October 21 `PAPERS_FEED.json` still marks both `site_display=sandbox_manuscript`; the separate `generated/papers.json` still contains only Cruller-Rubin. Feed staging and docket exclusion do not authorize the full discovery catalog's raw reader targets.

The earlier Hale inbox count of 7,915 workspace reader targets and 7,718 excerpts has risen to 8,211 and 8,011 respectively. The difference is a snapshot-count change, not yet a source-attributed list of new files.

## 3. Source-level cause

Current policy objects remain:

- Presentation Gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- Reader Routing Registry: `277a94c553e2e17b61bb046a04781b4e44f2229f`.
- Presentation Contract: `b871249564a45278383e41eebd8aaa5d8c64aa3c`.

The registry says `WORKSPACES/**` is never ordinary reader content unless an explicit presentation derivative nominates a particular artifact. Unknown paths must return PRESENTATION PENDING or remain absent. Raw source must never be the default click target.

Current builder `tools/site_discovery.py`, blob `97ff9c6d00544251c05bd6bb6053907805438f3e`, does not consult that registry:

1. `eligible(path)` checks extension, exclusion patterns, generated prefixes and hidden path components, but has no `WORKSPACES/**` or presentation-eligibility gate.
2. `route(repo, path)` creates a generic `reader.html?mode=browse&repo=...&path=...&kind=file` target for every eligible file.
3. `excerpt(...)` extracts up to 1,400 cleaned characters from eligible Markdown/text files under its size bound.

The current discovery projection therefore violates the documented default-deny contract at the source layer. The scope is broader than Paper A/B: 8,211 workspace records receive raw generic reader targets and 8,011 carry embedded excerpts.

**Live route status remains UNOBSERVED.** This proves discovery metadata and projection behavior, not that the browser rendered every target or that a live raw-display incident occurred. No Sites editor or authorized live-route probe was available. No builder, registry, gate, contract, feed, manuscript or site change was made.

Canonical incident: [HsH issue #1747](https://github.com/Satobloc/HsH/issues/1747), still OPEN / ACTIVE. Tern retains P0 authority.

## 4. WH-02: latest strict audit failure read from Actions logs

The latest retrieved navigation run is [#43756573298](https://github.com/Satobloc/HsH/actions/runs/43756573298), job `132943025261`, workflow “Maintain H(s)H navigation”. The job checked out main and completed the date-tagging passes before the strict audit failed.

Exact strict-audit output:

```text
{"fully_tagged": false,
 "counts": {
   "dated_and_correct": 1040,
   "needs_renaming": 0,
   "unresolved_collisions": 0,
   "undatable_conversations": 2,
   "skipped_not_conversations_or_bad_json": 847
 },
 "output": "indexes/manifests/date-tag-audit.json"}
```

The strict audit exited 1. The later “Report date-tagging warnings” step and all downstream viewer, chronology, structural-index, autotag, tests, commit and deployment steps were skipped.

This confirms the previously identified predicate problem: two legitimate undatable conversations make `fully_tagged=false`, despite zero datable files needing renaming and zero collisions. The run does not show a new rename defect. The skipped count is 847 in this run, not the prior 846.

The existing [PR #1710](https://github.com/Satobloc/HsH/pull/1710) remains the sole active WH-02 proposal, OPEN / DRAFT / UNMERGED:

- Head: `a967e908ceab048d219831ec799343643870daf3`.
- Base: `main`.
- Current main at comparison: `5e7a02e98e2cfd826c09ad1ee496d39718b04462`.
- Compare: `diverged`, 7 commits ahead and 2,553 behind; merge base `7c40096153861e531b4ba234f28b41a2260fba04`.
- PR metadata reports `mergeable=true`, but the compare result is diverged; do not treat the metadata flag as integration evidence.
- No PR-triggered workflow run was returned for the exact PR head.

The existing PR already separates datable completeness from undatable exceptions. Remaining defects are the warning-step reachability (`always()` and strict-audit outcome), malformed JSON being collapsed with valid non-conversation JSON, and dotted extensionless titles being truncated by generic suffix removal.

**Next action:** Calder/authorized archive maintainer rebases the existing PR #1710 onto current main, fixes those three gaps, runs exact-head PR CI and the full navigation acceptance suite, then obtains independent review. No second WH-02 PR, branch update or code edit was made.

Issue [#1702](https://github.com/Satobloc/HsH/issues/1702) remains OPEN.

## 5. Primary Workflow Health deep sweep

The live task graph blob is `5994a3952fbb0a2bc23aa4b4388c70b979ef1227`, updated `2026-11-15T17:24:00Z`.

- 18 branch records versus declared `branch_count=16`; preserve both values.
- 13 active/blocked/candidate records and 5 completed.
- Priority distribution among active records: P0=3, P1=1, P2=4, P3=1, P4=1, UNCLASSIFIED=3.
- Metadata gaps among active records: priority=3, owner=7, due date=10, last reviewed=10.
- Seven roots; one unreachable blocked node, `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03`; one parent-only relation from that node to `P2-REAL-SYSTEM-GEOMETRY-2026-11-30`; no dangling references or cycles were found.

The existing read-only `WORKSPACES/COMMON/task_upkeep_triage.py` source blob `49d2fdd8f36b6091a3b06e0a65ad6c5d4e69ed01` was re-read. Its self-test passed when executed from the retrieved source body, and its triage logic was replayed against the exact live active-node projection as of 2026-11-15. It ranks the three P0 Code Grurple records first, then the Orson-owned P1 (six days overdue), then P2 measured geometry due November 30. No explicit low-hanging candidate can be identified because effort/value metadata is absent. No graph field, branch count, owner, status, priority or due date was changed.

The latest 20 HsH Actions runs contained 8 failures, 8 cancellations and 4 successes. The latest navigation failure above was diagnosed. One sampled `conversation-json-content-ci` failure, run #43756572045, returned an empty jobs array; its cause remains UNKNOWN. The run sample is bounded, not a complete workflow census.

## 6. Mersearch, Lane 24 and scientific boundaries

The stable Mersearch release documentation identifies `mersearch-stable-1.0`, pinned commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. No callable Mersearch action is exposed in this runtime. The four canonical request files remain `requested` and are treated as occupied/reserved by the queue; `requested` is not execution evidence. No request was overwritten, retriggered, released or represented as completed. No private HSH_RESOURCES payload was opened.

The P2 graph node remains HOLD: no final system is selected; no selected raw dataset/version, complete calibration/covariance, source-grounded H(s)H forward map, precise geometry plot, independent hostile review, frozen holdout or falsification threshold is complete. Hale's existing Knister PTV pressure-uncertainty report remains candidate-only; its adjacent-method literature does not establish a validated uncertainty budget for the specific STB/VIC# pressure pipeline. Existing GW150914, GW170817 and GW250114 reports were checked to avoid duplicate external research.

No physical calculation, CODATA numerical comparison, fit, prediction, independent measurement, P2 selection or theory promotion was performed. No Lean theorem/build was claimed because this run introduced no new mathematical proposition. No SAT-O or Blockwave equation was changed.

FIE was last reviewed November 10; the next rereview remains November 24.

## 7. Unrelated reading and operational status

Unrelated reading quantum completed in `SAT_THEORY_ARCHIVE_2023-25/000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, blob `f33eb29fbac65efa1db054239bb9c28a04a13a42`: lines 1881-1920. This is a flattened language-game transcript, not raw role metadata or a basis for linguistic claims. Next cursor: line 1921.

The existing :24 automation remains enabled with its original task ID `6abda4c8eda88191bf23a6f2849e9a17`, exact hourly America/New_York schedule and original phase. Current run `68b6460c-bf78-832b-92c9-79ae948456b2` is recorded IN_PROGRESS, scheduled 20:24Z and started 20:25:40.444630Z; completion and chat reference are null. Task-level `last_run_time` and `next_run_time` are stale relative to this `run_details.last_run` record. Cached latest result belongs to the preceding h859 run, not this h860 execution. IN_PROGRESS does not establish worker liveness.

No task, ID, schedule, phase, cadence, enabled-state, branch ownership or theory status was changed. No sixth task was created. No historical Hale-instance participation or cross-thread delivery is claimed.

**Final classification:** `H860_S2_HALE / P0_WORKSPACES_DISCOVERY_PROJECTION_SCOPE_8211 / 8011_EXCERPTS / SOURCE_CONSISTENT_AT_PUBLICATION / WH02_STRICT_AUDIT_FAILURE_2_UNDATABLE / PR1710_DIVERGED_7_AHEAD_2553_BEHIND / PWH_DEEP_SWEEP / MERSEARCH_UNAVAILABLE_ALL_LANES_OCCUPIED / P2_HOLD / AUTOMATION_UNCHANGED`.
