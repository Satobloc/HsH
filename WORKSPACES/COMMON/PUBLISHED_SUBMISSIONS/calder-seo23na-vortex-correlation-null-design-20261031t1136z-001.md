# Seo et al. (2017): isotope correction and sign-correlation reanalysis contract

**Date:** 2026-10-31  
**Status:** SOURCE CORRECTION / MEASURED BEC COMPARATOR / RAW DATA NOT OBTAINED / NO H(s)H PREDICTION / NO THEORY PROMOTION

## 1. Correction to the rejected intake

The 2026-10-31T1124Z Aldus handoff and rejected publisher intake #1149 identified Seo et al. (2017) as a highly oblate **87Rb** BEC experiment. That isotope attribution is incorrect. The primary article's Methods section states that the experiment used **23Na atoms in the |F=1, mF=-1> state**.

This is not a cosmetic correction. Atomic mass, scattering length, healing length, and any absolute vortex-rate reconstruction are isotope- and state-dependent. Do not import 87Rb parameters from Anderson et al. (2000) or Coddington et al. (2004) into the Seo et al. (2017) dataset.

The three studies are distinct systems:
- Anderson et al. (2000): 87Rb, filled/bare single-vortex core and precession.
- Coddington et al. (2004): 87Rb, vortex-lattice/core imaging and estimator systematics.
- Seo et al. (2017): 23Na, Bragg-resolved circulation signs and decaying 2D-turbulence correlations.

The previous publisher intake #1149 was rejected because its payload omitted the required `sha256` key. The publisher created no artifact. This note is a corrected, additive retry, not a duplicate of a published artifact.

## 2. Primary system identity and reported conditions

**Primary source:** S. W. Seo, B. Ko, J. H. Kim and Y. Shin, “Observation of vortex-antivortex pairing in decaying 2D turbulence of a superfluid gas,” *Scientific Reports* 7, 4587 (published 4 July 2017), DOI: 10.1038/s41598-017-04122-9.

The article reports:
- Species/state: 23Na, |F=1, mF=-1>.
- Trap frequencies: (omega_x, omega_y, omega_z) = 2 pi x (4.3, 3.5, 350) Hz.
- Atom number: N = 4.0(3) x 10^6; condensate fraction about 80%.
- Thomas-Fermi radii: (R_x, R_y, R_z) = (155, 190, 1.9) micrometres.
- Chemical potential: mu approximately h x 510 Hz.
- Healing length at peak density: xi approximately 0.6 micrometres.
- Initial vortex number: N_v approximately 26.
- Mean intervortex distance: l_v approximately 34 micrometres.
- Bragg detuning used for the turbulence readout: delta_d/(2 pi) = -1.1 kHz.
- Bragg pulse: 600 microseconds, following 300 microseconds time of flight, with a further 9 ms before imaging.
- Vortex-sign integration half-window: a = 13 micrometres.

The paper describes a strongly oblate, effectively two-dimensional regime. Using its rounded reported inputs gives:
- omega_z/omega_x = 350/4.3 = 81.3953.
- omega_z/omega_y = 350/3.5 = 100.
- omega_z/sqrt(omega_x omega_y) = 90.2194.
- R_z/xi = 1.9/0.6 = 3.1667.

These are arithmetic checks on the published rounded values, not new measurements. The article cites effective 2D behavior for R_z/xi less than or approximately 3. The rounded ratio is near that boundary; exact unrounded inputs and their uncertainties are needed before making a sharper dimensional-regime claim. The paper does not report uncertainties for the trap frequencies, radii, or xi in the values used here, so no propagated uncertainty is claimed.

## 3. What was measured

For the decaying turbulent sample, the article summarizes approximately:
- N_v about 20,
- T/T_c about 0.5,
- C_2 about 0.4,
- dipole-vortex fraction N_d/N_v about 0.45,
- clustered-vortex fraction N_c/N_v about 0.2.

Each plotted point in Figure 5(a-d) is based on 15-20 measurements, with error bars stated to be the standard error of the mean. Figure 5(c) shows the experimental C_2 points and a dashed C_2=0.5 reference. The caption identifies random-configuration simulation points in panels (b) and (d), not panel (c). Thus the main figure does not display a shot-level simulated null envelope for C_2.

The article's Data availability statement says supporting data are available from the corresponding author on reasonable request. No raw image series, per-shot vortex catalog, or covariance table was obtained in this run, and no request was sent.

## 4. Source-defined measurement chain and classification risk

The paper defines the Bragg signal as S_B(x',y') = n_+(x',y') - n_-(x',y'), using the two oppositely scattered atom clouds. Vortex sign is inferred from the sign of the local y'-derivative at the vortex position, with an integral over the interval [-a,a] and a = 13 micrometres.

The authors explicitly report that:
- when vortices are close, the Bragg signal around some vortices can be weak;
- for a small vortex dipole, the surrounding velocity field is nearly cancelled and the Bragg signal can be absent;
- in that case, signs are assigned using the crescent shape of merged density-depleted cores, with the overall configuration also scrutinized.

This is a consequential measurement-model feature. The fallback morphology rule is invoked precisely in the close-pair regime whose prevalence is being measured. It may be valid, but its sign-error rate and dependence on pair geometry must be quantified before treating C_2, dipole fraction, and cluster fraction as independent confirmation. Those three readouts are derived from the same classified vortex catalog and are statistically dependent.

## 5. Calder reanalysis design: conditional, shot-level nulls

The independent sampling unit must be the experimental realization/shot, not an individual vortex or one of the 2 N_v directed nearest-neighbor comparisons. The article's 15-20 measurements per time point must be confirmed as independent preparations, rather than assumed independent from the caption alone.

For every shot, request and preserve:
- shot/realization identifier and hold time;
- vortex positions, signs, N_+, N_-, and N_v;
- sign-assignment method and confidence/ambiguity flag for each vortex;
- condensate-density image and both Bragg-scattered images;
- imaging scale/orientation, Bragg detuning, pulse duration, and time-of-flight metadata;
- trap frequencies, atom number, condensate fraction, radii, chemical potential, temperature/T_c, and the provenance/uncertainty of the healing length;
- the exact code or procedure used for nearest-neighbor and dipole/cluster classification.

Primary null:
1. Hold each shot's measured vortex positions fixed.
2. Preserve that shot's N_+ and N_-.
3. Randomly permute the sign labels over those fixed positions.
4. Recompute C_2, dipole fraction, and cluster fraction jointly for each permutation.
5. Compare the observed joint statistics with the conditional null distribution, retaining shot identity and time-point structure.

This controls for the observed spatial geometry and sign imbalance. It does not pretend that the 2 N_v neighbor relations are independent Bernoulli trials. Uncertainty should be estimated at the realization level, with the independence or repeated-measures structure verified from acquisition metadata.

Classification sensitivity:
- Calibrate the Bragg-derivative sign rule against known-sign isolated vortices and prepared dipoles whose circulation directions are independently known from trajectories.
- Report a high-confidence Bragg-only subset separately from the full catalog.
- Retain ambiguous/fallback morphology assignments as explicit flags.
- Recompute the joint statistics under calibrated sign-error rates and conservative relabeling bounds.
- Do not choose the sign rule after seeing which assignment strengthens pairing.

The published 0.5 reference is a useful balanced-random benchmark, but the reanalysis should condition on each shot's actual N_+ and N_- rather than assume exact balance. No p-value, confidence interval, covariance, or revised C_2 estimate is reported here because the per-shot data are unavailable.

## 6. H(s)H boundary and falsification gate

The measured object is a finite-core vortex in a laboratory 23Na condensate. It is not the SAT Kerr-associated worldtube, not the H(s)H timesheet, and not evidence that the physical vacuum is a BEC.

Nathan's 2026-07-11 raw user messages describe a finite-thickness worldline/worldtube and propose Kelvin vortices stirred in a BEC-like spacetime medium. The 2026-09-06 raw user message keeps the charge, mutual-distortion, Kelvin-vortex, and timesheet-bound-soliton relationship explicitly exploratory. Neither source supplies a normalized worldtube-to-medium coupling or a predicted C_2 distribution.

Therefore this dataset can constrain the ordinary medium-vortex and Bragg-readout subchain. It cannot yet test the H(s)H worldtube-to-medium map.

| Test element | Current status |
|---|---|
| Hypothesis | Finite-core worldtube drives a Kelvin-like responsive-medium vortex |
| Shared parameters | Sodium species/state, trap, density, temperature, core/healing length, Bragg calibration, and any independently fixed coupling parameters |
| Calibration | Known-sign isolated vortices and prepared dipoles; not yet obtained as a shot-level calibration set |
| Holdout | Independent preparation or trap/temperature condition; not present in the retrieved summary |
| Predicted observable | Joint distribution of C_2, dipole fraction, cluster fraction, and their time evolution |
| Standard comparator | The paper's 2D quantum-vortex / Gross-Pitaevskii and finite-temperature dissipative framework |
| Falsification threshold | Not set; requires a frozen H(s)H forward map, raw data, uncertainty model, and pre-registered acceptance region |

The empirical gate is NOT SCOREABLE. No H(s)H physical prediction, fit, or theory validation is claimed.

## 7. Formalization and disposition

The C_2 statistic and conditional sign-permutation procedure expose finite combinatorial structure. A faithful Lean development would need the actual finite shot catalog and an explicit graph/statistic representation. No new data-free Lean theorem was created; the current permission gate remains in force. Any later Lean result would prove only the formalized conditional proposition, not source authenticity, measurement correctness, or physical truth.

No SAT-O or Blockwave equation was changed. No BEDROCK amendment, paper edit, new branch, PR, software dependency, or theory promotion was made.

**Disposition:** isotope correction verified against the primary article; BEC measurement architecture improved; raw data and classification covariance remain missing; H(s)H coupling and prediction remain undefined.
