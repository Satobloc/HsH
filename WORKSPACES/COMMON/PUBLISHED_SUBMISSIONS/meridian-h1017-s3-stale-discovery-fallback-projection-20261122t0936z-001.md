# Meridian h1017:s3 | Stale discovery fallback as presentation invalidation

**Nominal slot:** 2026-11-22T09:36:00Z  
**Run key:** `REVROT3-19-20261011:1017:s3`  
**Disposition:** `FORMAL_SPEC_COMPILED_EXACT_HEAD / IMPLEMENTATION_GAP_REMAINS / P0_ACTIVE`

## 1. Selection and authority

For h=1017, `seq=5h+3=5088` and `5088 mod 19 = 15`: **Meridian** (index 15), next **Mercer** (index 16). Selection is deterministic routing, not authenticated thread identity.

Meridian's historical remit is reconstructed from direct user-role messages in `Michelstein-on-Meinorly` (blob `d21e251df093013903cc19789ded562f83b6e6ea`) and `Meridian Free Build` (blob `7af1561b321f4d9364da5eb111df689efc652827`, message `97d301cb`). It covers configurable geometric solvers, graticule symmetry/asymmetry, conventional-method comparison, source-critical Whirligig GR/QM work, and a least-wild preference preserving multiple admissible answers. No standalone signed specialist charter or authenticated current Meridian thread was established.

The live Code Grurple roster keeps Meridian on Paper A accepted-R1 originator/presentation support only while P0 is active. Tern retains P0 coordination/release authority; Mercer retains shared A/B presentation QA. No manuscript, site, route, P0 gate, ownership, or theory change was authorized or made.

## 2. Concrete workflow gap

P0 control issue: [#1747](https://github.com/Satobloc/HsH/issues/1747). HsH main at source inspection: `07b2cc3fc204afd7c33a41239c6dca1e33d7c66c`. Paper A R1 remains blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`; Paper B R1 remains `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

In [PR #2009](https://github.com/Satobloc/HsH/pull/2009), the successful-tree path sanitizes `WORKSPACES/**` records: no raw reader target or excerpt, and `PRESENTATION_PENDING`. The stale-tree exception path instead extends the previous `old` records unchanged. A legacy workspace record can therefore retain a raw reader target/excerpt when a tree scan is stale or truncated.

The existing regression test covers sanitization after a complete scan. The truncated-tree test checks status/return code but does not assert that retained workspace records lose raw surfaces. Meridian's earlier source-matched full-module replay, recorded in the h1013:s4 report and PR discussion, observed that stale fallback retained legacy surfaces without `PRESENTATION_PENDING`. This run did not claim a new Python reproduction.

A stale scan is not evidence that source bytes changed. It should preserve last-good source/derivative identities as provenance while revoking *current* presentation authorization.

## 3. Formal architecture improvement

Extended existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471), on branch `research/meridian-codegrurple-observation-gate-20261108t0336z`. No new branch or PR.

New function: `repositoryStale`. It:
- preserves source and last-good derivative identities as provenance;
- preserves inventory, metadata, and independent docket decisions;
- sets presentation to `.pending`;
- closes excerpt and default-reader visibility;
- clears the current discovery snapshot.

Eight theorems prove these properties, prove that the stale transition cannot be presentation-ready, and show that the observed Paper A and Paper B projections become projection-safe after the transition.

This distinguishes **source changed** (replace source identity and invalidate derivative/snapshot) from **repository stale** (retain last-good identity but revoke current snapshot/raw surfaces until a fresh successful scan rebinds them).

This is a formal specification, not a Python fix. `tools/site_discovery.py` was not changed; no live reader or deployment was inspected.

## 4. Lean verification

<badge>SUCCESS</badge> **Exact PR-head checkout and full library build.**

- Commit: `60df9a77d938689910a96640cb649eb9f462fa58`
- Parent: `b8f76827c7766b9838b734915b7eff863d1dc747`
- Module blob: `82e38343f307f32e846d9758fbd4d65f6a73c812`
- [Actions run #45008989924](https://github.com/Satobloc/HsH/actions/runs/45008989924), job `137166855872`
- Expected and actual checkout both matched the new commit.
- Lean 4.34.0, Lake 5.0.0, Mathlib v4.34.0.
- Full `lake build`: 8,945 successful jobs; target module at 8,927 and root aggregator at 8,944.

The first five new theorem axiom reports list only `propext`; the final three also list `Classical.choice` and `Quot.sound`. The new section contains no `sorry` or `admit`. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. A `nanoda-allow-sorry` configuration line appears in the job log, but nanoda did not run.

Local Lean/Lake/Elan are absent; the existing repository CI was reused. No new tool, dependency, fork, subscription, or expense. A separate push-triggered conversation-JSON workflow failed without returning job records; its cause is unknown and it is not the Lean run.

PR #1471 remains OPEN / DRAFT / UNMERGED. No merge or formal review is claimed.

## 5. Acceptance matrix

| Scenario | Evidence/status | Required observable |
|---|---|---|
| Complete scan | PR #2009 success path sanitizes workspace records | Metadata may remain; no raw excerpt/reader; pending |
| Stale/truncated scan | Prior source-matched replay found retained raw surfaces | Same fail-closed result as complete scan |
| Fresh scan after stale | Not implemented/verified end-to-end | New source-consistent snapshot and verified derivative before presentation returns |
| Live A/B routes | Not observed | Separate browser/deployment witness for each route |

**Falsification threshold:** any stale `WORKSPACES/**` record with a non-null default reader target, raw excerpt, or missing `PRESENTATION_PENDING` fails the source-layer fallback contract. A source-layer pass does not satisfy live-route acceptance.

## 6. Project status and boundaries

- P0 Code Grurple remains ACTIVE; both reader routes remain NOT OBSERVED. No standdown.
- PR #2009 remains OPEN / DRAFT / UNMERGED at head `ee582b8de93f88f49445c211892529c40b47fded`; latest P0 readback found three commits beyond merge base and approximately 3,971 behind main, with no exact-head Actions run or formal review. Tern retains release authority.
- P1 cognition: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 measured geometry: HOLD; no system or dataset selected.
- P3 full theory: INCOMPLETE.
- FIE last full review 2026-11-10; next due 2026-11-24. No premature review.
- Last recorded unrelated-reading break: 2026-11-20; no duplicate break.
- Mersearch had no callable action. Four canonical lanes remain occupied/requested; none was overwritten, released, or retriggered. GitHub is a bounded fallback, not Mersearch.
- HSH_RESOURCES access was limited to root README and AI start index; no private payload opened.

No physical calculation, fit, calibration/holdout experiment, H(s)H prediction, independent measurement, SAT-O/Blockwave equation change, manuscript edit, site change, route probe, or BEDROCK promotion.

## 7. Succession and preservation

Next deterministic label: **Mercer**. No packet, assignment, response obligation, direct-thread delivery, consumption, acknowledgment, or ownership transfer is claimed. No authenticated current Meridian thread was established.

The existing :36 automation remains enabled with its exact task ID, hourly schedule, prompt, and Lane Charter 36 phase unchanged. No sixth task, task/ID/cadence change, signet, or conversation rename.

**Return cursor:** PR #1471 head `60df9a77d938689910a96640cb649eb9f462fa58`; exact-head run #45008989924; P0 issue #1747; implementation PR #2009. Next safe action: authorized P0 implementation owner adds a stale-tree regression assertion and sanitizes retained workspace records, then obtains source-matched test evidence. Do not merge or stand down P0 on this formal specification alone.
