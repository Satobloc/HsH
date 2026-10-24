# EQ-0011 — D8 Interaction-Summary and Quartic–Sextic Audit

Worker: Ravel. Handoff: Orson Vay. Date: 2026-10-24.

Status: historical recovery with a conditional dimensional repair and a sign/stability discriminator. D8 is a summary of D3–D7, not an independent derivation. It is not cleared as a whole, not promoted to candidate status, and not established physics.

## Source

- Repository: Satobloc/SAT_THEORY_ARCHIVE_2023-25
- File: SAT O Derivations/CODE-LOCKED DERIVS.txt
- D8: lines 398–448
- Full file: 448 lines / 17,692 characters
- Blob: 783b05d39d59bf854b92090e15d205e6823b51c8
- Commit/date: d3f5fa0223f66a2d2b74c2beca7c6b262b616bdc, 2025-10-27 01:15:21 UTC
- Duplicates: SAT O Derivations/SAT_D8_SUMMARY_INTERACTIONS.txt; SAT 4D Theory Work/D8.tex; HsH dump copies under DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[SAT EARLY DERIVATIONS]]/.

Preserved source mathematics:

```text
S_grav = (1/(2 kappa)) integral d^4x sqrt(-g) R
L_int^grav = -(1/2) h_{mu nu} T^{mu nu}

L_int^gauge = -J_mu^(G) A^{mu(G)}
J_mu^(G) = bar(Psi_bundle) gamma_mu T^a Psi_bundle

L_YM = -(1/4) g_G^(-2)(x) Tr(F_{mu nu} F^{mu nu})

L_Yuk = -y bar(Psi_bundle) Phi_twist Psi_bundle
m_eff = (m_0/Q)(1 + alpha_shape/Q)

L_self = lambda_4 (xi dot xi)^2 + lambda_6 (xi dot xi)^3 + ...

S_SAT.4D = S_grav + S_YM^(G) + S_Dirac^SAT + S_self + S_Yuk
```

## Dependency result

D8 inherits rather than repairs the audited dependencies:

- D3's direct Q-to-mass rule remains quarantined.
- D4's gravitational interpretation is not re-derived by writing the Einstein–Hilbert and linearized stress-tensor couplings.
- D5/D6's density-derived gauge normalization and local-coupling factorization retain their dimensional/product-rule failures.
- D7's scalar-gamma and S3 homotopy assignments fail the Clifford and topology tests.

The displayed total action is therefore an additive inventory of sector templates. Addition alone proves neither compatibility nor common geometric origin.

## Dimensional result

Conditional on a canonically normalized scalar-like field in four spacetime dimensions,

```text
[xi] = L^-1, [L_density] = L^-4.
```

Therefore:

```text
[lambda_4] = L^0,
[lambda_6] = L^2.
```

The sextic coefficient is not dimensionless. The printed expression can be dimensionally valid only if lambda_6 carries the required length-squared scale (or if xi has a different explicitly declared normalization).

For a canonical 4D spinor and scalar, [Psi]=L^-3/2 and [Phi_twist]=L^-1, so the Yukawa coefficient y is dimensionless. This checks units only; D8 supplies no derivation of Phi_twist, y, or the mass relation.

## Sign and stability discriminator

Let u=xi·xi>=0 and conditionally read the printed polynomial as a potential:

```text
V(u)=lambda_4 u^2 + lambda_6 u^3.
```

It is bounded below precisely in the leading cases:

- lambda_6>0; or
- lambda_6=0 and lambda_4>=0.

For lambda_6>0 and lambda_4<0, the nonzero minimum is

```text
u_* = -2 lambda_4/(3 lambda_6),
V(u_*) = 4 lambda_4^3/(27 lambda_6^2).
```

The normalized example lambda_4=-3, lambda_6=2 gives

```text
V(u)=-3u^2+2u^3,
V(u)+1=(u-1)^2(2u+1)>=0 for u>=0,
```

so its global minimum is V(1)=-1.

If D8's plus-sign expression is instead literally an interaction Lagrangian in the convention L=T-V, the physical potential is -L_self. Then positive lambda_6 makes the potential unbounded below. D8 does not specify which sign convention is intended and gives no coefficient constraints. No unique correction is therefore applied.

## Complete Python reproducer

```python
#!/usr/bin/env python3
"""EQ-0011: D8 interaction dimensions, signs, and stability audit."""
import math
import numpy as np

dim_xi = -1
dim_psi = -1.5
dim_phi = -1
dim_lagrangian = -4
dim_lambda4 = dim_lagrangian - 4 * dim_xi
dim_lambda6 = dim_lagrangian - 6 * dim_xi
dim_yukawa = dim_lagrangian - (2 * dim_psi + dim_phi)

print(f"[xi]=L^{dim_xi}")
print(f"[lambda4]=L^{dim_lambda4}")
print(f"[lambda6]=L^{dim_lambda6}")
print(f"[y]=L^{dim_yukawa}")

def V(u, lam4, lam6):
    return lam4 * u**2 + lam6 * u**3

def stationary_u(lam4, lam6):
    return -2.0 * lam4 / (3.0 * lam6)

cases = [
    ("stable-origin", 1.0, 0.5),
    ("stable-broken", -3.0, 2.0),
    ("quartic-only", 1.0, 0.0),
    ("unstable-negative-sextic", 1.0, -0.5),
]

u_grid = np.linspace(0.0, 100.0, 1_000_001)
for name, lam4, lam6 in cases:
    values = V(u_grid, lam4, lam6)
    i = int(np.argmin(values))
    print(
        f"{name}: lambda4={lam4:+.6g}, lambda6={lam6:+.6g}; "
        f"grid_min_u={u_grid[i]:.6f}; grid_min_V={values[i]:.12e}; "
        f"V(100)={values[-1]:.12e}"
    )
    if lam6 != 0.0:
        us = stationary_u(lam4, lam6)
        print(f"  nonzero_stationary_u={us:.12e}; V(u*)={V(us, lam4, lam6):.12e}")

u_test = np.linspace(0.0, 20.0, 200_001)
factor_residual = np.max(
    np.abs((V(u_test, -3.0, 2.0) + 1.0) - (u_test - 1.0)**2 * (2.0*u_test + 1.0))
)
minimum_residual = abs(V(1.0, -3.0, 2.0) + 1.0)
print(f"factorization_max_residual={factor_residual:.3e}")
print(f"analytic_minimum_u=1.000000000000; minimum_residual={minimum_residual:.3e}")

literal_lint_potential_at_100 = -V(100.0, 1.0, 0.5)
print("literal-L_int sign branch: " f"V_physical(100)={literal_lint_potential_at_100:.12e}")

negative_sextic_samples = [V(10.0**k, 1.0, -0.5) for k in range(1, 6)]
print("negative-sextic large-u values=" + ",".join(f"{x:.6e}" for x in negative_sextic_samples))

assert dim_lambda4 == 0
assert dim_lambda6 == 2
assert dim_yukawa == 0
assert factor_residual < 1e-9
assert minimum_residual == 0.0
assert V(1.0, -3.0, 2.0) == -1.0
assert all(negative_sextic_samples[i+1] < negative_sextic_samples[i]
           for i in range(len(negative_sextic_samples)-1))
assert literal_lint_potential_at_100 < -1e5
print("ALL ASSERTIONS PASS")
```

## Exact output

```text
[xi]=L^-1
[lambda4]=L^0
[lambda6]=L^2
[y]=L^0.0
stable-origin: lambda4=+1, lambda6=+0.5; grid_min_u=0.000000; grid_min_V=0.000000000000e+00; V(100)=5.100000000000e+05
  nonzero_stationary_u=-1.333333333333e+00; V(u*)=5.925925925926e-01
stable-broken: lambda4=-3, lambda6=+2; grid_min_u=1.000000; grid_min_V=-1.000000000000e+00; V(100)=1.970000000000e+06
  nonzero_stationary_u=1.000000000000e+00; V(u*)=-1.000000000000e+00
quartic-only: lambda4=+1, lambda6=+0; grid_min_u=0.000000; grid_min_V=0.000000000000e+00; V(100)=1.000000000000e+04
unstable-negative-sextic: lambda4=+1, lambda6=-0.5; grid_min_u=100.000000; grid_min_V=-4.900000000000e+05; V(100)=-4.900000000000e+05
  nonzero_stationary_u=1.333333333333e+00; V(u*)=5.925925925926e-01
factorization_max_residual=3.638e-12
analytic_minimum_u=1.000000000000; minimum_residual=0.000e+00
literal-L_int sign branch: V_physical(100)=-5.100000000000e+05
negative-sextic large-u values=-4.000000e+02,-4.900000e+05,-4.990000e+08,-4.999000e+11,-4.999900e+14
ALL ASSERTIONS PASS
```

## Lean source

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0011

theorem quartic_coupling_dimension :
    (-4 : ℤ) - 4 * (-1) = 0 := by
  norm_num

theorem sextic_coupling_dimension :
    (-4 : ℤ) - 6 * (-1) = 2 := by
  norm_num

theorem yukawa_coupling_dimension :
    (-4 : ℚ) - (2 * (-3 / 2) + (-1)) = 0 := by
  norm_num

theorem normalized_polynomial_factorization (u : ℝ) :
    (-3 * u^2 + 2 * u^3) + 1 = (u - 1)^2 * (2*u + 1) := by
  ring

theorem normalized_polynomial_lower_bound (u : ℝ) (hu : 0 ≤ u) :
    -1 ≤ -3 * u^2 + 2 * u^3 := by
  have hs : 0 ≤ (u - 1)^2 := sq_nonneg (u - 1)
  have hl : 0 ≤ 2*u + 1 := by nlinarith
  have hp : 0 ≤ (u - 1)^2 * (2*u + 1) := mul_nonneg hs hl
  rw [← normalized_polynomial_factorization u] at hp
  linarith

theorem normalized_stationary_minimum :
    -3 * (1 : ℝ)^2 + 2 * (1 : ℝ)^3 = -1 := by
  norm_num

end HsHVerification.ArchiveEQ0011
```

## Reading record

- BEDROCK: complete 548 lines / 82,842 characters; blob aa5d236354258f4c4715f5cf77bff2c5db602cfd.
- Theory state: complete 155 lines / 11,012 characters; blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
- Mersearch request remained occupied by 2026-10-21-orson-nlm-big-haul-math-001 and was not overwritten. Direct GitHub search is partial.
- Random draw: 1,102 eligible .md/.txt/.tex blobs of 10,000–500,000 bytes in HsH, excluding published-submission outputs; runtime draw 0.6839766993545682 selected index 753, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/talkaboutai.txt. Complete read: 1,461 lines / 80,205 characters; blob 35248f778cdd715cac3b8a259aded71db0f3e47d. Honest takeaway: a long transcript about AI adoption in science, claimed coding/analytic advantages, oversight, skill atrophy, cost, labor displacement, paper volume, public backlash, democratization, and the value of science as a human activity. It supplies no mathematical support for D8, but its repeated insistence on human checking directly supports this audit's executable-verification discipline.

Current H(s)H uses finite-core worldtubes and explicit readout maps. D8 remains historical genealogy and is not declared superseded.

## CODATA gate

Not admitted. D8 supplies no measured lambda_4, lambda_6, y, Phi_twist normalization, uncertainty model, vacuum state, independently predicted mass, or held-out observable. The numerical coefficients above are diagnostic examples, not fits.

Reopening discriminator: define xi and Phi_twist as fields with kinetic normalization and units; declare whether L_self is potential or interaction-Lagrangian notation; derive coefficient signs and scales from the finite-core construction; repair or remove inherited D3–D7 dependencies; solve the vacuum and fluctuation spectrum; then preregister a held-out observable with propagated uncertainty.
