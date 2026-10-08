# Orson Vay | OV-20261008-07 | Contact-resolution tomography

Date: 2026-10-08. Status: SILOED SANDBOX, not canonical physics.

## Sources actually read
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THOUGHTS — from scratch .txt: first 34,000 characters of 179,450. Nathan's physically extended worldlines, nested helices, particle-observation and timesheet proposals. The file also includes generated assistant prose; do not promote that prose as evidence.
- Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt: first 28,000 characters of 235,200. Euclidean 4D arena, UI and finite-thickness resolving region.
- Satobloc/HsH/WORKSPACES/ORSON_VAY/OV_20261008_05_CORE_SLAB_CHECKPOINT.md: complete; finite-core 4D tube and connectedness transition.
- Project front door, Common Reference Desk, HSH_RESOURCES Toolkit index, Tool Chest, toolkit digestion, preferences BOOT and opening of War Room declaration. Declaration-linked resource list reviewed as routing. No PRIOR_ART accessed.

## Exact new mathematical result

For a circle of radius R with a 3-ball normal core of radius a in Euclidean 4D, and a resolving slab of half-width H>a, let q=sin(tilt), q_c=(H-a)/R, d=R*q+a-H. At first contact d=0, the angular contact profile is d-B*phi^2, where B=(R*q_c+a*q_c^2)/2.

The leading LOST swept boundary three-measure is K_s * max(d,0)^(3/2), with K_s=16*pi*a*(R+a*q_c)/(3*sqrt(B)). The leading LOST bulk four-volume is K_b * max(d,0)^(5/2), with K_b=32*pi*a*(R+a*q_c)/(15*sqrt(B)).

After normalization by full swept shell area 8*pi^2*R*a^2 and tube 4-volume 8*pi^2*R*a^3/3, their coefficients A_s,A_b satisfy A_b/A_s=6/(5*a), with inverse-length units.

Introduce actual apparatus contact jitter: d_actual=d_nominal+sigma*Z, Z standard normal. The mean of an ideal power-law channel A_p*max(d_actual,0)^p is G_p(d,sigma)=A_p*sigma^p*E[max(d/sigma+Z,0)^p].

At nominal contact d=0:
G_p(0,sigma)=A_p*c_p*sigma^p,
c_p=2^(p/2-1)*Gamma((p+1)/2)/sqrt(pi).

Thus finite jitter rounds the sharp observed onset and gives a nonzero mean response even slightly before nominal first contact. However, varying calibrated apparatus jitter sigma at nominal contact yields a log-log slope p=3/2 for boundary coupling or p=5/2 for bulk coupling in the local asymptotic regime.

For a mixture G=w_s*G_1.5+w_b*G_2.5, the effective log slope is (1.5*U_s+2.5*U_b)/(U_s+U_b), where U_s=w_s*A_s*c_1.5*sigma^1.5 and U_b=w_b*A_b*c_2.5*sigma^2.5. With any nonzero shell gain, the asymptotic small-sigma slope is 1.5. Intermediate slopes do not uniquely identify a core dimension.

## Scripted verification

Arbitrary geometry R=1,a=.12,H=.15: q_c=.03, B=.015054, A_s=14.464796196955035, A_b=144.6479619695504. Gaussian constants c_1.5=.4300199936622598, c_2.5=.6166342189968438. Quadrature across 13 widths gives slopes 1.5 and 2.5. At sigma=.001, shell response .00019669846349, bulk response .000002820589861.

Independent exact tube cap integrals at d=.00001 agree with leading asymptotic within 0.018%. Seeded 1,000,000-draw Monte Carlo at sigma=.002 agrees with quadrature within 0.47 standard errors for shell and 0.10 for bulk.

Illustrative mixed gains w_s=.005,w_b=.995 yield crossover sigma=.00035043538, not a fitted physical value.

## Failure conditions / next cursor

This is a detector-alignment model, NOT a topological change in the underlying tube. Requires quadratic tangency, spherical core, specified support coupling, independently calibrated jitter, known contact location, and a sufficiently local asymptotic range. Background, offset uncertainty, anisotropy, other coupling laws and non-Gaussian or correlated jitter can defeat inference. No particle labels or historical constants used as targets.

Next: integrate the exact tube cap measures over jitter (rather than asymptotic power laws) and fit synthetic mixed channels jointly for support weights, contact offset, background, and jitter width. Test identifiability against a pure single-channel model.

Reproduction script: orson_contact_resolution_solver.py, generated in task sandbox. No HSH_RESOURCES theory import.
