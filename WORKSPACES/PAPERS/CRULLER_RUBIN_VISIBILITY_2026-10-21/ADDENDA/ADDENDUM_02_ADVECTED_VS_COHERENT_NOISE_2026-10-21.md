# Addendum 02 — Translating-screen versus coherent-field covariance in stellar noise

**Parent:** Projected Toroidal Geometry and Testable Angular Statistics for Transient Stellar Visibility (R0).  
**Date:** 2026-10-21. **Status:** SANDBOXED analytical comparison. No astronomical detections and no physical Cruller noise amplitude derived.

## Scientific question
Can correlated stellar noise distinguish a propagating foreground distortion from a broad, approximately synchronous perturbation? A dynamic observational imprint need not be a spatially moving screen, and a globally coherent fluctuation is not necessarily a Cruller effect. Distinguish the models through the cross-correlation peak lag versus angular separation.

## Model A: advected Gaussian frozen screen
Let g_i(t)=G(D theta_i-v t), with E[G(x)G(y)]=A² exp[-|x-y|²/(2L²)]. Then
C_ij(tau)=A² exp[-|D delta_theta-v tau|²/(2L²)]
if the lag convention is selected accordingly. Along the drift direction, tau_peak=D delta_theta_parallel/|v|. The transverse mismatch suppresses peak correlation by exp[-(D delta_theta_perp)²/(2L²)]. Temporal coherence tau_c=L/|v| and angular coherence theta_c=L/D; hence tau_peak/tau_c=delta_theta_parallel/theta_c.

## Model B: simultaneous coherent field
For a separable spatial/temporal field with covariance
C_ij(tau)=A² exp[-(D|delta_theta|)²/(2L²)] exp[-tau²/(2tau_c²)],
the temporal correlation maximum is at tau=0 for every separation. This is a different statistical phenomenology, not a derived GR mode, and a common instrumental/atmospheric systematic can give the same shape.

## Executed numerical scale check
Python arithmetic using exact parsec and angular unit conversions for D=10 pc, |v|=30 km/s:
angular drift mu=0.00173264498209 arcsec/day;
separations 0.01,0.1,1,10 arcsec give expected along-motion peak lags 5.7715, 57.7152, 577.1523, 5771.5228 days.
A 10-arcsecond separation requires 15.8 years for this particular screen.
Actual covariance contrast plotted from normalized 2D models: /mnt/data/cruller_noise_addendum_02_lag_signatures.png (local chat artifact).

## Test implications and cautions
1. Measure pairwise covariance conditioned on angular separation magnitude, position angle, lag, magnitude, band, and cadence.
2. Split by camera/detector coordinates and sky coordinates, atmosphere and seeing. Common mode contamination produces zero-lag correlations.
3. Directional lag ridges support transported patterns; zero-lag broad coherence supports common-mode fluctuations, but neither establishes a Cruller.
4. Signal amplitude A, physical D,L,v, covariance form, source-redshift dependencies, and any chiral/time-asymmetry must come from a proper finite-core gravitational constitutive model and null-geodesic transport before this becomes a unique cosmological prediction.
5. Rubin survey gaps and sampling can alias or miss short lags. Compare predicted covariance after sampling onto actual observation windows, not continuous toy time.

This adds a *shape test* rather than inventing a new correction coefficient. Any observational claim requires injection/recovery and preregistered selection to avoid look-elsewhere effects.
