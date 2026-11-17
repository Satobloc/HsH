# Mercer h892:s2 — discovery-row revalidation and control-boundary audit

Nominal slot: 2026-11-17T04:24:00Z  
Run key: REVROT3-19-20261011:892:s2  
Selected: Mercer (ring index 16)  
Next: Ravel (ring index 17)

## Executive result

The 04:22:40Z automatic discovery snapshot was parsed directly from its exact Git blob. This closes the previous h891 limitation, where aggregate counts were available but the oversized JSON rows were not parsed.

Both protected Code Grurple R1 manuscripts remain in the full searchable discovery catalog. Both carry generic raw-workspace reader.html?mode=browse targets. Paper B additionally carries a 1,400-character cleaned excerpt of its raw Markdown source. Neither appears in the 48-item rolling docket. The separate generated/papers.json contains only the Cruller-Rubin entry.

This confirms a source/index-policy mismatch in the generated-data layer. It does not establish that either live reader route renders raw source or is publicly accessible. No authenticated deployment identity, owner preview, Sites editor, or live route observation was available. No route probe or repair was attempted.

## 1. Authority and scope

Nathan's direct 2026-10-01 assignment in Quantum Gravity and Experiments (conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701, message bb8ecf64-8863-4ee7-a078-ca8cc4104974, 2026-10-01T20:56:07.264Z) gives Mercer the specialist remit of equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences. The newest located Mercer export is Mercer Free Build (conversation 6acb78bc-1d9c-83e9-a778-f48f1cbf7c93), last user activity 2026-10-15T05:13:51.836Z; current access to that historical ChatGPT thread is unverified.

The live Code Grurple roster assigns Mercer Papers A+B presentation QA, with manuscript content closed. The user-supplied Lane 24 charter remains subject to the live Lane 24 interlock: Cycle 08/08 complete, BACKSEAT/HOLD, no Cycle 09 without a positive P0 trigger or standdown. This run therefore performed bounded P0 evidence revalidation, not new physical/CODATA work.

No historical worker participation, current original-thread access, or cross-thread delivery is claimed.

## 2. Exact discovery snapshot

- Snapshot update: 2026-11-17T04:22:40Z
- Discovery blob: 851abd7f454a87d1b3d84b4851fdc1182c54a462
- Snapshot size: 26,862,292 bytes
- Embedded HsH source commit: 3a188a0e0e4b07ba5f658ec126ae130233bebbc1
- Embedded SAT archive source commit: 4b616b6113ecd33d216600e4fa5fd1e783d48653
- Totals: 15,474 documents; 8,543 WORKSPACES records; 48 docket entries; 577 visuals; 6 excerpt errors.

HsH main at inspection was 362ca6152b4521abe1bd59ab326d3eb97b4d3493, created at 04:22:46Z. Its parent is the embedded HsH source commit and its only changed path is PUBLIC_SITE/generated/discovery.json. The snapshot was source-consistent at generation; main is one generated-snapshot commit ahead.

### Paper A

- Path: WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex
- Source blob: 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa
- Size: 23,889 bytes
- Index title/status: DRAFT R1 / Working record
- Reader target: reader.html?mode=browse&repo=hsh&path=WORKSPACES%2FPAPERS%2FCONVERGENT_GEOMETRIC_MOTIFS_2026-09-22%2FDRAFT_R1.tex&kind=file
- Excerpt: none
- In rolling docket: no

### Paper B

- Path: WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md
- Source blob: 0a1dca42cafd9a02faceff4ec0851659a317b2bb
- Size: 15,457 bytes
- Index title/status: SANDBOXED — REVIEWED R1 DRAFT / Working record
- Reader target: reader.html?mode=browse&repo=hsh&path=WORKSPACES%2FPAPERS%2FBOUNDARY_WEAK_EMISSION_2026-09-22%2FDRAFT_R1.md&kind=file
- Excerpt: present, first 1,400 cleaned characters; begins with sandboxed/unvalidated proposal status and abstract
- In rolling docket: no

PAPERS_FEED.json stages A as sandbox_staged_accepted_r1 without a site version or posted date, and B as sandbox_posted_reviewed_r1 with historical site version 34 and posted date 2026-09-23. These are feed metadata, not current rendering evidence. generated/papers.json contains one entry, Cruller-Rubin, and neither A nor B.

## 3. Protected source/control vector

All eight protected Code Grurple objects were fetched at the inspected main commit and matched their established pins:

| Object | Blob | Result |
|---|---|---|
| Paper A accepted R1 | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | exact |
| Paper B reviewed R1 | 0a1dca42cafd9a02faceff4ec0851659a317b2bb | exact |
| PUBLIC_SITE/PAPERS_FEED.json | e3552fdac0f187b066b59a9742563094efffe011 | exact |
| PUBLIC_SITE/PRESENTATION_GATE.md | 5f91020d0a71034ad6bed2de0a82ead1f1e48d98 | exact |
| PUBLIC_SITE/READER_ROUTING_REGISTRY.md | 277a94c553e2e17b61bb046a04781b4e44f2229f | exact |
| PUBLIC_SITE/PRESENTATION_CONTRACT.md | b871249564a45278383e41eebd8aaa5d8c64aa3c | exact |
| PUBLIC_SITE/generated/papers.json | 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7 | exact |
| Viewer/Whirligig Pages workflow | 6f3e843b6a327db76b21e8b0b61a26c210b600ac | exact |

Result: 8/8 exact.

The current discovery builder blob is 97ff9c6d00544251c05bd6bb6053907805438f3e; its test blob is 4d646dba614f50b912391c13cd516616700d2ac3. eligible() accepts .pdf, .md, .txt, .tex and .json, but does not exclude WORKSPACES/**. Every eligible record receives a generic browse-reader target. The test explicitly asserts that a representative WORKSPACES/MERCER Markdown file is eligible.

The Presentation Gate says raw source is secondary and presentation derivatives govern ordinary display. The Reader Routing Registry says WORKSPACES/** is default-denied absent an explicit presentation derivative, including manually constructed URLs. The generated discovery layer therefore continues to issue raw-source reader targets that conflict with the separate presentation-routing authority.

## 4. P0 disposition

- Source/index-policy mismatch: CONFIRMED.
- Current Paper A/B full-catalog membership: DIRECTLY VERIFIED.
- Current Paper A/B raw reader targets: DIRECTLY VERIFIED.
- Paper B raw excerpt: DIRECTLY VERIFIED.
- Current A/B membership in the 48-item docket: ABSENT.
- generated/papers.json membership: ABSENT.
- Live visitor-facing route behavior: UNKNOWN / NOT OBSERVED.
- P0 state: ACTIVE.

This is a new evidence point, not a new P0 trigger or standdown. No route probe, Sites deployment, renderer edit, presentation-policy edit, manuscript edit, or feed change was performed. The seven-point live route acceptance test remains for a site-capable worker with an authorized deployment/preview and authenticated browser context.

## 5. Mersearch lane status

The current Lane 1 pointer correction is verified against the actual bridge workflow. .github/workflows/mersearch-request-bridge.yml (blob 045b99e1cf218e474b92e0340bfeb62056986d99) watches exactly WORKSPACES/COMMON/MERSEARCH_REQUEST.json.

The root MERSEARCH_REQUEST.json is a legacy Ravel request without lane/status fields and is not watched by that workflow. WORKSPACES/COMMON/MERSEARCH_REQUEST_LANE_1.json is an unwired/orphan candidate; the workflow does not watch it. Sable h885:s2 comment #6930716468 correctly identifies the active path.

The four canonical request files remain requested:
1. Lane 1: calder-angle-geometry-source-fidelity-20261102-1337
2. Lane 2: archive-harvest-20261025-optics-01
3. Lane 3: calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001
4. Lane 4: kestrel-finite-core-geometry-source-fidelity-20261102-2200

No request-scoped output directory for any of these four IDs exists in the inspected tree. The bridge's current publication gate writes RUN_MANIFEST.json, SEARCH_RECEIPT.json and SEARCH_RECEIPT.md; raw SEARCH_RESULTS.json/.md remain withheld. No callable Mersearch search action was available in this runtime, so this is a source/workflow/request-state audit, not a Mersearch search or completion claim. No request was edited, released, overwritten, or retriggered.

## 6. Other workflow and research gates

- Task graph: 18 records against 16 declared branches; ACTIVE_SEED, last recorded update 2026-11-15. Tern retains graph/scheduler authority.
- WH-05 remains blocked by the four occupied Mersearch lanes.
- WH-02 remains the highest-priority unblocked maintenance item; Calder/authorized maintainer retains PR #1710.
- P1 Orson cognition: overdue / NOT READY; Orson ownership and frozen methods/archival scope preserved.
- P2 measured geometry: HOLD; no selected system or authorized raw dataset package.
- P3 full theory: INCOMPLETE.
- Lane 24: Cycle 08/08 complete, BACKSEAT/HOLD; no Cycle 09.
- No new Lean build, physical calculation, CODATA comparison, fit, prediction, independent measurement, paper-gate advancement, or BEDROCK promotion.

No new tool, fork, branch, PR, dependency, subscription, or expenditure was introduced.

## 7. Automation and continuity

The existing Workshop Relay :24 | Geometry task remains enabled with ID 6abda4c8eda88191bf23a6f2849e9a17, original DTSTART 2026-10-01T14:24 America/New_York, and unchanged hourly recurrence, prompt and phase. No task configuration was modified and no sixth task was created.

The exact-ID peek reported current run fab086d1-1abc-8323-b144-5c139170a807, scheduled for 04:24Z, started 04:23:14.835189Z, IN_PROGRESS, with null completion and null chat_ref. Its cached latest result belongs to the preceding Enheduanna h891:s2 run, not this Mercer run. IN_PROGRESS does not establish worker liveness or authenticated Mercer-thread participation.

Return cursor: preserve the exact 04:22:40Z snapshot and this A/B row-level readback; await an authorized site-capable route verification or an actual source/renderer/deployment trigger. Keep Lane 24 held until P0 standdown or an explicit new gate. No cross-thread delivery or successor acknowledgment is claimed.
