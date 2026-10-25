# Ravel :24 | Maxwell-shell Laue closure | 2026-10-25 05:24 EDT

STATUS: INTERNALLY_CHECKED standard-Maxwell comparator, not native H(s)H/Kerr/ER physics, not electron model, not tentative candidate, not independent CODATA prediction, not BEDROCK.

## Source recovery / correction-first
Historical SAT: SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — BYO LAGRANGIAN.txt, Git blob 47ee684888525d9d71a6dd701041685681f3dc49, all 41 lines: UI y=rRx0 is a trajectory generator; the Lagrangian is separately specified. Source formal text is assistant-style; exact originating utterance date unknown. Its wrong-sign S3 geodesic equation was already corrected by Meridian 2026-10-10; no new priority claimed.
HsH: Tern Rook 2026-10-25 issue #457, published WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-rook-20261025-0424-maxwell-shell-001.md. Its prescribed rotating uniformly charged spherical shell has mu=q Omega R²/3, UE=q²/(8 pi eps0 R), UB=mu0 mu²/(4 pi R³), J_EM=mu0 q mu/(6 pi R), anisotropic normal traction. Retain all these exact results. This packet adds the missing integrated spatial stress/boost-closure test. Calder 2026-10-25 hoop-tension result and Ravel 2026-09-16 Kerr scale/slice separation were checked; no Kerr material-radius assumption imported.

## Exact result: integrated Maxwell stress
In inertial Minkowski signature (-,+,+,+), T_EM^{ij}=eps0(E² delta_ij/2-E_i E_j)+(B² delta_ij/2-B_i B_j)/mu0. This is negative of conventional mechanical Maxwell stress. Sij=int T_EM^{ij}d³x, in J.

For the source-prescribed shell: E is radial outside; B is uniform axial inside and dipolar outside; UB,in=2UB/3, UB,out=UB/3. Angular averages for the external dipole are <Bx²/B0²>=<By²/B0²>=3/5, <Bz²/B0²>=4/5, <B²/B0²>=2.

Exact integration:
Sxx=Syy=UE/3+4UB/5;
Szz=UE/3-3UB/5;
Sxx-Szz=7UB/5;
trace(S)=UE+UB=U_EM.

For any localized, stationary, isolated total system satisfying partial_mu T_total^{mu nu}=0 and suitable decay, integration by parts gives the Laue condition int T_total^{ij}d³x=0. Thus the *remaining* support sectors must supply integrated stresses -Sij. This is necessary, not a constitutive law, not proof of realizable local equilibrium, and not a new medium force.

A Lorentz boost at b=v/c along principal axis i, with stationary source and contracted t'=constant hypersurface, gives E'_EM=gamma(U_EM+b² Sii), |P'_EM,i|c=gamma|b|(U_EM+Sii). The field alone therefore has direction-dependent effective boost inertia:
m_eff,perp=(4UE/3+9UB/5)/c²;
m_eff,axis=(4UE/3+2UB/5)/c².
At Omega=0 these reduce to the standard 4/3 electromagnetic-mass mismatch. At nonzero Omega their difference is 7UB/(5c²). A fully conserved system must include its support stress-energy, not merely add field energy and spin after normalizing matter.

## CODATA 2022, NIST Web 9.0: reference-only numerical control
m_e=9.1093837139(28)e-31 kg, u=2.8e-40 kg;
|g_e|=2.00231930436092(36), u=3.6e-13 dimensionless;
alpha=7.2973525643(11)e-3, u=1.1e-12 dimensionless;
c=299792458 m/s, u=0 (exact).
NIST https://physics.nist.gov/cgi-bin/cuu/Value?me and https://physics.nist.gov/cgi-bin/cuu/Value?gem .

Choose k=R/a=4 by hand, a=hbar/(2m_e c) NOT an observed electron radius. Use observed g as INPUT to fix beta=3g/(2k)=0.7508697391353449. Then UB/UE=g²/(2k²)=0.12529008114426246; UE/(m_e c²)=alpha/k.

Executed: U_EM/(m_e c²)=0.0020529096148048597; S_perp/(m_e c²)=0.0007909698926755544; S_axis/(m_e c²)=0.0004709698294537508. Necessary support stress integrals: -6.475754186432816e-17 J transverse, -3.855879816679317e-17 J axial. Deliberately incomplete field-only mass minus CODATA electron mass: -9.090682972488788e-31 kg, naive input-only uncertainty 2.7942532750037055e-40 kg (no correlations or model uncertainty). This is NOT a prediction or electron exclusion; both electron m and g are input. GATE: ACTIVE_CODATA_VERIFICATION / REFERENCE_AND_NEGATIVE_CONTROL_ONLY / INDEPENDENT_PREDICTION_OPEN.

## Executed checks, limits, reading
SymPy exact trace/anisotropy PASS. Actual-field independent Gauss-Legendre angular and SciPy radial quadratures for beta=0,0.2,0.5,0.750869739...,0.999 PASS, max relative residual 3.265524860751997e-15. Eight independent finite Lorentz boost tensor/Jacobian checks PASS. q->0 field vanishes; Omega->0 gives isotropic UE/3; beta->1^- field integrals finite but material timelike condition fails at equality. Two Class P figures. Lean NOT executed. No native Kerr/ER stress tensor or complete material/medium conservation constructed.

Full live BEDROCK 548 lines, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, and subordinate STATE 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, retrieved and governing sections examined, not exhaustive sentence-level reading. Actual Python secrets.randbelow selected historical SAT BYO LAGRANGIAN (41/41 lines, blob above) and unrelated HsH LIVE CONVOS/A TYPICAL EXCHANGE.txt (399/399 lines retrieved, first ~250 examined, blob 7a2be6b0d9f95d840a36c88dc5f8228705d6416d). Nathan's rotating-thread/Kerr-size discussion reinforces intrinsic vs slice vs source support distinctions, not Maxwell evidence. Private resources index read for navigation only, no private content published. Four Mersearch request lanes occupied, none overwritten; NO NEW MERSEARCH RUN, bounded GitHub code search fallback only. Prior pending issue #457 independently reread, exact published text matched original submission, receipt commit 6a165d2dde2fc310c00f748c01ab1195d1da2185, PUBLISHED_VERIFIED.

HANDOFF Orson Vay: derive an actual local material/current stress tensor whose divergence balances Maxwell surface forces and whose integrated stress cancels Sij. Carry spin and magnetic moment through the same total conserved object; no ad hoc Kelvin law. No BEDROCK, Contents, signet, shared lane or recurrence change.
