# EXP001 — Force-free helix centroid / rectilinear-limit check

**Date:** 2026-10-05  
**Status:** SANDBOXED mathematical result; kinematic success, dynamical interpretation still open.  
**Question:** can a regularly coiled microscopic carrier have a straight coarse-grained trajectory?

Take a uniform helix in Euclidean carrier space with axis unit vector (e_parallel) and orthonormal transverse vectors (e_1,e_2):

[
X(s)=X_0+v_parallel s,e_parallel
+rig[cos(ks)e_1+sin(ks)e_2ig].
]

Then

[
X'(s)=v_parallel e_parallel
+rkig[-sin(ks)e_1+cos(ks)e_2ig],
]

and

[
X''(s)=-rk^2ig[cos(ks)e_1+sin(ks)e_2ig].
]

Under unit-speed arclength,

[
v_parallel^2+r^2k^2=1.
]

Average over one winding period (P=2pi/k):

[
ar X(s)
equiv rac1Pint_s^{s+P}X(sigma),dsigma
=
X_0+v_parallel(s+P/2)e_parallel.
]

The phase-dependent transverse terms integrate exactly to zero. Therefore

[
oxed{ar X'(s)=v_parallel e_parallel},
qquad
oxed{ar X''(s)=0}.
]

Equivalently, the period-averaged tangent and acceleration are

[
langle X'angle_P=v_parallel e_parallel,
qquad
langle X''angle_P=0.
]

## Result

A regular helix **does** possess an exactly rectilinear coarse-grained centroid/axis trajectory. The microscopic curve accelerates centripetally while the one-period coarse trajectory has zero acceleration.

This establishes a kinematic possibility:

[
	ext{persistent microscopic coiling}
;
otRightarrow;
	ext{macroscopic non-rectilinear motion}.
]

It does **not** yet derive Newton's first law. That requires the H(s)H action to make constant (r,k,v_parallel) (or an equivalent framed-tube state) a stable/extremal force-free solution, and to show that perturbations of the axis obey the appropriate inertial equation.

## Next discriminating calculation

Promote the helix parameters to slowly varying collective coordinates:

[
R(	au),quad hat e_parallel(	au),quad r(	au),quad k(	au),quad phi(	au),
]

insert the ansatz into the current H(s)H action, integrate over one or more fast winding periods, and derive the effective slow action (S_{m eff}[R,hat e_parallel,ldots]).

The Newtonian-emergence conjecture earns real content only if the force-free slow Euler–Lagrange equation yields

[
oxed{M_{m eff},ddot R=0}
]

without imposing rectilinearity as a separate constraint.

## Response / defect branch

Once the force-free state is established, perturb (r,k,Omega,K) around the preferred state. Linearize the constitutive equations and inspect eigenmodes for:

- slack / over- / under-tension;
- recoil/rebound after localized impediment;
- deflection of the slow axis;
- stable or metastable coil defects;
- parity/chirality flip;
- helical-plane flip.

Only after such modes are derived should downstream particle-creation/quantum-foam/background-production interpretations be attached.
