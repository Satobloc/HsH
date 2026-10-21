# Projected Toroidal Geometry and Testable Angular Statistics for Transient Stellar Visibility
### A Conditional Search Framework for the Vera C. Rubin Observatory
**Nathan McKnight and Meridian | 21 October 2026 | SANDBOX MANUSCRIPT R0**

> **Status:** Physics-facing mathematical/observational proposal. No detected signal, derived Cruller metric, quantified gravitational-polarization response, measured stellar anomaly, or externally reviewed result is claimed. The native LaTeX/PDF edition is being provided as a downloadable artifact in the originating conversation. Figures are illustrative, not observed catalogs.

## Abstract
We formulate a falsifiable search for spatial and temporal organization among astronomical sources classified as transiently vanished or reappeared. The motivating SAT/H(s)H Cruller conjecture places a cosmological origin locus on the inner toroidal longitude and proposes a gravitational deformation of the past null cone. Its material constitutive law and Lorentzian metric remain unknown. We separate (i) exact Euclidean observer-dependent projection of an illustrative inner ring, (ii) a conventional quadrupolar tidal-shear lens illustrating the distinction between lost images and missing sources, and (iii) sky-mask-conditioned angular statistics. The derivations yield a warped projected curve for off-axis observers and a closed-form image-pair threshold. The assumed survey detectability exercise is not an event forecast. The paper identifies the additional dynamics required for a parameter-independent Rubin prediction.

## 1. Scope
The question is whether repeated surveys show coherent angular and temporal structure among *confirmed*, carefully vetted stellar disappearances and reappearances after selection effects are modeled. One may test this without assuming the speculative Cruller interpretation is true. No specific axis, band location, width, event rate or return epoch is currently predicted by H(s)H.

## 2. Toroidal section and finite-core gate
An illustrative 3D torus section has
```math
X(u,v)=((R+r cos v)cos u,(R+r cos v)sin u,r sin v),  R>r>0.
```
The inner longitude v=π has radius a=R−r and length L_in=2πa. The outer longitude has length 2π(R+r). The induced surface metric is ds²=(R+r cos v)²du²+r²dv², with Gaussian curvature K(v)=cos v/[r(R+r cos v)]. The inner K is negative but **not** automatically 4D gravitational curvature.

The circumferential contrast Λ_geom=(R+r)/(R−r). An independently derived maximum admissible stretch Λ_max would imply R−r≥2r/(Λ_max−1). If the first finite core has a physically justified minimum longitudinal closure length L_core, R−r≥L_core/(2π). The thickness of a core does not itself supply that closure length. None of these bounds derives the Big Bang mechanism.

## 3. Off-axis projected sky geometry
Let the ring be S(φ)=(a cos φ,a sin φ,0), the observer O=(d,0,z), and the straight-line sightline n(φ)=[S(φ)−O]/|S(φ)−O|. Relative to the torus axis, its celestial latitude is
```math
b(φ)=arcsin[−z/sqrt(a²+d²+z²−2ad cos φ)].
```
On axis, d=0 and b=−arctan(z/a), a small circle. For 0<d<a, extrema occur at −arctan[z/(a−d)] and −arctan[z/(a+d)], producing a distorted sky locus. At a=1,z=0.6 the latitude spans are 0°, ~25.01°, and ~57.99° for d=0,0.45,0.85 respectively. These are **Euclidean section projections only**. A true caustic of a Lorentzian cosmology is not generally identical to the projected Big Bang longitude. Chirality cannot be inferred from a static sky curve.

## 4. Exact gravitational-lensing control
For a standard normalized positive point lens strength m>0 with constant quadrupolar external shear 0<γ<1, write
```math
β_x=(1−γ)x−mx/(x²+y²),   β_y=(1+γ)y−my/(x²+y²).
```
For β=(b,0), two axial image solutions always exist:
```math
x_±=[b±sqrt(b²+4(1−γ)m)]/[2(1−γ)], y=0.
```
An extra pair is x=−b/(2γ), y_±=±sqrt[m/(1+γ)−b²/(4γ²)] and exists iff |b|<b_c=2γ sqrt[m/(1+γ)]. For m=1,γ=0.2, b_c=0.36514837; the image count switches between 2 and 4. **This is a counterexample to equating loss of a fold pair with total stellar invisibility.** Near caustics an image may brighten. This standard lens is a comparator, not a derived Cruller polarization response.

## 5. Survey angular statistic
A generic narrow-band *search template* is |arcsin(n·a_axis)−δ0|<w. For a uniformly sampled full sky, and |δ0|+w<π/2, its area fraction is p=cosδ0 sin w. An illustrative δ0=25°, w=2° occupies 3.16297% of the sky (~1305 deg²). No Cruller derivation specifies these values.

For a survey pixel/time bin i, expected event counts can be parameterized as
```math
λ_i=N_eligible,i ε_i [r0_i + A K_i(a_axis,δ0,w,t)].
```
The actual Rubin footprint, heterogeneous cadence, source classifications and recovery efficiency must be measured. In a previous synthetic sensitivity scenario with 1000 candidates, a toy southern mask placed ~4.19% of accessible sky inside the band, and a *postulated* twofold candidate-event rate there gave a fixed-template nominal Z≈6.08. This is **not a Rubin significance or forecast**; parameter scanning, correlated failures, incomplete coverage and temporal selection erode it. Hypothesis parameters must be independently derived/preregistered and assessed on withheld data.

## 6. The missing physical bridge
A true mechanism requires a gravitationally polarized finite-core response P giving conserved δT_μν[P], a consistent Lorentzian metric solving Einstein constraints, observer and source histories, all null-path solutions, and the screen Jacobi matrix D_AB whose determinant vanishes at caustics. Crucially, total stellar optical flux must be computed across *all* paths, delayed source histories, amplifications and losses, then compared to epoch-specific detection limits. A local caustic is not a blackout. An inward orientation and left-handed flow do not themselves imply a chirally signed optical effect: a source stress/rotation, transport rule and observable time ordering are needed.

## 7. Prospective Rubin tests and failure conditions
Use repeated multi-band exposures and independently confirmed historical-modern counterpart matches. Build empirical selection functions with injection-recovery, survey mask and observing epoch; control crossmatch artifacts, variable stars, proper motion, dust, crowding, plate defects and transient instrumental sensitivity. Test angular correlation, ring/band templates, temporal propagation, astrometric shear, image parity, magnification and wavelength behavior. Compare against matched null catalogs and assess look-elsewhere corrections. A genuine hypothesis must specify sky location, angular width and event chronology **before** scoring those features in a held-out candidate set.

## 8. Conclusion
A toroidal inner ring projects to a location-dependent family of sky curves; a simple gravitational shear lens changes image multiplicity but preserves other images. These rigorous results enable an honest survey-design stage without claiming a discovered phenomenon. Predicting disappeared-star distribution from H(s)H requires a native metric, constitutive gravitational response, full optical propagation and flux forecast. Null survey results would constrain the particular candidate signal, not independently invalidate unrelated features of the framework.

## Sources
- Rubin Observatory, [LSST overview](https://rubinobservatory.org/for-scientists/rubin-101/the-legacy-survey-of-space-and-time-lsst).
- Villarroel et al., [VASCO, arXiv:1911.05068](https://arxiv.org/abs/1911.05068).
- SAT/H(s)H internal, `WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_CRULLER_BIG_BANG_INNER_LONGITUDE_FINITE_CORE_STRETCH.md`
- SAT/H(s)H internal, `WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_RUBIN_PROJECTED_INNER_RING_OFFAXIS_GATE.md`
- SAT/H(s)H internal, `WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_POLARIZATION_NULL_CAUSTIC_GATE_CALCULATED.md`
