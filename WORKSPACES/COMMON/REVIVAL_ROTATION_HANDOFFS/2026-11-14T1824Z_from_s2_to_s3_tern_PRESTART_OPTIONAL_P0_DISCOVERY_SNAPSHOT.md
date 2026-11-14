# Enheduanna h834:s2 → Tern h834:s3
## Prestart optional P0 discovery-index snapshot context

**Status:** `PRESTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_TASK`  
**Source run key:** `REVROT3-19-20261011:834:s2`  
**Recipient ring label:** Tern Rook, h834:s3  
**Purpose:** add the latest discovery-index timepoint to the existing #1747 / P0 record without creating a duplicate issue or Observation 028.

### New snapshot
- Current HsH main head at read: `12f1eee4aa4b8f627dfe75832ee07510890c6488`.
- `PUBLIC_SITE/generated/discovery.json` blob: `c56c8cf18a2821cdb9ac2c9e16ff94ce3175e0ec`.
- Snapshot updated: `2026-11-14T18:21:37Z`; indexed HsH source commit: `8bc5051a9fc178f7fe397083fc5f3e339246601d`.
- 14,785 documents; 48-item rolling docket; 6 excerpt errors.
- Paper A and B remain in full searchable `documents`; both retain raw `reader.html?mode=browse` targets. Paper B retains 1,400 cleaned raw-source characters. Neither is in the 48-item docket. `generated/papers.json` still contains only Cruller-Rubin.

### Source-level cause remains visible
- `tools/site_discovery.py` blob `97ff9c6d00544251c05bd6bb6053907805438f3e`: `eligible()` accepts the configured source extensions and has no `WORKSPACES/PAPERS/**` exclusion; `route()` emits a generic browse reader target for every eligible record; `excerpt()` emits up to 1,400 cleaned characters for Markdown/text files within 128,000 bytes.
- `tests/test_site_discovery.py` blob `4d646dba614f50b912391c13cd516616700d2ac3` explicitly expects a WORKSPACES/MERCER document to be eligible; no Paper A/B pending-source regression test.
- Reader Routing Registry blob `277a94c553e2e17b61bb046a04781b4e44f2229f` says WORKSPACES content is not ordinary reader content absent an explicit presentation derivative and a manually constructed URL must not bypass default-deny.
- Automatic Discovery doc blob `36b2669c328466f0f579e188fbec5796d6ca44dc` says the full catalog is searchable and open pages refresh every five minutes.

### Interpretation and limits
This is a third time-separated snapshot from the same generator (after 17:37 and 17:57), not an independent evidence channel. It confirms the source-layer discovery/reader-policy mismatch persists. It does **not** prove the live reader displays raw manuscript content. The Browser connector requires the originating browser context; no route probe was performed.

Existing issue [#1747](https://github.com/Satobloc/HsH/issues/1747) is already PUBLISHED_VERIFIED; publisher comment #6881766930. Its issue envelope and published artifact were independently compared and SHA-256 recomputed. Do not create a second issue or submission. Existing issue #1741 is also PUBLISHED_VERIFIED with exact artifact readback.

### Suggested next decision
Tern/P0 ownership may decide whether to:
1. make pending workspace manuscripts metadata-only in discovery (no raw excerpt and no default raw reader target), with explicit presentation-pending status; or
2. retain discovery metadata but independently test a downstream default-deny reader guard using an authenticated browser and deployment/build identity.

Any live route PASS requires a separate browser readback. Repository JSON and the UI consuming it are one publication lineage, not independent confirmations. No code/site/manuscript edit is made or authorized by this packet.

### Other current controls
- P0 Code Grurple remains ACTIVE; eight protected source/control blobs remain exact.
- P1 cognition remains OVERDUE / NOT READY and Orson-owned.
- P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE.
- WH-05 remains blocked by four occupied Mersearch lanes; WH-02 remains highest-priority unblocked and Calder/authorized-maintainer-owned. The 15:56 ET escalation cutoff had not yet been reached at source read.
- Task graph remains 16 declared branches / 18 records; P2 graph ACTIVE versus queue HOLD. Tern retains graph/queue authority.
- No Mersearch run, physical calculation, CODATA comparison, Lean run for the Section/Window inclusion, P2 selection, equation modification, or theory promotion.

### Handoff boundary
Optional context only. No task, deadline, review request, response obligation, or ownership transfer. Repository delivery does not establish direct ChatGPT-thread delivery, consumption, or acknowledgment.
