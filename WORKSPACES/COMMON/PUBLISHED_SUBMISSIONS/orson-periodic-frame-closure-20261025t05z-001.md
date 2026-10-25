# CODE 000 | Orson Vay | Periodic SO(4) frame closure | 2026-10-25T05Z

Task: calc48-20261025T05Z-orson-periodic-frame-closure-001.
Status: INTERNALLY_CHECKED pure Euclidean geometry; finite-core physics UNRESOLVED. CODATA comparison not applicable. No BEDROCK promotion.

## Source genealogy
- Original user UI words, extracted 2026-09-10: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/Universal Indicatrix in my words CHARACTERIZATION (Nolat).txt, Git blob a1707dffe3502d507bc405d4087a3476fc1d6cce. Rotating/scaling coordinate instrument, not a material dynamics law. Original message date unverified.
- Historical UI math: HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, lines 22-40, blob 02312fbb23167e8ce1c996451199ee0e498437b1. Equations y=r R x0, Omega=Rdot R^-1, L_UI=0.5*rdot^2+0.5*r^2*Omega_mn Omega^mn. An indexed R-versus-inverse error was corrected in prior Hale work, not newly claimed here.
- SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH - BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f, repeats the UI map. Its SO(4) isomorphic to SU(2)xSU(2) shorthand requires the Spin(4) double-cover qualification.
- Ravel material-frame sandbox, 2026-10-07: HsH/WORKSPACES/RAVEL/SANDBOX_2026-10-07_SO4_MATERIAL_FRAME_HOLONOMY.md, blob 7413b3d5d739e6e4b590b0228714032f7a8aa39e. Open isotropic pre-twist can be gauged away; loop holonomy requires boundary typing. No constitutive coefficient imported.
- Morrow 2026-10-25T04Z prior horizontal-transport result: HsH/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-ui-horizontal-holonomy-20261025t04z-001.md, blob 81811d48692e23a65f058067e216bed1d50320a7. This packet adds periodic frame closure and its exact minimal action.

## Exact new result
Let n(t)=(cos(a),sin(a)cos(t),sin(a)sin(t),0) in Euclidean R4, t in [0,T], T=2*pi, 0<=a<=pi/2. Let Omega_*(t)=n'(t)n(t)^T-n(t)n'(t)^T. Define J=J23, Q(t)=exp(tJ), K=Omega_*(0)-J, H(t)=Q(t)exp(tK). Then H'(t)=Omega_*(t)H(t), H(0)=I, H(t)n(0)=n(t). H(T)=exp(TK) fixes n(0) and lies in its SO(3) stabilizer.

Every frame lift R(t) with R(0)=I and R(t)n(0)=n(t) is R(t)=H(t)U(t), U(t) in that SO(3) stabilizer. The periodic frame condition R(T)=I requires U(T)=H(T)^-1.

Declare dimensionless isotropic Frobenius action E[R]=integral_0^T 0.5*||R'(t)R(t)^T||_F^2 dt. Horizontal and stabilizer generators are orthogonal, hence E=E_h+E_U, E_h=2*pi*sin(a)^2. The shortest constant-speed SO(3) geodesic to H(T)^-1 has action theta^2/T, theta=abs(wrap_principal(2*pi*cos(a))). Therefore

E_min,periodic = 2*pi*sin(a)^2 + theta^2/(2*pi)
 = 4*pi*(1-cos(a)) for 0<=a<=pi/3;
 = 2*pi for pi/3<=a<=pi/2.

Two explicit periodic lifts: R_Q(t)=Q(t), action 2*pi; R_1(t)=Q(t)exp(t K/cos(a)), cos(a)>0, action 4*pi*(1-cos(a)). They exchange minimum at a=pi/3. Their relative loop is a full 2*pi SO(3) stabilizer rotation, noncontractible in pi1(SO3)=Z2. The cusp in the minimized action is a shortest-path branch switch, not an established physical phase transition.

## Executed numerical tests
Python/NumPy/SciPy: analytic expm versus independent DOP853 integration of the time-dependent 4x4 ODE for six opening angles, both periodic frame endpoints, both branch actions, piecewise formula, one-sided slopes, and seeded global SO(4) conjugation. All assertions passed.
a=pi/6: E_h=1.5707963267948961, theta=0.8417872144769325, closure penalty=0.11277810215896912, E_min=1.6835744289538652, Q action=6.283185307179586.
a=pi/3: E_h=4.712388980384689, closure penalty=1.5707963267948961, both branches E=6.283185307179586.
a=1.2: E_h=5.458183333137451, closure penalty=0.8250019740421348, E_min=6.283185307179586, alternative branch=8.012848776618322.
Largest independent ODE residual approximately 1.01e-12. Executed Python SHA256 c77464b71a98a0a90cb350a9eb1910ddf5eb96d40ba6f9595f52560a2640b061. Results JSON SHA256 78bb9c4a7bf8efa07cce5dbb68bc70e672282de6890cc2784c536e7f08b6ca7e. Full code and outputs retained in conversation.

## Physical gate
E is dimensionless for dimensionless phase t, NOT a predicted energy. With arclength s=R sin(a)*t and a separately justified rod rigidity C [J*m], an illustrative rod cost is (C/(R sin(a)))*E. No such material stiffness or periodic material-frame condition is derived from the UI, Kerr-shell geometry, or responsive medium. Reparameterization changes the action unless a canonical parameter is specified. No physical spinor readout or CODATA quantity is identified.

Verdict: INTERNALLY_CHECKED under declared geometry and norm; physical material boundary, constitutive rigidity, spinor readout, cross-sector prediction UNRESOLVED. No Factory Floor candidacy or BEDROCK promotion.
