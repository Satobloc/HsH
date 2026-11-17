# H911:S3 | GCS CME worldtube admission gate

Status: SOURCE-GROUNDED ARCHITECTURE REVIEW / CANDIDATE ONLY / P2 HOLD / NO THEORY PROMOTION

## 1. Scope and source authority

This is a Lane 36 architecture supplement to the existing P2 candidate docket, not a new system selection, P2 admission, or replacement for the local GCS apex-surface calculation already recorded in HsH issue #1921. The canonical P2 gate remains issue #565.

Standard reference: Mishra, Agarwal and Srivastava (2026), Monthly Notices of the Royal Astronomical Society 550, stag1145, DOI https://doi.org/10.1093/mnras/stag1145 . The article uses the Graduated Cylindrical Shell (GCS) model on eight Earth-directed CMEs, four classified fast and four slow, and compares coronal reconstructions with in-situ magnetic-cloud estimates near 1 AU.

Source classes are kept separate:
- Historical Ravel role: recovered from raw user-role conversation material and current Ravel workspace instructions. No separate signed specialist charter or authenticated current Ravel thread was found.
- Standard reference: the published MNRAS article and its cited observational sources.
- Assistant reconstruction: the typed worldtube-admission contract and proposed test matrix below.
- Proposal: the calibration/holdout protocol and additional H(s)H map requirements.
- Independent measurement: none performed in this run.

## 2. What the paper actually constrains

The GCS model reconstructs a three-dimensional hollow-croissant flux-rope surface from multi-viewpoint coronagraph images. Its six fitted parameters are latitude, longitude, half-angle, tilt, aspect ratio, and leading-edge height. The paper uses multiple published GCS reconstructions catalogued through LLAMACoRe and summarizes parameter spread with medians and median absolute deviations. These are multiple reconstructions of events, not additional independent CME events; the paper notes parameter coupling and particularly large uncertainty in tilt.

The coronal surface history is not uniformly observed across the full Sun-to-1-AU range:
- The early/rising segment is constrained by discrete GCS fits to coronagraph images, with the final tracked heights around 15 solar radii for the events discussed.
- From the last tracked coronal height to about 30 solar radii, the paper assumes a constant aspect ratio. This is an assumption-filled bridge, not a continuous sequence of measured surfaces.
- Beyond about 30 solar radii, the aspect-ratio curve is represented by a fitted power law constrained by an in-situ-derived endpoint near 1 AU. This is a model fit, not direct imaging of the intervening surface.
- The 1-AU magnetic-cloud radius is derived from one-minute OMNI in-situ data by integrating the measured bulk speed across the magnetic-cloud interval under a near-central nose-crossing assumption. It is a path-derived scalar radius, not a full three-dimensional surface measurement.

The leading-edge height h_LE is a spatial state variable, not a clock. The observation timestamps must be retained independently. A moving-box height-time fit can estimate kinematics, but it does not make height interchangeable with time, especially across acceleration or deceleration.

The published three-phase aspect-ratio curve therefore contains distinct evidence classes: directly reconstructed GCS snapshots, an assumed constant-kappa interval, a fitted interplanetary interval, and an in-situ-derived endpoint. Treating the composite curve as a uniformly observed continuous worldtube would erase those distinctions.

Raw coronagraph image files, row-level LLAMACoRe records, complete per-image six-parameter histories, and joint fit-parameter covariance were not retrieved in this run. No independent image refit or reconstruction was performed.

## 3. Geometric worldtube versus material worldtube

Let p_i denote the six GCS parameters fitted at observation time t_i, and let S_i = GCS(p_i) be the corresponding two-dimensional surface embedded in three-dimensional space.

A geometric surface history can be represented as W_geom = {(x,t_i): x is in S_i}, together with an explicitly declared interpolation between observed times. This is a geometric worldtube only after the snapshots are tied to one event, one coordinate convention, and actual observation timestamps. A time-history of two-dimensional surfaces is a three-dimensional subset of spacetime; it is not automatically a four-dimensional volume.

A material worldtube is a stronger object. It requires a material label xi and an embedding X(xi,t), or an equivalent transport map Phi from one time slice to the next. A sequence of independently fitted GCS surfaces supplies shape snapshots, but does not by itself identify which point or magnetic-flux element on one surface becomes which point on the next. Without that transport map, the defensible object is an Eulerian geometric surface history, not a material worldtube.

The 1-AU in-situ measurement is a separate observation operator along a spacecraft worldline. It samples a local passage through the structure. Turning that time series into a cross-sectional radius depends on the boundary definition, trajectory, impact parameter, orientation, and near-central-crossing assumption. It is not a full surface and cannot be stitched onto the coronal GCS family without an explicit cross-section and transport map.

## 4. What is forced, and what remains optional

| Feature | What the source supports | H(s)H disposition |
|---|---|---|
| Finite spatial geometry | The GCS model fits a finite three-dimensional flux-rope shape and a dimensionless aspect ratio. | Finite geometry is already present in the standard comparator. It is not an H(s)H-specific result. |
| Geometric worldtube | Time-indexed GCS surfaces can define a geometric surface history if timestamps, common coordinates, and interpolation are supplied. | A useful representation, but not yet a measured continuous worldtube. |
| Material transport | The fit sequence does not supply material labels or a flux-element transport map. | Optional and unestablished until a source-authorized transport law is supplied. |
| Extra thickness | GCS kappa is an aspect-ratio parameter, not an independently defined H(s)H four-dimensional thickness. | No additional H(s)H thickness is forced. |
| Twist | GCS tilt is a global orientation parameter, not internal magnetic-field twist or material-frame twist. | No twist variable is identified by these fits. |
| Contact surface | The GCS shell is a modeled boundary; the paper infers ambient-wind interaction from shape evolution but does not measure an H(s)H-specific traction or contact law. | No distinct contact surface or contact dynamics are forced. |
| Timesheet | The observations carry timestamps and image planes; these do not independently measure a physical time-surface. | No timesheet is forced. |

The key negative control is semantic: do not rename kappa as worldtube thickness, gamma as twist, or a timestamped image sequence as a material timesheet. Each proposed identification needs its own map and observable.

## 5. Typed source-to-observable contract

A future reproducible worldtube reconstruction should preserve at least these records:

1. GCS snapshot record: event ID; actual UTC observation time; spacecraft and coronagraph instrument; image IDs; camera pointing and line-of-sight geometry; all six GCS parameters; fit version; analyst/source record IDs; visibility and occlusion mask; marginal uncertainties; full covariance or an explicit missing-covariance flag.

2. Reconstruction-family record: the LLAMACoRe record IDs contributing to each event; which records share underlying images; analyst/source identity; median and MAD calculation; and a statement that reconstruction count is not event count or independent acquisition count.

3. Interpolation-segment record: start and end snapshot IDs; time and height domain; interpolation or propagation model; fitted parameters; covariance; and an explicit evidence label of OBSERVED, ASSUMED, FITTED, or EXTRAPOLATED. The constant-kappa and power-law segments must remain separately typed.

4. In-situ crossing record: spacecraft; interval and boundary algorithm; one-minute plasma, velocity, and magnetic-field series; impact-parameter estimate; local orientation; radius estimator; near-central-crossing assumption; and uncertainty/covariance.

5. Material-transport record, if claimed: material or magnetic-flux labels; transport map between time slices; continuity conditions; and the uncertainty of that correspondence. GCS surface fitting alone does not populate this record.

The required composition is not merely a picture-to-surface fit. It is: geometric state -> physical CME state -> line-of-sight coronagraph brightness -> image samples -> GCS reconstruction; and, separately, physical CME state -> spacecraft trajectory -> in-situ time series -> magnetic-cloud boundary and radius estimator. A cross-link between the branches requires a declared transport and impact-parameter map.

## 6. Candidate test matrix

| Hypothesis | Shared parameters | Calibration and holdout | Predicted observable | Standard comparator | Falsification / failure condition |
|---|---|---|---|---|---|
| H0: standard GCS plus the paper's empirical three-phase aspect-ratio evolution | Common propagation/evolution law; event-specific initial state and measured environment | Reproduce the published fit first. Then freeze parameters on early GCS snapshots and predict later snapshots and the in-situ endpoint without fitting those held-out data. | Projected coronagraph contours, six GCS parameters, kappa versus height and time, and the 1-AU radius estimate. | The paper's GCS reconstruction, constant-kappa bridge, power-law segment, and in-situ radius estimator. | Held-out joint residuals fall outside a pre-registered predictive region after measurement, parameter, and model-discrepancy uncertainty are propagated. |
| H1: H(s)H geometric re-expression of the same GCS surface history | No extra free parameters beyond the standard GCS state and an explicitly invertible representation map | Use the same calibration and holdout as H0. | The same projected images and GCS parameter history. | H0 under identical data and calibration. | If the observable predictions are identical, the re-expression is observationally equivalent and supplies no distinct empirical support. |
| H2: H(s)H material-worldtube extension | One shared transport law across events; event-specific initial conditions only | Exploratory stratified leave-one-event-out across the four fast and four slow events. For each held-out event, use only early GCS state to initialize and predict later coronal geometry and the in-situ crossing. | Later projected surfaces plus the held-out in-situ time series and derived crossing geometry. | H0 with the same initial information, nuisance parameters, and measurement pipeline. | Failure if the material map is non-identifiable, if held-out predictions miss the pre-registered joint envelope, or if all added effects are absorbed by standard GCS parameters. |
| H3: additional twist or contact-surface dynamics | A source-defined twist/contact variable and a common constitutive law, not per-event retuning | Not calibratable from the current published summary alone. Requires magnetic-field winding or boundary stress/flux observations with independent provenance. | A specified field-line rotation, boundary traction/flux, or other new observable not already encoded by GCS tilt and kappa. | Standard flux-rope orientation and ambient-wind interaction models. | Not test-ready until the new variable has a defined forward map and a separately measured observable. |

Eight events permit an exploratory event-level holdout, preferably stratified by fast/slow class. They do not provide a high-powered confirmatory sample by themselves; an independent later event or external dataset is needed for confirmation. The held-out event's later images and 1-AU endpoint must not be used to tune the shared law.

A suitable joint residual statistic is D2 = (y_holdout - mu_pred)^T Sigma_pred^(-1) (y_holdout - mu_pred), compared with a predictive quantile chosen before holdout inspection. Sigma_pred must include the joint GCS fit covariance, image/measurement uncertainty, in-situ estimator uncertainty, and model discrepancy. The article's marginal median/MAD summaries do not supply this full covariance, so no numerical threshold or D2 value is claimed here. A bootstrap predictive envelope is preferable if residuals are non-Gaussian.

## 7. Lean and proof boundary

Existing Ravel PR #1133 contains a conditional readout-fiber theorem: a readout descends to a quotient when it is constant on the relevant fibers. The inspected Actions run #43849175548 used a synthetic merge reference, not an exact-head checkout. The Ravel readout module built in that run, but the aggregate root build failed later in the shared MovingPlaneTraceGeometry dependency. Global axiom audit, tests, lint, leanchecker, and nanoda were not completed. PR #1133 remains open, draft, and unmerged.

That theorem is a factorization condition, not an identifiability theorem. A readout can be well-defined on a quotient and still map distinct parameter classes to the same observable. The new gate is therefore: factorization first, injectivity modulo a declared physical equivalence second, and out-of-sample predictive discrimination third.

A faithful new Lean statement for the material-worldtube or H(s)H identifiability claim is blocked until the source defines the geometric state space, parameter equivalence/gauge relation, material labels, transport map, and observation operator. Inventing those definitions merely to obtain a compiling theorem would formalize the assistant's proposal, not Nathan Direct or an established physical model. No new Lean theorem, exact-head build, or physical proof is claimed in this run.

## 8. Disposition

- Candidate-only architecture supplement; P2 remains HOLD.
- Existing issue #1921 is not retried, replaced, or represented as published by this report.
- Raw coronagraph images, row-level LLAMACoRe records, full joint fit covariance, and the source's machine-readable time series were not retrieved in this run.
- No independent image refit, physical calculation, fit, forward prediction, holdout, or numerical falsification threshold was produced.
- No SAT-O or Blockwave original was changed; no corrected equation was introduced.
- No BEDROCK, STATE_OF_THE_THEORY, or paper-gate promotion.
- No new tooling, branch, PR, dependency, subscription, or expenditure.

Primary paper: https://doi.org/10.1093/mnras/stag1145
Existing P2 candidate calculation: https://github.com/Satobloc/HsH/issues/1921
Canonical P2 docket: https://github.com/Satobloc/HsH/issues/565
