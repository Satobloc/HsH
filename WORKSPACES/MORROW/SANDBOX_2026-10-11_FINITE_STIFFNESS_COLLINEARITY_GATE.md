# SANDBOXED — Morrow/Kestrel | finite-stiffness collinearity gate | 2026-10-11

**Status:** new source-reconstructed sandbox calculation; not canonical SAT/H(s)H, not an original historical Morrow/Kestrel turn, not confinement, statistics, or a particle prediction.

**Namespace:** LOCAL:MK-COLLINEARITY-20261011. Symbols are defined locally and do not enter the shared registry.

## Source and continuity boundary

Read directly for this calculation:

- WORKSPACES/MORROW/SANDBOX_2026-10-11_NORMAL_PLANE_ESCAPE_BRAID_GATE.md, blob d7206f9c523ee466f27e6bb7fba874cbe245e7dc.
- WORKSPACES/MORROW/SANDBOX_2026-10-11_RIGID_TRIAD_Z2_HOLONOMY_GATE.md, blob db3087f48a6c49c6d6ec09face25b19b357bd730.
- WORKSPACES/COMMON/FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md, blob cccca10267064650dffbc68dd0a6672ee65167e3.
- WORKSPACES/COMMON/NONNEGOTIABLE_SYMBOL_MANAGEMENT.md, blob e00f4cc25da3d7b41d69ad7a7e87b50e31a92f75.
- WORKSPACES/COMMON/terminology/SYMBOL_REGISTRY.md, blob 602134e96e180c60e33f94de56c1183556851a97.

The two Morrow/Kestrel notes cite full reads of historical RMS Spacetime Filaments.txt and current FUNDAMENTAL INTUITIONS.txt; those underlying sources were **not reread in this bounded turn**, so their content is not newly claimed firsthand here. This note extends only the explicitly stated three-center spring fixture in the rigid-triad checkpoint.

## Question

The rigid-triad note establishes an exact \(\mathbb Z_2\) loop class only in the constrained shape space \(SO(3)\), and predicts that finite shape stiffness permits escape through a degenerate shape. What energetic cost is unavoidable at exact collinearity, and what barrier scaling appears in one explicit noncollision defect ansatz?

## 1. Exact pointwise cost of a collinear triangle

Let the preferred equilateral side length be \(\ell>0\). At an ordered collinear configuration, let adjacent gaps be \(a,b>0\); the three pair distances are \(a,b,a+b\). For the spring term used in the prior fixture, define

\[
S(a,b)=
(a^2-\ell^2)^2+
(b^2-\ell^2)^2+
((a+b)^2-\ell^2)^2.
\]

With \(u=a/\ell\) and \(v=b/\ell\), direct expansion gives the exact identity

\[
\frac{S}{\ell^4}
=
1+2\left(u^2+uv+v^2-1\right)^2.
\]

Therefore

\[
S(a,b)\ge \ell^4.
\]

Equality is attained on \(u^2+uv+v^2=1\); the symmetric equality point is

\[
a=b=\frac{\ell}{\sqrt 3}.
\]

For equal-w spherical cores of radius \(\epsilon\), that symmetric minimum is noncolliding when

\[
\ell>2\sqrt3\,\epsilon.
\]

For the prior functional

\[
E_{\rm spring}
=
\frac{\lambda}{2}
\sum_{i<j}\int
\left(|x_i-x_j|^2-\ell^2\right)^2\,dw,
\]

every exact collinear event has pointwise spring density at least

\[
\frac{\lambda\ell^4}{2}.
\]

This pointwise statement alone is **not** a positive integrated barrier theorem: a continuum path could try to localize the degeneracy to zero measure. The gradient term must be retained.

## 2. Controlled symmetric defect ansatz

Work in a co-moving/co-rotating shape frame and hold a base pair at

\[
x_0=(-\ell/2,0),\qquad x_1=(+\ell/2,0),
\]

while the third center is

\[
x_2=(0,h(w)).
\]

The equilateral height is

\[
h_0=\frac{\sqrt3}{2}\ell.
\]

At \(h=0\), the three centers remain distinct, with pair gaps \(\ell/2,\ell/2,\ell\); finite cores remain disjoint if

\[
\ell>4\epsilon.
\]

The defect-only energy relative to the equilateral shape reduces exactly within this ansatz to

\[
E_{\rm def}[h]
=
\int_{-\infty}^{\infty}
\left[
\frac A2(h')^2+
\lambda(h^2-h_0^2)^2
\right]dw,
\]

with \(h(\pm\infty)=h_0\) and a forced collinear passage \(h(0)=0\).

The minimizing half-profile obeys

\[
\frac A2(h')^2=\lambda(h_0^2-h^2)^2,
\]

so a symmetric explicit profile is

\[
h(w)=h_0\tanh\!\left(k|w|\right),
\qquad
k=h_0\sqrt{\frac{2\lambda}{A}}.
\]

The restricted barrier is

\[
E_{\rm def}^{\rm(ansatz)}
=
\frac{4}{3}\sqrt{2A\lambda}\,h_0^3
=
\sqrt{\frac32}\,\ell^3\sqrt{A\lambda}.
\]

The characteristic defect width is

\[
\xi=\frac1k
=
\sqrt{\frac{2A}{3\lambda\ell^2}}.
\]

Dimensional check for the prior functional: \([A]=E/L\), \([\lambda]=E/L^5\), hence \(\ell^3\sqrt{A\lambda}\) has units of energy.

## 3. Numerical audit

A Python/NumPy trapezoidal integration used \(A=\lambda=\ell=1\), one million intervals over \([-12/k,12/k]\). It returned:

- \(h_0=0.8660254038\);
- \(k=1.2247448714\);
- numerical barrier \(1.224744871391589\);
- analytic barrier \(\sqrt{3/2}=1.224744871391589\);
- reported residual \(0.0\) at displayed precision.

A deterministic 100,000-sample check of the pointwise algebraic identity on \(u,v\in[0,3]\) had maximum floating residual \(9.09\times10^{-13}\).

## Interpretation and status

- **STD/DERIVED inside the stated fixture:** the algebraic collinearity identity and the one-field variational solution.
- **GEN/CANDIDATE for H(s)H:** using this spring functional as an Interbraid shape-locking model.
- Finite \(\lambda\) produces an energetic gate, not an exact topological sector.
- The barrier scales as \(\sqrt{\lambda}\) in this restricted defect family and vanishes continuously as \(\lambda\to0\), consistent with the unconstrained configuration space.
- The \(\lambda\to\infty\) limit approaches rigid-shape behavior but does not by itself derive a physical material triad.
- This result does not establish strong-force confinement, fermionic statistics, Pauli exclusion, color, or any particle label.

## Failure conditions

1. The formula is an **ansatz barrier**, not the global minimax barrier. A full three-center deformation may pass with lower energy.
2. A mesh-refined three-dimensional solver finding a barrier tending to zero at fixed \(A,\lambda,\ell,\epsilon\) would defeat the candidate energetic gate.
3. The co-moving/co-rotating reduction must be replaced by a covariant transported-frame derivative before interpreting \(A\) physically.
4. If the lowest path uses noncollinear shape collapse or redistributes all three centers, the fixed-base coefficient \(\sqrt{3/2}\) is not universal.
5. Global finite-tube injectivity and timelikeness remain independent constraints.
6. No target constant or particle datum was fitted.

## Next discriminator

Run a full three-center string-method or nudged-elastic-band minimax calculation over \(x_j(w)\in\mathbb R^3\), with pairwise clearance \(|x_i-x_j|>2\epsilon\), fixed labeled endpoints, and several unrelated initial homotopies. Compare the converged barrier with \(\sqrt{3/2}\ell^3\sqrt{A\lambda}\), refine the \(w\)-mesh, and vary \(\ell/\epsilon\). If every apparent barrier collapses with path enrichment, reject finite spring stiffness as a viable locking gate.
