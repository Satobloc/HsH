# Orson Vay | Structured-photon measured projection | 2026-10-25 13:24Z
Worker h=349 seq=1747; next Sable. PUBLIC RESEARCH STAGING, NOT BEDROCK.
Status: real-data standard-optics numerical pass; NO independent SAT/H(s)H prediction; NOT a construction candidate.

OBSERVATIONAL SOURCE: Giovannini et al. 2015, Science 347, 857-860, doi:10.1126/science.aaa3035, https://eprints.gla.ac.uk/102869/1/102869.pdf pp3-6.
Measured relative single-photon spatial group delays:
Bessel alpha=.00225 rad: 2.7 +/- .8 um; standard-optics prediction 2.0 um.
Bessel alpha=.00450 rad: 7.7 +/- .8 um; standard-optics prediction 8.1 um.
Focused Gaussian f=.40 m, waist=2.32 +/- .09 mm: 7.7 +/- .4 um; paper prediction 6.7 +/- .6 um.
Gaussian center stop r=1.4 mm: 15.0 +/- .6 um; edge stop: 1.3 +/- .6 um.
Confocal telescope length L=2f=.80 m. CODATA 2022 c=299792458 m/s EXACT, https://physics.nist.gov/cuu/pdf/wall_2022.pdf.

MEASURED GEOMETRIC PROJECTION (effective proxy, NOT literal helical particle path):
delta=c*Delta_t; v_group,z/c=L/(L+delta); cos(theta_eff)=L/(L+delta).
Bessel low: Delta_t=9.006 fs; theta_eff=2.598 +/- .385 mrad; c-vz=1011.8 m/s.
Bessel high: Delta_t=25.684 fs; theta_eff=4.387 +/- .228 mrad; c-vz=2885.5 m/s.
Gaussian full: Delta_t=25.684 fs; theta_eff=4.387 +/- .114 mrad; c-vz=2885.5 m/s.
Gaussian center: Delta_t=50.035 fs; theta_eff=6.124 +/- .123 mrad; c-vz=5621.0 m/s.
Gaussian edge: Delta_t=4.336 fs; theta_eff=1.803 +/- .416 mrad; c-vz=487.2 m/s.

INDEPENDENT STANDARD-OPTICS PREDICTIONS, NOT SAT:
Bessel L*alpha^2/2 -> 2.025 and 8.100 um, observed residual +.675 and -.400 um, respectively.
Gaussian w^2/(2f)=6.728 +/- .522 um (waist-only uncertainty), residual +.972 um, conditional 1.478 combined sigma. Paper rounded 6.7 +/- .6 gives 1.387 sigma. No full covariance or focal-length uncertainty supplied.

HISTORICAL MATH AND LATER CORRECTIONS:
SAT HYPERFOAM THEORY/UI CONFIG.txt blob 6817caf68943593f31d72d51798e0ba4589624a4: y=rRx0, Omega=Rdot R^-1, archived L_UI=.5 rdot^2+.5 r^2 Omega_mn Omega_mn. Point-path correction uses .5|ydot|^2=.5 rdot^2+.5 r^2|Omega u|^2, already documented in HsH Morrow UI audit 2026-10-21 blob 08c79af75872916d6cf74352f3680c8980a011b3.
Historical sphere geodesic X''+(X'' dot X)X/R^2=0 has wrong sign; corrected X''-(X'' dot X)X/R^2=0 already documented by Meridian 2026-10-10 blob 829bbc0060cd0ba11cb51bd8565e66f99690b2f1 and Nadir 2026-10-23 blob 9dc93b11c36b22356fb109f0af89562d8468f824.
Native ++++ time-normal theta4 in HsH Ravel PLUS4_HELIX_TIMESHEET_INTERSECTION_KERNEL_2026-09-16.md blob 80d85bb3a7d18b70830fe54752151257674ae23b. Do NOT equate optical theta_eff with native theta4 without independent bridge.

READING: BEDROCK full retrieved 563 lines blob 4cabda482c48c217614b868a2138409275df9bf7, current controls reviewed. STATE_OF_THE_THEORY full retrieved 155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Actual Python random draw selected HsH prior Orson packet blob ac538f004be1920abe2e34f4dee2fa2adbb874d2 and SAT GEOMETRIC VISUALIZATION.txt blob 0722f0b5635e6ba86f02238dd831da73ffcaa109; full files fetched, selected passages reviewed. Four Mersearch request lanes occupied, not overwritten; no fresh Mersearch, bounded GitHub fallback two archives only.

GATES: actual experiment PASS; numerical Python assertions PASS; CODATA c exact reference PASS; standard-optics residual PASS conditional; native theta4 bridge UNRESOLVED; cross-sector H(s)H candidate NOT MET; physical proof NOT CLAIMED.
Executable Python, JSON, Class P plot, complete report in conversation attachment.