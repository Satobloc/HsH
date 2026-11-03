# Workshop Relay :00 — Elias Kern
## Factory Floor geometry-admission gate: M87* polarimetry source-fidelity and Track A QA

**Run key:** `REVROT3-19-20261011:568:s0`  
**Nominal slot:** 2026-11-03 16:00 UTC  
**Ring selection:** h=568; seq=5h=2840; 2840 mod 19 = 9. Selected Elias Kern (index 9); next ring label Nadir Voss (index 10).  
**Status:** SOURCE-FIDELITY / TRACK-A STATIC QA / FACTORY-FLOOR BLOCKED / NO PHYSICAL PREDICTION.

## Executive disposition

Nathan's new geometry-admission requirement is stronger than the existing generic math, adversarial-audit, and provenance checks. Nothing may enter Factory Floor, or be presented as a completed paper result, until the *actual system under study* has a precise geometric plot, that plot has passed hostile geometry-fidelity review, and the same plot is displayed with the associated file.

This pass found that the existing Track A switchboard prototype has no explicit representation of those three conditions. Its candidate path checks mathematics, adversarial audit, and provenance, then routes a checked candidate toward prediction and paper work. It does not require a plot bound to the exact system/version, a geometry-specific independent review, or verification that the plot is actually displayed alongside the file.

The M87* polarimetry branch is a useful concrete example of the gap, but the available record does **not** supply a complete H(s)H geometry for M87*. The diagram created with this report is therefore a **map-gap/provenance diagram, not the required precise geometric plot**. It is not Factory-Floor eligible.

No POC code, production workflow, task graph, PR, Lean source, manuscript, reader, or theory status was changed. No H(s)H physical calculation, prediction, fit, CODATA scoring, or paper-gate advancement was performed.

## 1. Nathan Direct: the five-level object hierarchy

The current user directive distinguishes five kinds of object. These are not interchangeable deliverables:

| Level | Object | Function | What it is not |
|---|---|---|---|
| Primary | Observation | The empirical object/evidence being studied | A theory diagram or equation |
| Secondary | Physical working orrery / hands-on demonstration | A tangible mechanical instantiation | The observation itself |
| Tertiary | Precision dynamic geometry as a software model | An executable representation of geometric behavior | The physical object or a static diagram |
| Quaternary | Precise static geometric diagram | A fixed, inspectable plot of the system and its relationships | A prose description or equation list |
| Pentary | Mathematics | A precise descriptive/fitting language for the geometry | The theoretical or physical object |

The ordering is intentional: primary observation, secondary physical orrery, tertiary dynamic software geometry, quaternary static diagram, pentary mathematics. Mathematics may be exact and useful while still being a description of a different object.

The user's geological comparison, “SAT is our K-T Boundary,” is treated here as a metaphor for a paradigm boundary, not as a literal geological event.

### Factory Floor admission rule

A candidate must have all of the following, bound to the exact candidate/system version:

1. **Geometric plot present:** a static diagram of the actual object/system, with declared dimensions, coordinates/axes, scale/units, topology, relevant boundaries, and every projection or transformation used to interpret it.
2. **Geometry-specific hostile review:** an independent reviewer challenges whether the diagram faithfully depicts the direct-source object and its constraints. A generic mathematical review, citation check, or author self-review is not a substitute.
3. **Displayed with the file:** the exact plot asset is included/rendered with the exact report/paper file. The artifact and plot identities must be read back and matched; a detached image link or an unverified local figure is insufficient.

A missing condition means **BLOCKED**, not “nearly ready.” A workflow tag, Lean build, successful fit, or polished equation cannot substitute for the missing geometric object.

### Candidate evidence record (proposal only; not implemented)

A future sandbox record should bind at least:
- `candidate_id`, `system_id`, source/version identity;
- geometric object(s) and intrinsic/ambient dimensions;
- coordinate frame, metric/signature, axes, scales and units;
- declared projection/composition maps with domains, codomains and conditions;
- static plot path plus content hash;
- display/render verification against the associated file/version;
- hostile-review identity/exposure, reviewed plot hash, verdict and discrepancy ledger;
- final Factory Floor disposition.

The review must be about the *same hash-identified plot* that is displayed with the file. Replacing the plot or underlying geometry invalidates the prior review until rechecked.

## 2. Elias specialist remit and Track A pre-state

Elias's historical workspace charter (`WORKSPACES/ELIAS_KERN/README.md`, blob `5546d022693920f6de9b375ba24e52513220bf92`) assigns Track A workflow-switchboard prototype operation/documentation only. It grants no independent production-workflow or SAT/H(s)H theory authority. Track B remains independently owned by Sable and Tern/Rook.

The controlling prototype documentation was inspected:
- HSH_RESOURCES `info/WORKFLOW_SWITCHBOARD_PROTOTYPE_READ_ME_FIRST.md`, blob `e6b6bd6d413cddfcf43b37b1b1f01317c48caf86`;
- HSH_RESOURCES `info/WORKFLOW_SWITCHBOARD_POC.md`, blob `0a708813bac6e1e7dc763779ed080b6d7e27fd42`;
- HSH_RESOURCES `tools/workflow_switchboard_demo.py`, blob `49988a769389b2baf264a27d596ba7c3ff822b36`;
- HsH `WORKSPACES/COMMON/SWITCHBOARD_PROTOTYPE_OPERATIONALIZATION_2026-09-24.md`, blob `28b967dff20e83398b3b7fd3388ab9b6a7cf531a`.

### Static source inspection result

The executable's candidate-check path currently spawns:
- `math_check`;
- `adversarial_audit`;
- `provenance_prior_art`.

Its `apply_checks` promotion precondition requires those three results. A checked pass then routes toward a prediction packet, paper pipeline, and independent reality check.

The script contains no explicit Factory Floor, geometric-plot artifact, geometry-specific hostile review, or plot-display witness. The paper pipeline is a route selected by a tag, not evidence that the geometric admission conditions passed.

This was a read-only static source inspection of the exact Git blob. The Python source was **not executed in this pass**; no runtime/self-test result is claimed. No source file or sandbox branch was modified.

### Track A / Track B boundary

This result is a candidate specification for Track A discussion. It is not an implementation patch, production rule, or Track B approval. Sable/Tern must independently decide KEEP / MODIFY / TEST / REJECT / DEFER before any prototype change is carried forward. The existing POC's generic `adversarial_audit` must not be relabelled as a geometry review after the fact.

## 3. M87* source-fidelity case: what is known and what is not

### Standard observational layer

The existing M87* note identifies the EHT Collaboration (2025), *Astronomy & Astrophysics* 704, A91, DOI `10.1051/0004-6361/202555855`, and defines complex linear polarization:
`P = Q + iU`.

Its image-plane azimuthal polarization mode is:
`β_m = (1/I_ann) ∫ P(ρ,φ) exp(−imφ) ρ dφ dρ`.

The phase of β₂ is an EVPA-helicity observable under the paper's Faraday/orientation assumptions. It is not a direct measurement of a four-dimensional worldtube, material-frame twist, geometric torsion, or finite-core thickness.

The existing note cites calibrated 2017 data DOI `10.25739/q46m-m857` and the 2018/2021 collection `EHTC_M87-2018+2021_Jul2026`. The prior HsH note did not download/recalibrate/re-image raw UVFITS; it used published method-ensemble ranges. This pass did not reanalyse any data.

An existing finite-pixel null states that a spatially uniform unit-modulus phase rotation multiplies each complex polarization pixel by the same phase; with fixed kernel and annular Stokes-I normalization, β_m is multiplied by that phase and |β_m| is unchanged. This is a narrow operator statement, not a general exclusion of spatially varying Faraday effects or standard GRMHD/radiative-transfer explanations.

### H(s)H-side source classes kept separate

**Direct Meridian Free Build messages** (raw blob `7af1561b321f4d9364da5eb111df689efc652827`, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`):
- `3c657387-b80b-4982-a61a-8e6d8568b8d1` (2026-10-09T01:50:55Z): worldtube resistance to changes in motion is identified with inertia in a Newtonian/Minkowski-limit model statement; the user specifies `w=ct`. This is a model assertion, not a derived finite-core field equation.
- `5a929b5e-515e-4f77-a32a-e49feef42812` (2026-10-09T02:46:38Z): direct, unquoted text describes the time surface as an interacting 3D slice/bulk overlapping the xyz bulk as wxyz; quoted assistant text inside this user message is not Nathan Direct.
- `1178f25c-9f92-4d1c-b43b-06482e6bf1b1` (2026-10-09T07:40:38Z): distinguishes the approximately 0.7-fm first-order coil scale from intrinsic filament thickness, and distinguishes the 4D filament from its 3D intersectional trace. The radius/diameter wording remains ambiguous.

**Direct Meridian Minkowski Ring Analysis messages** (raw blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`):
- `f658b2db-32f0-45cd-828b-140691cc9afb`: “4D curvature of the donut is acceleration” is explicitly an unproved working hypothesis.
- `090f5160-1020-486d-9c42-df3d7dff2063`: direct annotations say the older reciprocal filament/timesheet-deformation formalism was superseded when Klein Fabric became common.
- `47cf2603-bf28-439c-82b3-1f0e0c2a7dc8`: Back Hallways remains a conceptual precursor/route-finding programme, not the current formalism.
- `c5525f53-b7cc-4444-8102-3bf6fdb1c892`: direct later convention `cw=t`, Forest normalization and `(++++)`; do not silently reconcile with earlier `w=ct`.

**Assistant-generated / historical mathematics:** Blockwave's two-form worldsheet current `J^{μν}` is not a user-authored synonym for SAT.O's 1D filament or the later 4D finite-core/worldtube target. No sweep/thickening/duality map has been established between them.

### Geometry status

The following are distinct:
- historical SAT.O filament centerline `γ¹`;
- later H(s)H finite-core/worldtube target `W⁴?` (the support/interior/boundary typing remains unresolved);
- direct interacting 3D time-surface/bulk `Σ³_t?` (time function and metric/signature not fully defined);
- assistant-authored Blockwave 2-form worldsheet current `J^{2}_{ws}`;
- EHT observer image/screen `I²`;
- standard radiative Stokes field `P_ν=Q+iU` and mode `β_m`.

The current EHT image-plane operator is downstream standard measurement mathematics. It cannot be reversed into a source-grounded H(s)H worldtube geometry without a forward physical model.

## 4. Map registry and honest Factory Floor status

The necessary chain is:
`W⁴ → Σ³_t → I² → Eν/current/field → radiative transfer + Faraday → Pν(Q,U) → β_m`.

Its current status:
- `W⁴ → Σ³_t`: not source-defined as a complete map; support dimension, time function, transversality/regularity and boundary conditions unresolved.
- `Σ³_t → I²`: missing observer/tetrad/null-propagation/screen projection.
- `W⁴/Σ³_t → Eν`: missing constitutive map to electromagnetic current/field, electron density/temperature and magnetic-field orientation.
- `Eν → Pν`: standard radiative-transfer machinery exists per physical model, but no H(s)H-sourced physical input map is available.
- `Pν → β_m`: standard EHT readout operator is specified.

Issue #1301 already records the map-closure, fiber-compatibility and joint-readout identifiability gate. This report does not reissue that result. The distinct additional requirement is that the **actual geometry plot** must exist, be hostile-reviewed, and be displayed with the exact file.

**Factory Floor: BLOCKED.** No precise H(s)H geometric plot of the M87* system exists in the recovered sources. The attached SVG is only a map-gap/provenance diagram; it is explicitly not a physical geometry plot. No hostile review of an actual geometry plot has occurred, and no file-plus-plot display/readback has been verified. No Factory Floor admission is claimed.

## 5. Five-level object hierarchy applied to this case

| Level | M87* state |
|---|---|
| Primary: observation | Published EHT observational products are cited; this pass did not retrieve/reprocess raw calibrated data. |
| Secondary: physical orrery / hands-on demonstration | No H(s)H physical working demonstration of M87* is supplied. |
| Tertiary: dynamic geometry software model | No source-faithful dynamic W⁴-to-observer-to-radiation model has been demonstrated. Existing finite-pixel operator code is only a downstream readout candidate. |
| Quaternary: static geometry diagram | Only a map-gap diagram is available; the required precise system plot is absent. |
| Pentary: mathematics | β_m and the uniform-phase null describe the standard readout; they are not the object or a substitute for the geometry. |

The hierarchy is not a scorecard that permits lower levels to substitute for primary observation. It keeps each representational layer typed and visible.

## 6. Existing Lean/formalization boundary

Existing Kestrel PR #873 contains conditional map-closure/fiber-compatibility and joint-readout-separation theorems. Its recorded run #41585887441 succeeded as a PR merge-ref build, not an exact-head-only claim; tests, lint, nanoda and the separate axiom audit were skipped. These are abstract conditional propositions, not proof that an M87 H(s)H map exists.

Existing Ravel PR #1296 run #41576591587/job #125721400743 failed on its merge ref. The errors and limitations are already documented in #1297 comment #6595735193. No new Lean code or compilation was performed in this pass.

Lean proof of the formalized statement would not prove the fidelity of the geometric translation, the physical premise, the observation, or the Factory Floor plot review.

## 7. Track A candidate gate — proposed, not implemented

Suggested additional explicit candidate checks (to be reviewed independently by Track B before any POC modification):
1. `geometry_plot_present`: exact system/version and geometry object IDs are bound to the plot.
2. `geometry_plot_typed`: dimensions, axes/coordinates, scale/units, topology, metric/signature (where applicable), and projection/composition maps/conditions are recorded.
3. `geometry_fidelity_review_passed`: independent hostile reviewer has reviewed that exact plot hash against direct sources and recorded verdict/discrepancies.
4. `geometry_plot_display_verified`: exact plot hash is rendered/displayed with the exact associated file/version and read back.
5. `factory_floor_admission`: only true if all prior predicates pass; missing/ambiguous evidence yields BLOCKED.

This should be a gate over evidence, not a free-form “geometry good” checkbox. A change in geometry source, plot hash, system version or associated file invalidates the relevant downstream review/display witness. The existing math/adversarial/provenance checks remain separate; a generic adversarial audit is not automatically a geometry fidelity review.

No code was changed and no gate was made sticky/global. Sable/Tern Track B disposition is required before implementation or promotion.

## 8. Scope, controls and next cursor

- Existing :00 task ID and hourly America/New_York :00 schedule preserved. :12 remains disabled. No sixth task.
- Selected Elias label is a routing result, not authenticated Elias-thread identity. No authenticated original Elias ChatGPT thread was recovered; no cross-thread delivery or acknowledgment is claimed.
- Elias scope is Track A sandbox prototype/documentation only. No production authority and no theory authority.
- Existing issues #1297 and #1301 remain canonical; no duplicate issue or PR created. No publisher bypass.
- Code Grurple remains active. No manuscript/reader/site work; P1 Nov 9, P2 Nov 30, P3 Dec 14 remain separate. Orson cognition allocation preserved.
- No Mersearch request opened; all shared lanes were occupied at inspection. No lane overwritten.
- No CODATA score, physical calculation, H(s)H prediction, fit, physical measurement, new tooling or paid service.
- FIE last reviewed October 27; re-review threshold November 10. Unrelated reading cursor remains BULBEK, next line 281.

Next:
1. Recover any original source that supplies the M87 H(s)H finite-core geometry and observer/medium map.
2. Do not call the map-gap SVG a geometric plot.
3. Have an independent geometry reviewer inspect a real, source-bound static plot only after that plot exists.
4. Verify the exact plot is displayed with the exact report/paper before any Factory Floor status can change.
5. Present the proposed Track A gate to Sable/Tern for an independent KEEP/MODIFY/TEST/REJECT/DEFER decision. No switchboard implementation until that review.

**Disposition:** bounded Track A static QA and source-fidelity reconciliation complete; M87 geometry gate blocked; no POC/production changes, no new Lean results, no physical calculation, no theory or Factory Floor admission.
