# Double-pulsar source correction and readout-chain candidate

**Status:** SOURCE CORRECTION / ASSISTANT-RECONSTRUCTION UPDATE / P2 CANDIDATE ONLY / NO THEORY PROMOTION.

This addendum corrects one published input transcription in the existing Double Pulsar leading-order calculations and makes the measurement map explicit enough to audit. It does not alter the original Ravel or Hale artifacts, select the P2 system, or introduce an H(s)H force law.

## 1. Source correction

For PSR J0737-3039A/B, Kramer et al. (2021), *Physical Review X* 11, 041050, Table IV gives

- \(P_b = 0.1022515592973(10)\,\mathrm{d}\)
- \(e_T = 0.087777023(61)\)

The official 2024 *Chinese Physics C* PDF, Table 1, reproduces \(e_T=0.087777023(61)\). One HTML text rendering of that 2024 table displays 0.08777023, apparently dropping a digit. The 2021 primary table and the 2024 PDF agree.

The existing Ravel and Hale Double Pulsar calculations use 0.08777023. Their stored Peters-Mathews factor, \(F=1.05153489304428726256\), reproduces that shortened value. This is therefore not merely a prose typo: the eccentricity error propagated into the derived leading-order outputs.

Source classification:

| Item | Epistemic status |
|---|---|
| \(P_b\), \(e_T\), timing observables and uncertainties | Published timing-fit results |
| Ravel/Hale leading-order outputs | Assistant reconstructions from published central values |
| Values below | Corrected assistant reconstruction |
| H(s)H interbraid response | Not quantitatively specified |
| Independent raw-TOA reanalysis | Not performed |

## 2. Recalculation from the measured system

The corrected leading-order eccentric enhancement is

\[
F(e_T)=
\frac{1+\frac{73}{24}e_T^2+\frac{37}{96}e_T^4}
{(1-e_T^2)^{7/2}}.
\]

The leading quadrupole control is

\[
\dot P_b^{\rm quad}
=
-\frac{192\pi}{5}
\left(\frac{2\pi T_\odot}{P_b}\right)^{5/3}
\frac{m_A m_B}{(m_A+m_B)^{1/3}}F(e_T),
\qquad
T_\odot=\frac{GM_\odot}{c^3}.
\]

Inputs and conventions:

- \(P_b=0.1022515592973\,\mathrm{d}\), from the 2021 timing fit.
- \(e_T=0.087777023\), from the primary Table IV value.
- \(m_A=1.338185\,M_\odot\), \(m_B=1.248868\,M_\odot\), the published central masses used by the existing reconstruction. These masses are GR-conditioned and correlated. They are not independent H(s)H measurements.
- \(GM_\odot=1.3271244\times10^{20}\,\mathrm{m^3\,s^{-2}}\), IAU 2015 nominal solar mass parameter.
- \(G=6.67430\times10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}\), CODATA 2022; \(c=299792458\,\mathrm{m\,s^{-1}}\), exact.
- 80-decimal-place arithmetic was used. \(e_T\) is used as the eccentricity input to a leading-order Peters-Mathews control. This is not the full relativistic timing model.

| Derived quantity | Earlier value using shortened \(e_T\) | Corrected value |
|---|---:|---:|
| \(F(e_T)\) | 1.0515348930442873 | 1.0515430499184060 |
| \(\dot P_b^{\rm quad}\) (s/s) | \(-1.2478006991261660\times10^{-12}\) | \(-1.2478103784561581\times10^{-12}\) |
| \(p_a=|\dot P_b|/(3\pi)\) | \(1.3239576617\times10^{-13}\) | \(1.3239679318\times10^{-13}\) |
| \(\dot a\) (mm/day) | -7.14977248 | -7.14982794 |
| \(\dot e\) (s\(^{-1}\)) | \(-1.2726010452\times10^{-17}\) | \(-1.2727039644\times10^{-17}\) |
| \(J\) (kg m\(^2\)/s) | \(7.0285633314\times10^{44}\) | \(7.0285591081\times10^{44}\) |
| \(\dot J\) (N m) | \(-3.2299607645\times10^{28}\) | \(-3.2299718754\times10^{28}\) |
| \(\dot E\) (W) | \(-2.3625571979\times10^{25}\) | \(-2.3625755245\times10^{25}\) |
| \(\dot E/(\dot J\,n)\) | 1.02846353607 | 1.02846797610 |
| Periastron shrink (mm/day) | -5.55593033 | -5.55585421 |
| Apastron shrink (mm/day) | -8.74361462 | -8.74380167 |

The semi-major axis and \(\beta\) are unchanged because the eccentricity does not enter those central-value expressions.

The correction changes the leading-order \(\dot P_b\) magnitude by \(7.757\times10^{-6}\) fractionally, or \(9.6793\times10^{-18}\,\mathrm{s\,s^{-1}}\). That is about \(0.123\) of the published \(1\sigma\) uncertainty \(7.9\times10^{-17}\,\mathrm{s\,s^{-1}}\) on the intrinsic orbital-period derivative. The eccentricity uncertainty alone contributes about \(8.69\times10^{-20}\,\mathrm{s\,s^{-1}}\) to this leading-order estimate. The mass covariance dominates; it is not valid to propagate the two GR-conditioned mass uncertainties as independent.

The correction is numerically small relative to the observational uncertainty, but the source transcription must still be corrected. It does not change the qualitative conclusion.

## 3. Do not conflate the leading-order reconstruction with the published full-GR test

The timing paper reports

- observed intrinsic \(\dot P_b^{\rm int}=-1.247752(79)\times10^{-12}\,\mathrm{s\,s^{-1}}\);
- full-GR gravitational-wave-emission ratio \(R_{\rm GW}=0.999963(63)\);
- a \(95\%\)-confidence precision of approximately \(1.3\times10^{-4}\).

The corrected leading-order reconstruction gives an observed-to-leading-quadrupole central ratio of approximately \(0.9999532153\). The earlier shortened-eccentricity calculation gave approximately \(0.9999609720\). Neither number replaces the published full-GR Table V ratio. The latter includes the paper's relativistic timing treatment and its parameter-inference procedure.

A conditional bound can be extracted only for a narrowly defined model: if an H(s)H contribution is a strictly additive positive orbital-energy-loss term on top of the full-GR prediction, while all other fitted terms remain fixed, the Gaussian \(95\%\) upper endpoint implied by \(0.999963\pm0.000063\) is approximately

\[
\delta_{\rm extra}<8.65\times10^{-5}
\]

of the GR-predicted decay. This is a conditional empirical bound, not an H(s)H prediction. A replacement or underlying-geometry interpretation must reproduce the total observed timing behavior rather than add a second decay term.

## 4. Concrete source-to-observable map

The Double Pulsar is a measured compact-object binary, not a fluid-vortex experiment. Its observation chain is asymmetric:

1. **Physical system:** two neutron stars in an eccentric relativistic orbit.
2. **Projection and propagation:** line-of-sight pulse arrival times, barycentric conversion, and Rømer, Einstein, Shapiro, aberration and Doppler delays.
3. **Instrument/readout:** pulse-profile integrations, template matching and TOA estimates with uncertainties. The paper describes six observatories over 16.2 years, with 916,648 30-second TOAs for relativistic parameters and 199,913 four-minute TOAs for astrometry/dispersion-measure work.
4. **Timing inference:** modified Tempo/Tempo2 fits, residuals, dispersion-measure variations, instrumental jumps and nuisance calibration.
5. **Reported outputs:** Keplerian and post-Keplerian timing parameters, followed by theory-conditioned comparisons.

Pulsar B's radio signal disappeared from view in March 2008. The long timing record is therefore not two equally sampled direct tracks of both bodies. The orbital geometry is inferred principally through pulsar A's TOAs and the timing model, with other constraints entering separately. The measurement pipeline must not be drawn as a direct, symmetric readout of both worldtube histories.

For this system, the generic \(R=C\circ O\) architecture can be instantiated as:

- \(O_{\rm DP}\): line-of-sight projection plus propagation and barycentric timing transformations;
- \(C_{\rm DP}\): profile integration/template matching, TOA uncertainty calibration, timing fit and post-Keplerian parameter extraction.

The output is a compressed timing-parameter vector, not a direct image of the four-dimensional history. A proposed H(s)H geometric label is identifiable only if it is constant on the fibers of this actual readout map, or if an additional measurement breaks the degeneracy. The generic fiber-factorization theorem is already represented in the existing Kestrel PR #873; the physical Double Pulsar map itself has not been formalized or validated.

## 5. H5 test matrix refinement

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Failure or bound |
|---|---|---|---|---|---|
| Full-GR baseline | Theory-independent mass ratio, timing parameters, distance/proper motion, Galactic correction, spin-down mass loss, DM, telescope offsets and profile evolution | Published 2003-2019 fit is the baseline, not an untouched holdout | Joint post-Keplerian vector, including \(\dot P_b\), periastron advance, time dilation and Shapiro parameters | Full relativistic timing model | Use the published Table V values and uncertainties |
| BR-006 interbraid/back-tug as an additive channel | Same parameters; no independently adjustable per-observable coefficients | Early epoch calibration, later epoch holdout only after raw TOAs and full covariance are obtained | A source-derived extra decay plus any required correlated timing shifts | Full GR baseline | Conditional positive additive-loss bound above; a larger effect is inconsistent with the published ratio |
| BR-006 as a replacement or underlying geometry | Same parameters, with a source-derived map from interbraid history to the timing observables | Independent epoch or second-system holdout | One shared parameter set must predict the full timing vector | Full GR baseline | Fails if the held-out joint vector falls outside the preregistered joint predictive region |
| Geometry-only equivalence under the readout | Same observable map | No separate calibration can distinguish identical readouts | Same timing vector as GR | Full GR baseline | Not empirically distinguishable in this data set without a new observable |

The published fit spans the entire 16.2-year interval, so it cannot be relabeled as an untouched holdout. A real holdout requires the raw TOAs, telescope/epoch identifiers, the full timing covariance or posterior, and a preregistered block split. Randomly splitting TOAs would leak shared profile, instrument and timing-noise structure. The paper's observatory-exclusion robustness checks are useful controls, but they are not an independent holdout.

A single \(\dot P_b\) value is insufficient to identify a separate history-dependent mechanism if its only effect is approximately secular and can be absorbed into existing timing parameters. The H(s)H model must supply a non-degenerate cross-channel fingerprint and use the same parameters across conservative-orbit, dissipative-orbit and propagation observables. No such response law is presently recovered from BR-006.

## 6. Source genealogy and non-conflation

- **BR-006 interbraid/back-tug:** Nathan Direct, qualitative. It supplies a physical interbraid premise, not a quantitative force or orbital-decay law.
- **Nautilus Draft/PhaseNext2.txt:** a separate assistant-written, Nathan-authorized orbital-decay test plan involving \(\theta_4\) tension and \(\nabla\cdot u^\mu\). It has no recovered coefficient and is not the BR-006 interbraid law.
- **Ravel and Hale Double Pulsar outputs:** assistant reconstructions from published timing inputs. This addendum corrects the eccentricity transcription without overwriting their original files.
- **Kramer et al. (2021) and Wu & Tang (2024):** standard published timing references. Their official PDF tables agree on \(e_T=0.087777023(61)\).
- **Independent measurement:** none performed here. No raw TOA re-fit is claimed.

## 7. Formalization and tooling status

No new Lean theorem was introduced. The existing generic factorization result on PR #873 is open/draft/unmerged; its merge-ref CI succeeded, but exact-head-only compilation remains unverified. The concrete \(O_{\rm DP}\) and \(C_{\rm DP}\) measurement operators have not been formalized. No physical premise or empirical conclusion is established by the generic theorem.

Existing HsH/SAT archive resources, the current Lean PRs, Math Hopper/Whirligig references and the available SciSpace connector were checked before considering new tooling. No new tool, dependency, fork, paid service or branch was created. Fork enumeration was not exposed by the available GitHub connector, so no exhaustive fork claim is made.

## 8. P2 disposition and next verification

**P2 remains HOLD.** PSR J0737-3039A/B is a data-backed candidate for H5 readout work, not a selected P2 system. The accessible published tables support a screening calculation and a conditional bound. They do not provide the raw TOA package and full joint covariance required for an independent blocked holdout, and BR-006 still lacks a quantitative response law and a source-defined worldtube-to-timing map.

Next steps:

1. Hale independently checks the Table IV eccentricity and the corrected outputs.
2. Ravel is notified that the original leading-order calculation used a shortened eccentricity and should be revised by its owner.
3. Obtain or locate the raw 30-second TOAs, telescope/epoch metadata and full timing covariance before any new fit.
4. Derive a BR-006 response law from the original source before fitting any H(s)H-specific parameter.
5. Keep the \(\theta_4\) test plan separate from BR-006 unless a source-backed composition map is supplied.

No BEDROCK promotion, P2 selection, paper-gate advancement, new Lean claim, or theory equivalence is asserted.
