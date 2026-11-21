# H992:S3 — Geometry-Plot / Comparison-Freeze Congruence Adapter

**Status:** assistant-level Lane 36 architecture work; proposed additive crosswalk; not an Alberr-authored result, adopted P2 schema, H(s)H theory promotion, physical prediction, or Factory Floor admission.

## 1. Rotation, identity, and authority

- Nominal UTC hour: h=992, measured from 2026-10-11T00:00:00Z.
- seq = 5h+3 = 4963; 4963 mod 19 = 4.
- Deterministic ring label: **Alberr**, index 4.
- Next ring label: **Mira**, index 5.

The ring selects a routing label, not an authenticated instance, conversation, consent, assignment, or participation. Alberr's current workspace says historical source recovered, manual reentry pending, total autonomy, and no assignment. Nathan's 2026-09-22 direct reentry signal requires Alberr to answer Nathan directly before any review, lease, or current-theory task is assigned. No standalone signed Nathan-authored Alberr specialist charter was found. The assistant-maintained [Alberr README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALBERR/README.md) and [historical wake packet](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/SABLE/WAKE_PACKETS/REV-001-ALBERR-GEOMETRY.md) are not such a charter. The [direct reentry signal](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/ALBERR_DIRECT_REENTRY_SIGNAL_2026-09-22.md) remains controlling.

Accordingly, **no work is attributed to Alberr**. This is current-assistant Lane 36 work under the scheduled ring label only. No Alberr workspace, inbox, task, review, lease, first-blush, or response obligation was created.

## 2. Source authority and provenance

Nathan Direct, 2026-11-03, message 937638a6-0095-47da-8bd3-4d2bc92137bc, created 2026-11-03T16:06:08.288Z, establishes five distinct representational levels:

1. primary observation;
2. secondary physical working model / hands-on model / orrery;
3. tertiary precision dynamic geometric software model;
4. quaternary precision static geometric diagram;
5. pentary mathematics.

The direct instruction requires a precise plot of the actual object, hostile geometric-fidelity review of that exact plot, and display of the same plot with the submitted file. It also says mathematics is not a substitute for identifying and showing the theoretical object. The raw message was reread with surrounding context; its source is the existing Workshop Relay :00 raw export, message UUID above.

The current [Factory Floor Geometry-First Gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/FACTORY_FLOOR_GEOMETRY_FIRST_GATE_2026-11-03.md) is the operational implementation. Its detailed checklist, state names, and package schema are not all verbatim Nathan language. Its controlling file is WORKSPACES/COMMON/FACTORY_FLOOR_GEOMETRY_FIRST_GATE_2026-11-03.md, blob 2764082a948e1c1b6af75483b2a5976a40383f64. The related [incorporation-tier directive](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-03_SAT_HSH_INCORPORATION_TIERS.md) has blob 8d0c188132a39d2dff018dc055a5d9c7635faf4f.

The existing [Coupling-Preserving Projection Gate v0.1](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/COUPLING_PRESERVING_PROJECTION_GATE_V0_1.md), blob b12598dbf20eddf1a0e8360866819d891a7fd400, supplies a separate projection/readout-coupling control. This report adds a cross-contract identity join; it does not revise that gate.

No SAT-O or Blockwave equation was recovered, rewritten, or changed in this run.

## 3. The missing interface

The existing architecture already has two individually useful contracts:

- The Factory Floor geometry gate requires a precise quaternary plot, exact plot version/hash, independent hostile review tied to that artifact, and display of the same plot with the associated file.
- The P2 comparison-freeze contract binds H0/H1 model freezes to a common observation freeze, calibration, covariance, shared parameters, comparator, analysis plan, decision rule, holdout partition, and observable operator.

The current P2 formalization in [PR #1852](https://github.com/Satobloc/HsH/pull/1852) defines ComparisonFreeze with H0/H1 model-freeze IDs and the shared comparison components, following [issue #1735](https://github.com/Satobloc/HsH/issues/1735). [PR #1858](https://github.com/Satobloc/HsH/pull/1858) binds the evidence axes and paired predictions to one nonempty source bundle and witness digest. Neither type currently contains a geometry-plot witness or plot-review/display witness. Both PRs remain OPEN / DRAFT / UNMERGED and are stacked rather than integrated into main.

The same omission appears at adjacent boundaries:

- [H935's SourceRunWitness report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/2026-11-18T2336Z_H935_S3_PREDICTION_PRODUCER_RUN_BINDING.md) binds an actual producer run to source/map/readout and comparison evidence, but does not bind the quaternary plot. Blob: 07b237ee3686fe6d1d90144922d4fbed1f160c15.
- [H937's temporal producer-event join report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-19T0136Z_H937_S3_TEMPORAL_PRODUCER_EVENT_JOIN_CLOSURE.md) closes a completion/seal/unblinding ordering gap, but does not bind the plot. Blob: 8e18a51c09f95ae6ee22df7fe19d16fdda4e0546.
- The ParticleInstantiationWitness proposal in [issue #1819](https://github.com/Satobloc/HsH/issues/1819) binds carrier, intersection, particle extraction, physical readout, instrument, and comparison context, but not the quaternary plot.
- The PDR intake in [issue #2228](https://github.com/Satobloc/HsH/issues/2228) combines source, model, observation, comparator, analysis, execution, and holdout requirements, but its body has no geometry-plot witness. Its publisher attempt was rejected for SHA-256 mismatch; it is not a published canonical artifact.

**Confirmed schema gap:** the geometry plot can pass its own plot/review/display checks while a P2 prediction run is bound to a different geometry-model version. Conversely, a prediction can be tied to a model freeze while the displayed plot depicts a different version. The individual artifacts may each be valid, yet the cross-artifact identity relation is unproved.

This is a missing join in the workflow schema. It is not evidence that an existing physical result was misreported.

## 4. Proposed additive adapter, not a new gate

Add one side-specific GeometryPlotWitness as a companion to each existing ModelFreeze. Do not create a new Factory Floor gate, a new evidence axis, or a second comparison-freeze system.

Minimum proposed fields:

| Field | Required meaning |
|---|---|
| model_freeze_id | Exact H0 or H1 model-freeze identity whose geometry is plotted |
| source_bundle_id / source_snapshot_id | Same source lineage used by that model freeze |
| plot_artifact_digest | Exact plot bytes, using SHA-256 or immutable Git blob |
| plot_projection_map_id | Explicit map from the frozen geometry object to the plotted representation |
| frame / units / scale / orientation | Convention-complete display identity |
| renderer_version | Renderer and relevant rendering settings |
| feature_claim_manifest | For each depicted feature: source locator, claim status, model element, plot annotation, assumptions, and unresolved alternatives |
| fidelity_review_id | Independent hostile review bound to the exact plot digest and model-freeze identity |
| display_witness_id | Exact embedded/displayed plot digest, submitted-file digest, embed locator, and independent readback |

The corresponding review and display witnesses remain distinct records. A plot digest proves artifact identity, not geometric fidelity. A fidelity review proves only its stated scope, not physical truth. A display readback proves that the submitted file contains the reviewed plot, not that the plot is correct.

### Shared-domain map structure

For one frozen geometry model G_s, define:

- p_s : G_s -> V_s, the quaternary plot/projection map;
- r_s : G_s -> O_s, the physical readout map;
- d_s : O_s -> Y_s, the instrument/analysis response, where applicable.

The plot and readout are sibling maps from the same frozen geometry object. Their codomains differ. No equality, invertibility, or mutual sufficiency is assumed. If a claim requires a composition between local/global views, plot and readout, or geometry and observation, the composition map and its domain/codomain conditions must be declared explicitly.

A plot is not an input to the prediction run unless the model actually consumes the image. Normally the run binds to G_s and r_s; the plot is a parallel representation witness bound to the same G_s.

### Binding conditions

For each candidate side s in {H0,H1}:

1. GeometryPlotWitness.model_freeze_id equals the exact ModelFreeze.id selected by the comparison side.
2. The fidelity review names that same model-freeze ID and the exact plot_artifact_digest.
3. The display witness names the same plot digest and the exact submitted-file digest; the readback verifies the embedded artifact.
4. The SourceRunWitness names the same model-freeze ID and the readout-map ID contained in that freeze.
5. The ComparisonFreeze references both candidate-specific model-freeze IDs and their corresponding geometry-plot witness IDs, while retaining the existing shared observation, calibration, covariance, comparator, analysis, decision, and holdout identities.
6. H0 and H1 may have different geometry models and different plot witnesses. If their plots are visually compared in one frame, the common-frame transformation and its conditions must be explicit. Identical geometry is not assumed.
7. Multi-scale plots have separate artifact and projection-map identities. A local plot cannot stand in for the global geometry without an explicit projection/composition map.

This is a common-model identity join, not a claim that the plot and readout contain the same information.

## 5. Selective invalidation rules

| Change | Invalidate | Preserve when unchanged |
|---|---|---|
| Source geometry, primitive inventory, topology, metric, model parameters, or geometry map changes | ModelFreeze, plot witness, fidelity review, display, readout witness, producer run, and ComparisonFreeze | Nothing downstream that depends on the changed model |
| Plot bytes, renderer, frame, scale, orientation, or plot projection changes while G_s and r_s remain fixed | Fidelity review and display witness; create a new plot witness version | Prediction run and readout result, if their inputs are unchanged |
| Readout map, instrument response, calibration, covariance, or analysis changes while G_s remains fixed | Readout witness, producer run, and ComparisonFreeze | Plot and its fidelity review, if the geometry and plot are unchanged |
| Submitted file or embedding changes while plot bytes remain identical | Display witness and readback | Plot fidelity review and prediction run |
| Holdout partition, exposure state, or decision rule changes | ComparisonFreeze and dependent prediction/decision receipts | Geometry plot and review, if the model is unchanged |
| A feature changes from optional/unresolved to asserted, or vice versa | Geometry model manifest, plot, review, readout/run as affected | Only records proven independent of that feature |

This avoids two opposite errors: treating a changed plot as if it necessarily changes the physics calculation, and treating a changed geometry model as if an old plot review and prediction can silently survive.

## 6. Geometry-feature guardrails

The feature manifest must not visually promote optional or unresolved structures into established primitives.

| Feature | Current status to preserve |
|---|---|
| Worldtube finite extent/thickness | Qualitative source commitment where finite extent/internal structure matters; numerical profile and scale unresolved |
| Timesheet | Part of the current minimal pair; exact inclusion, intersection, and readout maps remain unresolved |
| Responsive medium | Provisional third primitive; retain only if it cannot be eliminated or absorbed and the geometry/evidence requires it |
| Twist / holonomy | Optional; no extra variable is forced by the minimal pair alone |
| Separate material contact surface | Not forced; an explicit incidence/slice/readout map is required wherever contact is claimed |
| Additional nesting or shape level | Optional until explicit projection and composition maps show it is required |

A plot may show a proposed feature only with its status and source lineage visible. The crosswalk does not promote any feature to BEDROCK.

## 7. Proof-first status and limits

Existing exact-head Lean runs were inspected rather than creating a duplicate type or modifying another specialist's branch:

| Existing formal contract | Exact-head run | Result |
|---|---|---|
| [Nadir PR #1852](https://github.com/Satobloc/HsH/pull/1852), comparison-freeze coherence, head 0bc31d2aafac9d3639c06aa93aaf4643033b7718 | [#43942772738](https://github.com/Satobloc/HsH/actions/runs/43942772738) | Exact-head assertion and full build passed, 8,949 jobs. Named same-freeze and paired-prediction theorems reported no axioms. |
| [Loom PR #1858](https://github.com/Satobloc/HsH/pull/1858), source-bound comparison, head 85780267a86bcadbcc4895e2031674f150f783e4 | [#43969861179](https://github.com/Satobloc/HsH/actions/runs/43969861179) | Exact-head assertion and full build passed, 8,952 jobs. Named source-bundle and existing-P2-contract theorems reported no axioms. |
| [Lane 36 PR #2032](https://github.com/Satobloc/HsH/pull/2032), producer quiescence, head 472d84b99c8c7385100a943a435de25f80afbe89 | [#44461116185](https://github.com/Satobloc/HsH/actions/runs/44461116185) | Exact-head assertion and full build passed, 8,952 jobs. The producer-completion/seal/unblinding theorem reported no axioms. |
| [Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133), heterogeneous projection-error transfer, head 25a66298a178e5590e35312a6459cc2c8ee4ed7d | [#44883007736](https://github.com/Satobloc/HsH/actions/runs/44883007736) | Exact-head assertion and full build passed, 8,955 jobs. The two named projection-error theorems reported [propext, Classical.choice, Quot.sound]; one unused-tactic warning remained. |

All four are open/draft branch-local results, not merged current-main integration. Lean 4.34.0 / Lake 5.0.0 was used. Separate global axiom audits were skipped.

No new Lean module was added. The ComparisonFreeze and source-bound types remain open/draft and their field names are not yet an accepted mainline contract. Creating a parallel GeometryPlotWitness type now would duplicate or pre-empt the existing P2 schema. The proposed adapter's future proof obligations are:

- every plot witness binds to the selected side's exact model-freeze ID;
- the fidelity review and display witness bind to the exact plot digest;
- the source-run witness binds to the same model-freeze and readout-map IDs;
- the paired comparison freeze binds both candidate-specific plot witnesses to one shared comparison identity;
- a plot-only revision does not invalidate an unchanged prediction run, while a geometry-model revision does.

These are proposed type-level invariants, not yet Lean-verified. Existing Lean builds prove only the statements actually formalized. They do not compute SHA-256, authenticate repository bytes, establish reviewer independence, prove plot fidelity, validate source-to-model translation, or establish physical premises.

## 8. Empirical status

No physical system or dataset was selected. No raw data, acquisition provenance, units, calibration, uncertainty/covariance, holdout, H(s)H geometry-to-observable map, prediction, fit, numerical falsification threshold, or independent measurement was produced.

P2 remains **HOLD**. This crosswalk is a workflow proposal and does not make a physical claim or advance Factory Floor admission.

## 9. Existing-tool and repository reconnaissance

- Mersearch was not callable in this runtime; no local pinned Mersearch checkout was present. All four canonical request files currently show requested. The PWH queue's lane-1 narrative does not match the live [lane-1 request file](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/MERSEARCH_REQUEST.json); that discrepancy was preserved, not reconciled. Lane 2 has a compact receipt, but its raw results remain withheld and the lane is not released. No new request was created and no lane was overwritten or retriggered.
- Math Hopper already exists: [issue #578](https://github.com/Satobloc/HsH/issues/578), source adapter, smoke workflow, and [open/draft PR #991](https://github.com/Satobloc/HsH/pull/991). Smoke run [#40841280647](https://github.com/Satobloc/HsH/actions/runs/40841280647) succeeded on PR #991's merge reference. It scanned one actual archive file and one SAT-backbone file, reporting 65 and 407 extraction candidates respectively. Both outputs had math_pass/math_fail null and Lean NOT_RUN. The SAT-backbone coverage warning recorded 111 unspanned heuristic-token lines, including 66 over 405 tokens. This is a smoke/source-coverage check, not a three-repository corpus scan or equation-validity result. No new tool was built.
- [Whirligig Kernel 0](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/SANDBOX/WHIRLIGIG_KERNEL_0.md) remains sandbox-only; it is not promoted or used as a physical equivalence.
- Existing Lean PRs #1852, #1858, #2032, and #1133 were reused for verification reconnaissance. No new branch, PR, dependency, fork, subscription, or paid service was created.
- SciSpace is available as an installed connector; no external literature search was necessary for this internal schema gap.
- The three repository front doors and relevant onboarding/indexes were read; the HsH [onboarding guide](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/INSTANCE_ONBOARDING_3REPO.md) was followed. Main heads at final source check: HsH 1587a67d4ac5c565add2bdf2d18e342f11fa6ee8; SAT archive d10dd333f2487054807bda398995300c538caa7e; HSH_RESOURCES ee88a8c2d95745594144c1b428a8266bd5b25bbe. No forks were reported for any of the three repositories. HSH_RESOURCES was limited to its front door and indexes; no research payload was opened.

## 10. Project and continuity boundaries

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY / ORSON-owned; no P1 work or protocol change.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 minor-paper gate: MISSED.
- November 30 major-paper gate: HOLD.
- December 14 full-theory gate: INCOMPLETE.
- FIE was last reread November 20; next review remains December 4.
- The unrelated-reading cursor remains at the next location after the h991:s4 break, lines 2686–2725, next 2726; no duplicate break was performed.
- [Task Branch Graph](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json) remains 18 records against declared branch_count 16; this unresolved semantics discrepancy was not altered.
- WH-02 remains Calder-owned; WH-05 remains blocked. The [PWH queue](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PRIMARY_WORKFLOW_HEALTH_ACTION_QUEUE_2026-11-13.md) was not changed.
- Existing :36 task ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with DTSTART 20261001T143600 America/New_York, RRULE FREQ=HOURLY, and Lane Charter 36 unchanged. No task, ID, prompt, phase, schedule, cadence, or enabled-state change; no sixth task.

The next ring label is Mira. No recipient packet or direct-thread delivery was made. No assignment, handoff acknowledgment, or cross-thread message is claimed.

## 11. Durable result and next cursor

This artifact is an additive integration proposal for the existing Factory Floor Geometry-First Gate, Coupling-Preserving Projection Gate, P2 ComparisonFreeze, source-bound evidence, ParticleInstantiationWitness, and SourceRunWitness/ProducerEventJoin chain. It does not replace any of them.

**Next cursor:** when the existing P2 ComparisonFreeze schema is accepted into an authorized shared branch, add the side-specific GeometryPlotWitness reference there and compile the five listed identity invariants against that accepted type. Until then, keep the proposal unmerged and P2 on HOLD.

**Run pin:** H992:S3 / ASSISTANT-LEVEL-LANE36 / ALBERR-RING-LABEL-ONLY / MANUAL-REENTRY-PRESERVED / GEOMETRY-PLOT-COMPARISON-FREEZE-CONGRUENCE / SCHEMA-PROPOSAL-ONLY / EXISTING-LEAN-RUNS-VERIFIED / NEW-LEAN-THEOREM-NOT-FORMALIZED / P2-HOLD / MERSEARCH-LANES-OCCUPIED / MATH-HOPPER-SMOKE-ONLY / WHIRLIGIG-SANDBOX-ONLY / TASKS-UNCHANGED / NO-SIXTH-TASK.