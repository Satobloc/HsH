# Meridian: exact incompleteness of the scalar Sim(4) residual triple

**Status:** `GEN/DERIVED` representation-theory gate in Meridian's solver-recovery lane. It corrects a sandbox comparison metric; it does not establish solver equivalence, Hagalaz identity, or physical dynamics.

## Question

Meridian Run 078 proposed, in a shared material gauge,

```text
E_t = ||t||/R,    E_s = |log s|,    E_Q = ||Q-I||_F
```

for a similarity residual `h=(t,s,Q) in Sim(4)`. Shared gauge makes these quantities comparable, but are the three scalars sufficient to distinguish residual actions?

## Exact counterexample

Let

```text
Q(alpha,beta) = R(alpha) direct_sum R(beta),
R(theta) = [[cos(theta),-sin(theta)],[sin(theta),cos(theta)]].
```

For any SO(4) double rotation,

```text
||Q-I||_F^2 = 4[(1-cos(alpha))+(1-cos(beta))].
```

Choose

```text
Q_A = Q(pi/2,0),       Q_B = Q(pi/3,pi/3),
t_A=t_B=0,             s_A=s_B=1.
```

Then

```text
E_t(A)=E_t(B)=0,
E_s(A)=E_s(B)=0,
E_Q(A)^2=4[(1-0)+(1-1)]=4,
E_Q(B)^2=4[(1-1/2)+(1-1/2)]=4.
```

Thus both residuals have exactly the same scalar triple `(0,0,2)`. Nevertheless, for the declared material-gauge probe `x=e4`,

```text
||(Q_A-I)e4|| = 0,
||(Q_B-I)e4|| = 1.
```

The first residual fixes the second rotation plane; the second moves every nonzero vector in it. Therefore `(E_t,E_s,E_Q)` is not a complete response comparator even after gauge alignment.

## Minimal repair

`E_Q` contains only the trace because

```text
E_Q^2 = 8 - 2 tr(Q).
```

A second conjugation invariant separates the example:

```text
D_Q = det(I-Q).
D_Q(A)=0,   D_Q(B)=1.
```

Indeed, put

```text
Sigma = tr(Q)/2 = cos(alpha)+cos(beta),
d = det(I-Q)/4 = (1-cos(alpha))(1-cos(beta)).
```

Then

```text
cos(alpha) cos(beta) = d + Sigma - 1,
```

so the unordered cosine pair is recovered as the roots of

```text
x^2 - Sigma x + (d+Sigma-1) = 0.
```

For oriented SO(4) comparison, the signed invariant

```text
C_Q = Pf(Q-Q^T)/4 = sin(alpha) sin(beta)
```

retains the simultaneous-plane chirality lost by cosine-only data. Under a shared material gauge, the strongest comparison is still the full `(t,s,Q)` action, or its action on declared material probes. When only conjugacy-safe data are admissible, retain at least `s`, `tr(Q)`, `det(I-Q)`, and signed `C_Q`; do not collapse them to `E_Q`.

## Executed numerical fixtures

Python 3 with NumPy 2.3.5 executed the complete source below.

```text
MERIDIAN SO4 SCORE COUNTEREXAMPLE
A_angles=(pi/2,0)
B_angles=(pi/3,pi/3)
A E_Q=+2.000000000000e+00 trace=+2.000000000000e+00 det_I_minus_Q=+0.000000000000e+00 signed_chirality=+0.000000000000e+00 orthogonality_error=+0.000000000000e+00 det_Q=+1.000000000000e+00
B E_Q=+2.000000000000e+00 trace=+2.000000000000e+00 det_I_minus_Q=+1.000000000000e+00 signed_chirality=+7.500000000000e-01 orthogonality_error=+2.974833628667e-17 det_Q=+1.000000000000e+00
same_E_Q_error=0.000e+00
probe=e4 response_A=0.000000000000 response_B=1.000000000000
recovered_cosines_A=(1.000000000000,0.000000000000)
recovered_cosines_B=(0.500000000000,0.500000000000)
SO4_conjugation_invariant_error=1.110e-16
identity E_Q=+0.000000000000e+00 trace=+4.000000000000e+00 det_I_minus_Q=+0.000000000000e+00 signed_chirality=+0.000000000000e+00 orthogonality_error=+0.000000000000e+00 det_Q=+1.000000000000e+00
ALL_CHECKS_PASSED
boundary: representation discriminator, not solver equivalence or physics
```

The deterministic SO(4)-conjugation control preserved all four tested class quantities to `1.11e-16`. The identity negative control returned exact `E_Q=0`. Orthogonality errors were at floating-point roundoff.

## Complete runnable Python

```python
#!/usr/bin/env python3
"""Exact counterexample to scalar Sim(4) residual-score completeness."""

import math
import numpy as np


def rot2(theta: float) -> np.ndarray:
    c, s = math.cos(theta), math.sin(theta)
    return np.array([[c, -s], [s, c]], dtype=float)


def double_rotation(alpha: float, beta: float) -> np.ndarray:
    q = np.zeros((4, 4), dtype=float)
    q[:2, :2] = rot2(alpha)
    q[2:, 2:] = rot2(beta)
    return q


def pfaffian4(a: np.ndarray) -> float:
    """Pfaffian of a 4x4 skew matrix."""
    return a[0, 1] * a[2, 3] - a[0, 2] * a[1, 3] + a[0, 3] * a[1, 2]


def diagnostics(q: np.ndarray) -> dict[str, float]:
    i4 = np.eye(4)
    return {
        "E_Q": float(np.linalg.norm(q - i4, ord="fro")),
        "trace": float(np.trace(q)),
        "det_I_minus_Q": float(np.linalg.det(i4 - q)),
        "signed_chirality": float(0.25 * pfaffian4(q - q.T)),
        "orthogonality_error": float(np.linalg.norm(q.T @ q - i4)),
        "det_Q": float(np.linalg.det(q)),
    }


def recover_cosines(q: np.ndarray) -> tuple[float, float]:
    """Recover the unordered cosines from trace and det(I-Q)."""
    sigma = 0.5 * float(np.trace(q))
    product = 0.25 * float(np.linalg.det(np.eye(4) - q)) + sigma - 1.0
    disc = max(0.0, sigma * sigma - 4.0 * product)
    roots = ((sigma + math.sqrt(disc)) / 2.0,
             (sigma - math.sqrt(disc)) / 2.0)
    return tuple(sorted((max(-1.0, min(1.0, x)) for x in roots), reverse=True))


def seeded_so4() -> np.ndarray:
    rng = np.random.default_rng(20261017)
    u, _ = np.linalg.qr(rng.normal(size=(4, 4)))
    if np.linalg.det(u) < 0.0:
        u[:, 0] *= -1.0
    return u


def fmt(d: dict[str, float]) -> str:
    keys = ("E_Q", "trace", "det_I_minus_Q", "signed_chirality",
            "orthogonality_error", "det_Q")
    return " ".join(f"{k}={d[k]:+.12e}" for k in keys)


def main() -> None:
    # A rotates one plane by pi/2 and fixes the other.
    # B rotates both orthogonal planes by pi/3.
    qa = double_rotation(math.pi / 2.0, 0.0)
    qb = double_rotation(math.pi / 3.0, math.pi / 3.0)
    da, db = diagnostics(qa), diagnostics(qb)

    print("MERIDIAN SO4 SCORE COUNTEREXAMPLE")
    print("A_angles=(pi/2,0)")
    print("B_angles=(pi/3,pi/3)")
    print("A " + fmt(da))
    print("B " + fmt(db))
    print(f"same_E_Q_error={abs(da['E_Q']-db['E_Q']):.3e}")

    # With t=0 and s=1, both full scalar triples are (0,0,2).
    x = np.array([0.0, 0.0, 0.0, 1.0])
    response_a = np.linalg.norm((qa - np.eye(4)) @ x)
    response_b = np.linalg.norm((qb - np.eye(4)) @ x)
    print(f"probe=e4 response_A={response_a:.12f} response_B={response_b:.12f}")

    ca = recover_cosines(qa)
    cb = recover_cosines(qb)
    print(f"recovered_cosines_A=({ca[0]:.12f},{ca[1]:.12f})")
    print(f"recovered_cosines_B=({cb[0]:.12f},{cb[1]:.12f})")

    # SO(4)-conjugation control.
    u = seeded_so4()
    qac = u.T @ qa @ u
    qbc = u.T @ qb @ u
    dac, dbc = diagnostics(qac), diagnostics(qbc)
    invariant_keys = ("E_Q", "trace", "det_I_minus_Q", "signed_chirality")
    conjugation_error = max(
        abs(dac[k] - da[k]) for k in invariant_keys
    )
    conjugation_error = max(conjugation_error, max(
        abs(dbc[k] - db[k]) for k in invariant_keys
    ))
    print(f"SO4_conjugation_invariant_error={conjugation_error:.3e}")

    # Exact-closure negative control.
    identity = diagnostics(np.eye(4))
    print("identity " + fmt(identity))

    assert abs(da["E_Q"] - 2.0) < 1e-14
    assert abs(db["E_Q"] - 2.0) < 1e-14
    assert response_a < 1e-14
    assert abs(response_b - 1.0) < 1e-14
    assert abs(da["det_I_minus_Q"]) < 1e-14
    assert abs(db["det_I_minus_Q"] - 1.0) < 1e-14
    assert np.allclose(ca, (1.0, 0.0), atol=1e-14)
    assert np.allclose(cb, (0.5, 0.5), atol=1e-14)
    assert conjugation_error < 1e-13
    assert identity["E_Q"] == 0.0
    print("ALL_CHECKS_PASSED")
    print("boundary: representation discriminator, not solver equivalence or physics")


if __name__ == "__main__":
    main()
```

## BEDROCK comparison

- This result repairs a Meridian sandbox metric; it does not alter BR-000 through BR-006 and remains tentative under BR-003.
- It supports BR-002/BR-004 stratigraphy by retaining Run 078's useful shared-gauge rule while recording the exact defect in its scalar compression rather than silently rewriting the older checkpoint.
- It makes no claim about the historical intended meaning of Hagalaz, no `theta4` identification under BR-005, and no resolution of OC-001 or OC-002.
- It neither derives nor contradicts BR-006 interaction mechanics: no worldtube dynamics, force, inertia, braid accumulation, or observation is modeled.
- No outside ontology, Hopf carrier, restricted Hypothesis H/Schreiber source, private material, fitted constant, or physical-validation claim enters the calculation.

## Result

Shared gauge is necessary but not sufficient. A cross-solver benchmark may use the scalar triple as a coarse alarm, but equivalence testing must retain the full material-gauge action or enough independent SO(4) invariants to recover both rotation planes and their oriented relationship.
