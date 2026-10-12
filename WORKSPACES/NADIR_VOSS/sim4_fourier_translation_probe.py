"""LOCAL:NADIR-FOURIER sandbox probe for periodic Sim+(4) translation closure.

For G' = G A with constant SO(4) double-rotation generator Omega,
constant body translation v, and periodic scalar dilation factor rho(s), the
translation is

    t(L) = integral_0^L rho(s) exp(s Omega) v ds.

When omega_j = m_j * 2*pi/L, each rotation-plane block samples only the
Fourier coefficient rho_hat[-m_j].  This script checks that selection rule.

No SAT/H(s)H physical interpretation, particle label, or fitted historical
constant is assumed.
"""

from __future__ import annotations

import json
import math

import numpy as np
from scipy.special import iv


def rotation_block(theta: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Return cos(theta), sin(theta) for vectorized plane rotations."""
    return np.cos(theta), np.sin(theta)


def integrate_translation(
    *, epsilon: float, harmonic_k: int, m1: int, m2: int, v: np.ndarray, n: int = 200_001
) -> np.ndarray:
    """Integrate one closed period L=2*pi with rho=exp(epsilon*sin(k*s))."""
    s = np.linspace(0.0, 2.0 * math.pi, n)
    rho = np.exp(epsilon * np.sin(harmonic_k * s))
    c1, s1 = rotation_block(m1 * s)
    c2, s2 = rotation_block(m2 * s)
    qv = np.column_stack(
        (
            c1 * v[0] - s1 * v[1],
            s1 * v[0] + c1 * v[1],
            c2 * v[2] - s2 * v[3],
            s2 * v[2] + c2 * v[3],
        )
    )
    return np.trapezoid(rho[:, None] * qv, s, axis=0)


def predicted_translation(
    *, epsilon: float, harmonic_k: int, m1: int, m2: int, v: np.ndarray
) -> np.ndarray:
    """Use rho_hat[-m]: nonzero only when the dilation harmonic divides m."""
    out = np.zeros(4)
    for offset, m in ((0, m1), (2, m2)):
        if m % harmonic_k:
            continue
        order = m // harmonic_k
        # exp(epsilon*sin(k*s)) has coefficient i^order I_order(epsilon)
        # in integral rho(s) exp(+i*m*s) ds.
        z = 2.0 * math.pi * (1j**order) * iv(order, epsilon)
        v_complex = complex(v[offset], v[offset + 1])
        t_complex = z * v_complex
        out[offset] = t_complex.real
        out[offset + 1] = t_complex.imag
    return out


def run_fixture() -> dict:
    epsilon = 0.4
    cases = [
        ("k1_hits_plane12", 1, np.array([1.0, 0.0, 0.0, 0.0])),
        ("k2_misses_plane12", 2, np.array([1.0, 0.0, 0.0, 0.0])),
        ("k2_hits_plane34", 2, np.array([0.0, 0.0, 1.0, 0.0])),
        ("k3_misses_both", 3, np.array([1.0, 0.0, 1.0, 0.0])),
    ]
    rows = []
    for name, k, v in cases:
        measured = integrate_translation(
            epsilon=epsilon, harmonic_k=k, m1=1, m2=2, v=v
        )
        predicted = predicted_translation(
            epsilon=epsilon, harmonic_k=k, m1=1, m2=2, v=v
        )
        error = float(np.linalg.norm(measured - predicted))
        assert error < 1.0e-10, (name, error, measured, predicted)
        rows.append(
            {
                "case": name,
                "harmonic_k": k,
                "body_translation": v.tolist(),
                "measured_t_L": measured.tolist(),
                "predicted_t_L": predicted.tolist(),
                "l2_error": error,
            }
        )
    return {
        "local_namespace": "LOCAL:NADIR-FOURIER",
        "period_L": 2.0 * math.pi,
        "epsilon": epsilon,
        "rotation_windings": [1, 2],
        "linear_endpoint": {"Q_L": "I", "rho_L": 1.0},
        "cases": rows,
    }


if __name__ == "__main__":
    print(json.dumps(run_fixture(), indent=2))
