# Sable h836:s0 Receipt Amendment 02: Project Desk original-artifact recovery

**Amends:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-14T2000Z_s0_sable.md`  
**Run identity:** same-key continuation of `SABLE_H836_S0`, not a new rotation activation.  
**Disposition:** v0.1 snapshot recovered in Library; v0.2 static prototype verified; complete live tracker and worker identity remain unresolved.

## Published recovery report

- Publisher issue: https://github.com/Satobloc/HsH/issues/1752
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h836-s0-project-desk-recovery-20261114t2032z-001.md`
- Publisher comment: #6884018992
- Artifact commit: `bdad4b06cb27ac8fbfee5cd2713d26426204c2b3`
- Artifact blob: `d9d913d9769a14e186ada7d7201fb8df5343a8b5`
- SHA-256: `3f9481f55a3ac5a045b091f2fec90fbe1320526ad3add60c7c66bffea4f6671b`
- Exact publisher readback: PASS.

## Original v0.1 artifacts recovered

The two exact source files remain in the user's Library; no byte-modified public copy was made because the originals contain internal-reference destinations.

| Artifact | Bytes | SHA-256 |
|---|---:|---|
| `project_transparency_breadboard_2026-09-24.html` | 9,375 | `d75b2bc89e732f98b35a699c09c30e250577728a62d4f31481906baf83bead3c` |
| `project_transparency_snapshot_2026-09-24.json` | 11,671 | `1c1a70eb38e140312d3004f954b7767e62b12dc9f57155f6914e1673d66531c1` |

The embedded JSON and separate JSON are exactly equal. The v0.1 snapshot has 4 views, 22 project rows, 14 worker rows, 3 repository rows, 12 theory rows and 6 flows. The HTML header says generated 2026-09-24 21:45 ET; Library creation metadata is 2026-09-25T01:55:46.004896Z and 01:55:47.113Z. These times do not authenticate the 17:50 ET Sable-run note in the later HsHTRACKING excerpt.

The static matrix image mentioned by the earlier ledger was not located. Original worker identity, raw conversation ID and message UUIDs remain unresolved.

## v0.2 and adjacent POCs

The HsH `CONVERSATION_VIEWER/desk.html` survives at blob `dfb3b929edf26d346162abdb9cb82f268de5506f`. It is hard-coded, with 20 project rows, 11 worker rows, 3 repository rows and 5 flows. No fetch, XHR or GitHub API ingestion exists; localStorage is limited to scratch notes and the interface's control actions are manual. The Project Desk contract and intervention intake survive, but no automated feed is established.

The TOP/CENTRAL/BRANCH/HYDRA Switchboard and THREADING prototypes are separate sandboxed prototypes. No shared persistence or integration with Project Desk was found. No POC code was changed.

## Workflow and governance

- Existing PWH issue #1706 remains open. Recovery update comment: https://github.com/Satobloc/HsH/issues/1706#issuecomment-6884031483.
- PV-002 in the Project Portfolio Register was not reclassified. Tern retains register and task-graph authority.
- Current task graph remains 18 records versus `branch_count=16`; no Project Desk branch exists. No graph change.
- No new task, branch, PR, automation, schedule, phase, ID, owner or priority change.
- No physical calculation, CODATA scoring, or theory promotion.

**Proposed Tern review disposition:** `V0_1_SNAPSHOT_RECOVERED_IN_LIBRARY / V0_2_STATIC_PROTOTYPE_SURVIVES / COMPLETE_LIVE_TRACKER_NOT_RECOVERED / WORKER_IDENTITY_UNVERIFIED / MATRIX_IMAGE_NOT_FOUND`.

**Next cursor:** authenticate the original worker conversation; search for the missing image and any dynamic backend/data connector; keep v0.1, v0.2 and Switchboard/THREADING distinct until an explicit integration contract exists.
