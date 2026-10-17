#!/usr/bin/env python3
"""Contact-energy symmetry test for a nested elliptic finite core.

This is a sandbox mechanics calculation, not a particle fit.  It compares
full annular contact with a one-sided contact window and extracts the angular
Fourier spectrum of the resulting contact energy/torque.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "DATA" / "nested_contact_polarity.json"
FIG = ROOT / "FIGURES" / "nested_contact_polarity.svg"


def periodic_derivative(y: np.ndarray, dx: float) -> np.ndarray:
    return (np.roll(y, -1) - np.roll(y, 1)) / (2.0 * dx)


def contact_energy(
    psi: np.ndarray,
    phi: np.ndarray,
    *,
    preload: float,
    sleeve_quad: float,
    core_quad: float,
    polar_offset: float,
    window: str,
) -> np.ndarray:
    """Winkler contact energy 1/2 int w(phi)[q(phi,psi)_+]^2 dphi."""
    pp = psi[:, None]
    ff = phi[None, :]
    q = (
        preload
        + sleeve_quad * np.cos(2.0 * ff)
        - core_quad * np.cos(2.0 * (ff - pp))
        + polar_offset * np.cos(ff - pp)
    )
    compression = np.maximum(q, 0.0)
    if window == "annulus":
        weight = np.ones_like(phi)
    elif window == "one_sided":
        # Contact pad occupying the +x half of the circumference.
        weight = (np.cos(phi) >= 0.0).astype(float)
    else:
        raise ValueError(window)
    # Uniform periodic quadrature.  A non-periodic trapezoid on an endpoint-free
    # angular grid would itself introduce a spurious one-sided seam.
    dphi = phi[1] - phi[0]
    return 0.5 * np.sum(weight[None, :] * compression**2, axis=1) * dphi


def fourier_coefficients(y: np.ndarray, psi: np.ndarray, max_mode: int = 8) -> dict:
    dpsi = psi[1] - psi[0]
    norm = 1.0 / np.pi
    out = {}
    for m in range(1, max_mode + 1):
        a = norm * np.sum(y * np.cos(m * psi)) * dpsi
        b = norm * np.sum(y * np.sin(m * psi)) * dpsi
        out[str(m)] = {"cos": float(a), "sin": float(b), "amplitude": float(np.hypot(a, b))}
    return out


def main() -> None:
    nphi = 8192
    npsi = 1440
    phi = np.linspace(-np.pi, np.pi, nphi, endpoint=False)
    psi = np.linspace(0.0, 2.0 * np.pi, npsi, endpoint=False)
    dpsi = psi[1] - psi[0]

    params = {
        "preload": 0.22,
        "sleeve_quad": 0.14,
        "core_quad": 0.18,
        "polar_offset": 0.10,
    }
    cases = {
        "centered_annulus": {"polar_offset": 0.0, "window": "annulus"},
        "polar_annulus": {"polar_offset": params["polar_offset"], "window": "annulus"},
        "polar_one_sided": {"polar_offset": params["polar_offset"], "window": "one_sided"},
    }

    results = {}
    energies = {}
    torques = {}
    for name, case in cases.items():
        energy = contact_energy(
            psi,
            phi,
            preload=params["preload"],
            sleeve_quad=params["sleeve_quad"],
            core_quad=params["core_quad"],
            polar_offset=case["polar_offset"],
            window=case["window"],
        )
        torque = -periodic_derivative(energy, dpsi)
        half = npsi // 2
        periodicity_error = float(np.max(np.abs(energy - np.roll(energy, half))))
        energy_fourier = fourier_coefficients(energy - np.mean(energy), psi)
        torque_fourier = fourier_coefficients(torque, psi)
        odd_energy = sum(energy_fourier[str(m)]["amplitude"] ** 2 for m in (1, 3, 5, 7)) ** 0.5
        even_energy = sum(energy_fourier[str(m)]["amplitude"] ** 2 for m in (2, 4, 6, 8)) ** 0.5
        results[name] = {
            "pi_periodicity_max_error": periodicity_error,
            "energy_fourier": energy_fourier,
            "torque_fourier": torque_fourier,
            "odd_to_even_energy_ratio": float(odd_energy / even_energy),
            "energy_at_0": float(energy[0]),
            "energy_at_pi": float(energy[half]),
            "delta_E_pi_minus_0": float(energy[half] - energy[0]),
        }
        energies[name] = energy
        torques[name] = torque

    DATA.parent.mkdir(parents=True, exist_ok=True)
    FIG.parent.mkdir(parents=True, exist_ok=True)
    payload = {
        "model": "U(psi)=1/2 integral w(phi) max(q,0)^2 dphi",
        "q": "d + u cos(2phi) - v cos(2(phi-psi)) + e cos(phi-psi)",
        "parameters": params,
        "resolution": {"n_phi": nphi, "n_psi": npsi},
        "results": results,
    }
    DATA.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    colors = {
        "centered_annulus": "#2c7fb8",
        "polar_annulus": "#7fcdbb",
        "polar_one_sided": "#d95f0e",
    }
    labels = {
        "centered_annulus": "centered ellipse + annulus",
        "polar_annulus": "polar core + annulus",
        "polar_one_sided": "polar core + one-sided pad",
    }
    fig, axes = plt.subplots(2, 2, figsize=(11, 7.5), constrained_layout=True)
    x = psi / np.pi
    for name in cases:
        e0 = energies[name] - np.min(energies[name])
        axes[0, 0].plot(x, e0, lw=2.0, color=colors[name], label=labels[name])
        axes[0, 1].plot(x, torques[name], lw=2.0, color=colors[name], label=labels[name])

    modes = np.arange(1, 9)
    width = 0.24
    for j, name in enumerate(cases):
        amp_e = [results[name]["energy_fourier"][str(m)]["amplitude"] for m in modes]
        amp_t = [results[name]["torque_fourier"][str(m)]["amplitude"] for m in modes]
        axes[1, 0].bar(modes + (j - 1) * width, amp_e, width=width, color=colors[name], label=labels[name])
        axes[1, 1].bar(modes + (j - 1) * width, amp_t, width=width, color=colors[name], label=labels[name])

    axes[0, 0].set(title="Contact energy", xlabel=r"core angle $\psi/\pi$", ylabel=r"$U-U_{\min}$")
    axes[0, 1].set(title="Contact torque", xlabel=r"core angle $\psi/\pi$", ylabel=r"$M=-\partial_\psi U$")
    axes[1, 0].set(title="Energy Fourier amplitudes", xlabel="angular mode m", ylabel="amplitude", xticks=modes)
    axes[1, 1].set(title="Torque Fourier amplitudes", xlabel="angular mode m", ylabel="amplitude", xticks=modes)
    axes[1, 0].set_yscale("log")
    axes[1, 1].set_yscale("log")
    axes[0, 0].legend(frameon=False, fontsize=9)
    for ax in axes.flat:
        ax.grid(alpha=0.22)
    fig.suptitle("Nested finite-core contact: polarity requires inversion breaking", fontsize=14)
    fig.savefig(FIG, format="svg")

    print(json.dumps(payload, indent=2))


if __name__ == "__main__":
    main()
