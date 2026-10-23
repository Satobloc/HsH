# Ravel | Fixed-endpoint, volume-preserving solid-tube braid gate | 2026-10-23T11Z

Task: calc48-20261023T11Z-ravel-solidtube-volume-001
Status: INTERNALLY_CHECKED Euclidean R4 geometry; UNRESOLVED physical admissibility; no independent CODATA prediction; no BEDROCK promotion.

## Primary provenance
HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT-Y 4D.txt, Git blob 9806853dd09ca6b36bcfc530d8333bed53d956c5, lines 650-695: Nathan requests a three-coil plot; assistant supplies r=1, pitch=0.2, t in [0,4*pi], phases 2*pi*j/3, x=r*cos(t+phase), y=r*sin(t+phase), z=pitch*t. Individual message timestamp not authenticated.
SAT [[[SAT_2025_DERIV]]].txt, blob 2ed5f4e6ba465f6d00664ad3820c8cc4c86ebdc1, lines 1777-1787: Q=L_wind+L_link+W_writhe, labeled topological invariant in assistant-generated compilation. Creation metadata 2025-10-27 is compilation metadata, not an independently authenticated original derivation date. Q invariance under R4 ambient isotopy is NOT established.
Prior Tern fixed-endpoint calculation: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-fixed-endpoint-20261023t10z-001.md, blob eb8bce9ad1c5f8ffecfc3e91d0be37f34e3d04ad.

## Construction and new finite-core certificate
Set R=1,k=5,L=4*pi/k,H=1,a0=0.01, phi_j=2*pi*j/3, b_j=j-1, q in [0,1], s in [0,L].
A(s,q)=(1-q)*exp(i*k*s)+q.
X_j(s,q)=(R*Re(A*exp(i*phi_j)), R*Im(A*exp(i*phi_j)), b_j*H*sin(pi*q)*sin(pi*s/L), s).
Each endpoint center is fixed for all q; q=0 is the archived two-turn braid; q=1 is three straight strands. This is a family of alternative R4 histories, not a physical unbraiding process.

The previously certified interstrand centerline lower bound is
Dcert=d0/sqrt(1+V^2)=0.04275192152953738,
d0=min(sqrt(3)*R/2,sqrt(3/2)*R,H*sin(pi/4)*sin(pi/8))=0.27059805007309845,
V=R*k+H*pi/L=6.25.

Let each strand have a 3-ball normal cross section of radius a_j(s,q)=a0*(1+b_j(q)*f(s)). f(s) is a quintic C2 endpoint taper: f=0 at s=0,L and f=1 on [L/20,19L/20]. Choose the unique b_j(q)>=0 satisfying
integral_0^L a_j(s,q)^3*|X'_j(s,q)| ds = a0^3*L*sqrt(26).
This preserves each solid 4D normal tube's volume exactly: Vol=(4*pi/3)*integral a^3 d(arc length), because the linear normal-curvature term in the tubular Jacobian integrates to zero over centered 3-balls. At q=0, b=0. The endpoint radii remain a0; endpoint normal-plane orientations are NOT fixed.

Existence and a uniform radius ceiling follow from |X'_j|>=1, |X'_j|<=sqrt(26), and the taper plateau covering 90% of L:
0<=b_j(q)<=Bcap=(sqrt(26)/0.9)^(1/3)-1,
amax=a0*(1+Bcap)=0.01782712822259388.
Hence 2*amax=0.03565425644518776 < Dcert. All distinct finite solid tubes remain disjoint.

New individual-tube normal-coordinate injectivity proof:
C=sqrt((R*k^2)^2+(H*(pi/L)^2)^2)=25.04878053418968 bounds |X''|.
Suppose two radius-amax normal discs on one strand intersect at parameters s<t. Their shared point implies t-s<=2*amax (from the w coordinate) and chord X(t)-X(s)=n_s-n_t with n_s perpendicular X'(s), n_t perpendicular X'(t), |n|<=amax. For u between s and t,
X'(u).X'(s)>=1+[R*k*(1-q)]^2*cos(2*k*amax)-[H*(pi/L)*sin(pi*q)]^2>=1,
since sin(pi*q)<=pi*(1-q) and cos(2*k*amax)=0.9841517141487098 > (H*pi^2/(L*R*k))^2=0.6168502750680849.
Thus chord.X'(s)>=t-s. But the common normal point also gives chord.X'(s)=n_t.(X'(t)-X'(s))<=amax*C*(t-s). Since amax*C=0.4465478224026131<1, contradiction. The normal-ball map is globally injective; local regularity follows from the same curvature bound. These are genuine embedded solid 4D tubes, not only disjoint centerline exclusion neighborhoods.

## Actual execution and numerical results
Python/NumPy/SciPy: 320-node Gauss-Legendre volume integration, 81 q values, brentq radius solves, independent adaptive quad at final q, derivative and endpoint assertions.
Initial one-strand length=12.81523379553127; final length=2.513274122871834.
Final taper b for each strand=0.7480010687773818; final maximum radius=0.01748001068777382.
Maximum relative volume residual on grid=6.461498003318411e-14.
ALL_ASSERTIONS_PASSED.
Executed script SHA-256: cd02b8fd0cbbb53600a95f4a471ac623423977597a1787f2bdcecea87403517a (full code and output in Calculation Relay chat and local packet).

## Failure controls, interpretation, CODATA
Removing the z lift at q=1/2 makes the xy projection collision a real collision; retaining the z lift yields adjacent separation 1/sqrt(2) at projected zeros. Projected winding changes from 2 to 0 without intersection. The new result shows that fixed centerline endpoints, fixed endpoint core radii, finite thickness, self-embedded normal tubes, and conserved Euclidean 4-volume still do not by themselves protect projected braid winding. This does NOT establish physical admissibility, Kerr/ER core topology, constant physical density, fluid dynamics, or a force/energy law. Incompressible normal-volume preservation is a controlled geometric condition, not an imported SAT constitutive law. No versioned CODATA quantity is predicted; comparison/residual not applicable.

## Mandatory reading and privacy
Live BEDROCK blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8 and subordinate STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 fetched complete; controlling ND-2026-10-18-02/03, BR-006/007/008 and newer October 22 directives examined. Actual secrets.randbelow draw selected SAT [[[SAT_2025_DERIV]]].txt (234128 characters, 6319 lines) and unrelated SAT MISC/A SELECTION OF GOTHOSLAVIC LITERATURE.txt, blob ec92ee8bb309723bc0369fbe0112a09ffc510820 (112031 characters, 1469 lines). Both fetched complete; relevant mathematical sections and dispersed unrelated passages read. The latter is constructed speculative Gothoslavic literature, not verified historical linguistics. No personal/restricted material reproduced.
Mersearch instructions fetched, shared request file blob 662e4a99e47a48e1e573cf0dddffaf1329dd60dd occupied by 2026-10-21-orson-nlm-big-haul-math-001. Not overwritten. No new Mersearch run claimed. Bounded primary-file reads used.

Gate: INTERNALLY_CHECKED for the exact R4 control, UNRESOLVED for physical H(s)H admissibility and inherited Q dynamics.
