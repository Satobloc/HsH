# 2024-2026 Geometry-Type Genealogy: Curve, Worldsheet, Finite-Core Worldtube, Klein Fabric

**Status:** source-fidelity addendum to Kestrel's 2026-10-30 one-core report. This is not a theory promotion, paper submission, physical validation, or CODATA assessment.

**Scope:** recover the most precise direct geometry available across the 2024 moving-slice discussion, the 2025 SAT-O/SAT4D and Blockwave artifacts, and the 2026 finite-core / Klein-Fabric clarifications. Compare the source objects with the historical mathematical translations. Preserve missing maps rather than supplying an attractive substitute.

## Executive result

The archive contains at least four distinct geometric types that have sometimes been called a "filament" or "worldtube":

1. A **one-dimensional curve** \(\gamma\), including the 2024 ideal helix and the 2025 SAT4D parameterized filament.
2. A **two-dimensional worldsheet** represented in the assistant-generated Blockwave material by a conserved two-form current \(J^{\mu\nu}\).
3. A **four-dimensional finite-core region/worldtube** in the 2026 Nathan Direct geometry, whose three-dimensional rendering is described as an intersectional trace.
4. A proposed **global Klein Fabric topology**, whose current adopted definition and map to the local finite-core object have not yet been recovered.

These are not interchangeable names. Under a transverse-intersection hypothesis in a four-dimensional ambient tangent space, their instantaneous intersections with a three-dimensional hypersurface have dimensions \(0\), \(1\), and \(3\), respectively. A moving family of slices adds a further trajectory parameter: the 2024 helix's point intersection can trace a one-dimensional circle over time, even though each instantaneous intersection is a single point.

The 2025 SAT4D draft calls a 1D curve a filament, then defines a worldtube in prose as a 4D volume "swept out" by that filament. It supplies no thickening/family map that constructs the volume. The Blockwave \(J^{\mu\nu}\) is explicitly a 2-form worldsheet current and its own text says a timesheet intersection produces a loop. Neither is the same type as the 2026 finite-core 4D object.

The later user statement that the old reciprocal filament/timesheet model has been superseded by the Klein Fabric is a **supersession signal**, not a definition of the replacement. The earliest located Klein-Fabric prompt is a user question embedded in a NotebookLM export; the elaborate ER-bridge/Möbius-cell answer that follows is assistant speculation. A later Cruller sandbox supplies a more precise mapping-torus candidate, but explicitly does not establish adoption. No map from that global candidate to the local finite-core worldtube has been recovered.

## Source and provenance ledger

### Nathan Direct: 2024 moving-slice geometry

- HsH raw source: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json
- Git blob: 2cea1924266418e19b825b95ae51e6b7cbace7e1
- Conversation ID: 2cea192a7d16b57a27c531ac7c860e42
- Conversation created: 2024-03-22; later archive update: 2026-06-10.
- Relevant direct user nodes:
  - aaa2269b-7eab-4781-9454-647098d6747f (2024-03-22T18:43:51Z): ideal line/plane intersection is one point.
  - aaa2d0b1-017d-453e-b95a-b23915f87d32 (2024-03-22T19:10:55Z): as the plane moves, the helix intersection point traces a circle; speed depends on pitch and slice rate.
  - aaa2a1cc-e884-4f6a-800f-8afc29ab221a (2024-03-22T19:13:45Z): radius is determined by the helix cross-section, not pitch.
  - aaa2d58f-3738-44f9-9fcc-d4c054b23c2a (2024-03-22T19:19:12Z): rejects a maximum/minimum-radius interpretation for a perfect helix.
- Read extent: full raw JSON parsed (466 conversation nodes); the geometry-relevant user turns and their immediate assistant responses were inspected. This is a primary source for the 2024 construction, not a complete audit of every conversation branch.

The direct construction is deliberately elementary: a 1D line/helix and a 2D plane in a 3D toy ambient space. At each fixed slice, the intersection is a point. As the slice parameter changes, the sequence of points can trace a circle. The user explicitly separates orbit radius from pitch-controlled angular rate. The assistant's initial suggestion of a spiral pattern and later maximum/minimum-radius explanation were corrected by the user.

### Historical SAT4D draft

- Source: SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt
- Git blob: 2a79fe25018cce7e99a2c33786d88b0551db6ae7
- File header: June 2025; header author Nathan McKnight.
- Git upload commit: 0821d8edda98430e1c99972e193334c1cfb5d87c, 2025-10-27T23:52:03Z.
- The header attribution is recorded; line-level authorship of every embedded equation is not independently authenticated.

Verbatim geometric definitions and equations (source lines 144-160, 168-175):

~~~
γ : R → R^(3,1)

γ^μ(λ) = (λ,
          A_x sin(k_x λ + φ_x),
          A_y sin(k_y λ + φ_y),
          A_z sin(k_z λ + φ_z))

v^μ(λ) = dγ^μ/dλ

S[γ] = ∫ dλ L(γ^μ, v^μ)
L = (1/2) m v^μ v_μ - V_tension(γ)
~~~

The same document defines a **worldtube** in prose as "The 4D volume swept out by the vibrating filament" (lines 147-148). The written γ, however, is a 1D map. The draft does not define the extra parameters, core cross-section, family of curves, or thickening map needed to turn that curve into a 4D volume.

The displayed three-sine expression is a general multi-frequency curve. It does not, by itself, impose a constant-radius helix: the amplitudes, frequencies, and phases are independent. A uniform constant-radius helix would require additional constraints on the transverse modes and an axial progression. Those constraints are not stated in this formula.

### SAT4D glossary and directives

- SAT 4D Theory Work/SAT4D_4.txt, blob efc88f4523b2fd616e64898737c2aa45e5f39b9a; source date July 2025; author line "SATO.4D Coherence Project"; archived 2026-09-04.
- SAT 4D Theory Work/SAT4D_6.txt, blob 167136310cdf33ca8f986f33634692314c1a0946; source date July 2025; no author line; archived 2026-09-04.

The glossary gives:

~~~
γ : R → M
v^μ = dγ^μ/dλ
Σ_t = propagating 3D wavefront
S_μν = ∇_μ u_ν + ∇_ν u_μ
ℓ_f = (2A/T)^(1/3)
m_eff = T ℓ_f / (c^2 Q)
~~~

It first says M has no metric, gauge field, or connection a priori (line 19), then defines a normal vector u^μ and a covariant derivative ∇_μ (lines 23-26). A normal requires a metric or equivalent structure; ∇ requires a connection. Those prerequisites are not supplied in the glossary.

The official directives say SAT.O has a 4D manifold populated by **1D filaments**, and that derived behavior comes from filament geometry and intersection with a propagating 3D wavefront Σ_t (lines 16-20). That is a 1D/3D intersection prescription. It does not itself construct the later 4D finite-core worldtube.

The historical ℓ_f, T, A, and Q definitions must not be silently carried into the current H(s)H notation. Current direct corrections distinguish coil radius from tube thickness and use the later Q convention. No mass-law or CODATA comparison is performed in this geometry-fidelity phase.

### Historical SAT4D covariant-field scaffold

- Source: SAT 4D Theory Work/SAT4D_Covariant_Field_Equations.tex
- Blob: c2493431c743ab14e677aae0a18bce7fb32880da
- Header: June 2025; author line "SAT Framework Team"; archived 2026-09-04.

Verbatim selected equations:

~~~
g_μν(x) = <v_μ v_ν>_(F(x))

F_μν = ∂_μ A_ν - ∂_ν A_μ

J^μ(x) = e ψ̄(x) γ^μ ψ(x)

<R_μν - (1/2) g_μν R> = κ <E_vib(x), L_link(x)>
~~~

The first equation defines a covariant metric from lower-index velocities v_μ, but lowering the index ordinarily requires a metric. If this equation is intended to generate the metric, the construction is circular unless an independent background inner product or a different typed definition is supplied. The right-hand side of the displayed Einstein equation is not yet a specified symmetric rank-2 stress-energy tensor; the ordered pair inside angle brackets is not a typed tensor prescription.

The J^μ above is a **vector Dirac current**. It is not the assistant-generated Blockwave J^μν two-form. No map between them is supplied.

### Historical Blockwave one-action

- Raw conversation blob: 1f074cc67057ae9df1e92bab45e8ba34c96b0d77.
- Assistant action message: 121d607d-53e7-4b5a-8a7a-75d7e09deb3d, 2025-10-19T12:29:46Z.
- Later file artifact: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt, blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, uploaded 2026-10-08.
- The user's later re-paste of an action for review is not independent authorship of the assistant-origin J^μν notation.

The file defines J^μν as a conserved two-form "filament worldsheet" current, distributional on physical filaments:

~~~
∇_μ J^μν = 0
J^μν = (1/2) ε^μνρσ ∇_ρ B_σ
~~~

It also gives a potential representation. Its own trace prescription says to choose a timesheet Σ, intersect the worldsheets encoded by J, and obtain closed loops γ (file lines 96-110 and 140). This is a 2D-worldsheet / 3D-timesheet construction whose generic instantaneous intersection is 1D. It is not a 3D trace of a 4D finite-core region.

The uploaded 🧱BLOCKWAVE.txt action artifact contains transcription defects, including malformed index expressions in the u-elasticity term, the unit-norm constraint, and the mixing term. The raw assistant message is the better source for the original action text; the file remains a separate archival artifact and must not be silently treated as a clean canonical equation.

The same assistant-generated material defines

~~~
F_μν(θ) = ∇_[μ A_ν](θ)
A_μ = α_* ∇_μ θ
~~~

For a smooth single-valued scalar θ and a torsion-free connection, this gives F=0 locally. The assistant itself noticed this in the 2025-10-19 follow-up. A nonzero global holonomy would require additional bundle, patch, or defect data not supplied by this local exact-gradient definition.

### Separate Blockwave Phase 0 artifact

- Source: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE EXTENSION .txt
- Blob: d870e30ddfe7baf181981f78d8d2c3be5aedb3ce
- Uploaded 2026-10-08; no source date or author statement in the file.

This is a separate u^μ, θ-only Lorentzian model, with a different core action and no J^μν current in its stated field list:

~~~
L_core =
  +(1/2) ∇_μ θ ∇^μ θ
  - μ^2 cos(3 θ)
  + λ Φ^2
  + α P^μρ P^νσ ∇_μ u_ν ∇_ρ u_σ
  + β f(θ) ∇_μ u^μ
  + ξ (u^μ u_μ + 1)
~~~

This is not the same action as the one-action artifact. Treat the two as separate historical variants, not one canonical Blockwave model. The prior Calder sign/source audit is not repeated here.

### Nathan Direct: 2026 finite-core geometry and current representation

- Meridian Free Build raw blob: 7af1561b321f4d9364da5eb111df689efc652827, 2026-10-09.
- Meridian Minkowski Ring Analysis raw blob: 56a84cb85d5c386efa4ea11d322d11e95e2c7703, 2026-10-20 to 2026-10-21.
- Existing Kestrel public report: kestrel-one-core-worldtube-inertia-20261030t1800z-001.md (issue #1108).

The 2026-10-09 direct geometry states that the 3D rendering is an **intersectional trace of a 4D finite-core filament/worldtube**. The one-core description, hollow larger coil, absence of a separate physical carrier, and distinction between the core and its visible trace are recorded in the existing Kestrel report; this addendum does not duplicate that report.

The 2026-10-20 user discussion distinguishes an instantaneous 3D slice from the evolving 4D structure. The assistant's candidate parameterization

~~~
X(w, Ω) = (w - d(w, Ω)) n(Ω)
~~~

is an assistant reconstruction, not a user-authored equation and not an accepted definition of the finite-core tube.

The 2026-10-21 user message explicitly records the working normalization as 'cw=t', balanced expansion/contraction, Forest Normalization, and positive Euclidean native metric '(++++)'. The same message says not to invent the meaning of w or silently equate it with an unrelated frequency. The current BEDROCK keeps induced Lorentzian metrics separate from the positive Euclidean native metric and identifies Minkowski kinematics as the default exact control. Therefore the historical SAT4D use of R^(3,1) cannot be transplanted as the current native metric without an explicit map.

The older 'w=ct' translation used by the existing WorldtubeInertiaCoordinate module is not interchangeable with the later literal 'cw=t' normalization. The module's algebra remains conditional on its declared coordinate substitution; its physical and notation-level applicability to the current normalization is unresolved. Do not silently repair the notation.

A 2026-10-21 user-authored annotation inside a mixed-source message says the older reciprocal filament/timesheet model has been superseded by the Klein Fabric model. This is a supersession signal only. It does not provide the current Klein Fabric definition.

### Klein Fabric source trail

- SAT PRE-H(s)H TIGHTENING.txt, SAT archive blob 054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e, uploaded 2026-09-04. The file is a NotebookLM export with 15 sources; the user question appears at line 4965. Its underlying prompt timestamp is unresolved.
- The embedded user question asks how a Klein bottle might become a pervasive "Klein fabric" of wormholes with Möbius connections. This is a question, not a formal definition.
- The assistant answer immediately following it proposes Möbius ER bridges, chirality flips, Klein-bottle cells tiled through a 4D plane, image charges, and a condensate-wall picture. These are assistant-generated conjectures, not direct user geometry and not a derived construction.
- FIRST_RUN_RECON_2026-09-30.md (blob f4613d81ceb738346bc8a84f3bc233b07daafde1) explicitly warns against inferring external influence or priority from the notebook export.
- SANDBOX_2026-10-20_CRULLER_FIRST_GLOBAL_TOPOLOGY.md (blob b85f37e4137c15ff8b44d8179fc162e37afa86b3) is a later assistant sandbox, not adopted as HsH cosmology. It proposes a mapping torus:

~~~
M_Q = (S^3 × [0,L]) / ((n,L) ~ (Q n,0)),
Q ∈ O(4)
~~~

For Q in SO(4), the mapping torus is orientable; an orientation-reversing identification requires det(Q)=-1. This is a mathematically more precise candidate than "tile the 4D plane with Klein-bottle cells", but it remains an assistant proposal. No Nathan Direct acceptance of this specific Q, no global identification data, and no map from M_Q to the local finite-core worldtube were recovered.

## Geometry diagram and type map

~~~
2024 moving-slice toy geometry
  curve C^1 (line / helix)  ∩  moving plane P^2(t)  ->  point p^0(t)
  t ↦ p(t) is a 1D trajectory (circle for the ideal helix)

2025 SAT4D historical construction
  curve γ^1 ⊂ M^4  ∩  timesheet Σ^3_t  ->  point p^0_t
  separate prose claim: "worldtube" W^4, but no thickening/family map
  Φ_core : (curve, core parameters) -> W^4 is missing

2025 Blockwave assistant construction
  worldsheet W^2 (support of J^μν)  ∩  timesheet Σ^3_t  ->  loop γ^1_t

2026 Nathan Direct finite-core construction
  finite-core region W^4_core ⊂ M^4  ∩  slice Σ^3_t  ->  3D trace I^3_t
  valid as an intersection claim only if W^4_core is full-dimensional
  and the intersection/projection conditions are specified

Global Klein Fabric
  M_K  --?-->  W^4_core, Σ^3_t, observed 3D trace
  global topology and all connecting maps remain unresolved
~~~

A projection can change apparent dimension; an intersection has its own dimension rule. They must not be used interchangeably. If the 2026 "3D trace" is a projection rather than a literal transverse intersection, the tangent-space dimension theorem below does not settle it.

## Corrected mathematical statements, kept separate from the historical equations

### Helix special case

The 2024 direct constraint can be represented by the following assistant reconstruction:

~~~
r(λ) = (a cos(kλ), a sin(kλ), bλ)
Σ_z0 = {z = z0}
λ = z0/b

p(z0) = (a cos(k z0/b), a sin(k z0/b))
~~~

Its radius is a; its angular rate with respect to slice coordinate z0 is k/b. If the slice advances at speed v_Σ, the angular rate is k v_Σ/b. This is a mathematical reconstruction of the user's radius/pitch distinction, not a source equation or physical measurement.

### Transverse intersection dimension

For tangent subspaces U,W of a finite-dimensional ambient tangent space V, with transversality U+W=V,

~~~
dim(U ∩ W) + dim(V) = dim(U) + dim(W).
~~~

In four dimensions, the conditional cases are:

- 1D worldline + 3D hypersurface: 0D instantaneous intersection.
- 2D worldsheet + 3D hypersurface: 1D instantaneous intersection.
- Full-dimensional 4D region + 3D hypersurface: 3D instantaneous intersection.

The new Lean module KestrelIntersectionDimensionGate.lean in the existing PR #873 formalizes this identity and these conditional dimension cases. The exact-head CI run is pending at the time of this report. Until a successful run is read back, do not label the module Lean-verified. Even after compilation, Lean proves only the formalized linear-algebra statement; it does not establish that a physical SAT/H(s)H object has the assumed dimension, that the intersection is transverse, or that the source-to-formalization translation is faithful.

### Blockwave exact-gradient correction

For a smooth single-valued scalar and torsion-free connection,

~~~
A_μ = α_* ∇_μ θ
F_μν = 2 ∇_[μ A_ν]
     = 2 α_* ∇_[μ ∇_ν] θ
     = 0
~~~

Nonzero curvature/holonomy requires additional nontrivial bundle, patch, or defect structure. None is supplied by the displayed local exact-gradient definition.

## Discrepancy ledger

| ID | Historical/translated claim | Source-level issue | Current status |
|---|---|---|---|
| G1 | SAT4D 1D γ is treated as a 4D worldtube | No family/thickening map from a curve to a 4D volume | Unresolved type gap |
| G2 | Blockwave J^μν is treated as the current finite-core object | It is explicitly a 2-form worldsheet current; its slice trace is a loop | Historical assistant model, not current object |
| G3 | A 3D rendering follows from any filament/slice intersection | 1D/3D gives 0D; 2D/3D gives 1D; 4D-region/3D gives 3D under transversality | Formal dimension gate added |
| G4 | SAT4D multi-sine γ is a uniform helix | No equal-amplitude/frequency, phase-quadrature, or axial-progression constraints | Generic oscillatory curve as written |
| G5 | J^μ and J^μν are treated as one current | Vector Dirac current and two-form worldsheet current have different tensor types | No map supplied |
| G6 | F=dA with A=α_*dθ is nonzero | It vanishes locally for smooth θ and torsion-free connection | Exact-gradient correction |
| G7 | g_μν=<v_μv_ν> defines the metric without prior structure | Lowering v^μ requires a metric or equivalent background structure | Circularity/type gate |
| G8 | S_μν is treated as curvature | It is a symmetrized derivative/strain candidate, not Riemann curvature by definition | Missing metric/connection and map |
| G9 | Historical R^(3,1) is used as current native geometry | Current BEDROCK specifies positive Euclidean native metric and separately derived induced Lorentzian metrics; Minkowski kinematics is the exact control | Explicit representation map required |
| G10 | 'w=ct' is treated as equivalent to current 'cw=t' | Later direct notation says preserve 'cw=t' and do not invent w's meaning | Existing coordinate theorem remains conditional |
| G11 | Klein Fabric is defined by the early Möbius/ER-bridge answer | That answer is assistant speculation; later user note is only a supersession signal | Current definition/source recovery incomplete |
| G12 | Klein bottle cells simply tile a 4D plane | A global manifold requires explicit quotient/gluing/monodromy data | Mapping-torus sandbox is a candidate only |
| G13 | The 2026-10-18 methodological directives are raw-source verified | BEDROCK transcription exists, but the located raw chunk is empty | SOURCE_RECOVERY_BLOCKED for raw Oct18 messages |

## Stable glossary for this crosswalk

- γ^1: one-dimensional generator curve or worldline.
- P^2_t: 2024 moving two-dimensional plane in the three-dimensional toy construction.
- Σ^3_t: three-dimensional slice/hypersurface in a four-dimensional ambient space.
- W^2: two-dimensional worldsheet support associated with the historical Blockwave J^μν.
- W^4_core: intended current finite-core four-dimensional worldtube/region; exact construction map not yet recovered.
- J^μ: vector current in the historical SAT4D covariant scaffold.
- J^μν: assistant-generated conserved two-form worldsheet current in Blockwave.
- M_K: provisional symbol for the global Klein Fabric topology; no canonical definition adopted here.
- Φ_core: missing thickening/family map from a core generator to a finite-core 4D region.
- P_t: missing explicit projection/readout map from the 4D geometry to the observed representation.
- I^3_t: proposed 3D intersectional trace of the current finite-core region.
- κ_w, κ_M, κ_W: keep coordinate bending, proper worldline curvature, and finite-core worldtube curvature distinct.
- ℓ_f: current coil-radius/diameter scale; do not silently reuse the historical SAT4D transverse-thickness interpretation.

## Tooling, review, and evidence status

- Mersearch-first: reused completed request alberr-sat-o-worldline-timesheet-interbraid-20261030-1212, receipt blob 5d3e2ba13c6959974c954dc0cf2c133a0e9d9c85. It scanned three repositories (15,592 files; 20,809,012 records; 3,276 hits; 444 distinct source paths). Full raw search results are withheld, so this is a navigation receipt, not evidence. The current four shared request lanes were occupied; no new Mersearch request was submitted.
- Existing Math Hopper, Whirligig, and Lean PR #873 were checked. No new tool or fork was created; no paid service was used. SciSpace was not needed for this source-recovery task.
- Existing Kestrel PR #873 was extended in place; no new branch was created. The new dimension module and moving-slice provenance update are in the existing branch. The unrelated KestrelKelvinVortexReadout compile errors were not modified, consistent with the preceding Kestrel handoff.
- No empirical physical system, measured dataset, uncertainty budget, or independent measurement was used. No physical calculation or CODATA score is claimed.
- The current proof-first instruction was treated as authorization for the specific conditional dimension identity; no physical fixture or numerical surrogate was introduced.
- Full FIE re-review is not due: the last full revisit was 2026-10-27.
- Deliberate unrelated reading: SAT Mark V/TheTANGLE.txt, lines 1401-1440. Return cursor: line 1441.

## Explicit source-recovery blockers and next cursor

1. **Oct 18 raw source:** BEDROCK records the build-first Minkowski prescription, nested-worldtube minimal pairs, coarse-graining, and internal-morphology rules (current BEDROCK.md, lines 470-477). The raw conversation chunk at LIVE CONVOS/26.10.18•26.10.20•Calculation Relay _24 _ House Tools — raw (1)__chunk_0001_of_0001.txt is zero bytes (blob 43824dfb5486640f8d350c4703347fff01a4544c). Exact raw message IDs remain unavailable. Use the BEDROCK transcription as a governing method, but keep raw-source provenance blocked.
2. **Klein Fabric:** recover the actual adopted definition, global topology, and the explicit maps from global fabric to local finite-core worldtube and slice/readout. The early notebook question and assistant answer do not settle these.
3. **Finite-core construction:** recover Φ_core, its domain/codomain, regularity, injectivity/immersion or measure assumptions, and the relation between the core generator, finite cross-section, and 3D trace.
4. **Projection versus intersection:** specify whether I^3_t=W^4_core∩Σ^3_t is literal intersection, a projection, or a measurement/readout map. The dimension theorem applies only to the first under transversality.
5. **Representation map:** recover the exact map between current cw=t / positive Euclidean native metric, the Minkowski kinematic control, and any induced Lorentzian metric. Do not reinterpret the old w=ct module without this source map.
6. **Physical gate:** only after the geometry is typed should a real measured system and dataset be selected. No CODATA scoring or physical calculation is performed here.

No BEDROCK theory promotion, paper-gate claim, branch-graph change, task/schedule change, signet, or cross-thread delivery is made in this addendum.
