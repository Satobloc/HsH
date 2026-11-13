# GW190425 source-to-observable, CODATA, and Lean integration audit

**Run:** h796:s2, nominal 2026-11-13T04:24Z  
**Deterministic label:** Enheduanna, ring index 11; successor Tern Rook, index 12. This is a worker selection, not authenticated thread identity.  
**Status:** source-reviewed candidate only; no H(s)H prediction, raw-strain reanalysis, independent measurement, P2 selection, or theory promotion.

## 1. Historical role and source custody

No standalone Nathan-authored Enheduanna specialist charter was recovered. The direct MARLOWE user message 11399ca2-5bd6-4203-9e19-e8e044fbc736 is broad archive-revival guidance, not a detailed technical charter. The source-layer boundary is retained: the Nathan-authored question in SAT archive SRENA SAT2.txt (blob fe01fc85b1874c1573843724f035ee292fd48961, lines 919–947) asks how to represent Coulomb repulsion in 4D and invokes Kelvin. The subsequent chirality/pressure/suction mechanism is assistant-authored, not Nathan Direct and not a source equation. The historical Blockwave file SATOBLOC/SATOBLOCK Full Theory & Predictions.txt (blob 3893ef0acf9009b01c58c736ec97b8df2ba74943) was left untouched. No SAT-O or Blockwave equation was changed.

The SAT archive README explicitly frames the archive as a theory-building record, not a polished paper. HSH_RESOURCES README describes that repository as private research infrastructure, while GitHub metadata reports it public. Only the root README and repository metadata were inspected; no resource payload or private index was opened.

## 2. Measured system and source provenance

Abbott et al., “GW190425: Observation of a Compact Binary Coalescence with Total Mass ~3.4 M☉,” ApJL 892:L3 (2020), DOI [10.3847/2041-8213/ab75f5](https://doi.org/10.3847/2041-8213/ab75f5).

The event occurred 2019-04-25 08:18:05 UTC. Hanford was offline. Livingston recorded the high-confidence single-detector event; Virgo was operating and its data were used in coherent parameter estimation, although Virgo SNR was below the search threshold. Maximum 1σ calibration uncertainties over 19.4–2048 Hz were 6% amplitude / 3.5° phase for LIGO and 5% amplitude / 7° phase for Virgo.

The analysis used 128 seconds in 19.4–2048 Hz, approximately 3,900 inspiral phase cycles, detector noise spectra, Livingston transient removal, robustness checks against unprocessed data and a 30 Hz cutoff, and marginalization over detector-calibration uncertainty. PhenomPv2NRT was the primary waveform; SEOBNRv4Tsurrogate, IMRPhenomDNRT, and TaylorF2 were cross-checks.

Public data route: [GWOSC GW190425 event release](https://gwosc.org/eventapi/html/GW190425/v1/) and [LIGO DCC P2000026-v2](https://dcc.ligo.org/LIGO-P2000026/public). The v2 release lists a 661.1 MB HDF5 posterior file, a 9.4 MB notebook, a 9.7 MB HTML rendering, Livingston/Virgo PSD products, calibration-uncertainty envelopes, and configuration. The HDF5 bytes were not downloaded in this pass. The event is a real inspiral measurement, but it does not directly image finite neutron-star cores or resolve the contact/postmerger geometry.

## 3. CODATA source/version before numerical comparison

The constants source checked is the NIST/CODATA 2022 adjustment, published in 2025, DOI [10.1063/5.0279860](https://doi.org/10.1063/5.0279860), with input-data cutoff 2022-12-31. The global adjustment uses 133 input data for 79 adjusted constants and 54 degrees of freedom.

G is evaluated separately as a weighted mean of 16 experimental determinations. Three input correlations are reported: 0.351, 0.134, and 0.068. The 3.9 uncertainty expansion factor is retained; after expansion, χ²=12.9 for 15 degrees of freedom, p=0.61, Birge ratio 0.93. Recommended G=6.67430(15)×10⁻¹¹ m³ kg⁻¹ s⁻², relative standard uncertainty 2.2×10⁻⁵. No new competitive G datum entered relative to 2018.

No CODATA-G substitution or SI mass conversion was used in the GW190425 posterior comparison. The published masses remain in M☉. The paper's source-frame mass conversion separately assumes flat ΛCDM with H₀=67.9 km s⁻¹ Mpc⁻¹ and Ωm=0.306, so source-frame values depend on a cosmological model. CODATA is context here, not a numerical input to the posterior-width arithmetic.

## 4. Scripted posterior-sensitivity arithmetic

Table 1 reports low-spin (χ<0.05) and high-spin (χ<0.89) priors. Its component-mass intervals are not both central 90% intervals: primary mass is 0–90%, secondary mass and mass ratio are 10–100%. The following widths preserve those conventions.

| Quantity | Low-spin | High-spin | High/low width |
|---|---:|---:|---:|
| Primary-mass interval width | 0.27 M☉ | 0.91 M☉ | 3.37× |
| Secondary-mass interval width | 0.23 M☉ | 0.56 M☉ | 2.43× |
| Mass-ratio interval width | 0.20 | 0.60 | 3.00× |

Detector-frame chirp-mass medians are 1.4868 M☉ (low-spin) and 1.4873 M☉ (high-spin), a 0.0005 M☉ shift or 0.0336% of their mean. Reported uncertainties are +0.0003/−0.0003 and +0.0006/−0.0008 M☉. The source-frame chirp mass is 1.44±0.02 M☉ under the paper's cosmological assumption. The 90% upper limit on combined dimensionless tidal deformability changes from 600 to 1100, a factor of 1.83.

The paper reports Bayes factor ~1 between spinning and non-spinning models, hence no evidence for or against spin, and no postmerger signal in the 1 second around coalescence. These are posterior-sensitivity and null-result observations, not independent measurements. Chirp mass is comparatively stable; component masses, mass ratio, and tidal constraints are more prior-sensitive.

## 5. Typed measurement map and missing H(s)H map

Candidate measurement chain:

W1 × W2 × M_src --π?--> Θ --H_GR--> h_src(t) --R_det(M_det,S)--> d_L1,V1(t)

- W1,W2: candidate source histories for the two neutron stars; inferred, not directly imaged.
- M_src: source constitutive response represented through spin, tidal deformability, and EOS-dependent quantities.
- S: detector time/frequency sampling and analysis window. It is an observation chart, not automatically an H(s)H timesheet.
- M_det: detector calibration, PSD/noise, and transient treatment. This is measurement-system state, not automatically the theory's physical medium.
- π: source-to-waveform-parameter map from explicit finite-core worldtube geometry to Θ is not supplied by the paper and remains uninstantiated.
- H_GR: standard waveform family maps source parameters to strain.
- R_det: detector response and calibration/noise map the waveform to observed detector data.
- The Bayesian inverse maps data to a posterior conditional on waveform, priors, PSD, calibration, and cosmology. It is not a unique inverse to source geometry.

The candidate minimum therefore keeps source matter response and detector response as typed, distinct states. Collapsing them into one undifferentiated “medium” would conflate different systems. This is bookkeeping, not an asserted H(s)H equivalence.

## 6. Lean and repository integration

Existing conditional Lean modules were checked at exact PR heads:

- PR #1508, head 8647396cb5a3ce4803720a02982bc9af1a12df96, Actions run #42547294085, job #128934928067: Lean 4.34.0 / Lake 5.0.0, lake build HsHVerification success, 8,945 jobs. compose_preserves_target and transport_compose have no reported axioms; transport_identity uses propext.
- PR #873, head 7dbcb5f18690232d921db74f25dfdf222ee51b8c, Actions run #43202552666, job #131129411360: Lean 4.34.0 / Lake 5.0.0, build success, 8,957 jobs. projected_overlap_lifts_if_injective and downstream_readout_cannot_restore_coarse_collapsed_pair have no reported axioms; other results use standard propext / Classical.choice / Quot.sound assumptions.

The PR heads contain disjoint module sets. Both target infra/lean4-verification-20261023; neither imports the other's module, and there is no combined build. The base branch is unprotected. At least 59 visible open draft PRs target it. Main has one Lean source file and a Lean workflow, not the full branch-local verification library. This is an integration bottleneck, not a proof failure.

No local Lean executable was present. No new theorem or module was created because the source-specific map π is not defined and a synthetic physical fixture would violate the data gate. The two CI runs verify only their encoded conditional mathematics, not the physical interpretation.

## 7. Tooling, Mersearch, and project disposition

No direct Mersearch action is exposed in this runtime. The four shared request lanes remain occupied; lane 1's legacy request file lacks a status field, while lanes 2–4 remain requested. No request was overwritten or retriggered. GitHub browsing here is not represented as Mersearch execution.

Existing Math Hopper scripts and its bounded three-repository pilot were checked; the full pilot remains unverified. Whirligig is a sandboxed scalar-to-geometry adapter, not an equivalence test. No SciSpace connector action was exposed in the current tool inventory. HsH, SAT archive, and HSH_RESOURCES metadata each report zero forks. No new tool, dependency, or paid service was introduced.

P2 issue #565 remains open with no selected system. GW190425 is an additional candidate only. P0 remains ACTIVE; P1 remains OVERDUE / NOT READY and Orson-owned; P2 remains HOLD; P3 remains INCOMPLETE. FIE next review is due 2026-11-24. Enheduanna's unrelated-reading cursor remains Babbage line 1881; no repeated reading was added this run.

## 8. Next falsifiable step

Obtain the versioned calibrated GWOSC strain segment and posterior subset, record file checksums, PSDs, calibration envelopes, units, and covariance. Then define the source geometry-to-waveform map with explicit domains, codomains, and composition conditions. Freeze an H(s)H observable prediction before treating GW190425 as a holdout. Only then build a combined Lean import graph that connects branch compatibility to projection/injectivity conditions. Until then this remains a candidate source map, not a physical result.
