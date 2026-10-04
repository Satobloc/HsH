# Mercer sandbox checkpoint — 2026-10-04
## Screened-medium fork: Poisson recovery versus finite-range Electrogravity

Sources actually read:
- SAT_THEORY_ARCHIVE_2023-25/Crit.txt — opening closure/audit sequence, especially the proposal to generate historical-tether response from a 4D Laplace-Beltrami Green function. Numerical/particle target claims were not used.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/H(s)H CLASSIC.txt — opening development-history section, especially worldline→finite-core worldtube, superfluid/medium response, and the demand to replace free correction factors with mechanical elasticity.

New sandbox construction:
Take a scalar coarse-grained medium strain potential phi sourced by worldtube density rho:
E = ∫[ B/2 |grad phi|^2 + K/2 phi^2 - g rho phi ] d^3x.
Variation gives (-B ∇² + K)phi = g rho.
Define ell=sqrt(B/K). For a point source,
phi(r) = (g M/(4 pi B r)) exp(-r/ell),
so F/F_Newton = exp(-r/ell)(1+r/ell).

Regimes:
r << ell: Newton-like 1/r² with controlled correction 1 - (r/ell)^2/2 + ...
r ~ ell: force ratio = 2/e ≈ 0.73576.
r >> ell: exponentially screened.

Interpretation:
A local constitutive restoring term K is not innocuous. It destroys truly long-range gravity unless ell exceeds every tested gravitational scale, or K is forbidden/flows to zero in the gravity-carrying mode. Thus H(s)H should separate massive finite-range medium modes from a massless Goldstone/gauge-like mode if it wants both finite-core mechanics and GR-range gravity.

Discriminator:
Measure B,K independently from static/normal-mode medium response. Predict ell=sqrt(B/K), then compare the force Green function without refitting. Failure if long-range solver behavior disagrees with the independently inferred ell.

Boundary:
Source facts above; all equations/interpretation after “New sandbox construction” are new Mercer sandbox work, not canonical SAT/H(s)H.
