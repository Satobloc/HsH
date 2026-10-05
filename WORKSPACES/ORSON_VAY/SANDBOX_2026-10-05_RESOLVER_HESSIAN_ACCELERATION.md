# ORSON sandbox — resolver-Hessian acceleration null test (2026-10-05)

Status: SILOED PLAYGROUND. Not canonical SAT/H(s)H.

## Sources actually read
1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT_O REWRITE/SAT 4D/C5.txt`, lines 1–900 requested and read. Relevant recovered construction: static/block 4D filaments; a possibly dynamic foliation; intersection geometry as apparent interaction; historical discussion that a passive foliation alone does not force intercoiling and that making the resolving surface physical requires an explicit coupling.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT BUILDING STORY.txt`, lines 1–3300 requested/read in three contiguous chunks (last tool response truncated after 900 returned lines of the third chunk). Relevant recovered construction: continuous 4D particle paths as mapping objects; internal oscillatory/helical structure and external perturbations on the same worldline; two extra hypotheses historically explored: angle-dependent timesheet/worldline transfer and transmission along filaments; explicit statement that dynamics may be allocated to filament ensemble, timesheet distortion, or mixed formulations if bookkeeping is preserved; ontology explicitly held neutral.

## Independent construction
Let a fixed carrier/worldline be X(s) in Euclidean 4-space. Let the resolving foliation be level sets of a scalar T(X), with resolved parameter t=T(X(s)). Let P project the intersection to the reported 3-space. Then r(t)=P X(s(t)).

Define T_s = grad(T)·X' and
T_ss = X'^T Hess(T) X' + grad(T)·X''.

Then
dr/dt = P X'/T_s

and
d²r/dt² = P[ X''/T_s² - X' T_ss/T_s³ ].

For a straight carrier X''=0:
d²r/dt² = - P X' [X'^T Hess(T) X']/(grad(T)·X')³.

Thus a non-affine resolver (nonzero Hessian of T along the carrier) can create apparent 3D acceleration even when the 4D carrier is exactly straight.

## Scripted check
2D reduction: X(s)=(s,b), T(x,y)=x+(eps/2)x²+eta*x*y with eps=.18, eta=.11, b=.7.
Analytic a=-eps/(1+eps*s+eta*b)^3.
Finite-difference differentiation after reparameterizing by t agreed with analytic result to max interior absolute error 1.612e-6.

## Interpretation boundary
SOURCE FACT: archive supports static-carrier + resolving-surface language and later active-timesheet/mixed-allocation formulations.
INFERENCE: the readout map itself has a calculable inertial term whenever the resolver is non-affine.
SANDBOX CONJECTURE: part of what H(s)H currently allocates to timesheet force may be cleanly factored into this universal resolver-Hessian term, leaving a smaller residual that alone requires genuine carrier deformation/backreaction.

## Discriminator / failure condition
Rigidly hold X(s) fixed and vary only T. Any apparent acceleration matching the formula above is readout kinematics, not a force on the carrier. A physical interaction claim must survive subtraction of this term. The construction fails as a physical mechanism if T is only coordinate gauge with no operationally privileged resolver, or if observables are covariant in a way that removes the effect entirely.

## Next solver
Use a 4D hyperhelix and a curved/nonuniform T(X). Numerically decompose resolved acceleration into carrier-curvature and resolver-Hessian terms, then test SO(4) rotations and foliation reparameterizations. Search for invariant residuals rather than raw apparent forces.
