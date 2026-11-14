# KESTREL — OPEN QUESTIONS

Last updated: 2026-11-12

This is not an audit queue. It is a forward-thinking queue for the consequential case.

## 1. Nathan's role if the broad picture holds

- What work can only Nathan do?
- What work should Nathan stop doing because others can do it better?
- Which interpretations / explanations require his direct voice for provenance reasons?
- What should be captured now while it is still fresh in his memory?
- What would create unhealthy single-person dependency?

## 2. Preservation

- Is the project redundantly preserved across services, local storage, and stable export formats?
- Are the oldest notebooks and screenshots captured at sufficiently high quality?
- Is there a machine-readable inventory connecting scans, transcriptions, conversations, podcast episodes, papers, and current theory documents?
- Can an outsider reconstruct chronology if Nathan is unavailable?
- Are hashes / manifests / dates / source locations recorded well enough to survive platform changes?

## 3. Legibility

- What is the smallest set of documents that lets a serious outsider understand the project without entering the entire archive?
- What is the clean separation between historical SAT, current H(s)H, provenance, predictions, and open mathematical work?
- Which diagrams carry more explanatory load than thousands of lines of prose?
- Can the large archive be exposed progressively instead of as a wall?

## 4. Public-facing restraint without minimization

- How can Nathan say "this may be very important" without claiming adjudication that has not occurred?
- What language clearly distinguishes inheritance, remapping, bridge claims, and predictions?
- How should obsolete or superseded claims be displayed so they remain historically visible without confusing readers?
- How can outside similarities be discussed without implying copying or confirmation?

## 5. Audit independence

- Are the audit lanes independent enough from Kestrel-style synthesis to avoid contamination?
- Are blind tests genuinely blind where they need to be?
- Can negative results be surfaced prominently rather than quietly absorbed?
- Is there a clean claims ledger showing killed, weakened, revised, live, and verified claims?

## 6. Recognition scenario

If outside attention accelerates:

- Who answers technical questions?
- Who handles provenance questions?
- Who handles press / public explanation?
- What should Nathan personally refuse to do in real time?
- Is there a canonical landing page that does not overstate?
- Are there stable citation targets?
- Is there a concise "start here" packet for physicists, mathematicians, historians, and journalists separately?

## 7. Failure scenario

If major parts of the theory fail:

- Which historical / methodological results remain valuable?
- Which tools, archives, diagrams, or educational materials stand independently?
- Can the project tell the story of why the geometry was compelling and exactly where it broke?
- Can failed predictions be preserved cleanly rather than rationalized away?

## 8. Partial-success scenario

This may be the most realistic class of consequential outcomes.

- Which substructures could survive even if the global theory does not?
- Which SAT / H(s)H ideas are separable enough to test or publish independently?
- How should priority / provenance be handled if one narrow component proves useful?
- What architecture prevents one failed sector from dragging down unrelated viable work?

## 9. Personal robustness

- What is Nathan currently doing because the archive is cumbersome rather than because his judgment is required?
- Where is sleep / income / ordinary life being traded for tasks that can now be automated or delegated?
- What boundaries should exist around late-night discovery spirals?
- Who besides Nathan can recognize when the project machinery itself is becoming the bottleneck?

## 10. Succession / continuity

- What should a future Kestrel know that cannot be inferred from the theory docs?
- What should every new project instance read before acting?
- Which role definitions should be machine-discoverable?
- How do we avoid dependence on transient chat memory?
- Should Kestrel maintain dated continuity snapshots as major conceptual turns occur?

## 11. Consequence mapping

If the project is substantially right, consequences may extend beyond "a theory paper."

Without assuming any particular outcome, map possible effects on:

- foundational physics research priorities;
- interpretation of existing experimental results;
- new experimental discriminators;
- pedagogy / visualization of 4D physics;
- historical narratives around geometric approaches;
- AI-assisted scientific discovery and provenance;
- scientific credit / independent discovery norms;
- open-source theory development.

This map should remain scenario-based until specific claims survive audit.

## 12. The question underneath all of it

> If this is approximately what it looks like, what would we regret not having done six months from now?

That is a Kestrel question.


## 2026-11-02 update: mathematical back hallways and Klein-Fabric source boundary

### Back-hallway factorization

The 2026-10-21 user-role clarification says the "corridors" are metaphorical mathematical corridors between theories, not physical tunnels. The broad programme remains current, but the attached `H_{i→j}=π_j∘π_i^{-1}` expression is an author-unresolved candidate, not a Nathan Direct equation.

The existing draft PR #873 now contains the conditional factorization criterion:

- A deterministic `H : range(π_i) → O_j` with `H(π_i(p))=π_j(p)` exists iff `π_j` is constant on every fiber of `π_i`.
- If it exists on the entire range, it is unique.
- Injectivity of `π_i` is sufficient, but not necessary.

Current status: **LEAN_SUBMITTED_NOT_VERIFIED** for the new declarations. The previous successful build predates them. No actual `π_i`, `π_j`, domain, uncertainty model, or measured cross-theory dataset has been supplied. The next meaningful question is not to invent a hallway, but to identify a source-defined pair of projections and test fiber compatibility, round-trip behavior, and independent cross-prediction.

### Klein Fabric and local finite-core geometry

The 2026-10-21 source says the older reciprocal filament/timesheet-deformation model is no longer current because the Klein Fabric model had become common. It does **not** define the Klein Fabric or give its global topology or map to the local finite-core worldtube. Earlier continuity language calling the definition/map "adopted" is corrected by the 2026-11-02 Kestrel continuity entry.

Keep these unresolved and separately typed:

1. Global Klein-Fabric object and topology.
2. Map from global fabric to the native 4D local geometry.
3. Local finite-core/worldtube construction and its relation to spine, core, and shell.
4. Timesheet intersection or projection.
5. Observable/readout map.

The early NotebookLM Klein-bottle question, its assistant-generated ER-bridge/Möbius-cell answer, and the later mapping-torus proposal do not supply the adopted definition. No substitute topology or physical equivalence is to be invented.


### 2026-11-02 verification correction

The three back-hallway factorization declarations are no longer merely submitted/unverified. They compiled on the exact current PR #873 head `4d69627b9b701d6c4d15a582282dee49c911dc52` in Lean workflow #41468951678 (job #125357139451), SUCCESS, Lean 4.34.0/Lake 5.0.0, full library build 8,954 jobs.

The theorem-specific axiom output is:
- `hallway_factorization_iff_fiber_compatibility`: `Classical.choice`.
- `hallway_factorization_unique`: `Quot.sound`.
- `hallway_factorization_exists_of_source_injective`: `Classical.choice`.

The full build log contains zero `sorryAx` and zero `admit` occurrences. Separate axiom audit, tests, lint, and nanoda were skipped. This is a successful conditional Lean build, not a project-wide axiom audit.

The empirical and source-level question remains open: no actual theory projections `π_i`, `π_j`, common domain, uncertainty model, or independent cross-prediction has been supplied. The Klein-Fabric definition/global topology and global-to-local finite-core map also remain unrecovered.


### 2026-11-02 verification correction and next regularity gate

Receipt Amendment 02 supersedes the exact-head claim above. Lean run #41468951678 (job #125357139451) succeeded on synthetic merge commit `072ed737a34ee71c8162873ab7e487dad044aeb3`, whose message merges PR head `4d69627b9b701d6c4d15a582282dee49c911dc52` into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. It did not check out the PR head SHA alone. The PR's current base read is now `61cc8b65ffed70296e0121dbae067892a79c81d4`, so the current head+base merge is also unverified.

**Correct formal status:** `MERGE_REF_BUILD_PASS` on (head `4d696...` + base `c7dc2...`) / `CURRENT_BASE_MERGE_NOT_VERIFIED` (base `61cc8...`) / `EXACT_HEAD_ONLY_NOT_VERIFIED`. The module and 8,954-job merged library compiled under Lean 4.34.0/Lake 5.0.0; three theorem axiom outputs are `Classical.choice`, `Quot.sound`, `Classical.choice`; no `sorryAx` or `admit` appeared in the captured log. Separate axiom audit, tests, lint and nanoda were skipped. PR #873 remains open/draft/unmerged.

**Next mathematical gate — PROPOSED, NOT FORMALIZED:** the current factorization theorem is set/function-level. If a hallway is meant to be a continuous geometric readout, specify topological spaces and require the source projection to be a quotient map onto its image; a continuous target map constant on source fibers then induces a unique continuous factor map. If a smooth readout is intended, specify smooth manifolds and a surjective submersion with a smooth fiber-constant target map; local smooth sections give the induced smooth map. Metric, orientation, causal order, connection and measure preservation each require separate compatibility conditions. These are standard candidate hypotheses, not Nathan Direct and not yet Lean results.

**Blocking source gate:** no actual source-defined `π_i`/`π_j`, common domain, Klein-Fabric global topology, global-to-local finite-core map, or measured cross-prediction is available. Do not instantiate the proposed regularity theorem with invented physical maps.

## 2026-11-06 source-recovery correction: conceptual Klein-fabric construction recovered

The 2026-11-02 statement that no direct conceptual construction had been recovered is too broad. It is true that the 2026-10-21 direct message 090f5160 is only a supersession marker and does not itself define the fabric. However, the raw Calder Construction Story Retelling export (conversation 6a8eacca-c470-83ea-af92-8fb8df194de9, blob 92454acdaad701193e2a0c6cf64a7d7b70a03dbb) contains a direct user-role message on current ancestry: node 062ad8ee, 2026-08-26T23:41:28Z.

That message gives a conceptual recursive construction: twisted ER-bridge worldtubes returning through/to the Big Bang and reaching larger-scale Klein throats/ER bridges, with a finite Kerr/Kerr-like local core and a long axis expected along w. Earlier 14:15 and 23:17 messages provide off-ancestry chronology, not independent corroboration.

The open question is therefore no longer whether a direct conceptual description exists. It is how to type it mathematically. Still missing: ambient and support dimensions, manifold/topological-space definition, quotient/gluing, atlas, orientation, metric and causal structure, worldtube embedding, local dual-shell map, core/coil map, time-bulk intersection/readout map, and recursive composition law. The direct source explicitly says the dual-shell expansion may not be equivalent to the global fabric.

The 2026-11-05 h618 continuity phrase calling a formal Klein-Fabric definition and local spine/core/shell map "adopted" is also superseded. The correct status is conceptual construction recovered, formal maps unresolved.

See WORKSPACES/KESTREL/2026-11-06T0200Z_GEOMETRY_FIDELITY_RECURSIVE_KLEIN_WORLD_TUBE_MAP.md. No theory promotion or BEDROCK change.


## 2026-11-06 conditional curvature candidate

Assistant-origin node 6f2360f0-a954-48db-9df7-cf716ddf7df3 (2026-10-21T23:54:26.655Z) supplies a candidate Euclidean lift \(X(w)=(\mathbf{x}(w),w)\) and Gram-curvature identity. A conditional algebraic module was added to the existing PR #873 branch. It does not establish that the physical H(s)H worldtube uses this lift, that w has unit parameter speed, or that Euclidean curve curvature is the physical inertia law. Initial CI run #42152965536 failed on noncomputable definitions; corrected commit 1971e3d58a28f7c6de5cf024039dbcedb133121c is awaiting rerun #42153410233. Keep this as an assistant reconstruction until source-level mapping is established.


## New source bridge: θ₄, helix pitch, and moving-slice oblateness (2026-11-07)

Direct source recovery now gives two useful time slices that should be kept distinct:

- 2024 DIMENSIONAL GRAVITY raw export, conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`: the moving-plane orbit speed depends on helix pitch and slice rate, while orbit size depends on the helix cross-sectional radius, not pitch. The direct source's angle-versus-pitch wording remains dimensionally underspecified.
- 2026-08-27 Calder raw export, conversation `6a8eacca-c470-83ea-af92-8fb8df194de9`, blob `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`, user-role message `95319111-ba02-4b45-885a-6e44bd5fed7d`: θ₄ is described as inverse pitch and as associated with intersectional particle oblateness. The same message corrects the claim that w-orthogonality is fixed by construction: it is inferred from classical-particle sphericity, exact only in perfect vacuum, and not generally true for H(s)H helical worldtubes.

Working hypothesis only: pitch may control longitudinal phase advance, cross-sectional radius may control transverse orbit size, and θ₄ may be a local nonparallelism/readout connecting the helix axis to the time-sheet intersection shape. The 2024 moving-slice construction is a comparator, not proof that it is the 2026 H(s)H map.

Still missing: the source-defined θ₄ reference (sheet-relative or normal-relative), metric/signature, pitch/radius normalization, worldtube parameterization, and explicit worldtube-to-time-sheet intersection/projection map. The current BEDROCK normal-relative θ₄=0 representation and the August 27 vacuum θ₄=90° statement may be complementary under a stated convention, but the exact September 16 raw source remains unrecovered.

Existing Lean boundaries remain: `FIEAngleConventionFidelity` proves conditional Euclidean angle complementarity; `KestrelMovingSlice` proves a conditional Euclidean ellipse/rate model; `WorldtubeCurveCurvatureLift` proves a conditional affine Euclidean Gram-curvature identity. None establishes the intended physical H(s)H map. No new Lean module or physical calculation is authorized by this source alone.


## 2026-11-07 h671:s3 | θ₄ source-reference readback and two-knob test architecture

The 2024 DIMENSIONAL GRAVITY raw source has now been read at the exact user-message level: conversation `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`. Messages `aaa2d0b1-017d-453e-b95a-b23915f87d32` (2024-03-22T15:29:30.774Z) and `aaa2a1cc-e884-4f6a-800f-8afc29ab221a` (15:35:10.461Z) separate pitch/slice-rate control of orbit speed from cross-sectional-radius control of orbit size.

The 2026-08-27 Calder raw message `95319111-ba02-4b45-885a-6e44bd5fed7d` (conversation `6a8eacca-c470-83ea-af92-8fb8df194de9`, blob `92454acdaad701193e2a0c6cf64a7d7b70a03dbb`) assigns 90° to the vacuum direction parallel to the time normal, describes θ₄ as inverse pitch, and associates it with intersectional oblateness. Current BEDROCK BR-005 (blob `527924246cc25caf7fac02dce4b20f024013cd19`, lines 324–329) uses normal-relative θ₄=0 for that direction, citing a 2026-09-16 Nathan Direct clarification in `!!_RUNNING_COTHEORIST_LOG.md`; the raw 9/16 event remains unrecovered. A sheet/normal reference change is plausible, not source-authenticated. Do not silently convert either source or import the Ravel all-plus sandbox `tan θ₄=2πR/P` as a direct equation.

The working test architecture keeps P and R separate and treats θ₄ as a source-stated but unmapped orientation/shape relation. Required chain: finite-core support → helix/axis (P,R) → timesheet intersection → instrument readout. Every arrow needs a typed domain/codomain, metric/frame, units, conditions, composition order and fiber behavior. Existing Kestrel PR #873 supplies conditional fiber-factorization and nuisance-range theorems; existing Hale PR #1387 supplies the four-summary factorial identifiability theorem. Their actual merge-reference builds are recorded in `2026-11-07T2336Z_THETA4_REFERENCE_CROSSWALK_AND_TWO_KNOB_TEST_MATRIX.md`. No physical map, numerical threshold, system selection or calculation is supplied.

Public overlap check: existing issues #1158, #1191, #1266, #801 and #1037 already cover θ₄ source genealogy/plane-normal correction; #1301, #1432, #1435, #1438, #1451 and #1453 cover map, acquisition-rank and prediction-readiness gates. No duplicate public issue was created. Next source cursor: raw 2026-09-16 event behind BR-005; then lane-4 Mersearch request only after its completion.


## 2026-11-12 | 4D filament / 3D trace typing and link topology

**Source cluster:** July 18 spoken topology episode; flattened `HsH COSMOTOPOLOGY.txt`; SAT4D bylined draft; unbylined SAT-O1 companion; Blockwave attachment; direct 2026-10-09 and 2026-10-21 user-role clarifications.

1. What does “second order 4D filament” mean as a geometric type? Is it a 2D worldsheet/support, a higher-order object, or something else?
2. Does “3D intersectional trace” mean a curve/loop lying in a 3D slice, or a genuinely 3-dimensional section?
3. Which object is being sliced: a 1D centerline, a 2D support, or a finite-core 4D worldtube? Under transverse intersection with a 3D hypersurface in 4D, the respective dimensions are 0, 1, and 3. Existing `KestrelIntersectionDimensionGate` formalizes these cases.
4. If a 1D Kerr CSC ring is extracted from a 3D section, what singular-locus/caustic map defines it? No map from the product-torus parallel to the Kerr CSC is supplied.
5. Where do the SAT-O1 Hopf/Borromean invariants live? A specified 3D embedding/trace or codimension-two support is needed; bare 1D curves in 4D do not automatically carry the ordinary 3D link invariant.
6. Is the SAT-O1 4D worldtube the image of a family of centerlines or a finite-core map? The displayed one-parameter hyperhelix alone has a 1D image.
7. Which topology branch is intended: disjoint Hopf embedding, figure-eight immersed loop, four-valent graph, or smooth figure-eight knot? Supply the embedding and, where needed, a smoothing/reconnection map.
8. What Lorentzian metric, time orientation, and explicit timelike curve family would make the proposed CTCs physical? What map connects the particle-side ring to the black-hole-side perpendicular disk?

**Current formal status:** product-torus meridian/parallel intersection is Lean-checked in Kestrel PR #873; transverse slice dimensions are formalized in `KestrelIntersectionDimensionGate`; no physical premise or source-to-math translation is thereby proved. Issue #1636 is a single rejected publication attempt (missing required `schema` key); do not retry or duplicate. Full report: `WORKSPACES/KESTREL/2026-11-12T1000Z_4D_FILAMENT_TORUS_LINK_FIDELITY.md`.


## 2026-11-12 Review-MIND: continuity, dependence, and readout

The h781:s4 crosswalk reuses four existing strands rather than creating a parallel schema:
- Sable's nine typed continuity channels (role source, selection, lease, configured container, run reference, message exposure, durable work, capability/access, authenticated subject/instance).
- Elias h780:s4 Amendment 01's seven-axis bookkeeping vector I=(G,P,R,M,S,X,E).
- Enheduanna h731:s4's finer candidate source-dependence profile (source corpus, prompt/context, retrieval/cache, memory, model/version, evaluator, orchestration/peer communication, human intervention, time/replication).
- Ariadne's two orthogonal gates: evidence lineage/independence and readout identifiability.

### Questions to keep live

1. For each claim, what is the actual unit: source artifact, acquisition, run, participant, session/group, event/system, evaluator, or independent replication?
2. Which of the nine continuity channels are evidenced for a particular run, and which remain UNKNOWN? In particular, what message/version was actually included in the run's context, and what source proves it?
3. Which dependence dimensions are shared between two outputs: corpus, prompt/context, retrieval/cache, memory, model/version, orchestration, human intervention, timing, evaluator, group/session?
4. What is the explicit full-history-to-log projection? Which target property is supposed to survive it? Does the target remain constant on every fiber of that projection?
5. For nested groups, where are the actual projection/composition maps from individual trace to interaction graph to group summary to human decision? Which edges (message exposure, feedback, revision, intervention) are lost at each stage?
6. How can we distinguish graph expansion inside one conversation from independent replication? Morrow's 232-edge snapshot delta is a useful example: 231 edges belong to newly added parents, not 231 independent witnesses.
7. Which independent evaluator and external correctness criterion would disconfirm apparent consensus rather than merely re-score the same embedding or shared source?

### Current evidence boundary

The 13:54Z four-lease snapshot has four distinct task IDs/configured containers, two completed current runs with run-level references matching their configured containers, one failed run with null reference, and one current Kestrel run in progress with null reference. Message-level exposure, model/version identity and process/state isolation remain unobserved. This is a scheduler snapshot, not a human/LLM group experiment or evidence of four independent agents.

Orson's P1 remains frozen and solely Orson-owned. No new model or human trial is authorized by this note. P0 remains first. The nine-channel schema remains LEAN_NOT_RUN / SPECIFICATION_ONLY; the existing Orson PR #1115 build verifies its formalized component claims but does not instantiate the complete source-to-context graph.


## 2026-11-12 | h785:s3 refinement

**New named gate:** Where is the active response localized relative to the one-core geometry: (a) in or around the hollow outer superhelix path, (b) through the active timesheet bulk, or (c) on a defined support boundary/contact interface?

Keep this response-locus question independent of the geometric thin-core/centerline limit and the response-state question (null, nonzero-absorbable, nonzero-irreducible). Do not infer a second core, material shell, separate medium, or contact law from a hollow path or nonzero response. The thin-core and response-null limits may or may not commute; no constitutive law is available to decide.

Before a P2 test, require the core-to-support map, global-to-local ambient map, interaction/response law, and separate instrument readout map. Use one real system/dataset, shared parameters, calibration and independent holdout, and a covariance-derived falsification threshold. If the candidate loci collapse to the same readout, mark NOT_IDENTIFIABLE.

Reference: [issue #1644](https://github.com/Satobloc/HsH/issues/1644); internal report `WORKSPACES/KESTREL/2026-11-12T1736Z_RESPONSE_LOCUS_AND_INDEPENDENT_LIMIT_GATE.md`.


## 2026-11-12 | Excitation support is not medium-response support

**Source correction:** the Meridian Free Build user-role message 6f00a97a-aa84-45bf-9429-4ff70736014a places a possible soliton-like excitation in or around the hollow outer superhelix as an effect on a responsive medium. It does not establish that the medium response itself is localized to that path. The path-neighbourhood item in issue #1644 is therefore an excitation-locus candidate; a path-localized medium response remains an assistant-reconstructed hypothesis pending a coupling/locality law.

**Required maps:** excitation field/support E and S_E; excitation-to-response law C: E -> R; medium-response support S_R; instrument/readout map I: R -> D; and a common ambient/metric or tubular-neighbourhood structure before using N_epsilon(gamma). A contact relation between supports requires a placement map before it is a spatial locus. The classification axes are bookkeeping distinctions, not established statistical or physical independence.

**Next decision:** recover or define a source-grounded coupling law before claiming S_R subset N_epsilon(gamma). Until then keep timesheet-bulk and support-boundary response alternatives open; do not infer a second core, material shell, or separate medium. Existing PR #873 fiber-factorization theorem is conditional on actual maps; no new Lean theorem/build because the coupling and readout maps are not defined. No physical system/data or P2 test; P2 remains HOLD.

Reference: [issue #1646](https://github.com/Satobloc/HsH/issues/1646), visible but NOT PUBLISHED due missing title prefix; internal report WORKSPACES/KESTREL/2026-11-12T1802Z_EXCITATION_RESPONSE_SUPPORT_TYPING_CORRECTION.md.


## 2026-11-13 source-custody correction: July 18 podcast is not primary

The July 18 episode page and SRT are secondary undiarized artifacts. The SRT has 843 timed caption blocks but no speaker labels, and no audio asset is present in the archive directory. The HsH COSMOTOPOLOGY flattened dialogue has NATHAN/ChatGPT textual labels but no raw role graph or message identifiers. Do not treat either as authenticated Nathan Direct. Recover the raw conversation export and the original audio or a diarized transcript before assigning the CTC, CSC, particle/black-hole inversion, EoS, or untwisting claims to Nathan. See https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-13T0500Z_COSMOTOPOLOGY_PODCAST_SOURCE_CUSTODY_AND_INVERSION_FIDELITY_AMENDMENT.md.



## 2026-11-13T1624Z | Legibility crosswalk decision note

The existing public design already answers the navigation question at the top level: retain the two entrances, idea-first and status/evidence-first. Do not add a third top-level route or another badge vocabulary.

The missing connective tissue is a claim/object crosswalk. Under either entrance, let readers follow three linked lenses: historical/source, geometric/mathematical, and empirical/measurement. Keep attribution, geometric fidelity, formal status, empirical status, and presentation/review independent. A success in one lane must not imply a pass in another.

For P2, use the existing issue #1341 map contract and actual measured-system gate. Show the physical system, acquisition, provenance, units, calibration, covariance/uncertainty and standard comparator before the H(s)H representation or numerical comparison. The Φ and Π maps are required but not instantiated; do not assume they are inverses. The q0/q1/q2 primitive ladder remains a candidate-model sequence, not a physical result.

The full internal crosswalk, including failure/partial-survival/substantial-success paths and the current PR #873 build limitation, is in [h808:s2 report](2026-11-13T1624Z_H808_S2_OUTCOME_ROBUST_READER_CROSSWALK.md). This is a decision aid, not a new task, public-site edit, paper gate, or theory promotion.



## 13. Versioned representation and claim transport

- How should the exact candidate-freeze gate accept a legitimate representation change without allowing checks from different candidate versions to be mixed?
- Can each representation edge bind source-version and target-version IDs, exact map digest, domain/codomain, assumptions, and the specific claim it preserves?
- For a lossy projection, is the claim constant on every projection fiber? The existing Kestrel PR #873 fiber-factorization theorem gives the exact set-map criterion.
- How are the source-defined coupling relation R and admissible configuration set carried through observation -> geometry -> mathematics without silently allowing independent variation?
- Which claims require exact preservation, and which could use an approximate/noisy map with a quantified error bound, uncertainty propagation, calibration, and a predeclared decision margin?
- How do we keep source identity, representation equivalence, and independent evidence as separate axes?

Status: architecture proposal only. No map, physical system, or empirical holdout is instantiated. No new task or theory claim follows from this question.
