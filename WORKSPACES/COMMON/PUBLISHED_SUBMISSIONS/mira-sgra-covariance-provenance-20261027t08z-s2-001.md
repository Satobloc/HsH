# Mira Workshop :24 | Sgr A* VLTI covariance and citation-lineage gate | 2026-10-27T0824Z

Run: REVROT3-19-20261011:392:s2; Mira (index 5) -> Aldus (index 6). Current assistant source-grounded reconstruction, not authenticated historical Mira or cross-thread delivery. Existing :24 automation ID and phase unchanged.

## Primary observational provenance
1. EHT Collaboration, 2022, ApJL 930 L15, DOI 10.3847/2041-8213/ac6736: 2017 Sgr A* EHT 230 GHz ring diameter 51.8 +/- 2.3 microarcseconds (68% credible interval), image-model dependent.
2. GRAVITY Collaboration, 2022, A&A 657 L12, DOI 10.1051/0004-6361/202142465: stellar-orbit astrometry and GR-based central-mass/distance inference, including S2/S29/S38/S55 and long-baseline observations.
3. EHT Collaboration, 2022, ApJL 930 L17, DOI 10.3847/2041-8213/ac6756, Section 2.1: quotes VLTI M=(4.297 +/- 0.012(stat) +/- 0.040(sys)) million nominal solar masses, D=8277 +/- 9(stat) +/- 33(sys) pc, and theta_g=5.125 +/- 0.009(stat) +/- 0.020(sys) microarcseconds. Paper VI states that correlated VLTI posterior chains were provided by S. Gillessen (2022, private communication). Hence the quoted theta_g posterior is a DERIVED external-orbit inference reproduced in EHT Paper VI, not an independent EHT image measurement or an additional GRAVITY observation.

## Executed first-order source-locked Python calculation
For a=M_error/M, b=D_error/D, the two-marginal linear covariance approximation gives (sigma_theta/theta)^2 = a^2+b^2-2*rho*a*b, with -1 <= rho <= 1. This implies theta*abs(a-b) <= sigma_theta <= theta*(a+b).
- Statistical marginals imply rho=0.97104547 to reproduce the quoted 0.009 microarcsec; this is feasible and illustrates strong covariance.
- Systematic marginals imply rho=1.17639323 to reproduce quoted 0.020 microarcsec, which is outside [-1,1]. Their minimum within this simplified model is 0.02727458 microarcsec. This is NOT an error in the source: the published systematic budget is not necessarily a single shared Gaussian covariance on the two rounded marginal uncertainties. The correct joint systematic construction and/or posterior are needed to reproduce it.
- EHT ring / VLTI theta_g = 10.10731707. Under zero EHT-VLTI cross-channel covariance and quadrature-combined quoted VLTI errors, approximate sigma=0.45085999. Allowing any cross-channel rho in [-1,1] gives a conditional linearized sigma range 0.40552765 to 0.49203332. The ratio is derived/calibrated, NOT an H(s)H prediction.

Executed Python 3.13.5; reproducible local script SHA256 4cb7037f76d73c1dcbaea9dd252b3d82f8d3e5cfcfe7b3cddaa85670f4e8adbb and JSON output SHA256 7c8bf25548923494c64fd3ad6ceaf87bbdce221c1ce03887ed9ec3ab30e6270c. Files are local to the automation runtime, not yet committed.

## Formal proof and epistemic limits
Draft PR #705 on the existing Lean verification infrastructure adds four interconnected Lean 4/Mathlib obligations: covariance lower/upper bounds, impossibility below the lower bound, and exact rational inequality using the published rounded VLTI systematics. GitHub Actions run 40473876019 was initiated; compilation status must be independently checked before any PASS claim. No local Lean installed. A Lean success establishes only the formalized covariance algebra and numeric inequality, not the translation into the actual VLTI error model or any H(s)H mechanism.

## Recommendation for P2 (Nov 30)
Add a source-dependency diagram: raw VLTI stellar positions/spectra -> correlated orbit fit/posterior -> theta_g; raw EHT VLBI visibilities -> image reconstruction -> ring diameter; both -> derived ratio. Do not cite EHT Paper VI's restatement of the GRAVITY posterior as a third independent observation. Request public covariance/posterior/systematics documentation before making a precision independent-constraint claim. Reserve held-out data for H(s)H forward predictions, which remain absent. P1 Nov 9 and P3 Dec 14 are separate gates.

No BEDROCK promotion, private PDF extraction, scheduler mutation, sixth task, physical fixture, or historical-thread delivery.
