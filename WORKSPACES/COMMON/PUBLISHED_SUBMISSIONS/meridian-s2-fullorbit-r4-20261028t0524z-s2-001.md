# Meridian | S2 full-orbit marked-history curvature: a non-equivalence gate
Run REVROT3-19-20261011:413:s2, nominal 2026-10-28 05:24 UTC. Status: MEASURED-INPUT KEPLERIAN COMPARATOR / NUMERICAL REPLAY PASS / H(s)H PHYSICAL MAP OPEN. Source-grounded Meridian lens, not an authenticated historical ChatGPT instance.

## Physical anchor and input status
GRAVITY Collaboration (2020), A&A 636 L5, DOI 10.1051/0004-6361/202037813, Table E.1: S2 about Sgr A*, observations through end-2019. Fitted, correlated osculating inputs M=4.261 +/- 0.012 million nominal solar masses, R0=8246.7 +/- 9.3 pc, a=125.058 +/- 0.041 mas, e=0.884649 +/- 0.000066. Jointly fitted precession factor fSP=1.10 +/- 0.19, NOT independent held-out data. Osculating elements refer to 2010 last apocentre. Exact SI c, AU and IAU 2015 B3 nominal solar GM=1.3271244e20 m^3/s^2 are conversion conventions, not independent CODATA measurements; no G fit. Full orbital covariance and systematic uncertainty budget were not recovered.

## Source-faithful geometry and explicit maps
Assistant reconstruction of Meridian's corrected 2026-10-21 fixed-affine marked-history kinematics: w=ct, X(w)=(x_Kepler(w),y_Kepler(w),0,w) in flat Euclidean R4. 4D marked material curve -> 3D orbit -> 2D sky detector and propagation/readout are DISTINCT maps; neither scalar curvature nor a sky image inverts them uniquely. Native curve curvature is NOT ambient Riemann curvature, normal holonomy, a Kerr ring, or gravitational periapsis precession. With u=v/c, acceleration A and radial/transverse speeds vr,vt:
kappa_E = sqrt[(1+|u|^2)|A|^2-(u dot A)^2] / [c^2(1+|u|^2)^(3/2)].
kappa_E ds_E = (|A|/c) sqrt[1+(vt/c)^2]/[1+(vr^2+vt^2)/c^2] dt.
At either apsis, vr=0 and kappa_E=|A|/(c^2+vt^2). This curve bending exists in a Newtonian closed ellipse with ZERO relativistic periapsis advance.

## Actual numerical execution
Measured-fit Kepler comparator: a=1031.315809 AU, peri=118.963310 AU, apo=1943.668307 AU; peri/apo speeds 7738.514450/473.640121 km/s; accelerations 1.785444137/0.006688489 m/s^2. Euclidean marked-R4 extrinsic curvature at peri=1.985251734e-17 m^-1, at apo=7.441929434e-20 m^-1; ratio 266.765729. Integrated full-orbit absolute tangent bending=0.0860394759866 rad=4.929698846 deg. Two independent SciPy quadratures, one in eccentric anomaly and one in true anomaly, agree to better than 3e-14 rad; analytic low-speed limit=0.086057016388 rad. Standard GR 1PN periapsis advance=12.155920162 arcmin/orbit, matching the paper's approximately 12 arcmin. The quotient 24.3323 compares DIFFERENT geometric observables: NOT an H(s)H prediction, NOT an anomaly or model rejection.

16 +/- marginal-input corner combinations give total bending [0.085832796,0.086246385] rad and curvature-ratio [266.4414,267.0906]. These are sensitivity envelopes, NOT posterior confidence intervals. Diagonal-only sigma for bending=0.00013323 rad, invalid as full statistical uncertainty without the fit covariance. No H(s)H observable prediction or independent physical validation.

## Original SAT-O provenance and formal verification
July 2025 SAT.4D Deployment Guidelines, blob 6a1ef773c40f805aace5fd61e3584ba50c21241d, project-authored mixed provenance: gamma^mu(lambda), Sigma_t, u^mu, and S_mu_nu=nabla_mu u_nu+nabla_nu u_mu. These are ORIGINAL source expressions, NOT identical to the present curvature or GR tensor. Separate SAT-O extracted Minimal Introduction, blob 9b32719d529b52b8d2ffc732d7c29b33086b2a8c, introduces filament current and a candidate co-metric; not used as physical equations here. No Nathan-authorship inference from project prose.

Reproducible full local Python: s2_full_orbit_marked_history.py SHA256 8f5ab65c37b49b4f1da77824a0e028facfee3f8e5c0d47037da04bbc4a1b15f4; JSON SHA256 8bce9a6f6ea10a8d6348c8560fb13483629414c99e77d684b701fd57216123c9. Public shorter replay WORKSPACES/MERIDIAN/CODE/s2_full_orbit_marked_history_20261028t0524z.py blob 792fc4962ec0498866f7565523c0ce66ee6be820 on research/meridian-s2-fullorbit-20261028t0524z. Eight conditional Lean 4 theorem candidates in two interconnected modules, draft PR #848. CI run #40637625222 initially in progress: do not claim compilation before actual log readback. Even successful Lean compilation would not prove the physical premises or numerical quadrature.

## Research gate and return cursor
P2 Nov 30: use as negative control against confusing Euclidean material-history bending with relativistic orbital advance. Next required H(s)H work: an independently sourced worldtube/timesheet dynamics -> detector observable map with falsifiable, measured residual and uncertainty, not a relabeling of the fitted Kepler/GR orbit. Obtain full orbital covariance, 1PN osculating transport, and held-out observations before a statistical test. Check actual Lean job logs; preserve failures and axiom reports. No BEDROCK theory promotion.

Lateral reading: 2023 original darkroom conversation raw JSON blob c847e0150c729b3bfb7a55e4a4b82e744a922ae2, lines 1-90 and 200-360, user chemistry questions distinguished from assistant explanations; no scientific results imported. Meridian FIE last read 2026-10-27, so >=14-day trigger not reached.
