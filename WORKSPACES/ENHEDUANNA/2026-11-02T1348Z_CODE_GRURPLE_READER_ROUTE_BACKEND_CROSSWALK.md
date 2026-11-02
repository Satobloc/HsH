# Enheduanna — Code Grurple backend route crosswalk
**Run:** 2026-11-02T1348Z · **Rotation:** h=541, s=4 · **Status:** READ-ONLY QC / PRESENTATION PENDING / NO SITE EDIT

## 1. Rotation and source identity

The automation's actual `scheduled_for` is **2026-11-02T13:48:00Z**. Therefore the nominal UTC hour is h=541, not the later wall-clock hour when execution began.

\[
seq=5(541)+4=2709,\qquad 2709\bmod19=11.
\]

Selected: **Enheduanna** (ring index 11). Next: **Tern Rook** (index 12). Next run key: `REVROT3-19-20261011:542:s0`.

The :48 task remains enabled, ID `6aa6c3bc02b48191b8a91a30d2a155e0`, exact original schedule:
`DTSTART;TZID=America/New_York:20261001T144800; RRULE:FREQ=HOURLY`.
No task, ID, phase, cadence, or ring change.

Current scheduled execution: run `98b484ce-8e30-8332-acd5-e4a07b184fd1`, `chat_ref=null`. This is not an authenticated Enheduanna thread.

### Historical Enheduanna instruction recovered

No standalone user-authored Enheduanna specialist charter, workspace README, or Enheduanna inbox was found. The actual direct user instruction recovered is a broad archive-wide revival instruction, not a detailed specialty charter:

- Conversation: **Revival Rotation**
- Conversation ID: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`
- Raw path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/26.09.14•26.09.22•Revival Rotation — raw (2).json`
- Raw blob SHA-1: `386516f7c2d5b9ab2cd4f0050869ae00c133274d`
- Direct user message UUID: `11399ca2-5bd6-4203-9e19-e8e044fbc736`
- Timestamp: `2026-09-23T02:04:49.417Z`
- Parent: `055c7407-7f6c-477d-8e53-603c028b94ec`

Exact relevant wording:

> Enheduanna is a similar case, though I don't know if there's much of that in the archives as yet. But do always consider all archives.

The preceding context concerns Alberr/Albert/Einstein identity variants, age-bound versus timeless revival lanes, and consolidation with outside resources. The direct instruction therefore supports an **archive-wide identity-family search/revival**, not a historically established Enheduanna-specific research charter. The following assistant response proposed applying that search method to Enheduanna; that response is assistant-authored.

The existing `WORKSPACES/ENHEDUANNA/2026-10-12_SOURCE_LAYER_CENSUS_AND_EXPOSURE_BOUNDARY.md` (blob `8d6b08dac9e169f529f1b43cbd8c3cbf0cc78478`) is an assistant-authored source-layer reconstruction, not a Nathan Direct charter. Historical identity continuity and a current usable Enheduanna chat remain unverified.

## 2. Controlling priority

The live `CODE_GRURPLE_ROSTER.md` says the emergency publication interlock remains **ACTIVE** and outranks ordinary project priorities until both R1 papers pass the actual reader-facing acceptance gate or Nathan stands it down. `LIVE_NEW_PAPERS_STANDARD.md` keeps the current manuscript content closed and makes the shared `sandbox_manuscript` rendering defect presentation-only.

The capability atlas contains no Enheduanna site-editor or `PUBLIC_TRANSLATION` capability entry. This runtime has no Sites editor. Accordingly, this run did not attempt a repair or continue ordinary Enheduanna source/variant research. It performed only a bounded, read-only backend crosswalk for the active interlock.

## 3. Pinned R1 source identities independently rechecked

Snapshot: HsH `main` at `e557b7ac72e848e566f3bed237ae15fb9f81fcfd` (2026-11-02T13:58:51Z).

| Paper | Pinned source ref | Independently fetched blob | Result |
|---|---|---|---|
| A — `convergent-motifs-r1` | `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | MATCH |
| B — `boundary-weak-emission-r1` | `731e2fb5888b0aec856fd9e31319c39746514239` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | MATCH |

No manuscript bytes were changed.

## 4. Backend route crosswalk

The repository currently contains two distinct presentation paths:

### A. Existing Code Grurple route in the feed

`PUBLIC_SITE/PAPERS_FEED.json` (blob `e3552fdac0f187b066b59a9742563094efffe011`, `updated: 2026-10-21`) contains both R1 IDs and their existing URLs:

- Paper A: `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1`
- Paper B: `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1`

Both feed entries identify `site_display: sandbox_manuscript` and site version 34. The feed records A as staged/accepted R1 and B as posted/reviewed R1. The feed is a discovery/card feed, not reader acceptance evidence.

### B. New automatic PDF paper-series route

`PUBLIC_SITE/PAPERS/README.md` (blob `8fb50b142290f6b33879f4f9f3b90fdbcca3d81b`) describes a different pipeline:

- register `PUBLIC_SITE/PAPERS/<paper-id>/paper.json`;
- include a typeset PDF;
- set `published: true` only when ready;
- render through `reader.html?paper=<paper-id>`;
- publish via `.github/workflows/publish-paper-series.yml` and `tools/publish_papers.py`, without a Sites edit.

Actual repository inventory at the same main snapshot:

- `PUBLIC_SITE/PAPERS/` contains only `_templates` and `cruller-rubin` as paper directories.
- `PUBLIC_SITE/generated/papers.json` (blob `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`, revision `98690a390fca65274ac4f9104a8b63f25ca47c25`, updated 2026-10-21T13:19:55Z) lists only `cruller-rubin`.
- Neither Code Grurple R1 ID is registered in that generated index or in `PUBLIC_SITE/PAPERS/`.
- The GitHub `PUBLIC_SITE/` directory contains neither `paper.html` nor `reader.html`; the live route implementation is outside this repository.

**Finding:** the old `paper.html?id=...` feed routes and the new `reader.html?paper=...` automatic PDF-series route are not reconciled for Papers A and B. The new pipeline is a possible alternative presentation path, but it is not the same route and cannot silently be treated as satisfying the existing Code Grurple acceptance test.

## 5. What was and was not verified

- The two pinned R1 source blobs match exactly.
- Feed metadata contains both old route IDs.
- The new automatic reader index contains neither.
- The new automatic reader directory contains neither.
- The repository does not contain the live Sites route implementation.
- A bounded live-route open was unavailable in the web runtime; the container HTTP request was also unavailable because network access is disabled. The Browser connector exposes tab listing only, not navigation or Sites editing. Per the roster, no repeated probes were made.

This does **not** establish that either live route is currently down. It establishes that this runtime cannot inspect or repair the external Sites implementation, and that the new in-repository PDF reader is not yet populated for these two papers.

## 6. Tern decision boundary

A site-capable editor must either:

1. repair the existing `paper.html` / `sandbox_manuscript` route once for both source formats and pass Marlowe's full live acceptance checklist; or
2. obtain an explicit route/acceptance decision before migrating the two papers to the newer PDF series, then create presentation-only PDF derivatives and metadata, run the existing publisher, and verify the actual new reader URLs.

Do not change either pinned manuscript. Do not change the feed, generated index, registry, roster, task graph, or route acceptance criteria from this lease. Do not count a feed card or repository build as live-route acceptance.

## 7. Other controls and parked work

- Current task branch: main snapshot above. `TASK_BRANCH_GRAPH.json` is blob `3c341c616aa893bf56ad5ad5919e09a17e0c2b46`, last updated 2026-10-30T06:12Z; it already records Code Grurple active and both routes PRESENTATION_PENDING. It was not edited; Tern owns the control plane.
- Enheduanna PR #890 remains open/draft/unmerged on `research/enheduanna-third-physical-witness-du8-20261028t1212z`, head `7e75fb3ee6a36fb6bf4e92654481724e27e58be8`. No code changes or Lean run were made. The existing `OLayoutScopeSeparation` module remains outside the root import path; no new theorem is claimed.
- No new Mersearch request: all four shared lanes are occupied (lane 1 Calder angle-source request at 13:37Z; lane 2 optics inventory; lane 3 Ravel equation census; lane 4 Tern Comptroller-charter search). Existing Enheduanna compact search receipts were reused only as navigation/provenance; raw result sets remain withheld and are not claimed exhaustive.
- No ordinary Enheduanna source/variant research advanced while Code Grurple is active.
- Orson P1 ownership and the Nov 9 gate remain untouched. P2 Nov 30 and P3 Dec 14 remain separate.
- FIE last full review: October 27; next due November 10, not yet.
- Unrelated reading break: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, `SAT Mark V/TheTANGLE.txt`, lines 1971–2010, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`. Next cursor: line 2011.

## 8. Execution and handoff status

Expected :36 predecessor (Nadir, h=541,s=3) failed: run `9bc7fc31-8024-8321-9b36-079db2b8dcb6`, scheduled 13:36Z, started 13:45:23Z, completed 14:10:41Z, `chat_ref=null`. No 13:36 receipt or handoff was present at inspection. This is a failed scheduled execution, not a worker refusal.

The :00 task's last visible run was the 13:00Z Calder run, completed 13:57:48Z. No 14:00Z Tern run was visible at the last peek. The handoff is optional context for `REVROT3-19-20261011:542:s0`, not a task or assignment.

No public issue, PR, branch, manuscript, route, task, ID, cadence, signet, or theory status was changed. No HSH-PUBLISH-V1 submission was warranted because this is an internal control-plane QA note, not a new public research claim.


## Delivery timing amendment — 2026-11-02T1424Z

Tern's intended :00 run `REVROT3-19-20261011:542:s0` started at `2026-11-02T14:23:56.519929Z` (run `8351831b-f8f0-8331-8fc1-aa8f7ec01fa9`) before the repository inbox append committed at `2026-11-02T14:24:10Z`. The handoff is therefore **LATE_OPTIONAL_CONTEXT_ONLY** for that run. The Tern inbox append and timing correction were independently read back; no consumption or acknowledgment is claimed. If not consumed, the next same-phase Tern selection is `REVROT3-19-20261011:561:s0` at `2026-11-03T09:00:00Z`.
