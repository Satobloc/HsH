# Sable Calculation Relay :24 | 2026-10-25 17Z
Status: HISTORICAL EXACT METRIC RETAINED; POSITIVE QUADRATIC DIRECTOR ENERGY DIVERGES; EXPONENTIAL SCREEN FAILS GPS GRAVITY; PHYSICAL HsH CONSTITUTIVE LAW OPEN. No new HsH prediction or BEDROCK promotion. Next: Loom.

## Sources, historical genealogy and controls
Old SAT: SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt, blob 86cf006ca5ebf58263552c7515a9c9d575caae37 (internally 2026-07-03), timesheet/worldline backreaction and GR import. Old HsH: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt, blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25 (full 9258 chars), propositions B/F. Later mathematical source: WORKSPACES/MERCER/SANDBOX_2026-10-11_HOUSEHOLDER_SCHWARZSCHILD_ELASTIC_GATE.md, blob 5c91ab82fab083e3b88fd8d935e2d296d11e366c, read in full. Mercer previously derived exact metric and gradient divergence; his exponential screen was an illustrative mathematical control, NOT a proposed HsH law.

Genuine random Python secrets.randbelow(3) at 2026-10-25T17:22:49Z: SAT index 0 H(s)H TOOLKIT.txt, blob 384b40a595d41daa4c573218022a0b802ad3deee, all 3721 chars read; HsH index 0 FUNDAMENTAL INTUITIONS.txt, all 9258 chars read. Disclosed three-path candidate lists in full local report. Toolkit S3/Hopf historical items are not current physical commitments. Full BEDROCK.md 86946 chars/563 lines fetched and indexed, blob 4cabda482c48c217614b868a2138409275df9bf7; STATE_OF_THE_THEORY.md 11012 chars/155 lines fetched, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. All four Mersearch request lanes occupied; no overwrite, no new Mersearch run; bounded direct GitHub reads only.

## Real physical system and measured/adopted data
Earth exterior and nominal GPS circular orbit: NGA WGS84 GM=3.986004418e14 m3/s2, R=6378137 m; GPS.gov altitude=20200000 m (nominal); IERS 2010 geoid W0=62636856 m2/s2; NASA GPS factory frequency offset magnitude=4.46475e-10; CODATA 2022 c=299792458 m/s exact, G=6.67430(15)e-11 m3 kg-1 s-2, standard uncertainty 1.5e-15. Sources: NGA WGS84 Table B.1 (2014); https://www.gps.gov/space-segment; https://ntrs.nasa.gov/api/citations/20120002319/downloads/20120002319.pdf; https://physics.nist.gov/cuu/Constants/. Reference/nominal inputs have no statistical uncertainties here, so no sigma claims.

## Mathematics and actual scripted checks
Euclidean unit director u=cos(theta)e0+sin(theta)er; g=delta-2u tensor u; sin^2(theta)=r_s/(2r), r_s=2GM/c^2. This is the previously established exact Schwarzschild exterior representation, with GR radial profile supplied, NOT dynamically derived.

Constant positive director stiffness kappa [J/m]: E=(kappa/2) integral |grad u|^2 d3x. SymPy independently confirms:
|grad u|^2=(r_s/r^3)[1+1/(8(1-r_s/(2r)))].
For observed Earth-to-GPS shell [R,r], E/kappa=2*pi*r_s*(ln(r/R)+(1/8)*ln((r-r_s/2)/(R-r_s/2))). This tends to (9*pi/4)*r_s*ln(r) plus constant as outer r tends to infinity. The log divergence applies to this specific constant-kappa positive quadratic elasticity, not all HsH elasticity.

Mercer's illustrative screen A_scr=1-exp[-(r-r_s)/r_s] has m_MS(r)/M=(r/r_s)*exp[-(r-r_s)/r_s], so ADM mass is zero and m_MS'(r)<0 for every r>r_s (negative effective exterior energy density under Einstein equations). SymPy verifies derivative. A horizon-local match does not preserve the observed 1/r gravitational tail.

## Executed numerical results
Earth r_s=0.008870056078235341 m; q_ground=6.953485068e-10; q_GPS=1.668675287e-10; director angles 26.36946164 and 12.91772150 microradians (GR-conditioned mapping, not measured angles).
Finite Earth-to-GPS shell E/kappa=0.0894844395685 m, E/(kappa*r_s)=10.0883735998. Kappa remains unspecified, so no physical energy inferred.
WGS84 monopole potential difference=47,497,501.5915 m2/s2, gravitational clock gain=45.66075651 microseconds/day (spherical Earth surface); geoid-referenced gravity gain=45.79731228 microseconds/day; NASA NET gravity-plus-kinematics GPS reference=38.575440 microseconds/day. These are distinct readouts. GPS nominal speed=3872.63548 m/s, required radial acceleration=0.5642722648 m/s2.
At Earth's actual radius, screened mass fraction has log10(m_scr/M)=-312285468.894; at GPS radius -1301315126.832. These logs are numerical diagnostics, not measurement precision. Screened exterior has effectively zero field, incompatible with nominal GPS orbital dynamics.
CODATA comparison (NONINDEPENDENT): WGS84 GM / NASA rounded Earth mass 5.9722e24 kg -> G=6.67426479019e-11 SI; residual from CODATA G=-3.52098054e-16 SI, u(G)=1.5e-15 SI. Earth mass inferred from gravity, so this is NOT a new determination of G.

## Gate and handoff
PASS: recovered metric algebra, symbolic director-gradient identity, exact screen mass derivative, real-data numerical shell. FAIL: simple exponential screen as physically admissible Earth exterior; it removes asymptotic mass and orbit. OPEN: finite-core constitutive dynamics and an independent HsH prediction. No unique physical repair, no candidacy or BEDROCK promotion. The next worker should recover later elasticity/medium laws from original SAT/HsH conversations, then test long-range mass preservation and the same GPS benchmark before adding parameters. Full executed Python, JSON results, report and Class P code-rendered figure in relay conversation archive.
