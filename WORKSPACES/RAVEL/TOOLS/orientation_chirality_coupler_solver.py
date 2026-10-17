#!/usr/bin/env python3
"""Synthetic identifiability test for a separable orientation/chirality load coupler."""

import json
import numpy as np
from scipy.optimize import least_squares

rng = np.random.default_rng(20261007)

qs = np.linspace(0.35, 2.8, 9)
vs = np.array([0.20, 0.65, 1.15])
thetas = np.array([0.0, 0.31, 0.73, 1.12])
chis = np.array([-1.0, 1.0])
grid = np.array(np.meshgrid(qs, vs, thetas, chis, indexing="ij"))
q, v, theta, chi = [x.ravel() for x in grid]


def den(q, v, ell, tau):
    return 1.0 + (ell * q) ** 2 - 1j * q * v * tau


def response_common(p):
    a, b, c, ell, tau = p
    d = den(q, v, ell, tau)
    # C(chi,n)e_x = [a + b(cos^2 theta-1/2), b cos theta sin theta + chi c]/D
    hx = (a + b * (np.cos(theta) ** 2 - 0.5)) / d
    hy = (0.5 * b * np.sin(2 * theta) + chi * c) / d
    return np.stack([hx, hy], axis=1)


def response_split(p):
    a, b, c, ell_e, tau_e, ell_o, tau_o = p
    de = den(q, v, ell_e, tau_e)
    do = den(q, v, ell_o, tau_o)
    hx = (a + b * (np.cos(theta) ** 2 - 0.5)) / de
    hy = 0.5 * b * np.sin(2 * theta) / de + chi * c / do
    return np.stack([hx, hy], axis=1)


def residual(pred, obs, mask):
    z = (pred - obs)[mask]
    return np.concatenate([z.real.ravel(), z.imag.ravel()])


def fit(obs, mask, split=False):
    if split:
        p0 = [0.9, 0.25, 0.12, 0.6, 0.45, 0.8, 0.65]
        fun = lambda p: residual(response_split(p), obs, mask)
        bounds = ([0, -2, -2, 0.05, 0.01, 0.05, 0.01], [3, 2, 2, 3, 3, 3, 3])
    else:
        p0 = [0.9, 0.25, 0.12, 0.6, 0.45]
        fun = lambda p: residual(response_common(p), obs, mask)
        bounds = ([0, -2, -2, 0.05, 0.01], [3, 2, 2, 3, 3])
    return least_squares(fun, p0, bounds=bounds, max_nfev=50000)


def metrics(obs, generator_name):
    train = v < 1.0
    test = ~train
    out = {"generator": generator_name, "n_complex_train": int(train.sum() * 2),
           "n_complex_test": int(test.sum() * 2)}
    for name, split in [("common_pole", False), ("split_pole", True)]:
        result = fit(obs, train, split)
        pred = response_split(result.x) if split else response_common(result.x)
        r_train = residual(pred, obs, train)
        r_test = residual(pred, obs, test)
        n = r_train.size
        k = result.x.size
        rss = float(r_train @ r_train)
        aic = float(n * np.log(rss / n) + 2 * k)
        out[name] = {
            "params": [float(x) for x in result.x],
            "train_rmse_real_component": float(np.sqrt(np.mean(r_train ** 2))),
            "withheld_velocity_rmse_real_component": float(np.sqrt(np.mean(r_test ** 2))),
            "train_aic": aic,
        }
    out["delta_aic_common_minus_split"] = (
        out["common_pole"]["train_aic"] - out["split_pole"]["train_aic"]
    )
    return out


true_common = np.array([1.0, 0.34, 0.18, 0.72, 0.55])
sigma = 0.003
noise = sigma * (rng.normal(size=(q.size, 2)) + 1j * rng.normal(size=(q.size, 2)))
obs_common = response_common(true_common) + noise

true_split = np.array([1.0, 0.34, 0.18, 0.72, 0.55, 0.96, 0.82])
noise2 = sigma * (rng.normal(size=(q.size, 2)) + 1j * rng.normal(size=(q.size, 2)))
obs_split = response_split(true_split) + noise2

# Chirality difference isolates the odd channel. Its pole can be estimated independently.
result = {
    "seed": 20261007,
    "noise_sigma_per_complex_component": sigma,
    "true_common_parameters_abcelltau": true_common.tolist(),
    "true_split_parameters_abcelltau_ellOddtauOdd": true_split.tolist(),
    "common_generated": metrics(obs_common, "shared denominator"),
    "split_generated": metrics(obs_split, "odd channel has distinct denominator"),
}

print(json.dumps(result, indent=2))
