# Meridian — Condensed Current Spine — 2026-10-05

Status: sandbox synthesis / non-canonical / current working map.

## Central question

If SAT is right as a largely standard-physics 4D map, H(s)H increasingly looks like the mechanics of how that 4D transformation field varies, fails to commute, fails to integrate, and acts on finite worldtubes.

## Core continuous grammar

1. Local finite deformation:
   [
   Fin GL^+(4),qquad F=RU
   ]
   by polar decomposition, with (Rin SO(4)) and (U=U^T>0).

2. Log strain:
   [
   E=log U
   ]
   separates isotropic scale from anisotropic strain/shear.

3. Local transformation connection along a worldtube:
   [
   A_s=F^{-1}partial_sF
   ]
   and for a similarity-like factorization (F=qR),
   [
   A_s=(partial_sln q)I+R^{-1}R'.
   ]

4. Higher-order/order-memory:
   [
   log(e^{epsilon D}e^{epsilonOmega})
   =
   epsilon(D+Omega)+rac{epsilon^2}{2}[D,Omega]+cdots
   ]
   and closed operation loops leave
   [
   log H_square=epsilon^2[D,Omega]+O(epsilon^3).
   ]

5. Spatial integrability gate:
   with coframe (e^a=F^a{}_mu dx^mu),
   [
   de^a=0
   ]
   iff the local transformation field is locally an exact deformation gradient. Nonzero (de^a) is geometric incompatibility/closure defect.

## Lorentzian bridge

For a 3+1 expansion tensor
[
D=hI+delta uu^T,
]
the isolated eigendirection (u) selects a 3D equal-expansion subspace.

Commutators of (D) with the three Euclidean rotations mixing (u) with (u^perp) generate symmetric boost-like matrices. Together with the three rotations in (u^perp), they close as (mathfrak{so}(3,1)).

Solving blindly for the invariant bilinear form gives, up to scale,
[
G=I-2uu^T
]
with signature (3+1).

If (u(x)) varies, this induced metric can have nonzero effective curvature while the primary construction space remains Euclidean.

Important limitation: (D), (P=uu^T), and (G) are sign-blind under (u	o-u). Time orientation requires an additional (Z_2) lift/orientation datum if nontrivial loops flip the eigenline lift.

## SO(4) / Whirligig bridge

For (Omegainmathfrak{so}(4)),
[
S=-rac12operatorname{tr}Omega^2,qquad P=operatorname{Pf}(Omega)
]
give the two canonical 4D rotation rates
[
alpha^2,eta^2=
rac{Spmsqrt{S^2-4P^2}}2.
]

For the ordinary 4D Frenet generator,
[
S=kappa_1^2+kappa_2^2+kappa_3^2,qquad
P=kappa_1kappa_3.
]

Therefore the Whirligig two-rate description can be tested as a spectral compression of ordinary 4D moving-frame geometry.

Equal canonical rates require the special locus
[
kappa_2=0,qquad |kappa_1|=|kappa_3|.
]

## Recursive/superhelix bridge

A global similarity (Y=rQgamma) cannot create new winding scales or turn a helix into a genuine superhelix.

A local frame (R(s)) can.

For a Bishop-frame child
[
X=C+ho(N_1cos	heta+N_2sin	heta),
]
the exact recursive arclength law is
[
left(rac{dell}{ds}ight)^2=
(1-hokappa_{m rad})^2+(ho	heta')^2.
]

This gives a curvature-phase modulation of recursive propagation and a focal/tube regularity gate near (hokappasim1).

## Scale/readout bridge

For the exact Three-Spheres carrier
[
ho^2=R^2-d^2/3,
]
constant similarity scaling (q) preserves
[
d/R,quad ho/R,quad kappa R,
]
and the normalized collapse point (d/(sqrt3R)=1).

Therefore constant UI scale is a ruler change. Local scale gradients
[
partial_sln q
]
are where new local geometry enters.

## Finite-core branch structure

The exact fixed-span quadratic-contact inverse map has exactly one positive fold.

Using
[
t=sqrt{rac{1-r}{1+r}},
]
the fold condition reduces to
[
3t^5+5t^3-2=0,
]
which has one positive root because its derivative is strictly positive for (t>0).

Thus a binary inverse-sheet label (	au) has a principled origin in the frozen finite-core model, but its stability under higher-order contact corrections still needs testing.

## Worldtube mechanics

A local load on an extended 4D filament can produce a distributed static response through ordinary tension/bending mechanics:
[
B y''''-Ty''+mu^2y=Fdelta(s).
]

This gives a conventional alternative to treating every separated response along a worldtube as literal retrocausal action-at-a-distance. Static block geometry and causal relaxation must be distinguished and cross-tested.

## Current strongest convergences

- UI global map -> local H(s)H connection: increasingly strong.
- SO(4) six-channel rotation -> two canonical rates: exact.
- 4D Frenet moving-frame generator -> same two-rate invariants: exact.
- 3+1 expansion anisotropy -> Lorentz algebra + Householder invariant metric: exact algebraically.
- Constant UI scale -> dimensionless Three-Spheres invariants unchanged: exact.
- Recursive child speed law in Bishop frame: exact.
- Finite-slab fold uniqueness in frozen quadratic-contact model: analytic theorem.

## Open high-priority discriminators

1. Reconstruct actual archived finite-step maps (F) and compare polar (R,U) to native rotation/strain solvers.
2. Compare Whirligig two-rate output blindly against Frenet/SO(4) invariant rates.
3. Run pointwise expansion-tensor -> blind invariant-metric -> Householder metric -> curvature chain on a nontrivial field.
4. Test (de^a) compatibility/closure defects under mesh refinement.
5. Test all six plane commutator/shear and loop-holonomy reconstructions against one hidden four-axis stretch field.
6. Test whether recursive Bishop correction materially accumulates over multiple ᚼ levels.
7. Test variable (q(s)) in SPHERES4; isolate first departures from constant-scale invariants.
8. Test finite-core fold stability under cubic/quartic contact and anisotropic fiber corrections.
9. Run (Z_2) eigenline orientation holonomy blindly on actual expansion-field meshes.
10. Keep topology/branch data separate from local matrix deformation until a derivation proves otherwise.

## Recent Meridian durable checkpoints

- 47e272741efe92e10ec7b7bfbe4f1634c4e841cd — cone-curvature gate.
- a926edd513cc10e4e045715f1e71363e49619254 — stretch cycle closure.
- 4594abc13a60d8411afe04def488e83ae135920e — Householder flow curvature.
- 430cb611320adcde463709b3a93dd9bfaaa85aca — finite-slab fold uniqueness.
- da961af16ebe81afa9dd904618220f9e99ba31d2 — basis-free Lorentz recovery.
- 8c3ab1c430485c7329b2fbaac0d55b39280fc04d — global UI no-go / local connection.
- 202f88beb49dd3f7d9a2a3b1d292ec00290dc59e — Frenet to SO(4) rate map.
- 4d0bfb4b43edf03a09da4d02670b4e876ceacf9e — recursive Bishop speed law.
- cd34b191ac8616acbdbeb06478b682c2ca0f903b — scale-covariant carrier gate.
- 5985bf9629888d8ec3ffe4d4fbd667259e81fe19 — Z2 time-orientation gate.

## Working compression

The cleanest current sandbox picture is:

[
oxed{
	ext{SAT}=	ext{4D Euclidean transformation map}
}
]

and

[
oxed{
	ext{H(s)H}=	ext{local derivatives, noncommutation, incompatibility, finite-core branch structure, and worldtube mechanics of that map}.
}
]

Nothing in this file is promoted to canonical theory.
