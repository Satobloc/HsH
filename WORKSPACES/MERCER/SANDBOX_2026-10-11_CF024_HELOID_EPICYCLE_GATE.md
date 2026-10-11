# Mercer CF-024 | Heloid kinetic shell and epicycle gate
2026-10-11 | SANDBOXED | Mercer Calder | standard-GR mathematical fixture, no physical SAT claim.

## Primary readings and provenance
- Historical SAT: Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt, **full 67 lines**, blob 0323682e7a49278b5a76d0c6a5a7787a13eb17d6. Heloid ropes as orbital morphologies and reciprocal filament/timesheet tugs are historical proposals, not derived field laws.
- Historical supplemental: SAT ALL TOGETHER SYNTHESIS.txt, blob 86cf006ca5ebf58263552c7515a9c9d575caae37, substantial fetch but truncated, **partial**.
- HsH Sept-30: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt, **full 3,911 characters**, blob 42c1faee4e75b254a52161535d667d2d105769ae. Nathan's two-particle block-universe thought experiment distinguished from assistant speculation.
- HsH Sept-30: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt, **full 9,258 characters**, blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25. GR treated as largely standard-physics input, with microscopic mechanism open.
- Onboarding/Reference Desk, War Room Declaration, 5-Oct reference packet routing, BigBook MD/CSV, symbol registry, cross-formalism index and source boundaries consulted before calculation. Supporting resources not theory authority. Mersearch shared three-root bridge was occupied by Orson's pending request and not overwritten; no corpus-exhaustive search claimed.

## Geometry and kinetic distribution
Use G=c=1, Gaussian total energy density, scale a, ADM mass length M, eps=M/a, x=r/a:
rho=eps exp(-x^2/2)/[(2pi)^(3/2)a^2],
m(r)=M[erf(x/sqrt(2))-sqrt(2/pi)x exp(-x^2/2)].
Static metric: ds^2=-N^2 dt^2+(1-2m/r)^(-1)dr^2+r^2dOmega^2.
For p_r=0: N'/N=m/[r(r-2m)], circular v^2=m/(r-2m),
L_c^2/mu^2=r^2m/(r-3m), gamma^2=(r-2m)/(r-3m), p_t=rho v^2/2.
At each radius, a positive distributional kinetic shell has local orthonormal momenta
p^(a)=mu gamma(1,0,v cos(alpha),v sin(alpha)), uniform alpha in [0,2pi).
Let p_c=mu gamma v, n_lab=rho/(mu gamma):
F=n_lab delta(p_r)delta(p_perp-p_c)/(2pi p_c).
Then T^(ab)=integral[F p^a p^b d^3p/p^0]=diag(rho,0,p_t,p_t).
The support consists of circular geodesics, not a smooth finite-width gas.
512-angle quadrature at 12 radii/compactness samples: maximum relative moment
residual 1.32e-14; stress-conservation residual 4.34e-19.

## Dynamical gate and two scaling regimes
For E=N^2 dt/dtau, L=r^2 dphi/dtau:
(dr/dtau)^2=A(E^2/N^2-1-L^2/r^2), A=1-2m/r.
The exact proper-time radial epicycle is
kappa_tau^2=[r^2 m'+r m-6m^2]/[r^3(r-3m)].
Schwarzschild limit: M(r-6M)/[r^3(r-3M)].
Gaussian first marginal: r/a=3.3119151665, M/a=0.6266548494387946.
Nonlinear geodesic integration carries ell=ln[N(r)/N(r0)] as a state variable.
At eps=0.60: predicted period 153.2054091 a, measured 153.1968977 a
(relative 5.56e-5). At eps=0.70: kappa^2=-0.00669352867/a^2;
at tau=65a displacement amplification 101.979758 vs linear cosh prediction
101.980956, relative RMS error 8.32e-6. First-integral residual <1.2e-15.

Exact homology a->lambda*a, M->lambda*M: eps and v^2 unchanged,
rho,p_t scale lambda^-2, kappa scales lambda^-1. Test lambda=10:
rho ratio 0.01, frequency ratio 0.1. At fixed M=0.6, varying a=2,1,0.8
instead changes eps=0.3,0.6,0.75: stable, stable, unstable at same r/a.
No particle constants fitted. This is standard-GR scaling, not a novel force.

## Failure and continuation
A positive stationary delta-shell can still have unstable individual circular
orbits. This is not a proof of collective Einstein-Vlasov instability. Circular
timelike support fails at some radii beyond eps about 0.89761034. Neither
threshold is a universal SAT constant. Next: build a positive smooth stationary
F(E,L) with nonzero radial dispersion, integrate its rho,p_r,p_t and solve
the coupled Einstein-Vlasov constraints at matched ADM mass/RMS radius.
Reject distributions that violate Vlasov transport or stress constraints.
Only after that test whether an Interbraid constitutive action selects it.

Full reproducibility: local bundle
mercer_CF024_vlasov_heloid_epicycle_bundle_2026-10-11.zip
contains Python, JSON, a longer checkpoint, and three Class-P plots.
Source claims, standard GR, derivation, and conjecture remain distinct.

Mercer Calder | CF-024 | SANDBOXED
