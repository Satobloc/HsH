# Toward a Survey-Agnostic Census of Temporary Stellar Non-Detection
## A rate-statistics and multi-purpose diagnostic framework for time-domain astronomy

**Research proposal · Working draft R0 · 21 October 2026**  
**Status:** Proposed methods, not observed event counts or completed data analysis.  
**Scope:** Standard astrophysics and survey methodology. Alternative propagation hypotheses are included as testable candidates, not as the paper's motivation or favored interpretation.  
**Attribution:** Draft prepared for Nathan McKnight; coauthors and affiliations to be determined.

### Abstract

A star may be recorded as absent for reasons ranging from detector or catalog failure to intrinsic fading, intervening extinction, occultation, refraction, or gravitational changes in the ray mapping. The central observational object should therefore be neither an isolated catalog mismatch nor a presumed new physical phenomenon, but a rigorously defined *temporary non-detection event* with measured exposure, selection function, uncertainty and recovery probability. We propose a survey-agnostic stellar-wink census that estimates event rates, durations, depth distributions, wavelength dependence, sky correlations, astrometric changes, and associations with foreground structure, while explicitly modeling false positives and interval censoring. The program joins source-position forced photometry, image-level injection/recovery, cadence-aware hierarchical rate estimation, multiband and astrometric diagnostics, and replication across independent instruments. It produces several immediate scientific returns: quantitative validation of survey pipelines; constraints on obscuring populations and Galactic structure; improved classification of variable and lensed objects; and calibrated limits on rare or presently speculative propagation models. An accompanying hypothesis-evidence datasheet prespecifies what would support, weaken or fail to distinguish each mechanism. The proposed output is a public, machine-readable catalog of event posteriors and a reproducible rate likelihood, not a catalog of asserted stellar disappearances.

**Keywords:** time-domain astronomy; stellar variability; gravitational lensing; extinction; occultation; survey selection; nondetections; transient statistics; forced photometry.

## 1. Motivation and scope

In a realistic, inhomogeneous universe, individual lines of sight do not share identical optical transfer functions. Gravitational curvature, foreground material, plasma, intervening bodies, source variability and the measurement apparatus can all affect apparent flux. Homogeneity or isotropy of a theoretical reference model does not require uniformity of the optical conditions experienced by every photon bundle. However, *possibility* is not an event-rate estimate. This study asks a measurement-first question: **At a specified baseline brightness, sensitivity, cadence and sky environment, how often does a previously observed source fall below recoverable detectability, for how long, and with what joint photometric, astrometric and environmental signatures?**

This is not a search designed to validate any one cosmological hypothesis. The established lensing and extinction channels, rare transient astrophysics, and observational false positives each define independent scientific deliverables. The VASCO survey's 5,399 remaining unidentified POSS-I sources, after many cross-matching and artifact checks, are *unclassified catalog candidates*, not 5,399 verified stars that winked out. Its example motivates precisely the source-level controls here [R1]. Microlensing programs already provide a mature template for efficiency-corrected event-rate work: OGLE-IV analyzed ~8,000 bulge microlensing events, with source population accounting changing inferred rates materially [R2]. MOA-II's 2025 bulge event-rate estimates provide another external control, but its *brightening microlensing event rate must not be equated with a stellar-wink rate* [R3].

## 2. Definitions and estimands

**Source universe.** Select an externally verifiable baseline stellar sample, with quality-controlled source identity, position and proper-motion propagation, non-saturated and sufficiently high-S/N reference flux, photometric stability characterization, contaminant flags and crowding information. Stratify source type, distance estimates, variability classification and sky environment. Do not discard known variables; place them in explicitly modeled strata.

**Wink event.** A time interval during which the *direct, calibrated source-position flux* falls below a declared, epoch- and band-specific detectability criterion, relative to a previously demonstrated source baseline. A single absent catalog row or absent difference-image alert does not qualify. The event record must include actual forced-flux likelihoods (including negative measurements), uncertainties, mask fractions, cross-match alternatives, image evidence and observation dates. Define separate categories of **closed events** (recovered above threshold), **right-censored disappearances** (not yet recovered), **left-censored events** (already hidden at monitoring start) and **identity-unresolved candidates**.

Detection is statistical rather than a universal fixed-flux property. Store the survey-local threshold \(F_{{\rm lim},i,k}\), calibrated flux \(f_{i,k}\), uncertainty \(\sigma_{i,k}\), PSF model, background and quality flags. Thresholds and confidence levels must be set *before* estimating rates. Define at least two severity categories: threshold crossing and a deeper, sustained flux attenuation relative to baseline; sweep thresholds as a sensitivity analysis rather than retrospectively selecting the most impressive cut.

**Primary estimand.** \(R_{\rm wink}(b,\delta,T)\), the true event incidence per monitored source per unit time in a prespecified bin \(b\) (survey footprint, band, magnitude, crowding, Galactic latitude and source population), exceeding a specified attenuation severity \(\delta\) and subject to event duration range \(T\). State source-year denominators and confidence intervals. Secondary estimands: per-source duty cycle \(f_{\rm hidden}\), event depth/duration distributions, intrinsic recurrence, sky/time covariance, companion astrometric shifts, and associations with foreground tracer maps.

Do not infer an individual source's physical cessation of emission from an observational absence. Record raw time-domain *evidence*, not an ontology.

## 3. Measurement and physical modeling

### 3.1 Observable flux across mechanisms

For a compact unresolved source and a simple propagation model,

\[
F_{\rm pred}(\lambda,t)=\sum_j |\mu_j(\lambda,t)|\, F_{\star}(\lambda,t-\Delta t_j)\,T_j(\lambda,t)+F_{\rm blend}(\lambda,t)
\]

where \(j\) indexes *accessible* images/paths, \(|\mu_j|\) are absolute magnifications (parity does not imply negative photon flux), \(\Delta t_j\) are relative delays, and \(T_j\) includes transmission or attenuation along each path. This is a model factorization, not a universally separable radiative-transfer theorem; scattering into an aperture, coherent interference, and extended-source treatment may require a full transfer or wave-optics calculation. In physical modeling use consistent natural/Planck units; report observer times, passbands and fluxes in calibrated survey units for analysis and legibility.

**GR optics.** Fit complete, finite-source lens models and sum *all detectable images*. A fold caustic can create/annihilate a *pair* of images without total-source disappearance. Standard positive point-mass lenses normally magnify unresolved total flux; cosmic underdensities can demagnify relative to a smooth reference, typically weakly [R4]. Distinguish time-variable source flux from a static cosmological magnification field.

**Absorption and occultation.** For a simple extinguishing foreground screen, \(F_{\rm obs}=F_0 e^{-\tau_\lambda(t)}\). Under a fixed flux limit, a source crosses threshold if \(\tau_\lambda>\ln(F_0/F_{\rm lim})\). Partial covering, scattering and mixed dust grain distributions need their own models; neither \(\tau\propto\lambda^{-1}\) nor universal reddening is presumed. Occultations by opaque material can appear grey over limited bands. ASASSN-24fw provides an empirical severe and long-duration fading case interpreted using circumsecondary rings [R5].

**Plasma refraction.** Strong wavelength-dependent refraction is demonstrably important at radio frequencies, including extreme scattering events [R6]. Its optical-band efficacy must be established from electron columns and frequency scaling before using it as an optical-wink explanation.

**Intrinsic sources.** Stellar pulsation, eclipses, rotational modulation, accretion, eruptions and catastrophic evolutionary events need source-population and timescale priors. A terminal event is not a *recurrent wink*, but can enter one-way disappearance catalogs.

**Systematics.** Forced-flux confidence is conditioned on seeing, clouds, sky background, scattered light, detector saturation/bloom, cosmic rays, image subtraction, deblending, host light, crowded fields, pointing, camera geometry, nearby movers, cross-match radius and template contamination.

### 3.2 Timescale and geometric control

For a convex effective obscuring region with area \(A\), perimeter \(P\), perpendicular relative speed \(v_\perp\), and isotropically distributed crossing-line orientations, mean event length conditional on an encounter is \(\langle T\rangle=\pi A/(P v_\perp)\). For uniform circular obscurers of effective radius \(R_{\rm eff}\), \(T_{\max}=2R_{\rm eff}/v_\perp\) and conditional duration CDF is

\[
{\Pr}(T'\le T)=1-\sqrt{1-(T/T_{\max})^2},
\quad 0<T<T_{\max}.
\]

These are *announced geometric controls*, not global distributions for arbitrary astrophysical occultations. Real populations integrate over cloud morphologies, sizes, speeds, impact parameters, partial transparency, source angular size and detection efficiencies. Their timescale distributions should be calculated forward, not asserted by analogy.

## 4. Core observational experiment

1. **Sample and baseline freeze.** Define target source populations using cross-survey astrometric identity, photometric stability summaries, historical detections and robust proper-motion propagation. Select pre-registered sky strata, bands, brightness bins and fixed depth criteria.
2. **Forced-flux reconstruction.** Extract source-position fluxes and uncertainties for *every usable visit*, including non-alert visits and negative difference-image fluxes, and preserve direct-image vs difference-image provenance. Inspect raw/calibrated cutouts for leading candidates.
3. **Image-level injection/recovery.** Inject realistic dimmings, occultations, caustic-like changes, calibration anomalies and simulated movers into original pixel data or a validated image simulation, then rerun the same photometric detection and event classifier. Recover \(\epsilon(\theta,i,t)\), including false-event rates and confusion between mechanism classes.
4. **Event detection and association.** Infer event start/end posteriors and peak attenuation from irregular samples; store censoring/interval bounds. Reject/flag catalog misidentification with position propagation, shape, PSF and independent image review.
5. **Independent replication.** Require matched observations from other instruments when available, with transparently handled differences in aperture, passband, reference flux and sensitivity. An absent second-survey counterpart is only informative if a recovery test shows it should have been detected.
6. **Physical diagnostics.** Compare event shapes, chromaticity, polarization where available, astrometric motion, neighboring-source correlations, dust/H I/CO foreground tracers, compact-object density, large-scale-structure shear and observing-systematics maps.
7. **Hold-out tests.** Freeze event definitions, model families and angular templates before independent seasons, fields, or instruments. Publish all tested families and trials rather than only a best-fitting map.

Rubin LSST began in late June 2026, and its baseline wide survey plans approximately one exposure every three days *in any filter*, with much higher-cadence Deep Drilling programs [R7]. Its calibrated visit images, difference images, forced-source and DIA products support this design, subject to data release/data rights and each product's availability [R8]. Do not presume simultaneous multi-band observations or that an alert absence is source absence. Rubin DP2 early datasets can be used to validate software and data-access mechanics before sufficient multi-year incidence exposure accrues [R9].

## 5. Rate likelihood, efficiency, and uncertainty

Partition true wink events by physical/severity/duration parameter vector \(\vartheta\), sky/source stratum \(b\) and time. Let \(r_b(\vartheta,t)\) be the true rate in events per source per unit time per parameter volume, and \(\epsilon_i(\vartheta,t)\in[0,1]\) the *joint* probability that source \(i\)'s event is measurable and accepted by this pipeline, conditional on its actual survey history. A Poisson-process control gives

\[
\Lambda_b=\sum_{i\in b}\int_{\mathcal T_i}dt\int d\vartheta\ 
r_b(\vartheta,t)\,\epsilon_i(\vartheta,t).
\]

For detected, classified events with measured data \(d_j\), one may use a marked-process likelihood with selection, event measurement likelihoods and a separate model of false positives:

\[
\mathcal L \propto e^{-(\Lambda_{\rm real}+\Lambda_{\rm false})}
\prod_{j=1}^{N_{\rm cand}}
\left[\lambda_{\rm real}(d_j)+\lambda_{\rm false}(d_j)\right].
\]

The intensities \(\lambda(d)\) are formed by marginalizing over latent true event properties and measurement uncertainties. A basic corrected count \(N/(\epsilon E)\) is only appropriate when efficiencies are adequately constant within a stratum, classifications are reliable, and \(E\) is defined monitored source-time. Publish likelihood alternatives accommodating recurrent or clustered events, source-specific frailty, weather-dependent selection and temporal correlations.

**Censoring.** A finite observing season creates interval-censored starts and ends, left/right-censored events and missed short events. Estimate duration distributions with an observation-window likelihood or injected-cadence forward modeling. Kaplan–Meier style methods are appropriate only when their censoring assumptions hold. Source years should count usable monitored intervals, not the full calendar time indiscriminately.

**Error budget.** At minimum report Poisson/statistical error, completeness variation, classification contamination, baseline instability, source-count calibration, cross-matching, season and filter exposure differences, astrophysical population model uncertainty, and correlated detector/atmospheric calibration. Give upper limits in empty bins with specified confidence/credibility and model assumptions.

## 6. Multiple useful scientific outputs

**A. Survey verification.** A shared negative-transient injection set exposes photometric depth inconsistency, cross-match failure, template leakage, detector-domain artifacts and cadence biases. This value is independent of any unusual astronomical signal.

**B. Line-of-sight matter structure.** Event rate, \(T\) and color dependence map obscurer covering fractions, size–speed mixtures and associations with dust, molecular material or circumstellar disks. A rate–duration–duty-cycle relation is a consistency check for assumed moving-screen populations.

**C. Compact and extended gravitating structures.** Joint flux/astrometric signals and known lensing environment tests improve classification of strong-lens caustics, microlensing, source blending and void/large-scale-structure demagnification relative to standard cosmological baselines. They do not presume that weak lensing alone commonly hides bright stars.

**D. Galactic and stellar populations.** Source-class-conditioned rates constrain irregular variability and rare dimming events; event characteristics may identify disks, companions, and dynamical environments. Separate recurrent winks from permanent end states.

**E. Rare-hypothesis constraints.** After ordinary mechanisms and survey effects are modeled, residual sky-coherent, temporally reproducible anomalies can be tested against preregistered alternative propagation models. Successful null results provide useful upper bounds just as positive results provide follow-up targets.

## 7. Hypothesis evidence datasheet: interpretation rules

The companion workbook/CSV is a **hypothesis-by-observable design matrix, not measured data**. For each mechanism it records: maturity, expected signatures, evidence that would increase plausibility, a contrary or tension-producing observation, key impostors, necessary measurements, and a cited starting reference. Entries are tests, not exclusive labels. An achromatic event does not prove gravity, a sharp event does not prove a metric discontinuity, and a signed lag covariance does not prove rotational spacetime. Standard drifting screens can produce nonzero lag antisymmetry. A sky-aligned signal still requires controls against correlated astrophysical foregrounds.

One row addresses SAT/H(s)H among several exploratory propagation alternatives. It has *no privileged selection threshold or prediction*. A geometric model contributes a genuinely new test only if it independently derives a null transport/flux law, event or covariance scale, and quantitative population rate **before** inspection of held-out events. Historical angular constants or proposed percent blackouts are not observational predictors without a physical transfer mapping.

## 8. Deliverables and reporting standards

Publicly release (where data rights allow): (i) immutable sample definitions and source lists, (ii) per-visit forced-flux likelihoods and flags, (iii) event/posterior and nondetection records including censored events, (iv) source-time and image-level recovery functions, (v) classified and unclassified rates with uncertainty, (vi) reproducible sky–time covariance/null-test code and (vii) a signed protocol changelog. For a primary result, report *counts together with their denominators* and efficiency uncertainties, not just a gallery of unusual sources.

Predefine an independent pilot in archival OGLE/ZTF/ASAS-SN and cross-catalog controls, then a Rubin DP2 engineering test, followed by an appropriately mature Rubin LSST rate measurement. These phases have different sensitivities, sky coverage and event populations and must not be combined naively. Explicitly separate raw candidate count from vetted closed-event count.

**This manuscript proposes measurements and tests. No population rate or positive signal is claimed.**

## References and starting data resources

[R1] Solano, Villarroel & Rodrigo (2022), *Discovering vanishing objects in POSS I red images using the Virtual Observatory*, MNRAS 515, 1380. https://doi.org/10.1093/mnras/stac1552  
[R2] Mróz et al. (2019), *Microlensing optical depth and event rate toward the Galactic bulge from eight years of OGLE-IV observations*. https://arxiv.org/abs/1906.02210 and https://ogle.astrouw.edu.pl/cont/4_main/len/micrl_opt_dept/  
[R3] Nunota et al. (2025), *The Microlensing Event Rate and Optical Depth from MOA-II 9 Yr Survey Toward the Galactic Bulge*. https://doi.org/10.3847/1538-4357/ada352  
[R4] Amendola, Frieman & Waga (1999), *Weak gravitational lensing by voids*. https://doi.org/10.1046/j.1365-8711.1999.02841.x  
[R5] Shah et al. (2026), *The nature of ASASSN-24fw's occultation: modelling the event as dimming by optically thick rings around a substellar companion*. https://academic.oup.com/mnras/article/546/3/staf2251/8471205  
[R6] Fiedler et al. (1987), *Extreme scattering events caused by compact structures in the interstellar medium*. https://doi.org/10.1038/326675a0  
[R7] Rubin Observatory, *The Legacy Survey of Space and Time*, updated July 2026. https://rubinobservatory.org/for-scientists/rubin-101/the-legacy-survey-of-space-and-time-lsst  
[R8] Rubin Observatory, *Future Data Products*, updated July 2026. https://rubinobservatory.org/for-scientists/data-products/planned-data-products  
[R9] Rubin Science Platform, *Data Previews*, as accessed October 2026. https://data.lsst.cloud/docs  
[R10] Mróz et al. (2020), *Microlensing optical depth and event rate in the OGLE-IV Galactic plane fields*. https://arxiv.org/abs/2004.07289  
[R11] Bolejko et al. (2013), *Antilensing: The Bright Side of Voids*. https://doi.org/10.1103/PhysRevLett.110.021302  
[R12] Romani, Blandford & Cordes (1987), *Radio caustics from localized interstellar medium plasma structures*. https://doi.org/10.1038/328324a0