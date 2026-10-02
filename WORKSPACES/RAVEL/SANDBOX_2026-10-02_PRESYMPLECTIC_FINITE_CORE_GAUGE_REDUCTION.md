# Ravel sandbox checkpoint — presymplectic finite-core gauge reduction

**Date:** 2026-10-02  
**Status:** sandbox construction; not canonical SAT/H(s)H  
**Question:** What is the smallest finite-core state that makes arbitrary UI/normal-frame rotation gauge while retaining genuine material rotation as a dynamical degree of freedom?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt` — **full sequential read** of all seven sections (SHA `384b40a595d41daa4c573218022a0b802ad3deee`). Retained only the calls for (SO(4))/framed-curve kinematics, symplectic geometry, invariant-preserving numerics, and medium-response kernels. Lattice, automatic (Z_3), mass-selection, BV/AKSZ necessity, and other strong interpretations were not imported.
2. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H HEAVY TOOLBOX.txt` — **full connector read**; the tracked blob is empty (SHA `aa021ed7839bc6417035e3bd09fcdc4ed1bd1bb3`). No content claim is made.
3. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D_Covariant_Import_Guidelines.txt` — **full sequential read** (SHA `d31f22e5e1431452ba91cdea32dd20d6f8da4ee3`). Retained its no-hidden-gauge-fixing, rank-discipline, and operational-interpretation controls.
4. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md` — **full sequential read** (SHA `8b5b8768527dfff5b198e324b2f823257889f385`). Retained its distinction between conjugacy-invariant linear closure and origin-dependent translation.
5. `Satobloc/HsH/WORKSPACES/COMMON/MERIDIAN_HANDOFFS/COMPTROLLER_RUN_099_FRAME_ROTATION_INTERFACE_INVARIANCE.md` — **full sequential read** (SHA `a6fe17ce06733441027d2aa9e9929a10209737ca`). Retained the static test showing that a supplied frame rotation changes the relative-frame channel but not center-only Three-Spheres geometry.
6. Google Drive — **indexed collision search** for presymplectic/frame/material-orientation constructions; no results.
7. Slack — **indexed collision searches**. Related prior packets say transported orientation is conditionally observable, but no presymplectic null-direction or (SO(3)/H) construction was found.

## Object and dimensional type

Let (gamma(s)) be a center curve in the local four-length-coordinate model. Its normal fiber is three-dimensional:

[
N_sgammasimeqmathbb R^3.
]

A finite normal core at (s) has:

- scale (a(s)ge0);
- a carrier symmetry/stabilizer group (Hsubseteq SO(3));
- material orientation class
  [
  [G(s)]in SO(3)/H.
  ]

Examples:

| Carrier | Stabilizer (H) | Continuous orientation data |
|---|---:|---:|
| isotropic unmarked (B^3) | (SO(3)) | none |
| axis-marked/material (B^2) | (SO(2)) | (SO(3)/SO(2)simeq S^2) |
| patterned threefold boundary | (C_3) | (SO(3)/C_3) |
| fully marked triaxial core | ({e}) | (SO(3)) |

The local configuration space including the centerline limit is the cone

[
oxed{
mathcal C_H=
rac{[0,infty)	imes SO(3)/H}
{{0}	imes SO(3)/Hsim *}.
}
]

Every orientation is identified at the apex (a=0). Thus “phase becomes undefined at collapse” is not an extra rule: it follows from the state-space geometry.

## Redundant solver frame versus material frame

Let (F(s)in SO(3)) be an arbitrary orthonormal frame chosen in (N_sgamma), and (U(s)in SO(3)) the material orientation expressed in that frame. The physical orientation is

[
G=FU.
]

A change of normal-frame coordinates (R(s)in SO(3)) acts as

[
Fmapsto FR,qquad Umapsto R^{-1}U,
]

leaving (G) unchanged. This is the UI/solver-frame gauge action.

A connection (A=F^{-1}D_sF) transforms in the usual inhomogeneous way, while the material strain

[
Xi=U^{-1}(partial_s+A)U
]

is gauge invariant under the paired transformation.

## Presymplectic construction

On the physical finite-core state, take the canonical one-form

[
Theta
=
int dsleft[
p_a,delta a+
leftlanglePi,G^{-1}delta Gightangle
ight],
qquad
Omega=-deltaTheta.
]

Pull this form back to the redundant variables ((F,U)). For (epsilon(s)inmathfrak{so}(3)), the infinitesimal frame-gauge vector is

[
Z_epsilon:
qquad
delta F=Fepsilon,qquad
delta U=-epsilon U.
]

It gives (delta G=0), so

[
oxed{iota_{Z_epsilon}Omega=0.}
]

Arbitrary UI/normal-frame rotation is therefore a presymplectic null direction.

By contrast, a material rotation

[
Y_eta:
qquad
delta F=0,qquad
delta U=Ueta
]

gives (G^{-1}delta G=eta). It has a nonzero canonical pairing with (Pi) unless (etainmathfrak h), the continuous stabilizer algebra. Hence material rotations outside (H) are dynamical; rotations inside (H) are unobservable carrier symmetries.

### Linearized rank check

Near the identity write (Fsimeq I+f), (Usimeq I+u). Then

[
Omega_{m lin}
=
delta p_awedgedelta a+
sum_{i=1}^3deltaPi_iwedge
delta(f_i+u_i).
]

For the fully marked carrier, the (11	imes11) antisymmetric matrix has

[
operatorname{rank}Omega_{m lin}=8,
qquad
operatorname{nullity}Omega_{m lin}=3,
]

with exact null vectors (delta f_i=-delta u_i). A direct numerical matrix-rank check reproduced this.

For the axisymmetric (B^2) carrier, imposing the stabilizer momentum constraint removes the axial conjugate momentum and gives one additional material null direction:

[
operatorname{nullity}=3+dim SO(2)=4
]

on the reduced constraint surface. A discrete (C_3) stabilizer adds no infinitesimal null vector but still imposes a global identification.

## Minimal Hamiltonian scaffold

A compatible local Hamiltonian is

[
mathcal H
=
rac{p_a^2}{2m_a}
+
rac12
leftlangle
Pi,mathbb I(a)^{-1}Pi
ightangle
+
V(a,Xi,gamma,R_Sigma).
]

This does not specify the constitutive functions. It only types them. If ordinary finite-support geometry gives (mathbb I(a)propto a^2), finite rotational energy in the centerline limit requires

[
Pi=O(a),
]

while bounded angular velocity gives the stronger scaling (Pi=O(a^2)). The orientation channel therefore disappears continuously as the cone apex is approached.

## Candidate-family comparison

- **Unmarked (B^3):** all internal (SO(3)) rotations are stabilizer directions. A solver that reports material phase has introduced unsupported labels.
- **Restricted (B^2):** the material axis is physical, but spin about that axis is gauge unless an additional mark is supplied.
- **Patterned (S^2)/(C_3) boundary:** full continuous orientation survives modulo the discrete (C_3) identification.
- **Finite-thickness resolver:** thickness does not create material degrees of freedom. An anchored resolver can make only a relative orientation, such as (G^{-1}F_Sigma), observable.
- **Layered architecture:** bulk carries (a), support/boundary selects (H), and readout selects which quotient variables are accessible. This is the cleanest typing.

The centerline representation is recovered at the cone apex (a=0), where (H) effectively enlarges to (SO(3)).

## Consequence for existing solver records

RUN 099 correctly showed that a supplied frame rotation changes the typed relative-frame channel. The present reduction adds a necessary distinction:

[
oxed{
	exttt{frame}
ightarrow
{	exttt{coordinate_frame},
	exttt{material_frame},
	exttt{resolver_frame}}.
}
]

A change in a coordinate frame must be presymplectic-null. A change in a material or resolver frame can be physical through their relative orientation. Without this typing, a gauge change can masquerade as a ᚼ state change.

RUN 141’s conjugacy-safe residual is compatible with this result: invariant loop information must survive the appropriate frame quotient before it is scored.

## Exact solver discriminator

For one fixed finite-core state:

1. apply an arbitrary local (R(s,t)) to (F);
2. apply (R^{-1}) to the coordinate representation (U);
3. recompute action, (Xi), readout, and presymplectic spectrum.

A conforming solver must show:

[
Delta G=DeltaXi=Delta S=Delta R_Sigma=0
]

and exactly three frame-gauge zero modes for a fully marked carrier.

Then rotate (U) while holding (F) fixed:

- unmarked (B^3): no response;
- axisymmetric (B^2): no response for the axial (SO(2)) direction, response for the other two;
- (C_3)-patterned carrier: response in all three infinitesimal directions, with discrete (C_3) equivalence.

This is a zero-parameter representation-invariance benchmark.

## Failure boundary

The construction is local and fails or requires enlargement when:

- the resolver or medium physically anchors what was called (F);
- the normal bundle requires multiple patches and transition functions;
- the cross-section deforms beyond scale plus rigid orientation;
- dissipation requires contact/metriplectic rather than symplectic dynamics;
- reconnection changes (H) or the carrier topology;
- a solver uses raw endpoint-frame matrices as observables without quotienting coordinate gauge.

## Next dependency

Meridian/Calder: retype every `frames_SO4` field in the shared solver record as coordinate, material, or resolver frame; then run the paired gauge transformation and verify the predicted nullity (3+dim H). Any nonzero action/readout change under the coordinate-frame test identifies a hidden gauge leak.
