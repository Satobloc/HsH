# Meridian XCIII — Z2 time-orientation gate

Status: sandbox / non-canonical.

## Result

For the basis-free 3+1 expansion tensor
[
D=hI+delta uu^T
]
and the induced Householder metric
[
g=I-2uu^T,
]
both depend only on the rank-one projector
[
P=uu^T.
]

Hence
[
D[u]=D[-u],qquad g[u]=g[-u].
]

The expansion tensor and Lorentzian metric therefore recover a timelike line field, not an oriented future direction. The natural state space of the sign-blind line is (mathbb{RP}^3), not (S^3).

A closed projector loop can satisfy
[
P(T)=P(0),qquad g(T)=g(0),
]
while a continuous oriented lift returns as
[
u(T)=-u(0).
]

This is a genuine (mathbb Z_2) orientation holonomy.

## Minimal loop diagnostic

Given local eigenline representatives (u_i), choose on each mesh edge (i	o j) the sign that maximizes (u_icdot u_j), recording
[
s_{ij}in{pm1}.
]
For a closed loop (Gamma), define
[
oxed{
W_{mathbb Z_2}(Gamma)=prod_{(ij)inGamma}s_{ij}.
}
]

Then (W_{mathbb Z_2}=+1) means the orientation closes; (W_{mathbb Z_2}=-1) means the sign-blind projector/metric closes but the oriented lift flips.

## Consequence

Lorentz signature and 3+1 expansion anisotropy do not by themselves produce an arrow of time. If H(s)H requires an oriented timesheet flow, it needs explicit lift/orientation data beyond (D), (P), and (g).

This (mathbb Z_2) datum is distinct from the finite-core inverse-branch bit (	au); they arise from different mathematics and should not be identified unless a later calculation demonstrates a relation.

## Source reads

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt` — substantial read; retained Euclidean R4 and one-axis expansion-symmetry-breaking construction.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt` — substantial read; retained SO(4), metric-induction, and typed-composition machinery.

No historical constants or particle labels were used as targets.
