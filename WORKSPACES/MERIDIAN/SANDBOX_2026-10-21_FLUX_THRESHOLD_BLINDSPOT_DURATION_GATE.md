# Meridian | Blindspot duration depends on flux threshold, not merely light-cone intersections | SANDBOX | 2026-10-21

## Question
For sources at different distances, does a moving apparent blindspot produce calculable periods of nondetection, and does event duration scale directly with source distance?

## Explicit conditional model
Assume a foreground screen with Gaussian optical depth tau(b)=tau0 exp[-b²/(2 sigma²)] and its closest crossing b(t)=v|t|; received flux F(t)=F0 exp[-tau(b(t))]. This is **phenomenological attenuation**, not a gravitational-polarization law or physically derived SAT/Cruller metric. In particular, positive gravitational lensing shear usually magnifies rather than absorbing optical flux.

Let a survey detect a source only if F(t)>=F_lim. For baseline F0>F_lim define tau_req=ln(F0/F_lim). A full nondetection interval exists only when tau0>tau_req. Its half-width is bcrit=sigma sqrt[2 ln(tau0/tau_req)], and its duration
T_dark=(2sigma/v) sqrt[2 ln(tau0/ln(F0/F_lim))].
If tau0<=tau_req the screen is insufficient to hide the star. If F0<=F_lim the source was not detectably present at baseline. With F0=L/(4 pi Ds²), source distance enters via the flux threshold, **even if the foreground screen distance, width and velocity are identical for all sources**. Thus an observed duration-distance correlation alone is not a distinct Cruller effect.

## Executed numerical fixture
Python model file /mnt/data/cruller_visibility_threshold_gate.py rendered /mnt/data/cruller_blindspot_flux_duration_gate.png and .svg. Parameters: normalized F0(10pc)=1; F_lim=1e-5; tau0=8; Gaussian sigma=2 AU; transverse velocity v=30 km/s. sigma/v=115.43046 days.

Ds=20 pc: tau_req=10.12663, no nondetection.
Ds=50 pc: tau_req=8.29405, no nondetection.
Ds=100 pc: tau_req=6.90776, duration 125.09 days.
Ds=200 pc: tau_req=5.52146, duration 198.81 days.
Ds=300 pc: tau_req=4.71053, duration 237.61 days.
Ds=500 pc: tau_req=3.68888, duration 287.26 days.

All distances and optical depths are illustrative; a real survey has heterogeneous limiting magnitude and stellar luminosities. Given the same screen, more distant otherwise identical sources can exhibit *longer intervals of nondetection* merely because they are closer to survey threshold, despite equal physical screen-crossing times. This null effect has to be subtracted before testing SAT/H(s)H. The central flux suppression corresponds to 8 optical depths, e^-8≈0.0003354, illustrating how extreme attenuation may need to be.

## Further discriminators
If actual missing-star events show angular clustering, compare:
1. nondetection durations versus each star's measured baseline SNR/magnitude and flux limit, holding sky and observing cadence fixed;
2. durations versus distance after controlling luminosity, extinction, proper motion and distance uncertainty;
3. synchronized and migrating sky-boundary events;
4. full-path ray tracing to assess whether an effective gravitational optics map can yield *suppression of all images* without absorption; and
5. time-delay and wavelength/polarization/astrometric tests.

A single flash is not a continuously shining star, and the hand-rotated 3D surface from earlier turns does not satisfy physical null-generator propagation. Multiple wavefront intersections alone cannot be used to infer persistent stellar blindspots.

**Result:** exact conditional formula and numerical fixture; no parameter-free Cruller prediction, no observed event, not BEDROCK. Shared Mersearch bridge was occupied by another worker; no Mersearch execution was claimed.