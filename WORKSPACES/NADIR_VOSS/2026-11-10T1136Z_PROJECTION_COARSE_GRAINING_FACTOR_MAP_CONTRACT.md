# Projection/coarse-graining factorization contract

**Relay:** Workshop Relay :36, nominal 2026-11-10T11:36:00Z  
**Run key:** `REVROT3-19-20261011:731:s3`  
**Selection:** ring index 10, Nadir Voss label  
**Successor:** ring index 11, Enheduanna label  
**Disposition:** `NEW_ABSTRACT_MAP_CONTRACT / FIRST_EXACT_HEAD_LEAN_BUILD_SUCCESS / FINAL_CLEANUP_BUILD_PENDING / NOT_PHYSICAL / NO_P2_ADVANCEMENT`

This is an assistant reconstruction under a deterministic ring label. It is not an authenticated current Nadir instance or a claim of worker participation.

## 1. Source and authority boundary

The historical October 1 source export was fetched directly:

- Conversation: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`
- Raw Git blob: `d828fef5352045cb4d9486fdbeabd04043c4c119`
- 44 mapping nodes; 43 message objects; the literal string `Nadir Voss` occurs zero times.

Three direct user-role messages were inspected:

- `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, 2026-10-01T20:56:07.264Z: broad independent sandbox theorizing/derivation, with source-versus-invention separation and no target-fitting of old magic numbers or particle labels.
- `11122adb-75c5-4418-9b59-29730a034811`, 2026-10-01T21:07:30.057Z: make an independent playground, import and try, experiment, and disregard the assigned who-does-what split.
- `de178e6a-d223-4ad1-9bc9-d37f178f8b21`, 2026-10-01T21:20:56.352Z: compile the best available mathematics, prepare a challenge for another instance, and attempt a trial H(s)H Lagrangian.

**Authority finding:** these messages authorize an independent sandbox. They do not name Nadir, create a permanent identity or standalone Nathan-authored specialist charter, authenticate a current thread, or grant blanket permission for data-free physical calculations. The current measured-system rule remains controlling for physical work. This run performs only an abstract map-factorization proof, not a physical calculation or numerical fixture.

The current Nadir README is assistant-curated. No `CURRENT_WORK.md` exists; none was created. No authenticated current Nadir conversation/thread was recovered. The expected h731:s2 Elias-to-Nadir handoff was not found in the accessible Nadir inbox or expected Common handoff path. No consumption or participation is inferred.

## 2. Why this is a new architecture result

The existing Nadir work had already formalized conditional finite-dimensional frame/projection identities and the source-defined two-channel readout algebra. The h716:s2 report explicitly left open the maps connecting:

1. fine 4D/worldtube representation to a projected state;
2. fine representation to a coarse-grained 4D representation;
3. coarse-grained representation to its projected/readout state;
4. the compatibility condition that allows those operations to descend and compose.

The new result addresses item 4 without inventing a physical worldtube or an empirical fixture.

## 3. Typed map contract

Let:

- (W_f): fine-scale 4D/worldtube representation;
- (O_f): ambient fine projected/observed space;
- (W_c): coarse-grained 4D representation;
- (O_c): coarse projected/readout space;
- (P:W_f\to O_f): fine projection;
- (C_4:W_f\to W_c): 4D coarse-graining;
- (P_c:W_c\to O_c): coarse projection;
- (C_3:\operatorname{im}(P)\to O_c): candidate induced coarse-graining on the actual image of the fine projection.

The required commuting relation is:

[
P_c\circ C_4 = C_3\circ P,
]

where the domain of (C_3) is restricted to (operatorname{im}(P)). No unsupported surjectivity assumption onto all of (O_f) is made.

### Necessary and sufficient condition

A deterministic (C_3) exists exactly when:

[
P(w)=P(w')\;\Longrightarrow\;P_c(C_4(w))=P_c(C_4(w'))
\quad\text{for all }w,w'\in W_f.
]

In words: the coarse-projected result must be constant on every fibre of the fine projection.

When the condition holds, the induced map is unique on (operatorname{im}(P)). If there is a fibre mismatch, no single-valued deterministic (C_3) can preserve the coarse-projected result.

This is a factorization/descent criterion. It identifies when the projected state contains enough information to determine the coarse-projected output. If the fine projection erases a distinction that (P_c\circ C_4) still depends on, the projected state is not a sufficient state for that coarse prediction. One must retain additional state or use a different, explicitly specified relational/probabilistic map. The theorem does not say which physical structure supplies that state.

## 4. Lean formalization and actual build

Existing PR #1189 was reused. No new branch or PR was created.

- PR: `research/nadir-affine-translation-quotient-20261101t0324z`
- Base SHA: `7a3add552cebd8a9fa7f2b758f729b3d72d58bcc`
- New module: `FORMAL_VERIFICATION/HsHVerification/NadirProjectionCoarseGrainFactorization.lean`
- Current module blob after unused-parameter cleanup: `e547d9c5aa10be2f73b15ce757ec1645a67fd46b`
- Root aggregator blob: `227677ee3c801e90e2f14e37d148f45395e789fa`
- Current PR head: `536cfb8f30ae8bae8c3f9d729eb964216b7f4e4f`
- PR remains OPEN / DRAFT / UNMERGED.

The module defines the image-restricted projection and a noncomputable representative-based induced map, then proves:

1. the image-restricted projection is surjective by construction;
2. fibre constancy makes the induced map factor the coarse-projection/coarse-graining composition;
3. such a factorization exists iff the fibre-constancy condition holds;
4. the induced map is unique on the projected image;
5. a fibre mismatch rules out every deterministic induced coarse-graining.

### Build evidence

The first exact-head build of the new theorem succeeded:

- Actions run #42813886113, job #129821949408;
- checked-out source commit exactly matched `f5d4d6e2987b03428bd9e5a43573c34e0bd623c5`;
- Lean 4.34.0, Lake 5.0.0;
- full library build: 8,955 jobs;
- target module built at 8,928/8,955;
- theorem-specific `#print axioms` output was present;
- no `sorryAx` or bare `admit` occurrence appeared in the captured log.

The first build reported one unused-parameter warning in the definition. That parameter was removed without changing the theorem statements or mathematical condition. The cleanup commit is current PR head `536cfb8f30ae8bae8c3f9d729eb964216b7f4e4f`.

**Final cleanup-head verification is pending:** Actions run #42814711511 is IN_PROGRESS. At the last observation, checkout had completed and Lake dependency-manifest generation was in progress; the final source-checkout assertion and compile had not yet been observed. Do not attribute the first build's success to the cleanup head until this second run completes.

The first build's theorem-specific axiom output was:

- `imageProjection_surjective`: no axioms;
- `inducedCoarseGraining_factors`: `Classical.choice`;
- `factorization_iff_fiberwise`: `Classical.choice`;
- `inducedCoarseGraining_unique`: `Quot.sound`;
- `no_inducedCoarseGraining_of_fiber_mismatch`: `Classical.choice`.

Tests, lint, nanoda and the separate global axiom audit were skipped. The successful compile checks only the formalized abstract theorem, not source-to-physics translation or physical premises.

## 5. Geometry, prediction and falsification boundaries

The theorem supplies one typed rung, not a complete nested-worldtube architecture.

A second or later rung still needs:

- an explicit intermediate lift/identification from the coarse observable space into the next representation domain, or a separately justified map whose domain matches;
- its own fibre-constancy condition;
- an explicit composition rule and proof that adjacent diagrams compose;
- a physical acquisition/readout map and uncertainty model before interpreting any mismatch as an observable.

The theorem does **not** force finite thickness, twist, contact surfaces, a particular worldtube carrier, or a constitutive law. Such additions remain optional until a source-grounded derivation or measured discriminator requires them.

A future conditional test would freeze (P,C_4,P_c) before holdout access and search for independently observed pairs (w,w') with the same fine projection but different coarse-projected results. Such a pair would falsify the proposed deterministic descent for that instantiated model. The same test must be applied to the standard comparator under matched parameters and identical acquisition rules. Without actual maps and measured data, this is a mathematical acceptance condition, not an empirical prediction or falsification result.

No physical system, raw dataset, units, covariance, calibration, holdout, fit, prediction, or independent measurement was selected or used. P2 remains HOLD.

The assistant-generated BCH statement ([J_{12},J_{23}]=-J_{13}) and its leading-order expansion in PLAYGROUND_001 remain separate, unproved in Lean by this module, and are not validated by this result.

## 6. Project, source and control-plane state

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition paper: OVERDUE / NOT READY; Orson-owned.
- P2 November 30 geometry paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE rereview: completed by Aldus 2026-11-10T00:17Z; next due 2026-11-24.
- Task graph: declared branch_count 16, actual records 18; Tern retains reconciliation authority. No graph edit.

The current main branch head before this report was `f62884abbc89b1c4d6a9f74f8f02a23edbc69535`. A comparison from the h728 baseline `89d7813cb6049bb4ce9a36e9fab8282dce12203d` found 54 commits and 27 changed paths. None of the eight Code Grurple source/control paths changed. A fresh eight-file fetch matched all eight expected blob SHAs exactly. The prior ordered P0 fingerprint remains unchanged.

No authenticated browser context was available; Browser tab listing required the originating browser context. No authorized Sites editor/deployer, owner preview, deployment identifier, or served derivative digest was available. No route probe was performed. This is not a failed route test.

Mersearch was not invoked for this abstract map theorem. Existing shared request lanes were not overwritten or retriggered. Existing Math Hopper, Lean PR #1189, Whirligig, and SciSpace availability were checked; no new tool, dependency, fork, paid service, issue, or PR was created. No SAT-O or Blockwave equation was changed.

Unrelated reading: `SAT Mark V/TheTANGLE.txt`, lines 1481–1520. Next cursor: line 1521.

## 7. Scheduler and successor boundary

The nominal :36 occurrence was delayed; the current task run had no authenticated ChatGPT thread reference at the last scheduler observation. The deterministic Nadir label does not establish a persistent Nadir instance.

The immediate successor label is Enheduanna. Its h731:s4 :48 run had already started before this :36 run began and was later recorded FAILED, with no cause exposed and no authenticated thread reference. No late handoff was created. No cross-thread delivery, consumption, acknowledgment, or ownership transfer is claimed.

The existing :36 automation remains enabled with its exact original hourly schedule and phase. No task ID, prompt, cadence, schedule, or enabled-state change was made; no sixth task was created.

## Return pin

`H731:S3 / NADIR-RING-LABEL / NO-AUTHENTICATED-CURRENT-THREAD / OCT1-SANDBOX-SOURCE-VERIFIED / NO-STANDALONE-NATHAN-CHARTER / PROJECTION-COARSE-GRAINING-FACTOR-EXISTS-IFF-FIBER-CONSTANCY / UNIQUE-ON-IMAGE / FIRST-EXACT-HEAD-LEAN-BUILD-PASS / CLEANUP-HEAD-BUILD-PENDING / PR1189-OPEN-DRAFT / NO-PHYSICAL-PREDICTION / P0-ACTIVE / P1-NOT-READY / P2-HOLD / P3-INCOMPLETE / FIE-NEXT-NOV24 / THE-TANGLE-CURSOR-1521 / ENHEDUANNA-SUCCESSOR-ALREADY-STARTED-FAILED / NO-LATE-HANDOFF / AUTOMATION-UNCHANGED`
