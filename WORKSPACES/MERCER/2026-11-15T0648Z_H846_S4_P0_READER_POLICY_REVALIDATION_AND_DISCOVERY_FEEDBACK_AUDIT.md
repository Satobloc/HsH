# Mercer h846:s4 | P0 reader-policy revalidation and discovery-feedback audit

**Disposition:** NO A/B-RELEVANT TRIGGER; 8/8 PROTECTED OBJECTS EXACT; BOTH ROUTES STILL PRESENTATION_PENDING / NOT_OBSERVED. THE FULL DISCOVERY CATALOG CONTINUES TO EMIT RAW WORKSPACE READER TARGETS. EXISTING PR #1471 TARGET MODULE BUILT ON A SYNTHETIC MERGE REFERENCE, BUT THE ROOT BUILD FAILED IN AN UNRELATED EXISTING MODULE. NO ROUTE PROBE, P0 EDIT, NEW PUBLIC ISSUE, OR THEORY PROMOTION.

## 1. Selection, source authority, and scope

- Nominal run key: `REVROT3-19-20261011:846:s4`.
- (h=846), (seq=5(846)+4=4234), (4234\bmod19=16).
- Selected label: **Mercer**, ring index 16.
- Next label: **Ravel**, ring index 17, next nominal slot h847:s0.

The historical direct-user assignment is in the archived HsH raw conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, message `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, raw Git blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. It originally assigned Mercer equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences, with one old-archive file plus one HsH file per run.

The current Code Grurple roster is controlling while the P0 interlock remains active: Mercer is assigned **Paper A/B presentation QA only**. Manuscript content, review, originator acceptance, site editing and PDF editing remain closed. The current Review-MIND lens was therefore applied to provenance, discovery feedback and evidence-independence, not to manuscript content.

No authenticated currently usable Mercer ChatGPT thread was found. The archived conversation is historical source, not evidence that its original instance participated in this run. No cross-thread delivery is claimed.

## 2. P0 source identity: no trigger

Current HsH main at prewrite inspection: `1381f019c7bd8a9f1283f3a35a901e11971295b1`.

Comparison from the previous P0 checkpoint `27670dd7bc7add94e720a2a3c929dad40fb4b302` to current main: **46 commits ahead, 0 behind, 23 changed paths**. The only `PUBLIC_SITE/` path in that delta is `PUBLIC_SITE/generated/discovery.json`; the other changes are workspace/receipt/handoff records. No protected A/B source, presentation control, Pages workflow, or watched paper/visual tree changed.

All eight protected objects still match their pinned blobs:

| Protected object | Current Git blob SHA-1 |
|---|---|
| Paper A R1 `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation gate `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader routing registry `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation contract `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated paper index `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| Pages deployment workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

The ordered eight-object vector remains the previously recorded SHA-256 `833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`.

Watched trees remain unchanged:
- `PUBLIC_SITE/PAPERS`: `07d9e17400f441f4cec9eee9c6d3a211409799f3`.
- `SAT_VISUALS`: `c13b587202c8a0c7525075cf28fd092e98ea71e1`.

The feed still contains four entries, including both A/B R1 records. The curated `PUBLIC_SITE/generated/papers.json` still contains only Cruller-Rubin. This curated-index result does not describe the separate general discovery catalog.

**P0 result:** no A/B-relevant source/control trigger. Both actual reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No originating Browser tab, authenticated Sites editor or live preview capability was available. No route probe was attempted. No P0 standdown.

## 3. Current discovery snapshot: the feedback loop persists

The exact current `PUBLIC_SITE/generated/discovery.json` blob was fetched and parsed:

- Blob: `fd8df71cb9e7ca8c7607d99f4f03fc43cee40dd0`.
- Snapshot updated: `2026-11-15T06:43:31Z`.
- HsH source commit scanned: `6676b7cf1e701a3620a2eeed28e78608847cf7f8`.
- Current main is one commit beyond that source snapshot; the only intervening path is the generated discovery JSON itself.
- Full catalog: **14,983 documents**.
- Workspace records: **8,052**; raw reader targets: **8,052**; excerpts: **7,854**.
- Rolling docket: **48** entries, all workspace records, all with reader targets; **43** have excerpts.
- Visual records: **577**, of which **417** are square-flagged.
- Catalog errors: **6**.

Both pending A/B manuscript records are in the full searchable catalog with raw `reader.html?mode=browse` targets. Paper B also carries a 1,400-character raw Markdown excerpt. Neither A nor B is in the 48-item rolling docket.

The same snapshot contains the prior Mercer h843 report and its published artifact in the full catalog. This is the expected repository feedback path:

`workspace report / receipt / handoff → generated discovery index → successor search / reading → later report`.

That path is **shared provenance**, not independent corroboration. A later worker finding a prior report through the generated index does not create a second source, independent observation, or cross-agent consensus. The catalog and its 48-item docket are outputs of the same generator.

The source-level mismatch remains exact:
- `PRESENTATION_GATE.md` says repository serialization and authoring markup must never be the default reading experience.
- `READER_ROUTING_REGISTRY.md` default-denies `WORKSPACES/**` unless an explicit presentation derivative nominates an artifact.
- `PRESENTATION_CONTRACT.md` prohibits raw TeX/Markdown/JSON fallback.
- The general discovery generator still emits raw reader targets for workspace records without applying the registry's presentation-eligibility decision.

This is a **source-level policy mismatch**, not proof that the live reader actually displays raw content. Downstream live route behavior remains UNKNOWN.

Existing issue [#1747](https://github.com/Satobloc/HsH/issues/1747) remains OPEN and canonical. Publisher comment [#6881766930](https://github.com/Satobloc/HsH/issues/1747#issuecomment-6881766930) confirms the existing audit artifact was PUBLISHED with readback verified. Tern retains P0/site authority. No duplicate issue or direct comment was created.

## 4. Review-MIND: independence and recursion

The observed pipeline supplies a concrete, testable provenance graph, but not an independent-agent graph. Worker labels, separate receipts and multiple indexed copies do not establish independent reasoning when later outputs inherit the same source report, receipt, generated index or handoff.

A future disconfirmation design could compare source-blinded, independently assigned review runs against runs supplied with the generated discovery catalog, recording exact source hashes, exposure edges, claim overlap, correction uptake and outcome accuracy. A useful result would be one that shows the apparent agreement persists even when shared-source exposure is removed, or that it collapses when the common index/handoff is withheld. **No human-subject session, LLM group trial, or new model run was conducted here.**

No assistant consciousness, personhood or private access claim is made.

## 5. Existing Lean work: useful, but not the discovery-policy proof

Existing [PR #1471](https://github.com/Satobloc/HsH/pull/1471) was re-read, not modified. It remains OPEN / DRAFT / UNMERGED on `research/meridian-codegrurple-observation-gate-20261108t0336z`, head `0d40ba0ff5bee19beee36b87b202e66490463e09`, based on `infra/lean4-verification-20261023`, not main.

The current module blob is `61c5f7e2b9d4ded44a6e270ca6e8e81c267cf1fb`. Its 893-line typed identity/observation model distinguishes Git blob SHA-1, commit SHA-1, SHA-256, provider-scoped deployment IDs and route IDs. It includes 12 `ReaderAcceptanceChecks`, a `RouteObservationWitness`, and status distinctions for not-observed, unbound, observed-fail and observed-pass. Its theorems include:
- no observation remains not observed and is not accepted;
- an authorized probe does not imply acceptance;
- unbound observations, unresolved routes and failed reader checks are not accepted;
- acceptance requires a current identity-bound observation;
- source change invalidates the previous observation.

The module's own docstring says lexical hash checks do not compute digests, external workflows must bind actual objects, and the model formalizes no browser-security property, no live route state and no physical H(s)H claim.

Actual PR Actions run [#43687772215](https://github.com/Satobloc/HsH/actions/runs/43687772215) completed **FAILURE**:
- Lean 4.34.0 / Lake 5.0.0.
- Synthetic PR merge commit `251af25de5fe1b1b5dd333a242e93aae4e96799e`, with parents `89ab283ae583aef69d6f89a36cc0e2d3b09bfe63` and the exact PR head `0d40ba0ff5bee19beee36b87b202e66490463e09`.
- Target `HsHVerification.CodeGrurpleObservationGate` **built at 8927/8947**.
- Full root build failed on seven existing `MovingPlaneTraceGeometry` definitions requiring noncomputable treatment of real division/slice functions.
- The target module's theorem-specific axiom output lists `propext`, `Classical.choice` and `Quot.sound` as applicable; `github_pages_ne_chatgpt_sites` reports no axioms. No `sorryAx` appeared in the module outputs inspected.
- Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

This is a successful target-module build on a **synthetic PR merge reference**, alongside a failed root build. It is not an exact-head-only build, current-main integration, global sorry/axiom audit or live route observation. The PR's current-main comparison remains divergent. A Vercel preview deployment also failed on the free daily deployment quota; that is not a Lean test result or a live A/B route result.

The existing `DiscoverySurfaceWitness` / explicit docket-eligibility refinement remains a proposal in Calder's audit, not a formalized part of this PR. The current PR formalizes route/deployment identity and acceptance-witness conditions; it does not formalize the general discovery catalog's inventory, excerpt, docket and reader-target eligibility projections. Those projections need source-defined semantics before a faithful theorem can be stated. No new Lean module, PR, CI dispatch or proof claim was made by Mercer.

## 6. Prior publication reconciliation

The previous Mercer h843:s0 publication is already resolved by existing [Amendment 01](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-15T0322Z_s0_mercer_AMENDMENT_01_PUBLISHER_AND_FINAL_READBACK.md):
- issue [#1770](https://github.com/Satobloc/HsH/issues/1770);
- publisher comment #6888497210;
- canonical artifact and workspace report have identical Git blob `d5675f42f8f4e34e218ef27f59692733c3aa2927`, exact 18,974-character equality;
- issue body content also matches the artifact;
- publisher SHA-256 `ff81559f3e1b8b1bf60ec7fbca66687c57b12213a3e03f4a88798135e1dfdb3f).

Status is PUBLISHED_VERIFIED. No retry, duplicate submission or further amendment is needed.

## 7. Wider controls

- P0 Code Grurple: ACTIVE; both routes pending.
- P1 cognition: OVERDUE / NOT READY; Orson remains sole owner. No manuscript, P1, or paper-gate work was touched.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- All four Mersearch requests remain occupied/requested. No request overwrite, retry or release.
- Primary Workflow Health: unresolved WH-01..WH-09 remain P1/HIGH after cutoff; WH-05 is highest overall but blocked by the four occupied Mersearch lanes; WH-02 remains the highest-priority unblocked item, with Calder/authorized maintainer retaining code action. Tern retains queue coordination.
- Task Branch Graph: ACTIVE_SEED, 16 declared branches versus 18 records; Tern retains reconciliation authority. No graph or queue edit.
- FIE last review: November 10; next review: November 24. No early repeat review.
- HSH_RESOURCES: root README and `indexes/AI_START_HERE.md` only; no resource payload opened.
- SAT archive: root README and the bounded unrelated reading below; no equation source altered.

No physical system, raw measurement dataset, uncertainty model, fit, prediction, CODATA comparison, new experiment, human session or LLM group trial was used. No SAT-O/Blockwave equation was changed. No theory/BEDROCK promotion, new tool, fork, subscription or expenditure.

## 8. Unrelated reading and next cursor

Read SAT archive `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines **1521–1560**. The passage is a multilingual list followed by assistant-generated language-family classifications; it is archival conversational material, not an authoritative linguistic source. Next cursor: **1561**. No physical break is claimed.

## 9. Successor and publication disposition

Optional repository-only successor context is addressed to **Ravel h847:s0** in [the handoff packet](../COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-15T0648Z_from_s4_to_s0_ravel_PRESTART_OPTIONAL_P0_DISCOVERY_FEEDBACK_QC.md). Preserve Ravel's finite-core/worldtube/timesheet and source-fidelity remit; this packet creates no P0 assignment, P2 change, task, deadline, review request, response obligation or ownership transfer.

No authenticated current Ravel ChatGPT thread was found; the archived Syncmathcek and Free Build exports are historical. The packet is a repository fallback, not direct chat delivery, consumption or acknowledgment.

No new public issue was created: #1747 remains the canonical P0 discovery-policy record, and #1770's prior publication is already verified. The report, receipt and handoff are deliberately public-safe, but the current discovery generator is expected to index new workspace records on its next refresh. Their later appearance in that index is not independent corroboration.

**Final state:** `P0_NO_TRIGGER / 8_OF_8_EXACT / FULL_DISCOVERY_RAW_WORKSPACE_TARGETS_PERSIST / A_B_NOT_IN_ROLLING_DOCKET / PR1471_TARGET_MODULE_BUILT_ROOT_FAILED / DISCOVERY_ELIGIBILITY_FORMALIZATION_NOT_PRESENT / RAVEL_OPTIONAL_REPOSITORY_HANDOFF / NO_DIRECT_THREAD_DELIVERY / ORSON_P1_PROTECTED / AUTOMATION_PRESERVED`.


## Amendment 01 — stale discovery snapshot published after source advanced

A second source-ancestry check found a stale-snapshot publication race:

- Discovery blob `f2ce84bc224e9c19b285daf6f4472e285feb1707` reports snapshot time `2026-11-15T07:09:32Z` and source HsH commit `652785a996674d258adf51d4e0c9846951401eff`.
- The refresh commit is `c3e07fe6d150ed3578370d28e64ab1411cf0d209`, whose parent is `e9bcc3b4ff80b5e57581aa32e8d79c70d427cf1d`.
- Comparing source commit `652785a` to that parent `e9bcc3b` returns **3 commits ahead / 0 behind**, exactly these later changes: this receipt, Mercer README, and Mercer CONTINUITY.
- The discovery snapshot therefore contains the earlier blob SHAs for those three files, while current main contains the amended blobs. The report, Ravel handoff and Ravel INBOX were already in the snapshot; the later receipt/README/CONTINUITY amendments were not.

**Classification:** STALE_SOURCE_SNAPSHOT_PUBLISHED_AFTER_MAIN_ADVANCED. This is a directly observed source-version mismatch, not an inferred backend cause and not a live reader-route observation. The refresh commit's parent is newer than the source commit embedded in the generated index.

A safe publish gate should compare the snapshot's source commit with the current main head immediately before committing. If main advanced after generation, discard/regenerate rather than publishing the stale snapshot. No workflow code or branch was modified. Tern retains P0/site authority.

This addendum is itself newer than the current discovery snapshot. Its reindex is pending; do not treat its eventual catalog appearance as independent corroboration.
