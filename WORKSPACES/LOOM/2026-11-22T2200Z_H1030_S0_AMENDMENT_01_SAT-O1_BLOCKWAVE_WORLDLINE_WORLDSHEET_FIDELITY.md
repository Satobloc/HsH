# Loom h1030:s0 | Amendment 01: SAT-O1 / Blockwave kinematics and support-dimension fidelity

**Parent report:** WORKSPACES/LOOM/2026-11-22T2200Z_H1030_S0_MINKOWSKI_RING_NATURAL_UNIT_CONTEXT_AND_TAG_COVERAGE.md  
**Run key:** REVROT3-19-20261011:1030:s0  
**Status:** ADDITIVE SOURCE-FIDELITY AMENDMENT / ORIGINAL EQUATION CUSTODY PRESERVED / NO EQUATION CORRECTION / NO THEORY PROMOTION

## Executive finding

The original SAT-O1 module and Blockwave attachment encode materially different filament objects and kinematics from the October 9 Nathan Direct description.

Nathan Direct says that, at the classical limit, filaments can be treated as stationary; “filament motion” is not a thing; particle motion is filament topology; and worldtube shape is determined by force and mass, with worldtube curvature identified with inertia.

The historical SAT-O1 module instead describes intrinsically vibrating, hyperhelical filaments as active dynamic paths. It defines a one-parameter curve but verbally calls the worldtube a four-dimensional volume swept out by that vibrating filament, without supplying the extra sweep/thickening parameters.

The historical Blockwave attachment uses a conserved rank-two current on filament worldsheets and says filaments are defects of a time-flow/compact-phase medium rather than new independent fields. It does not specify a map from the direct one-dimensional filament/worldline to the two-dimensional worldsheet current.

These are not mere notational variants. The missing support, thickening, projection, and composition maps determine what intersects the three-dimensional timesheet and what the particle readout is.

## 1. Primary Nathan Direct comparator

- Conversation: Meridian Free Build.
- Conversation ID: 6ac45d1f-17b0-83ea-ad1f-fa524602378b.
- Raw export blob SHA-1: 7af1561b321f4d9364da5eb111df689efc652827.
- Direct message: 3c657387-b80b-4982-a61a-8e6d8568b8d1.
- Timestamp: 2026-10-09T01:50:55.112Z.
- Message role: user.

The direct source states, in relevant part:

> “No--at least at the classical limit--it's not ‘motion’ of a filament.”
>
> “You can treat filaments, at first approximation, as stationary.”
>
> “Filament motion is not a thing. Particle motion is filament topology.”
>
> “Map the worldtubes using w=ct as your time length scale (in meters).”
>
> “The shape is entirely determined by the force and the mass.”
>
> “Worldtube curvature == inertia. Full stop.”

This is a strong direct proposition, not a tentative assistant interpretation. The same message explicitly limits the statement to the classical/Minkowski description and allows the fuller model to decompose inertia into worldtube properties. It does not supply a finite-core constitutive law or a complete worldtube embedding.

The later direct message 090f5160-1020-486d-9c42-df3d7dff2063, already tagged in the 2026-11-04 Loom ledger, says the older reciprocal filament/timesheet-deformation description is superseded by Klein Fabric. That supersession boundary must be preserved; it does not by itself identify Blockwave as the exact superseded object.

## 2. Historical SAT-O1 4D source

**Source identity**

- Historical module title: SAT_O 2.0 Module O1: 4D Hyperhelical Filament Dynamics.
- Git blob SHA-1: 7577aa1ee5a6c3850ce3b226c75377de6367aedc.
- SHA-256 recorded in the prior Morrow source-custody audit: 8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.
- File-index record: June 9, 2025, 18:44:50 local time.
- First extant Git commit: 2025-10-27T00:40:28Z.
- Byline/date inside module: none recovered.
- Authorship status: UNBYLINED HISTORICAL MODULE.

The original file defines a smooth one-dimensional curve in Lorentzian four-space, parameterized by an affine parameter. Its verbatim core equation fragments are:

~~~text
γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x), A_y sin(k_y λ + φ_y), A_z sin(k_z λ + φ_z))

v^μ(λ) = dγ^μ/dλ

S[γ] = ∫ dλ L(γ^μ, v^μ)

L = 1/2 m v^μ v_μ - V_tension(γ)

φ_i - φ_j = 2πk/n
~~~

The source also verbally defines the worldtube as a four-dimensional volume swept out by a vibrating filament and describes the hyperhelix as helical motion in three spatial dimensions while progressing forward in time. Its concluding description calls the filament structures active dynamic paths.

### Fidelity discrepancy

The direct October 9 statement says filament motion is not a thing at the classical limit and treats particle motion as filament topology. SAT-O1's language makes vibration and hyperhelical path motion intrinsic to the filament.

A reconciliation is possible only if “vibration” is reinterpreted as an internal/topological or representational degree of freedom rather than material motion of the filament. The source supplies no such map. Until one is recovered, the two descriptions must remain distinct.

There is also a dimension/type gap. The displayed γ is a one-parameter curve, while the prose calls its worldtube a four-dimensional volume. The source supplies no additional three-parameter cross-section, sweep domain, thickening map, or support construction that turns the curve into a 4D volume. “Swept out” is a verbal definition here, not a derived map.

## 3. Historical Blockwave Clean Action attachment

**Source identity**

- Original conversation: 68c990dd-df28-832e-b766-c267190aaffa.
- Attachment ID: file-LwaFTKkMemPPrLU4qCLpYB.
- Attachment event: 2025-09-16T16:31:34.670Z.
- HsH Git blob SHA-1: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d.
- SHA-256 recorded in Nadir's source-stratigraphy audit: 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.
- First extant HsH commit: 2026-10-08T02:42:49Z.
- Embedded author: UNRESOLVED. The attachment event is user-supplied, but this does not authenticate the embedded prose as Nathan-authored.

The original begins by defining a Lorentzian metric, a unit time-flow, a compact phase, a spatial projector, and a conserved rank-two current:

~~~text
u^μ u_μ = -1

P^\\mu{}\\nu\\!\\equiv \\delta^\\mu{}\\nu+u^\\mu u_\\nu

J^{μν},  ∇_μ J^{μν} = 0
~~~

Its phase connection and curvature are:

~~~text
A_μ(θ) ≡ α_* ∇_μ θ

F_{μν}(θ) ≡ ∇_[μ A_{ν]}(θ)

∮ A·dℓ ∈ 2πℤ
~~~

The action includes a local symmetric response kernel M^{μν}{}_{ρσ}(θ,u), a rank-two J current, and time-flow elasticity. The source's malformed tokens are preserved exactly in the archived original, including:

~~~text
λ (u^μ u\mu + 1)

1/2 J{\mu\nu} M^{μν}{}_{ρσ}(θ,u) J^{ρσ}

(∇\alpha u_μ)
~~~

These are source transcriptions, not corrected equations. The projector token is retained literally as P^\\mu{}\\nu, including its missing subscript marker. No replacement projector, index repair, or normalized action is issued here.

### Fidelity discrepancy

The Blockwave prose calls J^{μν} a conserved two-form filament-worldsheet current, distributional on physical filaments. It later says filaments are not new fields, but defects of the θ,u medium encoded by J^{μν}. This leaves at least three distinct objects unseparated:

1. the one-dimensional physical filament;
2. the two-dimensional worldsheet supporting a rank-two current;
3. the medium defect/current representation.

No support map, pushforward, Poincaré-dual construction, or quotient from the direct filament to the Blockwave worldsheet is specified.

The Blockwave action uses u^μu_μ=-1 and √(-g), while the October 21 native-frame message states ++++. The October 9 direct comparator is explicitly Minkowski. These are different versioned metric conventions; no signature conversion or common metric pullback is supplied.

The local symmetric response kernel is not identified with the later Klein Fabric construction. Do not silently promote the historical kernel to current Nathan Direct geometry.

## 4. Coauthored dimensional-normalization source

- Repository: SAT_THEORY_ARCHIVE_2023-25.
- Path: DIMENSIONAL_NORMALIZATION.tex.
- Blob SHA-1: 52c7183e6d4bd657f5a34efb7f40ce89b6a2dcb1.
- Byline: Nathan McKnight & Janus C. Sol.
- In-document date: September 9, 2026.
- First extant archive commit: 2026-09-08T22:55:04Z.

The source explicitly calls the base map elementary and not new:

~~~text
w = ct

∂_t = c ∂_w

∂_t^n = c^n ∂_w^n

dx/dw = v/c
~~~

It describes a frozen, lossless time-to-length normalization and says the procedure makes no ontological claim. This is a coauthored normalization audit, not the October 21 direct native-frame message. It does not supply a conversion map to the later literal cw=t / Forest / ++++ convention.

## 5. Intersection-dimension consequences

For transverse submanifolds of a four-dimensional ambient manifold, the conditional intersection dimension is:

~~~text
dim(A ∩ B) = dim(A) + dim(B) - 4
~~~

Therefore:

| Carrier object | Timesheet | Conditional intersection/readout dimension |
|---|---|---:|
| 1D filament/worldline | 3D timesheet | 0D point |
| 2D worldsheet | 3D timesheet | 1D curve |
| 4D finite-core support | 3D timesheet | 3D region |

The direct FIE model describes a one-dimensional filament/worldline intersecting a three-dimensional timesheet, yielding a point-like particle readout. The Blockwave worldsheet current has a different support type and would yield a one-dimensional intersection trace under the same transverse-intersection assumptions.

The existing PR #1133 carrier/timesheet dimension formalization has a successful exact-head CI run #44709605971. It verifies conditional line-carrier and full-core dimension results. It does not prove that the historical Blockwave J current maps to the direct one-dimensional filament or that its intersection is the intended particle readout. No new Lean module/build was created.

The missing maps are not cosmetic:

- SAT-O1 curve-to-4D-volume sweep/thickening;
- Blockwave filament-to-worldsheet support/current map;
- worldline/worldsheet/finite-core projection to the three-dimensional timesheet;
- readout map from the intersection to an observed particle;
- metric and signature pullback across the historical and native conventions.

## 6. Glossary

| Term | Meaning | Provenance |
|---|---|---|
| Filament | Direct one-dimensional physical object; stationary at first approximation in the Oct 9 classical description | Nathan Direct |
| Particle motion | Motion represented by filament topology, not material filament motion | Nathan Direct |
| Worldtube | Four-dimensional history/structure; its finite-core support and sweep map remain unspecified in the direct source | Nathan Direct |
| SAT-O1 γ | One-parameter hyperhelical curve in R^{3,1} | Unbylined historical module |
| SAT-O1 worldtube | Verbally defined as a 4D volume swept by a vibrating filament | Unbylined historical module; sweep map absent |
| Blockwave J^{μν} | Conserved rank-two current associated with filament worldsheets | User-supplied attachment; embedded author unresolved |
| Medium defect | Blockwave's description of filaments as defects of θ,u fields | Historical attachment prose |
| Timesheet | Three-dimensional moving time wavefront | Nathan Direct |
| Intersection readout | Particle-like result of worldline/timesheet intersection | Nathan Direct geometry |
| Thickening/sweep map | Additional parameterized construction needed to turn a 1D curve into a higher-dimensional support | Missing; not a direct equation |

## 7. Mapping diagram

~~~text
NATHAN DIRECT
  F¹: stationary filament / worldline
       |
       | intersects
       v
  Σ³: moving timesheet
       |
       | transverse intersection
       v
  P⁰: particle-like point readout
       |
       | apparent particle motion
       v
  topology of F¹ through the time-surface family


SAT-O1 HISTORICAL MODULE
  γ¹(λ) in R^{3,1}
       |
       | internal vibration / hyperhelix
       v
  claimed W⁴ worldtube volume
       |
       | missing sweep or thickening map
       v
  no source-defined map to F¹ or P⁰


BLOCKWAVE HISTORICAL ATTACHMENT
  θ,u medium
       |
       | defects / conserved rank-two current
       v
  J² on filament worldsheets
       |
       | intersects Σ³
       v
  conditional 1D trace
       |
       | missing support and readout map
       v
  no established equivalence to the direct P⁰ readout
~~~

The diagram records distinct source objects. It does not assert that the three branches are equivalent or that one is the correct physical realization.

## 8. Original versus translated propositions

| Source proposition | Historical representation | Fidelity result |
|---|---|---|
| Filaments are stationary at first approximation; particle motion is filament topology | SAT-O1 vibrating hyperhelical filaments are active dynamic paths | Direct kinematic mismatch; reconciliation map absent |
| Worldtube curvature tracks inertia at Newtonian limit | SAT-O1 assigns a tension Lagrangian to a hyperhelical curve | No derivation from the direct force/mass morphology statement |
| A 1D filament/worldline intersects a 3D timesheet | Blockwave uses a rank-two current on 2D worldsheets | Different intersection dimension; projection/support map absent |
| Worldtube is a 4D history/volume | SAT-O1 calls the sweep of a one-parameter curve a 4D volume | Additional sweep/thickening parameters missing |
| Filament is a real physical object | Blockwave describes filaments as θ,u-medium defects encoded by J | Ontology differs; no map |
| Native frame may use ++++ | SAT-O1/Blockwave use Lorentzian metric conventions | Versioned signature difference; no common metric map |

## 9. Discrepancy ledger

| Status | Finding |
|---|---|
| NEW | SAT-O1's active hyperhelical filament motion differs from Nathan Direct's stationary-filament/topological-particle-motion description |
| NEW | SAT-O1's one-parameter curve does not itself provide the 4D volume claimed by its worldtube definition; sweep/thickening map absent |
| NEW | Blockwave rank-two worldsheet current has a different support and intersection dimension from the direct one-dimensional filament/worldline |
| NEW | Blockwave medium-defect ontology is not mapped to the direct physical-filament ontology |
| OPEN | Exact relation between historical Blockwave kernel and later Klein Fabric |
| OPEN | Metric/signature map between Lorentzian SAT-O1/Blockwave and native ++++ convention |
| PRESERVED | Original SAT-O1 and Blockwave source bytes and malformed tokens remain unchanged |
| PRESERVED | Existing PR #1133 conditional dimension proof and PR #1444 scalar coordinate proof are reused, not duplicated |

## 10. Controls and next cursor

- Mersearch was not callable in this runtime; existing request lanes remain occupied. Bounded GitHub raw/blob retrieval was used as fallback and is not represented as Mersearch.
- Original SAT-O1, Blockwave, and DIMENSIONAL_NORMALIZATION sources were read by exact blob/path. No source file was modified.
- Existing PR #1133 and PR #1444 were reused. No new Lean module/build.
- No physical calculation, fit, prediction, measurement, CODATA scoring, equation correction, or theory promotion.
- No Factory Floor admission, paper-gate advancement, task graph change, scheduler mutation, new task, or cross-thread handoff.
- The original h1030 main report remains the single primary report. This is a distinct additive source-comparison amendment, not a duplicate main report.

### Next deeper cursor

1. Recover any original SAT-O1 authoring conversation or direct attribution; preserve the unbylined status until then.
2. Find a direct source that defines filament thickness, cross-section, or a sweep map.
3. Specify the worldline-to-worldsheet/current support map, including the support dimension and orientation.
4. Define the timesheet intersection/readout map for each carrier type before comparing equations.
5. Keep Lorentzian and ++++ branches separate until a source-grounded metric pullback is defined.
6. Reuse PR #1133 and PR #1444; formalize only newly source-defined maps.

**Disposition:** ADDITIVE_GEOMETRY_FIDELITY_AMENDMENT / HISTORICAL_SAT-O1_AND_BLOCKWAVE_DISTINCT_FROM_NATHAN_DIRECT / ORIGINAL_EQUATIONS_PRESERVED / NO_CORRECTED_EQUATIONS / NO_NEW_LEAN_BUILD / NO_PHYSICAL_CALCULATION / NO_CODATA / NO_THEORY_PROMOTION.
