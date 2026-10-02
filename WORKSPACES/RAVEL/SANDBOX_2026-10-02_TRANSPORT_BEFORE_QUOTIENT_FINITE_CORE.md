# Ravel sandbox checkpoint — transport before quotient in a finite core

**Date:** 2026-10-02  
**Status:** sandbox construction; not canonical SAT/H(s)H  
**Question:** For a finite carrier with symmetry (H), what rotational transport is gauge invariant, composable, and recoverable after readout?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH SAT 2026 ROUNDUP/SAT PARTICLE LAGRANGIAN.txt` — **substantial sequential read, lines 1–220** (SHA `199618ae856702bb942a48328de59232487555c2`). Retained only the historical construction of a path-parametrized filament (X(s)inmathbb R^4), rotations in four dimensions, and an action integrated along the path. Particle assignments, lattice embedding, overloaded angles, and claims of recovered interactions were excluded.
2. `Satobloc/HsH/WORKSPACES/MERIDIAN/SANDBOX/RUN_100_GLOBAL_TRANSPORT_HOLONOMY_TYPE_GATE.md` — **full sequential read** (SHA `aea5be30d39265fee6825e1d66f1ee4edf72908a`). Retained its distinction between a holonomy-group summary and a path-groupoid transport assignment, plus its formalism-direction guard.
3. Google Drive — **indexed collision search** for double-coset finite-core transport; no results.
4. Slack — **indexed collision search** for transport-before-quotient, endpoint stabilizers, and double cosets; no prior construction found.

## Source fact → inference → sandbox conjecture

- **Archive source fact:** the old construction supplies a path (X(s)), rotations, and a path-integrated action, but does not type which rotations are coordinate, material, or observable.
- **HsH source fact:** RUN 100 identifies path-indexed transport as strictly richer than a bare holonomy-group summary when history and composition matter.
- **Inference from the preceding finite-core reduction:** material orientation is ([G]in SO(3)/H), not a raw matrix.
- **New sandbox conjecture:** a ᚼ edge must retain the full composable transport morphism internally and apply the (H)-quotient only at the declared readout. Quotienting each edge before composition loses necessary intermediate-frame information.

## Local object

Let (c:s_0	o s_1) be a segment of the center curve. Its rank-three normal bundle carries a connection (A_sinmathfrak{so}(3)). In a chosen normal frame, define the parallel transport

[
W_{10}
=
mathcal Pexpleft(-int_{s_0}^{s_1}A_s,dsight)in SO(3).
]

Under a coordinate-frame change (R(s)),

[
A_smapsto R^{-1}A_sR+R^{-1}R',
qquad
W_{10}mapsto R_1^{-1}W_{10}R_0.
]

Let (U_iin SO(3)) express the material frame at endpoint (s_i) in the selected normal frame. The body-to-body transport mismatch is

[
oxed{
K_{10}=U_1^{-1}W_{10}U_0.
}
]

Because (U_imapsto R_i^{-1}U_i), (K_{10}) is exactly invariant under coordinate-frame gauge.

## Carrier symmetry and the double coset

A carrier with stabilizer (Hsubseteq SO(3)) identifies

[
U_isim U_i h_i,qquad h_iin H.
]

Consequently,

[
K_{10}sim h_1^{-1}K_{10}h_0.
]

The open-segment observable is therefore not a unique matrix but the double coset

[
oxed{
[K_{10}]_Hin Hackslash SO(3)/H.
}
]

For a closed loop whose endpoint material marking is identified with itself, the residual ambiguity reduces to (H)-conjugacy:

[
K_{m loop}sim h^{-1}K_{m loop}h.
]

Trace, rotation angle, or another justified class function may then survive as a readout.

## Candidate carriers

### Isotropic (B^3)

[
H=SO(3).
]

The double-coset space is a point. No intrinsic rotational transport observable survives.

### Axisymmetric (B^2)

[
H=SO(2).
]

The double coset is determined by one scalar,

[
oxed{
coseta=e_3^TK_{10}e_3,
}
]

the angle between the transported initial material axis and the terminal axis. Arbitrary rotations about either endpoint axis do not change it.

### Threefold patterned boundary

[
H=C_3.
]

Most continuous orientation data survive, but matrices related by the nine endpoint actions (h_1^{-1}Kh_0) represent the same readout. A useful quotient distance is

[
oxed{
d_H(K)=
min_{h_0,h_1in H}
arccosleft(
rac{operatorname{tr}(h_1^{-1}Kh_0)-1}{2}
ight).
}
]

### Fully marked carrier

[
H={e}.
]

The full gauge-invariant body mismatch (K_{10}) survives.

## Transport-before-quotient theorem

For adjacent segments,

[
K_{10}=U_1^{-1}W_{10}U_0,
qquad
K_{21}=U_2^{-1}W_{21}U_1.
]

Their full representatives compose exactly:

[
oxed{
K_{21}K_{10}
=
U_2^{-1}W_{21}W_{10}U_0
=
K_{20}.
}
]

But independently chosen double-coset representatives contain unrelated intermediate factors:

[
(h_2^{-1}K_{21}	ilde h_1)
(h_1^{-1}K_{10}h_0).
]

The middle factors cancel only when the same intermediate material representative is retained, (	ilde h_1=h_1). Therefore multiplication is not generally well defined on (Hackslash SO(3)/H).

[
oxed{
	ext{compose full transport first; quotient only at readout.}
}
]

This is why a path-groupoid representation is productive here: it preserves the shared intermediate object needed for composition.

## Numerical check

Using two generic (SO(3)) transports and (H=C_3):

- composition with the shared intermediate representative agreed to (2.1	imes10^{-16});
- the true composed quotient distance was (0.5774285303);
- an independently re-represented, prematurely quotiented product gave (1.2407839091);
- the (B^2) scalar (coseta) remained invariant under arbitrary endpoint (SO(2)) rotations to machine zero.

The unequal quotient distances exhibit actual information loss, not numerical noise.

## Consequence for collapse-assisted phase slips

The finite-core state space is the cone

[
mathcal C_H=
([0,infty)	imes SO(3)/H)/
({0}	imes SO(3)/Hsim *).
]

At (a=0), the effective stabilizer enlarges to (SO(3)), and all orientation classes coincide. Exact collapse therefore erases the quotient-valued transport state. Re-expansion cannot inherit a unique outgoing orientation unless the model supplies an additional gluing rule, a resolver/medium bias, or a hidden director that survives collapse.

This gives a clean discriminator:

- **true cone-apex collapse:** outgoing registry must be selected anew;
- **persistent phase correlation through exact collapse:** an undeclared orientation carrier survived, so the state was not actually at the cone apex.

## ᚼ/solver implication

A composable ᚼ edge should internally carry at least

[
(c,;W_{10},;U_0,;U_1,;H)
]

or an equivalent groupoid morphism with its endpoint objects. The portable readout may report ([K_{10}]_H), but that quotient should not replace the internal edge state before nested composition or triangle closure.

The old six-plane (SO(4)) rotations also require typing. Once a centerline tangent is selected, pure cross-sectional orientation lies in the normal (SO(3)). An ambient (SO(4)) operation that mixes tangent and normal directions changes the carrier geometry and is not merely an internal phase rotation.

## Prediction/solver packet

Run a three-edge controlled loop with arbitrary coordinate gauges and carrier choices (H=SO(3),SO(2),C_3,{e}). Verify:

1. (K_{ji}) is invariant under local coordinate-frame changes.
2. Full representatives satisfy (K_{32}K_{21}K_{10}=K_{30}).
3. Quotienting each edge independently produces an ambiguity whenever (H
e{e}).
4. (B^3) returns no rotational channel.
5. (B^2) returns only (coseta).
6. (C_3) returns the finite double-coset class.
7. Driving (a	o0) collapses every carrier’s orientation readout to the trivial class.

No physical observable is claimed until a resolver coupling is specified. This is an exact representation and information-preservation benchmark.

## Failure boundary

The construction requires revision when:

- (H) changes along the path;
- reconnection changes carrier identity;
- the resolver persistently labels otherwise equivalent material marks;
- cross-sectional deformation needs shape modes beyond rigid (SO(3)/H);
- a full (SO(4)) transport mixes tangent and normal sectors;
- dissipation or stochastic reseating replaces deterministic parallel transport.

## Next dependency

Meridian: modify the ᚼ triangle harness so raw/groupoid edge transports compose before any stabilizer quotient. Compare its closure residual with the current endpoint-matrix implementation for (B^2) and (C_3) carriers. Calder: verify that the resulting double-coset readout is independent of coordinate frame and representative choice.
