# Nadir Voss resonant drift block: exact k=1,2,3 coefficients

Status: tentative mathematical result in Nadir Voss's independent SO(4) toy-model lane; not promoted SAT/H(s)H doctrine and not empirical physics validation.

## Model and assumptions

Let `s` be dimensionless cycle phase, `0 <= s <= 2*pi`, `eta` a dimensionless perturbation, and `ell` the translation scale. For the first transported frame vector `q=(q1,q2,q3,q4)`, use

```text
q1' = q2
q2' = -q1 + eta cos(k s) q3
q3' = 2 q4 - eta cos(k s) q2
q4' = -2 q3
q(0) = (1,0,0,0),       T' = ell q,       T(0)=0.
```

This is the column form induced by `Omega=J12+2 J34+eta cos(k s) J23`. Set `ell=1` during calculation; multiply every translation coefficient below by `ell` to restore units. No target fitting is used.

## Perturbation derivation

At `eta=0`, `q1=cos(s)`, `q2=-sin(s)`, `q3=q4=0`, and the translation closes. Write

```text
q3 = eta r + O(eta^3),
q1 = cos(s) + eta^2 u + O(eta^4),
q2 = -sin(s) + eta^2 v + O(eta^4).
```

Eliminating the first-order `q4` term gives

```text
r'' + 4 r = cos(k s) cos(s) - k sin(k s) sin(s),
r(0)=r'(0)=0.
```

Direct solution at the exceptional harmonics is

```text
k=1: r1(s) = (s/4) sin(2s),
k=2: r2(s) = -(3/10)cos(3s) -(1/6)cos(s) +(7/15)cos(2s),
k=3: r3(s) = -(1/6)cos(4s) -(s/4)sin(2s) +(1/6)cos(2s).
```

The `s sin(2s)` terms expose genuine first-order resonance for `k=1,3`. The linear translation coefficient `A` in

```text
T(eta)/ell = eta A + eta^2 B + O(eta^3)
```

has `A3=int_0^(2pi) r(s) ds` and `A4=0`. At second order,

```text
u'=v,  v'=-u+cos(k s) r(s),  u(0)=v(0)=0,
B1 = integral (1-cos s) cos(k s) r(s) ds,
B2 = -integral sin(s) cos(k s) r(s) ds.
```

All integrals run from `0` to `2*pi`. Elementary Fourier integration yields

| k | A | B |
|---|---|---|
| 1 | `(0,0,-pi/4,0)` | `(-17pi/96,-pi^2/8,0,0)` |
| 2 | `(0,0,0,0)` | `(7pi/10,0,0,0)` |
| 3 | `(0,0,+pi/4,0)` | `(-91pi/480,-pi^2/8,0,0)` |

Thus `k=1,3` already fail translation closure at order `eta`. The `k=2` block has no linear drift but has positive quadratic drift `7pi/10`; blindly extending the nonresonant formula `-pi(k^2+3)/[2(k^2-1)(k^2-9)]` to `k=2` would give only `7pi/30`, so that continuation is a rigorous factor-three counterexample. For `k=4`, the nonresonant formula remains the negative-control prediction `-19pi/210`.

## Complete executable Python

```python
#!/usr/bin/env python3
"""Resonant k=1,2,3 drift gate for Nadir Voss's finite-core SO(4) toy model."""

import numpy as np
from scipy.integrate import quad, solve_ivp

PI = np.pi
L = 2.0 * PI


def q3_first(s: float, k: int) -> float:
    """Exact first-order q3 coefficient for the three resonant harmonics."""
    if k == 1:
        return 0.25 * s * np.sin(2.0 * s)
    if k == 2:
        return (-3.0 / 10.0 * np.cos(3.0 * s)
                -1.0 / 6.0 * np.cos(s)
                +7.0 / 15.0 * np.cos(2.0 * s))
    if k == 3:
        return (-1.0 / 6.0 * np.cos(4.0 * s)
                -0.25 * s * np.sin(2.0 * s)
                +1.0 / 6.0 * np.cos(2.0 * s))
    raise ValueError("q3_first is specialized to k=1,2,3")


def analytic_coefficients(k: int) -> tuple[np.ndarray, np.ndarray]:
    """Return coefficients A,B in T(eta)=eta*A+eta^2*B+O(eta^3)."""
    q3 = lambda s: q3_first(s, k)
    a3 = quad(q3, 0.0, L, epsabs=2e-13, epsrel=2e-13)[0]
    b1 = quad(lambda s: (1.0 - np.cos(s)) * np.cos(k * s) * q3(s),
              0.0, L, epsabs=2e-13, epsrel=2e-13)[0]
    b2 = -quad(lambda s: np.sin(s) * np.cos(k * s) * q3(s),
               0.0, L, epsabs=2e-13, epsrel=2e-13)[0]
    return np.array([0.0, 0.0, a3, 0.0]), np.array([b1, b2, 0.0, 0.0])


def endpoint(k: int, eta: float) -> tuple[np.ndarray, float]:
    """Integrate the full nonlinear frame and translation equations for one cycle."""
    def rhs(s: float, y: np.ndarray) -> list[float]:
        q1, q2, q3, q4, _, _, _, _ = y
        f = np.cos(k * s)
        return [q2,
                -q1 + eta * f * q3,
                2.0 * q4 - eta * f * q2,
                -2.0 * q3,
                q1, q2, q3, q4]

    y0 = np.array([1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
    sol = solve_ivp(rhs, (0.0, L), y0, method="DOP853",
                    rtol=2e-13, atol=2e-15)
    frame_error = np.linalg.norm(sol.y[:4, -1] - y0[:4])
    return sol.y[4:, -1], frame_error


def fmt(v: np.ndarray) -> str:
    return "[" + ", ".join(f"{x:+.12e}" for x in v) + "]"


def main() -> None:
    exact = {
        1: (np.array([0.0, 0.0, -PI / 4.0, 0.0]),
            np.array([-17.0 * PI / 96.0, -PI**2 / 8.0, 0.0, 0.0])),
        2: (np.zeros(4), np.array([7.0 * PI / 10.0, 0.0, 0.0, 0.0])),
        3: (np.array([0.0, 0.0, PI / 4.0, 0.0]),
            np.array([-91.0 * PI / 480.0, -PI**2 / 8.0, 0.0, 0.0])),
    }
    eta = 2e-4
    print("resonant analytic quadrature")
    for k in (1, 2, 3):
        aq, bq = analytic_coefficients(k)
        ae, be = exact[k]
        print(f"k={k} A={fmt(aq)} B={fmt(bq)} ")
        print(f"    quadrature_error={max(np.max(abs(aq-ae)), np.max(abs(bq-be))):.3e}")

    print("full-ODE centered fits, eta=2e-4")
    for k in (1, 2, 3):
        tp, closure = endpoint(k, eta)
        tm, _ = endpoint(k, -eta)
        afit = (tp - tm) / (2.0 * eta)
        bfit = (tp + tm) / (2.0 * eta**2)
        ae, be = exact[k]
        print(f"k={k} Afit={fmt(afit)} Aerr={np.max(abs(afit-ae)):.3e}")
        print(f"    Bfit={fmt(bfit)} Berr={np.max(abs(bfit-be)):.3e} closure={closure:.3e}")

    # Nonresonant negative control from the previously derived closed form.
    k = 4
    tp, closure = endpoint(k, eta)
    tm, _ = endpoint(k, -eta)
    afit = (tp - tm) / (2.0 * eta)
    bfit = (tp + tm) / (2.0 * eta**2)
    be = np.array([-PI * (k*k + 3.0) / (2.0 * (k*k - 1.0) * (k*k - 9.0)),
                   0.0, 0.0, 0.0])
    print(f"k=4 control Afit={fmt(afit)} Aerr={np.max(abs(afit)):.3e}")
    print(f"    Bfit={fmt(bfit)} Berr={np.max(abs(bfit-be)):.3e} closure={closure:.3e}")


if __name__ == "__main__":
    main()
```

## Executed output

Environment: Python 3, NumPy 2.3.5, SciPy 1.17.0. The code above was executed verbatim.

```text
resonant analytic quadrature
k=1 A=[+0.000000000000e+00, +0.000000000000e+00, -7.853981633974e-01, +0.000000000000e+00] B=[-5.563236990732e-01, -1.233700550136e+00, +0.000000000000e+00, +0.000000000000e+00]
    quadrature_error=2.220e-16
k=2 A=[+0.000000000000e+00, +0.000000000000e+00, +1.961926030130e-16, +0.000000000000e+00] B=[+2.199114857513e+00, +2.283645407020e-16, +0.000000000000e+00, +0.000000000000e+00]
    quadrature_error=2.284e-16
k=3 A=[+0.000000000000e+00, +0.000000000000e+00, +7.853981633974e-01, +0.000000000000e+00] B=[-5.955936072431e-01, -1.233700550136e+00, +0.000000000000e+00, +0.000000000000e+00]
    quadrature_error=7.772e-16
full-ODE centered fits, eta=2e-4
k=1 Afit=[+0.000000000000e+00, +0.000000000000e+00, -7.853981482576e-01, -3.096084772971e-09] Aerr=1.514e-08
    Bfit=[-5.563253420438e-01, -1.233700621772e+00, +0.000000000000e+00, +0.000000000000e+00] Berr=1.643e-06 closure=3.142e-04
k=2 Afit=[+0.000000000000e+00, +0.000000000000e+00, +3.906401879931e-09, -4.166971753961e-13] Aerr=3.906e-09
    Bfit=[+2.199114145906e+00, -5.498802368303e-08, +0.000000000000e+00, +0.000000000000e+00] Berr=7.116e-07 closure=2.932e-08
k=3 Afit=[+0.000000000000e+00, +0.000000000000e+00, +7.853981501778e-01, +6.166046186933e-09] Aerr=1.322e-08
    Bfit=[-5.955938557883e-01, -1.233700549539e+00, +0.000000000000e+00, +0.000000000000e+00] Berr=2.485e-07 closure=3.142e-04
k=4 control Afit=[+0.000000000000e+00, +0.000000000000e+00, +2.816183836958e-09, -1.651687303805e-12] Aerr=2.816e-09
    Bfit=[-2.842394205421e-01, +9.562663161322e-09, +0.000000000000e+00, +0.000000000000e+00] Berr=8.522e-08 closure=1.137e-08
```

## BEDROCK comparison

- The finite-core SO(4) generator, single transported column, and phase forcing are invented toy-model assumptions, so this result remains TF under BR-003 and BEDROCK remains unchanged under BR-002.
- The calculation is compatible with BR-006's broad geometry-interaction direction but does not establish continuous interbraid physics, cumulative braid, a Universal Indicatrix, or any physical interaction law.
- It makes no claim about BR-000 FIE, BR-001 ancestry, BR-004 stratigraphy, BR-005 theta4/time normalization, OC-001 Q/inverse-Q, or OC-002 electromagnetic temporal support.
- No Hopf carrier, external ontology, Kerr/ER identification, Schreiber material, private source, or target-fitted constant is imported. The result is a reproducible mathematical gate only.

## Consequence

The resonant block is not a removable edge case. `k=1,3` create order-eta transverse nonclosure, while `k=2` creates a factor-three correction to naive continuation. Any multiharmonic closure design must therefore project out `k=1,3` at linear order and use the exact `k=2` coefficient rather than the nonresonant rational formula.
