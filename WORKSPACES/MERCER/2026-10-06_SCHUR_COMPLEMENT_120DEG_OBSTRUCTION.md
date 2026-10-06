# MERCER SANDBOX — Schur-complement obstruction to auxiliary-mode rescue

**Date:** 2026-10-06
**Status:** SILOED PLAYGROUND / noncanonical
**Local namespace:** `LOCAL:MERCER-SCHUR-120-20261006`

## Sources actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Refine .txt`: Cycles 10–12 material on the three-filament phase potential, 120-degree stationary point, rejected topological escalation, negative relative-phase Hessian, and attempted full-operator stabilization.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt`: current Euclidean-4D, finite-worldtube, bending/restoring/tug action and resolving-surface material.
- Current Common front door / Reference Desk / symbol controls read before construction. HSH_RESOURCES War Room overview-read. PRIOR_ART not entered.

## Recovered baseline
For the historical interaction
[
V_{int}=kR^2\sum_{i<j}[1-\cos(\delta_i-\delta_j)],
]
the 120-degree stationary point has one common-phase zero mode and two relative-phase eigenvalues
[
-\frac32 kR^2.
]

Previous Mercer run showed ordinary derivative bending contributes positive powers of q and therefore cannot rescue an admissible q=0 relative-phase instability.

## New result: stable auxiliary coordinates cannot rescue it either
Let x denote the two dangerous relative-phase coordinates and y any collection of additional radial/normal/worldtube coordinates. Write the q=0 quadratic energy as
[
\delta^2E=\frac12
\begin{pmatrix}x\\y\end{pmatrix}^{T}
\begin{pmatrix}A&C\\C^T&D\end{pmatrix}
\begin{pmatrix}x\\y\end{pmatrix},
]
with
[
A=-aI_2,\qquad a=\frac32kR^2>0,
]
and assume the auxiliary block is itself stable, (D\succ0).

If y is allowed to relax, minimizing over y gives
[
y_*=-D^{-1}C^Tx
]
and the exact effective relative-phase Hessian
[
A_{eff}=A-CD^{-1}C^T.
]

Because (D^{-1}\succ0),
[
CD^{-1}C^T\succeq0,
]
hence
[
A_{eff}\preceq A=-aI_2.
]

Therefore coupling the unstable phase maximum to any ordinary positive-energy auxiliary radial/normal sector makes the relaxed static curvature **no less negative**. It cannot stabilize the branch.

Equivalent Rayleigh statement: for every x,
[
x^TA_{eff}x=x^TAx-\|D^{-1/2}C^Tx\|^2\le x^TAx<0.
]

A scripted random-matrix check with three arbitrary positive-definite D blocks returned effective eigenvalue pairs
[
(-2.9874,-1.6034),\quad(-2.5590,-1.5010),\quad(-3.0746,-1.5447)
]
for (A=-1.5I), exactly respecting the theorem.

## Consequence
The old Cycle-12 hope that unspecified stable radial/worldtube coupling might rescue the 120-degree phase maximum is ruled out for an unconstrained conservative quadratic energy. Ordinary positive auxiliary compliance softens the phase sector through the Schur complement.

A rescue now requires qualitatively different structure:
1. the dangerous relative-phase directions are removed by genuine constraints/closure;
2. the interaction potential/sign changes so the 120-degree state is not a maximum;
3. a direct non-derivative positive term acts specifically in relative-phase space while preserving common phase;
4. dynamics are non-potential (e.g. gyroscopic/velocity coupling) so static Hessian positivity is not the stability criterion;
5. the assumed auxiliary block is not independently positive, requiring analysis of a genuinely coupled constrained saddle rather than “stable radial restoring force.”

## Failure condition / solver test
Build the actual Cartesian finite-worldtube constraint Jacobian at the 120-degree configuration. Project the full q=0 Hessian onto the admissible tangent space. If either historical relative-phase eigenvector survives in that tangent space and the only proposed rescue is coupling to a positive auxiliary energy block, the branch is unstable.

The decisive next calculation is therefore **constraint-tangent-space extraction**, not coefficient tuning.
