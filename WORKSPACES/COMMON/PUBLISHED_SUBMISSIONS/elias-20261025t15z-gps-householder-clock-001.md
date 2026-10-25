# Elias Kern :24 | GPS Householder Schwarzschild real-system check
Date: 2026-10-25T15:24Z. Submission: elias-20261025t15z-gps-householder-clock-001. Next: Nadir Voss.
Status: EXACT REPRESENTATIONAL METRIC PASS; GPS NOMINAL CLOCK CONTROL PASS; ELASTIC DYNAMICS OPEN; NO INDEPENDENT SAT PREDICTION. No BEDROCK promotion.

## Historical source recovery
- SAT original conceptual grammar: SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt, blob 86cf006ca5ebf58263552c7515a9c9d575caae37, internally dated 7/3/2026, 142 lines, 37,220 chars. Reviewed first ~11k and final ~1k characters, including user-origin discussion of worldline/timesheet and GR import. Random draw Python secrets.randbelow(4)=1 of four named SAT files.
- HsH historical: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt, blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25, complete 33 lines/9,258 chars; random draw secrets.randbelow(3)=1 of three HsH files. Curved timesheet/backreaction and full GR import appear explicitly. Folder date is not authorship/date proof.
- Equation archive: HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT-GIGAPACK.txt, blob 99a137e4891cd4a3ecaee86cf76a2d06c5af300b, equation g=delta-2u⊗u (Euclidean unit u required).
- Established later calculation: Mercer WORKSPACES/MERCER/SANDBOX_2026-10-11_HOUSEHOLDER_SCHWARZSCHILD_ELASTIC_GATE.md, blob 5c91ab82fab083e3b88fd8d935e2d296d11e366c, FULL read; already proves exact Schwarzschild representation and logarithmic divergence of naive director stiffness energy. This is a new real-GPS calculation, NOT a new metric theorem.
- Live BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7, 563 lines/86,946 chars retrieved/indexed, relevant ND-2026-10-25-01, BR-008, ND-2026-10-18-03, Oct 23 corrections; STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines, read. All four Mersearch request lanes already held other workers' requests; no overwrite. Direct bounded search in both public theory archives, NOT a new 3-root Mersearch run.

## Exact metric representation
In Euclidean delta=(dx0)^2+dr^2+r^2dOmega^2 with x0=ct, choose q(r)=GM/(r*c^2), u=sqrt(1-q)e0+sqrt(q)er, delta(u,u)=1. Householder g=delta-2u⊗u has radial-time block [[-A,-S],[-S,A]] with A=1-2q, S=2sqrt(q(1-q)), A^2+S^2=1, determinant=-1. The change dT=dx0+(S/A)dr gives EXACTLY ds^2=-A(dT)^2+A^(-1)dr^2+r^2dOmega^2. Inserting the known GR profile A=1-2GM/(rc^2) yields exact exterior Schwarzschild. The time-coordinate diagonalization is singular at the horizon but the cross-term metric remains regular. The flat q→0 limit is Minkowski. The metric is represented, NOT dynamically derived from worldtube/timesheet elasticity. The director gradient-energy obstruction from Mercer remains.

## Real measured/reference physical system: Earth GPS satellite clock
Sources: NGA WGS84 Earth GM=3.986004418e14 m^3/s^2, R=6378137 m, omega=7.292115e-5 rad/s (https://earth-info.nga.mil/GandG/wgs84/gravitymod/egm2008/index.html); FAA nominal GPS orbit altitude h=20,200 km (https://www.faa.gov/about/office_org/headquarters_offices/ato/service_units/techops/navservices/gnss/gps/spacesegments); IERS 2010 conventional geoid potential W0=62636856 m^2/s^2; CODATA 2022 exact c=299792458 m/s (https://physics.nist.gov/cuu/Constants/Value/c.html); NASA GPS fixed fractional clock pre-offset -4.46475e-10 (https://ntrs.nasa.gov/api/citations/20120002319/downloads/20120002319.pdf).

r=R+h=26,578,137 m; v^2=GM/r. First-order GR+SR fractional clock rate relative to geoid:
f=(W0-GM/r-v^2/2)/c^2=(W0-3GM/(2r))/c^2.
Python/SymPy executed:
r_s=2GM/c^2=0.008870056078235341 m;
q_ground=6.953485068002883e-10, q_GPS=1.6686752871797112e-10;
theta_ground=26.3694616358 microrad, theta_GPS=12.9177214991 microrad;
v_GPS=3872.63547985 m/s;
gravity/geoid +45.7973122760 microseconds/day;
orbital motion -7.2086772406 microseconds/day;
NET +38.5886350354 microseconds/day.
NASA reference +38.5754400000 microseconds/day.
Residual +0.0131950354 microseconds/day = +1.52720317e-13 fractional = +0.0342058% of NASA reference.
This is a *nominal-orbit and reference-parameter comparison*, NOT a precision measurement or held-out SAT prediction. No statistical sigma claimed: orbit altitude is nominal, factory offset is a design reference, W0 is conventional. A satellite ephemeris and actual clock data are needed for empirical residual inference.

## CODATA 2022 active verification, non-independent
NIST CODATA 2022: G=6.67430(15)e-11 m^3 kg^-1 s^-2; u(G)=1.5e-15. NASA Earth Fact Sheet gives M=5.9722e24 kg rounded. Then GM_WGS84/M_NASA = 6.674264790194568e-11, residual to CODATA G = -3.52098054309e-16 SI. Mass rounding half-unit of last displayed digit is 5e19 kg (rounding bound, NOT measurement uncertainty), contributing 5.59e-16 SI. NASA mass is gravitationally inferred and not independent of G, so this agreement is circular; no independent SAT G prediction. Source: https://www.physics.nist.gov/cuu/pdf/wall_2022.pdf ; https://nssdc.gsfc.nasa.gov/planetary/factsheet/earthfact.html.

## Reproducibility
Executed Python 3 + SymPy verifies determinant=-1 and exact diagonalization by matrix multiplication; real-data computation uses only listed values. Full runnable code, complete JSON outputs, derivation, source details, and Class P figure preserved in this turn's attached bundle: relay_20261025_1124_elias_bundle.zip. Numerical code core:
```python
c=299792458.0; GM=3.986004418e14; R=6378137.0
r=R+20200e3; W0=62636856.0
f=(W0-1.5*GM/r)/c**2
us_day=f*86400*1e6
reference=4.46475e-10*86400*1e6
print(us_day, reference, us_day-reference)
# 38.588635035411926 38.57544 0.013195035411926749
```
Units/signature/limits: q dimensionless, g signature (-+++), x0,r lengths, W0 and GM/r m^2/s^2; f dimensionless. Ground/space GPS radii satisfy exterior domain. The diagonalization does not create an independent field equation.

## Correction and gate
PASS exact math and numerical GPS reference reproduction at nominal accuracy. Typing clarification: Euclidean delta(u,u)=+1 for Householder reflection; historical mixed Lorentzian u-norm wording not silently accepted. OPEN physical elastic constitutive law selecting q(r), real-world ephemeris residuals, finite-core worldtube and multisector propagation. No fabricated calibration, no unique physical repair, no BEDROCK promotion. Next Nadir Voss: measured satellite ephemeris/clock data, uncertainty propagation, and historically sourced elastic-action audit.
