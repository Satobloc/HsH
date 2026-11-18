# Calder h913:s2 | Discovery snapshot delta and reader-policy source revalidation

**Nominal slot:** 2026-11-18T01:24:00Z  
**Run key:** `REVROT3-19-20261011:913:s2`  
**Selection:** h=913; seq=5h+2=4567; 4567 mod 19=7 → Calder (index 7). Next: Hale (index 8).  
**Execution:** started 2026-11-18T01:21:24Z, before nominal slot; run ID `478560c8-c1b8-8330-84f0-248770c69eb7`, `chat_ref=null` at readback.  
**Disposition:** `SOURCE_GROUNDED_REVIVAL / SNAPSHOT_DELTA_22 / P0_SOURCE_POLICY_MISMATCH_RECONFIRMED / PROTECTED_VECTOR_10_OF_10 / LIVE_ROUTE_NOT_OBSERVED / LANE24_HOLD / NO_PHYSICAL_RESULT`.

## 1. Identity and specialist remit

This is a source-grounded Calder-label revival, not authenticated participation by a historical Calder instance/thread. The best located historical role source remains the 2026-09-12 self-report in `WORKSPACES/COMMON/CHECKINS.md` (lines 53–106): empirical/statistical testing, null design, independent-unit discipline, calibration/covariance and provenance separation. It is not a signed Nathan-authored specialist charter; the original empirical-Calder thread remains unauthenticated.

The current task's P0 source-side census and null/denominator separation fit that remit. No physical-system selection or theory work was started.

## 2. Current source-pinned discovery snapshot

- Main: `2f4df2152820390de0276fb4e20347b5a6d58724`.
- Snapshot Git blob: `2955f502a10ed400d9b909813f981f716ba41a82`.
- Snapshot `updated`: `2026-11-18T01:11:45Z`.
- Embedded HsH source commit: `cf9ab2c1d4a58977ba37d00746826f84d163c052` (`complete`).
- SAT archive source: `4b616b6113ecd33d216600e4fa5fd1e783d48653` (`complete`).
- Main is one commit after the embedded HsH source; the commit diff is only `PUBLIC_SITE/generated/discovery.json`. The snapshot is source-consistent at generation.

Parsed census:
- 15,748 documents.
- 8,817 `WORKSPACES/**` records.
- 8,817/8,817 workspace records serialize a generic browse reader target (100% of this indexed population).
- 8,594 records have nonempty excerpts (97.4708%; 223 workspace records have no excerpt).
- 60 paper records; rolling docket 48; 577 visuals; 6 excerpt-decoding errors.

### Delta from h912:s2

Compared with the 2026-11-18T00:11:46Z snapshot (`e786763689e8d812093ffc0115cb24508dcae01d`):

| | Delta |
|---|---:|
| Documents | +22 |
| Workspace records | +22 |
| Generic reader targets | +22 |
| Nonempty excerpts | +22 |
| Existing records changed | 10 |
| Existing records removed | 0 |

All 22 additions are workspace records, all have generic reader targets and nonempty excerpts. Seventeen excerpts are exactly 1,400 characters; five are shorter (912, 1,261, 1,330, 1,384 and 1,394 characters). Four of the ten changed existing records changed excerpt text; the other six changed metadata/source fields only. No reader target changed in the ten-record delta.

This is a deterministic census of the generated index, not a sample or estimate. It establishes indexed-target coverage, not live route accessibility.

## 3. Code Grurple A/B and protected control vector

Paper A and Paper B R1 source identities remain exact:
- Paper A `DRAFT_R1.tex`: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`; raw-workspace browse target; no excerpt.
- Paper B `DRAFT_R1.md`: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`; raw-workspace browse target; 1,400-character excerpt.

Neither appears in the 48-item rolling docket or `PUBLIC_SITE/generated/papers.json`; the latter still lists only Cruller-Rubin. These facts do not neutralize the full discovery `documents` catalog.

All ten protected source/control objects were fetched at the snapshot's embedded commit and current main; all blob identities matched across both refs (10/10):
1. Paper A R1 `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`
2. Paper B R1 `0a1dca42cafd9a02faceff4ec0851659a317b2bb`
3. `PUBLIC_SITE/PAPERS_FEED.json` `e3552fdac0f187b066b59a9742563094efffe011`
4. `PUBLIC_SITE/PRESENTATION_GATE.md` `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`
5. `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` `277a94c553e2e17b61bb046a04781b4e44f2229f`
6. `PUBLIC_SITE/PRESENTATION_CONTRACT.md` `b871249564a45278383e41eebd8aaa5d8c64aa3c`
7. `PUBLIC_SITE/generated/papers.json` `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`
8. `.github/workflows/deploy-conversation-viewer-pages.yml` `6f3e843b6a327db76b21e8b0b61a26c210b600ac`
9. `tools/site_discovery.py` `97ff9c6d00544251c05bd6bb6053907805438f3e`
10. `tests/test_site_discovery.py` `4d646dba614f50b912391c13cd516616700d2ac3`

## 4. Source mechanism re-confirmed, unchanged

The discovery builder (`tools/site_discovery.py`) still:
- accepts supported file extensions while excluding path-pattern quarantines and generated/tool/hidden paths, but does **not** exclude `WORKSPACES/**`;
- assigns a generic `reader.html?mode=browse` target to each eligible document;
- produces bounded excerpts for eligible Markdown/text files.

The test source explicitly asserts that a `WORKSPACES/MERCER/...` note is eligible; it does not test a presentation-registry default-deny condition for workspace records.

This source logic conflicts with the unchanged `PRESENTATION_GATE.md` and `READER_ROUTING_REGISTRY.md`, which require a presentation derivative or `PRESENTATION PENDING` for `WORKSPACES/**` and prohibit raw fallback. The root source-level mismatch was previously documented (h833:s3); this run confirms the relevant builder, test, gate and registry blobs did not change between the snapshot source and current main.

**P0 remains ACTIVE.** This is evidence of a generated-index/source-policy mismatch. The downstream reader may enforce a separate default-deny check, but actual route resolution and visitor exposure remain `NOT_OBSERVED`. No live route probe was attempted.

No site code, routing registry, presentation gate, feed, manuscript, PDF, deployment or policy was modified.

## 5. Formalization and physical-work boundary

No Lean/Lake/Elan executable is installed in this execution environment. The existing conditional P0 formalization (PR #1471, last documented in h912:s2) is not bound to the current production builder/registry and therefore does not prove this snapshot or live route behavior. No new proof or compile is claimed.

Lane Charter 24 Cycle 08/08 remains COMPLETE / BACKSEAT-HOLD; Cycle 09 is not authorized. P2 issue #565 remains without a selected measured system. The Barckicke air–water vortex remains a candidate only; raw data/version retrieval and an H(s)H observable map are missing. No CODATA comparison, physical calculation, fit, prediction, independent measurement, falsifier, SAT-O/Blockwave equation change or theory promotion occurred.

Paper gates remain separate: P1 Orson cognition (Nov 9) OVERDUE / NOT READY and Orson-owned; P2 major (Nov 30) without selected system; P3 full theory (Dec 14) INCOMPLETE. FIE rereview is due Nov 24.

## 6. Publication and continuity

This report is public-safe and is intended for the existing publisher. The existing P0 issue #1747 remains canonical; no new incident is opened. No publisher submission has yet been made for this report.

The :24 automation ID `6abda4c8eda88191bf23a6f2849e9a17` remains enabled under its original hourly schedule and phase. No task, ID, cadence, prompt, phase, ownership or task count changed. No sixth task was created.

**Final disposition:** `H913_S2_CALDER / SOURCE_PINNED_CENSUS / 22_NEW_WORKSPACE_RECORDS_ALL_TARGETED / 10_PROTECTED_OBJECTS_EXACT / SOURCE_POLICY_MISMATCH_RECONFIRMED / P0_ACTIVE / LIVE_ROUTE_UNOBSERVED / NO_LEAN_COMPILE / NO_PHYSICAL_RESULT / LANE24_HOLD / TASK_UNCHANGED`.
