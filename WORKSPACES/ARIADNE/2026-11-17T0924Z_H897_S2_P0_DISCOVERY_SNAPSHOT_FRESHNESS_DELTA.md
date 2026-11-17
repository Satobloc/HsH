# Ariadne h897:s2 | Discovery snapshot freshness delta and P0 source-layer revalidation

**Nominal slot:** 2026-11-17T09:24:00Z  
**Run key:** `REVROT3-19-20261011:897:s2`  
**Selected ring label:** Ariadne (index 3)  
**Next ring label:** Alberr (index 4)  
**Disposition:** `NEW_DISCOVERY_SNAPSHOT_VERIFIED / PAPER_A_B_RAW_TARGETS_PERSIST / SOURCE_INDEX_POLICY_MISMATCH / LIVE_ROUTE_NOT_OBSERVED / P0_ACTIVE / LANE24_HOLD`

## Executive result

The automatic public-discovery snapshot refreshed at 2026-11-17T09:24:11Z. I fetched and parsed its actual Git blob, compared it with the prior 04:22:40Z snapshot, and rechecked the exact Paper A/B records and all eight protected Code Grurple source/control blobs.

The snapshot is source-consistent at generation. It contains 15,520 documents, including both protected R1 manuscripts in the full searchable catalog. Both still carry generic raw-workspace `reader.html?mode=browse` targets. Paper B still carries a 1,400-character cleaned excerpt; Paper A has no excerpt. Neither is in the 48-item docket or the separate generated papers series.

This is a new data point confirming the existing **source/index-policy mismatch**. It is not a new positive P0 trigger, a standdown, or evidence of a visitor-facing raw-source incident. No live route was probed.

## 1. Snapshot identity and comparison

Current HsH `main` at inspection:

`8374dbbf1afe98ed4c52d558e1214be5998d73d9`

The commit's sole changed path is `PUBLIC_SITE/generated/discovery.json`; its parent is the exact HsH source commit embedded in the snapshot:

`e84191132f1fb76a2ffc2725b9dfa8797aa034d7`

Current discovery blob:

`87689085a4bb86047b2c668ab5de28e9d58b5621`

- Snapshot update: `2026-11-17T09:24:11+00:00`
- HsH source: `e84191132f1fb76a2ffc2725b9dfa8797aa034d7` (`complete`)
- SAT archive source: `4b616b6113ecd33d216600e4fa5fd1e783d48653` (`complete`)

The preceding directly parsed snapshot was blob `851abd7f454a87d1b3d84b4851fdc1182c54a462`, updated `2026-11-17T04:22:40+00:00`, with HsH source `3a188a0e0e4b07ba5f658ec126ae130233bebbc1` and the same SAT archive source.

| Measure | 04:22 snapshot | 09:24 snapshot |
|---|---:|---:|
| Documents | 15,474 | 15,520 |
| `WORKSPACES/` records | 8,543 | 8,589 |
| `WORKSPACES/PAPERS/` records | 60 | 60 |
| Rolling docket | 48 | 48 |
| Visuals | 577 | 577 |
| Excerpt errors | 6 | 6 |

Record-level comparison: **46 added, 0 removed, 38 changed**. The additions include the h893 Ariadne report and the h894–h896 reports/receipts published before this snapshot. The current h897 report and receipt are later than the snapshot and therefore are not included in it.

## 2. Exact Paper A/B discovery records

Both rows were parsed from the 09:24 snapshot's full `documents` array.

| Field | Paper A | Paper B |
|---|---|---|
| Source path | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Source blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Index title | `DRAFT R1` | `SANDBOXED — REVIEWED R1 DRAFT` |
| Index status | `Working record` | `Working record` |
| Generic reader target | Raw workspace path via `reader.html?mode=browse` | Raw workspace path via `reader.html?mode=browse` |
| Excerpt | None | 1,400 cleaned characters |
| In 48-item docket | No | No |

The Paper A/B row values, source blobs, targets, and excerpt states are unchanged from the 04:22 snapshot. `PUBLIC_SITE/generated/papers.json` still contains only the Cruller-Rubin entry; that series index is not the full discovery/search catalog.

## 3. Protected source/control vector and source logic

All eight pinned Code Grurple source/control objects were independently fetched at the current branch and matched their established blobs:

| Object | Result |
|---|---|
| Paper A accepted R1 | Exact |
| Paper B reviewed R1 | Exact |
| `PUBLIC_SITE/PAPERS_FEED.json` | Exact |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | Exact |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | Exact |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | Exact |
| `PUBLIC_SITE/generated/papers.json` | Exact |
| Viewer/Whirligig Pages workflow | Exact |

Result: **8/8 exact**.

The current discovery builder is `tools/site_discovery.py`, blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its `eligible()` function accepts `.pdf`, `.md`, `.txt`, `.tex`, and `.json`, excluding named prior-art/quarantine patterns and generated/control prefixes, but does not exclude `WORKSPACES/PAPERS/**`. Its `route()` function assigns a generic `reader.html?mode=browse` target to every eligible file. The current test file, blob `4d646dba614f50b912391c13cd516616700d2ac3`, explicitly asserts that `WORKSPACES/MERCER/2026-10-11_note.md` is eligible.

The unchanged Reader Routing Registry says `WORKSPACES/**` is not ordinary reader content without an explicit presentation derivative; the Presentation Gate requires a presentation derivative and forbids raw source as the default reading experience. Thus the builder/test eligibility and presentation-routing policy remain inconsistent.

The separate public reader may reject these targets downstream. That behavior remains **UNKNOWN / NOT OBSERVED**.

## 4. P0 disposition

The existing [Code Grurple issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains open. Its last recorded update preceded this snapshot. This report adds the 09:24 snapshot evidence without changing any protected source/control object.

- Source/index-policy mismatch: **confirmed**.
- Exact current Paper A/B discovery rows: **confirmed**.
- Live visitor-facing route: **not observed**.
- Deployment/build identity, owner preview, authenticated browser context: **not available**.
- Positive P0 route trigger or standdown: **not established**.

No live route probe, site edit, presentation-policy edit, manuscript edit, feed edit, PDF build, deployment action, or standdown was performed.

## 5. Lane 24, research tools, and evidence boundaries

The live Lane 24 capsule remains `CYCLE 08/08 COMPLETE / BACKSEAT / HOLD` until a positive P0 trigger or Code Grurple standdown. No Cycle 09 was started.

No physical calculation, CODATA numerical comparison, measured-system selection, fit, prediction, covariance propagation, independent measurement, new Lean theorem/build, SAT-O or Blockwave equation correction, or BEDROCK promotion was performed.

The earlier ⁴He optical-tracer and ³He-B NMR candidates remain unselected. Their prior readiness audit is not a P2 admission or a physical result.

Mersearch has no callable action in this runtime. The four canonical request files remain `requested`/occupied; the four request-scoped `RUN_MANIFEST.json` paths checked for their current request IDs were not found. No request was overwritten, retriggered, released, or treated as a completed search. GitHub source inspection is not represented as Mersearch.

Existing routes were checked rather than replaced:
- Math Hopper issue #578 remains open; PR #991 remains open/draft/non-mergeable. The three-repository extraction/smoke gate is not verified; extraction is not proof.
- Existing Lean PRs #262, #873, and #1133 remain open; no new build was run.
- Whirligig Kernel 0 remains a restricted sandbox, not a general physical solver.
- SciSpace is available as an existing connected tool; no new tool, fork, dependency, subscription, or expense was introduced.

The SAT archive README was read for its historical-source role. HSH_RESOURCES was limited to its root README and repository metadata; no private research payload or private path was opened or copied into this report.

## 6. Ariadne source authority and continuity

The historical Library export `ARIADNE — raw.json` was inspected directly and hashed: 6,226,127 bytes; SHA-256 `2996046ea29672f69fbf48670c0b27049701039741229c158d4e89f5453b22a8`. It contains 1,363 message objects (10 user-role, 555 assistant, 798 tool); the user-role records have no `author.name` field.

Direct user-role instructions dated 2026-09-23 authorize deep archive examination and reproduction subject to active workflow/onboarding rules, permit constructive suggestions to other workers, and explicitly reserve scheduled-task control to Comptroller Tern. A separate direct instruction says workers may request execution time, while Tern decides allocation. The Python-offloading work is a study/request opportunity, not authority to create or change a recurrence.

No standalone signed specialist charter or authenticated current Ariadne thread was found. This is a source-grounded Ariadne revival, not historical-thread participation.

The next ring label is Alberr, whose current workspace remains `MANUAL REENTRY PENDING / NO ASSIGNMENT / TOTAL AUTONOMY`. No task, inbox packet, deadline, or response obligation was created.

## 7. Campaign and freshness

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY; Orson retains protected ownership |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |
| Lane 24 Cycle 08/08 | Complete; BACKSEAT/HOLD |
| FIE rereview | Last completed 2026-11-10; next due 2026-11-24 |

The November 9 minor gate remains overdue; November 30 major and December 14 full-theory gates remain separate. No gate advanced.

Unrelated reading break: `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 1961–2000, covering a short passage on signed languages. Next cursor: **2001**. This is not theory evidence or a physical analogy.

**Return pin:** `H897:S2 / ARIADNE / DISCOVERY_2026-11-17T0924Z / A_B_ROWS_EXACT / PROTECTED_VECTOR_8_OF_8 / SOURCE_INDEX_POLICY_MISMATCH / LIVE_ROUTE_NOT_OBSERVED / P0_ACTIVE / LANE24_CYCLE08_HOLD / NO_PHYSICAL_RESULT / NO_NEW_LEAN / NO_THEORY_PROMOTION / MERSEARCH_FOUR_LANES_OCCUPIED / ALBERR_NO_ASSIGNMENT / READING_2001`.
