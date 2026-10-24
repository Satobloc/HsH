# Standard Physics Master Map — Project Charter

**Date:** 2026-10-24  
**Owner:** Janus / Common  
**Status:** ACTIVE BUILD TARGET  
**Purpose:** construct a compact but due-diligent map of standard, historical, alternative, and unification physics so SAT/H(s)H work can be compared against the actual physics landscape rather than against a simplified textbook caricature.

## 1. Deliverable

Build an **"all of physics on one chalkboard"** map in the order physics is ordinarily understood and taught before attempting deep namespace reconciliation.

### Stage A — conventional floor plan
First construct the standard schematic understanding of physics:
- what the major fields/sectors are;
- which domains they are normally said to govern;
- which theories historically grew into or connect to others;
- where textbooks/reviews say the bridges, limits, overlaps and discontinuities are;
- how modern physics understands increasing interconnection among formerly separated sectors.

At this stage, take physics largely at its own word. Do not begin by atomizing every coefficient or resolving every symbol collision. The point is to recover the **conventional architecture** accurately enough that later mathematical structure can be compared against it.

### Stage B — local plumbing
Only after the floor plan is usable, pick a local object/equation and follow its connections in two independent directions:

1. **Mathematical-local track** — which equations, operators, approximations and effective descriptions are directly derived from, reduce to, couple to, or are standardly expected to connect with the selected equation/object?
2. **Observational-local track** — where does the corresponding physical entity/process actually occur in nature, laboratory systems, materials, astrophysics, chemistry, biology, geophysics, sedimentology and other emergent regimes? Where is its influence calculable, negligible, screened, averaged away, unresolved, impractical to propagate, or replaced by a more useful effective description?

This local traversal is how the detailed namespace/object ledger is populated. The ledger follows the map; it does not precede it.

### Stage C — comparison of architecture with mathematics
After enough local traversals exist, ask whether the actual mathematical dependency graph overlaps, branches and disconnects in the same places the conventional conceptual map led us to expect.

The board is therefore initially a floor plan, then gradually becomes an audited structural map.

## 2. Scope

Include, at minimum:

- classical kinematics and dynamics;
- variational mechanics;
- Hamiltonian / symplectic mechanics;
- continuum mechanics, elasticity, fluid mechanics, Navier–Stokes;
- thermodynamics and statistical mechanics;
- optics and wave mechanics;
- Maxwell electrodynamics;
- special relativity;
- general relativity and major equivalent/near-equivalent formulations;
- quantum mechanics;
- relativistic quantum mechanics;
- quantum field theory;
- QED;
- Yang–Mills theory;
- electroweak theory;
- QCD;
- the Standard Model;
- nuclear / effective theories where structurally central;
- condensed-matter / many-body formalisms that supply foundational machinery;
- cosmology;
- quantum gravity and unification programmes;
- historically respectable alternative / abandoned / underdeveloped branches;
- major conceptual precursors and alternative geometrizations back through Kelvin, Hinton, and earlier classical foundations as needed.

The inclusion rule is not "currently accepted." It is:

> Has this theory/formalism ever been a serious attempt to organize, explain, reformulate, unify, or calculate a substantial part of the same empirical evidence pile?

## 3. Node types

Every map item is typed.

### THEORY
A physical framework making claims about a domain.

### FORMALISM
A mathematical representation that may support multiple theories.

### EQUATION / ACTION / HAMILTONIAN
A central calculational object.

### PRINCIPLE / CONSTRAINT
Examples: least action, equivalence principle, gauge invariance, Lorentz covariance, conservation law.

### OBJECT / STATE SPACE
Examples: phase space, Hilbert space, spacetime manifold, fiber bundle, worldline, field, density matrix.

### LIMIT / BRIDGE
Known reduction or correspondence relation between theories.

### HISTORICAL BRANCH
A superseded, alternative, unfinished, or underdeveloped programme with serious historical standing.

## 4. Minimum card for each theory

Each theory/formalism card should contain:

- canonical name;
- date range / key figures;
- domain;
- primitive objects;
- state space / geometry;
- central action or Lagrangian, where meaningful;
- central Hamiltonian, where meaningful;
- central field/evolution equations;
- symmetry group(s);
- conserved quantities;
- principal observables;
- free parameters / empirical inputs;
- known limiting cases;
- known equivalences / reformulations;
- main empirical successes;
- known failures / incomplete domains;
- historical descendants / competitors;
- primary or authoritative review sources;
- status: current standard / active alternative / historical / superseded / niche / speculative but serious.

Not every framework naturally has a Lagrangian or Hamiltonian. Do not force one where it is not central.

## 5. Edge types: interconnectedness

Every connection between nodes must be typed by epistemic strength.

### K — KNOWN
Mathematically demonstrated equivalence, limiting case, derivation, duality, reformulation, or empirically established dependency.

### R — REPORTED
A relationship explicitly claimed in serious literature but not established as a general equivalence.

### S — SUSPECTED
A live research conjecture, structural analogy, or plausible bridge with technical motivation.

### A — ASSERTED
A claim made by a programme or author that requires independent checking.

Edges also receive a relation label, e.g.:

- LIMIT OF
- LOW-ENERGY LIMIT
- NONRELATIVISTIC LIMIT
- CLASSICAL LIMIT
- QUANTIZATION OF
- GEOMETRIZATION OF
- GAUGE EXTENSION OF
- DUAL TO
- EFFECTIVE THEORY OF
- REFORMULATION OF
- GENERALIZES
- INSPIRED
- COMPETES WITH
- HISTORICAL PRECURSOR
- SHARES MATHEMATICAL STRUCTURE

Do not encode similarity as equivalence.

## 6. First-pass backbone

The initial board should contain at least these trunks.

### Classical / continuum trunk
Newton / Euler / Lagrange / Hamilton / Hamilton–Jacobi
→ continuum mechanics
→ Euler fluids
→ Navier–Stokes
→ elasticity / rods / vortices / Kelvin circulation and vortex-atom programme

### Electromagnetic / relativity trunk
Coulomb / Ampère / Faraday
→ Maxwell
→ Lorentz / Poincaré
→ Minkowski
→ special relativity
→ Einstein GR
→ Einstein–Hilbert action
→ geodesic / curvature formulations

Branches:
- teleparallel gravity
- Einstein–Cartan
- metric-affine / Poincaré gauge gravity
- Weyl geometry
- scalar–tensor gravity
- Einstein-Æther / preferred-foliation models
- modified gravity families

### Quantum trunk
Planck / Einstein quanta / Bohr
→ de Broglie
→ Heisenberg / Schrödinger
→ Dirac / Klein–Gordon
→ canonical/path-integral quantum mechanics
→ QFT
→ renormalized QED
→ Yang–Mills
→ electroweak + QCD
→ Standard Model

Branches:
- de Broglie–Bohm / pilot-wave
- stochastic / hidden-variable programmes
- Everett / consistent histories / objective-collapse where foundationally relevant
- algebraic and geometric reformulations

### Unification / higher-geometry trunk
Kelvin vortex ideas / geometric atom programmes
Hinton 4D conceptual geometry
Weyl
Kaluza
Klein
Einstein unified-field attempts
Cartan / torsion
→ gauge geometry / fiber-bundle language
→ Yang–Mills
→ GUTs
→ supersymmetry / supergravity
→ strings / M-theory

Parallel / later:
- twistors
- loop quantum gravity
- spin foams
- causal sets
- causal dynamical triangulations
- asymptotic safety
- noncommutative geometry
- induced/emergent gravity
- holography
- amplitudes / modern on-shell programmes

### Cosmology trunk
Newtonian cosmology
→ GR cosmology / FLRW
→ Big Bang
→ inflation
→ ΛCDM
with major alternatives / modifications:
steady state, cyclic/ekpyrotic, bouncing models, modified gravity, emergent cosmologies.

## 7. Parallel SAT/H(s)H atlas — NOT an overlay

SAT/H(s)H is **not** to be treated as an annotation layer on top of the standard map.

Build a **separate, equally explicit SAT/H(s)H map** alongside the standard/historical physics map.

The two maps may share:
- common empirical targets;
- common mathematical objects where identity is established;
- translation edges;
- comparison edges;
- source-backed claims of equivalence or non-equivalence.

But neither map is privileged as the other's internal ontology.

The standard/historical map records what those theories say their objects are and how they connect.

The SAT/H(s)H map records what SAT/H(s)H says its own objects are and which things SAT/H(s)H itself treats as equivalent, distinct, approximate, dual, emergent, projected, or unresolved, **even when that classification differs from standard interpretation**.

Comparison happens through typed cross-map edges, never by silently replacing one map's identity structure with the other's.

The control question is therefore two-sided:
- what does standard / historical physics claim?
- what does SAT/H(s)H claim?
- what is genuinely the same mathematical object?
- what is only translated, analogous, approximately equivalent, or disputed?

## 8. Search and source protocol

Primary archive search system remains **Mersearch** or a purpose-built Mersearch derivative.

For standard physics:
1. search HSH_RESOURCES/toolkits first for already archived reviews, textbooks, lecture notes, and historical sources;
2. use authoritative external sources to fill gaps;
3. prefer review articles / textbooks / primary historical papers over tertiary summaries;
4. preserve the exact canonical equation rather than a popularized paraphrase;
5. keep historical form and modern standardized form when they differ materially.

## 9. Existing maps to reuse rather than reinvent

Existing external maps can provide scaffolding, but none yet located combines all required features.

Useful starting structures:
- Quanta's *Theories of Everything, Mapped*: strong network map of frontier fundamental-physics problems and proposed solutions.
- Standard Model lecture "Theory Framework" timelines: useful historical dependency skeleton from Newton/Maxwell through relativity, QFT, Yang–Mills, Standard Model, GUTs, SUSY, strings.
- historical unified-field reviews: useful for Weyl/Kaluza/Klein/Einstein/Cartan-era branch recovery.

These should be mined for structure, not copied as authority.

## 10. Build order

### Pass 1 — Backbone
~50–100 nodes. Enough to see the whole board.

### Pass 2 — Central equations
Attach the defining action / Lagrangian / Hamiltonian / evolution equations and limits.

### Pass 3 — Historical alternatives
Add respectable dead ends, alternative representations, and underdeveloped branches.

### Pass 4 — Edge audit
Label every relation K/R/S/A.

### Pass 5 — SAT/H(s)H overlay
Only after the independent physics board is coherent.

### Pass 6 — Calculation routing
For each sector, identify the shortest standard route from initial conditions to observables. This becomes the control route against which native SAT/H(s)H and hybrid routes are benchmarked.

## 11. Success criterion

A worker facing a physical problem should be able to use the map to answer:

1. What standard theory owns this regime?
2. What are its central equations?
3. What assumptions and primitives does it require?
4. What alternative formulations exist?
5. What historical alternatives attacked the same evidence?
6. What known bridges connect this sector to others?
7. What is the simplest accepted route to the observable?
8. Which connections are facts, which are literature claims, and which are conjectures?

That is the control map against which the SAT/H(s)H map will be tested.


## 12. Namespace-control foundation

This map is also the top-level routing structure for the project's namespace-control ledger.

The unit of registration is **not the printed symbol**. The unit is the **qualified mathematical/physical object occurrence**.

Every distinct quantity, coefficient, operator, tensor, field, map, functional, state, parameter, constant, index family, transformation, manifold, action term, Hamiltonian term, boundary condition, and other reusable object receives a globally unique project ID before cross-equation equivalence is asserted.

A single glyph such as `m`, `R`, `T`, `α`, `ψ`, `H`, `G`, or `θ` may therefore correspond to many registered objects.

Conversely, one registered object may have many historical or source-faithful symbols.

### Identity classes between registered objects

Do not jump directly from "looks the same" to "same object."

Use typed identity/relationship states:

- `SAME_GLYPH` — printed notation coincides; no semantic claim.
- `ALIASED_NOTATION` — transcription/notation variants of one source object.
- `SAME_DEFINITION` — definitions coincide under stated convention.
- `SAME_OBJECT` — object identity established across contexts.
- `EQUIVALENT_UNDER` — mathematically equivalent only under explicit assumptions/transformation.
- `TRANSFORMABLE_TO` — a map exists; identity is not implied.
- `LIMIT_OF` — relation holds in a specified limiting regime.
- `APPROXIMATES` — controlled or empirical approximation.
- `PHYSICALLY_IDENTIFIED_BY_SOURCE` — a theory/source claims physical identity; independent establishment may be open.
- `POSSIBLY_SAME` — live unresolved identity question.
- `DISTINCT` — explicitly not the same object.
- `CONFLICTING_IDENTIFICATION` — different theories/sources classify the relationship differently.

Each relation carries provenance, assumptions, units, dimensions, frame/signature, invertibility, information loss, epistemic status, and verification/test status.

### Every occurrence matters

The same registered object appearing in multiple equations should point to the same object ID only after the identity is established.

Until then, occurrences remain separately qualified.

This avoids:
- symbol collision;
- accidental parameter sharing;
- copying a coefficient from one regime into another;
- conflating source convention with project convention;
- silently equating equal numerical values;
- mistaking identical functional form for identical mechanism.

### Presentation

Human presentation may use collapsible trees, sector dashboards, dependency graphs, pivot tables, filtered tables, or equation drill-down views.

Machine representation should remain flat enough to query:
- **object table**
- **equation table**
- **occurrence table**
- **edge/identity table**
- **source/provenance table**
- **theory/formalism table**

Views are generated from those records rather than becoming the source of truth.

### Existing controls to extend, not replace

This project must extend:
- `WORKSPACES/COMMON/NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`
- `WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md`
- `WORKSPACES/COMMON/terminology/TOOLBOX_NAMESPACE_LEDGER.md`
- `WORKSPACES/COMMON/FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md`

The new master map becomes their large-scale routing architecture.


## 13. Representation-gap map

A central output is a map of **representation scale and practical calculational handoff**.

For any physical chain, distinguish:

- **ontic/presence continuity:** lower-level physics is still present in the system;
- **calculational relevance:** lower-level variables may cease to be useful for the target observable;
- **effective handoff:** a higher-level description becomes the standard working representation;
- **derivable in principle:** a connection is accepted or formally available in principle;
- **computationally impractical:** direct derivation exists conceptually but is intractable or wildly inefficient;
- **unknown bridge:** no accepted derivational route is presently known;
- **negligible/screened/coarse-grained:** effect survives formally but is too small or averaged out for the regime;
- **emergent closure:** higher-level equations become approximately autonomous over a regime.

The map should therefore be able to trace questions such as:

- How does an electron described in quantum field theory enter atomic, chemical, material, biological, geological or atmospheric systems?
- Where does QCD hand off to nuclear physics, atomic physics, chemistry, continuum mechanics and eventually macroscopic pattern formation?
- Why is it legitimate or illegitimate to stop carrying lower-level variables at each transition?
- Which thresholds make the next level of description appropriate?
- Which supposedly continuous chains contain genuine mathematical gaps rather than merely computational inconvenience?

The goal is not to derive every macroscopic pattern directly from microscopic theory. It is to locate and characterize the **gulf between known physical presence and useful level of representation**.

## 14. Locality rule

Do not leap across the map by conceptual association.

Start from one equation/object and follow only immediate or standardly expected neighbors:
- direct derivation;
- coupling term;
- limit;
- effective theory;
- constitutive relation;
- standard approximation;
- experimentally established dependency;
- accepted scale transition.

Repeat recursively.

This produces a path whose uncertainties and handoffs are visible rather than hidden by a grand narrative.
