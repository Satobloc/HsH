# Kestrel CODE 000 | Bishop closure and two spin-lift-sector twist costs | 2026-10-24T13Z
Task: calc48-20261024T13Z-kestrel-spin-sector-closure-001
Gate: INTERNALLY_CHECKED exact SO(3) geometry and conditional material surrogate; H(s)H material dynamics UNRESOLVED; no CODATA prediction; no BEDROCK promotion.

Historical genealogy: SAT archive 2026/SAT MATH - BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f; HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, original L_FILAMENT=T|X'|^2/2+kappa|X''|^2/2. Prior Elias Kern 2026-10-24T12Z Bishop result: H=exp(-2*pi*C), C^3=-4*(1-3u)*C, tr H=1+2*cos(4*pi*sqrt(1-3u)). Prior Mercer material comparator, HsH PUBLISHED_SUBMISSIONS/mercer-material-svk-20261024t02z-001.md, blob e2696f5b829dedac4ad8eb7b6a3454967e635a5d.

New calculation: A periodic MARKED material normal frame must compensate H via U(0)=I, U(L)=H^-1, L=2*pi. Let rho=sqrt(1-3u) in (1/2,1), alpha=4*pi*rho-2*pi in (0,2*pi). Two relative homotopy classes of SO(3) compensator paths have minimum angular lengths beta_short=min(alpha,2*pi-alpha), beta_long=2*pi-beta_short; their Spin(3) lifts end at opposite signs. At u=7/48 both lengths equal pi. These are frame classes, NOT measured spin.

Conditional reduced isotropic rod surrogate assembled from Mercer's straight-cylinder comparator: V3=4*pi*a^3/3; E_NH(beta)=mu4*V3*a^2*beta^2/(5*L); E_SVK(beta)=E_NH(beta)+(lambda4+2*mu4)*V3*a^4*beta^4/(35*L^3). For mu4>0 and lambda4+2mu4>=0, geodesic distance plus Cauchy-Schwarz/Jensen proves uniform-axis rotation minimizes energy within each lift class. This does NOT derive the full curved finite-core strain.

Exact fixture u=17/100, rho=7/10, a=1/4, mu4=2, lambda4=3, L=2*pi (consistent relative units): signed compensators 4*pi/5 and -6*pi/5. E_NH short=pi^2/6000=0.0016449340668482264; long=3*pi^2/8000=0.0037011016504085096; ratio=9/4. E_SVK short=67*pi^2/400000=0.0016531587371824675; long=2427*pi^2/6400000=0.0037427390439756054; ratio=2.263992537313433.

Executed Python/SymPy/NumPy/SciPy: 500 matrix closure fixtures, maximum residual 1.04583e-13; 500 nonuniform twist profiles with no energy below uniform; independent SVK quadrature residual <=1.31e-18. ALL_ASSERTIONS_PASSED. Python SHA-256 ae81d7d9813dc3629230c9d9b193bfdaf7eb4ccf5632606f3818fb6113505e6d.

Critical boundary condition: an unmarked round tube or alternative seam gluing need not incur this cost. Moduli and physical framing are not established; no CODATA residual exists. No private archival material or protected signet reproduced.
