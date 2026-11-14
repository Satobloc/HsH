# Sable h836:s0 | Project Desk original-artifact recovery

**Date:** 2026-11-14T20:32Z  
**Disposition:** A strong v0.1 Project Transparency Breadboard candidate is recovered in the user's Library. The later v0.2 Project Desk remains in HsH as a static control prototype. The complete live tracker, original worker/thread identity, and one reported matrix image remain unverified.

This is a same-key continuation of the existing `SABLE_H836_S0` receipt. The earlier Lane 00 geometry report is not repeated. This report records a distinct Primary Workflow Health operation against WH-07 / issue #1706.

## 1. Authority and scope

Sable's historical direct source establishes a systems and continuity remit covering workflow coherence, automation yield, capability/resource testing, scripting, worker-state visibility, and infrastructure QA. No standalone signed specialist charter was recovered; the Systems Clearance document is an assistant-maintained synthesis.

The current PWH queue places WH-02 ahead of WH-07, but WH-02's next action is Calder/authorized-maintainer rebase and CI work. This run did not take over that owner-bound task. WH-07 was the highest relevant bounded recovery action within Sable's remit.

The deterministic ring label does not authenticate a historical Sable instance or conversation. No cross-thread delivery or acknowledgment is claimed.

## 2. Original v0.1 artifact recovered

Two exact source files were recovered from the user's Library:

| Artifact | Size | SHA-256 |
|---|---:|---|
| `project_transparency_breadboard_2026-09-24.html` | 9,375 bytes | `d75b2bc89e732f98b35a699c09c30e250577728a62d4f31481906baf83bead3c` |
| `project_transparency_snapshot_2026-09-24.json` | 11,671 bytes | `1c1a70eb38e140312d3004f954b7767e62b12dc9f57155f6914e1673d66531c1` |

Library creation metadata is 2026-09-25T01:55:46.004896Z for the HTML and 2026-09-25T01:55:47.113Z for the JSON. The HTML header itself says `generated: 2026-09-24 21:45 ET`.

The JSON embedded inside the HTML is exactly equal to the separate JSON file. This is not merely a filename match.

The recovered snapshot contains:
- 4 views;
- 22 project-lane rows;
- 14 worker rows;
- 3 repository rows;
- 12 theory-maturity rows;
- 6 dependency/edge flows.

Its own coverage note is appropriately limited: it reports reading the live scheduler, recent commits across the three repositories, current GRURPLE control, the Roderick handoff, and known branch controls. It explicitly does not claim a full sequential archive reread, fresh inspection of every worker inbox, or live Sites editor/publisher access. Unknown cells are not treated as absences.

The static matrix image mentioned in the earlier ledger was not located by filename or content search. The HTML and JSON are recovered; the image is not.

The exact originals remain in the user's Library. They were not copied into the public HsH repository because the original files contain internal-reference destinations. This report is a public-safe provenance record, not a byte-for-byte republication.

## 3. The later v0.2 is not a live data feed

The current `CONVERSATION_VIEWER/desk.html` survives in HsH at blob `dfb3b929edf26d346162abdb9cb82f268de5506f`.

It is a later static-site control prototype with hard-coded JavaScript arrays:
- 20 project rows;
- 11 worker rows;
- 3 repository rows;
- 5 dependency flows.

The v0.2 view no longer includes the v0.1 project rows `Metric induction / 3+3` and `He-3 holotype scaling`. Its worker view no longer includes `Mira`, `Orson`, or `Marlowe`. Its theory view omits `Metric induction`, `3+3 shells`, `Braid/category translation`, and `He-3 holotype`. Its flow list omits the v0.1 `Old plans` flow.

Code inspection found no `fetch`, `XMLHttpRequest`, or GitHub API data ingestion. `localStorage` is used for local scratch notes. The interface can copy a control packet, open the intervention board, and open a new GitHub issue. These are manual actions, not a live state synchronization path.

`PROJECT_DESK_CONTROL_CONTRACT.md` and `PROJECT_DESK_INTERVENTIONS.md` also survive. The contract describes intended control behavior; the intervention file is a manual intake surface. Neither establishes an automated feed from the desk into live project state.

## 4. Related prototypes are separate

A separate sandboxed TOP/CENTRAL/BRANCH/HYDRA Switchboard POC and a THREADING companion survive in the reference/tooling repository. Their own documentation says they are prototypes, not production authority. The Switchboard demo is a standard-library planner/state transformer, not a scheduler. The Threading demo uses in-memory sample receipts and does not schedule real workers.

No implementation map, shared persistence layer, or live integration establishes that these POCs are the backend for Project Desk. They should not be merged conceptually merely because both concern workflow control.

A code-level defect remains documented in the Switchboard POC: the actor registry omits Elias Kern even though the operator instructions name Elias as a prototype operator. A direct Elias wake through that registry would fail unless the registry is corrected. No POC code was changed in this run.

## 5. Worker and source attribution

The historical `HsHTRACKING.txt` excerpt says Nathan was waiting for a 17:50 ET Sable run. The recovered HTML header says 21:45 ET, and Library creation metadata is about ten minutes later. Those timestamps do not authenticate the same run. The GitHub commits that later added the v0.2 desk and contract are authored by the repository account, not a worker identity.

The v0.1 artifact is therefore a strong candidate for the remembered tracker, but the original worker, ChatGPT conversation ID, message UUIDs, and source-to-artifact lineage remain unverified. The file's existence and contents are verified; authorship is not.

## 6. Current portfolio and task-graph boundary

The live Project Portfolio Register still records PV-002 as `FOUND_BUT_STATIC_PROTOTYPE / ORIGINAL_WORKER_TRACKER_NOT_RECOVERED`, last scanned at h815. This run supplies new evidence but does not unilaterally reclassify that shared register entry. Tern retains portfolio/task-graph authority.

The current task graph is blob `4ee79fa0a30fedb1feffd0a92c2716f87a365670`, updated 2026-11-13T20:53:40Z. It contains 18 branch records against `branch_count=16`; no Project Desk branch is present. The discrepancy and graph remain unchanged.

WH-07 / issue #1706 remains open. No duplicate issue, new task, new automation, task-graph node, branch, PR, or replacement tracker was created.

## 7. Recommended disposition and next cursor

Proposed evidence-based wording for Tern's review, not a unilateral register change:

`V0_1_SNAPSHOT_RECOVERED_IN_LIBRARY / V0_2_STATIC_PROTOTYPE_SURVIVES / COMPLETE_LIVE_TRACKER_NOT_RECOVERED / WORKER_IDENTITY_UNVERIFIED / MATRIX_IMAGE_NOT_FOUND`.

Next:
1. Tern reviews whether PV-002 should be updated to distinguish the recovered v0.1 snapshot from the still-missing live tracker.
2. Recover the original worker conversation/export and authenticate the artifact's author rather than infer from timing.
3. Search for the missing matrix image and any separate dynamic backend/data connector.
4. Keep v0.1, v0.2, and Switchboard/THREADING as distinct artifacts until source lineage and interface contracts establish a real composition.
5. Do not build or promote a replacement live tracker until the recovered behavior is reviewed and the intended data sources, write permissions, persistence, ownership, and failure semantics are explicit.

No task, schedule, phase, ID, cadence, priority, owner, or task-graph state was changed. No physical calculation, CODATA scoring, or theory promotion was performed.
