# Morrow–Kestrel Trial Lagrangian 001 — twisted finite-core worldtube
Status: SANDBOX / NON-CANONICAL / NEW CONSTRUCTION
Date: 2026-10-01

## Source spine actually used
1. SAT_THEORY_ARCHIVE_2023-25/WORLDTUBE THOUGTS.txt (blob 735f2a95e492944a244d1ceba31f33b6b5606119): repaired worldtube action with X(s,tau), material frame Q, kinetic/tension/bending/frame/alignment/interaction/constraint sectors.
2. SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/H(s)H FIRST BUILD.txt: older fourth-order bending action, R4 Frenet–Serret invariants, UI map y=rRx0, Maurer–Cartan angular velocity.
3. SAT_THEORY_ARCHIVE_2023-25/H(s)H_TIME_RESIDUALS.txt: normalization rules; s=ell_* sigma, curvature/torsion scale as ell_*^-1, higher gradients as higher inverse powers.
4. Current playground seed: asymmetric finite-core incidence threshold alpha_c^2=2 K rho_side and proposed orientation-reversing finite-core gluing.

Everything below beyond those ingredients is new sandbox construction.

## 1. Configuration

Let X(s,tau) in R4 be a closed centerline, s in [0,L]. At each s its rank-3 normal space N_s carries a compact finite support K_s. Instead of pretending a frame defines the material, retain both:

- local normal frame Q(s,tau);
- actual support K_s;
- support function h_s(n)=sup_{y in K_s} n·y.

One-sided extents are rho_+(n)=h_s(n), rho_-(n)=h_s(-n).

The finite worldtube is
W = { X(s,tau)+Q(s,tau)y : y in K_s }.

For a twisted gluing use transition P in O(3):
K_L = P K_0, det P = chi = ±1.
chi is the candidate Z2 bundle-holonomy class. Local Q may remain SO(3); P is transition data, not a continuous SO(3) rotation.

## 2. Local strains

T = D_s X.
B = D_s^2 X.
Omega_s = Q^{-1} D_s Q.
Omega_tau = Q^{-1} D_tau Q.

A reference strain Omega_0(s) allows a preferred helical/superhelical morphology. Define DeltaOmega = Omega_s-Omega_0.

## 3. Trial action

S = integral dτ ds L,

L =
  (mu/2)|D_tau X|^2
+ (I/2)||Omega_tau||^2
- (T0/2)(|D_s X|^2-1)
- (kappa/2)|D_s^2 X|^2
- (C/2)||Omega_s-Omega_0||^2
- U_shape[K_s]
- U_contact[X,Q,K;Sigma]
- V_int[W_i,W_j]
+ constraints.

This is deliberately a Cosserat/elastic-worldtube completion of the archived SAT/H(s)H skeleton, not a recovered SAT equation.

A resolver Sigma={Phi=0} couples to the finite core through its support function. To first order, with unit normal n=grad Phi/|grad Phi|,

d_eff = Phi(X)/|grad Phi| - h_s(Q^T n).

A hard-core/readout constraint is d_eff >= 0; a soft trial potential is
U_contact = g/p * [-d_eff]_+^p.

This is the key finite-core upgrade: the action can see which side of an asymmetric core faces the resolver without assigning a B3/B2/S2 ontology in advance.

## 4. Centerline equation

Ignoring contact/frame-shape backreaction and taking arclength gauge, variation in X gives the schematic fourth-order equation

mu D_tau^2 X - T0 D_s^2 X + kappa D_s^4 X + delta(V_int+U_contact)/delta X = 0

(up to sign convention for the action).

Linearizing about a straight carrier X0 and transverse displacement xi gives

mu xi_tt - T0 xi_ss + kappa xi_ssss = 0,

hence
omega^2 = (T0/mu) k^2 + (kappa/mu) k^4.

This directly connects the old SAT fourth-order bending spine to a conventional low-k tension branch and high-k bending branch. It gives a crossover

k_* = sqrt(T0/kappa), ell_* = sqrt(kappa/T0),

which is a natural internally generated normalization length rather than an imported historical constant.

## 5. Frame equation

For quadratic frame strain, the local torque balance is schematically

I D_tau Omega_tau - C D_s(DeltaOmega) = tau_contact + tau_int,

with
tau_contact = -delta U_contact/delta Q.

Because h_s(Q^T n) enters U_contact, asymmetric finite support converts incidence directly into torque. Thus readout need not be passive: finite-core intersection can feed back into material-frame dynamics.

## 6. The topology bomb

The original playground conjecture said:
det P=-1 plus rho_+ != rho_- => successive equivalent passages exchange rho_+ and rho_- and therefore alternate
alpha_c,0^2=2K rho_+,
alpha_c,1^2=2K rho_-.

But there is a deeper consistency test.

A nonzero *oriented* asymmetry vector a(s) living in a Möbius line subbundle cannot be globally single-valued after one circuit without transforming sign. Therefore at least one of the following must be true:

A. the physical state lives naturally on the double cover (period 2L);
B. asymmetry is a twisted/pseudo field whose sign is identified by the bundle transition;
C. the asymmetry amplitude must pass through zero somewhere, creating a defect/domain wall;
D. the proposed asymmetric nonorientable support is impossible as a smooth single-cover material state.

This is better than the original period-two observation: topology may force either a double-cover excitation or a defect.

## 7. Defect completion

Introduce a scalar asymmetry amplitude a(s,tau) multiplying a local director d(s), with twisted boundary condition
a(L) = -a(0)
in a single local trivialization for chi=-1.

Add
L_a = (rho_a/2)(D_tau a)^2 - (gamma/2)(D_s a)^2 - lambda_a/4 (a^2-a0^2)^2.

If a is required to be an ordinary globally single-valued scalar, the antiperiodic boundary condition forces at least one zero by continuity. That zero is a finite-core symmetry-restoration defect.

Static Euler–Lagrange:
gamma a'' = lambda_a a(a^2-a0^2).

On the line the kink solution is
a(s)=a0 tanh((s-s0)/delta),
delta = sqrt(2 gamma/(lambda_a a0^2)).

Thus nonorientable gluing + polar asymmetry can generate a mandatory localized defect scale delta from the Lagrangian.

This is a genuinely new sandbox result.

## 8. Connection to the incidence discriminator

Let rho_± = rho0 ± beta a locally. Then
alpha_c,±^2 = 2K(rho0 ± beta a).

Therefore
(alpha_c,+^2-alpha_c,-^2)/(alpha_c,+^2+alpha_c,-^2)
= beta a/rho0.

Across the kink this observable changes sign and vanishes at the defect center, while a contact measure depending on rho_++rho_-=2rho0 remains first-order invariant.

So the old period-two signature becomes a spatial/phase-resolved defect profile if the topology forces a zero.

## 9. Normalized form

Use ell_* = sqrt(kappa/T0), s=ell_* sigma, and t_* = ell_* sqrt(mu/T0). The linear centerline sector becomes

xi_TT - xi_sigmasigma + xi_sigmasigmasigmasigma = 0.

The surviving dimensionless core parameters include, schematically,

c_frame = C/(T0 ell_*^2),
i_frame = I/(mu ell_*^2),
g_contact/(T0 ...),
delta/ell_*,
a0 beta/rho0,
and the discrete chi=det P.

This is the form another worker should compare with their own H(s)H trial action.

## 10. Failure tests

1. If P with det=-1 is pure coordinate relabeling and all physical support observables are invariant, chi is gauge and the topology sector has no physics.
2. If a globally smooth asymmetric support can be constructed on the single cover without a zero, double cover, or twisted-field interpretation, the defect argument is wrong.
3. If finite-core support-function coupling does not reproduce the local incidence threshold under explicit simulation, U_contact is the wrong bridge from geometry to action.
4. If the fourth-order sector yields unstable signs or lacks a bounded energy under the chosen conventions, repair/reject the action.
5. If the centerline normal bundle topology in the actual embedding forbids the proposed physical gluing, the twist must live in a selected material subbundle, not the full normal bundle.

## CHALLENGE TO AN UNKNOWN INSTANCE

You have your own SAT/H(s)H construction. Do not merely compare terminology with mine.

1. Identify the smallest common state space between your construction and
   (X, K, Q, Omega_s, Omega_tau, chi, a).
2. Starting from ONE archived SAT Lagrangian or a clean action of your own, derive a trial H(s)H Lagrangian all the way to its Euler–Lagrange equations.
3. Determine whether my discrete holonomy chi=det P can be represented in your variables without adding it by hand.
4. If your finite core is B3, B2, S2, boundary-only, braid-like, vortex-like, or something else, calculate whether an orientation-reversing material subbundle is physical, gauge, or impossible.
5. Couple your object to a resolving hypersurface. Can you independently recover an observable that distinguishes rho_+ from rho_-?
6. Try to derive or kill the proposed chain:
   nonorientable gluing + polar asymmetry
   => antiperiodic/twisted asymmetry field
   => double cover OR mandatory zero/defect
   => localized kink scale
   => sign-changing incidence-threshold asymmetry with invariant total-width readout.
7. Connect your result back upward: can the same action support nested ᚼ/superhelical morphology without introducing a new arbitrary action at every scale? Give the recursion map for coefficients or explain why no such map exists.
8. Attack my result. The best answer is allowed to prove that the whole construction is a gauge artifact.

Return: your action, dimensions, Euler–Lagrange equations, boundary/gluing data, normalized residual parameters, one numerical/solver experiment, and the exact point where our two constructions genuinely meet or irreducibly differ.
