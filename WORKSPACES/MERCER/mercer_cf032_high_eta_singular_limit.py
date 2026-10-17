#!/usr/bin/env python3
"""CF032: singular high-anisotropy limit of Mercer's regularized equilibria.

For f(E,L)=C E^k (L0^2+L^2), CF029--CF031 give the normalized field equation

  theta'' + 2 theta'/xi + theta^n [1 + a*eta*xi^2*theta] = 0,
  n=k+3/2, a=2/(k+5/2).

With z=(a*eta)^(1/4) xi and eps=(a*eta)^(-1/2), this becomes

  Theta_zz + 2 Theta_z/z + z^2 Theta^(n+1) + eps Theta^n = 0.

Thus eta->infinity is the pure L^2 (ell=1) generalized Lane-Emden gate.
The script solves the nonlinear family and the first sensitivity correction.

Status: GEN/DERIVED sandbox mathematics; not a SAT/H(s)H physical claim.
"""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass

import numpy as np
from scipy.integrate import solve_ivp


ETAS = (
    0.0, 1.0, 3.0, 10.0, 30.0, 100.0, 300.0, 1_000.0, 3_000.0,
    10_000.0, 30_000.0, 100_000.0, 300_000.0, 1_000_000.0,
)
PURE_REFERENCES = {
    0.0: (2.881732424034295, 3.461991460925981),
    1.0: (3.3994113439794034, 2.8398199658887466),
}
ISOTROPIC_REFERENCES = {
    0.0: (3.65375373622, 2.71405511797),
    1.0: (5.35527545901, 2.18719956552),
}


@dataclass
class FiniteResult:
    k: float
    eta: float
    epsilon: float | None
    xi_radius: float
    mass: float
    z_radius: float | None
    scaled_mass: float | None
    tangential_fraction: float
    radius_error_from_limit: float | None
    mass_error_from_limit: float | None


@dataclass
class LimitResult:
    k: float
    z0: float
    mass0: float
    z1: float
    mass1: float
    reference_radius_error: float
    reference_mass_error: float


def solve_finite(k: float, eta: float, *, tight: bool = False) -> FiniteResult:
    n = k + 1.5
    a = 2.0 / (k + 2.5)
    x0 = 1.0e-7 if eta == 0 else min(1.0e-7, 1.0e-7 / (a * eta) ** 0.25)

    # Regular central expansions through the leading isotropic and L^2 sources.
    theta0 = 1.0 - x0**2 / 6.0 - a * eta * x0**4 / 20.0
    mass0 = x0**3 / 3.0 + a * eta * x0**5 / 5.0

    def rhs(x: float, y: np.ndarray) -> tuple[float, float, float, float]:
        theta, mass, kr, kt = y
        t = max(theta, 0.0)
        density = t**n * (1.0 + a * eta * x * x * t)
        anisotropy_x = 2.0 * eta * x * x * t / (k + 3.5)
        pr = t ** (n + 1.0) * (1.0 + anisotropy_x) / (k + 2.5)
        pt = 2.0 * t ** (n + 1.0) * (1.0 + 2.0 * anisotropy_x) / (k + 2.5)
        return -mass / (x * x), x * x * density, x * x * pr, x * x * pt

    def zero(_x: float, y: np.ndarray) -> float:
        return float(y[0])

    zero.terminal = True
    zero.direction = -1
    kwargs = dict(rtol=3e-12, atol=3e-14, max_step=0.003)
    if tight:
        kwargs = dict(rtol=3e-13, atol=3e-15, max_step=0.001)
    sol = solve_ivp(rhs, (x0, 20.0), (theta0, mass0, 0.0, 0.0),
                    method="DOP853", events=zero, **kwargs)
    if not sol.t_events[0].size:
        raise RuntimeError(f"no boundary for k={k}, eta={eta}")
    radius = float(sol.t_events[0][0])
    _theta, mass, kr, kt = map(float, sol.y_events[0][0])
    q_t = kt / (kr + kt)

    if eta == 0.0:
        return FiniteResult(k, eta, None, radius, mass, None, None, q_t, None, None)

    scale = (a * eta) ** 0.25
    epsilon = 1.0 / scale**2
    z_radius = scale * radius
    scaled_mass = scale * mass
    z_ref, m_ref = PURE_REFERENCES[k]
    return FiniteResult(
        k, eta, epsilon, radius, mass, z_radius, scaled_mass, q_t,
        z_radius - z_ref, scaled_mass - m_ref,
    )


def solve_limit_and_sensitivity(k: float) -> LimitResult:
    n = k + 1.5
    p = n + 1.0
    z0 = 1.0e-7

    # State (u,M,v,N): v=dTheta/deps and N=dM/deps at eps=0.
    u0 = 1.0 - z0**4 / 20.0
    m0 = z0**5 / 5.0
    v0 = -z0**2 / 6.0
    n0 = z0**3 / 3.0

    def rhs(z: float, y: np.ndarray) -> tuple[float, float, float, float]:
        u, mass, v, sens_mass = y
        positive_u = max(u, 0.0)
        return (
            -mass / (z * z),
            z**4 * positive_u**p,
            -sens_mass / (z * z),
            z**4 * p * positive_u ** (p - 1.0) * v + z**2 * positive_u**n,
        )

    def zero(_z: float, y: np.ndarray) -> float:
        return float(y[0])

    zero.terminal = True
    zero.direction = -1
    sol = solve_ivp(rhs, (z0, 10.0), (u0, m0, v0, n0), method="DOP853",
                    events=zero, rtol=3e-13, atol=3e-15, max_step=0.001)
    if not sol.t_events[0].size:
        raise RuntimeError(f"no pure-limit boundary for k={k}")
    boundary = float(sol.t_events[0][0])
    _u, mass, v, sens_mass = map(float, sol.y_events[0][0])
    u_prime = -mass / boundary**2
    radius_correction = -v / u_prime
    ref_z, ref_m = PURE_REFERENCES[k]
    return LimitResult(
        k=k,
        z0=boundary,
        mass0=mass,
        z1=radius_correction,
        mass1=sens_mass,
        reference_radius_error=boundary - ref_z,
        reference_mass_error=mass - ref_m,
    )


def convergence_order(eps: np.ndarray, errors: np.ndarray) -> float:
    mask = errors > 1.0e-14
    return float(np.polyfit(np.log(eps[mask][-4:]), np.log(errors[mask][-4:]), 1)[0])


def main() -> None:
    limits = {k: solve_limit_and_sensitivity(k) for k in (0.0, 1.0)}
    finite = {k: [solve_finite(k, eta) for eta in ETAS] for k in (0.0, 1.0)}

    checks: dict[str, object] = {}
    for k in (0.0, 1.0):
        iso = finite[k][0]
        xi_ref, mass_ref = ISOTROPIC_REFERENCES[k]
        assert abs(iso.xi_radius - xi_ref) < 3e-10
        assert abs(iso.mass - mass_ref) < 3e-9
        assert abs(iso.tangential_fraction - 2.0 / 3.0) < 2e-13

        limit = limits[k]
        assert abs(limit.reference_radius_error) < 3e-10
        assert abs(limit.reference_mass_error) < 3e-10

        positive_eta = finite[k][1:]
        eps = np.array([r.epsilon for r in positive_eta])
        rerr = np.abs(np.array([r.radius_error_from_limit for r in positive_eta]))
        merr = np.abs(np.array([r.mass_error_from_limit for r in positive_eta]))

        last = positive_eta[-1]
        predicted_z = limit.z0 + last.epsilon * limit.z1
        predicted_m = limit.mass0 + last.epsilon * limit.mass1
        tight = solve_finite(k, ETAS[-1], tight=True)
        checks[str(k)] = {
            "eta_max": ETAS[-1],
            "radius_error_convergence_order": convergence_order(eps, rerr),
            "mass_error_convergence_order": convergence_order(eps, merr),
            "eta_max_first_order_radius_residual": last.z_radius - predicted_z,
            "eta_max_first_order_mass_residual": last.scaled_mass - predicted_m,
            "eta_max_radius_numerical_uncertainty": abs(last.z_radius - tight.z_radius),
            "eta_max_mass_numerical_uncertainty": abs(last.scaled_mass - tight.scaled_mass),
            "eta_max_tangential_fraction_uncertainty": abs(
                last.tangential_fraction - tight.tangential_fraction
            ),
        }

    payload = {
        "status": "GEN/DERIVED sandbox mathematics; no SAT/H(s)H physical claim",
        "source_equation": (
            "theta''+2 theta'/xi+theta^n[1+a eta xi^2 theta]=0, "
            "n=k+3/2, a=2/(k+5/2)"
        ),
        "singular_rescaling": (
            "z=(a eta)^(1/4) xi, eps=(a eta)^(-1/2); "
            "Theta_zz+2Theta_z/z+z^2Theta^(n+1)+eps Theta^n=0"
        ),
        "limit_and_first_sensitivity": [asdict(limits[k]) for k in (0.0, 1.0)],
        "finite_family": {
            str(k): [asdict(r) for r in finite[k]] for k in (0.0, 1.0)
        },
        "checks": checks,
        "interpretation_boundary": (
            "The eta->infinity regularized family converges after rescaling to the "
            "pure L^2 hollow-core mathematical branch. This does not establish "
            "dynamical stability, self-formation, or a worldtube correspondence."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
