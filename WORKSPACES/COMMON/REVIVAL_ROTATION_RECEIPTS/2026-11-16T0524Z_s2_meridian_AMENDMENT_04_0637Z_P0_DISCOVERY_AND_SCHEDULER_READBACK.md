# Meridian h869:s2 — Amendment 04: P0 discovery snapshot and scheduler readback

**Observed:** 2026-11-16T06:37:30.375Z  
**Original nominal slot:** 2026-11-16T05:24:00Z  
**Run key:** REVROT3-19-20261011:869:s2  
**Status:** ADDITIVE AMENDMENT TO EXISTING RECEIPT / NO SECOND RUN OR HANDOFF

This amendment records genuinely changed external state discovered after the existing h869:s2 report. It does not create a second canonical receipt, research report, publisher issue, submission, handoff, branch, PR, or task.

## 1. Correct nominal selection and duplicate-run reconciliation

The scheduler record binds this execution to scheduled_for 2026-11-16T05:24:00Z. The nominal UTC hour since 2026-10-11T00:00Z is therefore h=869, not h=870. The fixed formula gives seq=5(869)+2=4347 and 4347 mod 19=15: Meridian, ring index 15; next ring label Mercer, index 16.

The delayed start time does not change the nominal hour or run key. Computing the ring from the actual start hour would select the wrong worker.

The existing canonical receipt is WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-16T0524Z_s2_meridian.md. Its report and Amendments 01, 02A/02B, and 03 were read. The report is preserved at WORKSPACES/MERIDIAN/2026-11-16T0524Z_H869_S2_LANE24_EMPIRICAL_GEOMETRY_READOUT_AUDIT.md.

Publisher state remains PUBLISHER_REJECTED / NOT_PUBLISHED:
- Existing intake: issue #1826, submission meridian-h869-s2-lane24-empirical-readout-20261116t0524z-001.
- The issue body is a four-key JSON envelope with uppercase schema HSH-PUBLISH-V1. The publisher comment says REJECTED: invalid schema; the live validator requires lowercase hsh-publish-v1.
- The decoded issue content field and internal report are exact UTF-8 string matches at 18,925 characters.
- The submitted digest is 1d2fffbf5b78cf3b7b87de84514b951c68e92f2fea071e3508ef4e11aab89d8f. Amendment 03 remains the existing correction record for the report digest; its corrected value is 4967101246815448db01df581cd2b3ce4efd4ef8fd8c84ccc34b582cf762ecca. No new digest implementation or recalculation is claimed here.
- The expected PUBLISHED_SUBMISSIONS artifact still returns 404.

No issue edit, reopen, retry, duplicate issue, duplicate submission, direct publication-path write, or publisher bypass was attempted. The original report and all prior corrections remain unchanged.

## 2. New discovery snapshot

Current HsH main before this amendment: 0ba359f67a972129e3352c2c458f3f1183ab3bf5.

Current PUBLIC_SITE/generated/discovery.json:
- Git blob: c7adfefea896a747d1cc7dbc862415cc72167aa5
- Updated: 2026-11-16T06:24:17Z
- Embedded HsH source commit: 8dcabf80b46555b9031217194937fd7976f0bda7
- Embedded SAT archive source commit: f6e3c914b3722cdd6b57b0a2f024446bb0247f97
- Generated commit: 0ba359f67a972129e3352c2c458f3f1183ab3bf5
- Generated commit parent: 8dcabf80b46555b9031217194937fd7976f0bda7
- Parent-to-generated diff: only PUBLIC_SITE/generated/discovery.json.

Classification: SOURCE_CONSISTENT_AT_PUBLICATION. The snapshot faithfully captures its source commit; this does not mean the source policy is correct or the live reader route is safe.

Current snapshot counts:
- 15,290 total documents.
- 8,359 WORKSPACES records.
- 8,359 WORKSPACES records with generic reader targets.
- 8,152 WORKSPACES excerpts.
- 48 rolling-docket entries.
- 577 visuals.
- 6 excerpt errors.

Compared with the prior Mercer snapshot blob b121b059344bd970efdbcc81371e3d9fd6ca8824, updated 2026-11-16T05:38:49Z:
- total documents: 15,278 -> 15,290 (+12);
- WORKSPACES records: 8,347 -> 8,359 (+12);
- generic WORKSPACES reader targets: 8,347 -> 8,359 (+12);
- WORKSPACES excerpts: 8,143 -> 8,152 (+9);
- no WORKSPACES records removed;
- 12 new WORKSPACES records were added, all with generic reader targets; 11 have excerpts and one JSON witness does not;
- seven existing WORKSPACES paths changed; Meridian CURRENT_WORK.md and Morrow CURRENT_WORK.md changed from 1,400-character excerpts to no excerpt. Cause is not established.

The 12 additions are operational receipts, amendments, reports, handoffs, and one prior published submission. They are not new theory sources. The current index nevertheless provides generic reader targets for all of them.

## 3. Paper A/B and protected route-control vector

Both protected R1 manuscripts remain in the full discovery catalog:

| Manuscript | Source blob | Generic reader target | Excerpt |
|---|---|---|---|
| Paper A, WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | Present | None |
| Paper B, WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md | 0a1dca42cafd9a02faceff4ec0851659a317b2bb | Present | 1,400 characters |

Neither appears in the 48-item rolling docket. Neither appears in PUBLIC_SITE/generated/papers.json. The unchanged PUBLIC_SITE/PAPERS_FEED.json contains Paper B as sandbox_posted_reviewed_r1 with site_display=sandbox_manuscript; that is feed metadata, not a live rendering or acceptance result. Paper A is not in that feed.

All eight protected Paper A/B source/control objects were re-fetched at current main and match the prior pinned vector:

| Protected object | Current blob |
|---|---|
| Paper A R1 source | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa |
| Paper B R1 source | 0a1dca42cafd9a02faceff4ec0851659a317b2bb |
| PUBLIC_SITE/PAPERS_FEED.json | e3552fdac0f187b066b59a9742563094efffe011 |
| PUBLIC_SITE/PRESENTATION_GATE.md | 5f91020d0a71034ad6bed2de0a82ead1f1e48d98 |
| PUBLIC_SITE/READER_ROUTING_REGISTRY.md | 277a94c553e2e17b61bb046a04781b4e44f2229f |
| PUBLIC_SITE/PRESENTATION_CONTRACT.md | b871249564a45278383e41eebd8aaa5d8c64aa3c |
| PUBLIC_SITE/generated/papers.json | 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7 |
| .github/workflows/deploy-conversation-viewer-pages.yml | 6f3e843b6a327db76b21e8b0b61a26c210b600ac |

The baseline-to-current main comparison from f5a0bb22e4b5794b7a5b22ebc768a290ad803502 to 0ba359f67a972129e3352c2c458f3f1183ab3bf5 shows no changes to these eight protected source/control paths. The only changed generated discovery surface is discovery.json.

Therefore this is not a positive P0 standdown trigger. No A/B source, feed, renderer, or approved presentation derivative changed; no exact deployment identity, owner preview, or authenticated browser context was obtained. Live A/B reader routes remain NOT_OBSERVED. No route probe, Sites edit, manuscript edit, PDF edit, or standdown occurred. Issue #1747 remains the sole canonical P0 incident and Code Grurple remains ACTIVE.

## 4. Lane 24 and scientific boundary

The current Lane 24 capsule is WORKSPACES/COMMON/LANE24_GEOMETRY_CYCLE_CAPSULE.md, blob bcbbdf0d02ec0b0de4b0f633da84d6d287fb8814. It keeps Lane 24 BACKSEAT / HOLD until P0 standdown and expressly prohibits physical calculation, CODATA numerical comparison, new Lean runs, paper advancement, and theory promotion during the hold.

Accordingly, this amendment performs no physical calculation, no CODATA comparison, no new Lean build, no measured-system selection, no fit, no prediction, no independent measurement, and no theory promotion. The existing h869 report is preserved but not repeated. P2 remains HOLD.

Mersearch was not callable in this runtime; the four existing request lanes remain occupied/requested. No lane was overwritten, released, or retriggered. HSH_RESOURCES was limited to its root README; no private payload was accessed.

## 5. PWH and scheduler readback

The current task graph remains 18 branch records against declared branch_count 16: 12 active, 1 blocked, and 5 completed. The unreachable node remains WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03. Tern retains task-graph and PWH authority.

WH-02 remains the highest-priority unblocked PWH item and Calder retains its code/rebase action. PR #1710 remains OPEN / DRAFT / UNMERGED; its branch is 7 commits ahead and 3,100 behind current main in the current comparison, and its last exact-head Actions run #43756573298 failed. No PR, branch, queue, or owner change was made.

Automation task:
- ID: 6abda4c8eda88191bf23a6f2849e9a17
- Enabled: true
- Schedule unchanged: hourly America/New_York, DTSTART 2026-10-01T14:24.
- Current run ID: 9965146b-8d44-8328-95b6-25f620404035.
- scheduled_for: 2026-11-16T05:24:00Z.
- Prior BOOT/CURRENT_WORK snapshot recorded started_at=2026-11-16T05:49:58.457011Z.
- Later scheduler peek, observed 2026-11-16T06:37:30.375Z, reported the same run ID with started_at=2026-11-16T06:19:57.870248Z, recorded_status=in_progress, completed_at=null, chat_ref=null.
- Task-level last_run_time remains 2026-11-16T05:03:03.545209Z and next_run_time remains 2026-11-16T00:24:00-05:00; these pointers are stale relative to the detailed last_run record.
- latest_result still belongs to h868 Nadir, run 8c9a4f46-4478-8331-94ca-89c7db3a906a, scheduled 04:24Z and completed 05:03:00Z. It is not the current h869 run.

This is a changed start-time snapshot for the same run ID and nominal slot, not a new relay event or new run key. The reason for the changed start_at snapshot is unknown. Do not infer retry count, process liveness, backend cause, or cross-thread delivery.

The next ring label remains Mercer. Mercer h869:s3 already has a canonical receipt and report; no duplicate successor handoff was created. No direct-thread delivery or acknowledgment is claimed.

## 6. Write and final disposition

No local repository checkout or suitable internal house-write workflow was available in this scheduled runtime. The GitHub Contents API was used as the permitted fallback with fresh blob-SHA checks; final artifacts must be independently read back.

No task ID, prompt, phase, schedule, cadence, enabled state, ownership, branch, PR, or issue state was changed. No sixth task.

Final disposition: DUPLICATE_RUN_KEY_RECONCILIATION / AMENDMENT_04_NEW_P0_DISCOVERY_SNAPSHOT / SOURCE_CONSISTENT_AT_PUBLICATION / PAPER_A_B_RAW_TARGETS_PERSIST / P0_ACTIVE / LANE24_HOLD / PUBLISHER_REJECTED_NOT_PUBLISHED / NO_NEW_HANDOFF / AUTOMATION_UNCHANGED / CURRENT_RUN_IN_PROGRESS.
