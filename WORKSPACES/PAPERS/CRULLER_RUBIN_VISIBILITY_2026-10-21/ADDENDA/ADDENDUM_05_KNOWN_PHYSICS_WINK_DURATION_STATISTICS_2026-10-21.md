# Addendum 05 — Known-physics stellar-wink durations and survey duty cycles
**Date:** 2026-10-21
**Companion to:** *Projected Toroidal Geometry and Testable Angular Statistics for Transient Stellar Visibility* (R0).
**Status:** SANDBOXED mathematical control. This document deliberately leaves SAT/H(s)H/Cruller; it uses ordinary dust extinction, source thresholding, and planar integral geometry. No detected new astronomical signal and no Cruller-derived physical parameter.

## Physical starting point
Material along any line of sight can scatter or absorb photons. Solar System interplanetary dust is observed through zodiacal light (NASA: https://ntrs.nasa.gov/citations/19780054319). This does not establish substantial attenuation along every individual ray, nor that every photon interacts. In the point-source/no scattered-in light approximation,
F_observed(lambda,t)=F_base(lambda) exp[-tau(lambda,t)]
and invisibility requires tau > tau_crit = ln(F_base/F_lim), assuming F_base>F_lim and tau_crit>0. Gravitational magnification may additionally enter as a factor mu_total(t); pure gravity does not itself absorb photons.

## Finite, uniform spherical cloud
Take physical radius R, density rho, and mass extinction coefficient kappa_lambda, all typed in Planck units (c=G=hbar=1). For a parallel light beam at projected offset b<=R:
tau_lambda(b)=2 kappa_lambda rho sqrt(R^2-b^2).
Define central depth tau_0=2 kappa_lambda rho R. If tau_0>tau_crit, the projected radius of the non-detection region is
R_w=R sqrt[1-(tau_crit/tau_0)^2].
An effective cloud moving at constant transverse speed v relative to the line of sight (within a local flat-screen approximation) gives event duration
T(b)=2 sqrt(R_w^2-b^2)/v, with maximum T_max=2R_w/v.
The threshold region need not be an absorbing cloud: a circular level set of any other fully derived dimming mechanism produces the same chord geometry.

## Exact event-conditioned duration law
For uniform cloud-center surface density in a single screen, among newly encountered threshold discs moving parallel to one another, the perpendicular impact distance b is UNIFORM on [0,R_w], not uniform in projected disc area. Defining x=T/T_max, 0<x<1,
p_x(x)=x/sqrt(1-x^2),
F_x(x)=1-sqrt(1-x^2).
Direct integrals give mean x=pi/4=0.785398163397, median x=sqrt(3)/2=0.866025403784, E[x²]=2/3, SD[x]=sqrt(2/3-pi²/16)=0.223195859277.
13.3974596% of events last less than half the maximum duration.
A time-random snapshot samples durations with length bias: E[x | random moment inside a wink]=E[x²]/E[x]=8/(3pi)=0.848826363157, different from the event-count mean.
If b were sampled by a different selection procedure, including area-uniform positions in a disc, these event-duration formulas would change. Specify selection before claiming a distribution.

## Event rate versus hidden-time fraction
Assume uniform planar surface number density Sigma of independently moving identical threshold discs with speed v, and rare overlap. The rate at which a fixed sightline encounters new wink regions is Gamma=2 Sigma R_w v. Since mean event duration = pi R_w/(2v), Gamma E[T]=Sigma pi R_w². Thus the hidden time fraction is the geometric covering fraction, to leading order in low filling factor; velocities cancel in this product.
For stationary Poisson-distributed discs, the exact probability of being inside AT LEAST ONE individually threshold-crossing disc at an arbitrary instant is 1-exp(-Sigma pi R_w²), but overlapping subthreshold clouds, lensing, and source variability require separate treatment.

## Shapes beyond spheres
Let a convex projected threshold region have area A and perimeter P. For isotropically oriented straight-line encounters with constant speed v and the translation-invariant line ensemble, the classic Crofton/Cauchy result gives E[chord]=pi A/P, hence E[T]=pi A/(P v). Its mean orientation-averaged transverse width is P/pi, giving encounter rate Gamma=Sigma v P/pi. Their product is again Sigma A. Individual duration PDFs depend on shape/orientation, and multiple overlapping structures require a population synthesis.
Reference mathematical background: https://vamshij.com/books/geometric_probability/read/21/ and https://www.maths.usyd.edu.au/u/richardc/RandomObjectsInSpace.pdf .

## Survey-cadence selection
For deterministic equal visit spacing Delta and independent uniform event phase, the probability of at least one inside-wink sample for a duration T is min(1,T/Delta). Let eta=Delta/T_max; integrating over the event-duration law gives
P_capture(eta)= [asin(eta)/eta + sqrt(1-eta²)]/2 for 0<eta<=1;
P_capture(eta)=pi/(4 eta) for eta>=1.
At eta=1, capture fraction pi/4=78.54%; missed fraction 21.46%. Actual Rubin cadence, seasonal windows, instrument flags, multi-visit validation and finite source size change selection.

## Reproducibility
Exact integrals checked by numerical Monte Carlo: 600,000 independent b/R_w uniform draws (NumPy Generator seed 20261021) yielded sample mean x=0.785435764429, median x=0.866211255914 versus exact 0.785398163397 and 0.866025403784.
Two locally generated Class P code plots in originating chat:
- stellar_wink_duration_cdf.png
- stellar_wink_cadence_capture.png
They are not yet hosted in HsH; no website image publication asserted.

## What is not yet a population forecast
No actual R, v, Sigma, kappa, cloud shape/composition distribution, wavelength band, lens mass, observing cadence or physical sky occurrence rate was inferred. A real forecast integrates source brightness and instrument selection over a measured population p(R,v,rho,kappa,distances,...), and adds gravitational convergence/shear, atmosphere, plasma, occultation, and light scattering. The result establishes a reproducible family of ordinary-physics duration and duty-cycle distributions, not an unexplained or universal stellar-wink excess.
