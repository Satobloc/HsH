# Geometry-fidelity addendum: moving slices, finite time slabs, and support dimension

**Date:** 2026-11-03  
**Lane:** 00, Nathan Direct / geometry fidelity  
**Selection:** Kestrel; next ring identity: Meridian  
**Status:** source comparison and formalization audit complete; additive to prior reports; no theory promotion, no paper-gate advancement, no Factory Floor admission.

## 1. Executive finding

The archive contains several related but non-interchangeable geometric objects:

1. a one-dimensional curve or filament in four-dimensional space;
2. an exact three-dimensional time level set;
3. a finite-thickness four-dimensional time slab;
4. a two-dimensional worldsheet represented by a rank-two current;
5. a four-dimensional finite-core worldtube;
6. a projection/readout from the slice into an observer's three-dimensional coordinates.

The source history uses all of these ideas at different times, but does not yet provide the maps that identify them. A discrete slice can intersect a transverse one-dimensional trajectory at a point. A positive-thickness slab can overlap that trajectory over an interval. A finite four-dimensional core can have a three-dimensional slice. A two-dimensional worldsheet can cut a three-dimensional slice in a one-dimensional curve. Those are different geometries, not alternate captions for one object.

The 2024 moving-plane helix has a sound local mathematical reconstruction: the orbit radius is independent of pitch, while the phase rate depends on pitch and plane speed. The same archive contains two assistant errors that Nathan corrected: treating the helix-plane intersection as a spiral, and using a supposed maximum/minimum helix radius to make two points converge. A later assistant claim that a diagonal-line readout moves at the plane's full speed is also missing a slope factor. The current Kestrel branch contains the correct slope factor, but its current Lean build fails before the theorem is verified.

The 2025 direct time-slab and angle statements are more ambitious than the assistant's first force-field sketch. That sketch omits slab thickness and the proposed incidence-angle variable; if its F terms mean forces, it also equates velocity with force. The direct source itself leaves the angle, curvature, coupling law, and representation-conversion map undefined. The user's claim that the angle is curvature therefore needs mathematical specification too.

The 2026 direct core description further separates a single helical core, its hollow outer superhelical path, and the three-dimensional intersectional trace. It does not license collapsing a one-dimensional SAT filament, a two-dimensional Blockwave current, and a four-dimensional H(s)H core into one support type.

This is a geometry-fidelity result, not a physical validation. No physical calculation, CODATA scoring, fit, or empirical claim was made.

## 2. Source custody and archive boundaries

### 2.1 Primary Nathan Direct sources

| Source | Provenance | Relevant content |
|---|---|---|
| 2024 “DIMENSIONAL GRAVITY” raw conversation | HsH raw JSON blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`; conversation `252d05c0-...` | Fixed and moving plane intersections; helix; diagonal line; rejected maximum-radius construction; two-parabola proposal. |
| 2025 “SAT theory clarification” raw conversation | HsH raw JSON blob `507a7000082415373ee98dbc95f18a991dff3c5a`; user message `05c717ab-5f2f-4fc3-bfa9-437b28f14a91`, 2025-12-09 03:37:21Z | Finite time-thickness slab and energy exchange between trajectory and propagating time slice. |
| Same 2025 raw conversation | User message `75d25e2b-923b-4db2-b56f-202895213fc9` | Intersection angle proposed as a fundamental encoding of force/energy transmission. |
| Same 2025 raw conversation | User message `07e8d0d0-5790-4f61-98b5-6af71acc7d8c` | Continuous allocation between particle-vector dynamics and time-field dynamics; claim that representations can be converted. |
| Same 2025 raw conversation | User message `39c6f4b3-9a5a-4788-805e-cf4444d69c7c` | Angle/curvature identification and gravity interpretation. |
| 2026 “Meridian Free Build” raw conversation | HsH raw JSON blob `7af1561b321f4d9364da5eb111df689efc652827` | One helical core, second-order superhelical path, hollow outer coil, worldtube/inertia description, distinction between coil scale and filament thickness. |
| 2026 “Meridian Minkowski Ring Analysis” raw conversation | HsH raw JSON blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`; user message `c5525f53-b7cc-4444-8102-3bf6fdb1c892` | Later `cw=t`, Forest normalization, and `++++` convention. |

The raw role-bearing messages are primary for attribution. Derivative transcript files and assistant summaries are not substitutes for the raw conversation role metadata.

### 2.2 Historical and assistant-produced equation sources

| Source | SHA / date | Attribution |
|---|---|---|
| SAT.O O1 4D, `SAT_O REWRITE/SAT 4D/SAT O1 4D.txt` | Blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; file index records 2025-06-07 creation and 2025-06-09 modification | Historical, unbylined source file. |
| SAT4D live draft, `SAT_O REWRITE/SAT 4D/SAT4D_LIVE_DRAFT.txt` | Blob `2a79fe...`; internal document date June 2025 and document-level Nathan byline | Historical document with a byline; not a raw message-level authorship proof for every embedded equation. |
| SAT.O Official Directives / SAT4D_6 | Blob `167136310cdf33ca8f986f33634692314c1a0946`; internal date July 2025 | Historical directive describing a four-dimensional manifold, one-dimensional filaments, and a three-dimensional wavefront. |
| Blockwave attachment, `🧱BLOCKWAVE.txt` | Blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; first visible repository path commit 2026-10-08 | Attachment text has malformed index tokens and no reliable internal author/date. |
| Blockwave assistant reconstruction | Raw conversation blob `1f074cc67057ae9df1e92bab45e8ba34c96b0d77`; assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`, 2025-10-19 12:29:46Z | Assistant-produced cleaned action, not Nathan Direct. |
| H(s)H MANIFOLDS compilation | Blob `54f2f530697ab6e9c44758ce3406c4144915c73d`; internal date 2026-07-04; first visible repository path commit 2026-09-04 | Generated compilation. Its source tags `(54,849)` and `(2,90,1133)` remain unresolved. |

### 2.3 Mersearch and prior reports

- The completed Morrow source-recovery receipt for `morrow-finite-slab-originals-20261103-0524` reports 68 hits across 21 source paths from a corpus of 16,884 files and roughly 21 million records. It recovered the raw role-bearing December 2025 source. Published Morrow report: issue #1300.
- The Kestrel lane-4 request `kestrel-finite-core-geometry-source-fidelity-20261102-2200` remains without a usable manifest or receipt. Its workflow job concluded failure while the Mersearch step remained incomplete; the log fetch returned BlobNotFound. This is not a zero-hit result. No new request was submitted and no occupied lane was overwritten.
- Prior Kestrel source crosswalk: issue #1281, artifact blob `b7ff39494ffd987efa3daab87e5aba0b4240856f`.
- Prior Ravel current-type audit: `WORKSPACES/RAVEL/2026-11-03T0224Z_M87_CLOSURE_PHASE_UNCERTAINTY_AND_CURRENT_TYPE_AUDIT.md`, blob `178d3e56...`. It already treats the Blockwave rank-two current, the SAT filament, and the H(s)H finite core as distinct types, and records the exact-gradient field-strength issue. This report does not duplicate that audit.

## 3. Nathan Direct geometry, with assistant translations separated

### 3.1 2024: the helix, the moving plane, and the later two-point problem

The direct source first distinguishes a static arrangement from a moving readout. In the static arrangement, a line intersects a plane at a point. The helix does not create a spiral-shaped intersection on one fixed plane. When a plane moves perpendicular to the helix axis, its intersection point with the helix moves around the axis in the plane's moving coordinates.

For a circular helix of radius r and pitch p, a source-faithful parameterization is:

~~~text
γ(φ) = (r cos φ, r sin φ, p φ / (2π))
z = z₀  ⇒  φ = 2π z₀ / p
x² + y² = r²
~~~

Therefore the orbit radius is r and is independent of p. If the plane advances at constant axial speed v, then:

~~~text
dφ/dt = 2π v / p
v_orbit = r |dφ/dt| = 2π r |v| / |p|
~~~

The existing NadirHelixSliceGeometry Lean module proves the radius independence and the constant phase secant-rate relation. The tangential arc-speed formula above follows analytically from radius times phase rate, but is not a separate theorem in that module.

The archive records two corrections by Nathan to earlier assistant descriptions:

1. A helix intersected by a fixed plane gives one point, not a spiral.
2. A perfect circular helix has constant radius. It has no maximum/minimum radial excursion that would make two points converge and then separate.

The conversation then changes the problem. Nathan asks for two points on a moving plane to approach the origin along the plane's y-axis, meet, and move away. He proposes two parabolas in the yz-plane, opening in opposite y directions, with the plane moving along negative z. The assistant only paraphrases the proposal; it does not test whether the motion satisfies the stated rate condition.

A candidate symmetric reconstruction is:

~~~text
z(t) = z₀ + v t
y_A(z) = +a z²
y_B(z) = -a z²
D(t) = y_A - y_B = 2a(z₀ + v t)²
dy_A/dt = 2a v(z₀ + v t)
dy_B/dt = -2a v(z₀ + v t)
~~~

This gives smooth approach, contact, and separation, but the y-speed goes to zero at contact. It does not give constant y-speed.

A symmetric straight-line alternative gives constant speed magnitude:

~~~text
y_A(z) = +m z
y_B(z) = -m z
|dy_A/dt| = |dy_B/dt| = m |v|
~~~

But the two labelled points pass through one another at the origin. If they must bounce and remain on their original sides, a velocity reversal or cusp is required. Thus the direct source's “steady rate” and later parabolic proposal are not yet reconciled. This is a genuine open geometric question, not a reason to silently replace the parabolas with a helix.

The same 2024 conversation contains a separate diagonal-line readout. The assistant says that a point's y-coordinate moves at the plane's full z-speed. That is only true for unit slope. The correct relation is:

~~~text
dy/dt = (dy/dz) v_z
~~~

The phrase comparing an angle to helix pitch is dimensionally underspecified: an angle is dimensionless and pitch is a length. The current formalization correctly does not use that phrase as a mathematical premise.

### 3.2 2025: finite time thickness, intersection angle, and representational freedom

Nathan Direct makes three related but distinct claims:

- A trajectory changing over a slab of finite time thickness should exchange energy with a propagating time slice.
- At a discrete time moment, a trajectory/time-slice intersection can be a point, while the dynamics belong to the sweep of time and the changing vectors across that sweep.
- The allocation of apparent dynamics between particle-vector motion and time-field motion is intended to vary continuously, with conversion between representations.

Nathan later proposes the intersection angle as a fundamental encoding of force or energy transmission, and identifies angle with curvature. Those are direct hypotheses, but the source does not define which angle is intended, what metric supplies it, how it varies, or what equation converts it into energy transfer.

The assistant's first rough sketch is:

~~~text
d r_i / dt = F_classical + F_slice(r_i, φ(t))
~~~

This is not yet a faithful translation of the direct geometry. It has no finite slab thickness, no defined incidence angle, no time-surface normal, and no energy-exchange functional. If F denotes force, its left side is velocity and the equation is dimensionally inconsistent. If F denotes a velocity field, the notation and prose need to say so. The expression is best treated as an incomplete assistant placeholder, not a derived law.

The direct claim that “angle is curvature” also needs care. For a planar curve, if θ is the tangent angle, curvature is its derivative with respect to arclength, not θ itself:

~~~text
κ(s) = dθ/ds
~~~

For the candidate parabola y = a z², symbolic differentiation gives:

~~~text
θ(z) = atan(2 a z)
κ(z) = 2a / (1 + 4a²z²)^(3/2)
~~~

An incidence angle between a trajectory and a time-surface normal is a different scalar again. It could be a primitive in the proposed model, but it is not automatically intrinsic curvature.

The user's representation-conversion claim is also stronger than the current source defines. The existing KestrelProjectedIncidence theorem supplies a precise mathematical condition: a deterministic map from representation A to representation B exists exactly when B is constant on every fiber of A. This is useful formal structure, but it does not establish that the physical vector/time-field representations actually satisfy the condition. The maps and their information loss must be supplied.

### 3.3 2026: one core, hollow outer path, and a three-dimensional trace

The later direct source distinguishes:

- one helical core;
- a second-order superhelical path followed by that same core;
- a larger hollow outer coil, not a second core;
- the three-dimensional intersectional trace of a four-dimensional filament, not the filament itself;
- coil diameter/radius scale versus filament thickness.

This is consistent with the instruction not to conflate the core, its path, its finite thickness, and its observed slice. It does not yet specify whether the four-dimensional support is a one-dimensional embedded curve with a finite tubular neighborhood, a full-dimensional core region, or another object.

The later `cw=t` and `++++` normalization must remain separate from the older `w=ct` and `R^{3,1}` convention until an explicit coordinate, metric, and unit map is provided. The assistant's older Lorentzian equations cannot simply be relabelled as the current positive-signature construction.

## 4. Verbatim historical equations and separate typed corrections

### 4.1 SAT.O O1 4D source

The historical O1 source gives:

~~~text
γ^μ(λ) = (λ,
          A_x sin(k_x λ + φ_x),
          A_y sin(k_y λ + φ_y),
          A_z sin(k_z λ + φ_z))

v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = 1/2 m v^μ v_μ - V_tension(γ)
φ_i - φ_j = 2πk/n
~~~

The same historical material describes fundamental one-dimensional filaments embedded in four-dimensional spacetime and calls the worldtube a four-dimensional volume swept out by a vibrating filament. The displayed γ equation defines a one-dimensional curve. It does not, by itself, define the four-dimensional volume. A sweep or thickening map is absent.

### 4.2 Blockwave assistant reconstruction

The assistant-produced Blockwave action is:

~~~latex
S[g,u,θ;J] = ∫ d⁴x √(-g) [
  M_P²/2 R
  + f_θ/2 ∇_μθ ∇^μθ
  - Λ_θ⁴ (1 - cos θ)
  + c₁/2 P^{μρ}P^{νσ}(∇_μu_ν)(∇_ρu_σ)
  + c₂/2 (∇_μu^μ)²
  + λ(u^μu_μ + 1)
  + κ₀/4 J_{μν}P^{μρ}P^{νσ}J_{ρσ}
  + κ₂ℓ²/4 (∇_αJ_{μν})P^{αβ}P^{μρ}P^{νσ}(∇_βJ_{ρσ})
  + g_h/2 F_{μν}(θ)J^{μν}
  + 1/2 J_{μν} M^{μν}{}_{ρσ}(θ,u)J^{ρσ}
]
~~~

Associated definitions include an antisymmetric rank-two current, a conservation condition, a unit timelike vector, and a phase-derived potential:

~~~text
J^{μν} = -J^{νμ}
∇_μ J^{μν} = 0
P^μ{}_ν = δ^μ{}_ν + u^μ u_ν
u^μ u_μ = -1
A_μ = α_* ∇_μ θ
F_{μν} = 2 ∇_[μ A_{ν]
~~~

The attachment's raw projector/index text is malformed in places; the displayed mixed-index projector is the assistant's cleaned version. None of these equations is Nathan Direct. The earlier Ravel current-type audit contains the more extensive source and type review and should be used rather than rebuilding it here.

### 4.3 Generated finite-band equation

The H(s)H MANIFOLDS compilation gives:

~~~text
Σ_t^(h) = {x ∈ E_exp : |τ(x) - t| ≤ h_Σ/2}
~~~

It labels this a three-dimensional projection hypersurface, but the inequality describes a finite band. Its source tags remain unresolved, so this formula cannot be attributed to Nathan Direct merely because a later direct statement mentions finite time thickness.

### 4.4 Separate typed corrections and candidate maps

The following are proposed mathematical clarifications, not verbatim Nathan equations and not physical-theory promotions.

**Exact slice versus finite slab**

~~~text
Σ_t := τ⁻¹({t})
B_{t,h} := τ⁻¹([t - h/2, t + h/2])
~~~

If τ is a smooth submersion on the region, Σ_t is locally a three-dimensional level set in a four-dimensional manifold. For h > 0, B_{t,h} is a four-dimensional band, not a three-dimensional hypersurface. The exact slice can be the central hypersurface of the band.

For a transverse one-dimensional trajectory γ:

~~~text
γ⁻¹(Σ_t)       = isolated parameter value(s)
γ⁻¹(B_{t,h})   = parameter interval(s), generally
~~~

This reconciles “a point at a discrete time” with “finite time thickness” without treating the two objects as identical.

**Finite-core worldtube**

A one-dimensional centerline γ does not determine a finite four-dimensional core until a normal-bundle/tubular map is supplied. A candidate form is:

~~~text
X : I × D³ → M⁴
X(λ, 0) = γ(λ)
W_ε(γ) = image(X)
~~~

This requires a smooth embedded curve, a metric or other specified normal structure, a transverse frame, a radius/domain, and an injectivity condition. No value of ε is assumed here. The slice W_ε(γ) ∩ Σ_t can then be a three-dimensional cross-section under suitable regularity conditions.

**Projection and composition**

Let ι_t : Σ_t ↪ M⁴ be inclusion and let π_t : Σ_t → O be the readout/projection into an observer's three-dimensional output space. Then the readout of a filament is only defined on the intersection domain:

~~~text
π_t ∘ ι_t ∘ γ | γ⁻¹(Σ_t)
~~~

Neither π_t nor the full composition is defined in the direct sources. There is also no supplied map γ → W or γ → J.

**Support dimension**

Under transverse-intersection assumptions in four dimensions:

- 1D filament ∩ 3D hypersurface: 0D point set;
- 2D worldsheet ∩ 3D hypersurface: 1D curve;
- 4D finite region ∩ 3D hypersurface: 3D region.

A rank-two current is naturally associated with a two-dimensional worldsheet support. A one-dimensional curve has a different Poincaré-dual current degree. The Ravel formalization already explores these type distinctions. They must not be collapsed.

**Blockwave exact-gradient consequence**

If A = α_* dθ globally for a smooth, single-valued scalar θ and a torsion-free connection, then:

~~~text
F = dA = α_* d²θ = 0
~~~

A nonzero curvature/holonomy sector requires additional structure, such as an independent connection, nontrivial bundle data, singular/defect support, or specified multivalued phase and transition functions. The assistant's exact-gradient definition alone does not produce nonzero F. This finding is already recorded in the Ravel current-type audit.

**Projector convention**

For a Lorentzian unit timelike vector with u·u = -1, the mixed orthogonal projector is δ + u⊗u. For a positive-definite metric and unit vector with u·u = +1, it is δ - u⊗u. The current `++++` convention and the older Lorentzian Blockwave convention need an explicit metric map before their projectors can be identified.

## 5. Mapping diagram

This is a map of candidate object types, not a Factory Floor geometric plot:

~~~text
                         τ : M⁴ → R
                        /           \\
               {t} → Σ_t             [t-h/2,t+h/2] → B_{t,h}
                 3D level set             4D finite slab
                     |                         |
          γ : I → M⁴, 1D filament              |
             /             \\                 |
   γ⁻¹(Σ_t): point(s)   γ⁻¹(B): interval(s)    |
                     |
                     +---- π_t : Σ_t → O   [READOUT MAP NOT DEFINED]

          W_ε(γ), 4D finite core
                     |
               W_ε(γ) ∩ Σ_t
                 3D cross-section

          S² ⊂ M⁴, 2D worldsheet / J₂ current
                     |
                  S² ∩ Σ_t
                    1D curve
~~~

The missing composition maps are the central issue: γ → W, γ → J₂, the time function τ, the projection π_t, and the coupling that converts the proposed intersection angle into energy transfer. Without them, nesting and “equivalence” remain analogies or hypotheses rather than defined transformations.

## 6. Stable glossary

| Term | Working meaning in this crosswalk | Do not conflate with |
|---|---|---|
| γ, filament | One-dimensional curve/centerline in four-dimensional ambient space, when that is the source's stated support | Finite-core worldtube or two-dimensional worldsheet |
| Σ_t, exact timesheet | Three-dimensional level set at one time value | Positive-thickness four-dimensional band |
| B_{t,h}, time slab | Preimage of a finite time interval; a four-dimensional region for h > 0 | Three-dimensional hypersurface |
| W, worldtube | Four-dimensional finite-core region; requires a thickening/sweep map | The centerline γ |
| S, worldsheet | Two-dimensional embedded support, if explicitly chosen | One-dimensional filament |
| J₂ | Rank-two current associated with a two-dimensional support in the Blockwave reconstruction | A one-dimensional SAT filament without a degree-changing map |
| π_t | Projection/readout from the exact slice into observer coordinates | The slice itself |
| α_line | Inclination of a line in the 2024 moving-plane construction | The 2025 trajectory/time-surface incidence angle |
| α_int | Proposed 2025 incidence angle; definition and metric still missing | Intrinsic curvature or α_line by default |
| r, p | Helix radius and pitch; r sets orbit radius, p sets phase rate | Filament thickness |
| h_Σ | Finite slab thickness in the generated H(s)H formula | A zero-thickness slice |
| ε | Candidate tubular-core radius, not assigned a physical value here | A measured coil diameter |
| ℓ_f | Historically overloaded notation; requires source-specific disambiguation | A universal thickness/diameter symbol |

## 7. Discrepancy ledger

| ID | Source / translation | Discrepancy | Status |
|---|---|---|---|
| G1 | 2024 helix | Assistant described a spiral intersection and later a maximum-radius convergence mechanism; Nathan corrected both. | Corrected in source; retain the correction. |
| G2 | 2024 diagonal line | Assistant equated readout y-speed with plane speed without the line slope. | Correct relation is dy/dt = (dy/dz)v_z; current Lean module attempts this but fails compilation. |
| G3 | 2024 two-point problem | Parabola proposal gives smooth contact but zero y-speed at contact; constant-rate line model crosses or needs a cusp to bounce. | Unresolved direct geometry. |
| G4 | 2025 time slab | Assistant force sketch omits finite thickness, incidence angle, and the sweep geometry; possible velocity/force dimensional mismatch. | Incomplete assistant placeholder. |
| G5 | 2025 angle/curvature | Direct source identifies angle with curvature without defining the angle or curvature operator. | Direct hypothesis requires a definition; curvature is not generally the angle itself. |
| G6 | 2025 representation conversion | Direct source claims arbitrary conversion between vector and time-field allocations without maps. | Kestrel factorization theorem supplies a necessary/sufficient fiber condition, not the physical maps. |
| G7 | O1 versus worldtube | O1 defines a one-dimensional γ but describes a four-dimensional worldtube without a thickening map. | Missing geometry. |
| G8 | Blockwave versus SAT filament | Blockwave J₂ is a rank-two current/worldsheet type; SAT O1 describes a one-dimensional filament. | No source-defined map between them. |
| G9 | Blockwave field strength | A = α_*dθ gives F = 0 for smooth single-valued θ. | Existing Ravel audit; topological/defect conditions absent. |
| G10 | Signature/normalization | Historical R^{3,1}, u² = -1 and later cw=t, ++++ are not mapped. | Unresolved convention boundary. |
| G11 | H(s)H MANIFOLDS | Finite-band inequality is labeled a three-dimensional hypersurface. | Type mismatch unless h=0 or the label means the central slice; source tags unresolved. |
| G12 | 2026 finite core | One core, hollow outer superhelix, coil scale, filament thickness, and 3D trace are distinct. | Direct distinctions recovered; support/thickening map still missing. |
| G13 | Current Kestrel Lean branch | New moving-slice slope module fails in current CI. | Not a verified theorem yet. |

## 8. Lean and existing formalization status

### 8.1 Successful local geometry formalization

The existing NadirHelixSliceGeometry module, blob `3e47ffa6d6bcd534abdedf18ea865fb2941a0947`, formalizes:

- unique intersection of a transverse affine line with an affine hyperplane;
- constant slice coordinate for an axis-parallel line;
- circular-helix slice phase;
- radius squared independent of pitch and slice height;
- constant moving-slice phase secant rate.

It built in successful PR merge-ref runs #41301288857 and #41348936553. The logged theorem axiom output is only propext; no sorryAx/admit was seen in those successful logs. The module explicitly uses an all-plus Euclidean local model and does not claim to supply the physical SAT4D metric. It is not imported by the current Kestrel PR root.

### 8.2 Current Kestrel branch

The current Kestrel branch is `research/kestrel-original-slice-fidelity-20261028t0900z`, PR #873, head `180e6b5414db336727aae2cf2850aaf91344bcaa`, base `infra/lean4-verification-20261023` at `61cc8b...`.

The new KestrelMovingSlice file, blob `745f2542...`, contains the corrected slope-factor theorem:

~~~text
moving-slice y-rate = (dy/dz) × plane-speed
~~~

The current PR run #41684317402 failed in that file. The log identifies:

- lines 103 and 107: real-division definitions need a noncomputable declaration or section;
- lines 117 and 130: a tactic reports “No goals to be solved” because the preceding field_simp has already discharged the goal; remove or restructure the redundant final tactic.

Therefore the slope theorem is not yet verified by a successful current build. The file also treats the rate as a finite-difference/secant relation; a general derivative theorem is not supplied.

KestrelIntersectionDimensionGate, KestrelLevelSetSliceTangentV2, and KestrelProjectedIncidence were built/replayed before the aggregate failure. They provide conditional linear dimension, level-set tangent, and projection-factorization results. They do not establish that the physical SAT/H(s)H maps exist.

### 8.3 Existing Ravel formalization, not duplicated

Ravel PR #1133 already contains conditional modules for carrier-slice reconstruction, rank-two current projection, carrier/sheet dimension, and fiber-transport nonuniqueness. Its successful merge-ref run #41348936553 is not an exact-head/current-base verification. The Ravel report already audits the Blockwave current type and exact-gradient field-strength issue. This lane reuses that work rather than creating a competing module.

### 8.4 Tool and cost reconnaissance

- Existing Math Hopper is an archive/equation extraction route, not a substitute for source-role attribution; its full-corpus throughput remains unverified. It was not run for this focused source comparison.
- Existing Whirligig is a geometric/mechanical R/Q tool, not a proof of the four-dimensional time-slab or current-type maps. It was not used.
- SciSpace is available, but the primary work here is internal archive recovery; no external literature search was needed.
- Existing Lean 4/Mathlib GitHub Actions were reused. No local Lean/Elan installation was available in this runtime. No new tool, paid service, branch, or PR was created.
- The GitHub connector did not expose a complete fork-list action in this run; the prior 2026-10-31 inventory recorded zero HsH forks. No fork was used.

## 9. Geometry and theory status

This report's ASCII map is a mapping diagram, not the mandatory quaternary static geometric plot. It has not passed independent hostile geometric-fidelity review and is not a Factory Floor submission.

- Tier 1 geometric admissibility is not closed for the finite-slab/core construction because τ, h, the support type, the metric, π_t, and the relevant composition maps are not source-defined.
- Tier 2 is not entered: the interaction surfaces and energy-transfer law are not explicit.
- Tier 3 is not tested: no unprompted cross-sector derivation is established.
- Tier 4 is not tested: no counterfactual removal/variation dependency is derived.
- No mathematical clearance, physical verification, or theory promotion is claimed.

No real physical system, measured dataset, units, uncertainties, or independent observations were supplied for this geometric comparison. Accordingly, no physical calculation was attempted. No CODATA scoring was performed.

The Nov 9 minor, Nov 30 major, and Dec 14 full-theory paper gates remain separate and unchanged. This report advances none of them.

## 10. Next deeper cursor

1. Continue the 2024 raw branch after the two-parabola proposal. Resolve whether the intended contact is smooth with zero speed, constant-speed crossing, or a bounce with a non-smooth reversal. Formalize only after the intended condition is source-resolved.
2. Fix the existing KestrelMovingSlice compile errors and rerun the current PR against its current base. Then add a derivative theorem if the source requires instantaneous rate rather than a secant relation.
3. Recover the original role-bearing sources behind H(s)H MANIFOLDS tags `(54,849)` and `(2,90,1133)`; determine whether the finite-band formula is a user-authored equation or assistant reconstruction.
4. Define the 2025 incidence angle precisely: tangent-to-normal or tangent-to-surface, metric, orientation, and parameter. Keep α_line and α_int separate.
5. Define τ, exact slice Σ_t, finite slab B_{t,h}, and the energy-exchange law. Do not infer the coupling from the phrase “angle is curvature.”
6. Supply explicit maps for γ → W, γ → J₂, and π_t, with their domains, codomains, regularity, injectivity/fiber conditions, and composition laws. Keep one-dimensional, two-dimensional, and four-dimensional supports distinct.
7. Resolve the current `cw=t`, `++++` convention against historical `w=ct`, `R^{3,1}` before reusing Lorentzian projectors or actions.
8. Keep the completed Morrow Mersearch result and the incomplete Kestrel lane-4 request intact. Do not submit a replacement request until a lane is released.

**Boundary:** no new theory claim, no physical calculation, no CODATA score, no branch change, no task change, no chat rename, and no claim of delivery to another ChatGPT thread.
