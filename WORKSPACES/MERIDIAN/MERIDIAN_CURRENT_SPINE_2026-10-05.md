# Meridian — Condensed Current Spine — 2026-10-05

Status: sandbox synthesis / non-canonical / current working map.

## Baseline, not conclusion

The baseline is already that SAT supplies a 4D geometric map and H(s)H supplies finite-worldtube differential geometry / constitutive mechanics. That is not the current discovery frontier.

The current Meridian frontier is narrower:

1. identify the minimum independent state variables;
2. prove which old solver quantities are equivalent readouts;
3. separate gauge/representation from geometry;
4. isolate discrete topology/branch data that matrices cannot contain;
5. force all surviving sectors through blind reconstruction and failure gates.

## Core continuous grammar

Use a local finite deformation
\[
F\in GL^+(4),\qquad F=RU
\]
with polar \(R\in SO(4)\), \(U=U^T>0\), and logarithmic strain
\[
E=\log U.
\]

Along a worldtube,
\[
A_s=F^{-1}\partial_sF.
\]

For \(F=qR\),
\[
A_s=(\partial_s\ln q)I+R^{-1}R'.
\]

Thus global scale/rotation is only a finite transform; local scale and rotation gradients are the actual differential data.

Order memory appears through BCH:
\[
\log(e^{\epsilon D}e^{\epsilon\Omega})
=
\epsilon(D+\Omega)
+\frac{\epsilon^2}{2}[D,\Omega]+\cdots.
\]

Spatial compatibility is separately tested with the coframe
\[
e^a=F^a{}_\mu dx^\mu,
\qquad
de^a=0
\]
for a locally exact deformation gradient. Nonzero \(de^a\) is incompatibility/closure defect, not automatically a force.

## Lorentzian bridge

For
\[
D=hI+\delta uu^T,
\]
the isolated eigendirection \(u\) selects a 3D equal-expansion subspace.

Commutators with the three Euclidean rotations mixing \(u\) with \(u^\perp\) generate the three symmetric boost-like partners. Together with \(\mathfrak{so}(u^\perp)\), they close as \(\mathfrak{so}(3,1)\).

Solving blindly for the invariant symmetric bilinear form gives, up to scale,
\[
G=I-2uu^T
\]
with Lorentzian signature.

If \(u(x)\) varies, \(G[u(x)]\) can acquire effective curvature while the primary construction space stays Euclidean.

Important limitation:
\[
D[u]=D[-u],\qquad G[u]=G[-u].
\]
The metric reconstructs a timelike line, not a time orientation. A separate \(\mathbb Z_2\) lift may be required globally.

## SO(4) / moving-frame bridge

For \(\Omega\in\mathfrak{so}(4)\),
\[
S=-\frac12\operatorname{tr}\Omega^2,\qquad
P=\operatorname{Pf}(\Omega)
\]
give canonical rates
\[
\alpha^2,\beta^2
=
\frac{S\pm\sqrt{S^2-4P^2}}2.
\]

For the 4D Frenet generator,
\[
S=\kappa_1^2+\kappa_2^2+\kappa_3^2,
\qquad
P=\kappa_1\kappa_3.
\]

Therefore the Whirligig two-rate description is testable as a spectral compression of ordinary 4D moving-frame geometry.

Equal rates require the special locus
\[
\kappa_2=0,\qquad |\kappa_1|=|\kappa_3|.
\]

## Recursive/superhelix bridge

A global similarity
\[
Y=rQ\gamma
\]
cannot create a new winding scale.

A local frame \(R(s)\) can.

For a Bishop-frame child
\[
X=C+\rho(N_1\cos\theta+N_2\sin\theta),
\]
the exact arclength law is
\[
\left(\frac{d\ell}{ds}\right)^2
=
(1-\rho\kappa_{\rm rad})^2+(\rho\theta')^2.
\]

This gives curvature-phase modulation and a tube/focal regularity gate near \(\rho\kappa\sim1\).

## Scale/readout bridge

For the exact Three-Spheres carrier
\[
\rho^2=R^2-d^2/3,
\]
constant similarity \(q\) preserves
\[
d/R,\qquad \rho/R,\qquad \kappa R,
\]
and the normalized collapse point
\[
d/(\sqrt3R)=1.
\]

Constant \(q\) is a ruler change. Local \(\partial_s\ln q\) is new differential geometry.

## Finite-core branch structure

Inside the frozen quadratic-contact finite-slab model, the fixed-span inverse map has exactly one positive fold.

With
\[
t=\sqrt{\frac{1-r}{1+r}},
\]
the fold condition reduces to
\[
3t^5+5t^3-2=0,
\]
whose positive root is unique because the derivative is strictly positive for \(t>0\).

Thus a binary inverse-sheet label \(\tau\) has a principled mathematical origin in that model. Structural stability under higher-order contact and anisotropic fiber corrections remains open.

## Worldtube mechanics

A local load on an extended filament can produce a distributed static response through ordinary tension/bending mechanics:
\[
B y''''-Ty''+\mu^2y=F\delta(s).
\]

This supplies a conventional extended-object response mechanism that must be distinguished from literal backwards-in-time signalling.

## Current strongest exact/near-exact convergences

- six SO(4) rotation channels → two canonical invariant rates;
- 4D Frenet generator → the same two-rate invariants;
- 3+1 expansion anisotropy → Lorentz algebra + Householder invariant metric;
- global UI similarity cannot generate higher-order winding;
- constant UI scale leaves dimensionless Three-Spheres invariants fixed;
- recursive Bishop-frame speed law;
- finite-slab fold uniqueness in the frozen quadratic-contact model;
- stretch/rotation noncommutation produces shear and closed-loop order residue.

## Highest-value discriminators

1. Blindly reconstruct \(F(s)\) from actual archived UI/Whirligig/superhelix fixtures.
2. Compare polar \(R,U\), Frenet \(\kappa_i\), and canonical \(\alpha,\beta\) on the same hidden curve.
3. Run expansion tensor → generated Lorentz algebra → blind invariant metric → Householder metric → curvature pointwise on a nontrivial field.
4. Measure \(de^a\) under mesh refinement to distinguish incompatibility from numerical residue.
5. Test all six plane differences against one hidden four-axis stretch field and its cycle-closure identities.
6. Quantify accumulation of the Bishop recursion correction over multiple ᚼ levels.
7. Test variable \(q(s)\) in SPHERES4.
8. Perturb the finite-core fold away from quadratic contact.
9. Run the \(\mathbb Z_2\) eigenline-lift solver on actual meshes.
10. Keep topology, inverse-branch data, and orientation-lift data separate from local matrix deformation until a derivation identifies them.

## Durable checkpoint chain

Recent relevant commits include the cone-curvature gate, stretch-cycle closure, Householder curvature, finite-slab fold theorem, basis-free Lorentz recovery, global-UI no-go/local-connection upgrade, Frenet-to-SO(4) rate map, recursive Bishop law, scale-covariant carrier gate, and Z2 orientation gate.

Nothing in this file is promoted to canonical theory.
