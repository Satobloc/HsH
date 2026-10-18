# Ravel | Exact normal-frame connection of a finite-radius helix tube

**Status:** executed `GEN/DERIVED` geometry sandbox. The helix is an apparatus fixture, not an identified SAT/H(s)H worldtube, Kerr/ER core, mass law, particle, or demonstrated interaction.

## BEDROCK comparison

Live `BEDROCK.md` was read completely, with `STATE_OF_THE_THEORY.md` subordinate. This calculation respects BR-000/001 ancestry and BR-002/003/004 status discipline. It uses no Q or inverse-Q rule (OC-001), makes no electromagnetic-support choice (OC-002), and does not change the BR-005 theta-four convention. It is compatible with ND-2026-10-09-01/02 only as a finite-core mathematical apparatus: no carrier, imported spherical ontology, Kerr identity, or physical validity is inferred.

BR-006 permits geometry to be the internal mechanism, but this calculation derives only a normal-bundle connection and metric. Calling that connection a force, inertia, interbraid, mass, or measured particle phase would conflict with BR-003 and BR-006's required geometry-to-response-to-observation chain. The subordinate state map's equation-level bridge therefore remains open.

Ravel's latest gauge-covariance gate used a synthetic connection. This calculation closes one narrower dependency by deriving the connection from an explicit finite-radius tube. One correction was discovered during execution: a single circular-helix turn is an **open** segment, so its integrated Frenet connection is endpoint-dressed and must not be called an intrinsic closed-loop holonomy.

## Exact derivation

Let the centerline be

$$
\mathbf r(u)=(R\cos u,R\sin u,pu),\qquad
q=\sqrt{R^2+p^2},\qquad s=qu.
$$

Its Frenet frame is

$$
\begin{aligned}
\mathbf T&={1\over q}(-R\sin u,R\cos u,p),\\
\mathbf N&=(-\cos u,-\sin u,0),\\
\mathbf B&={1\over q}(p\sin u,-p\cos u,R),
\end{aligned}
$$

with constant curvature and torsion

$$
\kappa={R\over R^2+p^2},\qquad
\tau={p\over R^2+p^2}.
$$

The finite-radius tube coordinates are

$$
\mathbf X(s,\rho,\beta)=\mathbf r(s)+
\rho\bigl(\cos\beta\,\mathbf N+\sin\beta\,\mathbf B\bigr).
$$

Writing $\mathbf e_\beta=-\sin\beta\,\mathbf N+\cos\beta\,\mathbf B$ gives

$$
\partial_s\mathbf X=(1-\kappa\rho\cos\beta)\mathbf T
+\tau\rho\mathbf e_\beta,qquad
\partial_\beta\mathbf X=\rho\mathbf e_\beta.
$$

Thus, in coordinates $(s,\rho,\beta)$,

$$
g=
\begin{pmatrix}
h^2+\tau^2\rho^2&0&\tau\rho^2\\
0&1&0\\
\tau\rho^2&0&\rho^2
\end{pmatrix},qquad
h=1-\kappa\rho\cos\beta,qquad
\det g=\rho^2h^2.
$$

The regular local tube condition is $\kappa\rho<1$.

Rotate the normal frame by an arbitrary differentiable angle $\chi(s)$:

$$
\mathbf N_\chi=\cos\chi\,\mathbf N+\sin\chi\,\mathbf B,qquad
\mathbf B_\chi=-\sin\chi\,\mathbf N+\cos\chi\,\mathbf B.
$$

Both the connection and curvature components transform:

$$
A_\chi=\tau+\chi'(s),qquad
h_\chi=1-\kappa\rho\cos(\beta+\chi).
$$

Therefore

$$
g^{(\chi)}=
\begin{pmatrix}
h_\chi^2+A_\chi^2\rho^2&0&A_\chi\rho^2\\
0&1&0\\
A_\chi\rho^2&0&\rho^2
\end{pmatrix}.
$$

Omitting $\chi'$ while rotating the frame is not a gauge transformation and fails the numerical metric audit.

At thin-tube leading order, the longitudinal derivative appears as

$$
D_s=\partial_s-A_\chi\partial_\beta.
$$

For a transverse mode $e^{i\ell\beta}$ and an **artificial periodic identification** of one helical turn, the dimensionless control spectrum is

$$
E_{n\ell}=left({2\pi\over L}\right)^2
\left(n-\ell{1\over2\pi}\int_0^L A_s\,ds\right)^2,
\qquad L=2\pi q.
$$

This spectrum is a boundary-condition control, not the spectrum of the actual open helix. A Bishop gauge $\chi'=-\tau$ sets the local connection to zero while transferring exactly $-\tau L$ into endpoint-frame twist.

## Executed fixture and results

Parameters, in arbitrary consistent length units:

$$
R=1,qquad p=0.3,qquad \rho=0.1,qquad
\chi(s)=0.41\sin(2\pi s/L).
$$

Derived values:

$$
q=1.044030650891055,quad
L=6.559838045923817,quad
\kappa=0.9174311926605504,quad
\tau=0.2752293577981651.
$$

The one-turn axial endpoint separation is $2\pi p=1.8849555921538759$. The Frenet connection integral is

$$
\int_0^L\tau\,ds=1.8054600126395823
=2\pi(0.2873478855663454).
$$

The Bishop endpoint twist is exactly the negative of this value. The minimum $h$ is $0.908256880733945>0$, and the minimum sampled metric determinant is $0.00824930561400556$.

Central finite differences over 117 $(s,\beta)$ samples gave:

| Check | Maximum absolute error |
|---|---:|
| Frenet metric vs analytic metric | $1.9134160922362753\times10^{-10}$ |
| Periodically rotated metric vs covariant analytic metric | $1.8568158122178602\times10^{-10}$ |
| Deliberately omit $\chi'$ | $3.927087779339375\times10^{-3}$ |

Numerical quadrature preserved the connection integral to displayed precision: `1.8054600126395823`.

For the artificial periodic control with $\ell=1$, the levels in inverse-length-squared units are

$$
E_{-2}=4.799963623490671,
E_{-1}=1.52042621878178,
E_0=0.07575119939399039,
E_1=0.4659385653273016,
E_2=2.690988316581714.
$$

As $R\to0$ at fixed $p$, $\kappa\to0$ but the Frenet frame becomes singular and its unwrapped one-turn connection approaches $2\pi$. For integer transverse $\ell$, the phase approaches unity; at $R=0.001$, it is `0.9999999993907753 - 0.00003490629414697 i`. This is a frame-winding control, not residual physical curvature.

## Bounded conclusion

For an explicit finite-radius helical tube, the normal connection is not an independently assigned field: it is the torsion of the chosen normal frame, transforming as $A\mapsto A+\chi'$, while the curvature vector components transform simultaneously. The exact metric and leading thin-tube covariant derivative follow from the embedding.

However, an open helical turn supplies no intrinsic closed-loop holonomy. Any finite-window phase comparison must include endpoint-frame dressing, exactly as Ravel's previous gauge-covariance calculation required. A closed worldtube calculation must next use a genuinely closed centerline or state an explicit endpoint identification, then add finite cross-section Laplace–Beltrami band mixing before any physical response claim.

## Complete executable Python and Class-P SVG source

```python
#!/usr/bin/env python3
"""Exact normal-connection gate for a finite-radius circular-helix tube.

GEN/DERIVED geometric sandbox.  The helix is an apparatus fixture, not an
identified SAT/H(s)H worldtube, Kerr core, mass law, or physical particle.
"""

from __future__ import annotations

import json
import math
from pathlib import Path

import numpy as np


R = 1.0
P = 0.3
RHO = 0.1
ALPHA = 0.41
N_SAMPLES = 721

Q = math.hypot(R, P)
L = 2.0 * math.pi * Q
KAPPA = R / Q**2
TAU = P / Q**2


def centerline(s: float) -> np.ndarray:
    u = s / Q
    return np.array([R * math.cos(u), R * math.sin(u), P * u])


def frenet_frame(s: float) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    u = s / Q
    T = np.array([-R * math.sin(u), R * math.cos(u), P]) / Q
    N = np.array([-math.cos(u), -math.sin(u), 0.0])
    B = np.array([P * math.sin(u), -P * math.cos(u), R]) / Q
    return T, N, B


def chi(s: float) -> float:
    return ALPHA * math.sin(2.0 * math.pi * s / L)


def dchi(s: float) -> float:
    return ALPHA * (2.0 * math.pi / L) * math.cos(2.0 * math.pi * s / L)


def rotated_frame(s: float) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    T, N, B = frenet_frame(s)
    c, z = math.cos(chi(s)), math.sin(chi(s))
    return T, c * N + z * B, -z * N + c * B


def tube_point(s: float, rho: float, beta: float, rotated: bool) -> np.ndarray:
    _, N, B = rotated_frame(s) if rotated else frenet_frame(s)
    return centerline(s) + rho * (math.cos(beta) * N + math.sin(beta) * B)


def analytic_metric(
    rho: float, beta: float, connection: float, curvature_phase: float = 0.0
) -> np.ndarray:
    h = 1.0 - KAPPA * rho * math.cos(beta + curvature_phase)
    return np.array([
        [h * h + (connection * rho) ** 2, 0.0, connection * rho**2],
        [0.0, 1.0, 0.0],
        [connection * rho**2, 0.0, rho**2],
    ])


def numeric_metric(s: float, rho: float, beta: float, rotated: bool) -> np.ndarray:
    ds, dr, db = 1.0e-5, 1.0e-6, 1.0e-6
    derivs = []
    for delta, args_plus, args_minus in (
        (ds, (s + ds, rho, beta), (s - ds, rho, beta)),
        (dr, (s, rho + dr, beta), (s, rho - dr, beta)),
        (db, (s, rho, beta + db), (s, rho, beta - db)),
    ):
        derivs.append(
            (tube_point(*args_plus, rotated) - tube_point(*args_minus, rotated))
            / (2.0 * delta)
        )
    return np.array([[float(np.dot(a, b)) for b in derivs] for a in derivs])


def projection(v: np.ndarray) -> tuple[float, float]:
    return float(v[0] - 0.42 * v[1]), float(v[2] + 0.28 * v[1])


def polyline(points: list[np.ndarray], color: str, width: float) -> str:
    xy = [projection(p) for p in points]
    scale = 145.0
    ox, oy = 300.0, 295.0
    coords = " ".join(
        f"{ox+scale*x:.3f},{oy-scale*y:.3f}" for x, y in xy
    )
    return (
        f'<polyline points="{coords}" fill="none" stroke="{color}" '
        f'stroke-width="{width}" stroke-linejoin="round"/>'
    )


def write_svg(path: Path) -> None:
    ss = np.linspace(0.0, L, N_SAMPLES)
    center = [centerline(float(s)) for s in ss]
    seam_n = [tube_point(float(s), RHO, 0.0, False) for s in ss]
    seam_b = [tube_point(float(s), RHO, math.pi / 2.0, False) for s in ss]
    cross_sections = []
    for s in np.linspace(0.0, L, 13):
        ring = [
            tube_point(float(s), RHO, float(b), False)
            for b in np.linspace(0.0, 2.0 * math.pi, 65)
        ]
        cross_sections.append(polyline(ring, "#9aa7b2", 0.75))
    svg = "\n".join([
        '<svg xmlns="http://www.w3.org/2000/svg" width="760" height="620" viewBox="0 0 760 620">',
        '<rect width="100%" height="100%" fill="#fbfbf8"/>',
        '<text x="24" y="34" font-family="sans-serif" font-size="18">Finite-radius helix tube: centerline and two normal-frame seams</text>',
        '<text x="24" y="58" font-family="sans-serif" font-size="13">Exact sampled parametrization; R=1, p=0.3, rho=0.1</text>',
        *cross_sections,
        polyline(seam_n, "#bd3d3a", 2.2),
        polyline(seam_b, "#2f6fa3", 2.2),
        polyline(center, "#151515", 2.8),
        '<line x1="490" y1="530" x2="535" y2="530" stroke="#151515" stroke-width="3"/>',
        '<text x="545" y="535" font-family="sans-serif" font-size="13">centerline</text>',
        '<line x1="490" y1="552" x2="535" y2="552" stroke="#bd3d3a" stroke-width="3"/>',
        '<text x="545" y="557" font-family="sans-serif" font-size="13">beta=0 seam</text>',
        '<line x1="490" y1="574" x2="535" y2="574" stroke="#2f6fa3" stroke-width="3"/>',
        '<text x="545" y="579" font-family="sans-serif" font-size="13">beta=pi/2 seam</text>',
        '</svg>',
    ])
    path.write_text(svg + "\n", encoding="utf-8")


def main() -> None:
    max_frenet_error = 0.0
    max_rotated_error = 0.0
    max_omit_dchi_error = 0.0
    min_det = math.inf

    for s in np.linspace(0.07 * L, 0.93 * L, 9):
        for beta_prime in np.linspace(0.0, 2.0 * math.pi, 13, endpoint=False):
            gm = numeric_metric(float(s), RHO, float(beta_prime), True)
            ga = analytic_metric(
                RHO, float(beta_prime), TAU + dchi(float(s)), chi(float(s))
            )
            wrong = analytic_metric(RHO, float(beta_prime), TAU, chi(float(s)))
            max_rotated_error = max(
                max_rotated_error, float(np.max(np.abs(gm - ga)))
            )
            max_omit_dchi_error = max(
                max_omit_dchi_error, float(np.max(np.abs(gm - wrong)))
            )
            min_det = min(min_det, float(np.linalg.det(ga)))

            gf_num = numeric_metric(float(s), RHO, float(beta_prime), False)
            gf = analytic_metric(RHO, float(beta_prime), TAU)
            max_frenet_error = max(
                max_frenet_error, float(np.max(np.abs(gf_num - gf)))
            )

    connection_integral = TAU * L
    winding_fraction = connection_integral / (2.0 * math.pi)
    ell = 1
    levels = {
        str(n): (2.0 * math.pi / L) ** 2 * (n - ell * winding_fraction) ** 2
        for n in range(-2, 3)
    }
    straight_axis_controls = {
        f"R={radius:g}": {
            "kappa": radius / (radius**2 + P**2),
            "torsion": P / (radius**2 + P**2),
            "frenet_connection_integral_over_2pi": P / math.hypot(radius, P),
            "integer_mode_phase_real": math.cos(
                2.0 * math.pi * P / math.hypot(radius, P)
            ),
            "integer_mode_phase_imag": math.sin(
                2.0 * math.pi * P / math.hypot(radius, P)
            ),
        }
        for radius in (1.0, 0.1, 0.01, 0.001)
    }

    grid = np.linspace(0.0, L, 100_001)
    periodic_integral = float(
        np.trapezoid([TAU + dchi(float(s)) for s in grid], grid)
    )
    bishop_endpoint_twist = -TAU * L

    assert KAPPA * RHO < 1.0
    assert max_frenet_error < 1.0e-8
    assert max_rotated_error < 1.0e-8
    assert max_omit_dchi_error > 1.0e-4
    assert abs(periodic_integral - connection_integral) < 1.0e-12
    assert abs(connection_integral + bishop_endpoint_twist) < 1.0e-15
    assert min_det > 0.0

    write_svg(Path("ravel_helix_normal_connection.svg"))
    result = {
        "parameters": {
            "R": R,
            "p_per_radian": P,
            "rho": RHO,
            "gauge_alpha": ALPHA,
        },
        "derived": {
            "q": Q,
            "turn_length": L,
            "curvature": KAPPA,
            "torsion": TAU,
            "one_turn_frenet_connection_integral_radians": connection_integral,
            "connection_integral_over_2pi": winding_fraction,
            "axial_endpoint_separation": 2.0 * math.pi * P,
            "minimum_1_minus_kappa_rho_cosbeta": 1.0 - KAPPA * RHO,
            "minimum_metric_determinant_sampled": min_det,
            "bishop_endpoint_twist_radians": bishop_endpoint_twist,
        },
        "verification": {
            "max_frenet_metric_abs_error": max_frenet_error,
            "max_periodic_gauge_metric_abs_error": max_rotated_error,
            "max_error_if_dchi_omitted": max_omit_dchi_error,
            "periodic_gauge_connection_integral": periodic_integral,
        },
        "artificial_periodic_turn_l1_levels_inverse_length_squared": levels,
        "straight_axis_frenet_frame_controls": straight_axis_controls,
        "status": (
            "PASS; GEN/DERIVED apparatus geometry; "
            "no H(s)H physical identification"
        ),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
```

## Actual stdout

```json
{
  "artificial_periodic_turn_l1_levels_inverse_length_squared": {
    "-1": 1.52042621878178,
    "-2": 4.799963623490671,
    "0": 0.07575119939399039,
    "1": 0.4659385653273016,
    "2": 2.690988316581714
  },
  "derived": {
    "axial_endpoint_separation": 1.8849555921538759,
    "bishop_endpoint_twist_radians": -1.8054600126395823,
    "connection_integral_over_2pi": 0.2873478855663454,
    "curvature": 0.9174311926605504,
    "minimum_1_minus_kappa_rho_cosbeta": 0.908256880733945,
    "minimum_metric_determinant_sampled": 0.00824930561400556,
    "one_turn_frenet_connection_integral_radians": 1.8054600126395823,
    "q": 1.044030650891055,
    "torsion": 0.2752293577981651,
    "turn_length": 6.559838045923817
  },
  "parameters": {
    "R": 1.0,
    "gauge_alpha": 0.41,
    "p_per_radian": 0.3,
    "rho": 0.1
  },
  "status": "PASS; GEN/DERIVED apparatus geometry; no H(s)H physical identification",
  "straight_axis_frenet_frame_controls": {
    "R=0.001": {
      "frenet_connection_integral_over_2pi": 0.9999944444907404,
      "integer_mode_phase_imag": -3.490629414696997e-05,
      "integer_mode_phase_real": 0.9999999993907753,
      "kappa": 0.011110987655692715,
      "torsion": 3.333296296707814
    },
    "R=0.01": {
      "frenet_connection_integral_over_2pi": 0.9994449069791543,
      "integer_mode_phase_imag": -0.003487745241620696,
      "integer_mode_phase_real": 0.9999939177980682,
      "kappa": 0.11098779134295228,
      "torsion": 3.329633740288568
    },
    "R=0.1": {
      "frenet_connection_integral_over_2pi": 0.9486832980505138,
      "integer_mode_phase_imag": -0.3168744983901848,
      "integer_mode_phase_real": 0.9484674755994371,
      "kappa": 1.0,
      "torsion": 2.9999999999999996
    },
    "R=1": {
      "frenet_connection_integral_over_2pi": 0.2873478855663454,
      "integer_mode_phase_imag": 0.9725925947239683,
      "integer_mode_phase_real": -0.23251590201123612,
      "kappa": 0.9174311926605504,
      "torsion": 0.2752293577981651
    }
  },
  "verification": {
    "max_error_if_dchi_omitted": 0.003927087779339375,
    "max_frenet_metric_abs_error": 1.9134160922362753e-10,
    "max_periodic_gauge_metric_abs_error": 1.8568158122178602e-10,
    "periodic_gauge_connection_integral": 1.8054600126395823
  }
}
```

Embedded Python SHA-256: `6455ad26a0ce04f5e19de8742350c9ff3f5782fbe029e3c868ba549995d18583`.

Generated Class-P SVG SHA-256: `8bee0328da5372b0e70c29fff91c0b8f5bc7b8beec2df554de2cc2cd4f7d4b66`.
