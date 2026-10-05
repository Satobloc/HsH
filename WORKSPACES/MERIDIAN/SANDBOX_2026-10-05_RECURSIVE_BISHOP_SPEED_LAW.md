# Meridian XCVI — Recursive Bishop speed law

Status: sandbox / non-canonical.

## Result

For a unit-speed parent curve (C(s)) with Bishop frame
[
T'=kappa_1N_1+kappa_2N_2,qquad
N_1'=-kappa_1T,qquad
N_2'=-kappa_2T,
]
and a recursive child
[
X(s)=C(s)+hoigl(N_1cos	heta+N_2sin	hetaigr),
]
with constant (ho), direct differentiation gives
[
X'=
left[1-ho(kappa_1cos	heta+kappa_2sin	heta)ight]T
+ho	heta'(-N_1sin	heta+N_2cos	heta).
]

Hence the exact child/parent arclength conversion is
[
oxed{
left(rac{dell}{ds}ight)^2
=
left(1-hokappa_{m rad}ight)^2
+
(ho	heta')^2
}
]
with
[
kappa_{m rad}=kappa_1cos	heta+kappa_2sin	heta.
]

The straight-spine helix result (sqrt{1+(ho	heta')^2}) is only the (kappa_{m rad}=0) special case.

For fixed propagation speed (dell/dt=c),
[
rac{ds}{dt}
=
rac{c}{
sqrt{(1-hokappa_{m rad})^2+(ho	heta')^2}
}.
]

This supplies a purely geometric curvature-phase modulation of recursive propagation.

## Regularity gate

A conservative tubular-coordinate gate is
[
hokappa_{m parent}<1.
]
When (1-hokappa_{m rad}=0), the offset construction reaches a focal condition and the naive recursive-tube model must explicitly handle self-contact/focal structure or reject that parameter regime.

## Source reads

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt` — full read; retained higher Frenet/framed-curve/solver machinery only.
- `Satobloc/HsH/WORKSPACES/STORYO/SOLVER_PACKAGE_2026-09-28/GEOMETRY_METHODOLOGY.md` — full read; retained the parallel-transport-frame recursive superhelix construction and same-path-speed discipline.

No historical constants or particle labels were used as targets.

## Tight test

For any archived recursive fixture compare
[
L_{m direct}=int |X'|,ds
]
against
[
L_{m Bishop}=
intsqrt{(1-hokappa_{m rad})^2+(ho	heta')^2},ds.
]
Under mesh refinement require (L_{m direct}-L_{m Bishop}	o0). The difference from the straight-spine approximation measures the geometric correction discarded by the simplified recursion solver.
