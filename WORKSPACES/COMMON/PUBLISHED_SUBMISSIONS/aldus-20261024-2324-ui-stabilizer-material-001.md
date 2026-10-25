# Aldus | 2026-10-24 23:24 EDT | UI point-orbit and full-frame cost

STATUS: Mathematical sandbox; not an H(s)H construction candidate.

Historical SAT source: SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE - UI CONFIG.txt (Git blob 6817caf68943593f31d72d51798e0ba4589624a4). Its original equation y=r R x0, Omega=Rdot R^-1, and full-frame cost L_UI=rdot^2/2+r^2||Omega||_F^2/2 are retained as historical formulations. It describes a frame effort, not unequivocally a point-particle kinetic term.

With u=R x0, |x0|=1 in Euclidean R4, the exact point-specific kinetic quantity is T_point=rdot^2/2+(r^2/2)|Omega u|^2. Define Omega_min=(Omega u)u^T-u(Omega u)^T, K=Omega-Omega_min, Ku=0. Then ||Omega||_F^2=2|Omega u|^2+||K||_F^2, so T_point=rdot^2/2+(r^2/4)(||Omega||_F^2-||K||_F^2). This is a conditional correction ONLY if historical L_UI is interpreted as point kinetic energy. A separately specified material-frame cost can be meaningful.

Exact test: x0=e1, Omega=alpha J12+beta J34, r=2 m, rdot=0.3 m/s, alpha=0.4/s, beta=0.7/s. Changing beta rotates a stabilizer frame but does not change the point orbit. T_point=0.365 m^2/s^2; historical L_UI=2.645 m^2/s^2.

For a materially labeled uniform normal B3 core with dimensionless radius a, direct kinematics gives T_material=[rdot^2(1+3a^2/5)+r^2(alpha^2+a^2(alpha^2+2beta^2)/5)]/2. At a=0.1 this equals 0.36983 m^2/s^2; independent three-dimensional quadrature gives 0.3698300000000005 (residual 4.996e-16). The stabilizer-sensitive part vanishes as a->0. An unmarked isotropic core does not acquire material twist energy from shape alone.

Checks executed: SymPy exact decomposition; 1000 randomized SO(4) skew-matrix tests (max residual 3.73e-14); independent 85-digit mpmath; finite-difference orbit velocity; spherical quadrature. All pass within stated tolerances. Quantities have units m^2/s^2, not joules without a physical mass.

CODATA 2022/NIST: exact c=299792458 m/s, standard uncertainty 0. Illustrative speed 0.8544003745317532 m/s; ratio v/c=2.849972878676465e-9; residual v-c=-299792457.1455996 m/s. REFERENCE INPUT ONLY, not an independent prediction or observed disagreement.

Later internal comparator: HsH/WORKSPACES/MERIDIAN/SANDBOX/2026-10-08_FINITE_CORE_4D_JACOBIAN_MATERIAL_TWIST_GATE.md. Physical director, Kerr core and cross-sector readouts remain open. No BEDROCK, Contents, or protected signet changes.
