# Universal Indicatrix / Hagalaz: source-fidelity addendum
## Aster Lane 00 | h749:s0 | 2026-11-11

**Status:** Source-genealogy delta established; conditional start-mode identity derived; full UI-to-Hagalaz and nested-helix-to-framed-sphere maps remain open. This is a geometry/source-fidelity report, not a physical theory or paper review.

## 1. Scope and attribution

This pass compares three different source classes that had previously been allowed to blur together:

1. Role-authenticated Nathan Direct messages.
2. A bylined historical Rotoexpando geometry manuscript dated 11 September 2026.
3. Historical assistant-generated solver summaries and Hagalaz reconstructions.

The distinction matters because the bylined manuscript supplies a real framed-sphere/Hagalaz definition, while several later assistant summaries add stronger claims about solver identity, rotation channels, and a global Hagalaz unifier.

The current Aster source-fidelity remit is grounded in direct user-role instructions: test whether a claimed Nathan-authored proposition reads like Nathan, whether he said it elsewhere, and whether it conflicts with other direct work. The separate Paper A review assignment remains frozen by the active Code Grurple control; this report does not conduct or reopen that review.

## 2. Source chronology and custody

| Source | Provenance | Source identity / date |
|---|---|---|
| SAT GEOMETRIC SOLVERS.txt | Historical mixed conversation/synthesis; not presumed Nathan-authored throughout | Blob 5429f7cb2adbfdc0abab7db46eff4ca4de08358a; first extant commit 2026-09-04 19:53:15Z |
| Build Geometry Coding Skill raw conversation | Role-authenticated user/assistant message graph | Conversation 6aa0a623-09ac-83e9-b995-e6c8d4e75435; raw blob 7426016a72905bb37a45abac4394e4e7bb051144; first extant HsH commit 2026-09-12 04:23:14Z; relevant direct messages dated 2026-09-09 |
| rotoexpando_geometry_definition.tex | Bylined primary geometry manuscript, Nathan McKnight and collaborators; explicitly pure geometry, not a physical theory | Blob 5c21c6152482249e4432ded423b0040e70fc8b4f; authored/date line 11 September 2026; first extant reference-repository commit 2026-09-11 06:06:22Z |
| UI characterization PDF | Two-page source located by metadata; binary was not independently decoded in this run | Blob 2c821ee20db796278599b0aa263b5e321e944488; 35,766 bytes; first extant commit 2026-09-30 18:12:39Z |
| UI characterization SRT | Transcribed witness, not a raw role graph | Blob 582b1fe72018c4e2ef4c67f69a74a3e39cefbc02; first extant commit 2026-10-08 05:12:41Z; relevant lines 59-110 read |
| Aster raw conversation | Role-authenticated user/assistant message graph | Conversation 6ab006ce-e358-83ea-b3dd-7b23a26c00fa; raw blob 1bf6e65c4ac1650297acb67d7e39f700454a03c8; first extant HsH commit 2026-10-17 12:35:19Z |
| NWTF-UI-UNIVERSAL-INDICATRIX-SOURCE-CONTROL-2026-09-21.md | Assistant-curated source-control record derived from Nathan-authored source material; secondary, not an independent raw conversation | Blob e75bad2f3bd0773f764121caf86b17abb22e078b |
| Hagalaz RUN 091 / RUN 092 | Assistant-generated sandbox reconstructions | Blobs a3b68b296f9e4d7ffd3aab68222f3e2c52665518 / 420841d65331324d5000fb2075b531782365b39d; 2026-09-21 |
| HAGALAZ_DEF+.txt | Assistant-generated candidate reconstruction; explicitly not canonical | Blob f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4; first extant commit 2026-09-30 16:19:48Z |

The bylined Rotoexpando manuscript is the strongest recovered mathematical source for the framed-sphere and Hagalaz definitions. The PDF and SRT are retained as separate source witnesses: the PDF was located but not decoded; the SRT was read as a transcription, not promoted to role-authenticated Nathan Direct.

## 3. Nathan Direct geometry recovered

### 3.1 UI generator description

In the 9 September raw Build Geometry Coding Skill conversation, the user describes the original UI as a hypersphere whose radius is integrated over rotations with a full unit expansion, characterizing the construction as a kind of helical integration. The adjacent direct messages say that simultaneous rotation and expansion, or two suitably oriented 4D rotations, can make a point follow a helix-like path while its history sweeps a volume. The user also asks to factor out curvature or rotation to obtain lower-dimensional versions.

These are direct descriptive constraints. They do not yet specify:
- whether the rotation control is a 3-parameter subgroup, a pair of commuting 2-plane rotations, or a full SO(4) path;
- whether “full unit expansion” is a time/position parameter, a radius dilation, or both;
- the integration measure over rotations;
- the exact swept-image domain and its rank/regularity;
- whether factoring out rotation means quotient, gauge choice, projection, or restriction.

The user also rejects premature finite-core notation and explicitly says to retrieve Ravel’s build before inventing the core picture. That instruction remains relevant.

### 3.2 Solver-unification scope

In the Aster raw conversation, direct message d2ce6832-6d08-453f-8c52-3430a22f6e14 (2026-09-21 18:47:34.480Z) makes the active edge explicit: UI/TX, Whirligig/Donut, Spheres, Gendarme/Graticule, superhelix/hyperhelix, transformations, nesting, 4D structure, and planes of rotation are to be examined together for missing connections, equations, maps, and relations.

This is a request to integrate distinct geometric solvers. It does not say that they are identical or that one solver may silently replace the others.

### 3.3 Start-mode clarification

Direct message c1f75082-f448-414a-abab-45a8c7a8eee3 (2026-09-21 19:32:26.244861Z) conditionally specifies that, if referring to the origin of the UI two-sphere transformable, start-mode has:
- Hagalaz displacement of the origin Δc = 0;
- relative rotation Δrotation = 0;
- relative scale Δscale = 1:1.

The assistant response eac12576-0f65-4cc1-bff0-d063ebe9313f correctly narrows this to the two-sphere transformable origin and explicitly says not to treat Δc=0 as a generic UI condition.

This later direct source advances the earlier 20 September Aster provenance boundary: a start-mode condition is now source-supported, but a global identity UI = Δc=0 remains unsupported.

## 4. Primary framed-sphere / Hagalaz definition

The bylined 11 September Rotoexpando manuscript defines a framed sphere as:

\[
\mathcal S_i=(c_i,r_i,F_i), \qquad F_i\in SO(d).
\]

For two framed spheres it defines:

\[
\sigma_{ij}=\frac{r_j}{r_i},\qquad
Q_{ij}=F_jF_i^{-1},\qquad
\Delta c_{ij}=c_j-c_i.
\]

It identifies normalized framed-sphere comparison, retaining two generally misaligned frames, as the core Universal Indicatrix representation.

It defines Hagalaz as optional shorthand, with no independent ontology:

\[
H_{ij}=(\sigma_{ij},Q_{ij})
\]

or, when translation is retained,

\[
H_{ij}=(\Delta c_{ij},\sigma_{ij},Q_{ij}).
\]

The corresponding Euclidean similarity map is:

\[
T_{ij}(x)=c_j+\sigma_{ij}Q_{ij}(x-c_i).
\]

The source explicitly says the Hagalaz scale is primarily an inter-order radius comparison, not dynamic dilation, unless dynamic dilation is separately introduced. Within one fixed-diameter helical order, screw propagation may occur without dilation.

This is more authoritative than the earlier assistant synthesis that treated UI as merely a relative-frame metrology device with optional spheres. A frame-only representation may be a reduced view, but it is not the complete native UI construction unless the missing map is supplied.

## 5. Conditional start-mode identity

The direct start-mode statement now has an exact conditional translation into the primary manuscript’s variables.

If:

\[
\Delta c_{ij}=c_j-c_i=0,\qquad
\sigma_{ij}=1,\qquad
Q_{ij}=I,
\]

then:

\[
T_{ij}(x)=c_i+I(x-c_i)=x.
\]

Therefore the start-mode relative framed-sphere transformation is the identity map, conditional on the stated translation of Δrotation=0 to Q=I and Δscale=1:1 to σ=1.

This does not establish:
- that the entire UI is an identity transformation;
- that every Hagalaz step is the identity;
- that a unit Hagalaz operation is an identity;
- that the UI generator has no nontrivial trajectory or swept-volume history.

The direct source is a start-state constraint. The assistant phrase “unit Hagalaz” in RUN 091 is not adequately typed and must not be used to override that limited direct statement.

A further geometric caution follows from the primary source: at Δc=0, the center-to-center vector vanishes. Its normalized direction is undefined. The relative frame Q=F_jF_i^{-1} must therefore be carried independently; orientation cannot be reconstructed by normalizing the zero displacement vector.

## 6. Three rotation descriptions must remain distinct

The recovered sources contain three different rotation descriptions:

1. The UI characterization transcription summarizes three rotation axes and one scaling axis.
2. The raw direct chat refers to two suitably oriented 4D rotations.
3. The bylined Rotoexpando manuscript says a generic finite rotation in R4 can be put, in a suitable orthogonal basis, into two mutually orthogonal 2-plane rotations with angles θ₁, θ₂.

The assistant Hagalaz runs additionally use six SO(4) Lie-algebra channels, divided into three bending and three twist channels.

These are not interchangeable counts:
- six is the dimension of the SO(4) Lie algebra;
- two are the canonical plane-angle parameters of a generic finite R4 rotation in a suitable basis;
- three is the UI control-axis count in the transcribed characterization.

The 3+3 bending/twist split may be a useful local generator basis, but it is not yet a source-derived identification with the UI’s three controls or the two canonical plane angles. A typed representation/subgroup/lift map is required.

## 7. Scale variables must also remain distinct

At least three scale notions occur:

1. UI generator scaling, described in the direct source as supplying possible positions in time.
2. Hagalaz σ = r_j/r_i, the relative radius of adjacent framed-sphere orders.
3. Optional dynamic radial dilation, which the primary manuscript says is not fundamental to fixed-diameter screw propagation.

The manuscript separately defines inter-order diameter ratio μ = D_(n+1)/D_n and wavenumber ratio ν = k_(n+1)/k_n, and does not equate them.

The assistant RUN 092 local scale-rate α = d(log r)/dλ is a reconstruction, not a direct identification of UI time scaling with Hagalaz inter-order scale. These variables need separate types and an explicit map before composition.

## 8. Solver ecosystem: stable glossary and missing interfaces

| Solver / structure | Source-supported role | Missing interface |
|---|---|---|
| Universal Indicatrix | Framed-sphere comparison and a rotation/expansion-driven trajectory generator | Exact generator-to-framed-sphere and swept-image maps |
| Hagalaz | Optional shorthand for relative framed-sphere similarity data; no independent ontology | Adapter from each solver state into (Δc, σ, Q) |
| Three-Spheres | Primary manuscript treats it as a special constrained configuration inside the broader UI state space | Exact constraint embedding; do not conflate with the UI’s two reference spheres |
| Whirligig | Primary manuscript proposes it as a lower-dimensional compression/projection of broader phase geometry | Explicit projection, preserved invariants, and inverse/embedding conditions |
| Donut | Named with Whirligig in direct active-edge scope | Separate definition and relation to Whirligig remain unclear |
| Gendarme / Graticule | Separate angular/parity solver with two tangent references and overlapping parities | No Hagalaz adapter recovered; if parity reverses ambient orientation, SO(4) alone is insufficient, while an internal parity label would require a separate discrete state |
| Superhelix / hyperhelix | Nested helical orders and higher-order transformations | Exact nested-helix-to-framed-sphere map remains explicitly undefined |
| Finite core | Thickness, curvature, and nonlocal first-contact constraints appear in the bylined manuscript | Ravel’s specifically requested build and the map from its core data to UI frames remain unrecovered |

The earlier SAT GEOMETRIC SOLVERS.txt taxonomy—UI as broad control space, Whirligig as comparison/composition engine, Spheres as interaction/bifurcation solver, Hagalaz as unifier—is an assistant synthesis, not Nathan Direct. It may be a useful integration proposal, but it cannot replace the primary source. In particular, the primary manuscript treats Three-Spheres as a constrained UI configuration, not an independent primitive.

The HAGALAZ_DEF+ integration inventory names Three-Spheres, Whirligig, UI/TX, and hyperhelix outputs, but does not explicitly include Donut or Gendarme/Graticule despite the later direct active-edge list. That inventory is incomplete relative to the direct scope.

A conservative meaning of “unite the solvers” is therefore a typed adapter/composition layer, not ontological collapse into one solver.

## 9. Ravel build: source gap preserved

The 9 September direct instruction says to retrieve Ravel’s build before inventing the finite-core picture. The accessible Ravel workspace and later Ravel Free Build were checked. The later Free Build is a separate apparatus-ring/material-frame sandbox, not the earlier requested UI finite-core construction. Assistant-generated B³/B²/S² finite-core packets are not Ravel-authored evidence.

The earlier Ravel build itself was not recovered from the accessible raw exports or continuity records. No substitute is attributed to Ravel.

The bylined Rotoexpando manuscript does provide a generic finite-tube constraint:

\[
\inf_{s\not\approx t}\|X(s)-X(t)\|=2a,
\qquad
a<1/\kappa_{\max}
\]

for the simplest embedded-tube setting. This is a generic curvature/nonlocal-contact gate, not the missing Ravel build and not a physical material law.

## 10. Formalization status

Existing Nadir PR #1189 at head 58520f72b728f70e38c2e20192f439df9f334d92 has an exact-head verify run (#42953033586) that succeeded on 2026-11-11 03:28:55–03:32:44Z. Its current module formalizes relative framed-sphere maps, composition, and the linear-residual zero-set condition.

It does not contain an explicit theorem combining the direct start-mode conditions with center coincidence to prove T_ij = id. The conditional identity above is a straightforward algebraic consequence, but it has not been separately added or compiled. The local runtime has no Lean/Lake/Elan executable. PR #1189 belongs to the existing Nadir formalization; it was not amended. A Lean proof would verify only the formalized conditional statement, not the source-to-variable translation or any physical premise.

No new theorem, branch, PR, tool, physical calculation, CODATA score, fit, or observational validation was produced.

## 11. Existing work reused; no duplicate audit

Adjacent existing records were read and retained rather than duplicated:
- Aster’s 20 September UI/Δc provenance boundary;
- UI source/implementation crosswalk #1244 and UI source-fidelity ledger #786;
- UI origin/frame-hold issue #1090;
- Whirligig candidate-set/projection work #1330 and correction #1479;
- UI SO(4) observability/address work #425/#426;
- time-normal turning audit #1254;
- Hagalaz diagonal-stretch closure gate dated 9 October;
- Nadir PR #1189.

The new delta is the role-authenticated 21 September start-mode clarification, reconciled with the 11 September bylined framed-sphere definition and the earlier 9 September direct UI generator description. It is not a repeat of the broad UI crosswalks.

## 12. Next deeper cursor

1. Recover and independently inspect the original two-page UI characterization PDF; compare it line-by-line with the transcribed witness and the 9 September raw conversation.
2. Recover the specific earlier Ravel build referenced on 9 September. Do not substitute the later apparatus-ring Free Build or assistant-generated finite-core packets.
3. Define the nested-helix-to-framed-sphere map explicitly, including center, radius, frame, phase, handedness, finite-core thickness, regularity, and inverse/losslessness conditions.
4. Define the UI trajectory/sweep map as a family of framed-sphere transformations, and distinguish its time/position scale from Hagalaz inter-order radius scale.
5. Resolve the 3-control / 2-plane-angle / 6-generator rotation correspondence.
6. Define typed adapters for Whirligig/Donut, Three-Spheres, Gendarme/Graticule, and superhelix/hyperhelix; carry discrete parity separately if required.
7. Add and compile the conditional start-mode identity theorem in an authorized Lean location after coordination with the owner of the existing formalization.
8. Once a Mersearch lane is released, continue the direct-source lexical sweep requested in the Aster thread: Laplace, Laplace-Beltrami, operator, Solenoid, Silence, Quiet, Consciousness, punctuation-only turns, and acute hyperellipsisosis. The four current request lanes remain occupied; none was overwritten or retriggered.

**Epistemic status:** primary geometric definitions recovered; one conditional identity derived; equivalence/lossless-conversion claims remain hypotheses pending explicit maps and proofs; no physical theory or observational claim follows.
