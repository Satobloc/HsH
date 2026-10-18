#!/usr/bin/env python3
"""Sandboxed GrAnn minimum-return SO(3) lock.

A functional 3-axis rotational locking candidate, NOT the historical
self-intersecting GrAnn, NOT the full R/Q elbow mechanism, and NOT a globally
no-slip sphere/tube contact for the b=a limiting case.
"""
from __future__ import annotations

import argparse
from fractions import Fraction
from math import gcd, lcm, pi, sqrt
import json
import numpy as np
from scipy.spatial.transform import Rotation


def exact_ratio(value):
    return value if isinstance(value, Fraction) else Fraction(str(value))


def common_return(rates):
    """Minimal positive INTEGRAL number of base torus circuits for all phases.

    A physical joint configuration requires additional SO(3), contact, branch,
    input-tangent and elbow closure checks. An arithmetic LCM is not enough.
    """
    phases = {k: exact_ratio(v) for k, v in rates.items()}
    if not phases:
        raise ValueError("At least one phase rate is required")
    duration = lcm(*(f.denominator for f in phases.values()))
    counts = {k: int(v * duration) for k, v in phases.items()}
    nonzero = [abs(n) for n in counts.values() if n]
    return {
        "base_torus_circuits": duration,
        "turns_at_return": counts,
        "lcm_of_completed_winding_counts": lcm(*nonzero) if nonzero else 0,
    }


def minimum_grann_turns(major, radius, source_periods=(1, 1),
                        require_even=True):
    """Smallest admissible integer material turns > geometric rolling ratio.

    The strict inequality ensures nonzero x/y spin, while evenness and the
    caller's source orders are optional/divisibility constraints. These orders
    must come from validated source-curve phase/symmetry closure, not labels.
    """
    M, b = exact_ratio(major), exact_ratio(radius)
    if M <= b or b <= 0:
        raise ValueError("Need torus major radius > ball/tube radius > 0")
    orders = [int(x) for x in source_periods]
    if any(x <= 0 for x in orders):
        raise ValueError("Source periods must be positive integers")
    multiple = lcm(*(orders + ([2] if require_even else [1])))
    gear = (M + b) / b
    turns = multiple * (gear.numerator // (gear.denominator * multiple) + 1)
    return turns, float(gear)


def simulate(major=1.65, radius=.55, source_periods=(1, 1),
             require_even=True, samples=2401):
    n, gear = minimum_grann_turns(major, radius, source_periods, require_even)
    R, b = float(major), float(radius)
    sigma = sqrt(n*n - gear*gear)
    psi = np.linspace(0., 2*pi, samples)
    er = np.column_stack((np.cos(psi), np.sin(psi), np.zeros_like(psi)))
    et = np.column_stack((-np.sin(psi), np.cos(psi), np.zeros_like(psi)))
    Q = (Rotation.from_rotvec(np.column_stack((np.zeros_like(psi),
                                              np.zeros_like(psi), psi)))
         * Rotation.from_rotvec(np.outer(psi,
                                        np.array([sigma, 0., -gear])))).as_matrix()
    C = R * er
    contact_body = np.einsum("nji,nj->ni", Q, er)
    wall_pivot = C + b*np.einsum("nij,nj->ni", Q, contact_body)
    wall_target = (R+b)*er
    omega = np.column_stack((sigma*er[:,0], sigma*er[:,1],
                             np.full(len(psi), -R/b)))
    slip = R*et + np.cross(omega, b*er)
    spin_angle = n * psi
    theta_turns = spin_angle[-1]/(2*pi)
    dQ = np.gradient(Q, psi, axis=0, edge_order=2)
    Omega = dQ @ np.swapaxes(Q, 1, 2)
    omega_fd = np.column_stack((Omega[:,2,1],Omega[:,0,2],
                                Omega[:,1,0]))
    fd_slip = R*et + np.cross(omega_fd, b*er)
    track_distance = float(np.sum(np.linalg.norm(np.diff(contact_body, axis=0), axis=1)))
    result = {
        "major_radius": R,
        "ball_and_tube_radius": b,
        "geometric_contact_ratio": gear,
        "minimal_grann_turns": n,
        "source_phase_orders": list(source_periods),
        "even_winding": (n % 2 == 0),
        "radial_spin_rate": sigma,
        "angular_velocity_component_ranges": {
            axis: [float(omega[:,i].min()),float(omega[:,i].max())]
            for i,axis in enumerate(("x","y","z"))
        },
        "material_turn_count": float(theta_turns),
        "material_track_length_total": track_distance,
        "predicted_material_track_length_total": 2*pi*gear,
        "one_contact_track_cycle_length": 2*pi*gear/n,
        "max_pivot_wall_error": float(np.linalg.norm(wall_pivot-wall_target,axis=1).max()),
        "max_analytic_point_slip": float(np.linalg.norm(slip,axis=1).max()),
        "max_fd_point_slip_interior": float(np.linalg.norm(fd_slip[5:-5],axis=1).max()),
        "SO3_seam_error": float(np.linalg.norm(Q[0]-Q[-1])),
        "SO3_orthogonality_error": float(np.abs(np.swapaxes(Q,1,2)@Q-np.eye(3)).max()),
    }
    return result


def check(report):
    assert report["max_pivot_wall_error"] < 1e-10, "Wall pivot mismatch"
    assert report["max_analytic_point_slip"] < 1e-10, "Selected-point rolling fails"
    assert report["SO3_seam_error"] < 1e-10, "Orientation failed to close"
    assert report["SO3_orthogonality_error"] < 1e-10, "Frame ceased to be SO(3)"
    assert report["radial_spin_rate"] > 0, "All-axis motion missing"
    for component in ("x","y","z"):
        a,b=report["angular_velocity_component_ranges"][component]
        assert b-a > 1e-6 or (component=="z" and abs(a)>1e-6)
    assert report["material_turn_count"] == report["minimal_grann_turns"]


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--major",type=float,default=1.65)
    p.add_argument("--radius",type=float,default=.55)
    p.add_argument("--r-order",type=int,default=1)
    p.add_argument("--q-order",type=int,default=1)
    p.add_argument("--samples",type=int,default=2401)
    p.add_argument("--check",action="store_true")
    args=p.parse_args()
    out=simulate(args.major,args.radius,(args.r_order,args.q_order),
                 samples=args.samples)
    if args.check:
        check(out)
    print(json.dumps(out,indent=2))


if __name__=="__main__":
    main()
