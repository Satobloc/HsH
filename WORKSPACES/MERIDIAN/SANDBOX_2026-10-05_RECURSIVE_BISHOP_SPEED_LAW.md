# Meridian XCVI — Recursive Bishop speed law

Status: sandbox / non-canonical.

## Result

For a unit-speed parent curve \(C(s)\) with Bishop frame
\[
T'=\kappa_1N_1+\kappa_2N_2,\qquad
N_1'=-\kappa_1T,\qquad
N_2'=-\kappa_2T,
\]
and a recursive child
\[
X(s)=C(s)+\rho\bigl(N_1\cos\theta+N_2\sin\theta\bigr),
\]
with constant \(\rho\), direct differentiation gives
\[
X'=
\left[1-\rho(\kappa_1\cos\theta+\kappa_2\sin\theta)\right]T
+\rho\theta'(-N_1\sin\theta+N_2\cos\theta).
\]

Hence
\[
\boxed{
\left(\frac{d\ell}{ds}\right)^2
=
\left(1-\rho\kappa_{\rm rad}\right)^2
+
(\rho\theta')^2
}
\]
with
\[
\kappa_{\rm rad}=\kappa_1\cos\theta+\kappa_2\sin\theta.
\]

The straight-spine result \(\sqrt{1+(\rho\theta')^2}\) is only the \(\kappa_{\rm rad}=0\) special case.

For fixed propagation speed \(d\ell/dt=c\),
\[
\frac{ds}{dt}
=
\frac{c}{
\sqrt{(1-\rho\kappa_{\rm rad})^2+(\rho\theta')^2}
}.
\]

This supplies a purely geometric curvature-phase modulation of recursive propagation.

## Regularity gate

A conservative tubular-coordinate gate is
\[
\rho\kappa_{\rm parent}<1.
\]
When \(1-\rho\kappa_{\rm rad}=0\), the offset construction reaches a focal condition and the naive recursive-tube model must explicitly handle self-contact/focal structure or reject that regime.

## Source reads

- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt\` — full read; retained higher Frenet/framed-curve/solver machinery only.
- \`Satobloc/HsH/WORKSPACES/STORYO/SOLVER_PACKAGE_2026-09-28/GEOMETRY_METHODOLOGY.md\` — full read; retained the parallel-transport-frame recursive construction and same-path-speed discipline.

No historical constants or particle labels were used as targets.

## Tight test

For any archived recursive fixture compare
\[
L_{\rm direct}=\int |X'|\,ds
\]
against
\[
L_{\rm Bishop}
=
\int\sqrt{(1-\rho\kappa_{\rm rad})^2+(\rho\theta')^2}\,ds.
\]
Under mesh refinement require \(L_{\rm direct}-L_{\rm Bishop}\to0\). The difference from the straight-spine approximation measures the geometric correction discarded by the simplified recursion solver.
