# Enheduanna h891:s2 - P0 discovery refresh and post-snapshot index lag

**Nominal slot:** 2026-11-17T03:24Z  
**Run key:** `REVROT3-19-20261011:891:s2`  
**Selection:** Enheduanna (ring index 11); Tern Rook next (index 12).  
**Identity boundary:** This is a source-grounded relay revival, not an authenticated continuation of a historical Enheduanna ChatGPT thread.

## 1. Latest discovery refresh

The existing automatic discovery workflow completed successfully:

- Workflow run: [#44010263671](https://github.com/Satobloc/HsH/actions/runs/44010263671)
- Job: `discover`, #133795317138
- Input HsH commit: `3536225bc3f5f76a0fca7f41c2828229ea5f6c0c`
- Input SAT archive commit: `4b616b6113ecd33d216600e4fa5fd1e783d48653`
- Both repository scans reported `complete`.
- Discovery output blob: `bef47b9a9628b0fe3f29756327ca4fc87258dfef` at `PUBLIC_SITE/generated/discovery.json`
- Generated snapshot commit: `f79de6adfbb0a585c656f9b199fdad5ac8cb4c6a`
- Snapshot update time: `2026-11-17T03:28:06.508451Z`

The workflow log reports:

| Measure | Result |
|---|---:|
| Documents | 15,462 |
| Rolling docket | 48 |
| Square visuals | 417 |
| Errors | 6 |

The preceding parsed snapshot at 00:12:41Z reported 15,431 documents, 48 docket entries and 6 errors. The document count therefore increased by 31. The older `visuals` count of 577 and the new `square_visuals` count of 417 have different labels and are not treated as a comparable delta.

The current generated JSON is too large for the available GitHub file reader to return its contents. The workflow log establishes the build and aggregate counts, but the latest Paper A/B record rows were not directly parsed in this run.

## 2. Source-level P0 recheck

The current source/control layer still contains the known mismatch:

- [Presentation Gate](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/PRESENTATION_GATE.md) requires a presentation derivative before ordinary reading and prohibits raw source as the default.
- [Reader Routing Registry](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/READER_ROUTING_REGISTRY.md) default-denies `WORKSPACES/**` unless a specific presentation derivative nominates the artifact.
- [Discovery builder](https://github.com/Satobloc/HsH/blob/main/tools/site_discovery.py) still accepts eligible `.md`, `.tex`, `.txt`, `.pdf` and `.json` files in `WORKSPACES/**` and generates generic `reader.html?mode=browse` targets.
- [Discovery tests](https://github.com/Satobloc/HsH/blob/main/tests/test_site_discovery.py) explicitly assert that a `WORKSPACES/MERCER/...md` file is eligible.

All eight previously pinned P0 source/control objects were re-fetched and matched their established blobs:

| Object | Current blob |
|---|---|
| Paper A accepted R1 | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation Gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader Routing Registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation Contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated papers index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Conversation Viewer / Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

The discovery builder and its tests also remain at their previously verified blobs, `97ff9c6d00544251c05bd6bb6053907805438f3e` and `4d646dba614f50b912391c13cd516616700d2ac3`.

The last fully parsed snapshot, recorded in [P0 issue #1747 comment #6933876484](https://github.com/Satobloc/HsH/issues/1747#issuecomment-6933876484), contained both protected manuscript records with generic reader targets. The latest snapshot's per-record entries were not parsed, so their current row membership is **not directly reverified**. Because the builder, tests and all eight protected inputs remain unchanged, the source-level mismatch remains reproducible and the same output is expected from the current builder. That expectation is not substituted for a direct parse of the latest index.

## 3. Snapshot-to-main boundary

At 03:34:07Z, HsH main was `38f10f1fe2a6afe03396ab4c4139745894e6e9fb`.

Compared with the discovery input commit `3536225bc3f5f76a0fca7f41c2828229ea5f6c0c`, main was three commits ahead. The changed paths were:

1. `PUBLIC_SITE/generated/discovery.json` (the generated snapshot commit itself);
2. the Calder h890:s3 published artifact;
3. three Conversation Viewer data/manifests.

The Calder artifact was published after the discovery snapshot:

- [Calder publisher issue #1874](https://github.com/Satobloc/HsH/issues/1874)
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-h890-s3-kelvin-acquisition-dependency-profile-20261117t0236z-001.md`
- Artifact blob: `c53d6f4c62c241da77afed9b2c3df909cfbf4b1b`
- Publisher readback comment: [#6937233301](https://github.com/Satobloc/HsH/issues/1874#issuecomment-6937233301), SHA-256 `9c7dc5f095c174c34acade9f49a2d727f5d136fa3627dd60877e7c2a59a2d807`.

That artifact is therefore not represented in the 03:28 discovery snapshot. The later Conversation Viewer refresh is a separate surface and is not evidence of a paper-reader route repair.

Calder's later [chronology correction comment #6937263850](https://github.com/Satobloc/HsH/issues/1874#issuecomment-6937263850) records that exact-head run #44009472529 had already failed at 03:24:19Z, before publication. A subsequent exact-head run #44010420830 was in progress at 03:30:23Z; no Lean pass is claimed. This correction does not change the artifact's post-snapshot indexing boundary.

## 4. What remains unobserved

- No exact production deployment identity was established.
- No authenticated browser context or owner preview was available.
- No live Paper A or Paper B reader route was observed.
- No visitor-facing exposure incident is confirmed.
- No positive P0 trigger or standdown is established.

The current evidence is a source/index policy mismatch, not a live-route finding. P0 remains ACTIVE. No manuscript, feed, presentation, registry, builder, test or deployment file was modified.

## 5. Workflow and research boundaries

The task graph has 18 actual branch objects while its declared `branch_count` remains 16: 5 completed, 12 active and 1 blocked. It has 7 roots, no cycles, no missing parent/child IDs, and one parent-only reference: `WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03` points to `P2-REAL-SYSTEM-GEOMETRY-2026-11-30`, but the parent does not list the child. Tern retains graph/control ownership; no graph repair was made.

All four canonical Mersearch request files remain `requested`. The expected request-scoped `RUN_MANIFEST.json` and `SEARCH_RECEIPT.md` paths returned 404 for all four lanes. No callable Mersearch action was exposed in this runtime. No request was edited, released or retriggered.

The current Enheduanna formalization remains separate from P0:

- [PR #1619](https://github.com/Satobloc/HsH/pull/1619) is OPEN / DRAFT / UNMERGED, with no submitted reviews.
- Its h887 exact-head Lean build succeeded on PR head `275b5396a97d4f7efc4d7d2248bfa08218f01b35`.
- Two theorem-specific results had no axiom dependencies; the partial-index countermodel reported `[propext]`.
- The global axiom audit, tests, lint, leanchecker and nanoda were skipped.
- The positive occurrence witness and scoped-completeness theorem do not authenticate the external integrity certificate or establish real execution provenance.
- A later Vercel status comment reports FAILURE, but no cause was independently established. It is not a Lean failure.

Lane 24 remains BACKSEAT / HOLD under the P0 interlock. No Cycle 09, physical calculation, CODATA comparison, new Lean build, P2 system selection, paper advancement or theory promotion occurred. P1 Orson cognition remains NOT READY; P2 November 30 and P3 December 14 remain separate gates. FIE rereview remains due November 24.

## 6. Source and identity distinctions

The recovered Enheduanna authority is a broad direct user instruction to consider the project archives and assist source-grounded revival. No standalone signed specialist charter was found, and no current usable Enheduanna ChatGPT thread was authenticated.

The 2026-10-29 TOPLESS geometric intake is a separate Nathan Direct geometry source, not an Enheduanna role charter. It does not override the P0 interlock or authorize a Lane 24 cycle.

No private HSH_RESOURCES research payload was opened. The SAT archive and HSH_RESOURCES root navigation material were consulted only as appropriate to onboarding. No new tool, fork, dependency, subscription or expenditure was introduced.

## Disposition

`H891_S2_ENHEDUANNA / DISCOVERY_REFRESH_SUCCESS / 15462_DOCUMENTS / SOURCE_PIN_3536225 / SNAPSHOT_COMMIT_F79DE6AD / POSTSNAPSHOT_CALDER_ARTIFACT_NOT_INDEXED / P0_SOURCE_MISMATCH_PERSISTS / LATEST_A_B_ROWS_UNPARSED / LIVE_ROUTE_UNOBSERVED / P0_ACTIVE / MERSEARCH_4_LANES_REQUESTED / PWH_GRAPH_18_VS_16 / LANE24_HOLD / PR1619_EXISTING_LEAN_BUILD_REUSED / NO_NEW_BUILD / NO_PHYSICAL_WORK / NO_THEORY_PROMOTION`.
