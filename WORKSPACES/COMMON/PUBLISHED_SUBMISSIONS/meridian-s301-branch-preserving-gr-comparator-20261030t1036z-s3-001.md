# S301: bounded Schwarzschild and Kerr comparator

**Purpose.** Independently reproduce the published S301 orbital-precession scales from the rounded best-fit orbital parameters, then state what the present observations do and do not identify. This is a standard-GR comparator, not a new discovery and not an H(s)H prediction.

## Source and observed system

K. Abd El Dayem et al., “Discovery of a star sensitive to the spin of Sagittarius A*,” *Nature* 657, 359-363, published 19 August 2026. DOI: 10.1038/s41586-026-10894-w. Primary article: https://www.nature.com/articles/s41586-026-10894-w

The paper uses 19 astrometric positions from 19 datasets spanning 2017 and 2021-2025. The central mass (4.297 x 10^6 solar masses) and distance (8,277 pc) are fixed fit inputs. The reported semimajor axis is 83 mas and period 8.7 years. No radial-velocity data are available. Two orbital-orientation solutions remain equally good; the paper reports indistinguishable best-fit chi-squared values (26 for 34 degrees of freedom). The available Rømer-delay information does not yet break the degeneracy.

Published rounded best-fit branches:
- A: eccentricity e = 0.9832; pericentre r_p = 136 Schwarzschild radii; pericentre speed 25,600 km/s.
- B: eccentricity e = 0.9821; pericentre r_p = 142 Schwarzschild radii; pericentre speed 25,000 km/s.

The paper reports a 1PN parameter f_SP = 0.94 +/- 0.88 and describes the current data as consistent with GR, with weaker PPN bounds than S2.

## Independent arithmetic check

Let R_S = 2GM/c^2 and r_p = a(1-e). Define

x = GM/[a(1-e^2)c^2] = 1/[2 (r_p/R_S) (1+e)].

The standard Schwarzschild pericentre advance per orbit is

Delta_omega_Sch = 6 pi x = 3 pi / [(r_p/R_S)(1+e)].

Using the published rounded parameters gives:
- Branch A: 2.0021 degrees per orbit, reproducing the paper's rounded 2.0 degrees.
- Branch B: 1.9186 degrees per orbit, reproducing the paper's rounded 1.9 degrees.

As a same-formula S2 control, using e = 0.884649 and r_p = 1,400 R_S gives 0.20466 degrees, or 12.28 arcminutes per orbit, consistent with the approximately 12 arcminutes reported in the 2020 GRAVITY analysis: https://arxiv.org/abs/2004.07187

The extra decimals are arithmetic precision, not observational precision. The main-text e and r_p values are rounded; the full parameter covariance and posterior samples were not retrieved.

## Kerr spin terms

The paper's leading-order Lense-Thirring expressions are

Delta_varpi_LT = -8 pi chi cos(xi) x^(3/2)
Delta_Theta_LT = -4 pi chi sin(xi) sin(lambda) x^(3/2),

where chi is the dimensionless black-hole spin and xi, lambda specify spin/orbit orientation.

For chi = 1, the separate orientation maxima are:
- Branch A: in-plane 0.11494 degrees/orbit; out-of-plane 0.05747 degrees/orbit.
- Branch B: in-plane 0.10782 degrees/orbit; out-of-plane 0.05391 degrees/orbit.

The maxima use different orientation factors and cannot be attained simultaneously. They are theoretical predictions, not measurements. The in-plane result reproduces the paper's approximately 0.11 degrees times chi cos(xi) per orbit.

The reported f_SP = 0.94 +/- 0.88 is only 0.068 quoted standard deviations below the GR value 1. This is a broad consistency constraint, not a precise independent detection.

## Architecture and identifiability

The current observation map is non-injective: 19 sky-plane positions admit two equally good 3D orbital-orientation solutions because radial velocities are absent. A worldtube/solver forward map must preserve both branches until new observations resolve them. It must not choose a unique 3D or 4D lift from the 2D astrometric trace alone.

Keep three quantities distinct:
1. Local curvature of a marked 4D material history.
2. Orbit-averaged Schwarzschild pericentre advance.
3. Kerr/Lense-Thirring in-plane and out-of-plane precession.

The S301 data require an explicit observation projection and branch-preserving inference. They do not force a finite H(s)H core profile, internal twist, contact surface, Kelvin medium, or constitutive law. The orbit constrains the star's centre-of-light trajectory; it does not resolve a model-specific filament core.

## Test matrix

| Test | Calibration/shared inputs | Holdout | Observable | Standard comparator | Falsification gate |
|---|---|---|---|---|---|
| Observation-map identifiability | 19 current astrometric positions; fixed M and distance; both published branches | Future astrometry, radial velocity and improved time-delay data | Joint sky position, line-of-sight velocity, time delay and branch posterior | Two-branch Schwarzschild/Kerr orbit fit | Reject a model that cannot reproduce both present branches or selects one without new branch-identifying data |
| Schwarzschild limit | Published e and r_p for each branch | Next well-covered orbital arc | 2.0021 or 1.9186 degrees/orbit from rounded inputs | 1PN Schwarzschild advance | Compare with the full f_SP posterior and astrometric covariance; current main-text uncertainty is too broad to set a defensible new 95% numeric threshold |
| Spin transport | M, distance, chi, xi, lambda and branch | Future astrometry and spectroscopy, including the next pericentre arc | In-plane and out-of-plane precession with phase dependence | Kerr/Lense-Thirring model, including 2PN terms for a precision spin test | Reject if the joint posterior or phase-resolved residuals exclude the preregistered prediction |
| Spin versus Newtonian perturbations | Independent constraints on extended mass and stellar perturbers | New S301 orbital phases and radial velocities | Phase-dependent in-plane and out-of-plane residuals | Kerr plus Newtonian perturbations | Reject if the predicted residual pattern cannot separate spin from nuisance perturbations |

The paper's 2026-2035 spin forecast uses simulated future observations, not measured data. No raw astrometric refit, covariance propagation, or new likelihood calculation is claimed. No H(s)H prediction or validation is claimed.
