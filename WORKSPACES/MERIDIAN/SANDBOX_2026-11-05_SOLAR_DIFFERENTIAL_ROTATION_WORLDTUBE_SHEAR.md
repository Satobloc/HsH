# Meridian — measured solar differential rotation as a 4D worldtube/shear control

**Date:** 2026-11-05  
**Status:** SANDBOX / established-physics comparator, grounded in published observations. Not a SAT/H(s)H prediction, not a Cruller solution, and not a gravitational-lensing claim.

## Why this system

The Sun is a useful physical calibration object because its surface rotation has been measured as a function of latitude by several distinct methods. Snodgrass & Ulrich (1990) provide a primary-source table of mean coefficients for:
- spectroscopic rotation of surface gas (1967–1984);
- Doppler-residual feature rotation (1967–1987);
- magnetic feature rotation (1967–1987).

They explicitly distinguish these tracers. Their spectroscopic method is a direct measure of surface gas motion, although it is subject to line-transfer and instrumental systematics. The Doppler residual pattern is interpreted primarily as the supergranulation network, not as an individually tracked material parcel. Magnetic and sunspot feature rates are not interchangeable with the gas flow.

**Primary source:** Snodgrass, H. B. & Ulrich, R. K. (1990), “Rotation of Doppler Features in the Solar Photosphere,” *ApJ* 351, 309–316. https://articles.adsabs.harvard.edu/pdf/1990ApJ...351..309S

## Observational inputs

The paper's Table 1 gives the standard polynomial profile

\[
\Omega(\lambda)=A+B\sin^2\lambda+C\sin^4\lambda
\]

with A, B, C in microrad/s:

| Profile | A | B | C |
|---|---:|---:|---:|
| Spectroscopic gas, 1967–1984 | 2.851 ± 0.006 | −0.343 ± 0.005 | −0.474 ± 0.007 |
| Doppler residual features, 1967–1987 | 2.972 ± 0.010 | −0.484 ± 0.038 | −0.361 ± 0.051 |
| Magnetic features, 1967–1987 | 2.879 ± 0.002 | −0.339 ± 0.013 | −0.485 ± 0.021 |

The paper warns that the standard sin²/sin⁴ basis is non-orthogonal and produces B/C coefficient crosstalk. It also provides orthogonalized coefficients. This calculation uses the published central profiles and **does not propagate the quoted coefficient errors as independent**, so the results below are central estimates, not full confidence intervals.

Use the spectroscopic-gas profile as the main surface-flow comparator; retain the Doppler and magnetic profiles as separate marker-method checks.

## Reference scale and conventions

- External comparison geometry: standard Euclidean R4 with fourth coordinate q=ct. This is explicitly **not** asserted to be the native SAT/H(s)H time-coordinate mapping. Current BEDROCK preserves Nathan Direct's literal cw=t notation and says its symbol/type map is unresolved; do not silently identify it with q=ct. Planck units c=G=hbar=1 are used for numerical reporting. No Forest normalization is applied to this external-physics comparator.
- SI constants used for conversion: c=299792458 m/s, G=6.67430e-11, hbar=1.054571817e-34.
- Solar radius: IAU nominal R_sun=6.957e8 m, used only as a conversion/reference value, not claimed to be the exact current solar radius.
- R_sun/lP=4.304394972948e43.
- Time interval: one standard synodic Carrington interval, 27.2753 days. The 2024 solar-flow paper explicitly defines this value for CR averaging.
- Finite patch: 5° latitude width, chosen as a representative observational-resolution scale (the later MWO direct-Doppler dataset reports 3.37°–7.21° latitude resolution). This is not an asserted sunspot radius or physical filament-core diameter.

## 1. Four-dimensional curvature of a marked surface history

For a surface-gas marker at fixed latitude lambda and longitude label phi0, in this **external standard-physics comparator**,

\[
X_\lambda(t)=
\left(
R\cos\lambda\cos(\phi_0+\Omega(\lambda)t),
R\cos\lambda\sin(\phi_0+\Omega(\lambda)t),
R\sin\lambda,
q=ct
\right)
\]

with the fourth coordinate q=ct. Put rho=R cos(lambda), omega=Omega(lambda), and beta=rho*omega/c. Then

\[
\kappa_{4,E}=\frac{\rho(\omega/c)^2}{1+\beta^2}
\]

and the (single nonzero) Euclidean Frenet torsion of this helical curve is

\[
\tau_{4,E}=\frac{\omega/c}{1+\beta^2}.
\]

The spatial centripetal acceleration in SI is a3=rho*Omega^2. For the Sun, beta<7e-6, so this external Euclidean curve curvature and the conventional Lorentzian proper-curvature comparator differ by less than 1e-10 fractionally. No equivalence to the unresolved native cw=t notation is asserted.

### Equatorial results

| Profile | Equatorial rate (deg/day) | a3 (m/s²) | kappa_4E*lP | kappa_4E (m⁻¹) |
|---|---:|---:|---:|---:|
| Spectroscopic gas | 14.11346 | 5.65479e−3 | 1.01692e−54 | 6.29180e−20 |
| Doppler residual features | 14.71246 | 6.14497e−3 | 1.10507e−54 | 6.83720e−20 |
| Magnetic features | 14.25207 | 5.76641e−3 | 1.03699e−54 | 6.41599e−20 |

For the main spectroscopic-gas profile, equatorial Omega*tP=1.53704436e-49 and tau_4E*lP=1.53704436e-49. Its 4D material-history curvature is nonzero even though the ambient R4 Riemann tensor is zero.

## 2. Differential rotation produces shear without area expansion

The surface velocity field is V=Omega(lambda) partial_phi on the sphere with metric

\[
dl^2=R^2[d\lambda^2+\cos^2\lambda\,d\phi^2].
\]

Its divergence is exactly zero:

\[
\nabla\cdot V=
\frac{1}{R^2\cos\lambda}
\partial_\phi(R^2\cos\lambda\,\Omega)=0.
\]

The local orthonormal symmetric strain-rate component is

\[
D_{\hat\lambda\hat\phi}
=\frac12\cos\lambda\,\frac{d\Omega}{d\lambda}.
\]

Thus the engineering shear rate is

\[
\dot\gamma(\lambda)=
\cos\lambda\,\frac{d\Omega}{d\lambda}.
\]

This is nonzero even though the flow's surface-area expansion vanishes.

### Observed-profile shear maxima

| Profile | Latitude of max | max |gamma_dot| (s⁻¹) | Shear timescale |
|---|---:|---:|---:|
| Spectroscopic gas | 46.2398° | 5.78712e−7 | 20.00 days |
| Doppler residual features | 43.7490° | 5.98453e−7 | 19.34 days |
| Magnetic features | 46.3622° | 5.83888e−7 | 19.82 days |

The three maximum shear rates span only **3.36% of their mean**, despite the distinct tracer definitions and their different absolute rotation rates. This is a central cross-method observation: in this dataset, the differential shear is more stable across tracer choice than the absolute spin.

For the spectroscopic-gas profile, gamma_dot*tP=-3.11998e-50 at maximum shear, and the shear timescale is approximately 20 days.

## 3. Finite, resolution-scale patch deformation

For a local patch with northward coordinate x and eastward coordinate y, the material map over elapsed time T is a simple shear to first order:

\[
F=\begin{pmatrix}1&0\\\gamma&1\end{pmatrix},
\qquad
\gamma=\cos\lambda\,\frac{d\Omega}{d\lambda}\,T.
\]

Its determinant is exactly one. The right Cauchy–Green tensor is

\[
C=F^TF=
\begin{pmatrix}
1+\gamma^2&\gamma\\
\gamma&1
\end{pmatrix}.
\]

For a 5° latitude patch centred on each profile's maximum-shear latitude, use the exact finite difference

\[
\Delta\phi=
[\Omega(\lambda+2.5^\circ)-\Omega(\lambda-2.5^\circ)]T_{\rm CR}.
\]

Results after one 27.2753-day Carrington interval:

| Profile | Delta longitude across patch | Effective gamma | Principal stretches (min, max) |
|---|---:|---:|---:|
| Spectroscopic gas | −9.8456° | −1.36193 | (0.52888, 1.89080) |
| Doppler residual features | −9.7499° | −1.40862 | (0.51882, 1.92744) |
| Magnetic features | −9.9558° | −1.37409 | (0.52623, 1.90032) |

For the spectroscopic profile, the patch's initial meridional width is 60.71 Mm; the differential east–west displacement across it is 82.68 Mm. The principal stretch factors are reciprocal to numerical precision, and the area ratio is exactly one. This is a **passively advected kinematic patch** under the mean flow, not a claim that a coherent rigid sunspot remains intact for a full rotation.

## 4. The worldtube itself versus its marked histories

The unlabelled solar photospheric surface-worldtube in the external comparator is S²(R) x R. In static coordinates its induced metric is

\[
ds_W^2=dq^2+R^2[d\lambda^2+\cos^2\lambda\,d\psi^2]
\]

and its intrinsic scalar curvature is

\[
\mathcal R_W=\frac{2}{R^2}
=4.132244296878\times10^{-18}\ {\rm m^{-2}}
=1.079458038133\times10^{-87}\ \ell_P^{-2}.
\]

This intrinsic worldtube curvature is independent of the differential rotation profile. The ambient comparison R4 remains flat. The material-coordinate map psi=phi+Omega(lambda)q/c changes the marked trajectories and introduces time-dependent off-diagonal metric components, but it is a diffeomorphism of the same unlabelled S² x R worldtube.

In material coordinates (q=ct,lambda,phi), the induced metric has determinant

\[
\det(g_W)=R^4\cos^2\lambda
\]

independent of Omega, dOmega/dlambda, and q. Therefore its worldvolume volume element is unchanged in time. The material congruence in this external comparison has **nonzero path curvature and shear, zero volume expansion, and no required ambient Riemann curvature**.

This is the precise separation needed for Cruller work:
- outer worldtube geometry alone does not encode the internal rotation profile;
- marked material histories do;
- shear and curvature need not imply volume expansion;
- none of these kinematic facts alone derives a gravitational optical metric or a stellar-wink signal.

## 5. Boundaries and next empirical step

This is a surface-only, axisymmetric mean-flow control. It omits meridional circulation, radial motion, convection, magnetic stresses, time-dependent torsional oscillation, and the Sun's full interior. It derives no stress-energy, bending modulus, contact energy, optical index, or gravitational lensing.

Mahajan et al. (2024) compare direct Doppler, granule tracking, magnetic-pattern tracking, and global/local helioseismology. Their GONG global inversions comprise 259 108-day data sets (1995–2021), with 2° latitude resolution and 0.02 R_sun radial resolution from 0.68 to 1.00 R_sun; MDI/HMI inversions are also available. Their paper notes that magnetic-pattern tracking can correspond to helioseismic flows 25–28 Mm below the photosphere. The data needed to reproduce Figures 3–6 are available at DOI 10.7910/DVN/7RLWAE.

**Next calculation:** acquire the depth- and time-resolved Omega(r,lambda,t) profile, then calculate radial+latitudinal shear, worldline curvature, and the deformation of a finite-volume material bundle. This is the proper next bridge from a surface sheet toward finite-core worldtubes and braids.

## Reproducibility

Executable script: WORKSPACES/MERIDIAN/meridian_solar_worldtube_shear_20261105.py. The script's q=ct coordinate is a conventional external comparison; it deliberately does not assign a type map to native cw=t.

It uses only the published coefficient table and stated nominal constants; no arbitrary Cruller scale or fitted SAT coefficient is introduced. It reports Planck-normalized curvature, torsion, and shear alongside SI equivalents. It verifies the finite-patch area-preservation identity.

## Sources

1. Snodgrass, H. B. & Ulrich, R. K. (1990), “Rotation of Doppler Features in the Solar Photosphere,” *The Astrophysical Journal* 351, 309–316. Primary observations, method distinctions, Table 1 coefficients, and B/C cross-talk discussion. https://articles.adsabs.harvard.edu/pdf/1990ApJ...351..309S
2. Mahajan, S. S. et al. (2024), “The Sun’s Large-Scale Flows I: Measurements of Differential Rotation & Torsional Oscillation,” *Solar Physics* 299, 38. https://doi.org/10.1007/s11207-024-02282-2
3. Mahajan et al. (2024) replication data: https://doi.org/10.7910/DVN/7RLWAE
4. Prša, A. et al. (2016), IAU 2015 Resolution B3 nominal conversion constants, including R_sun,N=6.957e8 m. https://arxiv.org/abs/1605.09788

**Verdict:** A real measured rotating surface gives us a controlled example of four-dimensional material-history curvature plus strong, nearly area-preserving shear. It validates the kinematic bridge and shows exactly what a finite-core calculation must track. It does not yet establish the Cruller's internal law or a new gravitational/optical effect.


**Related finite-core control:** The observed CME GCS aspect-ratio/reach calculation is recorded in [SANDBOX_2026-11-05_CME_FINITE_CORE_REACH_FROM_GCS.md](SANDBOX_2026-11-05_CME_FINITE_CORE_REACH_FROM_GCS.md). The solar surface flow and CME flux rope are separate external controls: one supplies measured material shear; the other supplies observed finite-core geometry.
