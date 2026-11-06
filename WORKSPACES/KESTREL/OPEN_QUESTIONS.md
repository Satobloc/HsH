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
