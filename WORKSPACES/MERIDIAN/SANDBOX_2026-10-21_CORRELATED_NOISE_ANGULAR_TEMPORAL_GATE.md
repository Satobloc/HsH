# Meridian | Correlated stellar noise: angular-temporal coherence gate | 2026-10-21

**SANDBOX / Python executed; no claim of observed H(s)H signal.** Research prompt: could Cruller light-cone deformation be classified as stellar noise, and can one predict its angular and temporal correlations?

## Explicit toy assumptions and exact correlation result
Take a stationary homogeneous Gaussian scalar *fractional-flux response field* G(x) on a foreground screen distance D with spatial covariance E[G(x)G(x+r)] = A² exp(-|r|²/(2L²)); advect without intrinsic evolution at transverse velocity vector v. Star i samples g_i(t)=G(D theta_i - v t). Assume small angles and a common foreground screen. Its exact covariance:
C_ij(tau)= A² exp[-|D(theta_i-theta_j)-v tau|²/(2L²)].
For one star C_ii(tau)=A² exp[-(tau/tauc)²/2], tauc=L/|v|. Spatial coherence theta_c=L/D, hence theta_c=|v|tauc/D. Along the motion direction the peak lag is tau_peak=D DeltaTheta_parallel/|v|, and correlation at the peak is suppressed by exp[-(D DeltaTheta_perp)²/(2L²)]. A time-varying or rotating wavefront, finite correlation lifetime, multi-layer geometry, geometric lensing and projection will generally modify this law. Calling g a gravitational effect *requires* deriving the response from the metric; no such derivation exists yet.

Temporal power spectral density for isolated Gaussian decorrelation at fixed sightline, with cycles-per-unit-time frequency f:
S(f)=A² sqrt(2 pi) tauc exp[-2 pi² f² tauc²].
This is smooth, broadband colored noise, not an inevitable narrow oscillatory line. Oscillatory PSD lines require an independently justified periodic component. Zero mean of g is a modeling choice; near gravitational caustics linear small-perturbation assumptions may fail.

## Executed calculation and observational gate
Computed with Python using v=30 km/s and tauc in days, D in parsecs:
- D=1 pc: theta_c=0.0173264 arcsec for 1 day; 0.1732645 for 10 days; 6.32415 for 365 days.
- D=100 pc: theta_c=0.000173264 for 1 day; 0.00173264 for 10 days; 0.0632415 for 365 days.
- D=1000 pc: theta_c=0.0000173264 for 1 day; 0.000173264 for 10 days; 0.00632415 for 365 days.
At D=100 pc, theta_c=1 arcsec implies tauc about 5771.5 days (15.8 years). Therefore, under this frozen-screen model, *rapid* (day-scale) coherence across distinct arcsecond-separated stars at hundreds of pc would be inconsistent with the chosen v. Such detections, if real and not instrumental, would demand a distinct propagation mechanism, much closer screen, much greater effective pattern velocity, or wavefront/global-common-mode behavior. No physical distance or velocity has been derived for Cruller.

Figure exported /mnt/data/cruller_noise_scaling_gate.png and .svg.

## Data comparison and falsifiers
Observe stellar residuals r_i(t) after filtering intrinsic variability, known photometric errors and systematic observing modes. Use sky-coordinate covariance conditional on angular separation and temporal lag. Instrumental common-mode systematics can mimic fieldwide coherence. Regress exposure-level zeropoints, atmospheric airmass, seeing, cloud, extinction and camera-local backgrounds; preserve them in shuffle/null tests. Repeated Rubin WFD photometry is about one visit per ~3 days in *any filter* (not per-filter or subsecond), so sub-day stochastic power is not uniquely measurable in WFD; high cadence fields and independent fast photometry needed. Rubin official overview https://rubinobservatory.org/for-scientists/rubin-101/the-legacy-survey-of-space-and-time-lsst . If a common moving optical disturbance causes lensing, correlated astrometric residuals in addition to flux may serve as a discriminant; intrinsic stellar light curves usually do not co-move their centroids coherently.

Do not equate correlated colored noise with proof of gravitational polarization; atmosphere, detector, scattered light, microlensing, interstellar scintillation, stellar populations and data reduction artifacts can also correlate. No unique physical noise amplitude or frequency band from H(s)H until full finite-core stress response, metric and optical transfer function are derived. Status SANDBOX, not BEDROCK.