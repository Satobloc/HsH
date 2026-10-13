# Tern Rook | Hopf / SO(4) representation gate | 2026-10-13

**Status:** independently calculated mathematical playground, not SAT/H(s)H empirical evidence. Source inspiration: `WORKSPACES/COMMON/FIELD_NOTES/2026-09-20_TERN_VILLARCEAU_HOPF_PARK_WALK.md` (blob `f6242d93be6b4c143c5e8d5da423882ef08bf2c0`). Source-grounded reconstruction, not authenticated historical Tern participation.

## Exact fixture (units)
Work in Euclidean `R^4`, coordinates `(x1,y1,x2,y2)` measured in meters. Sphere `S^3` has radius `a=1 m`. Let two great circles be
`P_delta(t) = (cos t, sin t, cos(t+delta), sin(t+delta))/sqrt(2)` meters, `t in [0,2pi)`; choose `delta=0` and `delta=pi/2`. Both are fibers of the fixed Hopf complex structure `J = diag([[0,-1],[1,0]],[[0,-1],[1,0]])`, a real orthogonal quarter-turn satisfying `J^2=-I`. Their phases are mathematical parameters, not physical time.

Project from the north pole `(0,0,0,a)` to `R^3`:
`q(P) = a (P1,P2,P3)/(a-P4)`.
For orthonormal 4D frame columns `F=[f0 f1]` spanning a great circle, put `u=f0[3]`, `v=f1[3]`, `d=1-u^2-v^2>0`. Its stereographic image is an exact circle with center
`c=a(u f0_xyz+v f1_xyz)/d` and radius `r=a/sqrt(d)`.
The minimal 4D distance between two great circles with frames `F,G` is
`D4=a sqrt(2-2 sigma_max(F^T G))`, where `sigma_max` is the largest singular value.

## SO(4) control
Apply to both curves the same real rotation
`R=R_(1,4)(0.57) R_(2,3)(-0.41) R_(1,3)(0.24)` (1-based axes, radians). `det R=+1`; `||R^T R-I||_F=2.33e-16`. Hold the stereographic pole and `J` fixed. The rotation does **not** commute with `J`: `||JR-RJ||_F=0.5731921133`.

## Reproducible results
| Quantity | Before | After |
|---|---:|---:|
| Gauss linking number (N=512 trapezoid) | +1.000000000000000 | +0.9999999999999999 |
| Minimum 4D separation (m) | 0.765366864730180 | 0.765366864730180 |
| Minimum stereographic 3D separation (m) | 0.461755501705 | 0.424847624723 |
| Projected circle A radius (m) | 1.414213562373 | 1.327755865538 |
| Projected circle B radius (m) | 1.414213562373 | 4.127269809661 |
| Fixed-J tangent mismatch, each fiber | 0 | 0.286596056663 |

Linking uses `Lk=(1/4pi) double_integral (q-r) dot (dq cross dr)/|q-r|^3`; N=256 and 512 agree to machine precision. The invariant `D4=sqrt(2-sqrt(2)) m` is analytic. Projected separations are deterministic two-angle minimizations. The two transformed circles are still linked and are still images of great circles, but they are **not fibers of the same fixed Hopf fibration** because `J R f0 != R f1`. They are fibers of the transported structure `R J R^T`.

**Gate:** linking and intrinsic 4D separation survive common SO(4) rotation; projected circle radii and projected Euclidean clearance do not. Thus a projected circle-radius change cannot alone establish filament-core expansion or a physical H(s)H transformation. The model is topology/geometry only. An H(s)H constitutive law, observer map, and physical length convention are still required.

**Reproducible local code:** `/mnt/data/tern_hopf_20261013/tern_hopf_so4_gate.py` (creates deterministic JSON and Class-P two-panel figure). Local paths are not repository delivery.