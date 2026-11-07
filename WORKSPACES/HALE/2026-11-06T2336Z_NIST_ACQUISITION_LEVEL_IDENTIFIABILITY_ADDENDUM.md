# NIST acquisition-level orientation and nuisance-identifiability addendum

**Disposition:** SOURCE-STRUCTURE CORRECTION / CONDITIONAL TEST-DESIGN GATE / CANDIDATE ONLY / NO P2 SYSTEM SELECTION / NO H(s)H PREDICTION.

**Parent record:** [Issue #1432](https://github.com/Satobloc/HsH/issues/1432), *NIST four-cell contrast and measurement-identifiability gate*.  
**Formalization:** [PR #1387](https://github.com/Satobloc/HsH/pull/1387), existing branch `research/hale-measurement-domain-contract-20261105t0936z`.

## 1. Scope correction: four final summaries are not the raw acquisition design

The final NIST/BIPM torsion-balance paper reports **eight torque differences** in Table 15:

- copper source masses at three clockings: 0°, 120°, and 240°;
- sapphire source mass at one clocking;
- each configuration measured with both electrostatic-servo and free-deflection readout.

Table 16 then reports four final determinations of (G), classified by source-mass material and readout mode. These four values are an aggregated 2×2 summary, not four raw acquisition cells. The four-cell coefficient-to-summary bijection formalized in PR #1387 remains valid for those four final summaries. It does **not** establish that the underlying eight-observation acquisition has no residual structure.

The source explicitly describes the three copper clockings as a way to average over a possible radial density-gradient contribution. For copper, it models the orientation dependence as

[
G(\theta)=G_i+A\sin(\theta-\theta_0),
]

where (i) indexes the two readout methods. The three equally spaced orientations are used to cancel this first-harmonic contribution. Sapphire is measured at one orientation because the paper treats it as not having the same density-gradient issue.

The final four-summary covariance and the paper's configuration-specific dark-uncertainty model remain essential. The four summaries must not be treated as four independent measurements.

**Correction to shorthand in #1432:** “2×2 design” should be read as the four-summary cross-classification, not as a balanced four-cell description of the raw acquisition.

## 2. Conditional identifiability: first-harmonic aliasing

Expanding the paper's phase-form nuisance gives

[
A\sin(\theta-\theta_0)
=(A\cos\theta_0)\sin\theta
-(A\sin\theta_0)\cos\theta.
]

Thus the standard copper-orientation nuisance occupies the two-dimensional first-harmonic sine/cosine span.

If a proposed H(s)H contribution at this measurement interface has the form

[
\Delta G_{H(s)H}(\theta)
=\lambda\bigl(u\sin\theta+v\cos\theta\bigr),
]

then it can be absorbed exactly by changing the two first-harmonic nuisance coefficients. It is not separately identifiable from that nuisance using the same angular response alone. The paper's three-orientation averaging also removes a contribution with that same first-harmonic structure from the copper aggregate.

This is a **conditional** statement. No H(s)H angular response has been recovered or selected. The result does not assert that H(s)H predicts a first harmonic.

The paper's final Bayesian consensus model additionally includes configuration-specific dark effects and their covariance. A candidate that contributes only one offset per final configuration is not independently distinguished by the four final summaries unless its configuration pattern is constrained independently or a further observable breaks the degeneracy.

A different angular signature is not automatically identifiable merely because it is not first-harmonic. It must be evaluated on the actual sampled orientations, readout modes, and covariance before being called discriminating.

## 3. Formalization added to the existing PR

Updated the existing PR #1387 branch, without creating a new branch or PR.

- Commit: `c1d95b2ecdf3d6728b99db056b5450e1e7819069`
- Module: `FORMAL_VERIFICATION/HsHVerification/FactorialContrastIdentifiability.lean`
- Module blob: `da5c18da018bed947db0d04a692dadbba1a5a8ce)
- Added theorem: `phase_parameterization_is_first_harmonic`
- Added theorem: `same_span_extra_is_absorbed`

The first theorem expands the source model's phase parameterization into sine/cosine coefficients. The second proves that an added term in that same span is exactly absorbed by reparameterizing those coefficients.

The first CI attempt, run #42317295290, failed because the three real-valued model definitions were not marked `noncomputable`. They were corrected on the same PR branch. Replacement run #42317706397 was **IN PROGRESS** at Lake dependency-manifest generation when this report was drafted. No compile-success claim is made here until that run and its logs are checked. The theorem statements contain no `sorry` or `admit`; the build result remains a separate question.

Lean verifies only these formalized algebraic statements. It does not validate the source-to-model translation, the adequacy of the NIST nuisance model, or any physical H(s)H premise.

## 4. Acquisition-level test matrix

| Element | Required specification |
|---|---|
| H(s)H hypothesis | A source-defined response (h_{H(s)H}(\theta,\text{material},\text{readout})) derived from an explicit worldtube-to-source-support and source-to-observable map. No such response is currently established. |
| Standard comparator | The same NIST measurement model, including the copper first-harmonic density-gradient term, configuration-specific dark effects, and published covariance structure. |
| Shared parameters | Any H(s)H geometric/interaction parameters must be fixed across the relevant material, orientation, and readout configurations, not independently refitted per cell. |
| Calibration | Freeze the source-to-observable map, geometry, standard nuisance model, covariance treatment, and any H(s)H parameters using calibration acquisitions only. |
| Holdout | Reserve an additional source-mass orientation or genuinely independent acquisition block not used in calibration. The holdout must be selected before examining its outcome. |
| Predicted observable | Acquisition-level torque differences or their predeclared derived (G) values by orientation and readout, with the full applicable covariance. Do not reduce the test to only four final summaries if the proposed effect lives in orientation structure. |
| Falsification | Pre-register a predictive discrepancy threshold using the full covariance and calibration uncertainty. No numerical threshold is assigned from the four aggregate values. |
| Failure of identifiability | If the proposed H(s)H response lies in the standard nuisance span, is absorbed by configuration effects, or has no independent holdout, it supplies no separately testable prediction at this interface. |

## 5. Evidence and limits

The identifiable measured system is the NIST/BIPM torsion-balance determination of (G), reported in *Metrologia* 63 (2026) 025012, DOI 10.1088/1681-7575/ae570f. The paper provides the eight published torque differences and Type-A uncertainties in Table 15, four final (G) determinations in Table 16, and aggregate covariance/dark-uncertainty treatment in Tables 18–19.

This pass did not retrieve raw torque/angle time-series bytes, acquisition-block metadata, a full eight-observation covariance, CMM point-cloud files, or an independent holdout. No new fit, physical calculation, held-out prediction, or numerical falsification threshold was produced. The NIST apparatus remains a methodological candidate only; it is **not** selected as the P2 measured system.

### Sources

- NIST final paper, *Metrologia* 63 (2026) 025012: https://doi.org/10.1088/1681-7575/ae570f
- NIST publication page: https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist
- Parent aggregate-summary analysis: https://github.com/Satobloc/HsH/issues/1432
- Existing formalization: https://github.com/Satobloc/HsH/pull/1387

This is an assistant-authored source/architecture addendum, not Nathan Direct, not an independent measurement, and not a theory result.
