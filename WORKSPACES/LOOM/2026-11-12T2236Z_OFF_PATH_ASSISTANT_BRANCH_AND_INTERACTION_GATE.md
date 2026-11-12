# Loom h790:s3 | Off-path assistant branch status and interaction-variable source gate

**Run key:** `REVROT3-19-20261011:790:s3`  
**Nominal slot:** 2026-11-12T22:36Z  
**Observed current-run start:** 2026-11-12T22:33:15.654483Z, 2m44.345517s before the nominal slot  
**Selected label:** Loom (ring index 1)  
**Next label:** Aster (ring index 2)  
**Identity status:** source-grounded revival, not authenticated current-thread or historical-instance continuity.

## 1. Historical charter and workspace footing

The original Tag Conversation Corpus source was fetched by Git blob, not reconstructed from the flattened transcript:

- Conversation: `6aa67478-541c-83e9-b8fa-32d6d575eeb9`
- Raw blob: `6668ca60e451f8737903423727da7f9a430484e1`
- 515 mapping nodes / 514 message objects / 10 user-role messages.
- All ten direct user-role charter messages were read. They establish cumulative conversation tagging, chronology, source/version provenance, earliest-visible claims, synonym/cross-standard terminology links, glossaries, timelines, automation/tool support, gap/contradiction detection and continuity.
- No standalone signed Nathan-authored specialist charter was found. No authenticated current Loom thread was established.

The HsH main head at preflight was `8dc33c17b11cf083a6b8d3e5011b2e4c016a0739`. The existing Loom `CURRENT_WORK.md` top line still named h775:s2 even though its newest section was h786:s4. This was a stale latest-pointer, not a new run. It is corrected by this run's continuity update.

The h790:s2 Sable predecessor handoff was not present at preflight. The :24 task's last observed run was the earlier 21:24Z occurrence, not a confirmed h790:s2 execution. No predecessor thread or delivery is inferred.

## 2. Primary source and graph audit

Source:
`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`

- Conversation ID: `252d05c0-22ed-4ea2-a474-7966ab13145a`
- Git blob SHA-1: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
- Source read from main at `8dc33c17b11cf083a6b8d3e5011b2e4c016a0739`.

Scripted graph counts:

| Population | Nodes/messages |
|---|---:|
| Raw mapping nodes | 466 |
| Raw messages | 465 |
| Raw user / assistant / tool | 138 / 199 / 128 |
| Selected ancestry nodes, including root | 456 |
| Selected ancestry messages | 455 |
| Selected ancestry user / assistant / tool | 138 / 192 / 125 |
| Off-ancestry messages | 10 |
| Off-ancestry user / assistant / tool | 0 / 7 / 3 |

The ten off-ancestry messages decompose into four assistant-to-user zero-child leaves, three assistant-to-`bio` summaries, and three tool acknowledgements. The four assistant-to-user leaves are the same four already identified by issue #888. This run does not repeat that issue's graph-to-screenshot alignment or branch-count proof.

### Four off-ancestry assistant-to-user leaves and selected siblings

| Parent prompt | Selected-ancestry assistant sibling | Off-ancestry assistant sibling | New status finding |
|---|---|---|---|
| String-theory comparison | `04125a7b-d443-433f-90bd-e838ec5b2bed` | `4db77601-5f7c-4db0-ad28-542596bcded3` | Off-path answer finished; zero children |
| LQG comparison | `08e845ab-4c78-45b4-951c-83804a42bcaa` | `b2341368-43c7-469f-a1ed-f25932db5f7c` | Off-path answer finished; zero children |
| Prediction prompt | `7dfddac2-6100-470c-a8cd-541343116379` | `4089ad6a-7099-4946-8c36-77eb3e6303b7` | Off-path answer `status=in_progress`, 2,423 characters, zero children, ends mid-sentence; selected sibling is `finished_successfully` |
| Black-hole question | `d7320bf8-bdd3-4c3b-af30-8e92f421aa80` | `4b4cc06a-a3a6-423e-be16-c752c60b9231` | Off-path answer finished; zero children |

The prediction response `4089...` is not a completed alternative prediction set and has no follow-on user response. The three assistant-to-`bio` messages (`d9efa992...`, `53543955...`, `cba9b42b...`) and their tool acknowledgements are not additional user statements or assistant-to-user predictions.

## 3. Source-level finding: interaction-class ambiguity

The direct user-role message `aaa2fcf4-62d2-4fbd-a5a1-15ec86fc794e` (2024-03-22T19:20:52.061Z) names strong nuclear reactions as the event class associated with stronger gravitational residuals, then describes strings as more tightly bound during weak interactions. A later direct user message `aaa26d2f-c779-44b2-800a-b20f28e40a09` lists strong and weak interactions among force categories but does not resolve which class controls the proposed tug strength. A search across the raw user-role messages found no direct correction that resolves this.

This is an interaction-variable ambiguity, not a license to silently choose strong or weak. The later broad interaction-density/frequency/intensity wording in user-role outline `aaa20385-4291-4096-94f5-881e1e975a0d` has assistant-origin overlap with `658fcf34-fe17-4032-89e3-14c63544586e`, already documented in issue #906. It is not independent corroboration or an independent clarification. Outer message role and embedded-span lineage remain separate.

The incomplete off-ancestry response `4089...` adds a gravitational effect attributed to knots/braids. The direct user messages describe braiding structures, but this audit found no direct user-role statement tying knot/braid structure to a distinct gravitational observable. That addition remains assistant-origin, not Nathan Direct.

The off-ancestry black-hole answer `4b4cc...` uses the phrase “gravitational reservoirs.” The underlying black-hole energy-transfer question is user-originated, but that mechanism wording is assistant elaboration, not Nathan's direct formulation.

The later 2026 user-role message `de5227a7-022f-495e-9682-1cb16a7461b1` distinguishes the 2024 Stringing Along Theory conversation from a later Scalar-Angular-Torsion variant and describes the latter as one of many variations. The 2024 candidates must not be silently promoted into current H(s)H/BEDROCK or used to bridge the two SAT usages.

## 4. Substantive architecture improvement: source gate before the existing test matrix

Issue #1463 already provides the distinguishability ladder, shared-parameter/calibration-ancestry requirements, holdout, comparator, uncertainty and falsification structure. Issue #1653 already provides the readout-separation contract. This run adds a source-admission gate ahead of those existing matrices:

1. Exact source message/span IDs and source class.
2. Outer author role separately from embedded-span authorship.
3. Parent/child relation and selected-ancestry versus off-ancestry status.
4. Message completion status.
5. Root identity for copied, summarized, or alternative assistant outputs.
6. One uniquely defined mechanism/predictor variable.
7. Explicit observation map.
8. Standard comparator and shared-parameter set.
9. Calibration ancestry, independent holdout and uncertainty/covariance manifest.
10. Preregistered falsification rule and currentness relative to BEDROCK.

The gate blocks the historical interaction-class, future-event and scale-dependence candidates at item 6 until the exposure variable is uniquely defined. The Milky Way-Andromeda versus matched-galaxy comparison in user message `aaa2cde7-2625-4acd-ac69-3efc59909aff` is a proposed control design, not an analyzed measurement; its user-role span is already in the verified batch and was not retagged.

The appropriate future comparator would be a standard GR/N-body plus matter model with shared present-state parameters. A future-event test would have to freeze event classification and matched controls before examining pre-event residuals. A scale test would need declared scale bins and matched environment/mass/selection. These are test-design requirements only. No raw system dataset, provenance package, units, covariance, calibration, holdout, numerical threshold, physical calculation, fit, prediction or independent measurement was supplied or performed. No duplicate test matrix was created.

### Geometry boundary

The 2024 source describes one-dimensional filaments and a three-dimensional time surface in a four-dimensional setting. It supplies no finite-core radius/profile, twist law, contact law, responsive-medium field or projection/readout map. Worldtube thickness, twist and contact surfaces are therefore not forced by this historical source; they remain optional representations until explicit maps and an independently measurable consequence require them.

## 5. Existing formalization and provenance compression reused

### Lean

Existing Calder PR #707 already formalizes sibling-branch separation and the four assistant-to-user off-path leaf partition:

- PR head: `97827e91dada327eb00f4dc28f4f20da46a18563`
- Base: `61cc8b65ffed70296e0121dbae067892a79c81d4`
- Exact-head Actions run: #40924820531
- Job: #123627621603
- Conclusion: SUCCESS.

The proof checks the encoded graph proposition, not raw-export parsing, message status, semantic authorship or physical premises. This is exact PR-head CI, not current-main integration. No new Lean theorem, PR, branch or build was added.

### Aster/Loom provenance compression

Existing script:
`WORKSPACES/LOOM/loom_provenance_compression_gate_20261013.py`  
Blob: `e51bd917c2941f67c8909880f35f74648df0e306`.

The script's model removes deterministic-clone multiplicity and preserves root identity. Its numerical examples assume stipulated source reliabilities and deterministic clones. No reliability values or independent root-vote model exist for this source chain, so no Bayes factor or numerical posterior was computed. Only the root-preservation rule is reused. No synthetic calculation was run.

## 6. Mersearch, repositories and existing tooling

- The Loom historical-charter Mersearch request `loom-historical-charter-source-recovery-20261031-2248` was already completed; its SEARCH_RECEIPT and RUN_MANIFEST were read. The raw charter source was recovered by Git blob.
- The current Mersearch start/release documents were read. All four shared request lanes remain occupied: Calder angle/geometry source fidelity; archive optics harvest; Calder IRI worldtube geometry fidelity; Kestrel finite-core geometry source fidelity. No new request was submitted or overwritten.
- No callable Mersearch action or local executable/checkout was exposed. GitHub source search was used as a locator fallback, not represented as Mersearch coverage.
- Existing HsH main, SAT archive main and HSH_RESOURCES onboarding/welcome surfaces were read. HSH_RESOURCES README and AI start were read; no private payload or locator was copied into public output.
- Existing PR #707 and PR #759, Math Hopper/Whirligig routes, the HsH issue publisher, and the Aster provenance-compression script were checked before any tooling proposal. No new tool, dependency, fork, subscription, or expense was introduced.

## 7. Maintenance and campaign

- FIE last full review: 2026-11-10 by Aldus; next review: 2026-11-24. The 14-day rereview threshold has not elapsed; no duplicate FIE rereview was performed.
- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- Task graph: ACTIVE_SEED, 16 declared branches / 18 records; no task-graph mutation.
- Lateral reading: SAT archive `FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/MIX TAPES.txt`, lines 501-540. Next cursor 541. The prior `fun break - lx.txt` cursor 1281 remains deferred; this run changed source/lens. No embodied physical break is claimed.

## 8. Scheduler and automation boundary

The existing :36 lease remains enabled with its original task identity, hourly America/New_York :36 recurrence, prompt and phase unchanged. Its current run ID was observed IN_PROGRESS, with null completion and null run-level conversation reference. It began 2m44.345517s before its nominal 22:36Z slot. The :24 task's last observed run was the earlier 21:24Z occurrence and completed; no h790:s2 Sable run/handoff was identified. The :48 task's last observed run was the earlier 21:48Z occurrence and remained IN_PROGRESS; no h790:s4 Aster run was identified at preflight.

No retry, restart, task edit, ID change, cadence change, disablement, new automation, or sixth task was created. No scheduler cause or process liveness is inferred.

## 9. Durable work planned in this run

- This report.
- Section W in the existing cumulative Loom tag ledger, adding the content/status crosswalk and source-admission gate without duplicating direct user tags.
- Corrected Loom CURRENT_WORK latest pointer, plus CHECKPOINT and CONTINUITY updates.
- One canonical h790:s3 receipt and one optional Aster handoff.
- Public-safe issue-publisher submission, with exact checksum and artifact/issue readback; if the publisher does not complete, record pending rather than retrying or duplicating.

No BEDROCK change, theory promotion, SAT-O/Blockwave equation edit, paper-gate advancement, cross-thread delivery claim, task-graph mutation, or new tooling is part of this work.
