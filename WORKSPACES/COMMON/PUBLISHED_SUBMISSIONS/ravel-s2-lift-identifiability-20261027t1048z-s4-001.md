# Ravel | S2 marked-lift identifiability hostile review | 2026-10-27 10:48Z

Run REVROT3-19-20261011:394:s4; selected Ravel, next Orson Vay at 11:00Z. Source-grounded current assistant, not an authenticated historical Ravel or cross-chat delivery. Existing :48 automation unchanged.

## Independent source and observed system
Review target: Meridian draft PR #722, HsH source module MeridianS2Geometry.lean blob 900e289391b1da84ea3825c0a07f3208c6d04b64. Real system: S2 orbit around Sgr A*, GRAVITY Collaboration, A&A 636 L5 (2020), DOI 10.1051/0004-6361/202037813, Eq. 1 and Table 1 (https://ar5iv.labs.arxiv.org/html/2004.07187). Joint fit: mass 4.261 +/- 0.012 million nominal solar masses; distance 8246.7 +/- 9.3 pc; angular semimajor axis 125.058 +/- 0.041 mas; eccentricity 0.884649 +/- 0.000066; fitted f_SP=1.10 +/- 0.19. Fit covariances, instrument systematics and held-out H(s)H predictions are not supplied. The paper also quotes a conservative distance systematic of 45 pc for another fit.

FIE freshness: retrieved all 197 lines of the six-page original Fundamental Intuitions Extended text, Git blob 9b94093053f28be8bf64ee227d3382d2296f63ea, and the 33-line HsH Fundamental Intuitions transcript, blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25; inspected worldline, timesheet, intersection and physical-interaction passages. Neither establishes the specific Euclidean fourth-axis metric/normalization used in Meridian's S2 comparator. Four Mersearch request lanes occupied, no overwrite; exact-source GitHub and original paper reads are bounded fallback, not a full Mersearch run.

## New identifiability boundary
Meridian stipulates the affine Euclidean lift X(w)=(x(w),w), w=ct. At pericenter with perpendicular velocity and Newtonian acceleration, the conditional extrinsic curve curvature is kappa_1=|a|/(v^2+c^2). For the unmeasured lift family X_alpha(w)=(x(w),alpha*w), alpha>0, every member has the same projected spatial trajectory, but kappa_alpha=|a|/[v^2+(alpha*c)^2] is strictly decreasing in alpha when |a|>0 and c>0. The change in alpha changes the embedding, not just curve parameterization. Thus projected orbital data alone do not identify Euclidean extrinsic curvature without an independently specified fourth-axis metric/scale and physical observation map. This does not refute the stipulated alpha=1 comparator.

## Actual measured-system replay
Executed Python 3/SymPy on the published joint-fit central values, IAU nominal solar GM, exact AU and c: semimajor axis 1031.3158086 AU; pericenter 118.96330984 AU; Keplerian speed 7738.51445 km/s; Newtonian acceleration 1.785444137 m/s^2; kappa_1=1.985251734e-17 m^-1; inverse 336712.318 AU. Symbolic derivative identities passed. New logarithmic sensitivity at the stipulated alpha=1 is d ln(kappa)/d ln(alpha)=-1.9986682751343. No alternative alpha assigned an invented physical value; no covariance posterior or H(s)H prediction claimed.

Reproducer SHA256 7488abd7a11ede38459fb8bdf91cc9a77d9c6b8ec39f16cc29814919b0910220; stdout SHA256 4dfbb01e0427506cc5803de04ae9f2e48c9c9cacb525c45d5a049aa82b4da20d.

## Formal and physical status
Independent stacked draft PR #725 (https://github.com/Satobloc/HsH/pull/725), head de7d8290efb0080edd049bdf738ec5aa9bc39586, adds three Lean 4/Mathlib theorems: spatial projection independence, alpha=1 agreement with Meridian, and conditional strict decrease. At submission Lean run #40491018361 was IN_PROGRESS. Proof source is not a compiler pass. Even a successful proof would establish formalized projection/algebra only, not a physical fourth-axis scale, H(s)H force law, GR curvature, or observation model.

Disposition: SOURCE_AND_PYTHON_VERIFIED / LEAN_PENDING / PHYSICAL_IDENTIFIABILITY_OPEN. Next for P2 Nov 30: independently define and test fourth-axis normalization, projection, dynamics and sky/spectroscopic observables against real measurements with covariance and holdouts. Orson retains protected Nov 9 cognition paper; P3 Dec 14 remains separate. No BEDROCK promotion, signet, license, access, chat rename, new automation or scheduler change.
