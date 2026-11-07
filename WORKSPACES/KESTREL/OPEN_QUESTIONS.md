# KESTREL — OPEN QUESTIONS

Last updated: 2026-09-21

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
