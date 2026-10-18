#!/usr/bin/env python3
"""Sandboxed GrAnn material-cam rolling reconstruction.

This is a nominated-contact SO(3) mechanism, not the historical self-crossing
Great Annulum or a globally no-slip b=a torus-sphere contact.
"""
from __future__ import annotations

import argparse
import json
import numpy as np
from scipy.integrate import cumulative_trapezoid
from scipy.interpolate import PchipInterpolator


def latitude_cam(theta, amplitude):
    """Unit-sphere material path with closed nonzero geodesic curvature."""
    theta = np.asarray(theta, dtype=float)
    beta = amplitude * np.sin(2 * theta)
    db = 2 * amplitude * np.cos(2 * theta)
    ddb = -4 * amplitude * np.sin(2 * theta)
    er = np.stack((np.cos(theta), np.sin(theta), np.zeros_like(theta)), axis=-1)
    et = np.stack((-np.sin(theta), np.cos(theta), np.zeros_like(theta)), axis=-1)
    ez = np.array([0., 0., 1.])
    g = np.cos(beta)[..., None] * er + np.sin(beta)[..., None] * ez
    gp = (-db * np.sin(beta))[..., None] * er + np.cos(beta)[..., None] * et + (db * np.cos(beta))[..., None] * ez
    gpp = (-(ddb * np.sin(beta) + db**2 * np.cos(beta) + np.cos(beta)))[..., None] * er - (2 * db * np.sin(beta))[..., None] * et + (ddb * np.cos(beta) - db**2 * np.sin(beta))[..., None] * ez
    speed = np.linalg.norm(gp, axis=-1)
    tangent = gp / speed[..., None]
    h = np.cross(g, tangent)
    kg = np.sum(g * np.cross(gp, gpp), axis=-1) / speed**3
    return g, tangent, h, speed, kg


def solve_cam(amplitude=0.22, radius=0.55, even_cycles=4, steps=2400,
              major=None, grid=25001):
    if radius <= 0 or even_cycles < 2 or even_cycles % 2:
        raise ValueError("Need positive radius and positive even GrAnn cycles")
    th = np.linspace(0, 2*np.pi, grid)
    speed = latitude_cam(th, amplitude)[3]
    arc = cumulative_trapezoid(speed, th, initial=0)
    length = float(arc[-1])
    if major is None:
        major = radius * (even_cycles*length/(2*np.pi) - 1)
    if major <= radius:
        raise ValueError("Selected major radius does not give a ring torus")
    gear = (major+radius)/radius
    psi = np.linspace(0, 2*np.pi, steps+1)
    s = gear*psi
    lap = np.floor(s/length + 1e-12)
    remainder = np.clip(s-lap*length, 0, length)
    theta = PchipInterpolator(arc, th)(remainder) + 2*np.pi*lap
    g,t,h,_,kg = latitude_cam(theta, amplitude)
    B = np.stack((g,t,h), axis=-1)
    er = np.stack((np.cos(psi), np.sin(psi), np.zeros_like(psi)), axis=-1)
    et = np.stack((-np.sin(psi), np.cos(psi), np.zeros_like(psi)), axis=-1)
    ez = np.zeros_like(er)
    ez[:, 2] = 1
    W = np.stack((er,et,ez), axis=-1)
    orientation = W @ np.swapaxes(B, 1, 2)
    center = major*er
    contact = center + radius*np.einsum("nij,nj->ni", orientation, g)
    target = (major+radius)*er
    omega = (1-gear)*ez - (gear*kg)[:, None]*er
    analytic_slip = major*et + np.cross(omega, radius*er)
    # Separate finite-difference check of the actual SO(3) path:
    dQ = np.gradient(orientation, psi, axis=0, edge_order=2)
    dC = np.gradient(center, psi, axis=0, edge_order=2)
    spin_matrix = dQ @ np.swapaxes(orientation, 1, 2)
    omega_fd = np.stack((spin_matrix[:,2,1], spin_matrix[:,0,2],
                         spin_matrix[:,1,0]), axis=-1)
    slip_fd = dC + np.cross(omega_fd, radius*er)
    actual_laps = gear*2*np.pi/length
    summary = {
        "cam_amplitude": float(amplitude),
        "cam_length": length,
        "sphere_and_tube_radius": float(radius),
        "torus_major": float(major),
        "reduced_radius_gear": float(gear),
        "actual_cam_cycles": float(actual_laps),
        "historical_even_winding_satisfied": bool(abs(actual_laps-even_cycles)<1e-8),
        "normal_spin_min": float((-gear*kg).min()),
        "normal_spin_max": float((-gear*kg).max()),
        "wall_position_max_residual": float(np.max(np.linalg.norm(contact-target,axis=-1))),
        "torus_implicit_max_residual": float(np.max(np.abs((np.hypot(contact[:,0],contact[:,1])-major)**2+contact[:,2]**2-radius**2))),
        "orientation_orthogonality_max_residual": float(np.max(np.abs(np.swapaxes(orientation,1,2)@orientation-np.eye(3)))),
        "orientation_seam_frobenius": float(np.linalg.norm(orientation[0]-orientation[-1])),
        "analytical_contact_slip_max": float(np.max(np.linalg.norm(analytic_slip,axis=-1))),
        "finite_difference_slip_max_interior": float(np.max(np.linalg.norm(slip_fd[10:-10],axis=-1))),
    }
    return summary, orientation


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--amplitude", type=float, default=0.22)
    p.add_argument("--radius", type=float, default=.55)
    p.add_argument("--cycles", type=int, default=4)
    p.add_argument("--major", type=float)
    p.add_argument("--steps", type=int, default=2400)
    p.add_argument("--check", action="store_true")
    args = p.parse_args()
    report, _ = solve_cam(args.amplitude, args.radius, args.cycles, args.steps, args.major)
    print(json.dumps(report, indent=2))
    if args.check:
        if report["wall_position_max_residual"] > 1e-10 or report["analytical_contact_slip_max"] > 1e-10:
            raise SystemExit("FAIL: selected-contact constraint")
        if args.major is None and (not report["historical_even_winding_satisfied"] or report["orientation_seam_frobenius"] > 1e-8):
            raise SystemExit("FAIL: intended closed cam return")


if __name__ == "__main__":
    main()
