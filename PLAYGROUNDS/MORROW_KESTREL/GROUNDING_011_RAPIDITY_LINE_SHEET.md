# Morrow–Kestrel XI — Line/Sheet Grounding: Rapidity First, Interaction Second

Status: SANDBOX / NON-CANONICAL
Date: 2026-10-02

## Grounding source used
Current conversation upload: Pasted text(20261002-063834).txt

The source explicitly frames SAT as a two-primitive representation discipline: worldtube/line + time surface/plane. Its central methodological question is whether kinematics is enough, and its second explicit leap is that the worldtube-timesheet relation is not merely readout but some physical interaction.

This checkpoint keeps those two leaps separate from the standard-physics map.

## 1. Known map: use rapidity, not an arbitrary Euclidean angle

Let u^mu be the unit timelike normal/observer field associated with a local resolving time surface and U^mu the worldtube unit tangent. In Lorentzian signature (-,+,+,+),

-g(U,u)/c^2 = gamma_rel = cosh eta,

where eta is the relative rapidity and

beta=v/c=tanh eta.

Thus the exact standard-physics relation between worldtube tangent and time direction is hyperbolic angle. Near rest,

eta = v/c + O(v^3/c^3).

Therefore:
- rest corresponds to eta=0;
- rectilinear motion corresponds to constant eta;
- acceleration corresponds to d eta/d tau != 0;
- the 4D curve remains an exact kinematic representation before any new SAT/H(s)H dynamics are added.

The Euclidean embedding angle used elsewhere may remain a visualization/embedding variable, but it must not silently replace the Lorentzian rapidity.

## 2. Conjectural step: make the line/sheet relation constitutive

The minimal finite-core state remains

X(s,a,t)=gamma(s,t)+F(s,t)a,  a in B,

with resolver/time surface

Sigma_t={phi(x,t)=0}.

Use the existing finite-core interaction

U_res =
g integral_B W(phi(gamma+F a,t)/h) da.

The new question is not "what does the angle read out?" but:

Does U_res, or a dynamical completion of it, have a mixed response to rapidity and internal geometry?

Let eta be a collective rapidity coordinate and xi collect finite-core/sheet response modes. Expand the local Lagrangian around a stationary rest configuration:

L^(2) =
1/2 A_eta eta^2
+ eta J^T xi
- 1/2 xi^T K xi.

Here

J_i = partial^2 L / (partial eta partial xi_i)

is not a relabeled mass. It is the mixed susceptibility of internal geometry to translational rapidity.

Eliminating xi gives

xi_* = K^{-1} J eta,

and

L_eff^(2)
=
1/2 [A_eta + J^T K^{-1} J] eta^2.

Since eta ~ v/c near rest, the translational inertial coefficient is

M_eff =
[A_eta + J^T K^{-1}J]/c^2

up to the exact normalization of the collective coordinate.

This recovers the earlier collective-inertia mechanism but now grounds the collective coordinate in the exact Minkowski rapidity relation.

## 3. Soft-mode connection survives

Diagonalize

K e_n = lambda_n e_n,
J_n=<e_n,J>.

Then

M_eff =
A_eta/c^2
+
(1/c^2) sum_n |J_n|^2/lambda_n.

A finite-k mode that softens can therefore dress translational inertia only if the mixed susceptibility is symmetry-allowed:

lambda_* -> 0+ AND J_* != 0.

This preserves the previous selection rule:
soft morphology does not automatically imply inertial dressing.

## 4. What the grounding document changes

The strongest minimal program is now:

A. MAP:
Use standard worldtube kinematics exactly.
Tangent/time-surface relation = rapidity.
Acceleration = curvature / rapidity change.
No new physics here.

B. MORPHOLOGY HYPOTHESIS:
Represent additional particle properties by the smallest admissible finite-core oscillatory morphology.
This is the kinematics-enough / oscillation-hyperhelix conjectural step.

C. INTERACTION HYPOTHESIS:
Promote the time-surface/worldtube relation from pure representation to constitutive coupling.
This is where U_res and its dynamical completion live.

D. DERIVE:
Mass/inertia, coiling, defects, reconnection, etc. must arise from Hessians, response functions, bifurcations, and finite-core geometry of that action.

This prevents later SAT machinery from being imported into the bedrock.

## 5. Immediate discriminator

Hold the exact kinematic map fixed and compare two theories:

H0: the time surface is only a resolver/coordinate structure.
H1: the time surface has a physical constitutive coupling to the finite worldtube.

They can share identical gamma(t) kinematics.

The first experimental/theoretical discriminator is therefore not trajectory reconstruction. It is whether the coupled system predicts an independent response quantity, e.g.

J_i != 0,
resolver deformation,
frame torque,
energy transfer,
frequency-dependent inertia,
or a contact/phase response

that is absent in H0 and is not already inserted through standard mass parameters.

If every measurable prediction of H1 can be absorbed into a pre-existing parameter of H0, then the second leap has added no physics.

## 6. Attack

This construction fails if:
1. the proposed mixed susceptibility J is forbidden by time reversal / covariance / bundle symmetry;
2. eliminating internal modes only renormalizes an already inserted bare mass, yielding no independent content;
3. the time surface is coordinate gauge and no invariant constitutive observable can be built from it;
4. the finite-core interaction cannot be written covariantly without introducing extra structure beyond the claimed primitives.

## CHALLENGE TO AN UNKNOWN INSTANCE

Start from the two-primitive line/surface picture and do not import any SAT-specific mass formula.

1. Define the exact Lorentzian rapidity eta between worldtube tangent and local time-surface normal.
2. Construct the smallest covariant finite-core interaction that makes the line/surface relation dynamical rather than purely representational.
3. Expand around rest and compute the full mixed Hessian J_i = d^2L/(d eta d xi_i).
4. Determine which symmetry sectors force J_i=0.
5. Integrate out the allowed internal modes and derive the low-velocity M_eff.
6. Then test whether the same Hessian has a finite-k instability that can seed ᚼ.
7. If mass dressing and coiling come from the same mode, show it. If they do not, show the selection rule.
8. Kill the model if all effects can be absorbed into a conventional pre-existing mass/stiffness parameter.

Do not fit any historical SAT constants.
