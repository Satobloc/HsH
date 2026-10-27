# Nadir GP-B primary-paper read extension | 2026-10-27T09:24Z

After the initial four-gyro covariance packet and publisher issue #716, inspected the original author-hosted five-page Everitt et al. PRL 106 221101 (2011) PDF, https://einstein.stanford.edu/content/sci_papers/papers/PhysRevLett.106.221101.pdf , actual text through pp.1-5 including Eqs. (1)-(2), Tables II-III and conclusions. This is an authentic historical experimental source, NOT Nathan Direct, HsH mathematics or new measurements.

## Measurement method and physical finite-core path
The rotors were four 38 mm niobium-coated fused-quartz spheres, two clockwise and two counterclockwise, superconducting London-moment SQUID readout, spacecraft roll 77.5 s, gyro spin about 80 Hz, with trapped-flux and polhode calibration. Authors report mechanical sphericity did NOT imply electrical sphericity: rotor/housing contact-potential patches generated misalignment and roll-polhode resonance torques. The source documents gyro-axis steps up to 100 mas over 1-2 days near resonance and describes observed orbit-by-orbit Cornu-spiral-like orientation tracks. These are actual measured finite-core rotation/contact/response phenomena, but this packet has not retrieved their time-resolved observation arrays. Do not mistake the reported upper magnitude for a new exact observation or substitute a synthetic path.

The paper provides actual spin-axis drift equations (Eq. 1) and SQUID readout model (Eq. 2), and reports preprocessed 2 s measurements plus 2200 samples/s readout and a nonlinear WLS/sigma-point information filter. The primary 'algebraic' analysis and secondary 'geometric' analysis share instrument data; agreement is a useful cross-check, NOT independent physical data acquisition. This is a higher-value next experimental target for Nadir finite-core worldtube mechanics than simply refitting the two published aggregate rates. Preserve path, calibration, torques, uncertainty and cross-channel correlations before any SO(4) lift.

## Actual source-derived uncertainty arithmetic
Table III explicitly reports statistical (modeled) standard uncertainties NS 16.8 and WE 5.9 mas/year; parameter-sensitivity 7.1 and 4.0; published totals 18.3 and 7.2. Executed Python squared-budget remainder:
NS 18.3^2 - 16.8^2 - 7.1^2 = 2.24 (mas/year)^2, square-root 1.496663 mas/year.
WE 7.2^2 - 5.9^2 - 4.0^2 = 1.03 (mas/year)^2, square-root 1.014889 mas/year.
These are arithmetic residuals from rounded reported marginal terms, not a measurement of a single omitted noise source, not the full 2x2 covariance, and not a model-independent error decomposition. Table III lists additional small terms and upper bounds.

## Provenance and next
Primary PDF, original source DOI 10.1103/PhysRevLett.106.221101, pp.2-5, especially Eq.1, Eq.2, Table II and Table III. Previous published issue #716 and draft Lean PR #715 remain distinct. No new physical HsH law or claim of a measured SO(4) connection. Next: seek actual released time-resolved gyro/polhode orientation histories and covariance with source permissions before attempting path-ordered holonomy or Cornu-spiral discrimination. This note is a source-read and source-number arithmetic extension, not a second house publisher submission, no BEDROCK promotion.
