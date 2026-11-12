# 2025 time-slab and intersection-angle source-fidelity addendum

**Additive note to:** issues #1281, #1343, #1495, and #1592  
**Status:** Historical direct-source recovery. No theory promotion, physical calculation, or CODATA scoring.

## Source custody

- Raw conversation: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/25.12.08•26.06.01•SAT theory clarification — raw.json
- Conversation ID: 69378c7f-6320-8325-9e10-83e42fe1433c
- Raw Git blob SHA-1: 507a7000082415373ee98dbc95f18a991dff3c5a
- Recovered export: 996 mapping nodes; the relevant direct user turns are on the recovered current ancestry.
- Direct user messages:
  - 05c717ab-0d0c-4c0a-b4a4-3d1b3d6c5c6e, 2025-12-09 03:37:21Z
  - 75d25e2b-923b-4db2-b56f-202895213fc9, 2025-12-09 04:16:50Z
  - 9561f902-e3cb-43d5-93e1-cdffab706a1f, 2025-12-09 04:18:16Z
  - 946f19e0-66af-405a-b7d0-72043f5407c9, 2025-12-09 04:29:40Z
- Relevant assistant replies are separately attributable: b30b968f-9fad-477d-bebc-d94abc790357 and bb329e11-1d41-4867-8122-05a2777fbb14. They are historical LLM output, not Nathan Direct.

## Nathan Direct propositions

1. A propagating time-field slice may have finite temporal thickness in the 4D block. A change in a particle trajectory across such a slab requires an energy-exchange relation between the trajectory and the propagating slice.
2. The intersection angle is proposed as the natural geometric encoding of time-trajectory interaction and force/energy transmission. The source explicitly leaves open whether the trajectory changes, the time field distorts, or both respond.
3. The user immediately marks this angle as the difficult, unsolved part of the model. It must not be reported as already derived.
4. The same conversation proposes correspondences: spacetime as a surface trace of vector intersections, GR as time-field distortion from interactions, quantization as holonomy, QCD as braided coil vectors, and particle properties as classical wave mechanics. These are direct hypotheses, not established mappings.

## Historical assistant translation and fidelity discrepancy

The assistant response to 75d25e2b upgrades the proposed angle into a fully general scalar that supposedly reduces all interaction complexity. The response to 946f19e0 further describes the proposed correspondences as sufficient to encode all fundamental physics. Neither claim is established by the user messages or by a derivation in that conversation.

The direct user statement that the intersection angle is the hard part controls the source interpretation. A proposed variable is not a defined variable, a complete interaction law, or a proof.

The 2024 moving-helix/slice geometry does not imply quantization. Its formalized result depends on slice orientation: a perpendicular moving slice gives a circular trace; a tilted slice gives an ellipse, with a corresponding change in phase rate. A geometric intersection result alone does not establish a compactification, holonomy quantization, or a particle spectrum.

## Relationship to later source material

Later 2026 direct sources describe a 3D timesheet/time bulk interacting with finite-core worldtubes and explicitly retire the earlier reciprocal filament/timesheet-deformation model. The Klein Fabric and local worldtube source chronology is documented in issues #1343 and #1374; the local-radiality/time-normal source map is in issue #1495; the Kerr/ER observation-map report is in issue #1592.

Keep these objects distinct until a source-grounded map exists:

- S_Δt: the historical finite-thickness 4D time slab.
- Σ: the later 3D timesheet/time-bulk description.
- alpha_int: the 2025 intersection angle proposed for trajectory/time-field interaction.
- theta4: the later sheet-relative, inverse-pitch/oblateness-associated angle.
- theta: the compact phase in the historical assistant-generated Blockwave action.

No direct source currently identifies these angles or phases as the same variable.

## Existing Lean work and limits

- PR #873, exact-head run 42955799035, head 8f49c39c8428e3d0195a8d6abd3d613aa786de4d: the changed KestrelMovingSlice and KestrelProjectedIncidence modules compiled. They formalize conditional moving-slice geometry and a generic projection-factorization criterion; the changed files contain no sorry.
- PR #1133, exact-head run 43109180575, head 19479ee3fad0e96c4f0ddb4f79842f4a5ab9bb61: RavelCarrierSheetDimensionGate and RavelCarrierSliceReconstruction compiled. The changed modules are sorry-free. However, the run's axiom log includes Real.ofCauchy (sorry ...) in RavelNormalConnectionReduction, and the workflow sets nanoda-allow-sorry: true. This is not a repository-wide no-sorry audit.
- PR #1594, exact-head run 43006069897, head 136071f6b0665d28a4a77611712a53aeca74fe8c: EnheduannaSweepBoundaryGate and NadirHelixSliceGeometry compiled. The sweep-boundary result is conditional on its product-sweep assumptions.

The dimension-gate formalization distinguishes an exact 3D slice from a finite-thickness 4D slab and derives conditional intersection-dimension counts. It does not establish that the physical timesheet is an embedded hypersurface, or that the historical slab is the current timesheet. The Lean runs check only their formalized statements. They do not validate the translation, the source interpretation, or any physical premise.

## Typed map contract and open gaps

A source-faithful continuation requires:

1. A metric and explicitly typed tangent/normal pair before alpha_int can be treated as an angle with dynamical meaning.
2. A defined relation between S_Δt and Σ, including the thickness coordinate, foliation, boundary conditions, and projection or pullback.
3. A global-to-local map from the Klein Fabric to a family of finite-core worldtubes.
4. A map from worldtube histories to a braid object in a specified configuration space, with strand count, framing, endpoints or closure, collision exclusion, observer projection, and admissible deformations.
5. A composition/factorization test. A downstream observable factors through a projection only when it is constant on the projection's fibers.

No material-flow parameter is assumed. No physical system, measurement dataset, calculation, fit, prediction, or CODATA comparison is introduced here.

## Next cursor

Recover a source-defined S_Δt to Σ relation and a metric definition for alpha_int. Then test the resulting map against the existing Kestrel fiber-compatibility criterion. Keep the Klein Fabric global-to-local map explicitly missing until direct source or a derived, typed map supplies it.
