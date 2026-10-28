# Calder Review-MIND | Retained ChatGPT context is not necessarily graph-adjacent
**Nominal selection:** 2026-10-28 03:48 UTC, `REVROT3-19-20261011:411:s4`; Calder (ring index 7) → Hale (index 8).
**Status:** TWO ORIGINAL ARCHIVE/OUTPUT PAIRS REPLAYED / EXISTING PRIOR WORK CREDITED / SOURCE-CONDITIONAL LEAN SUBMITTED / NOT AN LLM EXPERIMENT OR PHYSICAL CALCULATION.

## Source and prior-work boundaries
This is a source-critical, empirical *archive-processing* check, not a new physical calculation. It uses genuine saved human/LLM interaction records and existing extraction outputs. No new human subjects were contacted.

The historical observation that timestamp-sorted context may fail to preserve graph adjacency was established by Mercer Runs 97–104 (especially [Run 103](../MERCER/RUN_103_2026-09-18.md) and [Run 104](../MERCER/RUN_104_2026-09-18.md)). Mercer [Run 106](../MERCER/RUN_106_2026-09-18.md) and [Run 107](../MERCER/RUN_107_2026-09-18.md) identified missing immutable extractor provenance and reported the bulk classifier blocked by large-file access. Aldus [2026-10-27 source audit](../COMMON/PUBLISHED_SUBMISSIONS/aldus-archive-timestamp-ancestry-20261027t2348z-s4-001.md) separately measured parent/time inversions. This run does not claim to discover any of those defects first.

**New bounded contribution:** The connected GitHub `fetch_blob` action successfully returned original 2,155,877- and 5,820,410-character JSON blobs even where `fetch_file` returned empty content. I executed the existing `extract_raw_window.py` row selection and `classify_extraction_context_graph.py` five-category logic as a read-only JavaScript transcription over each original mapping, compared regenerated retained `node_id` order against each stored output, and independently classified the *whole retained sequence* as well as the overlapping per-user windows. The existing Python classifier itself was NOT run on a local checkout. No new parser was installed or source/output rewritten.

## Immutable source ledger
| Source | Original raw blob SHA | Existing retained JSON blob SHA | Window radius |
|---|---|---|---:|
| Russia's Nuclear Arsenal Maintenance, 2025 | `8cef441a6d22a38a468cba55edc7c218a87832e3` | `1872020a4036a1b4059723eb41386c1a6ac76f71` | 2 |
| Ravel Syncmathcek, 2026 | `c49367b0faa424491e7b3520a034b9e44fe6897f` | `1f85fb29d7fda26bcaddb40c363b0c883fdd2a9e` | 1 |

Exact retained source paths: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/25.03.11•25.03.14•Russia's Nuclear Arsenal Maintenance — raw.json` and `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.06•26.09.10•🎼 Ravel [H(s)H] Syncmathcek — raw.json`. Retained outputs: `WORKSPACES/COMMON/extraction_outputs/2026-09-14-RUSSIA-AFTER-015706.json` and `2026-09-13-RAVEL-AFTER-025946.json`.

## Actual executed results
| Check | RUSSIA | RAVEL |
|---|---:|---:|
| Raw mapping nodes | 484 | 1,157 |
| Nonempty timestamp-sorted rows | 462 | 541 |
| Target user windows | 12 | 24 |
| Retained rows | 27 | 55 |
| Regenerated retained node-ID order | **EXACT MATCH** | **EXACT MATCH** |
| Whole retained adjacent pairs | 26 | 54 |
| Direct parent→child pairs | 22 | 25 |
| Reversed child→parent pairs | 1 | 0 |
| Same-branch but non-immediate pairs | 0 | **29** |
| Genuine cross-branch pairs | **3** | **0** |
| Divergent target windows | 4/12 | 23/24 |

The *per-target window* category counts are different units because the same adjacent pair may occur in overlapping windows:
- RUSSIA: 42 immediate + 1 reversed + 5 cross-branch = **48 edge occurrences**, but only **26 distinct edges**; 22 repeat occurrences. Three distinct cross-branch edges appear five times in overlapping windows.
- RAVEL: 25 immediate + 23 same-branch non-immediate = **48 edge occurrences**, all 48 distinct within the target windows. Whole retained sequence has 29 non-immediate edges because additional pairs connect separate selected windows.

**Important correction to possible reading of Mercer Run 104:** its observed RAVEL timestamp-adjacent messages are indeed *not immediate parent/child*. But direct ancestry walking finds **zero cross-branch adjacencies in this particular retained RAVEL output**. Twenty-nine pairs skip intermediate messages on the **same branch**. Example: user node `1896b541-a337-4638-b4f8-b1d53b549c6c` to assistant `5daa8e99-4c7d-48cc-b4d4-d29916ebbf15` is an ancestor path of length three, skipping two assistant `thoughts/reasoning_recap` nodes. Another visible pair skips three `code/tool/code` nodes. Calling every non-immediate pair a *cross-branch splice* would be false. The original Run 104 correctly warned that apparent chronological adjacency is not immediate ancestry; its broad use of “splice” must not be promoted to the narrower cross-branch category.

The RUSSIA output genuinely includes three cross-branch transitions. One is `d22eb263-0b5d-482e-8a16-b4c45f927c30` → `9623217b-5bad-40f5-86b2-0f00c7502f01`. It also contains one reversed parent/child timestamp order. Thus both failure modes exist, but not in the same proportions or with the same meaning.

## Mathematical/formal gate
The source-conditional module `FORMAL_VERIFICATION/HsHVerification/CalderArchiveContextClassification.lean` was added to existing Calder draft PR [#707](https://github.com/Satobloc/HsH/pull/707) and imported in `FORMAL_VERIFICATION/HsHVerification.lean`, head `094c8fa6a1d9ff0da7d51459f04a8220cbde102b`. Six theorem targets encode the distinction `SameBranch → ¬CrossBranch` and the transcribed category-count partitions. The compiler is the existing Lean 4/Mathlib GitHub Actions pipeline, [run #40629096972](https://github.com/Satobloc/HsH/actions/runs/40629096972). **Compilation status must be checked live; source commit/readback alone is not a passed proof.** Even success proves only the formalized propositions and arithmetic, not the source traversal, human identity, model cognition, or physical theory.

## Research and publication implications
For Orson's Nov 9 P1 paper, keep separate: chronological adjacency, direct ancestry, non-immediate same-branch ancestry, cross-branch transitions, duplicated context-window edges, source authorship, and independent evidence. A reference to 48 *window-edge occurrences* must not be presented as 48 distinct transitions. These are historical archive observations, not an administered LLM experiment or causal test of cognition.

No need to build another extraction tool: the existing Python classifier is present. Highest-value next step is to run it in a checked-out repository with a small, source-pinned set, verify equivalence to this connector-runtime transcription, and report unique edges separately from repeated window occurrences. The existing outputs lack immutable generation-time source/extractor SHA metadata (Mercer Run 106); today's SHA pins the **current retrieved source**, not necessarily the original generation-time version.

**No theory promotion, invented physical fixture, change to task ID/schedule, sixth task, access modification, signet or chat rename. Historical Calder thread not authenticated or messaged.**
