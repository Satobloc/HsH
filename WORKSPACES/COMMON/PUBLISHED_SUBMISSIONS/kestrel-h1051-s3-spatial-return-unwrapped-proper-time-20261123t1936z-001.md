# H1051:S3 source-grounded architecture update: spatial return versus proper-time return

**Run key:** REVROT3-19-20261011:1051:s3  
**Nominal slot:** 2026-11-23 19:36Z  
**Report assembly check:** 2026-11-23 19:51Z  
**Main branch at preflight:** 46ec103b46336cfea5ae46478d8308e965134ddd

## 1. Ring selection and attribution

The fixed formula gives h=1051, seq=5(1051)+3=5258, and 5258 mod 19 = 14. Index 14 is Kestrel; the next ring index is 15, Meridian.

This is an assistant-level, source-grounded repository contribution under the Kestrel routing label. It is not an authenticated Kestrel thread or worker activation, and it does not claim Kestrel authorship, proof ownership, or cross-thread delivery. Kestrel's historical remit is trust-first cross-boundary synthesis and constructive exploration, not primary auditing or proof ownership.

The predecessor slot Morrow h1051:s2 has a canonical receipt, but no addressed packet to Kestrel. This run therefore records PREDECESSOR_RECEIPT_ONLY / NO_HANDOFF_PACKET / NOT_CONSUMED. No predecessor delivery is inferred.

## 2. Source boundary

The primary source is a direct user-authored message dated 2026-11-08 in the raw conversation archive. It describes a four-spatial-dimensional home model; w as a fourth spatial direction; a toroidal circumference C as a candidate compact direction; proper time as distinct from w while progression moves along it; and worldtubes roughly parallel to C. It leaves the mouth/timesheet relation open among three alternatives: a gluing or opening into the timesheet, an intersection with the timesheet, or a temporon/coordinated-excitation wavefront on a continuous worldtube.

The source also describes the observable 3D universe as a bulk-ball cross-section of a hypertorus. That 3D cross-section is not automatically identical to the timesheet. No equality or projection map between them is supplied.

The attached NotebookLM export was read as supporting context, but its flattened role labels do not reliably distinguish prompts from generated answers. It was not promoted to Nathan Direct or used to overwrite the direct 2026-11-08 statement. The source-local labels w, C, proper time, timesheet, and worldtube are retained as source labels; no shared symbol-registry entry or SAT-O/Blockwave equation was changed.

## 3. Substantive architecture improvement: spatial return is not event return

The direct description makes a closed spatial direction and advancing proper time coexist. That combination needs one explicit representation rule.

If C is a closed toroidal spatial loop, its coordinate w is periodic. Let s be an abstract unwrapped progression parameter along a longitudinal path, and let P be one winding period. The spatial state can return:

    x(s + P) = x(s)

while proper time strictly advances:

    tau(s + P) > tau(s)

Therefore the combined coordinate-time state does not return:

    (x(s + P), tau(s + P)) != (x(s), tau(s))

This is a spatial return without an event return. It does not describe a closed timelike curve and does not require an additional physical spatial dimension.

Conversely, if proper time is represented as a single-valued real scalar of the compact coordinate itself, then it is periodic:

    tau(w + P) = tau(w)

A periodic real scalar cannot be strictly increasing around the loop. The minimal candidate representation is therefore to keep w as the periodic spatial coordinate and tau as an unwrapped proper-time parameter on a covering parameterization of the loop. A circle-valued phase may carry winding, but phase alone is not an ordered real-valued proper time.

This is a conditional representation constraint, not a claim that the Crullerverse is physically compact or that the source has already defined a universal-cover map. It explains why the direct source's distinction between w and proper time is structurally important.

## 4. Typed map contract

The following objects must remain distinct until a source-defined map relates them:

| Object | Current status | Required map or condition |
|---|---|---|
| M4sp | Four-dimensional spatial base in the direct proposal | A spatial metric is needed for lengths and angles |
| C | Candidate closed toroidal circumference | An embedding of the loop into M4sp and a periodic coordinate |
| w | Fourth spatial direction / coordinate along C | Periodic spatial coordinate; not proper time |
| tau | Proper time distinct from w | Unwrapped parameter or separately defined clock/phase structure |
| T_i^4 | Four-dimensional worldtube support | Either primary support data or a thickening map from a core |
| gamma_i^1 | Possible one-dimensional core | If used to derive T_i^4, specify its normal bundle, transverse profile, and embedding |
| Sigma_tau | Timesheet family | A family indexed by proper time, with its own embedding or level-set definition |
| U_tau^3 | Observable 3D bulk-ball cross-section | Keep distinct from Sigma_tau until an identification or projection is supplied |
| M_i | Mouth/interface | Define its support and its relation to T_i^4 and Sigma_tau |
| O | Measurement/observation map | Calibrated map from the selected geometric object to an actual measured observable |

The phrase “roughly parallel to C” remains qualitative until a metric, longitudinal direction field, and transport/connection are specified. A full-dimensional tube does not itself select a unique longitudinal director field.

Finite-core thickness is not determined by a centerline alone. If T_i^4 is primary, its support is an independent model object. If it is derived from gamma_i^1, a normal-bundle/profile construction is required. Twist is optional: a physically meaningful twist needs an orientation-bearing cross-section or other marked structure and a connection/transport rule. The source leaves bulk twist, surface twist, or both open. Contact surfaces are also optional until a second support, interface relation, and interaction law are specified.

## 5. Keep the three mouth/timesheet alternatives separate

**A. Gluing/opening into the timesheet.** Requires an interface or gluing map between the mouth boundary/interface and Sigma_tau, plus compatible boundary structure, orientation, metric data, and boundary conditions. It is not the same construction as an intersection.

**B. Intersection with the timesheet.** Requires embeddings of the mouth/support and Sigma_tau into M4sp, followed by an intersection and (where dimension claims are made) a transversality condition. Existing Kestrel formalization shows why object type matters: a 1D core intersecting a 3D hypersurface, a 2D worldsheet intersecting it, a 3D boundary intersecting it, and a full 4D support intersecting it have different generic intersection dimensions. The source has not yet fixed the mouth's dimension.

**C. Temporon/coordinated-excitation wavefront on a continuous worldtube.** Requires a phase or excitation field on T_i^4, a propagation/evolution law, and a rule that turns its fronts into a timesheet or local-present structure. No field equation or coupling law is source-defined yet.

The three constructions are alternatives in the current source record, not synonyms and not a forced selection. The 3D bulk-ball cross-section U_tau^3 remains separate from Sigma_tau until an explicit map or equality is supplied.

## 6. Conditional test matrix

No measured system or dataset was selected in this run. The matrix below is a test-design scaffold, not a completed physical prediction.

| Hypothesis | Shared parameters | Calibration | Holdout | Candidate observable | Standard comparator | Falsification threshold |
|---|---|---|---|---|---|---|
| Compact spatial return with unwrapped proper time | Same local spatial geometry, path, clock definition, and instrument model | Register the spatial loop and calibrate the proper-time clock and phase readout | Independent return/winding observation | Repeated spatial state with positive proper-time advance; possible phase/holonomy increment if a coupling is specified | Same local physics with a noncompact spatial direction, or a standard compact-space model with independent time | Not set; requires a measured system, uncertainties, and a predeclared effect size |
| Mouth gluing versus intersection | Same mouth support, timesheet geometry, and detector map | Establish embeddings, boundary/interface geometry, and resolution | Independent slice or interface observation | Continuity/gluing signature versus an intersection locus with a dimension/topology fixed by the chosen supports | Standard slice/interface construction using the same observables | Not set; source has not fixed mouth dimension or coupling |
| Temporon wavefront on T_i^4 | Same support, phase calibration, and clock standard | Calibrate phase, propagation, and source/transfer rules | Independent phase-front or clock-coordination observation | Phase-front geometry and propagation/coordination profile | Standard propagating-field or externally parameterized timesheet model | Not set; no field equation, propagation law, or dataset |
| Bulk/surface twist | Same core, support, and transverse profile | Calibrate anisotropy, orientation, and connection/transport | Independent orientation-sensitive phase, polarization, or contour observation | Twist-dependent holonomy or anisotropic residual | Untwisted/isotropic comparator | Not set; no coupling or uncertainty model |
| Finite-core profile | Same centerline, local metric, and instrument response | Calibrate spatial resolution and the profile parameterization | Independent contour or finite-width observation | Radial/transverse profile rather than a line-only support | Centerline/pointlike comparator | Not set; no selected system or measured profile |
| Contact/interface response | Same supports and bulk parameters | Define the second object, interface, and interaction law | Independent contact/interface event | Boundary-localized response | Bulk-only interaction model | Not set; no contact law or measurement |

A quantitative threshold cannot be responsibly supplied without an identifiable measured system, dataset provenance, units, instrument calibration, uncertainties, shared-parameter policy, and prediction-versus-fit separation. None was fabricated.

## 7. Lean formalization and verification

A new conditional Lean module was added in draft PR #2441:

- Module: HsHVerification.KestrelSpatialReturnProperTimeGate
- Theorem 1: spatial return plus strictly increasing proper time implies no return of the minimal coordinate-time pair.
- Theorem 2: a single-valued real proper-time scalar that is periodic on the spatial loop cannot be strictly increasing.

The PR targets the existing infra/lean4-verification-20261023 Lean 4 / Mathlib project, not main. Head commit: 9d75fa18de5221f601c03bdef57ca70e44d32855. Actions run #45252994322 was IN_PROGRESS at the last check. No successful compilation, theorem-axiom readback, or exact-head assertion is claimed until the run completes.

Existing Kestrel PR #873 supplies the torus-cycle and conditional intersection-dimension formalizations. Its exact-head run #44090154878 succeeded, including KestrelTorusCycleGate, KestrelIntersectionDimensionGate, and KestrelProjectedIncidence. The branch is 111 commits ahead and 27,400 behind current main; the PR remains open, draft, and unmerged. Its result is a formalization sandbox, not main integration.

Existing Meridian PR #895 contains a related future-time/closed-event-return theorem. Its build #40692772972 succeeded, but the retrieved workflow steps did not include an explicit exact-head checkout assertion. It is treated as a successful build record, not exact-head certification. Its theorem concerns same-event closure under a strictly increasing time function; it does not prohibit spatial return with time advance.

Lean checks only the formalized conditional statements. It does not validate the source-to-model translation, establish a physical compact dimension, derive a metric or coupling, or provide observational validation. No new tool or dependency was built.

## 8. Research and campaign controls

- Mersearch's four request lanes remain occupied. The Kestrel finite-core request has no verified result manifest. A completed unrelated nexus result was not repurposed. No request was overwritten or retriggered.
- The direct raw Library source was inspected. The NotebookLM attachment was not treated as speaker-authenticated Nathan Direct.
- Existing Math Hopper, Lean PRs, Whirligig, and SciSpace options were checked. The existing Lean project was reused; no new subscription, paid service, dependency, or tool was introduced.
- Morrow h1051:s2 completed the recent PWH deep review. This run did not repeat it or mutate the queue/task graph.
- P0 remains active. P1 remains Orson-owned, frozen, and not ready. P2 remains HOLD; this note does not satisfy the November 23 first-draft/hostile-review checkpoint or advance the November 30 major-paper gate. P3 remains incomplete for December 14.
- FIE review remains due December 4; the unrelated-reading break was completed November 21.
- No physical calculation, fit, numerical prediction, uncertainty estimate, or falsification threshold was performed. No SAT-O or Blockwave equation, BEDROCK theory status, manuscript, paper gate, task owner, task priority, task ID, scheduler ID, schedule, phase, enabled state, or task count was changed.

## 9. Return

**NOW:** The source-faithful distinction is explicit: spatial closure on C does not imply event closure when proper time is unwrapped and strictly advances.

**NEXT:** Read the exact-head CI result for PR #2441. The next geometric decision is to define the source-authorized relation among C, the worldtube support, Sigma_tau, and U_tau^3 without collapsing the three mouth/timesheet alternatives.

**STOP:** No physical inference, no theory promotion, no merge to main, no scheduler change, and no cross-thread delivery claim.

**Next ring label:** Meridian (index 15). The h1051:s4 target slot was already past at the 19:51Z report-assembly check. Meridian remains P0-protected; no handoff, assignment, or response obligation was created.
