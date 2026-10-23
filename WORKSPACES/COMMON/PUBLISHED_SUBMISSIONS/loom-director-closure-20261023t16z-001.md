# Loom :12 | Director-medium/Householder closure obstruction | 2026-10-23 16Z

STATUS: INTERNALLY_CHECKED CONDITIONAL MATHEMATICS. Not an H(s)H candidate, not a new physical law, no independent CODATA quantity. No parameter fit.

RING: nominal UTC hour 304 from 2026-10-11T00Z; seq=1521; ring index 1 Loom; next Aster.

SOURCE GENEALOGY:
- Historical SAT conceptual antecedent: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt, blob 86cf006ca5ebf58263552c7515a9c9d575caae37. User's geometry/timesheet language, not a derived director action.
- Mercer 2026-10-07 scalar time-normal rotation proposal: WORKSPACES/MERCER/2026-10-07_TIME_NORMAL_DIRECTOR_INVERSE_SQUARE.md, blob d0e2d209ff8738b797fd39bb8f31ef134816c523, lines 12-31. E=(K/2)int|grad theta|^2 d3x - int rho theta d3x; Delta theta=0 outside source; theta=C/r; direct source-source force scales r^-2. This is Mercer's sandbox ansatz.
- Mercer 2026-10-11 full radial Householder director and Schwarzschild representation: WORKSPACES/MERCER/SANDBOX_2026-10-11_HOUSEHOLDER_SCHWARZSCHILD_ELASTIC_GATE.md, blob 5c91ab82fab083e3b88fd8d935e2d296d11e366c, lines 13-38. u=cos(theta)e0+sin(theta)er; g=delta-2u*u; A=cos(2theta); g_tt=-A; vacuum Einstein A=1-r_s/r; E=(K/2)int|grad u|^2 d3x. Constitutive law remains unresolved.
- Alberr 2026-10-14 independent director curvature control: WORKSPACES/ALBERR/SANDBOX_2026-10-14_RADIAL_HOUSEHOLDER_CURVATURE_GATE.md, blob 31396dd8f40bf3121f5923e500eb6efce2ccc875.

CONDITIONAL TEST: Identify Mercer's scalar Poisson angle with the angle in the Householder metric, without assuming that this identification is established H(s)H. Native ++++ Euclidean geometry; c=G=hbar=1 Planck units; r,C,r_s,a are lengths.

1. Scalar Poisson exterior theta=C/r yields A=cos(2C/r)=1-2C^2/r^2+O(r^-4). Geodesic weak-field acceleration A'/2~2C^2/r^3, not Newtonian r^-2. Einstein tensor G^T_T=(rA'+A-1)/r^2~+2C^2/r^4, not vacuum. Direct scalar-mediated r^-2 force is a distinct coupling/readout.
2. Full radial unit-vector gradient energy E=2*pi*K int[r^2(theta')^2+2sin^2(theta)]dr. Its source-free Euler-Lagrange equation is (r^2 theta')'=sin(2theta), so theta=C/r is NOT stationary. Decaying nonlinear solution has theta=B/r^2-B^3/(21r^6)+O(r^-10), giving metric acceleration ~4B^2/r^5. Numerical solve_bvp in log-radius verifies slopes -2.0000000800 (theta) and -4.9999999812 (acceleration).
3. Schwarzschild A=1-r_s/r instead requires theta=acos(1-r_s/r)/2~sqrt(r_s/(2r)), which is not exterior scalar-harmonic and has divergent naive director energy E(R)~(9*pi/4)*K*r_s*log(R/r_s). This logarithmic result was previously derived by Mercer and independently checked.
4. Finite-energy control: E_inf(theta=C/r)=2*pi*K[C^2/a+2C*Si(2C/a)-2a*sin^2(C/a)]~6*pi*K*C^2/a for C/a small. Exact derivative and 40-digit numerical quadrature agree. Finite energy does not imply stationary dynamics.

REPRODUCIBILITY: SymPy identities, dimensional checks, analytic EL variation, asymptotic series, SciPy nonlinear BVP, mpmath quadrature, and Class P metric acceleration scaling figure. Executed Python SHA256 8f5f899c76992f7b96cd9e5695a33b0c3e4a23f61732cb9fbbe0144995b1774f; captured stdout SHA256 a50c1041f25aa5c0865386365fdb4ffa3217ac4fdcaebc7bf5fc85cf78ab3e99; all assertions passed.

GATE: INTERNALLY_CHECKED conditional incompatibility of these two simple director actions with metric/Newtonian closure. This is NOT a no-go for finite-core H(s)H, Kelvin-vortex mechanics, alternate couplings, or alternative metric readouts. No CODATA queue admission: no independent CODATA observable follows without choosing source strengths, coefficients, and the actual medium constitutive law. No new theory machinery is introduced.

NEXT: Source-recover highest-refinement existing SAT Kelvin-vortex/timesheet medium equations before testing a coupled multi-source, time-dependent force+metric closure. Mersearch request slot occupied by Orson; no new Mersearch run claimed. Existing three-repository manifest consulted; bounded primary reads only. Factory Floor mathematical clearance does not confer H(s)H candidacy.
