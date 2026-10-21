# Addendum 04 — Statistical midpoint and S³ angular projection comparison
**Date:** 2026-10-21. **Status:** SANDBOXED, alternative distribution explicitly announced.
**Parent:** Cruller/Rubin visibility R0.
## Native rule versus proposed distribution
Use four-positive Euclidean ambient geometry, Planck units c=hbar=G=1, with local worldtube directions u and surface normal n satisfying |u|=|n|=1. Signed normal component q=u·n=cos(theta). Unit total speed is NOT the same as unit normal projection. Forest normalization and cw=t remain project native conventions; this document makes no claim to reproduce their full constitutive distribution.
## Announced alternative model A: isotropic outward S³ hemisphere
As a comparison only, sample u uniformly with respect to S³ area measure, conditioned on u·n>=0. Then q in [0,1] has density p(q)=4/pi sqrt(1-q²). Derivation: an unconditioned coordinate of uniform S³ has density 2/pi sqrt(1-q²) on [-1,1], doubled for the positive half.
Exact:
E[q]=4/(3pi)=0.424413181578;
E[q²]=1/4;
Var(q)=1/4-16/(9pi²)=0.069873451303;
SD(q)=0.264335868362.
If the vacuum/time channel is H+q_i and material channel H for each pairing in a shared orientation, per-pair midpoint is H+q_i/2, centered pair values +/-q_i/2, ensemble means +/-2/(3pi)=+/-0.212206590789 and SD per branch 0.132167934181. This is NOT +/-1/2 because the differential is a projected unit trajectory rather than a fixed c. If a physical Forest result instead implies a fixed c differential, centered means remain +/-1/2 exactly, while fluctuations can reside in a common-mode variable or different transport components.
## General statistical rule, distribution-free
For paired channels V_i,M_i, midpoint m=(E[V]+E[M])/2, centered mean +/-Delta/2 with Delta=E[V]-E[M]. This equality does not fix Delta. Difference variance Var(V-M)=Var(V)+Var(M)-2Cov(V,M); midpoint estimator variance Var((V+M)/2)=[Var(V)+Var(M)+2Cov(V,M)]/4. Correlation and sampling conditions must be derived from actual shared trajectories, not assumed independent.
## Important geometry gate
Uniform S³ angular distribution is an explicitly announced null, not an inferred SAT worldtube distribution; antipodal conditioning assumes an outward hemisphere chosen by a surface normal. Physical material trajectories, drift, sources and surface orientation may be anisotropic; a native radial geometry might enforce q=1, giving +/-1/2. Distinguish normal projection from path-length averaged velocity, and pointwise conditional speeds from Hubble recession and lapse mapping.
## Computation
Analytic S³ integrals and numerical evaluations executed via Python/SymPy/NumPy. Figure generated: forest_S3_projection_2026-10-21.png in originating conversation. No empirical model or cosmological amplitude is inferred.
