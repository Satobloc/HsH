# GW250114 Direct-Wave Horizon Comparator
**Date:** 2026-10-31  
**Status:** EMPIRICAL COMPARATOR CANDIDATE / NOT SELECTED FOR P2 / NO H(s)H VALIDATION

## Executive finding

GW250114 is a useful high-SNR observational comparator for near-horizon Kerr dynamics, but the 2026 “direct-wave” result is not a settled, model-independent measurement of a stationary horizon oscillator. The direct-wave component is extracted through a rational QNM filter; a separate 2026 analysis shows that the filter is all-pass on the real-frequency axis, preserving spectral magnitude while changing phase and time-domain representation. Other 2026 studies find substantial finite-window frequency drift and model dependence.

The useful H(s)H question is whether a source-defined worldtube model predicts the *unfiltered detector strain* and its time-dependent readout, including the same filtering and estimator, without per-window tuning.

This is a candidate evidence note, not a paper-gate result, not a theory promotion, and not an independent reanalysis of the raw strain.

## 1. Measured system and data lineage

**Event:** GW250114, a binary black-hole merger observed in the LIGO Hanford (H1) and Livingston (L1) detectors.

**Primary observational paper:** Lu et al., “GW250114 reveals signatures of post-merger black-hole horizon,” Nature (published 2026-06-24); arXiv:2510.01001. The analysis reports direct-wave matched-filter SNRs of 15.8 in H1 and 17.1 in L1. These are detector-specific SNRs for the same event, not two independent astrophysical detections and not the event’s network SNR.

**Data products:**
- GWOSC O4 Discovery Papers v1 event release: DOI 10.7935/1g4j-2028.
- GWOSC GWTC-5.0 v2 event release: DOI 10.7935/bk00-6a89; updated 2026-05-22 and containing multiple waveform-family parameter-estimation products.
- Direct-wave analysis release: Zenodo DOI 10.5281/zenodo.20017347; approximately 53 MB.

The direct-wave archive lists posterior and analysis products including samples.npy, sample_SNRs.npy, samples_log_prob.npy, omegaG.mat, phase.mat, time.dat, omegaH_range.txt, the GW250114 and NRSur7dq4 90% contour files, and late_times/DW_ftau_-7.0M.h5.

**Access limitation:** the archive index and file list were inspected, but the 53 MB archive and raw calibrated H1/L1 strain were not downloaded in this runtime. No raw posterior sample, contour coordinate, detector calibration file, or time-series checksum was independently verified. The calculation below uses published parameter summaries; it is not a raw-data reanalysis.

## 2. How the reported direct-wave result is obtained

The Nature analysis:
- Uses 8192 Hz strain data and 0.2 s analysis windows.
- Uses 64 s noise segments and 300 off-source noise realizations sampled around the event.
- Reports a hybrid statistic D = 118.1 against a 1% false-alarm threshold of 1.98.
- Uses a model-agnostic damped-sinusoid search with frequency prior 160–240 Hz and inverse-damping prior 0.05–0.9 ms⁻¹.
- Uses a template-based direct-wave model and tests remnant-parameter robustness with 200 posterior samples, described as qualitative rather than a complete quantitative marginalization.

**Statistical calibration limits:**
1. The paper explicitly distinguishes D from a formal Bayes factor. Do not relabel it as a Bayes factor.
2. Three hundred null realizations give a coarse empirical tail calibration. The paper reports the 1% threshold, not an exact tail count for D = 118.1; no more precise empirical p-value is asserted here.
3. H1 and L1 are two detector readouts of one event.
4. The 200-sample remnant-parameter robustness check is qualitative. A full joint posterior propagation, including mass-spin covariance and detector calibration uncertainty, remains outstanding.
5. GWTC-5.0 v2 is a later parameter-estimation version with multiple waveform families. The Nature analysis used its earlier v1/NRSur7dq4 parameter set. Those versions must not be silently mixed.

## 3. 2024 baseline versus 2026 developments

| 2024 baseline | 2026 development | Why it matters |
|---|---|---|
| Cheung et al., “Inspiral-inherited ringdown tails,” Phys. Rev. D 110, 104005 (2024). | Lu et al. report a direct-wave signature in GW250114. | Late-time residuals can retain inspiral-history dependence; a QNM-subtracted residual is not automatically a unique new component. |
| Mitman et al., “Spin dependence of black-hole ringdown nonlinearities,” Phys. Rev. D 109, L101503 (2024). | Dyer, Chung & Moore, arXiv:2606.25021, analyze 13 CCE numerical-relativity simulations. | Nonlinear and subdominant mode content is a real alternative explanation for residual structure. Dyer et al. report robust direct-wave recovery in many simulations, but free-frequency fits drift by roughly 10–20% with start time and included mode content. |
| Cheung et al., “Excitation of quadratic quasinormal modes for Kerr black holes,” Phys. Rev. D 109, 104070 (2024). | Sun et al., arXiv:2608.23209v2, compare SXS/CCE waveforms and develop a spin-dependent finite-time evolution model. | The direct-wave complex frequency evolves; it is not generally a stationary horizon-mode frequency over the observed window. |
| Standard QNM and tail decompositions. | Ma & Wang, arXiv:2607.06677, derive the filtered response using a causal Green-function treatment. | The rational filter is all-pass on real frequency: it preserves spectral magnitude and changes phase/time-domain representation. The “direct wave” should not be treated as an independently added energy channel merely because it appears after filtering. |

These are not all independent observational replications. The Nature and 2025 area-law analyses use GW250114; the Dyer and Sun studies use numerical-relativity waveforms, not independent detector events. The 2026 literature is actively debating the physical interpretation and finite-time behavior of the filtered component.

## 4. Published-parameter Kerr calculation

The Nature analysis uses a detector-frame remnant mass approximately
\[
M_f^{\rm det}=68.1^{+0.8}_{-0.9}\,M_\odot
\]
and dimensionless spin
\[
\chi_f=0.68\pm0.01,
\]
with the quoted intervals treated here as marginal 90% credible ranges. These are waveform-model inferences from detector strain, not direct measurements of horizon geometry.

For frequency conversion I use the IAU 2015 nominal solar mass parameter
\[
GM_\odot=1.3271244\times10^{20}\;\mathrm{m^3\,s^{-2}}
\]
and the exact SI speed of light
\[
c=299792458\;\mathrm{m\,s^{-1}}.
\]
Thus
\[
t_\odot=GM_\odot/c^3=4.925490947\times10^{-6}\;\mathrm{s}.
\]
No CODATA adjustment was used. This avoids separately combining G and M_sun; the uncertainty here is dominated by the event’s waveform-inferred mass and spin posterior.

For Kerr,
\[
q=\sqrt{1-\chi_f^2},\qquad t_M=t_\odot M_f^{\rm det},
\]
\[
\Omega_H=\frac{\chi_f}{2(1+q)t_M},\qquad
\kappa_H=\frac{q}{2(1+q)t_M}.
\]
The m=2 horizon angular-frequency scale is f_{m=2} = Ω_H/π.

Using the published medians:
- t_M = 0.335 ms (rounded).
- Ω_H = 584.83 rad s⁻¹.
- f_{m=2} = 186.16 Hz.
- κ_H = 0.63060 ms⁻¹.
- 1/κ_H = 1.586 ms.

The Kerr r_+ coordinate scale is approximately 174 km in detector-frame units, but it is a Boyer–Lindquist coordinate radius, not an invariant proper radius; it is not used as a measured length.

### Uncertainty handling

One-at-a-time endpoint sensitivity, holding the other parameter at its median:
- Mass interval only: f_{m=2} = 184.00–188.65 Hz; κ_H = 0.6233–0.6390 ms⁻¹.
- Spin interval only: f_{m=2} = 182.46–189.93 Hz; κ_H = 0.6259–0.6351 ms⁻¹.

The rectangular envelope formed from the marginal endpoints is:
- f_{m=2} = 180.34–192.47 Hz.
- κ_H = 0.6186–0.6436 ms⁻¹.

This rectangular envelope is **not** a joint 90% credible region. The mass-spin posterior covariance was not retrieved, so no joint interval is claimed.

## 5. A useful model/prior consistency check

The Nature supplement’s simple near-horizon source model writes
\[
\omega_G(t)=2\widehat\Omega(t)-i\widehat\kappa(t),
\]
\[
\widehat\Omega=\frac{\beta\Omega_H+\dot\phi}{1+\beta},\qquad
\widehat\kappa=\frac{2\beta}{1+\beta}\kappa_H,
\]
with β = -dr*/dt in the chosen Kerr tortoise-coordinate description.

For the timelike plunge condition 0 ≤ β < 1, this formula implies
\[
0\le\widehat\kappa<\kappa_H.
\]

At the published median, κ_H = 0.6306 ms⁻¹. The model-agnostic fit prior extends to 0.9 ms⁻¹, so part of that broad prior lies outside the simple source-model range. This is not a posterior contradiction; the actual contour coordinates have not been extracted.

The later Sun et al. analysis discusses distinct effective-source and filtered-direct-wave decay rates, with asymptotic factors of 2κ_H or 3κ_H under different approximations. At the GW250114 median these are approximately 1.261 and 1.892 ms⁻¹, both above the Nature free-fit prior ceiling. These are not the same symbol or estimator as the Nature supplement’s κ̂(t), and they must not be substituted without a definition-level reconciliation.

The reported spin interval 0.67–0.69 lies below the Sun et al. approximate spin threshold 0.7; their model therefore predicts approach of the real direct-wave frequency toward 2Ω_H from above in this regime. The raw contour data are required to test that prediction quantitatively.

## 6. Filter representation versus physical source

The rational filter has conjugate-paired factors of the form
\[
F_z(\omega)=
\frac{\omega-z}{\omega-\bar z}
\frac{\omega+\bar z}{\omega+z},
\qquad \omega\in\mathbb R.
\]
Each factor has unit modulus when its denominators are nonzero; so does any finite product. The filter preserves Fourier-domain magnitude while changing phase and time-domain structure.

Consequences:
- A filtered direct-wave residual is not automatically an independent radiation channel.
- A physical source interpretation must be tested through a forward model of the unfiltered strain, with the filter and estimator reproduced as observation operators.
- The direct-wave decomposition may still be source-sensitive and informative; the point is that the filter alone does not add spectral power.

## 7. H(s)H source boundary

This report does **not** identify the SAT/H(s)H 4D worldtube with the full 4D Kerr spacetime. A source-audited project statement specifies choosing a spatial Kerr section and extending it along the filament; the full Kerr spacetime is not to be used as the cross-section of a second 4D object. The corresponding raw project exports are dated 2026-07-11 to 2026-07-17 (Git blob b7868607d89f66bbc0e638398182fb2d6b2da2ce) and 2026-09-06 to 2026-09-10 (Git blob c49367b0faa424491e7b3520a034b9e44fe6897f).

The missing composition is explicit:
\[
\text{spatial Kerr section}
\longrightarrow \text{SAT filament/worldtube}
\longrightarrow \text{effective Lorentzian exterior/horizon}
\longrightarrow (\Omega_H,\kappa_H,\beta,\dot\phi)
\longrightarrow \text{source strain}
\longrightarrow \text{detector strain}.
\]
No projection or composition maps with conditions have been established. The external Kerr quantities remain standard-reference quantities, not derived SAT quantities.

### SAT-O / Blockwave provenance boundary

No SAT-O or Blockwave equation is used in the numerical calculation above.

For source hygiene:
- SAT-O mass O9 file: m² = k(N + βQ² − a); Git blob 676ce08c09226e4bde5a4d8efa3d7f4da228a1d8; the archive file index records a last-write timestamp of 2025-06-18 09:58:04. Its companion example calibrates k and β from selected ground-state masses, so it is a fit unless independent holdout predictions are supplied.
- SAT-O optical O9 audit package: Δn(x) = η sin² θ₄(x); Git blob 7d43c1029fe588b9056a0f864ecfb5e72ca06313; the document labels the module draft June 23, 2025 and explicitly omits the full module content.
- SAT-O graviton O9 collaboration proposal: g̃^{μν} = ⟨v^μ v^ν⟩, g_{μν} = (g̃^{μν})⁻¹, the printed strain tensor, and g = η + h; Git blob c7095697a70f39b3bd05af414e1124ae45a17926. The strain-to-metric map and massless degrees of freedom are not derived in that document.
- User-supplied Blockwave attachment: Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, SHA-256 3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664; uploaded 2025-09-16. The upload establishes user supply, not embedded content authorship.
- The compact-phase/action equations previously circulated under Blockwave were synthesized in an assistant-role message dated 2025-10-19T12:29:46.538Z (raw-export blob 1f074cc67057ae9df1e92bab45e8ba34c96b0d77). The source equations were:
  θ ~ θ + 2π;
  A_μ(θ) = α_* ∇_μ θ;
  F_{μν}(θ) = ∇_[μ A_{ν]};
  ∮_γ A·dℓ ∈ 2πℤ;
  J^{μν} = 1/2 ε^{μνρσ} ∇_ρ B_σ;
  S_int ⊃ (g_h/2) F_{μν} J^{μν}.
  They are not authenticated Nathan Direct equations. The attachment itself has transcription defects. No corrected full action is established; any future correction must be a separate, versioned equation record.

The SAT-O O9 mass, optical, graviton, and Blockwave objects are distinct source objects. The shared O9 label is not a derivation map.

## 8. Existing tools and realistic reproduction cost

No new scanner or analysis tool was built.
- Existing HSH_RESOURCES arXiv scanner v0.4 is standard-library-only and can be reused; its later v0.7 conversation artifact was not recovered.
- SciSpace was used for a bounded cross-index literature search.
- Existing Sizheng-Ma/qnm_filter implements the rational QNM filter.
- Existing Richardvnd/direct_waves contains the CCE numerical-relativity analysis code.
- Existing BGP-QNM-FITS/bgp_qnm_fits supplies Bayesian ringdown fitting infrastructure.
- The 53 MB Zenodo archive is free to retrieve. The Dyer et al. repository reports roughly 40 minutes for a 10,000-step MCMC run per simulation; reproducing all 13 simulations serially is several hours of compute, not a new-tooling requirement.
- Math Hopper and Whirligig were checked; neither supplies the missing physical projection or raw GW250114 posterior arrays.

## 9. Falsifiable next steps

1. Retrieve and checksum the Zenodo analysis archive and GWOSC calibrated H1/L1 strain; record calibration files and data-quality segments.
2. Extract the actual contour and posterior arrays; reproduce the published 90% regions and time-dependent frequency/damping estimates.
3. Propagate the joint mass-spin posterior and calibration uncertainty; compare the original v1/NRSur7dq4 result with GWTC-5.0 v2 waveform-family products without mixing versions.
4. Reproduce the direct-wave analysis with the existing QNM filter and compare filtered and unfiltered strain likelihoods.
5. Include nonlinear QNMs and inspiral-inherited tails as explicit alternatives; use at least one independent event as a held-out test.
6. Reconcile κ_H, κ̂(t), effective-source decay, finite-window envelope decay, and filter-pole decay before any numerical comparison.
7. Only after retrieving the relevant Nathan Direct source equations, derive the spatial-Kerr-section/worldtube projection and its composition with the external Kerr horizon and detector readout.

**P2 disposition:** GW250114 direct-wave analysis is an additional candidate, not the selected P2 system. Raw data, joint covariance, calibration propagation, independent event holdout, and the H(s)H forward map remain outstanding.

**Epistemic status:** published observation and published posterior summaries / standard Kerr calculation from those summaries / numerical-relativity model comparisons / assistant synthesis / conditional Lean formalization. No independent raw-data measurement, no H(s)H prediction, and no theory promotion.
