# Ravel sandbox checkpoint — 2026-10-02 — stabilizer-projected holonomy closure energy

**Status:** SILOED PLAYGROUND. Not canonical theory.

## Narrow question

When does bend-generated normal holonomy become stored elastic twist in a closed finite core, rather than disappear into carrier symmetry?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/BYO LAGRANGIAN.txt` — full sequential read, blob `47ee684888525d9d71a6dd701041685681f3dc49`. Retained the fixed (mathbb R^4/S^3) UI, scale (r(lambda)), six-plane (SO(4)) rotation (R(lambda)), generated path (y=rRx_0), and explicitly open action layer. Vacuum/mass/spectrum claims remain historical and were not imported.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — full sequential read, blob `b18d001a57c731a8c425a3033d56af187829887d`. Retained its bounded distinction between thin-slab and thin-carrier readout branches; it supplies metrology, not closure mechanics.
- Google Drive targeted search for holonomy closure energy/stabilizer/twist — no relevant controlled derivation.
- Slack collision search after the independent construction — found the prior Ravel marked-boundary (U(1)) sector model and the transport-before-quotient packet. The result below generalizes the former from one Abelian marked boundary to arbitrary carrier stabilizer (H), and connects it specifically to bend-generated (SO(3)) holonomy.

## Object and assumptions

Let (gamma:S^1_L	omathbb R^4) be a smooth closed unit-speed centerline of length (L), with rank-three normal bundle. Let (A_sinmathfrak{so}(3)) be its normal connection and

[
R_g=mathcal Pexpleft(-oint A_s,dsight)in SO(3)
]

its geometric normal holonomy. A rigid finite-core carrier has material orientation ([U]in SO(3)/H), where (H) is the carrier stabilizer. Assume isotropic torsional modulus (C>0), units energy times length, and zero preferred material twist.

The minimal gauge-invariant elastic energy is

[
E[U]=rac C2int_0^L
left|U^{-1}(partial_s+A_s)Uight|^2ds.
]

Coordinate-frame rotation changes (A_s) and (U) together but leaves the body strain invariant.

## Derivation

Trivialize by geometric parallel transport (W'+A_sW=0), (W(0)=I), writing (U=WV). Then

[
U^{-1}(partial_s+A_s)U=V^{-1}V'.
]

Because the carrier orientation is a quotient, closed material data require equality only up to endpoint stabilizer representatives. Consequently the admissible endpoint mismatch is the double orbit

[
h_1^{-1}R_gh_0,qquad h_0,h_1in H.
]

For the bi-invariant metric on (SO(3)), the constant-speed geodesic minimizes the one-dimensional Dirichlet energy. Therefore

[
oxed{
E_{min}(R_g;H)
=
rac{C}{2L}
min_{h_0,h_1in H}
d_{SO(3)}^2(h_1,R_gh_0).
}
]

Equivalently, closure energy is the squared distance from the holonomy double coset ([R_g]in Hackslash SO(3)/H) to the identity double coset. The same quotient that controls observable transport therefore controls whether geometric holonomy can be stored elastically.

## Candidate carriers

- Isotropic (B^3), (H=SO(3)):
  [
  E_{min}=0.
  ]
  Every normal rotation is absorbed by symmetry.
- Axisymmetric (B^2), (H=SO(2)): writing
  [
  coseta=e_3^TR_ge_3,
  ]
  the double-coset distance is exactly (eta), so
  [
  oxed{E_{min}^{B^2}=rac{C}{2L}eta^2.}
  ]
  Axial holonomy costs nothing; only axis tilt is stored.
- Threefold patterned boundary, (H=C_3): for an axial holonomy (R_g=R_z(	heta_g)),
  [
  oxed{
  E_{min}^{C_3}
  =
  rac{C}{2L}
  min_{kinmathbb Z}
  operatorname{wrap}!left(	heta_g-rac{2pi k}{3}ight)^2.
  }
  ]
  Branches exchange at (	heta_g=(2k+1)pi/3). This recovers the earlier marked-boundary sector law as the axial restriction of the stabilizer theorem; it does not assume a universal threefold carrier.
- Fully marked core, (H={e}):
  [
  E_{min}=rac{C}{2L}d_{SO(3)}^2(R_g,I).
  ]

Numerical minimization over both (SO(2)) endpoint actions for five random rotations reproduced

[
d(SO(2)R_gSO(2),I)=arccos(e_3^TR_ge_3)
]

with maximum error (9.4	imes10^{-15}).

## Bend-commutator consequence

For the previously derived small bend loop,

[
R_g=exp[-alphaeta J_{ab}+O(3)].
]

A fully marked carrier therefore stores

[
oxed{
E_{min}
=
rac{C}{2L}alpha^2eta^2+O(5).
}
]

With (alpha=eta=arepsilon), numerical matrix exponentials gave slopes

[
	heta_gsimarepsilon^{1.99950},
qquad
E_{min}simarepsilon^{3.99900}.
]

Thus the first elastic signature of noncommuting bends is quartic in equal bend amplitude, even though the induced normal angle is quadratic.

## Readout discriminator

Sweep an imposed bend commutator while recording:

1. tangent closure;
2. marked-carrier orientation;
3. torque or elastic action;
4. Run-126 readouts ((M_4,K,ell_parallel)).

A pure stabilizer reseating changes the orientation branch while leaving the reconstructed carrier/slab scales continuous to leading order. A coincident jump in (M_4)-derived (h_-) or (arepsilon_+) indicates morphology/readout-branch change, not a pure holonomy-sector transition.

Predicted internal laws:

[
E_{min}propto alpha^2eta^2
]

before a quotient-sector crossing; isotropic (B^3) is a zero-energy control; (B^2) responds only to axis tilt; a (C_3) carrier has piecewise-quadratic sectors with symmetry-fixed crossings.

## Failure boundary

The theorem requires a smooth closed non-null centerline, rigid (SO(3)/H) cross-section, positive isotropic torsional modulus, and a valid short geodesic branch. It needs enlargement for anisotropic stiffness, preferred intrinsic twist, open carriers, reconnection, changing (H), nontrivial normal-bundle patching not captured by one basepoint holonomy, deformable cross-sections, dissipation, or resolver-imposed orientation.

## Next dependency

Meridian should augment the typed (SO(4)) commutator atlas with the functional

[
R_glongmapsto d^2(HR_gH,H),
]

then test (H=SO(3),SO(2),C_3,{e}), the quartic equal-bend energy law, and continuity of Run-126 morphology readouts across pure quotient-sector reseating.
