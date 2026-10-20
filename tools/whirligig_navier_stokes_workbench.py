#!/usr/bin/env python3
"""
Whirlygig / Navier-Stokes Python Workbench v0.3.1

Pure Python/NumPy version. It generates a Whirlygig bridge between a smooth
periodic divergence-free start field and a near-singular periodic vortex field,
then scores the bridge with a finite-difference vorticity-form Navier-Stokes
residual.

This is a candidate generator and residual scorer, not a proof.
"""

from __future__ import annotations

import argparse
import csv
import json
import math
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Callable

import numpy as np

try:
    import matplotlib.pyplot as plt
except ImportError as exc:
    raise SystemExit(
        "matplotlib is required. Install with:\n\n"
        "    py -m pip install numpy matplotlib\n"
    ) from exc

Array = np.ndarray


@dataclass
class Params:
    epsilon: float = 0.15
    nu: float = 1.0
    final_time: float = 1.0
    winding_p: int = 2
    winding_q: int = 3
    samples: int = 360
    fourier_order: int = 10
    frame_coupling: float = 0.35
    structure_gain: float = 0.32
    projector_mix: float = 0.55
    correction_gain: float = 0.08
    limiter_strength: float = 1.5
    residual_grid: int = 5
    residual_times: int = 17
    major_radius: float = 3.0
    minor_radius: float = 1.0
    ball_radius: float = 0.22
    spatial_step: float = 3.0e-3
    tau_step: float = 4.0e-4
    out: str = "py-whirlygig-output"


def normalize(v: Array, fallback: Array | None = None, axis: int = -1) -> Array:
    v = np.asarray(v, dtype=float)
    if fallback is None:
        fallback = np.zeros(v.shape[-1], dtype=float)
        fallback[0] = 1.0
    fallback = np.asarray(fallback, dtype=float)
    n = np.linalg.norm(v, axis=axis, keepdims=True)
    safe = n > 1e-12
    out = v / np.where(safe, n, 1.0)
    if out.ndim == 1:
        return out if bool(safe) else fallback
    return np.where(safe, out, fallback)


def cyclic_derivative(data: Array) -> Array:
    return (np.roll(data, -1, axis=0) - np.roll(data, 1, axis=0)) / 2.0


def cyclic_tangent(data: Array) -> Array:
    return normalize(cyclic_derivative(data))


def cyclic_curvature(data: Array) -> Array:
    return cyclic_derivative(cyclic_tangent(data))


def arc_phase(data: Array) -> Array:
    segments = np.linalg.norm(np.roll(data, -1, axis=0) - data, axis=1)
    total = float(segments.sum())
    if total <= 1e-12:
        return np.zeros(len(data))
    cumulative = np.concatenate([[0.0], np.cumsum(segments[:-1])])
    return 2.0 * np.pi * cumulative / total


def turn_phase(data: Array) -> Array:
    tangents = cyclic_tangent(data)
    dots = np.sum(tangents * np.roll(tangents, -1, axis=0), axis=1)
    angles = np.arccos(np.clip(dots, -1.0, 1.0))
    total = float(angles.sum())
    if total <= 1e-12:
        return np.zeros(len(data))
    cumulative = np.concatenate([[0.0], np.cumsum(angles[:-1])])
    return 2.0 * np.pi * cumulative / total


def wrap_t3(points: Array) -> Array:
    return ((np.asarray(points) + np.pi) % (2.0 * np.pi)) - np.pi


# -----------------------------------------------------------------------------
# Endpoint fields on T^3
# -----------------------------------------------------------------------------

def u_start(points: Array) -> Array:
    p = np.asarray(points, dtype=float)
    z = p[..., 2]
    return np.stack([np.sin(z), np.zeros_like(z), np.zeros_like(z)], axis=-1)


def u_endpoint(points: Array, eps: float) -> Array:
    p = np.asarray(points, dtype=float)
    x, y = p[..., 0], p[..., 1]
    den = eps * eps + 2.0 - np.cos(x) - np.cos(y)
    return np.stack([-np.sin(y) / den, np.sin(x) / den, np.zeros_like(x)], axis=-1)


def probe(s: Array) -> Array:
    s = np.asarray(s, dtype=float)
    return np.stack([s, 2.0 * s, 3.0 * s], axis=-1)


def sphere_lift(v: Array, sign: int) -> Array:
    v = np.asarray(v, dtype=float)
    tail = sign * (1.0 + np.linalg.norm(v, axis=-1))
    q = np.concatenate([v, tail[..., None]], axis=-1)
    return normalize(q, fallback=np.array([0.0, 0.0, 0.0, float(sign)]))


def sphere_projection(q: Array) -> Array:
    # Bounded visualization projection only.
    q = np.asarray(q, dtype=float)
    return q[..., :3] / (1.35 - 0.35 * q[..., 3:4])


# -----------------------------------------------------------------------------
# Torus, rolling ball, projector pen
# -----------------------------------------------------------------------------

def er(theta: Array) -> Array:
    return np.stack([np.cos(theta), np.sin(theta), np.zeros_like(theta)], axis=-1)


def et(theta: Array) -> Array:
    return np.stack([-np.sin(theta), np.cos(theta), np.zeros_like(theta)], axis=-1)


def ez(theta: Array) -> Array:
    return np.stack([np.zeros_like(theta), np.zeros_like(theta), np.ones_like(theta)], axis=-1)


def centerline(theta: Array, R: float) -> Array:
    return R * er(theta)


def torus_normal(theta: Array, phi: Array) -> Array:
    return np.cos(phi)[..., None] * er(theta) + np.sin(phi)[..., None] * ez(theta)


def torus_surface(theta: Array, phi: Array, R: float, a: float) -> Array:
    return centerline(theta, R) + a * torus_normal(theta, phi)


def ball_center(theta: Array, phi: Array, R: float, a: float, rb: float) -> Array:
    return centerline(theta, R) + (a - rb) * torus_normal(theta, phi)


def rotation_matrix(axis: Array, angle: float) -> Array:
    axis = normalize(axis)
    x, y, z = axis
    c = math.cos(angle)
    s = math.sin(angle)
    C = 1.0 - c
    return np.array([
        [c + x*x*C, x*y*C - z*s, x*z*C + y*s],
        [y*x*C + z*s, c + y*y*C, y*z*C - x*s],
        [z*x*C - y*s, z*y*C + x*s, c + z*z*C],
    ])


def rolling_orientations(centers: Array, normals: Array, rb: float) -> Array:
    n = len(centers)
    rots = np.zeros((n, 3, 3), dtype=float)
    rots[0] = np.eye(3)
    for i in range(n - 1):
        dc = centers[i + 1] - centers[i]
        axis = -np.cross(normals[i], dc)
        angle = float(np.linalg.norm(dc) / rb)
        if np.linalg.norm(axis) < 1e-12 or angle < 1e-12:
            rots[i + 1] = rots[i]
        else:
            rots[i + 1] = rotation_matrix(axis, angle) @ rots[i]
    return rots


def projector_trace(theta1: Array, theta2: Array, guide: Array, gate: Array, p: Params) -> dict[str, Array]:
    C = centerline(theta1, p.major_radius)
    N = torus_normal(theta1, theta2)
    B = ball_center(theta1, theta2, p.major_radius, p.minor_radius, p.ball_radius)
    rots = rolling_orientations(B, N, p.ball_radius)
    body_z = np.einsum("nij,j->ni", rots, np.array([0.0, 0.0, 1.0]))
    mixed = normalize(body_z + guide, fallback=np.array([1.0, 0.0, 0.0]))
    desired = normalize(
        (1.0 - p.projector_mix * gate)[:, None] * N
        + (p.projector_mix * gate)[:, None] * mixed,
        fallback=np.array([1.0, 0.0, 0.0]),
    )
    ER = er(theta1)
    EZ = ez(theta1)
    plane = np.sum(desired * ER, axis=1)[:, None] * ER + np.sum(desired * EZ, axis=1)[:, None] * EZ
    pen_normals = normalize(plane, fallback=np.array([1.0, 0.0, 0.0]))
    pen = C + p.minor_radius * pen_normals
    contact = C + p.minor_radius * N
    return {
        "centerlines": C,
        "contact_normals": N,
        "ball_centers": B,
        "rotations": rots,
        "body_z": body_z,
        "pen_tips": pen,
        "contact_points": contact,
    }


# -----------------------------------------------------------------------------
# Fourier fit and bridge
# -----------------------------------------------------------------------------

def fourier_design(s: Array, order: int) -> Array:
    cols = [np.ones_like(s)]
    for k in range(1, order + 1):
        cols += [np.cos(k * s), np.sin(k * s)]
    return np.stack(cols, axis=1)


def fourier_fit(data: Array, s: Array, order: int) -> Array:
    A = fourier_design(s, order)
    coeffs = []
    for j in range(data.shape[1]):
        c, *_ = np.linalg.lstsq(A, data[:, j], rcond=None)
        coeffs.append(c)
    return np.asarray(coeffs)


def fourier_eval(coeffs: Array, s: Array) -> Array:
    order = (coeffs.shape[1] - 1) // 2
    return fourier_design(np.asarray(s, dtype=float), order) @ coeffs.T


def normalized_pen_coeffs(pen: Array, s: Array, order: int) -> tuple[Array, Array, float]:
    coeffs = fourier_fit(pen, s, order)
    fit = fourier_eval(coeffs, s)
    err = float(np.max(np.linalg.norm(pen - fit, axis=1)))
    mean = fit.mean(axis=0)
    std = fit.std(axis=0) + 1e-12
    norm = coeffs.copy()
    norm[:, 0] -= mean
    norm = norm / std[:, None]
    return coeffs, norm, err


def coeff_values(norm_coeffs: Array, tau: float) -> Array:
    return fourier_eval(norm_coeffs, np.array([2.0 * np.pi * tau]))[0]


def correction_modes(points: Array) -> Array:
    q = np.asarray(points, dtype=float)
    x, y, z = q[..., 0], q[..., 1], q[..., 2]
    m1 = np.stack([np.sin(x + y), -np.sin(x + y), np.zeros_like(x)], axis=-1)
    m2 = np.stack([np.zeros_like(x), np.sin(y + z), -np.sin(y + z)], axis=-1)
    m3 = np.stack([np.sin(x + z), np.zeros_like(x), -np.sin(x + z)], axis=-1)
    return np.stack([m1, m2, m3], axis=-2)


def bridge_u(points: Array, tau: float, p: Params, norm_coeffs: Array) -> Array:
    w = 3.0 * tau * tau - 2.0 * tau * tau * tau
    env = math.sin(math.pi * tau) ** 2
    ua = u_start(points)
    ub = u_endpoint(points, p.epsilon)
    c = coeff_values(norm_coeffs, tau)[:3]
    modes = correction_modes(points)
    corr = np.einsum("j,...jv->...v", c, modes)
    return (1.0 - w) * ua + w * ub + p.correction_gain * env * corr


# -----------------------------------------------------------------------------
# Numerical vorticity residual
# -----------------------------------------------------------------------------

def curl(points: Array, tau: float, p: Params, coeffs: Array) -> Array:
    h = p.spatial_step
    E = np.eye(3)
    grads = []
    for a in range(3):
        up = bridge_u(points + h * E[a], tau, p, coeffs)
        um = bridge_u(points - h * E[a], tau, p, coeffs)
        grads.append((up - um) / (2.0 * h))
    dux, duy, duz = grads
    return np.stack([
        duy[..., 2] - duz[..., 1],
        duz[..., 0] - dux[..., 2],
        dux[..., 1] - duy[..., 0],
    ], axis=-1)


def grad_vector(field: Callable[[Array], Array], points: Array, h: float) -> Array:
    E = np.eye(3)
    grads = []
    for a in range(3):
        grads.append((field(points + h * E[a]) - field(points - h * E[a])) / (2.0 * h))
    return np.stack(grads, axis=-1)  # [..., component, axis]


def lap_vector(field: Callable[[Array], Array], points: Array, h: float) -> Array:
    E = np.eye(3)
    f0 = field(points)
    lap = np.zeros_like(f0)
    for a in range(3):
        lap += (field(points + h * E[a]) - 2.0 * f0 + field(points - h * E[a])) / (h * h)
    return lap


def ns_residual(points: Array, tau: float, p: Params, coeffs: Array) -> Array:
    h = p.spatial_step
    th = p.tau_step
    tp = min(1.0, tau + th)
    tm = max(0.0, tau - th)
    domega_dt = (curl(points, tp, p, coeffs) - curl(points, tm, p, coeffs)) / ((tp - tm) * p.final_time)
    u0 = bridge_u(points, tau, p, coeffs)
    w0 = curl(points, tau, p, coeffs)

    def uf(q: Array) -> Array:
        return bridge_u(q, tau, p, coeffs)

    def wf(q: Array) -> Array:
        return curl(q, tau, p, coeffs)

    grad_w = grad_vector(wf, points, h)
    grad_u = grad_vector(uf, points, h)
    lap_w = lap_vector(wf, points, h)
    adv = np.einsum("...a,...ja->...j", u0, grad_w)
    stretch = np.einsum("...a,...ja->...j", w0, grad_u)
    return domega_dt + adv - stretch - p.nu * lap_w


def witness_points(eps: float, grid: int, angle_count: int = 16) -> Array:
    axis = np.linspace(-np.pi, np.pi, grid, endpoint=False)
    uniform = np.array(np.meshgrid(axis, axis, axis, indexing="ij")).reshape(3, -1).T
    radii = eps * np.array([0.5, 1.0, math.sqrt(2.0), 2.0, 4.0, 8.0])
    angles = np.linspace(0.0, 2.0 * np.pi, angle_count, endpoint=False)
    zlevels = np.array([-np.pi, -np.pi / 2, 0.0, np.pi / 2])
    adaptive = []
    for r in radii:
        for a in angles:
            for z in zlevels:
                adaptive.append([r * math.cos(a), r * math.sin(a), z])
    pts = np.vstack([uniform, np.asarray(adaptive)])
    pts = wrap_t3(pts)
    _, idx = np.unique(np.round(pts, 12), axis=0, return_index=True)
    return pts[np.sort(idx)]


def residual_profile(points: Array, p: Params, coeffs: Array) -> list[dict]:
    records = []
    for tau in np.linspace(0.0, 1.0, p.residual_times):
        res = ns_residual(points, float(tau), p, coeffs)
        norms = np.linalg.norm(res, axis=1)
        worst = int(np.nanargmax(norms))
        records.append({
            "tau": float(tau),
            "rms_residual": float(np.sqrt(np.nanmean(norms * norms))),
            "max_residual": float(norms[worst]),
            "worst_point": points[worst].tolist(),
        })
    return records


def residual_gate(records: list[dict], strength: float) -> tuple[Array, Array]:
    tau = np.array([r["tau"] for r in records])
    vals = np.array([r["max_residual"] for r in records])
    scale = float(np.quantile(vals[np.isfinite(vals)], 0.65) + 1e-12)
    gate = np.exp(-strength * np.clip(vals / scale, 0.0, 50.0))
    return tau, gate


# -----------------------------------------------------------------------------
# Build model and export
# -----------------------------------------------------------------------------

def build(p: Params) -> dict:
    s = np.linspace(0.0, 2.0 * np.pi, max(120, p.samples), endpoint=False)
    ua_probe = u_start(probe(s))
    ub_probe = u_endpoint(probe(s), p.epsilon)
    a4 = sphere_lift(ua_probe, +1)
    b4 = sphere_lift(ub_probe, -1)
    a3 = sphere_projection(a4)
    b3 = sphere_projection(b4)

    guide4 = normalize(
        normalize(b4 - a4)
        + 0.65 * (cyclic_tangent(b4) - cyclic_tangent(a4))
        + 0.35 * (cyclic_curvature(b4) - cyclic_curvature(a4))
    )
    guide3 = normalize(guide4[:, :3], fallback=np.array([0.0, 0.0, 1.0]))

    arca, arcb = arc_phase(a4), arc_phase(b4)
    turna, turnb = turn_phase(a4), turn_phase(b4)
    th1_base = p.winding_p * arca + p.frame_coupling * (turna - arca)
    th2_base = p.winding_q * arcb + p.frame_coupling * (turnb - arcb)

    dth1 = p.structure_gain * np.sum(guide3 * et(th1_base), axis=1)
    dth2 = p.structure_gain * np.arctan2(
        np.sum(guide3 * ez(th1_base), axis=1),
        np.sum(guide3 * er(th1_base), axis=1),
    )

    raw = projector_trace(th1_base + dth1, th2_base + dth2, guide3, np.ones_like(s), p)
    raw_coeffs, raw_norm, raw_err = normalized_pen_coeffs(raw["pen_tips"], s, p.fourier_order)

    pts = witness_points(p.epsilon, p.residual_grid)
    records0 = residual_profile(pts, p, raw_norm)
    tau_gate, gate = residual_gate(records0, p.limiter_strength)
    gate_data = np.interp(s / (2.0 * np.pi), tau_gate, gate)

    limited = projector_trace(th1_base + gate_data * dth1, th2_base + gate_data * dth2, guide3, gate_data, p)
    coeffs, norm_coeffs, lim_err = normalized_pen_coeffs(limited["pen_tips"], s, p.fourier_order)
    records = residual_profile(pts, p, norm_coeffs)

    diagnostics = {
        "start_divergence": 0,
        "endpoint_divergence": 0,
        "domain": "T^3",
        "epsilon": p.epsilon,
        "ball_tube_containment_residual": float(np.max(np.abs(
            np.linalg.norm(limited["ball_centers"] - limited["centerlines"], axis=1)
            + p.ball_radius - p.minor_radius
        ))),
        "pen_trace_closure_residual": float(np.linalg.norm(
            fourier_eval(coeffs, np.array([0.0]))[0] - fourier_eval(coeffs, np.array([2.0 * np.pi]))[0]
        )),
        "raw_pen_fit_max_error": raw_err,
        "limited_pen_fit_max_error": lim_err,
        "initial_worst_residual": float(max(r["max_residual"] for r in records0)),
        "final_worst_residual": float(max(r["max_residual"] for r in records)),
        "worst_record": max(records, key=lambda r: r["max_residual"]),
    }

    return {
        "p": p,
        "s": s,
        "curve_a3": a3,
        "curve_b3": b3,
        "guide3": guide3,
        "raw": raw,
        "limited": limited,
        "coeffs": coeffs,
        "norm_coeffs": norm_coeffs,
        "records0": records0,
        "records": records,
        "gate_tau": tau_gate,
        "gate": gate,
        "gate_data": gate_data,
        "witnesses": pts,
        "diagnostics": diagnostics,
    }


def write_csv(path: Path, header: list[str], rows: list[list]) -> None:
    with path.open("w", encoding="utf-8", newline="") as f:
        w = csv.writer(f)
        w.writerow(header)
        w.writerows(rows)


def plot_sphere(model: dict, out: Path) -> None:
    fig = plt.figure(figsize=(8, 7))
    ax = fig.add_subplot(111, projection="3d")
    A, B = model["curve_a3"], model["curve_b3"]
    ax.plot(*A.T, label="start curve")
    ax.plot(*B.T, label="endpoint curve")
    step = max(1, len(A) // 36)
    for i in range(0, len(A), step):
        ax.plot([A[i, 0], B[i, 0]], [A[i, 1], B[i, 1]], [A[i, 2], B[i, 2]], lw=0.5)
    ax.set_title("Endpoint curves on opposite S^3 hemispheres, projected")
    ax.legend()
    fig.tight_layout()
    fig.savefig(out / "01_sphere_state_curves.png", dpi=160)
    plt.close(fig)


def plot_torus(model: dict, out: Path, which: str) -> None:
    p = model["p"]
    mech = model[which]
    theta = np.linspace(0, 2*np.pi, 70)
    phi = np.linspace(0, 2*np.pi, 28)
    T, P = np.meshgrid(theta, phi, indexing="ij")
    S = torus_surface(T, P, p.major_radius, p.minor_radius)
    fig = plt.figure(figsize=(9, 7))
    ax = fig.add_subplot(111, projection="3d")
    ax.plot_surface(S[..., 0], S[..., 1], S[..., 2], alpha=0.13, linewidth=0)
    ax.plot(*mech["ball_centers"].T, lw=1.0, label="ball center")
    ax.plot(*mech["pen_tips"].T, lw=2.2, label="projector pen")
    ax.set_title(f"Whirligig torus trace: {which}")
    ax.legend()
    fig.tight_layout()
    fig.savefig(out / f"02_whirlygig_torus_trace_{which}.png", dpi=160)
    plt.close(fig)


def plot_residual(model: dict, out: Path) -> None:
    fig, ax = plt.subplots(figsize=(8, 5))
    ax.plot([r["tau"] for r in model["records0"]], [r["max_residual"] for r in model["records0"]], label="before limiter")
    ax.plot([r["tau"] for r in model["records"]], [r["max_residual"] for r in model["records"]], label="after limiter")
    ax.set_xlabel("bridge parameter tau")
    ax.set_ylabel("sampled max vorticity residual")
    ax.set_title("Navier-Stokes residual")
    ax.legend()
    fig.tight_layout()
    fig.savefig(out / "03_residual_profile.png", dpi=160)
    plt.close(fig)

    fig, ax = plt.subplots(figsize=(8, 5))
    ax.plot(model["gate_tau"], model["gate"])
    ax.set_ylim(-0.05, 1.05)
    ax.set_xlabel("bridge parameter tau")
    ax.set_ylabel("admitted structure")
    ax.set_title("Navier-Stokes residual limiter")
    fig.tight_layout()
    fig.savefig(out / "04_limiter_profile.png", dpi=160)
    plt.close(fig)


def export(model: dict) -> None:
    out = Path(model["p"].out)
    out.mkdir(parents=True, exist_ok=True)
    plot_sphere(model, out)
    plot_torus(model, out, "raw")
    plot_torus(model, out, "limited")
    plot_residual(model, out)

    s = model["s"]
    write_csv(out / "sphere_curves.csv", ["s", "A_x", "A_y", "A_z", "B_x", "B_y", "B_z"], [
        [float(s[i]), *model["curve_a3"][i].tolist(), *model["curve_b3"][i].tolist()] for i in range(len(s))
    ])
    write_csv(out / "curvy_lisa_trace.csv", ["s", "gate", "ball_x", "ball_y", "ball_z", "pen_x", "pen_y", "pen_z"], [
        [float(s[i]), float(model["gate_data"][i]), *model["limited"]["ball_centers"][i].tolist(), *model["limited"]["pen_tips"][i].tolist()] for i in range(len(s))
    ])
    write_csv(out / "residual_scan.csv", ["tau", "rms", "max", "worst_x", "worst_y", "worst_z"], [
        [r["tau"], r["rms_residual"], r["max_residual"], *r["worst_point"]] for r in model["records"]
    ])

    report = {
        "parameters": asdict(model["p"]),
        "diagnostics": model["diagnostics"],
        "curvy_lisa_fourier_coefficients": model["coeffs"].tolist(),
        "normalized_correction_coefficients": model["norm_coeffs"].tolist(),
        "initial_residual_records": model["records0"],
        "residual_records": model["records"],
    }
    (out / "run_report.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
    (out / "target_equations.txt").write_text(TARGET_EQUATIONS, encoding="utf-8")


TARGET_EQUATIONS = """
CURRENT TARGET EQUATIONS

1. Governing equation, unforced incompressible Navier-Stokes on T^3:

    partial_t u + (u dot grad)u = -grad p + nu Delta u
    div u = 0

2. Starting snapshot:

    u_A(x,y,z) = (sin z, 0, 0)

3. Near-singular endpoint snapshot:

    u_B^epsilon(x,y,z) = (-sin y, sin x, 0)/(epsilon^2 + 2 - cos x - cos y)

4. Candidate bridge:

    w(tau) = 3 tau^2 - 2 tau^3
    E(tau) = sin^2(pi tau)

    u_W = (1-w)u_A + w u_B^epsilon + g E(tau) sum_j c_j(tau)m_j(x,y,z)

5. Vorticity residual:

    omega = curl u_W

    R_NS = (1/T) partial_tau omega + (u_W dot grad)omega - (omega dot grad)u_W - nu Delta omega

Target: R_NS = 0.
"""


def parse_args() -> Params:
    ap = argparse.ArgumentParser(description="Whirligig / Navier-Stokes Python workbench")
    ap.add_argument("--epsilon", type=float, default=0.15)
    ap.add_argument("--nu", type=float, default=1.0)
    ap.add_argument("--final-time", type=float, default=1.0)
    ap.add_argument("--winding-p", type=int, default=2)
    ap.add_argument("--winding-q", type=int, default=3)
    ap.add_argument("--samples", type=int, default=360)
    ap.add_argument("--fourier-order", type=int, default=10)
    ap.add_argument("--frame-coupling", type=float, default=0.35)
    ap.add_argument("--structure-gain", type=float, default=0.32)
    ap.add_argument("--projector-mix", type=float, default=0.55)
    ap.add_argument("--correction-gain", type=float, default=0.08)
    ap.add_argument("--limiter-strength", type=float, default=1.5)
    ap.add_argument("--residual-grid", type=int, default=5)
    ap.add_argument("--residual-times", type=int, default=17)
    ap.add_argument("--major-radius", type=float, default=3.0)
    ap.add_argument("--minor-radius", type=float, default=1.0)
    ap.add_argument("--ball-radius", type=float, default=0.22)
    ap.add_argument("--spatial-step", type=float, default=3.0e-3)
    ap.add_argument("--tau-step", type=float, default=4.0e-4)
    ap.add_argument("--out", type=str, default="py-whirlygig-output")
    a = ap.parse_args()
    return Params(**vars(a).copy() | {
        "final_time": a.final_time,
        "winding_p": a.winding_p,
        "winding_q": a.winding_q,
        "fourier_order": a.fourier_order,
        "frame_coupling": a.frame_coupling,
        "structure_gain": a.structure_gain,
        "projector_mix": a.projector_mix,
        "correction_gain": a.correction_gain,
        "limiter_strength": a.limiter_strength,
        "residual_grid": a.residual_grid,
        "residual_times": a.residual_times,
        "major_radius": a.major_radius,
        "minor_radius": a.minor_radius,
        "ball_radius": a.ball_radius,
        "spatial_step": a.spatial_step,
        "tau_step": a.tau_step,
    })


def main() -> None:
    p = parse_args()
    print("\nWHIRLYGIG / NAVIER-STOKES PYTHON WORKBENCH v0.3.1")
    print(f"epsilon:       {p.epsilon}")
    print(f"nu:            {p.nu}")
    print(f"winding:       {p.winding_p}:{p.winding_q}")
    print(f"samples:       {p.samples}")
    print(f"residual grid: {p.residual_grid}")
    print(f"residual times:{p.residual_times}")
    print(f"output:        {Path(p.out).resolve()}\n")
    model = build(p)
    export(model)
    d = model["diagnostics"]
    print("Endpoint checks:")
    print(f"  start divergence:      {d['start_divergence']}")
    print(f"  endpoint divergence:   {d['endpoint_divergence']}")
    print(f"  domain:                {d['domain']}\n")
    print("Mechanical checks:")
    print(f"  ball containment residual: {d['ball_tube_containment_residual']:.6e}")
    print(f"  pen closure residual:      {d['pen_trace_closure_residual']:.6e}")
    print(f"  raw fit error:             {d['raw_pen_fit_max_error']:.6e}")
    print(f"  limited fit error:         {d['limited_pen_fit_max_error']:.6e}\n")
    print("Residuals:")
    print(f"  initial worst residual: {d['initial_worst_residual']:.6e}")
    print(f"  final worst residual:   {d['final_worst_residual']:.6e}")
    print("  worst record:")
    print(json.dumps(d["worst_record"], indent=4))
    print(f"\nRun complete. Open: {Path(p.out).resolve()}")


if __name__ == "__main__":
    main()