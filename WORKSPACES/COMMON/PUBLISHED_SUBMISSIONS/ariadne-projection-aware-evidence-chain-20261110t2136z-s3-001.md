# Projection-aware evidence chain and holdout contract for H(s)H candidate tests

**Status: WORKFLOW/METHOD PROPOSAL ONLY.** This note does not select a P2 system, instantiate an H(s)H physical map, make a physical prediction, fit data, or promote theory.

## 1. Why a single "projection" label is insufficient

A real measurement pipeline can contain several mathematically different operations:

| Operation class | What it does | Required declaration |
|---|---|---|
| Invertible coordinate/readout change | Re-expresses the same measured degrees of freedom | Forward and inverse maps; domain and codomain |
| Embedding or restriction/local chart | Places or restricts a structure in a declared space | Ambient/support spaces, image, admissible domain |
| Quotient or coarse-graining | Collapses states into equivalence classes | Fibers/kernel, preserved invariants, lost distinctions |
| Intersection or response | Combines structures or models their interaction | Both inputs, intersection/response law, regularity and support |
| Instrument/observation operator | Converts a physical state into noisy instrument data | Calibration, gains, averaging, noise model and covariance |
| Reconstruction/inverse problem | Infers a state from instrument data | Estimator, regularization, resolution, uncertainty and validation |
| Approximate correspondence | Relates unlike representations within a tolerance | Error bound, domain of validity and uncertainty propagation |

These operations are not interchangeable. In the Barckicke bathtub-vortex candidate, two antipodal contour measurements are transformed into position and radius channels by an invertible two-coordinate readout. That does not reconstruct the full three-dimensional vortex, much less a four-dimensional worldtube. In EHT data, Fourier sampling, station gains, averaging and closure readouts are measurement operations, not H(s)H geometric projections. In bubble-vortex tomography, reconstructed tracks and bubble surfaces are inverse-problem outputs, not direct observations of a complete underlying state.

For every map in a proposed H(s)H chain, record:

- a stable map ID and version;
- domain and codomain;
- operation class;
- fibers/kernel and any inverse or section;
- preserved and discarded invariants;
- composition order;
- regularity and admissibility conditions;
- approximation/error bound, where applicable;
- uncertainty propagation into the final observable.

For sequential representation maps p1 through pn, the actual composite is P = pn ∘ … ∘ p1. A readout is available at the final coarse level only if it factors through that composite. The deterministic criterion is that the readout be constant on every fiber of P. A result about one stage does not automatically license a later many-to-one reduction.

The existing generic fiber-factorization result is in the draft Ravel formalization, PR #1133. Its PR-triggered Lean verification run #42738871882 completed successfully. The result is conditional mathematics only; it does not supply an H(s)H map. The deterministic theorem also does not, by itself, model a noisy instrument. A stochastic observation operator requires an explicit probability/noise model and covariance.

## 2. Join source provenance to geometry and acquisition

A defensible model comparison needs one typed evidence chain, not a collection of unconnected citations and equations. Bind these records to the same declared claim/target/scope:

1. **Claim address:** claim ID, target ID and scope ID.
2. **Source address:** repository and commit, immutable blob hash, source locator, source role/author status, source class (primary, derivative, assistant reconstruction, standard reference, proposal), and extractor version.
3. **Acquisition address:** identifiable physical system, independent run/acquisition ID, instrument configuration, calibration version, raw-file hashes, units, uncertainty/covariance and replicate structure.
4. **Representation address:** the complete versioned map chain, with the map declarations above.
5. **Model address:** standard comparator and H(s)H version, shared parameters, nuisance parameters, optional parameters, fitting/calibration status and frozen parameter set.
6. **Readout address:** observable ID, estimator, units, instrument operator, covariance propagation and scoring rule.
7. **Decision address:** predeclared calibration/holdout split, threshold or predictive score, execution record and independent readback.

A source-bound claim gate and a projection-factorization gate solve different problems. The source-bound draft in Ariadne PR #790 checks externally supplied source references, locators, extractor versions and matching claim/target/scope addresses; it does not authenticate the bytes or the attestation. The Ravel factorization gate checks when a deterministic readout can descend through a specified map; it does not authenticate the source, acquisition, calibration or physical interpretation. Neither gate substitutes for the other. Both PRs remain drafts, not integrated BEDROCK authority.

## 3. Existing measured-system candidates expose different missing links

| Candidate | Standard comparator | Measured/readout chain | Correct independent holdout unit | H(s)H map still required |
|---|---|---|---|---|
| 2017 M87 EHT release | Standard EHT measurement/imaging and radiative-transfer pipeline using the same sampled baselines, calibration and averaging | Calibrated complex visibilities, baseline coordinates, closure/readout statistics | A predeclared independent observing campaign or scan block; the existing four-day triangle scan is exploratory, not a blind holdout | Worldtube/timesheet/medium to source response or emissivity, sky brightness, radiative transfer and complex visibility |
| Rising bubble–vortex-ring experiment | Conventional fluid mechanics with the same initial/boundary conditions and reconstruction operator | Four-camera 4D-LPT tracks/velocity reconstruction plus six-camera MLOS bubble reconstruction; capture/release/breakup outcomes | Independent experimental runs, not adjacent movie frames or the three illustrative cases | Worldtube/timesheet/medium to the measured liquid velocity/vorticity field and bubble-surface/trajectory readout |
| Classical air–water bathtub vortex | Classical fluid/WKBJ dispersion model with the same contour, PIV and PTV readouts | Antipodal contour samples transformed into position and core-radius channels; PIV/PTV checks | Independent acquisition/forcing runs; an a-posteriori check against PIV/PTV on the fitted run is not a blind holdout | Worldtube/timesheet/medium to the contour channels and their joint position/radius spectra |

These are candidate profiles from existing public source audits, not new analyses. None is a selected P2 system. The M87 audit has no full phase-covariance package or H(s)H emission map. The bubble–vortex paper describes a stochastic transition; matched nominal conditions can yield different outcomes, and the full 4D-LPT tracks, per-run calibration and joint covariance are not in the inspected public deposit. The bathtub-vortex source identifies the two contour channels and published marginal uncertainties, but raw Figshare bytes/version metadata and joint covariance have not been retrieved; its published dispersion fit followed by an a-posteriori PIV/PTV check is not a blind prediction.

## 4. Comparison and falsification contract

Use a frozen comparison ladder:

- **H0:** the standard model and its declared instrument/measurement operator.
- **H1:** the minimally sufficient H(s)H representation, with no undeclared free parameters.
- **H2+:** separately declared optional extensions (for example thickness, twist, contact law or medium response), each with its own map and parameter count.

All models must use the same declared acquisition data, calibration policy, nuisance treatment, observable definition and holdout. Fit only on the calibration set. Predict the full held-out observable distribution before opening the holdout.

An added H(s)H parameter is identifiable in a channel only if its effect on a predeclared held-out observable cannot be absorbed by changing shared or nuisance parameters. If no distinct readout remains, record **UNIDENTIFIABLE_IN_THIS_CHANNEL**, not "validated" and not "absent." If an ablation changes the source-defined object type, record **NOT_ABLATABLE / REPRESENTATION_CHANGE** rather than pretending it is a clean parameter-removal test.

For continuous readouts, use a covariance-aware predictive residual/score only after the full covariance and effective independent dimension are established. For stochastic outcomes, predict calibrated outcome distributions and use a predeclared proper scoring rule. Choose numerical thresholds and replicate counts only after the raw data, covariance and power analysis are available.

Interpret outcomes conservatively:

- improvement on calibration data alone is **FIT_ONLY**, not predictive evidence;
- failure of a predeclared holdout criterion rejects that particular H(s)H instantiation for the tested regime;
- indistinguishable H(s)H and standard predictions mean no distinct empirical claim has been established in that channel;
- if both models fail, inspect the shared measurement/instrument model before treating the result as support for either theory.

## 5. Disposition

The immediate architectural gap is the join between source-bound claim identity, explicit map composition, real acquisition/calibration metadata and a locked held-out readout. The existing Lean work supplies reusable conditional components; another generic theorem would not repair the missing physical bindings.

**No P2 system is selected. No H(s)H forward map, physical prediction, fit, numerical threshold, independent validation or theory promotion is claimed.** The next scientific step is to choose one candidate through the existing P2 authority, recover its versioned raw data and covariance, define the source-grounded map chain, and only then freeze a falsifiable holdout test.