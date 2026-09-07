# Four-Dimensional Framed-Curve Kinematics

## Scope

This note derives only the moving-frame kinematics of a regular arclength curve
in \(\mathbb R^4\). It does not select the H(s)H finite-core object, impose a
helix, assign physical labels to frame components, or extend any
three-dimensional rod theorem automatically.

## Adapted frame

Let

\[
\gamma:I\to\mathbb R^4,\qquad \lVert\gamma'(s)\rVert=1,
\]

and choose an oriented orthonormal frame

\[
F=(T,N_1,N_2,N_3)\in SO(4),\qquad T=\gamma'.
\]

Set \(\Omega=F^TF'\). From \(F^TF=I\),

\[
0=(F^TF)'=F'^TF+F^TF'=\Omega^T+\Omega.
\]

Hence \(\Omega\in\mathfrak{so}(4)\), and the tangent/normal split has the unique
block form

\[
\Omega=
\begin{pmatrix}
0&-\kappa^T\\
\kappa&\omega
\end{pmatrix},
\qquad
\kappa\in\mathbb R^3,\quad
\omega\in\mathfrak{so}(3).
\]

Because \(F'=F\Omega\),

\[
T'=\sum_a\kappa_aN_a,\qquad
N_a'=-\kappa_aT+\sum_bN_b\omega_{ba}.
\]

Thus the six local coefficients in \(\mathfrak{so}(4)\) split into three
centerline-curvature components and three normal-frame rotation components.

## Normal-frame gauge

Let \(D=\operatorname{diag}(1,R)\) with \(R:I\to SO(3)\), and set
\(\widetilde F=FD\). Then

\[
\widetilde\Omega
=
D^T\Omega D+D^TD',
\]

so

\[
\widetilde\kappa=R^T\kappa,\qquad
\widetilde\omega=R^T\omega R+R^TR'.
\]

On any interval, \(R'=-\omega R\) sets
\(\widetilde\omega=0\). A closed curve can retain a nontrivial return rotation

\[
\mathcal H_N=
\mathcal P\exp\left(-\int_0^L\omega(s)\,ds\right),
\]

so a parallel normal frame need not close. This normal holonomy is a geometric
return map; interpreting it as phase, spin, charge, or particle identity
requires a separate readout derivation.

## Finite-core consequence

For radius below the relevant tubular-neighborhood bound, the full metric tube
around \(\gamma\) uses a three-dimensional normal ball:

\[
X(s,y)=\gamma(s)+\sum_{a=1}^3y_aN_a(s),
\qquad y\in B^3_\varepsilon.
\]

Its boundary has \(S^2\) fibers. A two-dimensional disk cross-section selects a
rank-two normal subbundle and defines a different object.

If \(y\) is merely a normal coordinate, changing \(N\) and \(y\) together is
gauge. If \(y\) labels material points or the cross-section is anisotropic, the
frame orientation is part of the modeled configuration and normal rotation can
carry constitutive twist energy.

## Status

- Adapted-frame decomposition and gauge law: **STD/DERIVED**.
- Parallel-frame removal of local \(\omega\) on an interval: **STD/DERIVED**.
- Closed-loop normal holonomy: **STD/DERIVED** as a geometric return map.
- Material interpretation, energy, dynamics, and H(s)H readout: **OPEN**.
- Selection of full \(B^3\), rank-two disk, or another finite core: **OPEN**.

## Dependency gained

\[
\text{center-history}
\longrightarrow
\text{\(SO(4)\) adapted frame}
\longrightarrow
\begin{cases}
\text{normal-frame gauge},\\
\text{material orientation, if separately supplied}.
\end{cases}
\]

The earliest unsupported next edge is therefore not “how to compute twist.”
It is the choice of finite-core cross-section and the declaration of which
normal directions are material data.
