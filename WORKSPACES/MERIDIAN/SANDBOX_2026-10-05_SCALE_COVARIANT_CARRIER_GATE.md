# Meridian XCVII — Scale-covariant carrier gate

Status: sandbox / non-canonical.

## Result

For the exact Three-Spheres carrier
[
ho^2=R^2-rac{d^2}{3},
]
a constant UI/TX relative similarity (q>0) sends
[
Rmapsto qR,qquad dmapsto qd,qquad homapsto qho.
]

Therefore
[
oxed{
left(rac{ho}{R}ight)^2
=
1-rac13left(rac dRight)^2
}
]
is exactly invariant, as is the normalized carrier-collapse condition
[
oxed{
d/(sqrt3R)=1.
}
]

Carrier curvature obeys
[
kappa=1/ho,qquad kappamapsto kappa/q,
]
while (kappa R) is invariant.

Thus a uniform UI scale cannot create/destroy the common carrier, move the normalized rank-loss event, or change similarity-invariant topology/closure data.

## Local upgrade

If (q=q(s)),
[
X_q(s)=q(s)X(s)
]
gives
[
X_q'=qleft(X'+partial_sln q,Xight).
]

So the first genuinely new local object is
[
oxed{
A_s^{(mathrm{scale})}=partial_sln q.
}
]

Together with local frame rotation (A_s^{(mathrm{rot})}=R^{-1}R'), a compact candidate transformation connection is
[
oxed{
mathcal A_s=(partial_sln q)I+R^{-1}R'.
}
]

Global UI has constant (q,R) and hence (mathcal A_s=0). H(s)H mechanics plausibly begins where the transformation has a gradient.

## Source reads

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/TADA.txt` — substantial read; retained UI/TX relative-scale representation only.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/[[H(s)H THREE SPHERES first runs - init]]/SPHERES4/README.md` — full read; retained exact common-carrier geometry and rank-loss condition.

No historical constants or particle labels were used as targets.

## Tight test

Apply arbitrary constant (q) to valid SPHERES4 packets. Dimensionless invariants such as (d/R), (ho/R), (kappa R), event classification, and normalized rank-loss must remain unchanged. Then promote (q) to (q(s)=e^{epsilon f(s)}) and measure the first departures; the leading new contribution should scale with (partial_sln q=epsilon f'(s)).
