# WORKSHOP RELAY h723:s0 | Amendment 02
## Source-delta correction and Lean module-level audit

This is an append-only technical amendment to the canonical h723:s0 receipt and Amendment 01.

### 1. Scope correction after prior-work review

The prior public Mira-labeled submissions were read in full. They already cover the 2025 SAT/Blockwave action-family crosswalk, the 2025 direct worldline/time-wavefront baseline, much of the October 9 finite-core/coil description, the October 21 supersession, and earlier curvature/CI findings. The current run must therefore be described as a delta, not as a fresh comprehensive first audit.

The new source delta is principally:
- August 26-27 direct Klein Fabric language: global fabric of twisted worldtubes, toroidal/Klein-like self-recirculation, and explicit non-equivalence between the global fabric and the local dual-shell realization.
- October 10 direct statement separating SAT worldlines from H(s)H worldtubes and rejecting a spherical carrier as SAT.
- Current Primary Operational Guideline clarification: worldtube preferred where finite spatial extent/internal structure matters; timesheet complementary; responsive medium remains a provisional third primitive. The active time bulk must not be silently identified with either timesheet or medium.
- Current main/PR CI readback and the explicit type conditions below.

The October 9 one-core/hollow-coil, 3D trace, active-time-bulk and worldtube-curvature statements, plus the October 21 reciprocal-model supersession, are already substantially covered by the prior Mira geometry-fidelity/curvature-CI report. They are retained in the canonical receipt as continuity context, not claimed as novel.

### 2. Angle-convention clarification

The current BEDROCK records θ4 as measured from the time normal, with θ4=0 in vacuum and 90 degrees relative to the sheet. The August 27 source's 90-degree vacuum-limit language may be complementary-angle shorthand. No complete metric, oriented frame, or operator definition was found to prove that reconciliation. Keep both source statements and the convention question visible; do not silently choose one.

### 3. Lean source inspection

The following module source files were inspected at the current PR heads:
- KestrelIntersectionDimensionGate
- KestrelProjectedIncidence
- SableCurrentSupportDegreeGate
- RavelCarrierSheetDimensionGate
- RavelCarrierSliceReconstruction
- RavelTwoFormCurrentProjection
- MercerBlockwaveExactPhaseCurvature

No literal sorry, admit, or axiom declaration was found in the inspected module texts. The modules contain #print axioms commands, but the corresponding CI output was not captured for a complete dependency-axiom audit. Do not claim a global axiom-free result.

Additional formal scope:
- KestrelIntersectionDimensionGate proves the conditional transverse dimension ladder. It explicitly does not identify which physical support is present.
- KestrelProjectedIncidence proves that non-injective readout can create spurious overlap and that a downstream map factors through a projection iff it is constant on each projection fiber. It also distinguishes source-level agreement from observable/readout agreement.
- SableCurrentSupportDegreeGate separates support dimension, Poincare-dual form degree, Hodge degree, sweep, and boundary. Its representation records demonstrate that a degree projection is non-injective: equal degree does not identify the underlying operation or support.
- RavelCarrierSheetDimensionGate distinguishes an exact hypersurface from a finite time slab. A full 4D core has a 3D trace on an exact transverse hypersurface, but occupies a 4D region in a finite slab. It also exposes the empty-versus-point ambiguity in a natural-number dimension helper.
- RavelCarrierSliceReconstruction supplies set-level fibered-support and pullback maps, with commuting ambient maps and a union-of-fiber intersections result. Its own source explicitly does not assume continuity, smooth manifold structure, a metric, or an expansion law.
- RavelTwoFormCurrentProjection uses Fin 4 and real components. It does not encode a metric, raising/lowering, a Levi-Civita connection, a physical unit timelike field, the source's worldsheet support, or a constitutive law. Its product-rule expression and contracted two-form-conservation premise are explicit inputs. The projected vector is spatial relative to u and lacks a charge density. Conservation requires the vorticity contraction to vanish.
- MercerBlockwaveExactPhaseCurvature is a local exact-form identity for a smooth single-valued phase and constant coefficient. It does not supply defects, patching, nontrivial bundle data, or a physical holonomy mechanism.

### 4. CI checkout semantics

The inspected Lean verification workflow uses actions/checkout with no explicit ref override. For pull_request events this is the synthetic PR merge ref, not an exact-head standalone checkout. The current verify runs for PRs #873, #1098, #1133 and #1235 succeeded as PR-event builds; exact-head standalone builds remain unverified. The workflow builds the Lean project but the test and lint stages are skipped. The run metadata field head_sha names the PR event head and does not by itself establish the checked-out merge ref.

### 5. No change in epistemic status

These theorems establish conditional mathematical statements under their formalized assumptions. They do not establish that SAT is true, that H(s)H has a 4D physical support, that the Klein Fabric is a particular manifold, that a physical current exists, or that the translation from Nathan Direct prose is sound. No physical calculation, counterexample claim about nature, observational validation, CODATA scoring, or theory promotion was performed.

No new public issue is warranted: the prior action-family and geometry-fidelity submissions plus issues #1191, #1376, #1418, #1425, #1509, and #1530 already cover the relevant source and map/projection territory. This amendment is internal receipt clarification only.
