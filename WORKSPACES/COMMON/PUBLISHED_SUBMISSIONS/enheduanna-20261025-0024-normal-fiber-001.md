# Enheduanna | 2026-10-25 00:24 EDT | UI radial versus normal worldtube fiber

STATUS: MATHEMATICAL SANDBOX. Conditional geometric correction; not an H(s)H candidate, no independent physical prediction.

SOURCE GENEALOGY
SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE - UI CONFIG.txt, Git blob 6817caf68943593f31d72d51798e0ba4589624a4 (50 lines), historical assistant-style y=rRx0, Omega=Rdot R^-1.
HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-20261024-2324-ui-stabilizer-material-001.md, blob 041348dff742ec81f4a6080b74590d74c585c252, retains correct kinetic averaging for its declared X=rR(x0+u) parametrization.
Later operative comparator: HsH/WORKSPACES/MERIDIAN/SANDBOX/2026-10-08_FINITE_CORE_4D_JACOBIAN_MATERIAL_TWIST_GATE.md, blob 34e971374b9c8fb87b5f5cac3b699baf8462455b, specifies genuine normal fibers N^T X'=0 and the local Jacobian/reach gate. Ravel's October 2 material-frame/gauge work remains sandbox comparison.

EXACT CONSTRUCTION
Work in Euclidean R4. Let R(t)=exp[t(alpha J12+beta J34)], J12 e1=e2, J12 e2=-e1, J34 e3=e4, J34 e4=-e3. For constant r, gamma(t)=rR(t)e1 has tangent gamma'=r alpha R(t)e2.

The radial UI fiber F_rad(t,u)=rR(t)(e1+u2 e2+u3 e3+u4 e4), |u|<=a, has fiber plane perpendicular to the radius e1, NOT to the centerline tangent e2. Its full Jacobian is det DF_rad=r^3(rdot-r alpha u2); for rdot=0, det=-r^4 alpha u2. It vanishes at the centerline and changes sign across the core.

A genuine normal tube is F_norm(t,v)=R(t)[(r+v1)e1+v3 e3+v4 e4], |v|<=b=ra (v in meters). Its Jacobian det DF_norm=-alpha(r+v1), regular for b<r. Jacobian units differ because radial u is dimensionless and normal v has SI length.

EXPLICIT DOUBLE POINT
For any 0<q<a, F_rad(0,(q,0,0))=F_rad(2 atan(q)/alpha,(-q,0,0)). At q=.05, alpha=.4/s, the time separation is .2497919786097138 s; 85-digit independent arithmetic confirms zero spatial separation.

VOLUME AND KINETIC GATES
For a full circular orbit, V_norm=8 pi^2 r^4 a^3/3. The radial absolute-Jacobian integral WITH MULTIPLICITY is pi^2 r^4 a^4. Its actual image is doubly covered and has volume pi^2 r^4 a^4/2, so V_rad_image/V_norm=3a/16. This geometric a^4 versus a^3 difference persists for arbitrarily small a.

Despite this, for isotropic uniformly labeled balls and rdot=0, both parameterizations have exactly the same mean kinetic quantity: 2T=r^2 alpha^2+(r^2 a^2/5)(alpha^2+2 beta^2). Equality of second moments is not equivalence of embedded supports.

NUMERICAL AND CODATA
At r=2 m, alpha=.4/s, beta=.7/s, a=.1: normal core radius .2 m, b*kappa=.1, T=.32456 m^2/s^2 for both parametrizations; V_norm=.421103121113146 m^4; radial image=.007895683520871489 m^4; ratio=.01875. SymPy exact algebra, independent 85-digit mpmath integrals, NumPy finite differences and explicit overlap tests PASS.
CODATA 2022 NIST speed of light c=299792458 m/s, standard uncertainty 0 (exact SI). Synthetic centerline v=.8 m/s gives v/c=2.6685127615852166e-9. Fitting alpha=c/r gives zero residual by construction, NOT an independent prediction.

CORRECTION STATUS
Retain SAT UI radial generator and Aldus kinetic formula for their actual defined coordinates. Correct the label 'worldline-normal B3 core' when the fiber is x0-orthogonal rather than gamma'-orthogonal. This is Euclidean kinematics, not a Kerr/ER solution, Lorentzian worldtube, or established SAT/H(s)H mechanism. No BEDROCK, Contents, signet, or search-lane changes.
