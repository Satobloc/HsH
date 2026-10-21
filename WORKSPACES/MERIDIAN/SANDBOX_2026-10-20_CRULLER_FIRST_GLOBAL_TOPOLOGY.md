# Meridian | Cruller FIRST, derive the cosmic slice backwards | 2026-10-20

**Authority/status:** Nathan Direct instruction to start with the *complete Cruller* and work backward. This is an assistant **SANDBOXED** mathematical construction of a CANDIDATE global geometry, not a confirmed SAT cosmology or an adopted Klein Fabric identification. BEDROCK BR-008, ND-2026-10-20-01/02 and The Forest constraints apply. Do not revive older Back Hallways/Loop formalism. No historical Mersearch needed for this original construction; current BEDROCK and Forest files were read.

## 1. The underlying complete object first

Identify native Euclidean four-space as C^2, x=(z1,z2), and consider the punctured cover:
```text
U = R4\{0} ~= S3 x R
x(s,n) = R0 exp(s) n,    n in S3,  s in R.
```
Here s is a dimensionless radial-label coordinate, NOT a fifth physical dimension, and not automatically a physical time. R4 Euclidean line element:
```text
delta=dr^2+r^2 dOmega3^2 = r^2(ds^2+dOmega3^2).
```
A *candidate* global return construction (not assumed physically realized) is the mapping torus:
```text
M_Q = (S3 x [0,L]) / ((n,L)~(Q n,0)), Q in O(4), L>0.
```
This is an abstract four-manifold with sections S3. If Q in SO4, the mapping torus is orientable and diffeomorphic to S3 x S1 (since SO4 is path connected). If det(Q)=-1, it is nonorientable. Neither a double SO4 rotation nor arbitrary p:q windings alone proves Klein-like nonorientability. Do not identify the abstract mapping torus with an ordinary globally embedded R4 solid: by invariance of domain, a compact boundaryless four-manifold cannot embed into unquotiented R4 as a full-dimensional embedded submanifold. An honest quotient/cover/immersion/etc. must be specified if adopted. The spatial S3 section does not imply two physical shells.

## 2. Backwards: the apparently spherical spatial cut contains exact linked donut domains

Hopf coordinates on each S3:
```text
z1=R cos(chi) exp(i alpha), z2=R sin(chi) exp(i beta)
0 <= chi <= pi/2; alpha,beta are angular.
dOmega3^2=dchi^2+cos(chi)^2 dalpha^2+sin(chi)^2 dbeta^2.
```
The torus `|z1|=|z2|=R/sqrt(2)` splits S3 into **two linked solid tori** (genus-one Heegaard splitting), each topologically S1 x D2 and sharing one Clifford torus boundary T2. Their core circles form a Hopf link. These are complementary regions in ONE S3, not two independent cosmological shells. An exact stereographic projection from the x4 north pole maps the Clifford torus to the ordinary torus of revolution `(rho-sqrt(2))^2+z^2=1` (for R=1). Verified using SymPy. A 2,3 winding `(alpha,beta)=(2t,3t)` is an embedded trefoil on this torus; winding alone does not create another filament.

## 3. Where ordinary cruller rotation is a null result

The isometric two-plane rotation `Q_t:(alpha,beta)->(alpha+p*t,beta+q*t)` for CONSTANT p,q preserves the induced round S3 metric exactly, even if p != q. Thus it creates winding trajectories, but ZERO intrinsic spatial wrinkles or material strain of the round S3 under global SO4 rotation. The S3 scalar curvature stays `6/R^2`. Exact symbolic S3 tangential acceleration squared of a (p,q) trajectory is `R^2*(p^2-q^2)^2 sin(chi)^2 cos(chi)^2`, so nonzero trajectory acceleration must not be mistaken for a physically sourced gravitational dent.

The first kinematically NONRIGID cruller is a differential swirl:
```text
V=p(chi) d/dalpha + q(chi) d/dbeta
div_S3(V)=0.
E_chi,alpha= (R^2/2)*cos(chi)^2*p'(chi)
E_chi,beta = (R^2/2)*sin(chi)^2*q'(chi)
E=(1/2)Lie_V(h).
```
This has nonzero **material shear rate** if p' or q' nonzero, with ZERO instantaneous volume expansion. An advective diffeomorphism still does not change the intrinsic metric of the round ambient S3 as an unlabelled geometric space. A physically deformable finite-core fabric must supply its deformation constitutive geometry and distinguish material shear from true spacetime curvature. No arbitrary tension coefficient is inserted.

## 4. Global expansion-and-return obstructs the UNCHANGED Euclidean metric

The return identification has lifted radial map `T(x)=exp(L)*Q*x`, for orthogonal Q, L nonzero. Its pullback rescales the ordinary Euclidean metric:
```text
T*delta = exp(2L)*delta != delta.
```
Thus unmodified ambient Euclidean delta **does not descend** as a globally consistent metric on that quotient, unless L=0. This is a genuine mathematical gate, not an automatically resolved cosmological issue. A NATURAL alternative geometry that *does* descend is the conformal normalized metric:
```text
g_E_cyl=(R0/r)^2*delta = R0^2*(ds^2+dOmega3^2).
```
It is locally Riemannian, positive-definite, globally well defined under the scale+orthogonal return, and intrinsically curved (S3 scalar contribution 6/R0^2). It is not a proof that SAT physically chooses this metric: its value is to expose that global closure plus expansion has metric consequences.

If one uses the SAT candidate radial Householder reflection of Euclidean delta, `g_H=delta-2(dr tensor dr)=-dr^2+r^2 dOmega3^2` (u=dr is a delta-unit covector away from the radial origin), the 4D **Lorentzian scalar curvature is exactly 12/r^2**. Verified by direct Christoffel/Ricci symbolic calculation, even though the Euclidean ambient delta is flat. The conformally normalized radial candidate is
```text
g_L_cyl=(R0/r)^2*g_H=R0^2*(-ds^2+dOmega3^2).
```
It is invariant under `T` and has 4D scalar curvature `6/R0^2`, NOT zero. Thus at lengths small relative to R0 it can be locally almost Minkowski, but global metric flatness does NOT survive if this precise return is imposed. No gravity source or Einstein equation has been derived by these metric identities.

## 5. Conditional causal price of making the circular parameter TIME

If the quotient cylinder `g_L_cyl=R0^2(-ds^2+dOmega3^2)` is chosen as the physical Lorentzian metric and **s** is physical timelike progression, then the compact return necessarily supports CTCs. For any orthogonal Q and any starting n, `dist_S3(n,Q^k n)<=pi` on unit S3. Choose integer k with `kL>pi`; a connecting S3 geodesic over s-interval kL has speed less than one and is timelike; its endpoints are identified by Q^k. Hence it gives a closed timelike curve on the quotient. This is a theorem **conditional on the explicitly proposed compact-timelike metric interpretation**, not proof that the SAT Cruller has physically allowable CTCs, nor an argument that the topology is forbidden.

If det(Q)=-1, the orientation-reversing monodromy cannot be generated by an ordinary continuous path inside SO4. A Klein-like flip must be a genuine identification or independently specified orientation-changing structure, not just differential rotation.

## 6. Filaments, genesis and the Forest

A smooth invertible shear/winding evolution can make torus knots/links and new cross-sectional intersection components, but cannot increase the number of independently advected material connected components. A particle-creation rule and conserved or sourced baryon-number current remain unproved; nor are any stringy pair-of-pants topology changes automatically physical. Physical information transmitted between purportedly nonlocally adjacent modes still requires a realizable path in the *native* geometry (Forest). The microscopic worldtubes and local mouths must be constructed and tested rather than inferred merely from the global torus or its stereographic projection.

**Next inverse question:** Starting with a candidate Klein-compatible global return (or an explicitly nonclosing 4D alternative), derive the admissible *material finite-core strain and junctions*, then ask which invariant geometry appears on the 3D cosmic section and whether there are genuine horizons, conserved energy transport, baryon number and cross-sector predictions. Mathematical result versus physically interpreted identification must remain separate.

**Execution provenance:** SymPy executed successfully in `cruller_backward_exact_20261020.py` with independent induced-metric, scalar-curvature, torsion/winding, stereographic torus, shear and Householder-curvature checks. Class P geometric plot rendered from analytic stereographic formula in `cruller_backward_visual_20261020.py` to `cruller_s3_hopf_tori_precision_20261020.png`, all working-container artifacts. No current BEDROCK update is justified beyond the preexisting working hypothesis.

Meridian (assistant-authored).
