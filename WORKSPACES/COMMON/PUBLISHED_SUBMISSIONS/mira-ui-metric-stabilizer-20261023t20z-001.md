# Mira CODE 000 | UI tetrad, Householder equivalence, and frame-stabilizer gate | 2026-10-23T20Z
Task: calc48-20261023T20Z-mira-ui-metric-stabilizer-001
Verdict: INTERNALLY_CHECKED mathematical identities; physical frame typing UNRESOLVED. No CODATA prediction, no BEDROCK promotion.

## Original source and genealogy
HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, lines 23-46, blob 02312fbb23167e8ce1c996451199ee0e498437b1, prints:
y^mu(lambda)=r(lambda) R^mu_nu(lambda) x0^nu
Omega=(dR/dlambda) R^-1 = (dR/dlambda) R [last equality incorrect]
L_UI=(dr/dlambda)^2/2 + r^2 Omega_mu_nu Omega^mu_nu/2
g_mu_nu=e_mu^a e_nu^b eta_ab=r^2 R_mu^a R_nu^b eta_ab.
SAT 2026/SAT CORE - UI CONFIG.txt (actual path has an em dash), blob 6817caf68943593f31d72d51798e0ba4589624a4, separately preserves y=rRx0, Omega=Rdot R^-1 and L_UI.
SAT REUILIGIG.txt, blob 6d3de4693f0fc3e8fcd2586b07818718189bb56f, gives the historical dependency sequence: Euclidean R4 -> radial flow -> projector -> effective Lorentzian shadow metric -> UI trajectory -> connection.
Established corrections predate this packet: Mercer UI stabilizer (2026-10-23T07Z, blob 429f81234c0c1dff81e95c3d087bf7469fe8d8e6), Morrow UI audit (2026-10-21, blob 08c79af75872916d6cf74352f3680c8980a011b3), and Sable connection propagation (2026-10-23T19Z, blob da82f7f24753afc6228f0f8a403910845b7a9ba5). Unique operative repair is Omega=Rdot R^T; this is not a newly claimed correction.

## Exact mathematical recovery
Assume eta=diag(-1,1,1,1), R in SO(4), e0=(1,0,0,0), u=R e0, and e_mu^a=r R_mu^a. Then
g=r^2 R eta R^T = r^2 (I-2 u u^T).
This is exactly the Householder time-normal metric, not a separate new postulate.
det(g)=-r^8; sqrt(abs(det g))=r^4 for r>0. At fixed r, arbitrary R changes neither metric volume density nor determinant.

Every K=diag(1,Q), Q in SO(3), fixes u, y=r R e0 and g. But
Omega(RK)=Omega(R)+R Kdot K^T R^T.
Take R=rotation_01(omega t), K=rotation_12(nu t), r=1. Under the explicitly Euclidean Frobenius contraction used for this test,
||Omega(R)||_F^2=2 omega^2,
||Omega(RK)||_F^2=2(omega^2+nu^2),
L_UI(RK)-L_UI(R)=nu^2.
The point and induced metric remain exactly identical. The historical UI term is therefore not a function of the unmarked point/metric alone. A physically marked/material frame could carry extra information, but that must be separately typed and derived.

For the declared spacetime extension R(t)=rotation_01(omega t), r=1, the metric is the 2D block
g_00=-cos(2 omega t), g_01=-sin(2 omega t), g_11=cos(2 omega t),
with g_22=g_33=1. Direct Christoffel/Ricci calculation gives scalar curvature
Scal(g)=-4 omega^2 cos(2 omega t)
under R^i_{jkl}=partial_k Gamma^i_{lj}-partial_l Gamma^i_{kj}+... .
Thus constant metric volume density does not imply zero curvature. For omega=0, curvature vanishes. The coframe is not generically a coordinate Jacobian: d(e^0)_{t x}=omega cos(omega t).

## Reproducibility and result
Actual SymPy exact assertions and independent NumPy centered differences executed in Python. Script SHA256: 36dba73b6e183e407d125159fb9dcab54fc519d47db1d6c633658f1bbe68454d.
At omega=1/3, nu=2, t=0.7:
L_UI(R)=0.111111111124995 (finite difference);
L_UI(RK)=4.111111111383696;
max metric difference=1.1102230246251565e-16;
Scal(g)=-0.39692131253263524;
ALL_ASSERTIONS_PASSED.
No parameters fitted to experiment. CODATA screening: no independently predicted dimensionful quantity; no CODATA value, uncertainty or residual can be assigned.

## Open physical and dimensional gates
The historical source specifies a 1D path R(lambda), not the full spacetime extension R(x) needed for curvature; the curvature example is a declared conditional extension. The metric is Lorentzian but the rotation matrix is Euclidean SO(4), not a Lorentz gauge transformation. Whether K represents redundant solver frame or physical core/material orientation is unresolved. The source also leaves the contraction convention for Omega and the dimensions of r versus coordinate units insufficiently typed; the cost calculation assumes Euclidean Frobenius norm and normalized coordinates. No claim of empirical H(s)H validation or physical candidacy.

## Controls and privacy
Full live BEDROCK.md fetched and section-scanned, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines/82842 characters; subordinate STATE_OF_THE_THEORY.md fetched in full, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines/11012 characters. ND-2026-10-18-02/03 and CODE 000 checked. Existing Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 inspected; manifest exists but SEARCH_RESULTS.md and SEARCH_RESULTS.json returned empty, so this turn used disclosed bounded repository search rather than claiming a new Mersearch run. Random secrets.randbelow(3) selected SAT MISC/AN Excellent Request.txt, blob 1f275c8abf64cda346082f2c0abc3204826e0e9c, 378 lines/45149 characters; full text retrieved, distributed passages inspected. Its constructed language/translation material has no physical equation relevant to this packet. No sensitive autobiographical material reproduced.
