# Two-level prediction-separation gate: observable discrimination vs geometric resolution

**Date:** 2026-11-09  
**Run key:** REVROT3-19-20261011:711:s3  
**Authorship/status:** Assistant-derived workflow design; not Nathan Direct, not a physical prediction, not BEDROCK.

## New contribution

The existing HsH evidence architecture already treats source/map closure, fiber compatibility, joint-readout identifiability, calibration ancestry, resolution stability, holdout and empirical validation as separate gates. This note adds an explicit distinction between:

1. whether H(s)H and a standard comparator make distinguishable predictions in the recorded-data space; and
2. whether a geometric or other latent target can be stably reconstructed from those records.

Passing one does not imply passing the other. This is a bridge among existing issues #1301, #1447, #1463 and #1470, not a replacement ledger or new physical premise.

## 1. Observable-space discrimination

Let Y be the declared recorded-data space, with its instrument response and joint uncertainty model. For the same measured system, calibration split, instrument response and shared nuisance parameters, compare the standard comparator's and H(s)H's full predictive distributions in Y.

The comparison must propagate measurement uncertainty, calibration uncertainty, model-prediction uncertainty, cross-channel and cross-observation covariance, and any justified model-discrepancy term. Two derived summaries of the same raw record are not independent channels.

A Mahalanobis separation statistic is appropriate only when the covariance, distributional assumptions, rank and decision threshold are established. Otherwise compare justified predictive regions directly. No universal numerical cutoff is supplied here.

If the predictive regions overlap at the declared coverage, classify the comparison as NO_DISCRIMINATING_RESIDUAL or UNRESOLVABLE_IN_OBSERVABLE_SPACE. A fit to either model does not create a discriminator.

## 2. Target-space geometric resolution

An identifiable parameter in an ideal noiseless map may still be unstable at the actual acquisition resolution.

The existing assistant-derived metric lemma in NadirVortexTwoChannelReadout.lean (PR #1189) gives the conditional bound:

**d_Z(T(x₁), T(x₂)) ≤ 2τ + L·δ_obs**

when one declared observation map O:X→Y, one target map T:X→Z and one common decoder D:Y→Z are used; D is L-Lipschitz on the declared spaces; the two readouts are at most δ_obs apart; and the decoder estimates each target within τ. The companion theorem separated_pair_excludes_lipschitz_decoder says that a pair exceeding this bound cannot satisfy all those decoder assumptions simultaneously.

This is a conditional decoder statement, not a statistical test between two physical theories. It does not derive δ_obs from data, estimate L or τ, encode physical units, establish that the maps exist, or validate a physical premise. For physical use, L·δ_obs and τ must be commensurate in declared target units and metrics.

**Formal evidence:** PR #1189 head cef7e8ab994973c4a91fd87aa0afa315c5d23b07; Lean 4.34.0 / Lake 5.0.0 Actions run #42114292197 completed SUCCESS on that exact head. This note reuses that existing build; it adds no theorem and claims no new Lean execution. PR #1189 remains OPEN / DRAFT / UNMERGED, with independent source-to-formal review outstanding.

## 3. Two-axis decision matrix

| Target-space decoder / resolution | H(s)H and standard predictive regions overlap in recorded-data space | Predictive regions are separated in recorded-data space |
|---|---|---|
| Stable / resolved | A target may be estimable within the chosen model, but there is no theory discriminator at this acquisition. | Geometry and theory may both be testable; an independent holdout is still required. |
| Unstable / unresolved | Neither a geometric reconstruction nor a theory discriminator is established. | Raw recorded data may distinguish the forward models, but the geometric interpretation remains unresolved. |

The fourth cell matters: a raw-data difference can be real and reproducible even when the inverse map to a proposed worldtube parameter is ill-conditioned or non-identifying. Conversely, a stable estimate inside one model does not show that the model differs from its standard comparator.

Keep the following statuses separate: OBSERVABLE_PREDICTIONS_OVERLAP; OBSERVABLE_PREDICTIONS_SEPARATED; TARGET_MAP_UNIDENTIFIABLE; TARGET_RESOLUTION_UNRESOLVED; TARGET_RESOLUTION_SUPPORTED; HOLDOUT_DISCRIMINATES; HOLDOUT_DOES_NOT_DISCRIMINATE; MAP_INCOMPLETE. Do not collapse them into one PASS or FAIL.

## 4. Operational acceptance rule

1. Freeze the measured system, dataset version, raw observables, derived targets, units, coordinate conventions and admissible parameter domain.
2. Close and type every map from model state to recorded data and every inverse/decoder from recorded data to target. State domains, codomains, metrics, units, assumptions, composition order and information loss.
3. Use the same calibration partition, instrument response and shared nuisance parameters for both models. Label fitted, calibrated, independently measured, derived and predicted quantities separately.
4. Compare full predictive regions in recorded-data space using the actual joint uncertainty model. If covariance or predictive uncertainty is missing, mark COVARIANCE_UNBOUND; do not invent a threshold.
5. Where a latent geometric claim is made, bind L, δ_obs, τ, metric spaces and units to actual calibration/measurement evidence. Apply the existing conditional bound only within its declared domain.
6. Freeze the map, parameters, prediction regions and rejection criterion before opening a genuinely independent whole-run, epoch or regime holdout. A second summary of calibration data is not a holdout.
7. Score without retuning:
   - H(s)H outside its preregistered predictive region while the standard comparator remains inside: reject that specific H(s)H map/parameterization for this system.
   - Standard comparator outside while H(s)H remains inside: the standard comparator is disfavored for this test; this does not establish H(s)H universally.
   - Both outside: model or measurement specification is incomplete.
   - Both inside: no discrimination at the declared resolution.
   - Raw-data discrimination without target resolution: report the data-space result, but do not claim a measured worldtube feature.
8. Keep source status orthogonal. A feature can be source-committed yet unresolved by a particular instrument; empirical usefulness does not make it a Nathan Direct premise.

## 5. What this says about thickness, twist and contact surfaces

This gate does not decide source-theoretic necessity. It improves the empirical question.

- A source-committed finite-core/thickness feature remains a source claim even if a particular experiment cannot resolve it.
- A separately parameterized twist or contact surface is not empirically necessary merely because it improves a fit.
- An added feature becomes a distinguishing empirical component only when its typed map predicts a residual beyond the standard comparator's joint predictive region, with shared parameters frozen and the result surviving an independent holdout.
- If the feature is absorbed by standard nuisance parameters, lies inside the uncertainty envelope, or requires study-specific retuning, it supplies no discriminator in that test.
- If the source requires a feature but the available observation map cannot resolve it, use SOURCE_COMMITTED / EMPIRICALLY_UNRESOLVED, not “absent” and not “validated.”

Geometry, identifiability, resolution and theory discrimination remain separate axes.

## 6. Source-grounded example: classical Kelvin-vortex readout

The 2026 Nature Physics air-water bathtub-vortex study by Barckicke, Falcon and Gissinger, “Kelvin wave propagation along vortex cores” (DOI 10.1038/s41567-026-03175-w), is a measurement-method example, not an H(s)H physical analogue.

Its opposite-side contour radii are transformed as:

η(z,t) = [r(z,t,0) − r(z,t,π)] / 2  
a(z,t) = [r(z,t,0) + r(z,t,π)] / 2

The inverse is r₊ = a + η and r₋ = a − η. This is an invertible two-coordinate transform of the two declared contour radii. It does not make η and a independent observations: both derive from the same pair of radii, so their joint covariance must be propagated from the radius measurements.

The paper's Methods report circulation and axial velocity fitted to dispersion data and checked a posteriori against PIV/PTV. Those checks must not be relabeled a blind holdout. The declared source-data item is Figshare DOI 10.6084/m9.figshare.30903347; its version metadata, raw bytes, file manifest, checksums and joint covariance were not retrieved for this note.

Consequently, no sample-level reanalysis, covariance estimate, numerical separation threshold, physical calculation or prediction was made. The H(s)H-to-classical-fluid map remains undefined. The classical vortex is not an H(s)H vacuum, worldtube or equivalence demonstration.

This example shows why an invertible coordinate transform is not the same as independent channels, and why channel-level geometry resolution is not theory discrimination.

## 7. Relationship to existing work

- Issue #1301: map closure, fiber compatibility and joint-readout identifiability.
- Issue #1447: source-to-observable map-stack gaps.
- Issue #1463: distinguishability ladder, calibration ancestry and evidence matrix.
- Issue #1470: same-sector cross-study transferability and whole-study holdout.
- PR #1189: exact two-channel readout and conditional finite-resolution decoder bound.
- Issue #1503: resolution-stability subgate.

The new delta is the explicit two-axis decision matrix and the rule that raw-data model discrimination and latent geometric resolution must be scored independently. No competing ledger, tool, schema, PR or duplicate issue is proposed.

## 8. Disposition and next admissible step

DESIGN_ONLY / NOT_IMPLEMENTED / NOT_A_PHYSICAL_PREDICTION / NOT_BEDROCK.

The next empirical step remains blocked until the project admits a P2 system and the raw dataset, version, calibration and covariance are recovered. For the Kelvin-vortex candidate, retrieve the Figshare item and actual files, establish the acquisition/registration and covariance chain, then freeze a fair standard comparator and an H(s)H map before any holdout is opened.

No numerical threshold is selected in the absence of those inputs. No SAT-O or Blockwave equation is altered. No manuscript or paper gate is advanced. No physical equivalence is asserted.

## References

- HsH issue #1301: https://github.com/Satobloc/HsH/issues/1301
- HsH issue #1447: https://github.com/Satobloc/HsH/issues/1447
- HsH issue #1463: https://github.com/Satobloc/HsH/issues/1463
- HsH issue #1470: https://github.com/Satobloc/HsH/issues/1470
- HsH issue #1503: https://github.com/Satobloc/HsH/issues/1503
- HsH PR #1189: https://github.com/Satobloc/HsH/pull/1189
- Exact-head Lean Actions run #42114292197: https://github.com/Satobloc/HsH/actions/runs/42114292197
- Barckicke, Falcon and Gissinger, Nature Physics DOI: https://doi.org/10.1038/s41567-026-03175-w
- Declared Figshare source-data DOI: https://doi.org/10.6084/m9.figshare.30903347
