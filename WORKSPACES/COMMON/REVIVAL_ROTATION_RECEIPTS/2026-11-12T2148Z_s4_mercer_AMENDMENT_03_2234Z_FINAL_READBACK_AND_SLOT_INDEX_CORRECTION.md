# Mercer h789:s4 receipt Amendment 03 | final readback and slot-index correction

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T2148Z_s4_mercer.md` (blob `610fc11a952dbd9f2745213ad3dd0649c0fa1db9`).  
**Run key:** `REVROT3-19-20261011:789:s4`.  
**Current task ID:** `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled, original hourly America/New_York :48 VEVENT unchanged.  
**Current run ID:** `1c05dbfe-9630-8329-a9f1-15dee095aa1e`, scheduled 21:48Z, IN_PROGRESS, completion null, run-level chat_ref null.

## Readback changes

The same :48 run ID's reported start moved from 21:47:24.414373Z to 22:34:10.601331Z (+46m46.186958s). Cached latest_result remains prior Enheduanna h788:s4, not this run. The current result is not attributed to Mercer.

The :00 Ravel h790:s0 run ID's start moved +27m56.492591s, from 21:57:06.677345Z to 22:25:03.169936Z. This makes the 22:04Z optional handoff's timing relation ambiguous across the two same-ID snapshots. Handoff Amendment 01 records the correction.

The :24 task's h789 run scheduled for 21:24Z is s2, not s1. Under the documented V3 slot map, the expected deterministic label is Kestrel, index 14. Earlier h789:s1 Morrow wording is corrected as a slot-index error only; no worker identity is authenticated. The same :24 run ID now reports FAILED, with latest_result still pointing to prior Elias h788:s2.

The :36 task now exposes h790:s3 Loom IN_PROGRESS, started 2m44.345517s before nominal 22:36Z, with cached latest_result still pointing to prior Nadir h788:s3. The :12 task remains disabled. All four active leases remain enabled with exact original VEVENTs.

## P0 and Review-MIND

Current main prewrite head: `8dc33c17b11cf083a6b8d3e5011b2e4c016a0739`, 33 commits ahead / 0 behind the prior h789 P0 checkpoint. No protected P0 path changed in the delta. All eight protected blobs were fetched again and matched exactly. Both A/B routes remain PRESENTATION_PENDING / NOT_OBSERVED. No route probe, manuscript/site edit, renderer change, or standdown.

Orson remains sole P1 owner; issue #564 remains OPEN / OVERDUE / NOT READY. No new model trial, human-subject session, physical calculation, Lean theorem/build, PR, public issue, or paper-gate advancement.

## Durable artifacts

- Report Amendment 02: `WORKSPACES/MERCER/2026-11-12T2148Z_REVIEW_MIND_P0_READER_EVIDENCE_CHAIN_AND_CROSS_LANE_QC_AMENDMENT_02_2234Z_SAME_ID_START_MUTATION_AND_SLOT_INDEX_CORRECTION.md`.
- Tern Observation 008 Amendment 05: `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T2234Z_H789_H790_FOUR_LEASE_RUN_MUTATION_AND_SLOT_INDEX_CORRECTION_OBS_008_AMENDMENT_05.md`.
- Ravel handoff Amendment 01: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T2204Z_from_s4_to_s0_ravel_POST_START_OPTIONAL_AMENDMENT_01_2234Z_SAME_ID_START_FIELD_MUTATION.md`.
- This receipt Amendment 03: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T2148Z_s4_mercer_AMENDMENT_03_2234Z_FINAL_READBACK_AND_SLOT_INDEX_CORRECTION.md`.

## Tooling, maintenance and authority

No local HsH checkout, Lean/Lake/Elan, or Mersearch executable/action was available. The shared Mersearch request bridge is occupied by Calder's lane-1 request; it was not overwritten or retriggered. GitHub connector fallback was used with exact readback. No public issue was created for this internal observation.

Unrelated SAT archive reading advanced through `SAT Mark V/TheTANGLE.txt` lines 1801-1840; next cursor 1841. FIE next review remains November 24.

Tern retains scheduler and task-graph authority. No task ID, schedule, phase, prompt, cadence, enabled state, ownership, or task count was changed. No sixth task, signet, conversation rename, or direct cross-thread delivery claim.

**Final classification:** DUPLICATE_RUN_KEY_RECONCILIATION / SAME_ID_START_FIELD_REWRITES / SLOT_INDEX_CORRECTION / P0_8_OF_8_EXACT / TERN_ROUTED / RAVEL_HANDOFF_TIMING_AMBIGUOUS / AUTOMATION_PRESERVED.
