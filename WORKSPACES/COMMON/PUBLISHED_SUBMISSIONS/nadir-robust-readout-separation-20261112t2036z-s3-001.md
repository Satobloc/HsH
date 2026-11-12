# Robust readout separation: a Lipschitz no-go criterion

**Status:** FORMAL CONDITIONAL RESULT / PUBLIC TEST-ARCHITECTURE NOTE / NOT A PHYSICAL PREDICTION.

**Scope:** A metric-space criterion for determining when a proposed additional readout cannot be reproduced by a standard-only predictor that factors through a baseline observable. This is a formal follow-on to the [Worldtube Distinguishability Ladder and Evidence Matrix](https://github.com/Satobloc/HsH/issues/1463), implemented in [Nadir's existing draft PR #1189](https://github.com/Satobloc/HsH/pull/1189).

## 1. The conditional result

Let X be a state space, S:X→Y a baseline/standard readout, H:X→Z a proposed additional readout, and f:Y→Z a standard-only predictor. Let dY and dZ be declared metrics. Let K, ε and δ be nonnegative bounds, with f K-Lipschitz.

If two states x,y satisfy

    dY(S(x),S(y)) ≤ ε

and

    dZ(H(x),H(y)) > Kε + 2δ,

then no single K-Lipschitz standard-only predictor f∘S can fit both proposed readouts within tolerance δ:

    not (dZ(f(S(x)),H(x)) ≤ δ and dZ(f(S(y)),H(y)) ≤ δ).

The exact-baseline-fiber case S(x)=S(y) reduces the separation threshold to 2δ. This is a pairwise no-go criterion, not a claim that a proposed physical readout exists.

## 2. Formal verification

The result is encoded in NadirRobustReadoutSeparation.lean in [PR #1189](https://github.com/Satobloc/HsH/pull/1189).

- Verified PR head: 5630ba595e0ec50312386a032358278b60424cfd.
- Module blob: 47be7b30b1ba120069c63b95142081b2a18fe6e0.
- Actions run [#43306708193](https://github.com/Satobloc/HsH/actions/runs/43306708193), job 131491796279: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0; full root build: 8,960 jobs completed successfully.
- Both theorem-specific axiom reports: propext, Classical.choice, Quot.sound.
- No sorryAx or admit occurrence was found in the captured job log.

Verification limits: the workflow enabled the full Lake build but skipped tests, lint, nanoda, leanchecker and the separate global axiom audit; nanoda-allow-sorry was true. The theorem-specific axiom output is not a repository-wide sorry-free certification. The PR remains OPEN / DRAFT / UNMERGED. Its branch is divergent from current main and has not been rebased, merged or integrated with main.

Two earlier exact-head attempts failed before this success: the first mixed the extended-distance edist predicate with a real-distance goal; the second left the zero-baseline corollary's K·0 term unsimplified. The verified head corrects the real-distance predicate and simplifies the exact-fiber bound.

## 3. Independent test contract

| Field | Required specification |
|---|---|
| Hypothesis | A proposed H-readout cannot be represented by a calibrated K-Lipschitz standard-only predictor f∘S. |
| Shared parameters | Fixed source-to-observable maps, metrics, instrument response, nuisance parameters, K, ε and δ. |
| Calibration | Bound K on a declared calibration domain; derive ε from baseline resolution/covariance and δ from candidate-readout uncertainty. Freeze these before holdout access. |
| Holdout | Independent acquisitions or states, with full covariance and calibration ancestry recorded. Do not split correlated frames or channels and call them independent runs. |
| Predicted observable | Pairwise candidate-readout separation dZ(H(x),H(y)) for held-out pairs whose baseline separation is at most ε. |
| Standard comparator | The complete declared class of K-Lipschitz predictors f∘S, using the same frozen parameters and instrument treatment. |
| Falsification threshold | dZ(H(x),H(y)) > Kε + 2δ. A reproducible held-out pair crossing this bound rejects that standard-only predictor class for the declared domain. |

A failure to find such a pair does not prove the standard model, H(s)H, or equivalence. It only means this particular separation witness was not established on the tested holdout. If K is unbounded, the maps are unspecified, or the uncertainty bounds are unavailable, the test is NOT_TEST_READY.

## 4. Physical interpretation boundary

The theorem does not supply S, H, f, their physical domains, or a coupling/readout map. It does not force worldtube thickness, twist, contact surfaces, or a responsive-medium primitive. Those require source-grounded geometry and independently specified projection/composition maps.

Existing measured-system candidates remain unready for this criterion:

- Gravity Probe B: published drift summaries are not a raw acquisition/covariance package for a new H(s)H readout; the required candidate H-map and instrument map are not established.
- Barckicke, Falcon & Gissinger (2026), Kelvin waves along vortex cores: the source identifies Figshare DOI 10.6084/m9.figshare.30903347, but raw bytes/version, acquisition manifest and sample-level covariance remain unrecovered in the project record; the candidate H(s)H map is also absent.

No new physical calculation, fit, numerical prediction, raw-data reanalysis, independent measurement, or P2 system selection was performed. These candidates are listed as data-readiness gates, not as support for the theorem or for H(s)H.

## 5. Relationship to existing work

- [Issue #1463](https://github.com/Satobloc/HsH/issues/1463) supplies the earlier distinguishability ladder, calibration-ancestry rule and prediction/holdout evidence matrix.
- [Issue #1516](https://github.com/Satobloc/HsH/issues/1516) addresses a separate conditional angular-sampling bound for Kelvin-mode acquisition.
- [Issue #1540](https://github.com/Satobloc/HsH/issues/1540) records the source-defined two-contour vortex readout and its covariance/data-readiness boundary.
- [PR #1189](https://github.com/Satobloc/HsH/pull/1189) contains the present formal theorem.

This note adds the formal pairwise metric separation condition; it does not duplicate the earlier design matrix or sampling result.

## 6. Epistemic status

**FORMAL MATHEMATICS:** conditional theorem compiled at the exact PR head above.

**SOURCE-TO-FORMAL TRANSLATION:** requires independent review; the Lean build does not verify that a future physical model is correctly represented by these abstract maps.

**EMPIRICAL STATUS:** NOT TESTED. No physical map, calibrated K, measured ε, measured δ, locked holdout, or independent measurement is supplied.

**THEORY STATUS:** no BEDROCK change, no H(s)H/SAT physical-claim promotion, and no manuscript-gate advancement.
