# Joint-readout identifiability gate for finite-core H(s)H geometry

**Run:** Workshop Relay :36, 2026-11-03 06:36Z  
**Status:** WORKFLOW ARCHITECTURE / SOURCE-CONDITIONED / NOT A PHYSICAL PREDICTION / NOT BEDROCK  
**Delta:** Adds a formal identifiability and map-closure gate to the existing M87* polarimetry and finite-core measurement candidates. It does not reissue either report, select a P2 system, or advance a paper gate.

## 1. The new rule

A geometric parameter is not identified merely because two observables have been measured, a fit converges, or a downstream image looks compatible with a proposed shape.

Before fitting or claiming a finite-core parameter, the proposed source-to-observable chain must pass three separate tests:

1. **Map closure:** every projection/coarse-graining step must be an explicitly typed map with a defined domain, codomain, assumptions, units, metric/coordinate convention, and composition order.
2. **Fiber compatibility:** if a proposed observable is claimed to be a function of a coarser representation, it must be constant on every fiber of that representation. If two fine geometries collapse to the same coarse state but imply different target observables, the coarse state is insufficient for that observable.
3. **Joint separation:** the chosen measurement channels must jointly distinguish every pair of distinct admissible geometries (or parameter states) relevant to the claim. Two channels are not automatically independent or identifying. Their shared data, transfer functions, calibration and covariance must be modeled.

If any gate fails, the correct status is `MAP_INCOMPLETE` or `UNIDENTIFIABLE`, not `PASSED`, `CONSISTENT`, or a fitted geometric measurement.

This is a workflow/logic gate, not a new physical law.

## 2. Formal basis already present in the repository

The required conditional mathematics already exists in the open Kestrel formalization PR:

- `hallway_factorization_iff_fiber_compatibility`: a deterministic downstream map from a coarse observable range exists exactly when the target observable is constant on every fiber of the coarse map.
- `joint_readout_injective_of_separating_pair`: two readout maps jointly identify the source state if every distinct source pair is separated by at least one channel.
- `downstream_readout_cannot_restore_coarse_collapsed_pair`: once an upstream coarse map identifies two source states, no deterministic downstream readout can restore their distinction.
- `ScaleRouteAgreement` / `ObservableScaleRouteAgreement`: exact agreement of upstream scale routes implies agreement after readout; the converse needs injectivity on the admissible domain.

Source: [PR #873, Kestrel source-faithful moving-plane helix readout and slope proof](https://github.com/Satobloc/HsH/pull/873), file `FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean`.

**Verification boundary:** current PR head `0da1050bd0e20e55004c86053e9ccd1b582633d9`; Lean 4 verification run #41585887441 completed SUCCESS. The workflow uses the default `actions/checkout` ref on pull-request events and does not explicitly check out `github.event.pull_request.head.sha`; therefore this is recorded as a successful PR merge-ref build, not an independently established exact-head-only build. The module is included in the PR's root aggregator. PR #873 remains OPEN / DRAFT / UNMERGED.

The theorems are conditional map mathematics. They do not establish that a physical SAT/H(s)H projection, constitutive map, or instrument map exists. They do not validate a physical premise or an observation.

Related existing modules:
- `WorldtubeInertiaCoordinate.lean` proves only the algebraic consequence of supplied premises `F = m*a` and `a = c^2*κ`; it does not derive the coordinate-curvature premise or the finite-core 4D-to-3D map.
- `KestrelIntersectionDimensionGate.lean` proves conditional tangent-space dimension arithmetic under an explicit transversality premise; it does not decide the physical support dimension.
- Sable PR #1245's Euclidean helix lift is an assistant-authored mathematical reconstruction of a 1D curve, not a formalization of the finite-core 4D worldtube.

No new Lean theorem was added or run in this delta because the exact conditional map/identifiability propositions already exist. The uncertainty-aware statistical extension is not formalized: it requires actual channel covariance and a specified likelihood/predictive model. No data-free physical calculation or invented fixture was used.

## 3. Source-conditioned geometry ledger

The distinctions below control which geometric features may enter a model. “Source-committed” does not mean experimentally validated.

| Feature | Current source status | Fit/parameter status | Required next map |
|---|---|---|---|
| 4D filament versus 3D intersectional trace | Nathan Direct, Meridian Free Build, 2026-10-09. The 3D rendering is an intersectional trace, not the full 4D object; 3D self-closure is not assumed. | Do not substitute the trace for the 4D object. | Define the 4D support, the 3D time-surface/bulk, their intersection/instantiation map, and its conditions. |
| Finite-core worldtube W⁴ | Present H(s)H reconstruction target. Earlier one-dimensional centerlines remain approximations/scaffolds, not automatically the physical carrier. | Core support type and interior/boundary remain unresolved. | Define whether W⁴ is a full-dimensional region, a lower-dimensional support with thickness, or another explicitly sourced object. |
| Intrinsic filament thickness ε | Thickness is part of the historical/current geometry lineage; it is not interchangeable with the first-order coil scale. | No numeric ε or constitutive law is established here. Do not fit it from ring diameter or EVPA. | Define cross-section, units, scale dependence, and a source-grounded observable coupling. |
| First-order coil scale ℓ_f | Nathan Direct, 2026-10-09: approximately 0.7-fm scale is a first-order coil radius/scale, not filament thickness. The source itself mixes “diameter” and “radius”; preserve that ambiguity. | Source claim, not a measured particle radius and not ε. | Identify the particle/system and derive the map to an independently measured spin/momentum observable before calibration. |
| Helical/torsional morphology and literal rotational-spin hypothesis | Existing SAT/H(s)H constraints, retained by ND-2026-10-22-02. Precession and shelf-cocking are the same underlying relative-tilt mechanism in the present formulation, not two independent mechanisms. | Must be carried through the coupled construction; not optional decoration. | Define the relevant local time direction, rotation/precession law, and common cross-sector consequences. |
| Separate material-frame twist / normal-bundle connection | Not yet defined as a distinct source-grounded variable. This is not the same thing as the already-required helical/torsional morphology. | Do not introduce a free τ parameter to absorb data. | Supply a source-defined frame, connection, transformation law and independent observable. |
| Kelvin-vortex or justified equivalent responsive-medium mechanism | Existing tentative mechanism and active constraint under ND-2026-10-22-02. Tentative means falsifiable/revisable, not ignorable. | No new medium law or fitted coefficient may be invented. | Carry its consequences through the same star map and compare against established physics. |
| Kerr/ER shell or contact boundary | Existing tentative candidate, not a generic consequence of every finite-core worldtube or every 3D bulk interaction. | No contact surface or contact law is established as universal; do not fit an ad hoc boundary. | Specify the exact boundary object/law and a resolvable independent signature if this candidate is retained. |
| Klein Fabric global structure | October 2026 supersession signal for the earlier reciprocal filament/timesheet-deformation model. The recovered message does not itself supply a complete global-to-local embedding map. | Do not resurrect the retired reciprocal deformation by paraphrase. | Define the global-to-local map and its composition with the finite-core/slice maps. |
| Native notation | Direct sources preserve earlier `w = c t` (2026-10-09) and later `c w = t`, Forest normalization, and `(++++)` (2026-10-21). These are not silently reconciled here. | No unit/type conversion is inferred. | Recover the exact type of `w`, the Forest source, and any induced-metric map before translating. |

### Consequence for “forced versus optional”

- **Forced by current source constraints:** a finite-core reconstruction target; intrinsic thickness as a distinct structural notion; a 4D object distinct from its 3D intersectional trace; helical/torsional morphology; literal rotational-spin and precession/shelf-cocking constraints; the existing Kelvin-vortex or justified equivalent response as a live tentative mechanism.
- **Not forced as universal extra machinery:** a separately parameterized material-frame twist, a universal physical contact surface, an independently fitted contact potential, or an arbitrary elastic/core coefficient.
- **Unresolved rather than optional:** the actual support dimension of the finite core, the numerical/constitutive thickness law, the coil-radius convention, and the global-to-local/slice maps.
- **Tentative but not ignorable:** the Kerr/ER shell boundary and the current time/medium/excitation alternatives.

## 4. Explicit composition registry

The current geometry-to-observable architecture must not skip these maps:

| Map | Domain → codomain | Required conditions | Current status |
|---|---|---|---|
| `K_global` | Klein-Fabric/global structure → local finite-core state | Explicit embedding/projection, scale, admissible domain, preservation conditions | MISSING |
| `P_slice` | W⁴ plus 3D time-surface/bulk Σ³ → 3D intersection/instantiation I³ | Support dimension, metric/signature, transversality or its justified replacement, slice orientation, boundary conditions | SOURCE-CONSTRAINED, NOT DEFINED |
| `C_sector` | I³ / local core state → EM, spin, flavor, or medium state | Constitutive law derived from existing SAT/H(s)H constraints; no invented field or coefficient | MISSING / TENTATIVE BY SECTOR |
| `R_standard` | Sector state → standard physical observables | Established GR/QM/SM or fluid forward model, with its actual assumptions | EXISTS PER SYSTEM; H(s)H INPUT MAP MISSING |
| `M_instrument` | Predicted observables → recorded data products | Instrument response, calibration, beam/kernel, sampling, units, covariance | SYSTEM-SPECIFIC; RAW PRODUCTS NOT ALL RECOVERED |
| `J_joint` | Admissible geometry → tuple of at least two separately specified measurement channels | Joint separation on the admissible domain; full covariance and shared nuisance parameters | NOT YET ESTABLISHED |

The geometric operation `P_slice` should be described as an intersection/instantiation, not as a passive image readout. Instrumental readout belongs downstream.

## 5. Two real-system examples, with limits preserved

These are distinct measurement systems used to exercise the same identifiability workflow. They are **not** asserted to be physically equivalent to one another or to an H(s)H worldtube. No parameter is transferred between them.

### A. M87* EHT polarimetry

Source-grounded inputs already recorded in the published M87* note:

- EHT calibrated 2017 polarimetric data DOI `10.25739/q46m-m857`.
- Calibrated 2018/2021 data collection `EHTC_M87-2018+2021_Jul2026`, catalogue update 2026-06-29.
- Published combined ring diameter estimate: `43.9 ± 0.6` microarcseconds.
- Published method-ensemble ranges show a change in `|β₂|` across epochs; a purely spatially uniform unit-modulus EVPA/Faraday phase cannot alone change the magnitude of the finite-pixel mode coefficient.
- Raw UVFITS/calibrated files were not downloaded or re-imaged in the existing note; no raw-data covariance reanalysis is claimed.

**Identifiability disposition:** ring diameter and polarization modes are different observables, but they share image formation, calibration and transfer assumptions. Their existence does not establish that they jointly separate candidate W⁴ geometries. The H(s)H map from finite-core geometry to current/field, emissivity, Stokes Q/U, Faraday depth and β₂ remains missing. EVPA helicity is not a direct measurement of worldtube twist; stable ring diameter is not thickness.

Standard comparator: Kerr/GRMHD plus general-relativistic radiative transfer and spatially structured Faraday rotation. A prospective test must freeze the H(s)H geometry and shared nuisance parameters on calibration data, then predict a held-out epoch/frequency without retuning.

Existing report: [M87* Polarimetric Mode Readout, issue #1297](https://github.com/Satobloc/HsH/issues/1297).

### B. Barckicke–Falcon–Gissinger air–water bathtub vortex

Source-grounded inputs already recorded in the Kestrel candidate note:

- Article: “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI `10.1038/s41567-026-03175-w`.
- Source-data DOI: `10.6084/m9.figshare.30903347`.
- Image resolution: `60 μm/px`; contour width `0.5 mm`; typical core-radius/position uncertainty about `0.1 mm`.
- PIV circulation uncertainty about `0.005 m²/s`; PTV vertical-velocity uncertainty about `0.05 m/s`.
- The paper's two-contour transform maps measured opposite-side radii to centerline displacement η and mean core radius a, with an algebraic inverse. It identifies two measured coordinates, not the full 3D vortex and not a 4D worldtube.
- The paper fits `(a₀, Γ, v_z)` to dispersion data and checks the fitted pair a posteriori against PIV/PTV. That is fit-conditioned, not a blind holdout.
- Raw Figshare bytes, version metadata, sample arrays and joint covariance were not retrieved; no sample-level reanalysis is claimed.

**Identifiability disposition:** the two-coordinate readout is invertible for its declared pair of contour radii, but this does not establish an injective map from a full physical geometry to those two coordinates. A new predictive comparison would freeze `(a₀, Γ, v_z)` on a preselected calibration run and jointly predict η-position and a-radius spectra on a distinct holdout condition. The fluid vortex is a classical measurement-method candidate only, not an H(s)H vacuum or physical equivalence.

Existing report: [Kelvin-vortex readout and P2 calibration/holdout gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-kelvin-vortex-p2-candidate-20261102t1036z-s3-001.md).

## 6. Standard-comparator and falsification protocol

For any selected real system:

1. **M₀, standard comparator:** use the best applicable established physical model with its declared assumptions, calibration, instrument response and uncertainty.
2. **M₁, H(s)H comparator:** use the same measured system, data products, calibration split, nuisance parameters and instrument response. Add only source-committed or mathematically forced H(s)H structure. No free per-channel retuning.
3. **Calibration:** choose one declared subset before inspecting holdout results. Estimate only parameters that have passed source and map gates.
4. **Holdout:** reserve a genuinely independent epoch, frequency, forcing condition, or measurement channel. Preserve dependencies and covariance; do not call two summaries of the same image independent.
5. **Prediction:** compute the joint predictive distribution for all declared channels, propagating measurement, calibration and model uncertainty.
6. **Falsification:** preregister the joint predictive region and rejection criterion before opening the holdout. Reject the source-forced H(s)H map if the held-out joint observations fall outside that region, if the exact Minkowski control fails, or if the model needs an unauthorized extra parameter or channel-specific retuning.
7. **Non-identifiability:** if distinct admissible geometries remain observationally indistinguishable under the declared channels, report `UNIDENTIFIABLE`. More fitting to the same lossy channels does not cure it.
8. **Map failure:** if a required geometry-to-sector or sector-to-observable map is missing, report `MAP_INCOMPLETE / NO PREDICTION`. Agreement of a standard observable with data is not an H(s)H prediction.

No numerical rejection threshold is selected here because the relevant raw data/covariance products and H(s)H forward maps are not yet available. A threshold invented before those inputs would be false precision.

## 7. SAT-O / Blockwave source custody; no equation edits

The source classes below remain distinct. No verbatim equation was corrected or replaced in this run.

| Source | Exact source identity | Date/provenance | Treatment |
|---|---|---|---|
| `SAT4D_LIVE_DRAFT.txt` | SAT archive blob `2a79fe25018cce7e99a2c33786d88b0551db6ae7` | Document header June 2025; local index created 2025-06-08, modified 2025-06-09; byline names Nathan McKnight, but line-level authorship of every embedded equation is not independently authenticated | Historical draft, not automatic current H(s)H equation |
| `SAT.O₉` 4D-only worldsheet action | SAT archive blob `c7831e8c248113a1405954f4c85c8fe151aa2107` | Tentative historical module; no verified author/date metadata in the recovered file header | Preserve verbatim. Its `ℓ_f = ℓ_P` wavefront-thickness assignment is not silently carried forward as current. |
| `SAT.O₉` mass-module note | SAT archive blob `676ce08c09226e4bde5a4d8efa3d7f4da228a1d8` | Separate short code/algorithm note; date/author not established in the recovered file | Do not conflate with the worldsheet action. Its `m² = k(N + βQ² − a)` is a separate historical proposal, not an independently verified spectrum. |
| `🧱BLOCKWAVE.txt` | HsH blob `ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d`; SHA-256 `3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664` | First visible Git path commit 2026-10-08; internal date and composition authorship not established. Attachment text is `CONTENT_AUTHORSHIP_UNRESOLVED`. | Preserve exact bytes. The text defines a conserved 2-form `J^{μν}` as a filament **worldsheet** current and writes a Lorentzian `u² = −1` action with `R`, compact phase, time-flow elasticity, `J` flex/twist/coil kernel, holonomy coupling and response kernel. This is not automatically the later 4D finite-core W⁴. |

**Separate direct correction:** Meridian Free Build raw blob `7af1561b321f4d9364da5eb111df689efc652827`, message `1178f25c-9f92-4d1c-b43b-06482e6bf1b1`, 2026-10-09T07:40:38.859Z, distinguishes the approximately 0.7-fm first-order coil radius/scale from filament thickness and distinguishes the 4D filament from its 3D intersectional trace. This corrects the *interpretation of ℓ_f*; it does not provide a replacement action or a measured ε.

**Separate normalization source:** Meridian Minkowski Ring Analysis raw blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, message `c5525f53-b7cc-4444-8102-3bf6fdb1c892`, 2026-10-21T13:55:40.112Z, preserves `cw=t`, Forest normalization and `(++++)`. Earlier `w=ct` appears in Meridian Free Build message `3c657387-b80b-4982-a61a-8e6d8568b8d1`, 2026-10-09T01:50:55.112Z. No conversion or equation correction is made here.

## 8. Mersearch, scope and disposition

- All four live Mersearch request lanes were occupied at inspection (Calder, archive-harvest, Morrow, Kestrel). No request file was overwritten and no fifth request was opened.
- The completed three-root Mersearch run `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212` was consulted as an existing result, not misrepresented as an exhaustive current worldtube search.
- Bounded direct source reads were used for the Meridian Free Build and Meridian Minkowski Ring Analysis raw exports, the SAT4D draft, SAT.O₉ files, and the Blockwave attachment. The raw Meridian source blob IDs and message IDs are preserved above.
- No new tooling, repository branch, Lean module, physical simulation, data-free calculation, fit, parameter estimate, physical prediction, equation correction, BEDROCK promotion, or paper-gate advancement was made.
- P1 November 9, P2 November 30 and P3 December 14 remain separate gates. This note is not a paper submission or review.
- The result is an architecture addendum to the existing source and measurement reports, not a replacement for them.
