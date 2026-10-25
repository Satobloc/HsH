# Morrow | Real NICER pulsar angular acceleration and historical B correction | 2026-10-25

Status: REAL-DATA NUMERICAL KINEMATICS PASS; HISTORICAL ALGEBRA CORRECTED BY LATER SOURCE; SAT THRESHOLD UNVERIFIED; NOT A FINITE-CORE H(s)H CANDIDATE.

Systems: two actual neutron stars, PSR J0030+0451 and PSR J0740+6620. No invented system, radius, spin or scale.

Observed inputs:
- J0030 NICER equatorial radius R=13.02 (+1.24,-1.06) km (68% credible interval); Fermi 3PC f=205.53069590132813 Hz, fdot=-4.298048950616589e-16 Hz/s.
- J0740 NICER/XMM equatorial radius R=12.49 (+1.28,-0.88) km (68% credible interval, Salmi et al. 2024); Fermi 3PC f=346.5319913163530 Hz, fdot=-1.463988438662402e-15 Hz/s.
- CODATA 2022 c=299792458 m/s exact, lP=1.616255(18)e-35 m, tP=5.391247(60)e-44 s.

Sources:
https://ntrs.nasa.gov/citations/20210010694
https://doi.org/10.3847/1538-4357/ad5f1f
https://fermi.gsfc.nasa.gov/ssc/data/access/lat/3rd_PSR_catalog/3PC_HTML/J0030%2B0451.html
https://fermi.gsfc.nasa.gov/ssc/data/access/lat/3rd_PSR_catalog/3PC_HTML/J0740%2B6620.html
https://physics.nist.gov/cuu/pdf/wall_2022.pdf

Recovered SAT math:
- 2026/ELECTROGRAVACOUSTICS.txt blob 4085e071d4804fd3313a0c01a7ca7e9aa62d76dd contains assistant-formalized false equality B=4*pi/3 approximately 0.2387, vcrit=Bc.
- Later 2026 MATH REVAMP TAKE 1.txt blob 399e194475ba55294202ea175b9f5d56f227c3c5 states B=3/(4*pi) and explicitly says B is NOT derived there.
- Random SAT HYPERFOAM THEORY/COLLECTED REFINEMENTS.txt blob 01b6a27da8a0b9bb6b519e463eafa1ae80e3892d also spells out three divided by four pi, plus fractalscope/Indicatrix winding.
- HsH Meridian orbital winding angle metric gate 2026-10-11 blob 2919fc44fd761d3762fd7df34c7574c338b52f7b distinguishes atan(beta), acos(beta), atanh(beta).
- Random HsH SAT Math Extension.txt blob aadf275de914f941298951d7d34205dd4e90dc33 has early assistant-proposed theta4 optics and homogenization correspondences, not validated laws.
- TENTATIVE SAT Gravitational Nanostructure March 7 2026 blob b1ef79451913d5602e9d6ce48cc592d0a9bcbd97 has l_c/Sigma_t fractalscope without executable unique kernel.

Corrected exact equality: B=3/(4*pi)=0.238732414637843; 4*pi/3=4.188790204786391, not 0.2387. B is a dimensionless candidate; equating beta=v/c numerically to a physical angle needs a separate derivation.

Reproducible calculations (R in m, f in Hz, fdot in Hz/s):
omega=2*pi*f
beta=omega*R/c
phi_E=atan(beta)
a_c=omega**2*R
a_t=2*pi*R*fdot
fcrit=B*c/(2*pi*R) [conditional asserted historical threshold, NOT derived]
Planck units: R/lP, f*tP, a_c*tP**2/lP.

Results:
J0030: beta=0.0560850152594 [0.0515189541092,0.0614264452841] (68% radius propagated); phi_E=3.21007169576 deg; a_c=2.17132136841e10 m/s2; a_t=-3.51610802969e-11 m/s2; conditional fcrit=874.865400104 Hz [798.790147921,952.403637906].
J0740: beta=0.0907120408835 [0.0843208002128,0.10000839095]; phi_E=5.1832311162 deg; a_c=5.92118790738e10 m/s2; a_t=-1.1488939799e-10 m/s2; conditional fcrit=911.989392262 Hz [827.214779183,981.115203217].

Both measured systems are below B throughout reported radius intervals; this does NOT test a crossing or prove the threshold. Their equatorial circular-coordinate centripetal acceleration is enormous despite tiny measured angular spin-down. This is a kinematic reference, NOT measured proper GR acceleration or proof about timewave propagation.

Uncertainty: NICER radius credible intervals are not Gaussian sigma bars. Radius uncertainty dominates derived quantities; Fermi frequency errors negligible. No posterior covariance or full Kerr geometry modeled.

Verification gates: algebra PASS for corrected B equality / FAIL for old expression; dimensional and numerical PASS; limiting behavior PASS; CODATA 2022 versioned inputs PASS; SAT B physical derivation OPEN; independent prediction NONE; finite-core topology NOT TESTED; fractalscope scaling kernel UNRESOLVED; cross-sector candidacy NOT ESTABLISHED. No BEDROCK promotion.

Reading round: BEDROCK.md SHA 4cabda482c48c217614b868a2138409275df9bf7 full 86946 chars / 563 lines retrieved, applicable sections reviewed. STATE_OF_THE_THEORY.md SHA b5958a1056c2541f00ab4f3477d8acc32426cfe9 full 11012 chars / 155 lines retrieved. Real secrets.randbelow random selection from six eligible SAT/HsH documents: HYPERFOAM COLLECTED REFINEMENTS (18045 chars) and SAT Math Extension (37716 chars), both retrieved and bounded excerpts examined. All four Mersearch request lanes showed status requested; no overwrites and no new Mersearch run; bounded connector fallback only. Prior Hale issue #472 checked: REJECTED SHA-256 mismatch, no destination file; no duplicate resubmission.

Executable Python calculation, machine-readable results, Class P figure and full 10860-byte report generated in this research turn. Full report SHA-256 abfbb3efc68cc4e9b8fbc7449822ba4be198f204f02d809eafc79f4e9f9dbdbe; script SHA-256 5acec24e420ecf548c0fed87bcbfc379b537d05447e08c133ba9851c005a8169.