# Ariadne Review-MIND: selected-branch provenance in SAT Lookup Framework
Date: 2026-10-28 06:48 UTC. Status: ORIGINAL-ARCHIVE SOURCE QC / NOT PHYSICAL VALIDATION.

## Primary sources
1. HsH `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_16/26.01.20...SAT Lookup Framework - raw.json` (actual filename includes typographic date separators), Git blob `f16037b8dc24697f26c510a76753ceda43219371`.
2. HsH `DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/26.01.20... [B] SAT Lookup Framework - raw.json`, blob `fdbf0fa288d0484099c6fde89aa9392577671176`.
Both original JSONs were directly retrieved and parsed in the connected GitHub runtime. Their `mapping` objects and `current_node` are exactly equal. The two blob SHAs differ because outer metadata differs (including title and update_time). These are TWO COPIES OF ONE CONVERSATION GRAPH, NOT TWO INDEPENDENT WITNESSES.

## Executed graph audit
For the first source, enumerate `mapping` nodes; walk `current_node -> parent` until root, preserving the visited node IDs; for each node with a nonempty string in `message.content.parts`, classify its `author.role` and active-chain membership. Cross-check each parent pointer against its parent's `children` list.
- 75 total nodes; 71 current-chain nodes; 64 nonempty message records.
- Four nonempty off-chain records: two user drafts and two assistant replies. Of ten nonempty user messages, two are off-chain.
- 74 parent edges checked, zero reciprocal parent/child mismatches.
- Both off-chain user drafts have distinct active user siblings with the SAME immediate parent.
- One abandoned user draft asks for a "zero-anchor" consistency check; its abandoned assistant continuation interprets that as setting theta4 to zero. The active replacement asks for consistency without real-world anchors. These are different experimental requests.
- A second abandoned user draft mentions neutrinos as single-coil oscillations; the active replacement additionally names photons, propagation between filaments, and persistent coils for massive particles. The abandoned assistant reply contains a table of unmeasured illustrative lepton parameters. Do not attribute that table to Nathan or use it as physical data.
- These two edit pairs have a different downstream assistant path. A timestamp-sorted list is not the active conversation transcript.

## Downstream consumer check
Live HsH `tools/search_archive_content.py` blob `366843d6afdb1dae4bc433505dca613f2f2d2bb5` iterates every `mapping` node with nonempty text, sorts by create_time/message ID, and does not attach active-path membership or parent ID to `Record`. The `tools/build_mersearch_index.py` blob `e2176e2cf7b341bc5a20cf14cd2e9a75e8a67e81` inherits those records and has no branch-membership column. This is a source-fidelity limitation of the 1.1-dev indexing path, not proof that stable 1.0 has the same behavior or that lexical search results are false.

## Formal status
Existing Ariadne PR #790 at head `5b1acc94481f0df197b8738ae22f41823a445488` has four conditional branch-projection theorems. Actions run #40624267047, job #122605765909, completed SUCCESS under Lean 4.34.0; compiler log explicitly built `AriadneBranchProjectionGate` and reported no axioms for the four named theorems. No new theorem was required to restate the same noninjective parent-projection property. Lean does NOT prove that these external JSONs are authentic, that the parser is correct, or that the historical theory claims are physically true.

## Method and decision
For reconstruction, require explicit `conversation_id`, source blob, `message_id`, `parent_id`, `current_node`, active/off-chain status, and speaker role. Preserve abandoned drafts as history, but never silently promote them to selected Nathan Direct or final assistant output. Content-identical archive copies must be clustered by conversation graph, not counted as independent corroboration. A future Mersearch improvement should be an opt-in branch-aware sidecar or backward-compatible schema revision after current 1.1 consumers are inspected; no new tool was built here.

No real physical calculation, invented measurement, new human-subject experiment, BEDROCK promotion, or historical worker-thread delivery. The original January 22 Kirk/Riley/Nathan source stack remains unresolved. Orson's November 9 cognition manuscript and the November 30/December 14 gates remain distinct.
