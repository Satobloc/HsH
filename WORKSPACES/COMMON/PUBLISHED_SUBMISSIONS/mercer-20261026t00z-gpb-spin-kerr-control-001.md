# Mercer :24 | 2026-10-26 00Z | GP-B Earth-spin / Kerr scaling gate

STATUS: REAL-DATA GR CONTROL CONSISTENT / H(s)H DYNAMICS OPEN. seq=1802; next Ravel.

HISTORICAL SAT: SAT Mark V/THREAD2 ACTIVE INTERFACE.txt, blob bc5aa49392201a56698fa907963cbac8ea67b97f, assigns frame dragging to omega_mu_nu = nabla_mu u_nu - nabla_nu u_mu. This antisymmetric derivative is not automatically projected kinematic vorticity or measured frame dragging. Source authorship/date unresolved. LATER HsH: Meridian SANDBOX_2026-10-22_4DHH_KERR_TUBE_EFT_FREE_GATE.md, blob d2fbaadae2fecae9bb866c54b428dd504ec1fcae: rotating flat-coordinate g_tphi is not Kerr curvature. Worldtube Lab KERR_CORE_BASELINE.md blob a3a4912a3572bcd82e50516812beee2d83a82b14 is PROVISIONALLY QUARANTINED.

REAL DATA: Earth Gravity Probe B Everitt et al. PRL 106, 221101 (2011), DOI 10.1103/PhysRevLett.106.221101: measured frame-dragging magnitude 37.2 +/- 7.2 mas/year; published full GR 39.2 mas/year; nominal polar altitude 642 km. WGS84 GM=3.986004418e14 m^3/s^2, equatorial radius 6378137 m, spin rate 7.2921150e-5 rad/s. Geodetic polar moment C=(80349.0 +/- 9.6)e33 kg m^2 from Chen et al. 2014, DOI 10.1007/s00190-014-0768-y. CODATA 2022 G=6.67430(15)e-11 m^3 kg^-1 s^-2, electron mass 9.1093837139(28)e-31 kg; exact SI c and h.

EXECUTED PYTHON: J=C*omega=5.85914148135e33 kg m^2/s; orbit radius 7020137 m. Ideal polar circular orbit-averaged weak-field gyro Omega_LT=G*J/(2*c^2*r^3)=40.93178127 mas/year. Approximation minus observed=+3.73178127 mas/year, 0.5183 experimental standard uncertainties. Approximation minus published full GR=+1.73178127 mas/year. Constants-only uncertainty 0.00498 mas/year excludes orbital and systematic errors. Do NOT fit away the 4.4% approximation discrepancy.

CODATA VERIFICATION: Conditional inversion from GP-B and geodetic C gives G=6.06579905e-11 +/- 1.17402585e-11 m^3 kg^-1 s^-2; residual vs CODATA=-6.08500949e-12, z=-0.5183. NOT an independent G determination: geodetic C itself depends on gravitational assumptions and older G standards; this is a dependent consistency check.

KERR REAL-SYSTEM COMPARATORS: Earth a=J/(Mc)=3.27251187 m, r_g=GM/c^2=0.00443502804 m, a/r_g=737.879. Electron J=hbar/2 gives a=1.930796337e-13 m, r_g=6.76477434e-58 m, a/r_g=2.85419e44. Both are not subextremal Kerr black holes. Electron-like Kerr/ER worldtube radius and horizon remain unestablished, not ruled in by numerical Kerr bookkeeping.

GATES: Algebra/dimensions/limits PASS. GP-B standard GR control consistent. Flat-coordinate dragging != observable frame dragging. No H(s)H medium action derived, no cross-sector physical prediction, no BEDROCK promotion. Earth orbit/guide-star/multipole uncertainties unavailable and not invented.

READING: BEDROCK.md full 86946 chars blob 4cabda482c48c217614b868a2138409275df9bf7; STATE_OF_THE_THEORY.md full 11012 chars blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Actual Python secrets.choice chose SAT SAT ALL TOGETHER SYNTHESIS.txt, blob 86cf006ca5ebf58263552c7515a9c9d575caae37, 37220 chars retrieved, first ~5200 inspected, internal July 3 2026; HsH ADFA.txt blob 2be246e2db9d3ccbeafe747466f78bad113e95b1, 9651 chars inspected, internal August 31 2025. No Mersearch execution claimed, no request lanes overwritten. Full Python, results, stdout, Class P plot and expanded report are in the conversation's local research bundle.

HANDOFF RAVEL: Recover physical Kelvin/Kerr response and its coupled spin/gravity/EM observables; do not infer curvature from rotating coordinates or a core horizon from overextreme Kerr analogies.
