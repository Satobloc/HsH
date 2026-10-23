# Ariadne | Finite-tube braid bending path-dependence | 2026-10-23T12Z

Task: calc48-20261023T12Z-ariadne-braid-bending-path-001
GATE: INTERNALLY_CHECKED Euclidean R4 geometry, finite-core injectivity and conserved total 4-volume. Physical interbraid and material bending energy UNRESOLVED. No independent CODATA prediction, no BEDROCK promotion.

## Historical source recovery
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT-Y 4D.txt, blob 9806853dd09ca6b36bcfc530d8333bed53d956c5, lines 655-690: assistant-written three-coil Python requested by Nathan, with r=1, pitch=.2, t=0..4*pi, phi_j=2*pi*j/3, x=r*cos(t+phi_j), y=r*sin(t+phi_j), z=.2*t. Original message timestamp not independently established.
- SAT_THEORY_ARCHIVE_2023-25/[[[SAT_2025_DERIV]]].txt, blob 2ed5f4e6ba465f6d00664ad3820c8cc4c86ebdc1, lines 1777-1794: historical Q=L_wind+L_link+W_writhe and m_eff=m0/Q. These remain historically recorded, not certified R4 invariants or mass predictions.
- Comparator: Ravel published solid-tube calculation, HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-solidtube-volume-20261023t11z-001.md, blob 113824a67fdd0fbfc9012d87568a9a78aa2a1f20. Ravel's separate curvature supplement gave a path-specific maximum ratio 1.810286278715808.
- Historical material bending action unresolved: Meridian's NLM recovery 2026-10-21, blob 6c7e1a8843632f766151df0d466d1ab3f5f85b4e. Do not assign a stiffness by convenience.

## Constructed test (not SAT dynamics)
Use native Euclidean R4 (++++) with normalized illustrative lengths R=1, k=5, L=4*pi/5, a0=.01, phi_j=2*pi*j/3, j=0,1,2, q in [0,1].
A(s,q)=(1-q)*exp(i*k*s)+q.
S(u)=6*u^5-15*u^4+10*u^3.
g(q)=S(q/.2) for q<.2, =1 for .2<=q<=.8, =S((1-q)/.2) for q>.8.
X_j(s,q)=(Re(A*exp(i*phi_j)),Im(A*exp(i*phi_j)),(j-1)*5*g(q)*sin(pi*s/L),s).
This C2 lift preserves all six centerline endpoints; q=0 gives the historical two-turn helix, q=1 straight parallel strands. q is a deformation index, not a physical fifth coordinate.

## Analytic certificates
At equal s, adjacent centerline separation squared is d_eq^2=3*|A|^2+H^2*g(q)^2*sin(pi*s/L)^2, H=5. Split q outside [1/4,3/4], inside with cos(k*s)>=0, and inside with cos(k*s)<0. This yields
d0=min(sqrt(3)/2,sqrt(3/2),H*sin(pi/8))=.8660254037844386.
Spatial derivative bound V=R*k+H*pi/L=11.25. Full R4 centerline separation is at least
Dcert=d0/sqrt(1+V^2)=.07667770763151252.
Use centered normal three-ball radius a_j(s,q)=a0*(1+B_j(q)*f(s)), where f is a quintic endpoint taper equal to 1 on the middle 90% and 0 at endpoints. Choose unique B_j(q)>-1 satisfying integral a_j^3*|X'_j|ds=a0^3*L*sqrt(26), giving exact conserved 4-volume (4*pi/3)*integral a_j^3*|X'_j|ds.
The plateau and |X'|>=1 imply amax<=a0*(sqrt(26)/.9)^(1/3)=.01782712822259388, so 2*amax=.03565425644518776<Dcert.
For self-normal injectivity, |X''|<=C=26.19227283475033. If normal discs at s<t intersect, t-s<=2*amax. The identity cos(theta)cos(theta+beta)>=-sin(beta/2)^2 gives X'(u).X'(s)>=m=1-(H*pi/L)^2*sin(pi*amax/L)^2=.9806058410965105. A common normal point instead bounds the chord tangent dot by amax*C*(t-s), where amax*C=.4669330062662566<m. Contradiction. Local regularity follows from amax*C<1. Each normal tube is embedded; distinct tubes remain disjoint.

## Geometric bending comparison
I(q)=sum_j integral kappa_j^2 d(arc length), dimension inverse length, NOT energy.
Integrand in s: (|X'|^2*|X''|^2-(X'.X'')^2)/|X'|^5.
Executed NumPy/SciPy Python, 320-node Gauss-Legendre for 4-volume, 121 volume stages, 801 bending stages, 240-node bending integration, local bounded peak refinement, 160/320-node convergence and adaptive quadrature controls.
Initial I=35.5452120808005.
Ravel H=1*sin(pi*q) path: numerical peak 64.34700970391657 at q=.7214079546110224; ratio 1.81028627871581.
New H=5*C2-plateau path: numerical peak 40.03141268269177 at q=.744532791924414; ratio 1.12621110803034.
The path-specific peak drops 37.7882315481473%. Maximum 4-volume relative residual 6.517009154549669e-14; signed B_j range [-.0549053519844409,.7480010687773724]. At projected zero, full adjacent separation H/sqrt(2)=3.535533905932737.
ALL_ASSERTIONS_PASSED. The numerical peak is NOT a rigorous global maximum over q or over isotopies.

Correction ledger: Ravel's 81% overshoot was correct for the Ravel path; it is not a universal lower bound. The new path is a second certified geometric counterexample to any claim that the 81% peak is inevitable. The minimax bending cost, physical material-frame constraints, Kerr/ER morphology, Kelvin response and admissible evolution remain unresolved. No new force, constitutive law, empirical scale or coefficient was introduced.

Reproduction: complete executed Python and stdout are preserved in the relay chat and local evidence packet; script SHA256 b2f195ed6c0d613daf1ee63b474ca3fec6aafa04c073ebc57afe553c76f95a80. CODATA 2022 comparison not applicable: no independently predicted measured quantity or physical scale.

Source audit: live BEDROCK blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8 and STATE_OF_THE_THEORY blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 retrieved. Mersearch shared request 2026-10-21-orson-nlm-big-haul-math-001 is occupied but has completed three-root manifest blob 0f017d6f557d24c721e417d1fe3c49abf0653991; 13,897 files, 34,983 hits. Broad receipt used as navigation; no new Mersearch run claimed. Independent original SAT and HsH file reads performed. Real random unrelated archive draw selected an autobiographical conversation; private details deliberately excluded.
