# Calder h833:s3: automatic discovery index versus presentation-route gate

**Nominal slot:** 2026-11-14T17:36:00Z  
**Run key:** `REVROT3-19-20261011:833:s3`  
**Selected ring label:** Calder (index 7)  
**Next ring label:** Hale (index 8)  
**Disposition:** `DISCOVERY_INDEX_RECORDS_CONFIRMED / ROUTE_POLICY_MISMATCH_AT_SOURCE_LAYER / LIVE_ROUTE_UNVERIFIED / P0_ACTIVE`

## Executive result

The existing Paper A/B non-leakage check is correct for `PUBLIC_SITE/generated/papers.json` and the 48-item automatic home/public-notebook docket, but it is not a complete check of the public discovery search surface.

The current automatic discovery snapshot contains both pending Code Grurple R1 sources in its full searchable `documents` catalog. Each record carries a `reader.html?mode=browse` target to the raw `WORKSPACES/PAPERS/...` source. Paper B additionally carries a cleaned 1,400-character excerpt from the raw Markdown source. Neither paper is in the 48-item docket.

This is a **source-level discovery/reader-policy mismatch**, not a confirmed live raw-display incident. The separate reader application may enforce a downstream default-deny check, but that route behavior was not observable here. No live route probe, site edit, manuscript edit, PDF build, or standdown was performed.

## 1. Role and authority

The historical Calder source is the direct-user Calder check-in dated 2026-09-12 in `WORKSPACES/COMMON/CHECKINS.md`. It supports adversarial empirical testing, angle-clustering null design, independent-unit discipline, statistical calibration/covariance, and source/provenance separation. No standalone signed Nathan-authored Calder specialist charter was recovered. The BOOT file is an assistant-maintained operational summary, not a substitute for that direct source.

This run used the Calder null-design specialty on a public-site evidence problem: distinguish index membership, front-page docket membership, default reader routing, and actual live route resolution as separate outcomes.

No authenticated current Calder conversation or historical-instance participation is claimed.

## 2. Live branch and protected P0 source state

HsH `main` before this run's writes: `3e9bdd8d5b6111457d72d6bd8190052566771d56`.

Comparison from the prior Aster h832:s3 final head `4daac2991389dd7107bb9a4ebf16da354b2eece1` to this main head: 28 commits ahead, 0 behind, 12 changed paths. The only `PUBLIC_SITE/` path in the comparison was `PUBLIC_SITE/generated/discovery.json`; the other changes were Conversation Viewer data and worker/receipt state.

All eight protected Code Grurple source/control objects were independently fetched and matched their established blobs:

| Object | Current blob |
|---|---|
| Paper A accepted R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Viewer/Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

Result: **8/8 exact**. This does not establish that the discovery index obeys the reader registry.

## 3. Exact discovery snapshot

Fetched the actual Git blob for `PUBLIC_SITE/generated/discovery.json`:

- Blob: `3fe51e1fd07d2cfbea3788cce8d05ee6fe874417`
- Size: 25,365,370 bytes
- `updated`: `2026-11-14T17:37:24+00:00`
- HsH source commit recorded in the snapshot: `57d8f6f457dd8e9c5ae1d4e0e6975cbeb2cc1f72`, repository status `complete`
- SAT archive source commit: `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`, repository status `complete`
- Documents: 14,769
- Rolling docket: 48
- Excerpt errors: 6
- `WORKSPACES/PAPERS/**` records: 60
- `WORKSPACES/PAPERS/**` records in the 48-item docket: 0

The two Code Grurple sources are present in the full `documents` catalog:

| Field | Paper A | Paper B |
|---|---|---|
| Source path | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Source blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Index kind / size | `tex` / 23,889 bytes | `md` / 15,457 bytes |
| Index title | `DRAFT R1` | `SANDBOXED — REVIEWED R1 DRAFT` |
| Index status | `Working record` | `Working record` |
| Default reader target | Raw workspace path via `reader.html?mode=browse` | Raw workspace path via `reader.html?mode=browse` |
| Raw excerpt | None (`tex` is not excerpted by this script) | Present: first 1,400 cleaned characters, including status, title and abstract |
| In 48-item docket | No | No |

The separate `PUBLIC_SITE/generated/papers.json` still contains only the Cruller-Rubin entry, not A or B. That remains a valid result for the PDF-series index, but it cannot be generalized to the separate discovery/search catalog.

The feed continues to classify A as `sandbox_staged_accepted_r1` with no `site_version` and `posted_date: null`; B remains `sandbox_posted_reviewed_r1` with historical `site_version: 34` and `posted_date: 2026-09-23`. Those are feed metadata, not current deployment or live-route evidence.

## 4. Source logic and policy mismatch

Current `tools/site_discovery.py` blob: `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its relevant behavior is explicit:

1. `eligible(path)` accepts `.pdf`, `.md`, `.txt`, `.tex`, and `.json`; it excludes paths matching `prior_art`, `quarantine`, or `science made stupid`, plus generated/index/tool/hidden paths. It does **not** exclude `WORKSPACES/PAPERS/**`.
2. Every eligible document receives a `reader.html?mode=browse&repo=...&path=...&kind=file` target.
3. Markdown/text files at or below 128,000 bytes are eligible for a cleaned 1,400-character excerpt.
4. The full `documents` inventory remains searchable; only the rolling 48-item docket is bounded.

Current test file `tests/test_site_discovery.py` blob `4d646dba614f50b912391c13cd516616700d2ac3` explicitly asserts that `WORKSPACES/MERCER/2026-10-11_note.md` is eligible. A bounded Python source-logic replay confirmed that both Paper A and Paper B paths satisfy the current `eligible()` rule and that Paper B satisfies the excerpt size/type condition. This was not a full script integration test or live site test.

`PUBLIC_SITE/AUTOMATIC_DISCOVERY.md` blob `36b2669c328466f0f579e188fbec5796d6ca44dc` says the complete catalog is searchable by title, path, format and bounded excerpts; the site consumes `discovery.json` without a Sites redeployment and open pages refresh every five minutes.

The unchanged `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` says `WORKSPACES/**` is not ordinary reader content absent an explicit presentation derivative, raw source is secondary, and a manually constructed URL must not bypass the rule. The Presentation Gate and Contract likewise prohibit raw Markdown/TeX as default visitor reading.

The data-layer conflict is therefore concrete: discovery records for pending workspace manuscripts contain raw-source reader targets, and Paper B contains a raw-source excerpt. Whether the live reader application rejects those targets downstream remains **UNKNOWN**.

## 5. Revised acceptance design

Add a `DiscoverySurfaceWitness` to the P0 evidence package. It should bind:

- source path and source blob;
- discovery snapshot blob and the exact source commit scanned;
- discovery record ID and docket membership;
- excerpt presence, scope and digest;
- reader target and target classification;
- applicable presentation-registry/policy blob;
- live route result, deployment/build identity, browser context and readback time;
- positive and negative control outcomes.

Keep three eligibility decisions separate:

1. **Discovery metadata eligibility:** may the title/path/status appear in the public search catalog?
2. **Excerpt eligibility:** may any source-derived text be exposed in search snippets?
3. **Reader-route eligibility:** may the record carry a default visitor-facing reader URL?

For a `PRESENTATION_PENDING` workspace manuscript, metadata-only discovery may be acceptable if deliberately authorized, but a raw excerpt and a default raw-source reader target are not. The record should instead carry a visible pending state and no raw default target. A downstream reader guard may provide the same protection only if independently tested.

### Regression matrix

| Test object | Discovery metadata | Raw excerpt | Default reader target | Required result |
|---|---|---|---|---|
| Paper A pending R1 | Optional, explicit pending state | No | No raw target | Pending |
| Paper B pending R1 | Optional, explicit pending state | No | No raw target | Pending |
| Cruller-Rubin approved sandbox PDF | Yes | Presentation-derived only | Verified PDF derivative | Positive control |
| Existing `PRIOR_ART`/`QUARANTINE` negative control | No ordinary discovery record | No | No | Excluded |

**Falsification threshold:** any pending A/B record returned by public search with a raw-source excerpt or default raw reader target fails the source-layer discovery gate. A live-route PASS additionally requires a separate browser readback showing `PRESENTATION_PENDING` or omission, with no raw-source rendering.

The repository JSON, its search UI and a route fed by that JSON share one publication lineage; they are not three independent confirmations. A separately identified live browser readback is required for route behavior.

## 6. Disposition and boundaries

- P0 Code Grurple remains **ACTIVE**; Paper A and B remain `PRESENTATION_PENDING / NOT_OBSERVED`, neither accepted nor failed at the live route.
- The prior 8/8 protected-source result remains exact. The new finding narrows the earlier non-leakage claim to `generated/papers.json` and the 48-item docket; it does not establish a live raw-display incident.
- No live route probe was performed: no authenticated originating browser context, Sites editor/deployer, owner preview or deployment identity was available. No site code, presentation policy, manuscript, feed or PDF was changed.
- P1 cognition remains OVERDUE / NOT READY and Orson-owned; P2 measured geometry remains HOLD with no selected system; P3 remains INCOMPLETE. FIE last full rereview was 2026-11-10; next due 2026-11-24.
- Mersearch was not available as a callable tool; GitHub source inspection was not represented as Mersearch. Existing four request lanes were not overwritten or retriggered.
- No physical calculation, fit, H(s)H prediction, independent measurement, P2 selection, new Lean theorem/build, SAT-O/Blockwave equation modification, or BEDROCK promotion.
- The WH-02 PR #1710 remains OPEN/DRAFT/UNMERGED and maintainer-owned; no branch/rebase/code action was taken.
- The task graph remains 16 declared branches / 18 records; Tern retains graph and scheduler authority.

## 7. Successor and automation

The next deterministic ring label is Hale (h833:s4). Any repository packet is optional context only; it does not create a task, deadline, review request, response obligation or ownership transfer. No direct cross-thread delivery or acknowledgment is claimed.

The existing :36 automation remains enabled with its original ID, hourly America/New_York :36 DTSTART/RRULE, prompt and phase unchanged. The current run ID `4f2dadb5-ba3c-8332-93f0-5b5f64c03902` was last read as `IN_PROGRESS`, scheduled 17:36Z, started 17:40:42.045822Z, with null completion and null `chat_ref`. No sixth task or scheduler mutation.

**Return pin:** `H833:S3 / CALDER / HALE-NEXT / DISCOVERY-INDEX-ROUTE-POLICY-MISMATCH-AT-SOURCE-LAYER / A-AND-B-IN-FULL-SEARCH-CATALOG / B-RAW-1400-CHAR-EXCERPT / RAW-READER-TARGETS-GENERATED / NOT-IN-48-ITEM-DOCKET / PAPERS-JSON-EXCLUDES-A-B / LIVE-ROUTE-UNKNOWN / P0-ACTIVE / NO-SITE-OR-MANUSCRIPT-EDIT / NO-LEAN / NO-PHYSICAL-TEST / P1-ORSON-OVERDUE / P2-HOLD / P3-INCOMPLETE / FIE-NOV24 / FOUR-MERSEARCH-LANES-UNCHANGED / WH02-UNCHANGED / TASK-GRAPH-TERN-OWNED / AUTOMATION-UNCHANGED / NO-SIXTH-TASK`.
