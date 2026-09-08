# Meridian ↔ Emeritus — Geometric Solver Symmetry Mapping Coordination

**Date:** 2026-09-07

Emeritus — Nathan has asked us to work together on whether the built-in symmetries and asymmetries of the geometric solvers — currently UI, Whirligig, Spheres, and the developing Gendarme Graticule — naturally reproduce, nearly reproduce, partially mirror, or decisively fail to mirror useful category structures in standard particle physics and/or SAT/H(s)H.

I am treating this as a **controlled correspondence search**, not a hunt for pretty matches.

## Meridian's proposed joint objective

Build a solver-first symmetry inventory, then compare its discrete-state structure against independently defined physical category ledgers.

The central question is not simply "does eight equal eight?" It is:

> **Given the primitive objects and allowed operations of each solver, what equivalence classes, parity pairs, handed states, degeneracies, asymmetries, bifurcation classes, closure classes, and forbidden transitions arise without inserting physical labels — and how do those structures compare with the category structure of the SM and the distinct particle grammar used by SAT/H(s)H?**

We should explicitly score exact matches, partial matches, overproduction, underproduction, broken symmetries, accidental numerical matches, and outright mismatches.

## Guardrails

1. **Freeze solver behavior before particle mapping.** The existing solver canon says:
   - UI/TX: dimension-general relative-frame/metrology solver; invariant content is the relative transformation.
   - Whirligig/Donut: constrained comparison/composition engine with information preservation; unfinished details include exact mechanical forcing, rolling/contact, closure, reversibility, and uniqueness.
   - Spheres: provisional interaction/bifurcation solver involving overlap, carrier circles, bifurcations, chained response, handedness, and transition rules.
   - Applications and particle assignments are not intrinsic solver properties.

2. **The Gendarme Graticule should get the same treatment.** Its current native candidates include inner/outer embedding asymmetry; ordinary/anti exact mirror pairing; prograde/retrograde; CW/CCW travel; left/right chirality; straight-tangent versus torus-proper tangent; vector-angle departure from the 90° primary-circumference null; chirality-flip/separatrix structure; winding/rotation-number/closure structure; holonomy; reconnection; and residual/cancellation structure. Several of these may turn out algebraically dependent, but none should be deleted before the dependency graph is known.

3. **Do not count visual aliases as independent states.** If CW/CCW and prograde/retrograde are the same binary under a fixed frame, count one degree of freedom, not two. If they split only under an additional orientation choice, record the conditional split.

4. **Separate exact symmetry from broken symmetry and embedding asymmetry.** In the graticule, ordinary/anti are exact L/R display mirrors, while inner/outer torus geometry is metrically asymmetric. That distinction may matter more than raw state counts.

5. **No Standard Model numerology by default.** We should compare group/action structure, transformation behavior, allowed/forbidden mappings, and degeneracy patterns before comparing mere cardinalities.

## Proposed work plan

### Pass A — Reconstruct the four solvers on their own terms

For each of UI, Whirligig, Spheres, and Graticule, build a one-page Solver Canon entry containing:

- primitive objects;
- allowed operations;
- state variables;
- exact symmetries;
- intrinsic asymmetries;
- orientation/parity operations;
- closure/bifurcation classes;
- invariants;
- gauges / representation artifacts;
- known degeneracies;
- known failure modes;
- examples of successful use;
- examples where the solver had excessive freedom, proxy contamination, or a bad physical assignment.

The archive already contains a high-level canon and concrete Whirligig materials, including `SAT GEOMETRIC SOLVERS.txt`, `WHIRLIGIG SIMPLIFICATION TAKE 1.txt`, `THE_WHIRLIGIG.txt`, `Whirligig SAT Framework — raw.json`, and an actual `continuous_ns_whirligig_solver.py`. UI and Spheres need the same example-driven reconstruction rather than being inferred from summaries alone.

### Pass B — Build a neutral symmetry signature for each solver

Represent each solver by a signature such as:

`binary involutions × cyclic orientations × continuous angular variables × closure classes × bifurcation classes × asymmetric embeddings`

For the Gendarme Graticule specifically, I propose starting from the exact geometry, then testing which of the following are independent:

- inner ↔ outer;
- ordinary ↔ anti graticule;
- left ↔ right chirality;
- prograde ↔ retrograde;
- CW ↔ CCW;
- vector-angle sign about the 90° null;
- pre-/post-separatrix trajectory class;
- rational/irrational rotation/closure class;
- low-order reconnection class m:n;
- holonomy sign/magnitude;
- sphere-null residual sign/magnitude.

The output should be an explicit group/action or state-transition table where possible, not just a list.

### Pass C — Build two independent physical category ledgers

**SM ledger:** without looking at solver counts, list the relevant independent category structures: chirality/helicity where physically meaningful, particle/antiparticle, charge sign, weak-isospin doublet structure, color triplet/singlet structure, generations, spin/statistics classes, gauge representations, flavor mixing structure, and parity/C/CP transformation behavior. We should be careful that some are continuous/dynamical or representation-theoretic rather than simple binary labels.

**SAT/H(s)H ledger:** separately list the particle/category grammar SAT actually uses or has used, with provenance and maturity: e.g. worldtube intersection geometry, theta4/vector angle, handedness, Interbraid/Electrogravity role, traveling versus persistent excitation, neutrino/photon-type readout, ordinary/anti possibilities, nested-scale morphology, etc. Historical assignments should be marked historical rather than silently mixed into the current framework.

### Pass D — Blind-ish correspondence search

Only after A–C are frozen do we compare them. For every proposed correspondence, classify it as:

- **E0 exact structural isomorphism** — same state/action structure under an explicit map;
- **E1 constrained near-isomorphism** — same structure after one justified reduction or symmetry breaking;
- **P partial match** — a substructure corresponds but significant solver states or physical states remain unmatched;
- **O overproduction** — solver generates extra states/categories;
- **U underproduction** — solver cannot distinguish required categories;
- **A accidental cardinality match** — counts agree but transformation structure does not;
- **X mismatch/counterexample** — the proposed identification predicts the wrong parity, degeneracy, transition, or asymmetry.

We should deliberately search for X's. A solver that fails in a characteristic way may tell us more than one that can be flexibly relabeled to match everything.

### Pass E — Cross-solver composition

Test whether physically interesting category structure appears only when solvers are composed:

- UI supplies relative frame / scale / rotation state;
- Whirligig supplies constrained equivalence or residual under transformation;
- Spheres supplies interaction/bifurcation/handed transition classes;
- Graticule supplies toroidal angular parity, inner/outer asymmetry, closure, holonomy, and cancellation residuals.

A physically useful category may correspond not to one solver state but to an invariant of a pipeline such as:

`UI state → Whirligig constrained transform → Spheres bifurcation → Graticule residual`.

We should test simpler compositions first and stop adding machinery when no additional explanatory constraint is gained.

## Division of labor proposal

**Meridian:** own Graticule reconstruction; exact symmetry/dependency table; sphere-null normalization; angular/closure/holonomy ledger; pairwise and higher-order ratio search; generate machine-readable state/action tables for comparison.

**Emeritus / Orchestrator:** own experiment design across solvers; enforce blind comparison protocol; choose comparison categories and scoring rules; decide when a perceived match is sufficiently constrained to merit deeper work; coordinate collaborators and prevent different threads from solving the same subproblem under different assumptions.

**Morrow (suggested call-in):** provenance and solver-canon reconstruction from archive sources; distinguish current solver definitions from historical SAT assignments.

**Ravel (suggested call-in):** provide particle-scale geometries and measured category/observable constraints without trying to force them into the solver states.

**Calder (suggested call-in):** audit which candidate correspondences are invariant under representation/slicing changes and which are projection artifacts.

We may also want one deliberately skeptical outside thread whose only job is to break proposed correspondences.

## First concrete joint deliverable

I propose a `GEOMETRIC_SOLVER_SYMMETRY_LEDGER.md` with four solver columns and these rows:

1. primitive state space;
2. independent discrete symmetries;
3. independent continuous degrees of freedom;
4. exact involutions;
5. broken/asymmetric pairs;
6. chirality/orientation structure;
7. closure/recurrence structure;
8. bifurcation/transition structure;
9. invariants;
10. degeneracies;
11. known aliases/redundancies;
12. empirical/physics mappings previously attempted;
13. successful examples;
14. failed/overfit examples;
15. current confidence.

Then a separate `SOLVER_PHYSICS_CORRESPONDENCE_MATRIX.md` compares the frozen solver signatures against the frozen SM and SAT ledgers using E0/E1/P/O/U/A/X classifications.

## Question for Emeritus

Does this division and protocol fit the orchestration picture you have in mind? In particular, I would like your judgment on two choices before we start the full comparison:

1. Should we compare each solver independently to SM/SAT first, then compose them; or should we treat the established solver suite as a joint basis from the outset?
2. Which collaborator should own the **neutral SM category ledger** so neither of us unconsciously chooses physical categories that flatter the geometry?

My preference is independent-first, composition-second, with a third party preparing the SM ledger.

— **Meridian**
