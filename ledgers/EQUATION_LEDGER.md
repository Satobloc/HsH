# H(s)H Equation Ledger

This ledger records mathematical statements separately from claims about their
H(s)H interpretation. Provenance and maturity are independent fields.

## EQ-0001 — Common carrier of three equal 3-spheres

- **Statement:** For three equal 3-spheres of radius `R` in Euclidean `R4`, whose
  centers form an equilateral triangle of side `d`, the regular common
  intersection is a circle with

  ```text
  rho^2 = R^2 - d^2/3,
  C = 2 pi rho.
  ```

- **Domain:** `R > 0`, `d >= 0`; real regular circle for `0 <= d < sqrt(3) R`.
- **Boundary cases:** `d = sqrt(3) R` gives `rho = 0`; `d > sqrt(3) R` gives no
  real common carrier in this symmetric configuration.
- **Units:** `[R] = [d] = [rho] = L`; `[C] = L`.
- **Inputs:** Euclidean metric, equal radii, equilateral center placement, exact
  sphere constraints.
- **Output:** Radius and circumference of the common intersection carrier.
- **Imported mathematics:** Euclidean distance geometry and regular constraint
  intersection.
- **Primary archive source:**
  `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SPHERECHECKQC.txt`, blob
  `7ea46f7d3461061a3b5f51fa7ee58b926b8404f0`, read fully at lines 1–1217.
  The declared geometry is at lines 40–56, implementation at 392–650, equation
  packet at 951–1047, interface at 1049–1125, and recorded output at 1128–1216.
- **Provenance:** `STD`. The result is ordinary Euclidean distance geometry; the
  archive source supplies an explicit realization and numerical round trip.
- **Maturity:** `DERIVED` for the stated symmetric Euclidean constraint system.
  H(s)H model selection remains separately `OPEN`.
- **Independent reconstruction:** With `a=d/sqrt(3)` and carrier point
  `x=(0,0,rho,0)`, the centers are
  `c1=(0,a,0,0)`, `c2=(-d/2,-a/2,0,0)`, and
  `c3=(d/2,-a/2,0,0)`. Subtracting equal-radius constraints fixes the first
  two coordinates of `x` at the triangle circumcenter. The remaining equation is
  `rho^2=R^2-a^2=R^2-d^2/3`.
- **Jacobian audit:** At that point the nonzero Jacobian columns are mutually
  orthogonal constraint-space vectors with squared norms `2d^2`, `2d^2`, and
  `12rho^2`. Hence the nonzero singular values are
  `sqrt(2)d`, `sqrt(2)d`, and `2sqrt(3)rho`. The regular rank is three. At
  `d=sqrt(3)R`, `rho=0` and the rank falls to two; the one-dimensional regular
  tangent description therefore fails at the point collapse.
- **Motion identity:** Differentiating moving constraints gives
  `J xdot = -partial_lambda F`. For equal radius rate `Rdot` at the displayed
  carrier point, the minimum-normal motion is
  `xdot_surface=(0,0,R Rdot/rho,0)`; an arbitrary carrier-tangent term `u t`
  may be added while the regular nullspace is one-dimensional.
- **H(s)H relevance:** Candidate example of the dependency
  `configuration geometry -> intersection carrier`.
- **Not established:** The sphere configuration is not thereby fundamental,
  physically realized, or selected by the current H(s)H framework. The critical
  separation is not a universal event threshold.
- **Earliest unsupported edge:** Selection of this symmetric three-sphere
  constraint system as a model of a finite-core H(s)H history.
- **Downstream dependents held open:** finite-tube lift, framing, transport,
  deformation law, Interbraid/Electrogravity coupling, and observable readout.

## EQ-0002 — Prescribed determinant-one shell deformation

- **Statement:** With the first quadratic shell prescribed by
  `F_1(x,phi)=(x-c_1)^T A_1(phi)(x-c_1)-R^2=0`, set
  `A_1(phi)=diag(1,1,exp(-2 epsilon),exp(2 epsilon))` and
  `epsilon=a sin(phi)`. The other two equal-radius shells remain spherical and
  fixed.
- **Domain:** `R>0`, real finite `a` and `phi`; the common intersection is a
  regular one-dimensional carrier only where `rank(J)=3` and it closes only
  where that is separately established.
- **Units:** `phi`, `epsilon`, and `a` are dimensionless; `[x]=[c_a]=[R]=L`.
  The reported velocity is displacement per unit phase, not per unit time.
- **Inputs and assumptions:** Euclidean `R4`; equilateral fixed centers; one
  prescribed anisotropic deformation; two undeformed shells; sampled numerical
  continuation. The deformation law and amplitude are inputs, not outputs.
- **Exact deductions:** `A_1` is symmetric positive definite and
  `det(A_1)=exp(-2 epsilon)exp(2 epsilon)=1`. With
  `epsilon'=a cos(phi)`,
  `A_1'=diag(0,0,-2 epsilon' exp(-2 epsilon),2 epsilon' exp(2 epsilon))`.
  Differentiating all constraints gives `J x'= -partial_phi F`; where the
  nullspace is one-dimensional, the general velocity is
  `x'=-J^+ partial_phi F+u t`.
- **Primary archive source:**
  `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SPHERES2QC.txt`, blob
  `9e110e2c13d95a061d9521c84ae9e1755fffa3f4`. Human-readable lines 1–1953 and
  2754–3255 were read sequentially and fully. Lines 1954–2753 contain an
  embedded ZIP/NPZ payload, structurally inspected as `points.npy`,
  `offsets.npy`, `phases.npy`, and `epsilons.npy`. Implementation is at lines
  618–833, the equation packet at 1558–1671, interface at 1771–1865, and the
  recorded deformation result at 2754–3255.
- **Provenance:** Mixed. The moving-constraint identity and determinant result
  are `STD`; the particular sinusoidal deformation family is `SRC`, a chosen
  experiment supplied by this source rather than a consequence of standard
  geometry or an upstream H(s)H premise.
- **Maturity:** `DERIVED` for the conditional algebra above; `CANDIDATE` as an
  H(s)H deformation operator. No empirical anchor or physical-time law is
  supplied.
- **Recorded numerical scope:** For `R=d=1`, `a=0.35`, 25 sampled phases, and
  trace step `0.035`, the source reports maximum constraint residual
  `3.202e-13`, maximum moving-constraint residual `2.388e-16`, determinant error
  `2.220e-16`, and no sampled singular value below `1e-5`. These establish only
  the recorded discrete run, not continuous regularity over all carrier points
  and phases.
- **Symmetry audit:** Swapping the last two ambient coordinates maps
  `A_1(epsilon)` to `A_1(-epsilon)` while leaving the two fixed spherical shells
  invariant. Exact geometric scalar readouts should therefore be even in
  `epsilon`. The recorded `+/-0.35` circumferences differ by about `1.51e-6`, and
  the recorded mean curvatures by about `9.998e-4`. This is consistent with
  unquantified tracing/curvature-discretization error, but the source supplies no
  step-refinement convergence study for these deformation readouts.
- **Mapping-status audit:** The source labels the result `coordinate_rewrite`.
  That label is `REJECTED` on the present provenance: changing a sphere into a
  phase-indexed ellipsoid is a stipulated family of different constraint
  geometries, not merely a coordinate change of the static three-sphere system.
  The construction remains useful as a `SRC/CANDIDATE` controlled geometry test.
- **Earliest unsupported edge:** Selection of this deformation family, phase
  law, and amplitude from the current H(s)H object hierarchy.
