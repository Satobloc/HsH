# Meridian XCVII — Scale-covariant carrier gate

Status: sandbox / non-canonical.

## Result

For the exact Three-Spheres carrier
\[
\rho^2=R^2-\frac{d^2}{3},
\]
a constant UI/TX relative similarity \(q>0\) sends
\[
R\mapsto qR,\qquad d\mapsto qd,\qquad \rho\mapsto q\rho.
\]

Therefore
\[
\boxed{
\left(\frac{\rho}{R}\right)^2
=
1-\frac13\left(\frac dR\right)^2
}
\]
is exactly invariant, as is
\[
\boxed{
d/(\sqrt3R)=1.
}
\]

Carrier curvature obeys
\[
\kappa=1/\rho,\qquad \kappa\mapsto \kappa/q,
\]
while \(\kappa R\) is invariant.

Thus uniform UI scale cannot create/destroy the common carrier, move the normalized rank-loss event, or change similarity-invariant topology/closure data.

## Local upgrade

If \(q=q(s)\),
\[
X_q(s)=q(s)X(s)
\]
gives
\[
X_q'=q\left(X'+\partial_s\ln q\,X\right).
\]

So the first genuinely new local object is
\[
\boxed{
A_s^{(\mathrm{scale})}=\partial_s\ln q.
}
\]

Together with \(A_s^{(\mathrm{rot})}=R^{-1}R'\),
\[
\boxed{
\mathcal A_s=(\partial_s\ln q)I+R^{-1}R'.
}
\]

Global UI has constant \(q,R\) and hence \(\mathcal A_s=0\). Local transformation gradients are the nontrivial mechanical candidate.

## Source reads

- \`Satobloc/SAT_THEORY_ARCHIVE_2023-25/TADA.txt\` — substantial read; retained UI/TX relative-scale representation only.
- \`Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/[[H(s)H THREE SPHERES first runs - init]]/SPHERES4/README.md\` — full read; retained exact common-carrier geometry and rank-loss condition.

No historical constants or particle labels were used as targets.

## Tight test

Apply arbitrary constant \(q\) to valid SPHERES4 packets. Dimensionless invariants such as \(d/R\), \(\rho/R\), \(\kappa R\), event classification, and normalized rank-loss must remain unchanged. Then promote \(q\) to \(q(s)=e^{\epsilon f(s)}\); leading departures should scale with \(\partial_s\ln q=\epsilon f'(s)\).
