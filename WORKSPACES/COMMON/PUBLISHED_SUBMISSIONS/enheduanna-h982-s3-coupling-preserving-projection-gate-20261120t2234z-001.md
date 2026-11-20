# Coupling-Preserving Projection Gate (CPPG) v0.1

**Status:** Proposed workflow addendum. Not a theory promotion, physical result, or replacement for the H(s)H Terminology and Representational Standard v0.1.1.
**Integration point:** supplements the standard's coupling and decomposition rules in Sections 4.1-4.3, and the existing CBCM, TPRC, and PDR proposals.

## 1. Purpose

When a model decomposes coupled structures, projects them to a coarser representation, or relocates dynamics among candidate carriers, it must preserve the coupling relation required by the claim. A scalar observable surviving projection does not prove that the structural relation survived.

CPPG turns the existing source rule into an admission test: decomposition may be a useful mathematical representation, but it does not grant the components independent variability. A projection is admissible for a structural claim only if the joint observable and coupling signature survive it, exactly or under a declared and calibrated error bound.

## 2. Source-version boundary

The following source epochs must not be silently collapsed:

| Source epoch | Status and permitted use |
|---|---|
| FIE, February 2026 | Historical conceptual source: filament/worldline, time surface or wavefront, intersection readout, interaction/backreaction language, helical traces, and a holonomy extension. It is not by itself the current Klein Fabric model. |
| October 21, 2026 direct correction | Supersedes the earlier reciprocal deformation alternatives and the simple intersection-only construction as the current model. Do not restore those alternatives as current ontology. |
| November 4, 2026 direct position | Current tentative working hypothesis: mutual worldtube-timesheet curvature, with worldline-only and timesheet-only descriptions left open as potentially equivalent representations. Even split is a default allocation rule only when no preferential carrier is evidenced. The double shell is an approximation, not a second established primitive. |
| November 5, 2026 direct clarifications | Three candidate carriers are discussed: worldtube, timesheet, and responsive medium. The medium is required in the Electrogravity action-at-a-distance account, but its relation to the timesheet remains unresolved. Coupling is a coincidence or a defined relationship. Observation, geometric representation, and mathematical abstraction are not ontology. |
| November 8 control overview | Assistant-authored synthesis of the later working position. It is not an independent Nathan Direct source. |

The November 4-5 material is a later tentative model version, not a revival of the October 21-retired construction. The old FIE interaction language must not be imported as a current constitutive law without a later source and an explicit map.

## 3. Current feature classification

| Feature | Current classification | What remains unresolved |
|---|---|---|
| Intrinsic filament thickness | Qualitative source commitment recorded in BEDROCK ND-2026-10-18-07 | Support dimension, cross-section, profile, units, magnitude, uncertainty, and thickening map |
| Mutual worldtube-timesheet curvature | Tentative working hypothesis, not established physics | Curvature objects, source-to-model map, allocation law, metric relation, and observable consequence |
| Worldline-only or timesheet-only representation | Candidate reduced representations | Forward/reverse maps and preservation of the joint observable and coupling signature |
| Responsive medium | Source-required in the Electrogravity action-at-a-distance account; provisional third carrier in the current working model | Whether it is distinct from, equivalent to, or an elaboration of the timesheet |
| Twist or helical excitation | Multiple candidate modes: surface ripple, propagating structural loop/twist, persistent coil | No selected mode, normal-bundle connection, transport law, or independent observable |
| Holonomy | Historical FIE extension proposal | No current connection, loop, holonomy group, representation, or quantization map |
| Contact surface or contact law | Not forced by the current source | A coupling relation may be point coincidence or a defined relation without a separate contact surface |
| Double shell | Approximation of the universal-gravity-well picture | Projection to the global fabric and preserved invariants |
| Klein Fabric global topology | Descriptive working model | Dimension, topology, atlas, metric, gluing, causal structure, and embedding maps |

BEDROCK uses `epsilon` locally as a label for intrinsic core thickness, but supplies no numeric current H(s)H value or profile. The shared symbol registry marks `SAT:epsilon` as historical and unresolved and explicitly says it does not establish current H(s)H core or shell thickness. Do not reuse bare `epsilon` for an observable-distance tolerance. Until a symbol-registry update is source-cleared, use a descriptive field name such as `observable_distance_bound`; do not introduce a new shared symbol.

The historical coil radius `ell_f` is not the intrinsic thickness. No historical numeric candidate is promoted to a measured core scale.

## 4. The CPPG record

Every reduced or alternative representation must record:

1. `source_version_id`: exact source epoch, source locator, authority class, and whether the source is current, tentative, historical, or superseded.
2. `carrier_set`: the active carriers in scope, selected from worldtube, timesheet, responsive medium, or a source-justified subset.
3. `coupling_signature`: the exact coincidence or defined relation that connects the carriers for the claim being made.
4. `projection_maps`: each map's domain, codomain, regularity assumptions, fibers, and composition order.
5. `joint_readout`: the observable together with the coupling signature needed to support the structural claim.
6. `approximation_record`: metric, units, error bound, calibration data, and holdout policy if exact preservation is not claimed.
7. `equivalence_witness`: forward and reverse maps plus composition conditions if two carrier descriptions are claimed equivalent.
8. `evidence_lineage`: measured system, raw dataset version, acquisition units, instrument and calibration IDs, covariance, shared and nuisance parameters, holdout exposure, and standard comparator.

## 5. Joint projection criterion

Let `X` be the full coupled state, `Y` a reduced representation, and `P : X -> Y` the joint projection. Let `O : X -> Obs` be the declared observable and `C : X -> Coupling` the coupling signature. Define the joint readout:

```text
Q(x) = (O(x), C(x))
```

A reduced joint readout `Qbar : Y -> Obs x Coupling` exists exactly when:

```text
P(x) = P(x')  implies  O(x) = O(x') and C(x) = C(x')
```

In words: the joint readout must be constant on every fiber of the projection. This is the existing fiber-factorization criterion applied to a product-valued readout.

Two failure cases must be distinguished:

- If `O` is constant on projection fibers but `C` is not, the scalar observable may survive while the structural coupling claim does not. The reduced representation is not admissible for the full claim.
- If neither `O` nor `C` is constant on fibers, the projection loses both observable and structural information. Retain the omitted state, enrich the representation, or provide a calibrated correction map.

For approximate reduction, define metrics for both observable and coupling-signature spaces. State the joint error bound and how it composes across successive projections. Do not reset or silently discard accumulated error.

## 6. Multi-carrier and composition rules

For worldtube `W`, timesheet `T`, and responsive medium `M`, use a joint state and joint projection when the claim depends on their relation. Independent projections `P_W`, `P_T`, and `P_M` are not sufficient unless the projected coupling relation is also defined and preserved.

A worldline-only, timesheet-only, mutually distributed, or three-carrier description is equivalent for a declared readout only if:

- the source version permits the representation;
- the forward and reverse maps are typed and defined on the declared domain;
- their compositions are identity maps or satisfy a stated approximation bound on the relevant readout;
- the joint observable and coupling signature are preserved;
- any change in carrier attribution is justified by evidence or explicitly marked as a representational convention.

The even-split default is not a claim of equal physical curvature, equal energy, or empirical equality. It is a provisional allocation rule when no preferentially instrumental carrier is known.

Keep the time front and its propagation direction `w` as distinct objects. Do not silently identify the front with the direction of propagation or normalize the historical `w=ct` and `cw=t` notations into one equation.

A separate contact surface is not required merely because two structures are coupled. If a contact surface is introduced, specify its embedding, incidence relation, boundary conditions, constitutive law, and observable. If a twist or holonomy mechanism is introduced, specify the bundle, connection, transport, loop, holonomy representation, and distinguishing observable. A helical trace alone does not supply these objects.

## 7. Conditional geometric consequence

The existing Ravel formalization considers a 4D ambient space and a transverse 3D sheet. Under the stated smoothness and transversality assumptions:

- a 1D carrier curve has an expected 0D intersection with the 3D sheet;
- a full-dimensional 4D support has an expected 3D intersection with the 3D sheet.

These are conditional dimension results, not claims that the actual H(s)H worldtube is a full-dimensional 4D support. The current thickness commitment does not specify normal rank or support dimension. A 3D core slice cannot be silently identified with a point-like particle readout; an aggregation, projection, or measurement map is required.

## 8. Candidate test matrix

| Candidate | Shared parameters and calibration | Holdout | Predicted observable | Standard comparator | Failure condition |
|---|---|---|---|---|---|
| H0: standard baseline | Same selected system, raw acquisitions, instrument response, calibration, beam, priors, and nuisance parameters | Frozen independent acquisitions or epochs | Standard-model readout | Established GR/SM model for the selected system | Baseline adequacy is assessed on the same held-out units |
| H1: mutual W-T curvature | Same as H0; freeze the tentative source version and carrier allocation | Same independent holdout | Source-derived joint readout, including coupling signature | H0 | Reject if the held-out joint readout misses the pre-registered prediction region beyond combined uncertainty while H0 remains adequate |
| H2: worldline-only | Same as H0; explicit W-to-line and readout maps | Same independent holdout | Only observables that descend through the joint projection | H0 and H1 | Reject the reduction if the joint readout is not constant on projection fibers and no calibrated correction is supplied |
| H3: timesheet-only | Same as H0; explicit W/T-to-sheet maps | Same independent holdout | Only observables that descend through the joint projection | H0 and H1 | Same fiber and held-out prediction failure conditions |
| H4: W/T/M three-carrier | Same as H0; preserve M as a distinct candidate for Electrogravity until an equivalence map is supported | Same independent holdout | Carrier-resolved coupling signature and measured readout | H0 and H1 | Reject the carrier allocation if it adds no distinguishable held-out prediction or violates the source-defined coupling |
| H5: twist/holonomy extension | Same as H0; define connection and transport before fitting | Same independent holdout | A separately specified twist/holonomy observable | H0 and H1 | Reject if no independent observable or if the added parameter only absorbs calibration residuals |
| H6: contact-surface extension | Same as H0; define boundary and constitutive law before fitting | Same independent holdout | A contact-specific observable | H0 and H1 | Reject if no distinct held-out prediction or if the surface is introduced only by analogy |

M87* EHT polarimetry is an existing real-data candidate, not a selected P2 system. The candidate data family includes 2017, 2018, and 2021 polarimetric products. The existing P2 work identifies the missing source-derived map from H(s)H geometry/coupling to Stokes Q/U and Faraday-depth readouts. The standard comparator is the established GRMHD and synchrotron-radiative-transfer/Faraday-screen family. No raw dataset version, calibration/covariance package, holdout split, or H(s)H forward map was retrieved or instantiated in this run.

No numeric falsification threshold is assigned. It must be derived from the selected dataset's actual covariance, calibration uncertainty, and pre-registered prediction region. No physical calculation or fit is performed by this contract.

## 9. Lean and evidence status

Existing formal work is reused, not promoted:

- Ravel PR #1133, exact head `fc7f92722fe5e0757d55f961b54a12bdee66d5da`.
- Exact-head Actions run #44709605971 completed successfully with Lean 4.34.0 and Lake 5.0.0; 8,954 build jobs.
- `lineCarrierSliceDimension_four_three` and `fullCoreSliceDimension_four_three` were reported with no axioms.
- `readout_descends_iff_constant_on_same_carrier_slice_fibers` was reported with `Quot.sound`.
- The actual evaluation output distinguished the 0D line slice from the 3D full-core slice under the declared assumptions.

The run skipped tests, lint, leanchecker, nanoda, and global axiom audit. PR #1133 remains open, draft, and unmerged. The product-valued joint-readout instantiation in this gate was not separately compiled. The actual H(s)H carrier types, coupling signature, and projection maps remain undefined.

Lean checks only the formalized statements. It does not establish the correctness of the source-to-model translation, the physical premises, the existence of the proposed geometry, or empirical agreement.

## 10. Admission and rejection rules

Do not admit a confirmatory candidate unless its source version is current, its carrier set and coupling signature are typed, its projection/composition maps are explicit, its joint readout is preserved, and its candidate family is frozen before holdout access.

Do not claim equivalence from a shared name, diagram, dimension label, or visual resemblance. Do not promote a historical mechanism, optional contact surface, separate twist field, or numerical thickness without a source, map, and independently distinguishable observable.

Do not promote this gate to BEDROCK. It is a proposed workflow addendum intended to make the next geometric or physical claim easier to falsify.
