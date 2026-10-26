#!/usr/bin/env python3
"""SAT Universal Indicatrix: source-grounded dimensionless geometry kernel.

NO empirical observations, semiconductor band data, fitted constants, or model-tuned
numeric parameter values are included. This implements the reference-frame
map and separates the *coefficients* of the legacy SAT quadratic action.

References: SAT GEOMETRIC SOLVERS.txt; SAT CORE — UI CONFIG.txt;
SAT UNODROP.txt; ONE FILE SAT 2.pdf (extracted text).
"""
from __future__ import annotations
import argparse
import csv
import json
from dataclasses import dataclass
from pathlib import Path
import numpy as np
import sympy as sp

PLANES = ((0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3))
S = sp.symbols('s', real=True)


def plane_rotation(i: int, j: int, angle: float) -> np.ndarray:
    """Oriented proper rotation of coordinates i,j; sign is a convention."""
    R = np.eye(4)
    co, si = np.cos(angle), np.sin(angle)
    R[i, i], R[j, j] = co, co
    R[i, j], R[j, i] = -si, si
    return R


def full_rotation(angles: np.ndarray) -> np.ndarray:
    """R(s) = G_23 G_13 G_12 G_03 G_02 G_01 (specified order)."""
    a = np.asarray(angles, dtype=float)
    if a.shape != (6,):
        raise ValueError('Six rotation-plane angles are required')
    R = np.eye(4)
    for (i, j), theta in zip(PLANES, a):
        R = plane_rotation(i, j, theta) @ R
    return R


def normalize(v: np.ndarray) -> np.ndarray:
    x = np.asarray(v, dtype=float)
    n = np.linalg.norm(x)
    if not np.isfinite(n) or n == 0:
        raise ValueError('Reference direction must be nonzero and finite')
    return x / n


def generate(s: np.ndarray, scales: np.ndarray, angle_history: np.ndarray,
             seed: np.ndarray = np.array([1., 0., 0., 0.])) -> tuple[np.ndarray, np.ndarray]:
    """Controls -> 4D curve X(s) = q(s) R(s) x0, no physical scale."""
    s, q, a = np.asarray(s), np.asarray(scales), np.asarray(angle_history)
    if s.ndim != 1 or s.size < 7 or not np.all(np.diff(s) > 0):
        raise ValueError('s must be a strictly increasing array of >=7 values')
    if q.shape != s.shape or a.shape != (len(s), 6):
        raise ValueError('Incompatible control shapes')
    if np.any(q <= 0) or not np.all(np.isfinite(q)) or not np.all(np.isfinite(a)):
        raise ValueError('Only positive finite scales / finite angles supported')
    R = np.stack([full_rotation(row) for row in a])
    X = q[:, None] * np.einsum('nij,j->ni', R, normalize(seed))
    return X, R


def inverse_direction(X: np.ndarray) -> tuple[np.ndarray, np.ndarray]:
    """Curve -> q(s),u(s); R(s) remains ambiguous up to SO(3) stabilizer."""
    X = np.asarray(X, dtype=float)
    if X.ndim != 2 or X.shape[1] != 4:
        raise ValueError('Input curve must have four coordinates')
    q = np.linalg.norm(X, axis=1)
    if np.any(q <= 0) or not np.all(np.isfinite(q)):
        raise ValueError('Cannot invert through origin or non-finite positions')
    return q, X / q[:, None]


def minimal_rotation_from_e0(u: np.ndarray) -> np.ndarray:
    """One proper rotation sending e0 to u; 3-parameter frame stabilizer remains."""
    b = normalize(u)
    e0 = np.array([1., 0., 0., 0.])
    c = np.clip(e0 @ b, -1., 1.)
    if c > 1. - 1e-12:
        return np.eye(4)
    if c < -1. + 1e-12:
        return np.diag([-1., -1., 1., 1.])
    t = (b - c * e0) / np.sqrt(1 - c*c)
    a = np.sqrt(1 - c*c)
    return (np.eye(4) + (c - 1) * (np.outer(e0,e0) + np.outer(t,t))
            + a * (np.outer(t,e0) - np.outer(e0,t)))


def trap(y: np.ndarray, s: np.ndarray) -> float:
    return float(np.trapezoid(y, s))


def diagnostics(X: np.ndarray, s: np.ndarray,
                director: np.ndarray = np.array([0.,0.,0.,1.])) -> dict:
    """Geometry-only scalars. No weighted action without independently known coefficients."""
    q, u = inverse_direction(X)
    if len(s) != len(q):
        raise ValueError('Sample count differs')
    v = np.gradient(X, s, axis=0, edge_order=2)
    acceleration = np.gradient(v, s, axis=0, edge_order=2)
    qdot = np.gradient(q, s, edge_order=2)
    udot = np.gradient(u, s, axis=0, edge_order=2)
    speed_sq = np.sum(v*v, axis=1)
    radial_angular = qdot*qdot + q*q*np.sum(udot*udot, axis=1)
    unit_resid = np.abs(np.sum(u*u, axis=1) - 1)
    velocity_identity_resid = np.abs(speed_sq-radial_angular)
    n = normalize(director)
    return {
        'type': 'dimensionless-geometric-diagnostics',
        'n_samples': len(s),
        's_range': [float(s[0]), float(s[-1])],
        'integrals': {
            'I_stretch': 0.5*trap(speed_sq, s),
            'I_bend': 0.5*trap(np.sum(acceleration**2, axis=1), s),
            'I_director': trap((v @ n)**2, s),
        },
        'numerical_checks': {
            'max_unit_direction_error': float(np.max(unit_resid)),
            'max_velocity_split_error_interior': float(np.max(velocity_identity_resid[2:-2])),
        },
        'sampled': {
            's': s.tolist(), 'X': X.tolist(),
            'q': q.tolist(), 'u': u.tolist(),
            'speed_sq': speed_sq.tolist(),
            'curvature_density': np.sum(acceleration**2,axis=1).tolist(),
            'director_density': (v@n).tolist(),
        },
        'unresolved_coefficients': ['T','kappa','alpha','V_interaction'],
        'sector_prediction_status': 'NOT DERIVED: no independent electronic band-energy functional',
    }


def variational_operator() -> str:
    """Constant director, unspecified coefficients and interactions.

    For F[X]=int[T|X'|^2/2+kappa|X''|^2/2+alpha(X'.n)^2+V_int(X)]ds:
    κX''''−TX''−2α n(n·X'')+grad(V_int)=0 when n is constant.
    Not promoted to a dynamical L=K−V claim. When n depends on X,
    the full chain rule creates additional terms not shown.
    """
    return "kappa X'''' - T X'' - 2 alpha n (n dot X'') + grad_X V_int = 0 [n fixed]"


def symbolic_identity() -> dict:
    q = sp.Function('q')(S)
    # Treat u as abstract unit vector: u.u=1 implies u.udot=0.
    # For one exact SO(4) plane, x0=e0, X=(q cos theta, q sin theta,0,0).
    t = sp.Function('theta')(S)
    X = sp.Matrix([q*sp.cos(t), q*sp.sin(t), 0, 0])
    speed_sq = sp.simplify(X.diff(S).dot(X.diff(S)))
    decomposition = sp.diff(q,S)**2 + q*q*sp.diff(t,S)**2
    assert sp.simplify(speed_sq-decomposition)==0
    return {'dimensionless_identity':'|X_prime|^2=q_prime^2+q^2|u_prime|^2',
            'one_plane_exact_residual':str(sp.simplify(speed_sq-decomposition)),
            'constant_director_EL':variational_operator(),
            'gauge':'R has an unobservable SO(3) stabilizer for a point trajectory',
            'independent_SiC_observables':'NONE'}


def main():
    parser = argparse.ArgumentParser(description='Blind 4D UI mathematical kernel')
    parser.add_argument('--verify', action='store_true', help='run exact symbolic check, no physics inputs')
    parser.add_argument('--controls-json', type=Path, help='optional user-supplied controls JSON with s, q, angles, x0')
    parser.add_argument('--output', type=Path, help='write diagnostics JSON')
    args = parser.parse_args()
    if args.controls_json:
        a=json.loads(args.controls_json.read_text(encoding='utf-8'))
        s=np.array(a['s'],float)
        X,R=generate(s,np.array(a['q'],float),np.array(a['angles'],float),np.array(a.get('x0',[1,0,0,0])))
        out=diagnostics(X,s)
        out['numerical_checks']['max_so4_orthogonality_error']=float(np.max(np.abs(R@np.swapaxes(R,1,2)-np.eye(4))))
        out['numerical_checks']['max_so4_determinant_error']=float(np.max(np.abs(np.linalg.det(R)-1)))
    else:
        out=symbolic_identity()
    if args.output:
        args.output.write_text(json.dumps(out,indent=2)+'\n',encoding='utf-8')
        print(args.output)
    else:
        print(json.dumps(out,indent=2))

if __name__=='__main__':
    main()