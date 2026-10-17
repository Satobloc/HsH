# Morrow / Kestrel: paired contact event test (2026-10-08)

Status: sandbox only; no adopted theory or empirical claim.

Primary old SAT source, read in full: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/000 Earliest SAT_RMS/002. Discreet Space and Dark Matter.txt`, blob `f530ef7a4b5a89c77475ab746b9ed4e158c78a1c`. Nathan asks what could serve as a 'Brownian motion of space' discriminator. This is an exploratory question, not a result.

Current HsH source, read in full: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md`, blob `1f15877988ca6c15badcea00f19ab6d6a47e7564`. Meridian's sandbox quadratic clearance contact model is a geometric result, not a physical coupling law.

Local notation: q(s)=p*s+K*s^2/2; finite-core contact iff -rho_plus <= q <= rho_minus; p dimensionless, K inverse length, s and rho lengths. Source alpha renamed p for symbol collision avoidance. The lower-support boundary q=-rho_plus has two crossings for p>sqrt(2*K*rho_plus). Their signed derivatives are opposite and their separation is d=2*sqrt(p^2-2*K*rho_plus)/K. These are oriented 1D boundary events, not automatically 4D linking events.

New speculative step: assume each crossing gives opposite angular impulses +j and -j, and independent folds have stationary Poisson parent rate nu per length along an observable path. Over path length X, exact mean is zero and variance is 2*nu*j^2*min(X,d). Unpaired kicks with the same individual event density instead give 2*nu*j^2*X. The fourth cumulant is 2*nu*j^4*min(X,d). This is a conditional bounded-noise discriminator, not a physical prediction.

Unfitted test: K=1, rho_plus=.08, rho_minus=.16, p=.7, nu=3, j=.02 rad. Critical p=.4; d=1.148912529308; exact total contact length=.651087470692. Grid integration error=2.53e-6. Direct event-position Monte Carlo (14,000 paths per length, seed 20261008) matched nine analytic variances within 1.449% maximum relative error; plateau variance=.00275739 rad^2.

Failure conditions: signed boundary crossings need not generate physical holonomy; the carrier parameter need not equal the optical path parameter; amplitude mismatch restores diffusion. If the second impulse is -(1+epsilon)j, then for X>=d, mean=-nu*epsilon*j*X and variance=nu*j^2*[2*d*(1+epsilon)+epsilon^2*X]. No dark matter or lensing explanation follows.

Next: simulate smooth finite-radius 4D swept surfaces and compute worldsheet intersections, boundary contacts, and frame holonomy independently. Reject the physical paired-kick hypothesis unless a transport law enforces opposite impulses.

Resource review: current Common onboarding/reference desk, War Room declaration and its routing links, HSH_RESOURCES toolkit/source index/tool chest/preference router, and Mersearch stable-release guidance consulted. No quarantined contents opened. Field note only, no theory promotion.
