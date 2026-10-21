# Meridian correction — 3D rotation is curvature of 4D material history

**Date:** 2026-10-21. **Status:** Nathan Direct geometrical clarification; executed kinematic example; NOT a new metric field equation or model-specific optical prediction. Native first: ambient R4 with Euclidean (++++) and c=G=hbar=1.

## Corrective statement

Nathan Direct: **"3D rotation absolutely is 4D curvature. All 3D acceleration is."**

Meridian previously called rotation "not curvature" while discussing the Maurer–Cartan curvature of a pure rotation-frame connection and/or the intrinsic Riemann tensor of an ambient or effective spacetime metric. That categorical wording was a **category error** relative to the SAT/H(s)H usage of curved *material histories*, worldlines and worldtubes. Correct distinction:

1. Rotating material off its axis traces a four-dimensional curved history (a helical curve) and, in a finite object, a congruence of such curves.
2. The curve has **extrinsic, Frenet-type curvature** even if the ambient Euclidean metric is flat.
3. The intrinsic Riemann curvature of the surrounding metric, and the curvature of a pure-gauge SO(4) moving-frame connection, are different tensors. The statement `F[A=R^-1 dR]=0` neither sets the material curve's second fundamental form to zero nor makes its acceleration disappear.
4. The material surface/envelope of an unchanging rotating body can be geometrically identical as an unlabelled spacetime set to the envelope of a nonrotating body, while marked material trajectories inside it differ. To retain rotation one must retain **material labels/flow**, not merely the outer boundary.

This separation is consistent with `BEDROCK.md` ND-2026-10-20-02 (rotating flow has nonzero normal acceleration, no volume expansion, flat ambient R4), `🔑/B_IS_INVERSE_REFRACTIVE_INDEX.md` ("Worldtube bending is acceleration. Worldtube angle is speed. Worldtube helicity is orbit/oscillation"), and `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH ARCHITECT.txt` (Nathan Direct physical spinning structures have helical worldtubes). It also agrees with `WORKSPACES/MERCER/SANDBOX_WORLDTUBE_CURVATURE_RAPIDITY_2026-10-08.md`.

## Exact native 4D control

Specify a fixed inertial simultaneity slicing and w measured in units of length. For material orbit radius R>0, angular rate omega, with speed v=R omega and |v|<1 for the optional Lorentzian comparator, its native R4 path is

`X(w)=(R cos(omega w), R sin(omega w), 0, w)`.

Then

`X' = (-R omega sin, R omega cos, 0, 1)`,
`X'' = (-R omega^2 cos, -R omega^2 sin, 0, 0)`,
`X'·X''=0`,
`|X'|^2=1+R^2 omega^2`.

Therefore the Euclidean arclength curvature is

`kappa_4,E = |X''| / |X'|^2 = R omega^2 / (1+R^2 omega^2) = v^2/[R(1+v^2)]`.

Meanwhile the spatial acceleration with respect to the same w-time label is `|a_3|=R omega^2=v^2/R`. This establishes the correct relationship, not an equality of quantities with different parameterizations.

General 3D trajectory x(w), 4D lift X=(x(w),w):

`kappa_4,E^2 = [(1+|v|^2)|a|^2-(v·a)^2]/(1+|v|^2)^3`.

Because `(1+v^2)|a|^2-(v·a)^2 >= |a|^2`, for this fixed, affine time chart `a≠0 => kappa_4,E>0`. The zero-curvature limit is straight spatial motion. Crucially the 4D **ambient Riemann tensor stays zero**.

### Dimensionally typed illustrative numerical control

Use Planck-native values `R=10 l_P`, `v=0.6`, `omega=0.06 l_P^-1`. Executed Python script `/mnt/data/meridian_rotation_worldtube_gate.py` gave
- 3D spatial acceleration `a3=0.036 l_P^-1`;
- native Euclidean curve curvature `kappa_4,E = 0.026470588235294117 l_P^-1`;
- conventional Lorentzian proper curvature of the same worldline (external comparison) `kappa_4,M=gamma^2 v^2/R=0.05625 l_P^-1`.

The difference between native Euclidean and Lorentzian numerical curvatures is a measure/parameterization difference. These values do not infer material constitutive stiffness or a cosmic scale.

The plot `meridian_rotation_worldtube_4d_curvature.png` is a Class P calculation artifact produced in this conversation, *not uploaded into the GitHub repository*.

## Essential physical boundary

A 3D coordinate acceleration in a noninertial chart, or an apparent acceleration caused by a nonlinear resolver/foliation, need not signal nonzero **intrinsic bending of a physically marked material history**. Orson's independent null example `WORKSPACES/ORSON_VAY/SANDBOX_2026-10-05_RESOLVER_HESSIAN_ACCELERATION.md` has an exactly straight ambient carrier with nonzero apparent 3D acceleration from an imposed nonlinear time readout. This is a measurement- and coordinate-dependence caveat, not a refutation of the material-rotation claim.

A 3D circular orbit in a specifically chosen physically affine time slicing **does** give a curved four-dimensional material history, including in flat background geometry. No new gravitational Riemann curvature or gravitational lensing follows **merely** from this kinematic truth: additional physical interactions and/or an effective-metric derivation must be mapped from known physics rather than inserted to supply them.

## Cruller research correction

Our order should be:

`native global Cruller embedding + material flow => material 4D curvature, torsion, braid/contact history => independently typed geometric interaction/strain/energy from extant physics => effective optical/causal metric when justified => null geodesic transport / observed wink predictions`.

We must not block the first implication by requiring a nonzero ambient Riemann tensor. Nor may we jump from a curved worldtube to an optical lens without the intervening physical map.

**Change requested to prior Meridian wording:** replace unqualified "rotation is not curvature" with "rotation bends material histories, though a changing rotation frame alone need not curve the ambient metric."

**Provenance:** direct current user correction; current BEDROCK and key file; direct HsH ARCHITECT transcript; Mercer and Orson analytical fixtures. Calculation script actually executed locally. No Mersearch run invoked or new archival source-authority claims.
