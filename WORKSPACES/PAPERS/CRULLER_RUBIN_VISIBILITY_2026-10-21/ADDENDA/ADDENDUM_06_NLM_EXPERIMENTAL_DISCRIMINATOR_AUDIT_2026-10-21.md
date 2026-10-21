# Addendum 06 — Independent audit of NLM's stellar-wink discriminator proposal

**Date:** 2026-10-21. **Parent:** *Projected Toroidal Geometry and Testable Angular Statistics for Transient Stellar Visibility*, sandbox R0.  
**Status:** SANDBOXED source-critical review, not model acceptance, not an astronomical detection.  
**Scope:** Separately assess the user's supplied NLM proposal for ordinary astrophysical controls, observational tests, and SAT/H(s)H candidate signatures. This is not an endorsement of any particular cosmology.

## Findings preserved

1. **Global-flux gate:** Loss of a fold image pair is not necessarily loss of the entire star. Detectability depends on summed **absolute** magnifications of the accessible images, source emission time delays, wavelength-dependent throughput, extinction and survey detection thresholds.
2. **Known mechanisms:** Finite-source fold/cusp lensing, time-variable extinction/occultation and survey artifacts should remain explicitly separate null families. Combined gravity+plasma refraction is already an established theoretical possibility; cite *Hills and holes in the microlensing light curve due to plasma environment around gravitational lens*, MNRAS (2020), https://academic.oup.com/mnras/article/491/4/5636/5650526 .
3. **Useful empirical gates:** Matched-epoch multiband photometry; lagged sky-angle covariance with fixed sky/detector controls; exact survey cadence and forced-photometry/non-detection information; preregistered geometric templates with withheld validation samples.
4. **Euclidean sky projection:** The off-axis toroidal inner-ring latitude formula is an exact sightline projection for the given Euclidean 3D ring model; it alone does not predict any lensing, blackout, or 4D null propagation.

## Corrections to NLM text

### Fold expression (mathematical sign conflict)
The displayed formula proportional to 1/sqrt(t-t0) times Heaviside(t0-t) is inconsistent: its square root is negative-side imaginary wherever the Heaviside is on. For fold image-pair annihilation approaching t0 from below, one consistent **point-source asymptotic** convention is

F_fold(t)=K * Heaviside(t0-t)/sqrt(t0-t), K>0,

plus separately tracked image fluxes. Finite source angular size removes the divergence. Cusp is a distinct catastrophe and does not obey the same generic exponent. Thin-lens local fold pair destruction is 4->2 or a **local** 2->0 pair statement, not evidence of global zero images. Standard reference: https://vo.ned.ipac.caltech.edu/level5/Blandford/Blandford3_3.html .

### Achromaticity (not a unique label)
Geometric-optics vacuum gravitational lensing is approximately achromatic, not guaranteed to be observed as identical broadband flux variations: finite-source wavelength-dependent stellar limb darkening, blending, wave optics and lens environments create chromatic effects. Dust has varying extinction curves, not an exact universal tau proportional to lambda^-1. Nearly grey obscuration and opaque occultation can also be achromatic. References:
https://academic.oup.com/mnras/article/316/1/97/1120686
https://academic.oup.com/mnras/article/491/4/5636/5650526
https://doi.org/10.1086/316293 .

### Odd-lag covariance does not identify chirality
NLM's DeltaC(tau)=C_ij(tau)-C_ij(-tau) is also nonzero for a straight, nonrotating drifting field. If C= A² exp[-(DeltaX-v tau)²/(2L²)], then
DeltaC=2 A² exp[-(DeltaX²+v² tau²)/(2L²)] sinh(DeltaX v tau/L²).
Executed Python check for normalized DeltaX/L=1, v tau/L=.3 gave C+=0.7827045382, C-=0.4295573582, DeltaC=0.3531471800 despite **zero rotation**. A two-dimensional inferred transport vector field and its curl distinguish advection from rotation more meaningfully; nonzero curl still need not be gravitational or intrinsic parity breaking. Sky coordinates alone do not exclude moving material foregrounds.

### Unsupported physical promotions
The claims of an obligatory theta4=0.246 rad lattice threshold, winding-number correction, 80% gauge-coupling shutdown, strictly achromatic instantaneous stellar step, 0.246-rad pulsar-timing residual and toroidal projection-caused transient blackout are **not derived by the shown equations**. In project BEDROCK BR-005, theta4=0 is the null time-normal baseline. Earlier pulsar conjectures must not be repackaged as validated stellar predictions. The hand-imposed wavefront r=ct/(1+epsilon F(n)) is not established as a null solution to a derived Lorentzian metric. The hypothetical 80% **flux** loss corresponds to 2.5log10(5)=1.747425 mag (executed Python); it could hide a source only if its original flux is less than 5 times the same detection limit, holding other factors fixed. A change in gauge coupling does not by itself establish an equal flux reduction.

### False categorical comparators
Ordinary cosmic shear is spatially correlated and tracks large-scale structure, not simply "uncorrelated across sources" or isotropically random lensing locations. See https://www.lsst.org/?q=node%2F87 . Ordinary stellar occultations need not have smooth polynomial ingress; they can be sharp or complex. Caustic brightening is not an obligatory observed precursor to every flux depression.

### Incomplete rate formula
For event counts in bin i, an example dimensionally typed model is Y_i ~ Poisson[ N_star,i * epsilon_i * DeltaT_i * (r0_i + A K_i) ], where epsilon_i is a dimensionless event-recovery efficiency, DeltaT_i is monitored time, and r0,i and A K_i are events per star per unit time. This is a statistical parameterization, not a physically derived SAT event rate. It must include source magnitude, sky mask, crowding, filter, instrument and correlated cadence exposures. Assumptions about Poisson independence should be tested.

### Rubin measurement reality
The Wide Fast Deep LSST has ~3-day mean revisit in **any** of six ugrizy filters, not simultaneous multiband time series. Hence "simultaneous color-indices" require epoch-matched observations or model-based interpolation with uncertainty. Negative difference-image flux should be handled as flux/uncertainty, not dropped by magnitude conversion. A missing alert does not imply the source vanished; source-position forced photometry and images, including upper limits and proper-motion-aware cross-matches, are essential.
Official Rubin documentation:
https://rubinobservatory.org/for-scientists/rubin-101/the-legacy-survey-of-space-and-time-lsst
https://rubinobservatory.org/for-scientists/resources/early-science
https://rubinobservatory.org/for-scientists/data-products/alerts-and-brokers
https://dp0-2.lsst.io/tutorials-examples/Portal-5.html .

## Proposed blind discriminatory study (model-neutral)
Stage A: construct a known-physics injection/recovery library from physically specified finite-source gravitational lensing; extinction/occultation clouds with transmission laws; combined plasma/gravity where applicable; intrinsic stellar variability and known imaging/calibration artifacts. Generate exact observable fluxes and uncertainty-aware, per-visit detection probabilities.

Stage B: compare independent test statistics: (i) multiband behavior at matched epochs (ii) astrometric covariation and multiple imaging (iii) light-curve slopes/caustic finite-source structure (iv) time-lag versus 2D angular separation (v) sky-coordinate versus detector-coordinate stability. Preserve known lens and matter-tracer correlations.

Stage C: only after model A/B calibrations, inspect *explicitly SANDBOXED* Cruller templates and the unlensed/lensed held-out residuals. Freeze axis, angular band, parameters, sample definitions and detection thresholds before validation; report look-elsewhere corrections and null successes/failures. Do not label source-selected exploratory candidates physical predictions.

## Bottom line
NLM supplies useful tests but incorrectly treats a handful of speculative SAT-specific numerical and chromatic claims as established predictions, and mistakes an odd lag statistic for a unique vorticity/chirality discriminator. The strongest program is model-neutral classification of stellar-wink mechanisms with rigorous photometry, finite-source optics, cadence and known-sky-structure controls.
