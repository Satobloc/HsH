# GW190425: source-to-observable map and CODATA boundary

**Status: source-reviewed candidate only.** This note maps a real binary-neutron-star inspiral to its published measurement and inference pipeline. It is not an H(s)H/SAT prediction, validation, fit, or independent raw-strain reanalysis.

## Primary measured system

Abbott et al., “GW190425: Observation of a Compact Binary Coalescence with Total Mass ~3.4 M☉,” *The Astrophysical Journal Letters* 892:L3 (2020), [DOI 10.3847/2041-8213/ab75f5](https://doi.org/10.3847/2041-8213/ab75f5).

The event occurred on 2019-04-25 at 08:18:05 UTC. Hanford was offline. Livingston recorded the high-confidence single-detector event; Virgo was operating and its data were included in coherent parameter estimation, although its event SNR was below the search threshold. The paper reports maximum 1σ calibration uncertainties over 19.4–2048 Hz of 6% amplitude and 3.5° phase for LIGO, and 5% amplitude and 7° phase for Virgo.

The parameter analysis used 128 seconds of data in 19.4–2048 Hz, containing approximately 3,900 inspiral phase cycles before merger. It estimated detector noise spectra, removed a short Livingston noise transient, checked robustness against the unprocessed data and a 30 Hz low-frequency cutoff, and marginalized over detector-calibration uncertainty. The primary waveform was PhenomPv2NRT, with cross-checks using SEOBNRv4Tsurrogate, IMRPhenomDNRT, and TaylorF2.

## Public data and version

The [GWOSC GW190425 event release](https://gwosc.org/eventapi/html/GW190425/v1/) and [LIGO DCC posterior-sample release P2000026-v2](https://dcc.ligo.org/LIGO-P2000026/public) provide public access. The v2 release lists a 661.1 MB HDF5 posterior-sample file, a 9.4 MB notebook, a 9.7 MB HTML rendering, PSD products for Livingston and Virgo, calibration-uncertainty envelopes, and configuration information. The posterior release contains low- and high-spin-prior results across three parameterized waveform families. The file bytes were not downloaded in this pass; the paper and release metadata were inspected.

## CODATA context before comparison

The applicable constants evaluation checked here is the NIST/CODATA 2022 adjustment, published in 2025: [Mohr, Newell, Taylor & Tiesinga, DOI 10.1063/5.0279860](https://doi.org/10.1063/5.0279860). Its input-data cutoff is 2022-12-31. The global adjustment uses 133 input data to determine 79 adjusted constants, with 54 degrees of freedom.

The Newtonian constant G is evaluated separately because it is independent of the other adjusted constants. Its weighted-mean input comprises 16 experimental determinations with three reported correlations: 0.351, 0.134, and 0.068. The adjustment retains a 3.9 uncertainty expansion factor; after expansion, χ²=12.9 for 15 degrees of freedom, p=0.61, and Birge ratio 0.93. The recommended value is G=6.67430(15)×10⁻¹¹ m³ kg⁻¹ s⁻², with relative standard uncertainty 2.2×10⁻⁵. No new competitive G datum entered relative to the 2018 adjustment.

No CODATA-G substitution or SI mass conversion is used in the comparison below. Published GW190425 masses remain in M☉. The paper's source-frame mass conversion separately assumes flat ΛCDM with H₀=67.9 km s⁻¹ Mpc⁻¹ and Ωm=0.306, so source-frame values carry cosmological-model dependence. CODATA is recorded as the constants-evaluation context, not treated as an input to the posterior-width arithmetic.

## Scripted posterior-sensitivity arithmetic

Table 1 of the primary paper reports low-spin (dimensionless spin magnitude χ<0.05) and high-spin (χ<0.89) prior results. The reported source-frame component-mass bounds are not both central 90% intervals: the primary mass uses 0–90%, while the secondary mass and mass ratio use 10–100%. The following width ratios preserve that convention and are descriptive comparisons of the same event under different priors, not independent measurements.

- Primary-mass interval width: 1.87−1.60=0.27 M☉ (low-spin); 2.52−1.61=0.91 M☉ (high-spin), a 3.37× width increase.
- Secondary-mass interval width: 1.69−1.46=0.23 M☉; 1.68−1.12=0.56 M☉, a 2.43× increase.
- Mass-ratio interval width: 1.0−0.8=0.2; 1.0−0.4=0.6, a 3.00× increase.
- Detector-frame chirp-mass medians: 1.4868 M☉ (low-spin) and 1.4873 M☉ (high-spin), a shift of 0.0005 M☉ or 0.0336% of their mean. The respective reported uncertainties are +0.0003/−0.0003 and +0.0006/−0.0008 M☉.
- The 90% upper limit on combined dimensionless tidal deformability changes from 600 to 1100, a factor of 1.83.
- The paper reports a Bayes factor of approximately 1 between spinning and non-spinning models, hence no evidence for or against spin in this event. It also reports no evidence for a postmerger signal in the 1 second around coalescence.

These results indicate that chirp mass is comparatively stable while individual component masses, mass ratio, and tidal constraints are much more prior-sensitive. They expose a weakly identified inverse map, not an H(s)H anomaly. The paper reports robustness to waveform-approximant systematics and up to about 3% differences in high-spin posterior medians across sampling algorithms; the low-spin runs showed no such differences.

## Typed candidate map, not an asserted H(s)H equivalence

A source-faithful measurement architecture can be written as:

`(W_1,W_2, M_src) --π?--> Θ --H_GR--> h_src(t) --R_det(M_det,S)--> d_L1,V1(t)`

- `W_1,W_2`: candidate finite-size source histories for the two neutron stars. They are inferred, not directly imaged.
- `M_src`: source constitutive response, represented in the waveform by spin, tidal deformability, and equation-of-state-dependent quantities.
- `S`: detector time/frequency sampling and analysis window. This is an observation chart, not automatically an H(s)H timesheet.
- `M_det`: detector calibration, noise spectra, and transient treatment. This is measurement-system state, not automatically the theory's physical medium.
- `π`: the source-to-waveform-parameter map from explicit finite-core worldtube geometry to Θ is not supplied by the paper. It remains uninstantiated.
- `H_GR`: the published GR waveform family maps source parameters to a strain model.
- `R_det`: detector response and calibration/noise model map the strain model to observed detector data.
- The Bayesian inverse maps data to a posterior conditional on waveform family, priors, PSD, calibration, and cosmology. It is not a unique inverse to source geometry.

The minimal representation therefore needs typed separation between source matter response and detector response. Collapsing them into one undifferentiated “medium” would conflate distinct systems. This is a proposed bookkeeping requirement, not a claim that the GW detector is an H(s)H medium.

## Formalization boundary

Existing conditional Lean work is relevant but not yet integrated. HsH PR #1508 compiles Enheduanna's branch-scoped map-composition module at its exact PR head; PR #873 separately compiles Kestrel's projected-incidence and worldtube-curve-lift modules at its exact PR head. The two PR heads contain disjoint module sets, target the same unprotected infrastructure branch, and have no combined import/build. These builds prove only their encoded conditional mathematics. They do not instantiate `π`, establish a physical worldtube, or validate the GW inference.

No new Lean theorem is claimed here. No local Lean executable was available, and the source-specific geometry-to-waveform map is not yet defined. The next formal step is a source-derived domain/codomain and compatibility contract, followed by a combined build, not an analogy-based fixture.

## P2 disposition and falsifiable next step

GW190425 is an additional P2 candidate, not a selected system. A future test must freeze an H(s)H geometry-to-waveform map and a numerical observable prediction before using the event as a holdout. It must compare against the published GR waveform baseline using the versioned calibrated strain, detector PSDs, calibration uncertainty, and the event's posterior/model dependence. The current paper's parameter estimation is a fit/inference, not an independent H(s)H prediction.

No raw-strain reanalysis, fit, H(s)H prediction, independent measurement, P2 selection, paper-gate advancement, or theory promotion is reported.
