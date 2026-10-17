#!/usr/bin/env python3
"""Nadir Playground 009: multiharmonic quadratic drift is a Dirichlet form.

GEN/DERIVED sandbox calculation; no physical SAT/H(s)H claim.  This extends
``nadir_second_order_noncommuting_drift_gate_20261013.py`` in its public
PLAYGROUND lane.  Use dimensionless 0 <= s <= 2*pi and

    Q' = Q[J12 + 2 J34 + eta f(s) J23],   t' = Q e1,
    f(s) = sum_{k>=4} a_k cos(k s),        Q(0)=I, t(0)=0.

For one harmonic, the public checkpoint derived

    C_k = -pi (k^2+3) / [2 (k^2-1)(k^2-9)].

Linearity of the first variational equation and Fourier orthogonality give
the exact eta^2 coefficient of the e1 translation for finite support:

    C[a] = sum_k C_k a_k^2 + sum_k D_k a_k a_{k+1},
    D_k = pi (k^2+k+4) / [2(k-2)(k-1)(k+2)(k+3)].

All non-adjacent cross terms vanish.  Algebraically,

    C_k = -(D_{k-1}+D_k)/2  (k>=5),
    C_4 + D_4/2 = -pi/15,

so, with a_k=0 outside its finite support,

    C[a] = -(pi/15) a_4^2 - (1/2) sum_{k>=4} D_k(a_k-a_{k+1})^2 < 0

for every nonzero finite sequence.  Thus multitone interference cannot cancel
the second-order noncommuting drift in this fixture.

The prior single-harmonic commuting control does *not* generalize unchanged.
For the J12 replacement, direct phase expansion gives

    C_comm[a] = -(pi/2) sum_k a_k a_{k+1}/[k(k+1)].

It vanishes for a single harmonic (and at quadratic order when no active modes
are adjacent), but adjacent tones mix to difference frequency 1 and drift.
This is a rigorous negative control on overgeneralizing the previous closure
statement, not a physical interpretation.
"""

from __future__ import annotations

import math
from fractions import Fraction

import numpy as np
from scipy.integrate import quad, solve_ivp


L = 2.0 * math.pi


def generator(i: int, j: int) -> np.ndarray:
    result = np.zeros((4, 4))
    result[i, j] = -1.0
    result[j, i] = 1.0
    return result


J12 = generator(0, 1)
J34 = generator(2, 3)
J23 = generator(1, 2)
OMEGA0 = J12 + 2.0 * J34


def c_diag(k: int) -> float:
    if k < 4:
        raise ValueError("nonresonant derivation requires integer k >= 4")
    return -math.pi * (k * k + 3) / (2 * (k * k - 1) * (k * k - 9))


def d_adjacent(k: int) -> float:
    if k < 4:
        raise ValueError("nonresonant derivation requires integer k >= 4")
    return (
        math.pi
        * (k * k + k + 4)
        / (2 * (k - 2) * (k - 1) * (k + 2) * (k + 3))
    )


def z_first_order(k: int, s: float) -> complex:
    """First-order 34-plane response z for a unit cos(k*s) forcing."""
    if k < 4:
        raise ValueError("nonresonant derivation requires integer k >= 4")

    def mode(n: int) -> complex:
        return (
            np.exp(1j * n * s)
            - np.cos(2 * s)
            - 0.5j * n * np.sin(2 * s)
        ) / (4 - n * n)

    return (
        -0.5j * np.sin(2 * s)
        + 0.5 * (1 + k) * mode(1 + k)
        + 0.5 * (1 - k) * mode(1 - k)
    )


def normalize(amplitudes: dict[int, float]) -> dict[int, float]:
    clean = {int(k): float(v) for k, v in amplitudes.items() if v != 0.0}
    if clean and min(clean) < 4:
        raise ValueError("all active harmonics must satisfy k >= 4")
    return clean


def coefficient_matrix_form(amplitudes: dict[int, float]) -> float:
    a = normalize(amplitudes)
    return sum(c_diag(k) * value**2 for k, value in a.items()) + sum(
        d_adjacent(k) * a.get(k, 0.0) * a.get(k + 1, 0.0)
        for k in range(4, max(a, default=3) + 1)
    )


def coefficient_energy_form(amplitudes: dict[int, float]) -> float:
    a = normalize(amplitudes)
    if not a:
        return 0.0
    last = max(a)
    return -math.pi * a.get(4, 0.0) ** 2 / 15.0 - 0.5 * sum(
        d_adjacent(k) * (a.get(k, 0.0) - a.get(k + 1, 0.0)) ** 2
        for k in range(4, last + 1)
    )


def commuting_coefficient(amplitudes: dict[int, float]) -> float:
    """Exact eta^2 e1 coefficient for the commuting J12 replacement."""
    a = normalize(amplitudes)
    return -0.5 * math.pi * sum(
        a.get(k, 0.0) * a.get(k + 1, 0.0) / (k * (k + 1))
        for k in range(4, max(a, default=3) + 1)
    )


def coefficient_quadrature(amplitudes: dict[int, float]) -> complex:
    a = normalize(amplitudes)

    def integrand(s: float) -> complex:
        forcing = sum(value * math.cos(k * s) for k, value in a.items())
        z = sum(value * z_first_order(k, s) for k, value in a.items())
        return (1.0 - math.cos(s)) * forcing * z

    real = quad(lambda s: integrand(s).real, 0, L, epsabs=2e-12, limit=400)[0]
    imag = quad(lambda s: integrand(s).imag, 0, L, epsabs=2e-12, limit=400)[0]
    return real + 1j * imag


def integrate_transport(
    amplitudes: dict[int, float], eta: float, perturbation: np.ndarray
) -> tuple[np.ndarray, np.ndarray]:
    a = normalize(amplitudes)

    def rhs(s: float, state: np.ndarray) -> np.ndarray:
        q = state[:16].reshape(4, 4)
        forcing = sum(value * math.cos(k * s) for k, value in a.items())
        return np.r_[(q @ (OMEGA0 + eta * forcing * perturbation)).ravel(), q[:, 0]]

    initial = np.r_[np.eye(4).ravel(), np.zeros(4)]
    solution = solve_ivp(
        rhs,
        (0.0, L),
        initial,
        method="DOP853",
        rtol=2e-13,
        atol=1e-14,
        max_step=0.02,
    )
    assert solution.success
    return solution.y[:16, -1].reshape(4, 4), solution.y[16:, -1]


def exact_rational_identity_gate() -> None:
    """Check the claimed diagonal identity without floating-point algebra."""
    # Divide all coefficients by pi.  Interior diagonal equality is exact.
    for k in range(5, 200):
        c = -Fraction(k * k + 3, 2 * (k * k - 1) * (k * k - 9))
        d_left = Fraction(
            (k - 1) ** 2 + (k - 1) + 4,
            2 * (k - 3) * (k - 2) * (k + 1) * (k + 2),
        )
        d_right = Fraction(
            k * k + k + 4,
            2 * (k - 2) * (k - 1) * (k + 2) * (k + 3),
        )
        assert c == -(d_left + d_right) / 2
    c4 = -Fraction(19, 2 * 15 * 7)
    d4 = Fraction(24, 2 * 2 * 3 * 6 * 7)
    assert c4 + d4 / 2 == -Fraction(1, 15)


def main() -> None:
    exact_rational_identity_gate()
    samples = {
        "single": {4: 1.0},
        "adjacent": {4: 1.0, 5: -0.7},
        "gapped": {4: 1.0, 6: 0.4, 10: -0.2},
        "mixed": {4: 0.8, 5: 1.1, 7: -0.4, 8: 0.3, 12: -0.2},
    }
    print("case matrix_C energy_C quadrature_C abs_crosscheck")
    for name, amplitudes in samples.items():
        matrix = coefficient_matrix_form(amplitudes)
        energy = coefficient_energy_form(amplitudes)
        quadrature = coefficient_quadrature(amplitudes)
        error = max(abs(matrix - energy), abs(matrix - quadrature))
        print(name, f"{matrix:.12f}", f"{energy:.12f}", f"{quadrature.real:.12f}", f"{error:.3e}")
        assert matrix < 0.0
        assert abs(quadrature.imag) < 3e-12
        assert error < 4e-12

    # Selection rule: adjacent pair has D_k; a gap >=2 has exactly zero cross term.
    adjacent_cross = (
        coefficient_matrix_form({4: 1.0, 5: 1.0}) - c_diag(4) - c_diag(5)
    )
    gapped_cross = (
        coefficient_matrix_form({4: 1.0, 6: 1.0}) - c_diag(4) - c_diag(6)
    )
    print(f"adjacent_4_5_cross={adjacent_cross:.12f}")
    print(f"nonadjacent_4_6_cross={gapped_cross:.3e}")
    assert abs(adjacent_cross - d_adjacent(4)) < 2e-15
    assert abs(gapped_cross) < 2e-15

    # The old commuting exact-zero control survives for a single tone and for
    # this all-even gapped spectrum, but not for adjacent multitone forcing.
    for control in ({4: 1.0}, {4: 1.0, 6: 0.4}):
        _, translation = integrate_transport(control, 0.2, J12)
        assert np.linalg.norm(translation) < 2e-11

    amplitudes = samples["mixed"]
    exact = coefficient_matrix_form(amplitudes)
    commuting_exact = commuting_coefficient(amplitudes)
    print("eta noncomm_C relative_error odd_34_norm comm_C comm_relative_error")
    relative_errors = []
    commuting_errors = []
    for eta in (0.16, 0.08, 0.04, 0.02):
        q_plus, t_plus = integrate_transport(amplitudes, eta, J23)
        _, t_minus = integrate_transport(amplitudes, -eta, J23)
        _, t_commuting_plus = integrate_transport(amplitudes, eta, J12)
        _, t_commuting_minus = integrate_transport(amplitudes, -eta, J12)
        even = (t_plus + t_minus) / 2.0
        odd = (t_plus - t_minus) / 2.0
        commuting_even = (t_commuting_plus + t_commuting_minus) / 2.0
        relative_error = abs(even[0] / eta**2 / exact - 1.0)
        commuting_error = abs(commuting_even[0] / eta**2 / commuting_exact - 1.0)
        relative_errors.append(relative_error)
        commuting_errors.append(commuting_error)
        print(
            f"{eta:.3f} {even[0]/eta**2:.12f} {relative_error:.6e} "
            f"{np.linalg.norm(odd[2:]):.6e} {commuting_even[0]/eta**2:.12f} "
            f"{commuting_error:.6e}"
        )
        assert np.linalg.norm(q_plus.T @ q_plus - np.eye(4)) < 1e-11
        assert np.linalg.norm(even[2:]) < 2e-11
        assert np.linalg.norm(odd[:2]) < 2e-11
        assert abs(commuting_even[1]) < 2e-11

    observed_orders = [
        math.log(relative_errors[i] / relative_errors[i + 1], 2.0)
        for i in range(len(relative_errors) - 1)
    ]
    print("eta_halving_error_orders=" + ",".join(f"{x:.6f}" for x in observed_orders))
    assert all(1.95 < order < 2.05 for order in observed_orders)
    commuting_orders = [
        math.log(commuting_errors[i] / commuting_errors[i + 1], 2.0)
        for i in range(len(commuting_errors) - 1)
    ]
    print("commuting_error_orders=" + ",".join(f"{x:.6f}" for x in commuting_orders))
    assert all(1.95 < order < 2.05 for order in commuting_orders)
    print("PASS: adjacent-only mixing; negative Dirichlet form; commuting counterexample")


if __name__ == "__main__":
    main()
