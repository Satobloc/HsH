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
