#!/usr/bin/env python3
"""Nadir Playground 007: first noncommuting Dyson affine-drift gate.

Use the right-body convention Q'=Q Omega(s), t'=Qv on L=2*pi with
    Omega_0 = J12 + 2 J34,
    Omega_1(s) = eta*cos(k*s) J23,
    v = e1, rho = 1.
The perturbation is genuinely noncommuting: [Omega_0,J23] != 0.

At eta=0, t(L)=0.  At first order, the perturbed first column obeys in
the 34-plane (complex coordinate y)
    y'' + y = cos(k s) exp(2 i s),  y(0)=y'(0)=0.
The forcing frequencies are n=2+k and n=2-k.  Integration over one cycle
selects n=0 or the secular resonances n=+/-1, giving
    dt/deta|_0 = -pi/2 e3  for k=1,
                  pi e3    for k=2,
                 -pi/2 e3  for k=3,
                  0        otherwise (nonnegative integer k).

This is a PLAYGROUND/SANDBOX transport calculation, not theory authority or
a physical SAT/H(s)H claim.
"""

from __future__ import annotations

import math
import numpy as np


L = 2.0 * math.pi
V = np.array([1.0, 0.0, 0.0, 0.0])


def generator(i: int, j: int) -> np.ndarray:
    matrix = np.zeros((4, 4))
    matrix[i, j] = -1.0
    matrix[j, i] = 1.0
    return matrix


J12 = generator(0, 1)
J34 = generator(2, 3)
J23 = generator(1, 2)
OMEGA0 = J12 + 2.0 * J34


def integrate_transport(k: int, eta: float, steps: int) -> tuple[np.ndarray, np.ndarray]:
    """Fourth-order Runge-Kutta integration of Q'=Q Omega, t'=Qv."""
    h = L / steps
    q = np.eye(4)
    t = np.zeros(4)

    def rhs(s: float, q_state: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
        omega = OMEGA0 + eta * math.cos(k * s) * J23
        return q_state @ omega, q_state @ V

    for index in range(steps):
        s = index * h
        q1, t1 = rhs(s, q)
        q2, t2 = rhs(s + h / 2.0, q + h * q1 / 2.0)
        q3, t3 = rhs(s + h / 2.0, q + h * q2 / 2.0)
        q4, t4 = rhs(s + h, q + h * q3)
        q += h * (q1 + 2.0 * q2 + 2.0 * q3 + q4) / 6.0
        t += h * (t1 + 2.0 * t2 + 2.0 * t3 + t4) / 6.0
    return q, t


def analytic_first_order(k: int) -> np.ndarray:
    result = np.zeros(4)
    if k in (1, 3):
        result[2] = -math.pi / 2.0
    elif k == 2:
        result[2] = math.pi
    return result


def central_eta_derivative(k: int, eta: float, steps: int) -> np.ndarray:
    _, plus = integrate_transport(k, eta, steps)
    _, minus = integrate_transport(k, -eta, steps)
    return (plus - minus) / (2.0 * eta)


def main() -> None:
    commutator = OMEGA0 @ J23 - J23 @ OMEGA0
    commutator_norm = float(np.linalg.norm(commutator, ord="fro"))
    print(f"commutator_frobenius_norm={commutator_norm:.12f}")
    assert abs(commutator_norm - math.sqrt(10.0)) < 1e-14

    # Negative control: the unperturbed closed double rotation has zero drift.
    q0, t0 = integrate_transport(k=2, eta=0.0, steps=4000)
    print(f"eta0_rotation_closure_error={np.linalg.norm(q0-np.eye(4)):.3e}")
    print(f"eta0_translation_closure_error={np.linalg.norm(t0):.3e}")
    # RK4 error at 4,000 steps is O(1e-11) for the faster 34-plane rotation.
    assert np.linalg.norm(q0 - np.eye(4)) < 2e-11
    assert np.linalg.norm(t0) < 2e-12

    eta = 1.0e-4
    print("k,analytic_e3,numeric_e3,abs_vector_error")
    max_error = 0.0
    max_resolution_delta = 0.0
    for k in range(0, 7):
        exact = analytic_first_order(k)
        coarse = central_eta_derivative(k, eta, steps=2000)
        fine = central_eta_derivative(k, eta, steps=4000)
        error = float(np.linalg.norm(fine - exact))
        resolution_delta = float(np.linalg.norm(fine - coarse))
        max_error = max(max_error, error)
        max_resolution_delta = max(max_resolution_delta, resolution_delta)
        print(f"{k},{exact[2]:.12f},{fine[2]:.12f},{error:.3e}")

    print(f"max_abs_first_order_error={max_error:.3e}")
    print(f"max_2000_to_4000_step_delta={max_resolution_delta:.3e}")
    assert max_error < 1.2e-8
    assert max_resolution_delta < 3e-10

    # Finite-difference truncation must be second order in eta.
    err_large = np.linalg.norm(
        central_eta_derivative(2, 1.0e-3, 4000) - analytic_first_order(2)
    )
    err_small = np.linalg.norm(
        central_eta_derivative(2, 1.0e-4, 4000) - analytic_first_order(2)
    )
    observed_order = math.log(err_large / err_small) / math.log(10.0)
    print(f"central_eta_observed_order={observed_order:.6f}")
    assert 1.95 < observed_order < 2.05

    print("resonant_k=1,2,3")
    print(
        "boundary=first Dyson term for one fixed noncommuting fixture; "
        "higher orders and general path ordering remain open"
    )


if __name__ == "__main__":
    main()
