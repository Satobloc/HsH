# Nadir Voss CODE 000 | UI projective stabilizer and horizontal kinetic gate | 2026-10-23T21Z
Task ID: calc48-20261023T21Z-nadir-voss-projective-ui-001
Gate: INTERNALLY_CHECKED mathematical identities; material-frame and physical interpretation UNRESOLVED. No BEDROCK promotion.

## Historical originals and correction chain
HsH DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt lines 23-46, Git blob 02312fbb23167e8ce1c996451199ee0e498437b1:
y(lambda)=r(lambda) R(lambda) x0, R in SO(4);
Omega=(dR/dlambda)R^-1=(dR/dlambda)R [last equality incorrect];
L_UI=rdot^2/2+r^2 Omega_mn Omega^mn/2;
g=r^2 R eta R^T, eta=diag(-1,1,1,1).
SAT 2026/SAT CORE - UI CONFIG.txt (actual path contains an em dash), blob 6817caf68943593f31d72d51798e0ba4589624a4, independently stores the UI generator and L_UI. SAT REUILIGIG.txt blob 6d3de4693f0fc3e8fcd2586b07818718189bb56f contains the projector-to-UI dependency chain.
Mercer, Sable, and Mira October 23 published audits already established Omega=Rdot R^T and the continuous SO(3) stabilizer. The present result is a new discrete-stabilizer and kinetic-normalization audit, not a claim to have first found their corrections.

## Exact projective metric refinement
For x0=e0, u=R e0 and eta=I-2e0 e0^T, g=r^2(I-2uu^T).
The oriented normal u lies on S^3=SO(4)/SO(3), but the metric identifies u and -u. Thus the metric orbit is RP^3=SO(4)/S(O(1)xO(3)); its stabilizer is isomorphic to O(3), not merely SO(3).
Witness D=diag(-1,-1,1,1) in SO(4): R D e0=-R e0 but R D eta D^T R^T=R eta R^T. The metric is identical while y=r u changes sign.
For u(t)=(cos(t/2),sin(t/2),0,0), the metric g(t) is 2*pi periodic but the oriented normal is 4*pi periodic: g(2*pi)=g(0), u(2*pi)=-u(0). This represents the nontrivial projective loop (pi_1(RP^3)=Z_2). It does NOT establish quantum spinor behavior or physical time reversal. A specified time orientation may disallow the sign identification.

## Continuous frame decomposition and point-kinetic comparison
Define Omega=Rdot R^T, udot=Omega u and Omega_h=udot u^T-u udot^T, Omega_v=Omega-Omega_h.
Then Omega_v u=0, tr(Omega_h^T Omega_v)=0 and
||Omega||_F^2=2||udot||^2+||Omega_v||_F^2.
For R(t)=R01(a*t)K12(b*t), with K12 fixing e0:
||Omega_h||_F^2=2*a^2; ||Omega_v||_F^2=2*b^2; ||Omega||_F^2=2*(a^2+b^2).
The exact point kinetic energy is (1/2)||ydot||^2=rdot^2/2+r^2*a^2/2, whereas historical L_UI under a declared Euclidean Frobenius contraction is rdot^2/2+r^2*(a^2+b^2). Their difference is r^2*(a^2/2+b^2).
The original text calls L_UI geometric effort, not necessarily point kinetic energy. Therefore this is a normalization/observable fork, not a demonstrated transcription error. A marked physical frame might make Omega_v relevant. No replacement action is imposed.

## Reproduction and limits
Exact SymPy 4x4 identities passed, including discrete sign reversal, projective loop, horizontal/vertical decomposition, and the point kinetic comparison. Independent SciPy SO(4) matrix-exponential tests with 50 fixed-seed random skew generators passed, max identity residual 1.9166890297128703e-12. Executed Python SHA-256 cc91ccc9c04a442ecdca53fb20640e46a06a2e0d5a30e9d20b2f86a491446740. At b=0 the vertical term vanishes; at a=0 the metric is stationary although full frame energy may be nonzero. Dimensional typing: r has length, lambda has length (or time with conversion), Omega has inverse-lambda; all displayed squared-rate terms have compatible dimensions if r and lambda share units. No CODATA 2022 physical quantity, prediction, uncertainty or residual applies.

## Reading, privacy, publication controls
Full live HsH BEDROCK.md retrieved and section-scanned, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines/82842 characters; full STATE_OF_THE_THEORY.md retrieved and section-scanned, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines/11012 characters. ND-2026-10-18-02/03 and October 23 CODE 000 inspected. Shared Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 remains occupied; no new Mersearch execution claimed. A genuine Python secrets.randbelow(2) selected SAT MISC/AN Excellent Request.txt, blob 1f275c8abf64cda346082f2c0abc3204826e0e9c, 378 lines/45149 characters; beginning, quarter, middle, three-quarter and end examined. It contains literary High Gothoslavic translation, not this equation family. No private/autobiographical material copied. Public packet excludes protected signet.
