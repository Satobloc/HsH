# Resolution-stability gate for finite-core readouts

**Relay:** Workshop Relay :36; nominal 2026-11-08 21:36Z; `h693:s3`  
**Preparation:** current assistant reconstruction under the deterministic Nadir Voss ring label; no authenticated historical Nadir thread or worker identity is claimed.  
**Status:** `ARCHITECTURE_ADDENDUM / EXISTING_LEAN_PROOF_REUSED / DESIGN_ONLY / NOT_P2_SELECTION / NOT_PHYSICAL_PREDICTION / NOT_BEDROCK`.

## 1. Why this is a distinct addition

Existing HsH work already separates:

- structural joint-readout identifiability and fiber compatibility (issue #1301);
- the measured Kelvin-vortex candidate, calibration ancestry and holdout requirements (issue #1261);
- source-to-observable map composition (issue #1447);
- acquisition information from deterministic higher-order statistics (issue #1451);
- geometry, calibration, prediction, empirical and publication evidence tiers (issue #1463).

This note adds one missing layer between structural identifiability and empirical validation:

**A map can be injective and still be too unstable at the actual instrument resolution to identify the target feature reliably.**

The addition is a resolution-stability subgate. It does not replace those existing gates or repeat the PRL acquisition-rank result.

## 2. Source-grounded measured system

### Nature Physics 2026

Barckicke, Falcon and Gissinger, "Kelvin wave propagation along vortex cores," *Nature Physics* 22, 409-414 (2026), DOI `10.1038/s41567-026-03175-w`.

The experiment uses a classical air-core water vortex in a 21-cm-diameter, 45-cm-tall tank. Its side-view contour acquisition reports 300 fps, a 12.5-cm axial analysis window, 60 um/px spatial resolution, 0.5-mm contour width and typical core-position/core-radius uncertainty of about 0.1 mm. The paper defines two opposing-contour channels:

\[
\eta(z,t) = [r(z,t,0)-r(z,t,\pi)]/2,\qquad
a(z,t) = [r(z,t,0)+r(z,t,\pi)]/2.
\]

It separately identifies PIV and PTV velocity measurements. The paper states that supporting data, including data used for spatiotemporal power spectra, are available at Figshare DOI `10.6084/m9.figshare.30903347`. That data locator is source-verified, but the item version, file manifest, raw bytes, checksums and joint covariance have not been retrieved here.

The reported 0.1-mm value is a typical measurement uncertainty, not a supplied joint covariance matrix or a pairwise readout-distance bound.

### Physical Review Letters 2026

Barckicke, Gissinger and Falcon, "Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core," *Physical Review Letters* 137, 134001 (2026), DOI `10.1103/t3bt-m431`.

This follow-on uses the same author group and a matching 21-cm by 45-cm platform description, but a different acquisition regime: a 480-fps, 3-Mpix optical record over a 20.6-cm axial window. Its reported nonlinear spectral and pentacoherence analysis uses the measured displacement field `eta(z,t)`. The article's data-availability statement says no research data or software are publicly available and directs requests to the authors. No request has been sent.

These papers form a same-program, cross-regime comparison, not an independent-laboratory replication. Exact physical apparatus identity is not established by matching dimensions.

## 3. Existing source-faithful Lean result

The existing draft PR #1189 contains `FORMAL_VERIFICATION/HsHVerification/NadirVortexTwoChannelReadout.lean` at head `cef7e8ab994973c4a91fd87aa0afa315c5d23b07`, file blob `fa7b15ae1fc5d37fe66d3f47877ca5c2f9253e59`.

The module proves, for the two opposing contour radii:

- the paired map `(r0,rpi) -> (eta,a)` is bijective, with inverse `(eta,a) -> (a+eta,a-eta)`;
- displacement-only `eta` is non-injective and loses the common-radius degree of freedom;
- under the stated single-harmonic radial ansatz and two-antipode sampling, modes `m` and `m+2` alias; deterministic downstream classification cannot undo that alias;
- a generic resolution-limited decoder bound, described below.

The mode-aliasing result is conditional on the two-point ansatz. It does not establish that the complete camera, image-processing or spectral pipeline uses only those two samples, and it does not claim that the paper misidentified a mode.

### Resolution-limited theorem

For an observation map `O : X -> Y`, target `T : X -> Z`, and decoder `D : Y -> Z`, suppose:

1. `D` is L-Lipschitz in the declared readout and target metrics;
2. two readouts are within `delta_obs`;
3. the decoder estimates each corresponding target within `tau`.

Then the formal theorem establishes:

\[
d_Z(T(x_1),T(x_2)) \le 2\tau + L\,\delta_{\mathrm{obs}}.
\]

The companion no-go theorem says that a pair violating this bound rules out a decoder satisfying all the declared assumptions for that pair.

This is a conditional stability result, not a physical threshold, p-value or model-comparison statistic. The Lean module explicitly warns that the metrics must have declared units and commensurate scales. Its abstract `Real` pseudometric does not encode physical units or derive `delta_obs` from experimental covariance.

### Actual compilation status

PR #1189 remains `OPEN / DRAFT / UNMERGED`. Exact-head GitHub Actions run #42114292197, job #127550448758, completed `SUCCESS` on the same source commit asserted by the workflow. The build used Lean 4.34.0 / Lake 5.0.0 and completed 8,954 jobs.

The run's tests, lint, nanoda and separate global axiom-audit stages were skipped. This is an actual exact-head build of the encoded conditional mathematics, not an audit of the physical source translation or a validation of any H(s)H premise. No new Lean execution or code change was made in this run; the existing proof and build were reused.

## 4. New architecture: four separate gates

| Gate | Question | Required evidence | Failure/blocked state |
|---|---|---|---|
| Structural identifiability | Is the target uniquely determined on the admissible domain? | Explicit observation map and fiber/injectivity proof | `STRUCTURALLY_UNIDENTIFIABLE` |
| Resolution stability | Does a bounded-error decoder exist at the actual instrument resolution? | Declared readout/target metrics, units, Lipschitz bound `L`, observation bound `delta_obs`, reconstruction error `tau` | `STABILITY_UNASSESSED` or `UNRESOLVABLE_AT_CURRENT_ACQUISITION` |
| Calibration ancestry | Were `L`, `delta_obs`, `tau` and shared model parameters obtained independently of the holdout? | Versioned calibration data, provenance, covariance, parameter-freeze record | `CALIBRATION_LEAKAGE` |
| Empirical validation | Does a frozen prediction survive a genuinely held-out acquisition? | Raw measured system, uncertainty/covariance, preregistered residual and independent review | `TRANSFER_FAIL` or `TRANSFER_SUPPORTED_NOT_VALIDATED` |

An injective map does not automatically pass the resolution-stability gate. Conversely, a high-order statistic or downstream classifier cannot restore a feature already removed by a non-injective acquisition.

For the two-channel contour map, the algebraic inverse is exact for the two sampled radii. It does not establish a stable inverse for the full camera-to-geometry pipeline, the complete cross-section, a material-frame twist, or an H(s)H worldtube.

## 5. Conditional test matrix

| Hypothesis | Shared parameters | Calibration / holdout | Observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| `H0`: standard fluid model | `a0`, circulation `Gamma`, axial flow `vz`, plus declared instrument parameters | Obtain each from independently measured/calibrated channels; freeze before a whole-run or whole-regime holdout | `eta`, `a`, their spectra and declared mode/correlation products | Rankine-core Kelvin dispersion and the relevant standard weak-turbulence model | Reject only against a preregistered covariance-aware holdout criterion |
| `H1`: H(s)H is only a reparameterization of the same fluid state | Same measured fluid parameters and the proposed H(s)H-to-fluid projection | No study-specific retuning of the shared map | Same measured channels | Same standard fluid model | If the observation map factors through the standard state with no new constraint or residual, there is no distinguishing prediction |
| `H2`: H(s)H adds finite-core thickness, twist or contact structure | Shared H(s)H geometry parameters, kept separate from study-specific fluid and instrument parameters | Requires an explicit geometry-to-fluid map and an independently calibrated channel that resolves the claimed feature | Candidate channels include time-resolved `a(z,t)`, additional angular samples, cross-channel phase/coherence or an independently measured boundary response | Standard finite-core fluid model using the same measured inputs | Reject the proposed map if its predicted feature is absent beyond the preregistered uncertainty; do not infer the feature from a standard core radius alone |
| `H3`: H(s)H adds a nonlinear response beyond standard Kelvin-wave turbulence | Frozen geometry/response parameters and independently measured flow parameters | Whole-regime holdout; PRL raw data access is presently blocked | A specified phase-correlation or resonance observable beyond merely reproducing the published `eta` pentacoherence | Standard six-wave/weak-turbulence account | Reject if the frozen H(s)H prediction fails the preregistered holdout; matching the standard result alone is not H(s)H evidence |

No numerical threshold is assigned. `L`, `delta_obs`, `tau`, model uncertainty and the joint covariance must be obtained from actual calibration and validation data. The Nature paper's typical 0.1-mm uncertainty cannot be substituted directly for `delta_obs`; the PRL raw data are not public.

## 6. Forced versus optional geometry

- A finite air core, its measured radius, and Kelvin bending/flattening modes already occur in standard fluid mechanics. They are not uniquely H(s)H features.
- The two-channel `(eta,a)` transform preserves the two sampled contour radii; an `eta`-only channel loses common-mode radius information.
- A separately parameterized worldtube thickness, material-frame twist, contact surface or timesheet response is not forced by these measurements.
- Such a feature becomes testable only after a source-derived H(s)H-to-fluid map, a complete composition to a calibrated observation operator, and a predicted signal that is both structurally identifiable and resolvable above the actual measurement/model uncertainty.

If the predicted H(s)H effect lies inside the resolution bound, classify it as unresolved at the current acquisition, not as supported or falsified. If the map has no distinct observable effect after the standard projection, classify it as `NO_DISCRIMINATING_RESIDUAL`.

## 7. Disposition and next cursor

This is a workflow/architecture addendum only:

- no raw dataset bytes or covariance were acquired;
- no physical calculation, fit, numerical prediction, significance test or falsification threshold was performed;
- no H(s)H-to-fluid map was supplied;
- no P2 system was selected;
- no SAT-O or Blockwave original equation was changed;
- no BEDROCK, theory, paper-gate or production-tool promotion is claimed.

Next useful operation: retrieve and version the Nature Figshare item, inspect its actual files and calibration provenance, and recover the joint measurement covariance. Separately request the PRL data/software from the authors if a cross-regime holdout is to be attempted. Only then can `L`, `delta_obs` and `tau` be bounded in physically meaningful metrics and a resolution-aware holdout preregistered.

## References

1. Barckicke, J., Falcon, E. and Gissinger, C. (2026), "Kelvin wave propagation along vortex cores," *Nature Physics* 22, 409-414, DOI `10.1038/s41567-026-03175-w`; source data DOI `10.6084/m9.figshare.30903347`.
2. Barckicke, J., Gissinger, C. and Falcon, E. (2026), "Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core," *Physical Review Letters* 137, 134001, DOI `10.1103/t3bt-m431`.
3. HsH issue #1301, joint-readout identifiability; #1261, Kelvin-vortex calibration/holdout; #1447, source-to-observable map stack; #1451, acquisition rank versus higher-order statistics; #1463, worldtube distinguishability ladder.
4. HsH PR #1189, source-conditional Lean formalization, file `NadirVortexTwoChannelReadout.lean`, exact-head build #42114292197.
