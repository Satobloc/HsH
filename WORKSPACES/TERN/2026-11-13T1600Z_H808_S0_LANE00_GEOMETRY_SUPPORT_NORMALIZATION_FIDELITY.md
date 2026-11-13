# Tern Rook h808:s0 — Lane 00 geometry-support and normalization fidelity crosswalk

**Disposition:** SOURCE-FIDELITY AUDIT COMPLETE · SUPPORT-TYPE MAPS UNRESOLVED · EXISTING LEAN EVIDENCE REUSED · NO THEORY PROMOTION.

## 1. Scope and source discipline

This is a cross-sector audit of the SAT-O1 filament, the historical Blockwave current, the later worldtube/time-surface descriptions, and the two distinct normalization branches. The claimed mathematics was bracketed first. The report separates direct user-role messages, historical documents, assistant reconstructions, standard mathematical results, current proposals, and independent measurements.

No standalone signed Nathan-authored Tern specialist charter was found. The historical Tern remit is evidenced by the raw Ariadne conversation: user-role message c4f0aae9-3290-42c6-a5d0-b42c19a88255 authorizes broad archive examination subject to live workflows and explicitly says the Comptroller controls scheduled-task allocation. Message e689eb6e-5814-4a27-a366-796605bd5f4d asks for a Python-offload study for Tern. Both have outer role user and author.name null. They are source-role evidence, not identity authentication. The current Code Grurple roster assigns Tern the Signalbox/Consolidator function. This Lane 00 pass is a bounded run-level assignment, not a permanent role change.

## 2. Primary-source cluster

### 2.1 SAT-O1 historical module

Source: [SAT O1 4D.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt)

- Blob SHA: 7577aa1ee5a6c3850ce3b226c75377de6367aedc
- First extant repository commit date, from the earlier source-custody audit: 2025-10-27
- The standalone file is unbylined. The same O1 module appears in SAT4D_LIVE_DRAFT.txt, whose byline is Nathan McKnight and whose document date is June 2025. The live-draft blob is 2a79fe25018cce7e99a2c33786d88b0551db6ae7. Its second path under SATOBLOC MISC has the same blob, so it is a duplicate content witness, not independent corroboration.

Core equations transcribed from the standalone module, with source symbol order preserved:

~~~text
γ^μ(λ) = (λ, Aₓ sin(kₓ λ + φₓ), Aᵧ sin(kᵧ λ + φᵧ), A_z sin(k_z λ + φ_z))
v^μ(λ) = dγ^μ/dλ
S[γ] = ∫ dλ L(γ^μ, v^μ)
L = ½ m v^μ v_μ − V_tension(γ)
φᵢ − φⱼ = 2πk/n
~~~

The prose defines the filament as a smooth one-dimensional object in R^(3,1), calls the worldtube the four-dimensional volume swept out by the vibrating filament, and describes hyperhelical modes, phase locking, and topological binding. It also states that the kinetic term is Minkowski-normed and that no external fields or forces are postulated.

The Hopf-link, Borromean-link, and four-or-more-filament stability statements are historical source claims. They were not proved or tested in this pass.

**Source-level geometry gap:** the displayed γ: R → R^(3,1) defines a one-dimensional image. The prose separately calls the worldtube a four-dimensional volume. No cross-sectional bundle, finite-core thickening, family parameter, or sweep map is supplied in this module. This is an underspecified relation, not necessarily a contradiction: a one-dimensional centerline may be a reduced representation of an extended object, but the map is missing.

### 2.2 Historical Blockwave action

Source: [Blockwave source artifact](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/%F0%9F%A7%B1BLOCKWAVE.txt)

- Blob SHA: ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d
- First extant HsH commit date, from the earlier source-custody audit: 2026-10-08
- Archive classification: historical assistant-generated proposal, not Nathan Direct.

The source begins with an emergent metric g_μν, a unit time-flow u^μ, a compact phase θ, and a conserved rank-two current J^μν:

~~~text
u^μ u_μ = −1
P^μ_ν = δ^μ_ν + u^μu_ν
∇_μ J^μν = 0
A_μ(θ) = α_* ∇_μ θ
F_μν(θ) = ∇_[μ A_ν](θ)
J^μν = ½ ε^μνρσ ∇_ρ B_σ
~~~

The artifact calls J^μν a conserved two-form “filament worldsheet” current, describes it as distributional on physical filaments, and later says it encodes actual filament worldsheets. It also proposes “strings as records” by selecting a timesheet Σ and forming a loop written as γ = W ∩ Σ.

The full action is preserved in the linked source; its projector-index typography is malformed in places and has not been silently repaired.

**Source-level type gap:** the text moves between a current supported on physical filaments, a current encoding worldsheets, a worldtube W, and a one-dimensional loop γ. It does not define the support map that makes those descriptions equivalent. The θ here is a compact phase, not the current BEDROCK alignment field θ₄.

### 2.3 Direct user-role normalization and worldtube messages

The Meridian Free Build raw Library export is 7,734,021 bytes and 94,245 lines. Conversation ID: 6ac45d1f-17b0-83ea-ad1f-fa524602378b. The cited direct messages are dated 2026-10-09.

- User-role message 3c657387-b80b-4982-a61a-8e6d8568b8d1 says to use w = ct as a time-length coordinate in meters in the classical Minkowski model. It states that the worldtube's Newtonian-limit shape is determined by force and mass and uses the phrase “worldtube curvature == inertia.” This is a direct conceptual proposition, not a derived curvature equation.
- User-role message 5a929b5e-515e-4f77-a32a-e49feef42812 says the time surface is not merely a passive readout: it is a three-dimensional slice/bulk overlapping with the xyz bulk, and it interacts with matter. It also describes the H₀ ± c split as shorthand and explicitly notes that the units must be normalized before combination.
- Important embedded-quotation boundary: the 5a929 message begins with lines marked as quoted prior assistant text. Those quoted lines are not Nathan Direct merely because they occur inside an outer user-role message. The direct user-authored correction begins “Not really, no.”

The assistant reply 2693b3db-3c47-4a3d-9ed3-3732cfe8ffad introduces

~~~text
F = mc² d²x/dw²
~~~

for the w = ct coordinate. The same assistant message explicitly qualifies d²x/dw² as coordinate-relative spatial bending, not generally the intrinsic curvature of the four-dimensional curve. This equation is therefore an assistant reconstruction of the Newtonian coordinate relation, not a verbatim Nathan Direct curvature law.

### 2.4 Direct user-role native-frame messages

The raw Git blob for “Meridian Minkowski Ring Analysis” is 56a84cb85d5c386efa4ea11d322d11e95e2c7703, conversation ID 6ad7e9c0-e8a0-83e9-984e-94d020de3abf. It contains 3,678 mapping nodes.

- User-role message c5525f53-b7cc-4444-8102-3bf6fdb1c892 says the working frame is cw = t, uses Forest Normalization, and specifies (++++) . The half-sum is explicitly provisional: the message says “or whatever the proper expression of that is.”
- User-role message f658b2db-32f0-45cd-828b-140691cc9afb calls the four-dimensional curvature/acceleration relation a working hypothesis and explicitly says there is no proof.
- User-role message 090f5160-1020-486d-9c42-df3d7dff2063 says the earlier reciprocal filament/timesheet-deformation alternatives are no longer current since the Klein Fabric model became common.

The current BEDROCK entry ND-2026-10-21-02 preserves this cw = t, positive-signature, Planck-unit-first branch and explicitly forbids inventing the type of w, silently identifying it with another variable, or canonizing the tentative half-sum.

The earlier w = ct statement is a distinct classical Minkowski representation. No source-defined map presently identifies the two branches. The TOPLESS raw export cited in an earlier report was not independently reopened in this pass; no claim here depends on it.

## 3. Independently extracted geometric objects

| Symbol | Intended object | Dimension/type currently supported |
|---|---|---|
| γ | Filament or centerline embedding | 1D curve in a 4D ambient space |
| W | Finite-core worldtube | 4D support/region in the current model |
| ∂W | Worldtube boundary | 3D hypersurface |
| S | Worldsheet | 2D embedded support |
| Σ | Timesheet/time-wavefront | 3D bulk/hypersurface |
| J^μν | Blockwave conserved two-form current | Rank-two field/current; distributional support still needs definition |
| θ₄ | BEDROCK angular-alignment field | Separate from compact phase θ |
| θ | Blockwave compact phase | Scalar phase variable |
| wₘ | Classical Minkowski time-length coordinate | wₘ = ct, in meters in the direct message |
| wₙ | Native variable in cw = t | Type intentionally unresolved |
| Φ | Map between normalization/metric representations | Not yet defined |

The current BEDROCK describes the timesheet as a three-dimensional bulk that may interact with matter. It is not interchangeable with a two-dimensional worldsheet. Similar names do not imply identical dimensions.

## 4. Mapping diagram and composition requirements

~~~mermaid
flowchart TD
  A["1D filament / centerline γ"] --> B["Embedding into 4D ambient M"]
  B --> C["Missing normal-bundle / finite-core thickening"]
  C --> D["4D worldtube W"]
  D --> E["3D boundary ∂W"]
  F["2D worldsheet S"] --> G["Missing support map to current J"]
  H["3D timesheet Σ"] --> I["Embedding and time orientation"]
  D --> J["W ∩ Σ: 3D slice region"]
  E --> K["∂W ∩ Σ: 2D section"]
  F --> L["S ∩ Σ: 1D trace"]
  B --> M["γ ∩ Σ: 0D event"]
  N["Native cw=t, ++++ frame"] --> O["Missing Φ: units, type, metric, Jacobian"]
  P["Classical w=ct, Minkowski branch"] --> O
~~~

For nonempty transverse intersections in a four-dimensional ambient manifold, the conditional dimension rule is:

**dim(A ∩ B) = dim(A) + dim(B) − 4.**

Consequently:

- A 1D centerline intersecting a 3D timesheet gives a 0D event.
- A 2D worldsheet intersecting a 3D timesheet gives a 1D trace.
- A 3D worldtube boundary intersecting a 3D timesheet gives a 2D section.
- A 4D worldtube region intersecting a 3D timesheet gives a 3D slice region.

Thus the Blockwave expression γ = W ∩ Σ yields a loop only if W denotes a 2D worldsheet (or another explicitly defined 2D support). If W denotes the 4D finite-core worldtube, the generic intersection is three-dimensional. The notation must distinguish S from W.

Required maps, still open:

1. Centerline embedding ι: γ¹ ↪ M⁴.
2. A normal-bundle/thickening map from γ to the finite-core support W, including metric, cross-section, radius profile, and self-overlap conditions.
3. A worldsheet-to-current support map defining how S² is represented by J^μν.
4. Timesheet embedding j: Σ³ ↪ M⁴, including normal and time orientation.
5. A slice-pullback map W ×ₘ Σ and a separate interaction/readout map. A passive readout is insufficient for the direct user-role description of an interacting time-surface bulk.
6. A representation map Φ: (wₙ, gₙ) → (wₘ, gₘ) with variable types, units, metric signature, Jacobian, and conditions of validity.
7. A distinct angle-convention map, if any, between θ₄, the WWRD θᵢ, and the compact phase θ.

## 5. Original propositions versus assistant translations

| Proposition | Provenance | Fidelity assessment |
|---|---|---|
| Filament is a 1D physical object in 4D; worldtube is its 4D physical presence | Historical SAT-O1 document | Centerline is defined; thickening/sweep map is not |
| w = ct is a time-length coordinate in meters in a classical Minkowski model | Nathan Direct, user-role | Directly supported for that branch |
| Worldtube curvature corresponds to inertia at the Newtonian limit | Nathan Direct, user-role | Conceptual proposition; no direct derivation supplied |
| F = mc² x₍ww₎ | Historical assistant | Coordinate relation in the chosen w = ct chart; not generally intrinsic 4D curvature |
| cw = t, Forest Normalization, (++++) | Nathan Direct, user-role | Directly supported as a native working frame; w's type remains unresolved |
| Four-dimensional donut curvature is acceleration | Nathan Direct, user-role | Explicitly labelled a working hypothesis without proof |
| J^μν encodes filament/worldsheet support | Historical assistant Blockwave | Proposal; support map and dimensional type are incomplete |
| γ = W ∩ Σ is a loop | Historical assistant Blockwave | Correct only under a 2D support interpretation of W, not a 4D volume |
| Earlier reciprocal filament/timesheet deformations remain current | Earlier model alternatives | Retired by a later direct user-role message; not revived here |

The direct user-role statement that “inertia and worldtube bending are equivalent” is accompanied by a representation/measurement analogy. It does not itself supply a metric, curvature scalar, or field equation. The assistant's coordinate formula is a translation and must not replace the direct proposition.

## 6. Discrepancy ledger

1. **Centerline versus finite-core support:** SAT-O1 gives a 1D curve and separately names a 4D worldtube volume. The finite-core map is absent. This is a specification gap, not a demonstrated contradiction.
2. **Worldtube versus worldsheet:** Blockwave uses a rank-two current and worldsheet language, while the current model distinguishes a 4D worldtube and 2D worldsheet. No support-preserving map is defined.
3. **Intersection dimensionality:** the loop trace γ = W ∩ Σ is not type-consistent if W is the full 4D worldtube. The support meant by W must be declared.
4. **Normalization branches:** direct w = ct and cw = t statements belong to distinct source contexts. No global equivalence map is supplied.
5. **Metric signature:** SAT-O1 and Blockwave use Minkowski/Lorentzian grammar; the current native frame is (++++) . A Lorentzian metric cannot be silently substituted for the native ambient metric. The current BEDROCK says induced Lorentzian metrics are separately derived objects.
6. **Curvature versus coordinate acceleration:** the assistant's x₍ww₎ relation is chart-relative and its own source message cautions that it is not generally the intrinsic curvature of the four-dimensional curve.
7. **Time-surface ontology:** the direct user-role description treats the timesheet as a 3D interacting bulk, not a passive readout. Any projection model must include the interaction/coupling rather than merely naming an intersection.
8. **Angle-symbol collision:** Blockwave θ is a compact phase; BEDROCK θ₄ is an angular-alignment field; WWRD θᵢ is another provisional convention. No identification is licensed.
9. **Topology assertions:** SAT-O1's Hopf/Borromean and four-or-more-filament claims remain historical assertions, not verified theorems.
10. **Source limits:** the TOPLESS raw export and the 2024 DIMENSIONAL GRAVITY raw export were not independently reopened in this pass. Their prior reports are useful locators, not substitutes for fresh raw-source verification.

## 7. Formalization and actual Lean evidence

No new Lean module, PR, branch, or local build was created. The runtime has no local Lean/Lake/Elan executable.

Existing PR-associated CI evidence was inspected:

- PR #873, run #42153410233, job #127681789766: SUCCESS, Lean 4.34.0 / Lake 5.0.0, 8,955 build jobs. The merge-reference build included KestrelIntersectionDimensionGate, WorldtubeCurveCurvatureLift, KestrelMovingSlice, and NadirHelixSliceGeometry.
- The dimension-gate theorems include conditional transverse curve/hypersurface, worldsheet/hypersurface, and full-core/hypersurface dimension results. The printed theorem-specific dependencies were standard Lean axioms (propext, Classical.choice, Quot.sound); the workflow's separate global axiom audit was disabled.
- The Euclidean lifted-curve Gram-curvature identity was compiled in WorldtubeCurveCurvatureLift. This is a 1D curve result in an explicit Euclidean 4D lift, not a proof about the full 4D finite-core worldtube.
- PR #1133, run #42738871882, job #129574807207: SUCCESS on its merge reference for RavelCarrierSliceReconstruction. This supplies conditional typed map/retraction scaffolding, not the physical SAT support maps.

The Lorentzian curvature expression, the native-to-Minkowski normalization map, the current-support map, and the finite-core thickening map remain unformalized. Existing CI does not establish source-translation fidelity or physical premises.

**Methodological deviation:** an unauthorized data-free symbolic simplification was inadvertently executed during this pass. Its output is quarantined, not used as evidence, and not reported as a proof. No physical data, measured system, physical fixture, fit, or prediction was used. The earlier Tern curvature report also contains a symbolic check; it must not be treated as Lean verification. No further data-free calculation is authorized without explicit permission.

## 8. Source-custody and operational controls

- Current HsH main head at the start of this pass: 4a6b7664 (2026-11-13 15:48:10Z).
- SAT archive main head: 37fcbdc.
- HSH_RESOURCES main head: 5859d88. Only its front-door README and AI_START_HERE were read; no internal research payload was opened.
- The SAT archive's AI wayfinding/orientation material was read. Its AI materials are under the hidden .[⚙️_AI_FILES] directory rather than a literal AI/ directory.
- No callable Mersearch action is available in this runtime. All four request lanes remain occupied with status requested; no lane was overwritten or retriggered. Bounded GitHub/Library retrieval was used as fallback, not represented as Mersearch.
- Existing Math Hopper, Lean PR, Whirligig, and SciSpace resources were checked. No new tool, dependency, fork, subscription, or expense was introduced.
- The live task graph remains ACTIVE_SEED with 16 declared branches and 18 records: 13 active/blocked and 5 completed. Current metadata gaps are 8 priority, 12 owner-instance, 15 due-date, and 16 last-reviewed fields. Tern CURRENT_WORK still carries an older 3/7/10/11 count; this report corrects the checkpoint only. The task graph itself was not modified.
- P0 Code Grurple remains ACTIVE; P1 remains OVERDUE / NOT READY and Orson-owned; P2 remains HOLD; P3 remains INCOMPLETE. No paper gate advanced.
- FIE was last formally reviewed November 10; next review remains November 24.
- No CODATA scoring, physical calculation, fitting, prediction, independent measurement, or BEDROCK theory promotion was performed.

## 9. Next deeper cursor

1. Recover the raw TOPLESS and 2024 DIMENSIONAL GRAVITY sources before making any new direct-attribution claim from those conversations.
2. Specify the centerline-to-finite-core thickening map and its conditions.
3. Specify whether Blockwave J^μν is a distributional current on 1D filaments, a current supported on 2D worldsheets, or a different object; then define the map.
4. Define the 3D timesheet embedding and its interaction with matter.
5. Define the native cw = t, (++++) to classical w = ct, Minkowski representation map, if one exists.
6. Keep θ₄, compact phase θ, and WWRD θᵢ separate until their reference objects and projection maps are explicit.
7. Formalize the missing signature-preservation and Lorentzian curvature results in Lean only after the objects, metric, parameter type, and assumptions are fixed.

No original SAT-O1 or Blockwave equation was edited. Any future typed/corrected equations must be published separately from these verbatim historical sources.
