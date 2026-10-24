# Hale :00 | 2026-10-24T05Z | Historical SAT curvature-cap reconstruction

SANDBOXED. Exact conditional Euclidean R4 geometry, NOT a physical H(s)H prediction. No BEDROCK modification.

## Provenance and controlling corrections
- HsH BEDROCK.md: complete 548 lines, Git blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; ND-2026-10-18-02/03, BR-007/008, ND-2026-10-18-07, Oct 23 correction-first/Factory Floor and Planck-unit requirements.
- HsH STATE_OF_THE_THEORY.md: complete 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- SAT archive Dim.txt: complete 110 substantive lines, blob 8f019606e52cbc8e45bd7638395f994777a3a446. Assistant compilation, original authorship/date unverified. Historical: ell0~1e-21 m, kappa_max~1/(2ell0), epsilon>=1/kappa_max; alternative epsilon~sqrt(2)ell0 from helical excursion. Claims of physical verification are not established.
- SAT archive SAT METRICS — Basic.txt: complete, blob 6b0a0f6a45008e69262e702e6f3a5ba1e3921518; separates epsilon from coil radius ell_f~0.7937 fm.
- SAT archive Filament onto.txt: relevant opening 100 lines, blob a13c67ff2b47cf178672804d91771e01d4c4a3e1; Nathan's line 54 rejects treating "UV safety lock" as established, calls it a state-change boundary.
- Later correction: HsH Morrow/Kestrel QUARRY_044_FINITE_CORE_TOPOLOGY_GEOMETRIC_COST.md, blob 79b0b32afa11ca38713f0486020f0795bbeb714f: strict local normal-tube condition a*kappa_max<1, not sufficient for global reach.
- Later Meridian CRULLER_PLANCK_REACH_CONTACT_GATE_2026-10-21.md, blob a26e2282ac72e0c63158f69c1b7ea8e617b01039: local curvature vs nonlocal reach and no derived material energy ceiling.
- Actual random archive reading: Python secrets.randbelow(3) selected index 0 of [SCALING.txt, SAT DEVELOPMENT/pre-mathproofBAK.txt, THE BACK HALLS.txt]. SCALING.txt read complete 457 lines, blob dcf23fbeda258da813f54360ab1a7f33243c7089; unrelated B, Q, mass and history material included. No restricted/private material.
- Mersearch-first: inspected occupied request 2026-10-21-orson-nlm-big-haul-math-001 (blob 662e4a99e47a48e1e573cf0dddffaf1329dd60dd), completed 3-repository manifest (blob 0f017d6f557d24c721e417d1fe3c49abf0653991), receipt (blob 191acaf733c8e59920ca16c53ccb74d6be90f3c6). Existing scan: 13897 files, 23825506 records, 34983 hits. No new Mersearch query; bounded GitHub fallback and direct original reads.

## Exact conditional derivation
For the native Euclidean R4 curve gamma(t)=(r cos t,r sin t,p t,0), p is axial advance per radian, r,p>0, and s is arclength:
  ds/dt=sqrt(r^2+p^2); kappa=r/(r^2+p^2); tau=p/(r^2+p^2).
  d kappa/dr=(p^2-r^2)/(r^2+p^2)^2.
At FIXED p, the maximum over r>0 is r=p, kappa_max=1/(2p). Setting p=ell0 exactly reproduces the historical formula. But p is not established as a universal fixed scale. Along r=p->0, kappa=1/(2p) diverges: no universal cap follows from helix geometry.

At r=p=ell0, sqrt(2)ell0 is ds/dt (arclength per radian), NOT the normal curvature radius 1/kappa=2ell0. The old two epsilon estimates identify distinct geometric quantities.

For the Frenet normal 3-ball tube F(s,y)=gamma(s)+y1*N(s)+y2*B(s)+y3*e4, the exact frame-normalized 4D Jacobian is J=1-kappa*y1. At tube RADIUS a=2ell0, a*kappa=1 and J vanishes on the inner rim: a boundary of regularity, NOT an established safe UV regulator. For a=sqrt(2)ell0, a*kappa=0.707106781187 and J_min=0.292893218813. If historical epsilon=2ell0 is a DIAMETER, actual radius ell0 gives a*kappa=0.5. Radius-versus-diameter remains unresolved.

At r=p, the chord-square derivative for separation u>0 is 2p^2(u+sin u)>0. No doubly-critical self-distance pair occurs in this infinite-helix fixture. Finite/closed/curved/composite carriers require independent global reach checks.

## Executed tests, no fit
SymPy exact curvature, derivative, maximum, normal-frame Jacobian and arc-advance identities: PASS. Independent NumPy 4D determinants at a/p=1, sqrt(2), 1.999, 2, 2.001: PASS; J crosses zero at 2. Finite-difference curvature at r/p=0.1,0.5,1,2,10: errors below 2.3e-9 in p=1 units. Curvature for r=p=0.1ell0 and 0.01ell0 exceeds claimed universal cap by factors 10 and 100.
Historical ell0=1e-21 m, with CODATA 2022 c/h/G as conversion INPUTS, corresponds to ell0/ell_P=6.187142405677e13 and kappa=5e20 m^-1. This is NOT a CODATA prediction. No physical bending modulus, particle size or cross-sector observable is derived.
Primary executed Python SHA256 688c9652957c73508945e07c3a4a90f9c112013bf2299e207a4f66a6ec582c6e; actual output SHA256 33bfda844ef01e6fae7d0b0b1e98768051353134bfccadd1923cd4fe8f37ffee. Full runnable source and output retained in Hale relay conversation.

GATE: fixed-p helix curvature maximum and local focal threshold INTERNALLY_CHECKED; universal physical curvature cap/automatic UV safety REJECTED; epsilon typing and constitutive law UNRESOLVED. Mathematically cleared only for conditional geometry, eligible for consideration, NOT an H(s)H construction candidate. No independent CODATA observable, no ACTIVE_CODATA_VERIFICATION entry, no BEDROCK promotion.
