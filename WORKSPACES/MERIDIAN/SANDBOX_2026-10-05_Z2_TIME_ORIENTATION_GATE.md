# Meridian XCIII — Z2 time-orientation gate

Status: sandbox / non-canonical.

## Result

For
\[
D=hI+\delta uu^T
\]
and
\[
g=I-2uu^T,
\]
both depend only on
\[
P=uu^T.
\]

Hence
\[
D[u]=D[-u],\qquad g[u]=g[-u].
\]

The expansion tensor and Lorentzian metric recover a timelike line field, not an oriented future direction. The sign-blind line lives naturally in \(\mathbb{RP}^3\), not \(S^3\).

A closed projector loop can satisfy
\[
P(T)=P(0),\qquad g(T)=g(0),
\]
while a continuous oriented lift returns as
\[
u(T)=-u(0).
\]

This is a genuine \(\mathbb Z_2\) orientation holonomy.

## Minimal loop diagnostic

Given local eigenline representatives \(u_i\), choose on each edge \(i\to j\) the sign maximizing \(u_i\cdot u_j\), recording
\[
s_{ij}\in\{\pm1\}.
\]
For a closed loop \(\Gamma\),
\[
\boxed{
W_{\mathbb Z_2}(\Gamma)=\prod_{(ij)\in\Gamma}s_{ij}.
}
\]

\(W_{\mathbb Z_2}=+1\) closes the orientation; \(W_{\mathbb Z_2}=-1\) closes the projector/metric but flips the oriented lift.

## Consequence

Lorentz signature and 3+1 expansion anisotropy do not by themselves produce an arrow of time. If H(s)H requires oriented timesheet flow, it needs lift/orientation data beyond \(D,P,g\).

This \(\mathbb Z_2\) datum is distinct from the finite-core inverse-branch bit \(\tau\); do not identify them without derivation.

## Source reads

- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT++.txt\` — substantial read; retained Euclidean R4 and one-axis expansion-symmetry-breaking construction.
- \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt\` — substantial read; retained SO(4), metric-induction, and typed-composition machinery.

No historical constants or particle labels were used as targets.
