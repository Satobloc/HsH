#!/usr/bin/env python3
"""C3 helical traction cancellation and force/torque tomography test."""

import json
import numpy as np
import matplotlib.pyplot as plt

rng = np.random.default_rng(20261008)
R = 0.73
f0 = 1.21
chi = -1.0
alpha = 0.47
psi = alpha + 2 * np.pi * np.arange(3) / 3
omega = np.exp(2j * np.pi / 3)


def observables(weights, handedness=chi):
    """Return complex transverse force Fx+iFy and axial torque."""
    force = 1j * handedness * f0 * np.sum(weights * np.exp(1j * psi))
    torque = handedness * R * f0 * np.sum(weights)
    return force, torque


def recover_weights(force, torque, handedness=chi):
    s0 = torque / (handedness * R * f0)
    s1_prime = np.exp(-1j * alpha) * force / (1j * handedness * f0)
    return np.array([
        (s0 + 2 * np.real(s1_prime * omega ** (-j))) / 3 for j in range(3)
    ])


# Exact balanced case.
f_bal, tau_bal = observables(np.ones(3))

# First-harmonic imbalance and analytic prediction.
eps, beta = 0.18, 0.91
w_harm = 1 + eps * np.cos(psi - beta)
f_harm, tau_harm = observables(w_harm)
f_harm_pred = 1.5j * chi * f0 * eps * np.exp(1j * beta)
tau_harm_pred = 3 * chi * R * f0

# Noisy tomography of random positive strand weights.
n = 400
truth = rng.uniform(0.65, 1.35, size=(n, 3))
sigma = 0.002
recovered = []
for w in truth:
    force, torque = observables(w)
    force += sigma * f0 * (rng.normal() + 1j * rng.normal())
    torque += sigma * R * f0 * rng.normal()
    recovered.append(recover_weights(force, torque))
recovered = np.array(recovered)
rmse = float(np.sqrt(np.mean((recovered - truth) ** 2)))

# Chirality reversal must reverse both odd observables at fixed weights.
f_plus, t_plus = observables(w_harm, handedness=1)
f_minus, t_minus = observables(w_harm, handedness=-1)

result = {
    "status": "GEN/CANDIDATE identifiability and symmetry check",
    "parameters": {"R": R, "f0": f0, "alpha": alpha, "epsilon": eps, "beta": beta},
    "balanced": {
        "transverse_force_abs": float(abs(f_bal)),
        "axial_torque": float(tau_bal),
        "predicted_axial_torque": float(3 * chi * R * f0),
    },
    "first_harmonic_imbalance": {
        "force_complex": [float(f_harm.real), float(f_harm.imag)],
        "force_prediction_error": float(abs(f_harm - f_harm_pred)),
        "torque_prediction_error": float(abs(tau_harm - tau_harm_pred)),
        "force_torque_magnitude_ratio": float(abs(f_harm) / abs(tau_harm)),
        "predicted_ratio_epsilon_over_2R": float(eps / (2 * R)),
    },
    "tomography": {"samples": n, "noise_sigma": sigma, "weight_rmse": rmse},
    "chirality_reversal": {
        "force_sum_abs": float(abs(f_plus + f_minus)),
        "torque_sum_abs": float(abs(t_plus + t_minus)),
    },
}

with open("c3_helical_traction_tomography.json", "w", encoding="utf-8") as fh:
    json.dump(result, fh, indent=2)

# Class-P cross-section: exact positions and vectors from the equations above.
fig, axes = plt.subplots(1, 2, figsize=(10, 4.8), constrained_layout=True)
for ax, weights, title in [
    (axes[0], np.ones(3), "Balanced C3: force cancels, torque remains"),
    (axes[1], w_harm, "Controlled m=1 imbalance: force reappears"),
]:
    xy = R * np.c_[np.cos(psi), np.sin(psi)]
    force_vecs = chi * f0 * weights[:, None] * np.c_[-np.sin(psi), np.cos(psi)]
    ax.add_patch(plt.Circle((0, 0), R, fill=False, ls="--", color="0.65"))
    ax.scatter(xy[:, 0], xy[:, 1], s=70, color="#552288", zorder=3)
    ax.quiver(xy[:, 0], xy[:, 1], force_vecs[:, 0], force_vecs[:, 1],
              angles="xy", scale_units="xy", scale=4.0, color="#008899", width=0.009)
    force, torque = observables(weights)
    ax.quiver(0, 0, force.real, force.imag, angles="xy", scale_units="xy", scale=4.0,
              color="#cc3311", width=0.014, zorder=4)
    ax.text(0, -1.08, f"|F_perp|={abs(force):.4f}; tau_z={torque:.4f}", ha="center", fontsize=9)
    ax.set_title(title, fontsize=10)
    ax.set_aspect("equal")
    ax.set_xlim(-1.15, 1.15)
    ax.set_ylim(-1.18, 1.15)
    ax.set_xlabel("resolver channel x")
    ax.set_ylabel("resolver channel y")
    ax.grid(alpha=0.2)
fig.suptitle("C3 helical traction selection rule (arrows are equation-derived)")
fig.savefig("c3_helical_traction_tomography.svg")

print(json.dumps(result, indent=2))
