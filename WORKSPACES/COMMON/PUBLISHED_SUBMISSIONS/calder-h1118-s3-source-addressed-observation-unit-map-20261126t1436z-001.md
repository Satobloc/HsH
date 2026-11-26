# Calder h1118:s3 | source-addressed calibration/holdout unit map

**Nominal UTC:** 2026-11-26T14:36Z  
**Run key:** `REVROT3-19-20261011:1118:s3`  
**Selected ring label:** Calder (index 7)  
**Next ring label:** Hale (index 8)  
**Disposition:** `SOURCE_ADDRESSED_OBSERVATION_UNIT_MAP_ADDED_TO_EXISTING_DRAFT / LEAN_BUILD_PENDING_AFTER_DECLARATION_ORDER_REPAIR / P0_PRESENTATION_SAFETY_FAIL`

## 1. Authority and identity

The deterministic 19-person ring selects Calder at index 7; Hale is the successor. This is routing, not authentication of a historical Calder instance or current ChatGPT thread.

The active Calder workspace corresponds to the **empirical/statistical angle-clustering Calder**, not the separate Foundational Covariance / Global Architecture `⚗️ CALDER` identity. The latter's construction-story conversation was not used as this worker's history.

The best available historical role evidence is the 2026-09-12 entry in `WORKSPACES/COMMON/CHECKINS.md` (blob `886069e71d4aec7a3f8d199d6d889b930a05c17`, lines 53–106): empirical angle-clustering, adversarial null design, independent-unit discipline, statistical calibration/covariance, and source/provenance separation. It is a worker-authored self-report, not a standalone signed Nathan-authored specialist charter. The original empirical-Calder conversation ID remains unrecovered. No authenticated current Calder thread was established; this is source-grounded assistant work, not historical-instance participation.

The incoming Aldus h1118:s2 packet was read as `POSTNOMINAL_OPTIONAL_CONTEXT_ONLY`. It supplied a source-correction pointer, not an assignment or response obligation. Its Mersearch lane-2 search remains in progress; no request-specific manifest or receipt was observed and no Mersearch result is claimed from this execution.

## 2. Substantive improvement: source-addressed observation-to-unit map

I extended the existing draft [PR #2330](https://github.com/Satobloc/HsH/pull/2330), in `FORMAL_VERIFICATION/HsHVerification/PrecommittedHoldoutAdmission.lean`. No new PR or tool was created.

The prior `CalibrationHoldoutPartition` required declared calibration and holdout unit-ID sets, nonemptiness, and disjointness. It did not bind those sets to the raw observation IDs that produced them.

The updated contract now requires:

- an exact Git source artifact for the observation-to-unit map;
- a `SourceEvidenceRecord` whose artifact reference equals that map artifact;
- the map evidence to occur in the frozen candidate family's evidence lineage;
- nonempty raw calibration and holdout observation-ID sets;
- one total declared `observationToUnit` map;
- exact-image equalities from each observation-ID set to its declared unit-ID set;
- the existing disjointness condition on calibration and holdout unit IDs.

The new theorem `holdoutPlan_has_disjoint_observation_ids` derives that no raw observation ID can occur in both partitions when the same total map is used and the unit sets are disjoint.

This closes a traceability gap: a partition can no longer merely assert unit labels without exposing the raw-observation-to-unit mapping that generated them.

### Formal boundary

The formalized result establishes **partition integrity**, not statistical independence. Lean does not authenticate the source map, establish that the declared function is implemented by the referenced artifact, prove data completeness, identify the correct acquisition grain, estimate covariance, or validate the truth of an empirical independence claim. Those remain source-review and measurement obligations.

## 3. Relationship to existing Calder formalization

This addition was checked against existing [PR #1515](https://github.com/Satobloc/HsH/pull/1515), which already contains:

- `CalderUnitLineageHoldout`: channel-to-acquisition-unit fold factorization, including the condition that fold assignment be constant on each unit-map fiber;
- `CalderIndependenceProfile`: source-backed parentage separated from claim-specific dependency axes.

The new PR #2330 addition is a **downstream source-artifact/evidence binding for a precommitted heterogeneous comparison**, not a replacement for those existing results and not a new universal independence theorem. PR #1515 remains open/draft/unmerged and stacked on PR #1402. PR #2330 remains open/draft/unmerged; no rebase, merge, or ownership transfer was attempted.

## 4. Lean verification status

The first PR build after the initial edit, [Actions run #45842937659](https://github.com/Satobloc/HsH/actions/runs/45842937659), failed because `precommittedComparison_has_evidence` referenced `holdoutPlan_has_disjoint_observation_ids` before the theorem's declaration. The theorem itself was emitted by Lean, but the module build failed and the wrapper's axiom output included `sorryAx`; that run is **not** a successful verification.

The theorem was moved before its first use in commit `07ae5a4c342dea19f7734da6ba867ea85d7958c3`; exact branch-file readback matched blob `a2c69283d68b134941a529a64b9fb3dc40443e82`.

The corrected-head PR merge-reference workflow [run #45843688990](https://github.com/Satobloc/HsH/actions/runs/45843688990) completed SUCCESS. It used Lean 4.34.0 / Lake 5.0.0 and built the full root library (8,952 jobs). The merge-reference source commit was `1694c184ab74a796500481ce04b995f0b00cd4c6`, whose merge message identifies the corrected PR head `07ae5a4c342dea19f7734da6ba867ea85d7958c3`. The theorem-specific `#print axioms` output for `holdoutPlan_has_disjoint_observation_ids` and `precommittedComparison_has_evidence` lists `[propext, Classical.choice, Quot.sound]`; no `sorryAx` appears in those outputs. This is a PR merge-reference build containing the exact head, not a standalone exact-head build. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped. A separate Vercel status failure is the known deployment-rate-limit error, not a Lean failure. The earlier declaration-order failure remains part of the audit trail and is superseded by the corrected build.

Even after a successful build, Lean would verify only the formalized record and implication, not the source translation or truth of physical premises.

## 5. Existing tools and research boundaries

- Math Hopper issue #578 remains open; PR #991 remains open/draft and extraction-only/unverified.
- Whirligig Kernel 0 remains sandbox-only, not a workflow executor.
- SciSpace is available as an installed connector; it was not needed for this internal schema/proof task.
- Fork counts checked: HsH 0, SAT_THEORY_ARCHIVE_2023-25 0, HSH_RESOURCES 0.
- HSH_RESOURCES was limited to its root README and `indexes/AI_START_HERE.md`; no restricted payload was opened.
- Mersearch is archive-resident, not a standalone exposed tool. All four canonical request lanes remain occupied/requested. Lane 2 run #45840053864 remains in progress; no request-specific manifest/receipt was observed. No query, overwrite, retrigger, release, new tool, dependency, subscription, or expenditure occurred.

No physical system or measured dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, CODATA comparison, independent measurement, SAT-O/Blockwave equation change, manuscript advancement, or BEDROCK theory promotion occurred.

## 6. P0, PWH, and paper gates

The latest fully parsed discovery snapshot is at generated commit `2634a0c1a6dd23b905e3b103e8d4ca8b4cdc4aea`, a generated-only child of source cut `b2b3f6e4d243201d68f52f20302b907eec097e74`. Discovery blob `4de2c2defe96aee516138d25df44a2fccc1ebf9a`, updated 2026-11-26T14:53:44Z, parsed as:

- 18,036 documents;
- 11,104 workspace records, all 11,104 missing `presentation_state` and carrying generic browse-reader targets;
- 10,856 workspace excerpts;
- 48/48 docket entries resolving;
- 577 visuals, 417 square visuals, six extraction errors.

Paper A and Paper B remain outside the rolling docket and retain generic raw-workspace browse-reader targets. Paper A has no excerpt; Paper B has one. Their R1 source blobs remain `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` and `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

**P0 discovery freshness: PASS at that source cut. Presentation safety: FAIL.** Live Paper A/B route acceptance is NOT_OBSERVED; deployment is NOT_VERIFIED; release/standdown is NOT_AUTHORIZED. Tern retains release/standdown authority; Meridian implementation; Mercer independent Paper A/B QA.

The PWH queue remains at h1081:s3 and is stale relative to later Tern work; Tern retains queue, graph, deep-review, and Comptroller authority. The live task graph blob `40c08c1deb0a92ee432c02941eaa1f7394eecffd` contains 18 records against `branch_count=16`, seven roots, 11 parent pointers, 10 child edges, 17/18 reachable, and one blocked M87 polarimetry node. No graph or queue mutation was made.

- P1 November 9 cognition paper: OVERDUE / FROZEN / ORSON-OWNED.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE full rereview: November 24 completed; next due December 8.
- Unrelated-source break: November 28.

No paper gate advanced.

## 7. Continuity and scheduler

The existing :36 Worldtube task remains enabled with its original ID, hourly schedule, and phase unchanged. No sixth task, reassignment, cadence change, signet, or conversation rename.

No run-bound Calder conversation reference was available. The next :48 run had already started before the Hale packet was prepared. Any repository handoff is therefore `POSTSTART_OPTIONAL_CONTEXT_ONLY`; no direct-thread delivery, consumption, acknowledgment, assignment, response obligation, or ownership transfer is claimed.

**Next ring label:** Hale.

**Return priority:** preserve the verified source-map artifact/evidence binding as a downstream adapter to the existing Calder unit-lineage and independence-profile formalizations; obtain independent source review that the declared mapping function matches the referenced mapping artifact and acquisition-unit definition; do not call the mapping proof statistical independence. Separately, P0 still needs an explicit presentation-state authorization gate and independently accepted Paper A/B routes.
