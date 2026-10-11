#!/usr/bin/env python3
"""Ravel sandbox: exact two-coordinate contact-relaxation minimal pair.

This is a dimensionless verification fixture, not a fitted particle model.
It compares:
  A. an instantly enslaved contact coordinate y;
  B. a finite-time relaxing contact coordinate y.

The common quadratic energy is
    E = 1/2 a x^2 + c x y + 1/2 b y^2 - F(t) x,
and the full gradient flow is
    eta_x xdot + a x + c y = F(t)
    eta_y ydot + c x + b y = 0.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.integrate import solve_ivp


OUTDIR = Path(__file__).resolve().parents[1]


def susceptibility_full(omega: np.ndarray, a: float, b: float, c: float,
                        eta_x: float, eta_y: float) -> np.ndarray:
    iw = 1j * omega
    return (b + iw * eta_y) / (
        (a + iw * eta_x) * (b + iw * eta_y) - c**2
    )


def susceptibility_enslaved(omega: np.ndarray, a: float, b: float, c: float,
                            eta_x: float) -> np.ndarray:
    a_eff = a - c**2 / b
    return 1.0 / (a_eff + 1j * omega * eta_x)


def fitted_phasor(omega: float, full: bool, a: float, b: float, c: float,
                  eta_x: float, eta_y: float, force_amplitude: float) -> complex:
    """Integrate to steady state, then recover the complex x/F phasor."""
    period = 2.0 * np.pi / omega
    n_settle, n_fit, samples_per_period = 50, 8, 240
    t_end = (n_settle + n_fit) * period
    t_eval = np.linspace(0.0, t_end, (n_settle + n_fit) * samples_per_period + 1)

    if full:
        def rhs(t: float, z: np.ndarray) -> np.ndarray:
            x, y = z
            force = force_amplitude * np.cos(omega * t)
            return np.array([
                (force - a*x - c*y) / eta_x,
                (-c*x - b*y) / eta_y,
            ])
        z0 = np.zeros(2)
    else:
        a_eff = a - c**2 / b
        def rhs(t: float, z: np.ndarray) -> np.ndarray:
            force = force_amplitude * np.cos(omega * t)
            return np.array([(force - a_eff*z[0]) / eta_x])
        z0 = np.zeros(1)

    sol = solve_ivp(
        rhs, (0.0, t_end), z0, t_eval=t_eval,
        rtol=2e-10, atol=2e-12, method="DOP853",
    )
    mask = sol.t >= n_settle * period
    t = sol.t[mask]
    x = sol.y[0, mask]
    duration = n_fit * period
    phasor = 2.0 * np.trapezoid(x * np.exp(-1j * omega*t), t) / duration
    return phasor / force_amplitude


def main() -> None:
    # Small integer/rational audit fixture; these are not empirical constants.
    a, b, c = 3.0, 2.0, 1.0
    eta_x, eta_y = 1.0, 5.0
    force_amplitude = 1.0

    H = np.array([[a, c], [c, b]])
    T = np.diag([eta_x, eta_y])
    stiffness_eigenvalues = np.linalg.eigvalsh(H)
    decay_rates = np.sort(np.linalg.eigvals(np.linalg.solve(T, H)).real)
    a_eff = a - c**2 / b
    static_compliance = 1.0 / a_eff
    enslaved_decay_rate = a_eff / eta_x

    sample_omega = np.array([0.01, 0.1, 1.0, 10.0, 100.0])
    chi_f = susceptibility_full(sample_omega, a, b, c, eta_x, eta_y)
    chi_q = susceptibility_enslaved(sample_omega, a, b, c, eta_x)

    rows = []
    integration_checks = []
    for w, full, qs in zip(sample_omega, chi_f, chi_q):
        rows.append({
            "omega": float(w),
            "full_amplitude": float(abs(full)),
            "full_phase_deg": float(np.degrees(np.angle(full))),
            "full_loop_area_abs": float(np.pi * force_amplitude**2 * (-full.imag)),
            "enslaved_amplitude": float(abs(qs)),
            "enslaved_phase_deg": float(np.degrees(np.angle(qs))),
            "enslaved_loop_area_abs": float(np.pi * force_amplitude**2 * (-qs.imag)),
            "relative_amplitude_difference": float(abs(abs(full) - abs(qs)) / abs(qs)),
        })

    for w in (0.1, 1.0, 10.0):
        numeric_full = fitted_phasor(
            w, True, a, b, c, eta_x, eta_y, force_amplitude
        )
        numeric_qs = fitted_phasor(
            w, False, a, b, c, eta_x, eta_y, force_amplitude
        )
        analytic_full = susceptibility_full(
            np.array([w]), a, b, c, eta_x, eta_y
        )[0]
        analytic_qs = susceptibility_enslaved(
            np.array([w]), a, b, c, eta_x
        )[0]
        integration_checks.append({
            "omega": w,
            "full_complex_relative_error": float(
                abs(numeric_full - analytic_full) / abs(analytic_full)
            ),
            "enslaved_complex_relative_error": float(
                abs(numeric_qs - analytic_qs) / abs(analytic_qs)
            ),
        })

    omega = np.logspace(-3, 3, 900)
    full = susceptibility_full(omega, a, b, c, eta_x, eta_y)
    qs = susceptibility_enslaved(omega, a, b, c, eta_x)
    area_full = np.pi * force_amplitude**2 * (-full.imag)
    area_qs = np.pi * force_amplitude**2 * (-qs.imag)

    i_peak_full = int(np.argmax(area_full))
    i_peak_qs = int(np.argmax(area_qs))

    result = {
        "status": "SANDBOXED dimensionless verification fixture",
        "parameters": {
            "a": a, "b": b, "c": c,
            "eta_x": eta_x, "eta_y": eta_y,
            "force_amplitude": force_amplitude,
        },
        "checks": {
            "stability_determinant_ab_minus_c2": a*b-c*c,
            "stiffness_eigenvalues": stiffness_eigenvalues.tolist(),
            "static_compliance_both_models": static_compliance,
            "full_decay_rates": decay_rates.tolist(),
            "enslaved_decay_rate": enslaved_decay_rate,
            "full_slowest_relaxation_time": float(1.0 / decay_rates[0]),
            "full_fastest_relaxation_time": float(1.0 / decay_rates[1]),
            "enslaved_relaxation_time": float(1.0 / enslaved_decay_rate),
            "full_peak_loop_area": float(area_full[i_peak_full]),
            "full_peak_loop_omega": float(omega[i_peak_full]),
            "enslaved_peak_loop_area": float(area_qs[i_peak_qs]),
            "enslaved_peak_loop_omega": float(omega[i_peak_qs]),
            "zero_frequency_limit": static_compliance,
            "high_frequency_full_asymptote": "chi ~ 1/(i omega eta_x)",
        },
        "frequency_rows": rows,
        "time_domain_integration_checks": integration_checks,
    }

    data_path = OUTDIR / "DATA" / "contact_relaxation_minimal_pair.json"
    fig_path = OUTDIR / "FIGURES" / "contact_relaxation_minimal_pair.svg"
    data_path.parent.mkdir(parents=True, exist_ok=True)
    fig_path.parent.mkdir(parents=True, exist_ok=True)
    data_path.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(2, 1, figsize=(7.2, 7.0), sharex=True)
    axes[0].loglog(omega, np.abs(full), label="finite contact relaxation", lw=2)
    axes[0].loglog(omega, np.abs(qs), "--", label="enslaved contact", lw=2)
    axes[0].set_ylabel(r"$|\chi(\omega)|$")
    axes[0].legend(frameon=False)
    axes[0].grid(True, which="both", alpha=0.22)

    axes[1].loglog(omega, area_full, label="finite contact relaxation", lw=2)
    axes[1].loglog(omega, area_qs, "--", label="enslaved contact", lw=2)
    axes[1].axvline(decay_rates[0], color="0.5", lw=1, alpha=0.7)
    axes[1].axvline(decay_rates[1], color="0.5", lw=1, alpha=0.7)
    axes[1].set_xlabel(r"drive frequency $\omega$")
    axes[1].set_ylabel(r"$|\oint x\,dF|$")
    axes[1].grid(True, which="both", alpha=0.22)
    fig.suptitle("Same static energy, different contact kinetics")
    fig.tight_layout()
    fig.savefig(fig_path)

    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
