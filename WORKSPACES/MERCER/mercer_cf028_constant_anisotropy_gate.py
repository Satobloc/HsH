#!/usr/bin/env python3
"""Generalized Lane-Emden gate for f(E,L) ~ (Ecut-E)^k L^(2l).

Sandbox mathematics only.  This checks the dimensionless equilibrium ODE

    theta'' + 2 theta'/x + x^(2l) theta^n = 0,
    n = k + l + 3/2,

and reports its first zero, dimensionless mass, central-density behavior,
and the constant-anisotropy virial ratio 2 T_r / T_t = 1/(1+l).
"""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass
from pathlib import Path

import numpy as np
from scipy.integrate import solve_ivp


@dataclass
class Result:
    k: float
    ell: float
    n: float
    beta: float
    two_Tr_over_Tt: float
    xi1: float
    dimensionless_mass: float
    central_density_class: str
    ode_integral_residual: float


def solve_case(k: float, ell: float) -> Result:
    n = k + ell + 1.5
    x0 = 1.0e-6
    power = 2.0 * ell + 2.0
    coeff = 1.0 / ((2.0 * ell + 2.0) * (2.0 * ell + 3.0))
    theta0 = 1.0 - coeff * x0**power
    dtheta0 = -x0 ** (2.0 * ell + 1.0) / (2.0 * ell + 3.0)

    def rhs(x: float, y: np.ndarray) -> tuple[float, float, float]:
        theta, dtheta, mass_int = y
        source = x ** (2.0 * ell) * max(theta, 0.0) ** n
        return dtheta, -2.0 * dtheta / x - source, x * x * source

    def first_zero(_x: float, y: np.ndarray) -> float:
        return float(y[0])

    first_zero.terminal = True
    first_zero.direction = -1

    sol = solve_ivp(
        rhs,
        (x0, 100.0),
        (theta0, dtheta0, 0.0),
        events=first_zero,
        rtol=2e-11,
        atol=2e-13,
        max_step=0.002,
    )
    if not sol.t_events[0].size:
        raise RuntimeError(f"No first zero for k={k}, ell={ell}")

    xi1 = float(sol.t_events[0][0])
    theta1, dtheta1, mass_int = sol.y_events[0][0]
    boundary_mass = -xi1 * xi1 * dtheta1
    residual = abs(boundary_mass - mass_int)
    return Result(
        k=k,
        ell=ell,
        n=n,
        beta=-ell,
        two_Tr_over_Tt=1.0 / (1.0 + ell),
        xi1=xi1,
        dimensionless_mass=boundary_mass,
        central_density_class="finite_nonzero" if ell == 0 else "hollow_r^(2ell)",
        ode_integral_residual=residual,
    )


def main() -> None:
    cases = [(k, ell) for k in (0.0, 1.0) for ell in (0.0, 0.5, 1.0, 2.0)]
    results = [solve_case(k, ell) for k, ell in cases]

    refs = {
        0.0: (3.65375373622, 2.71405511797),
        1.0: (5.35527545901, 2.18719956552),
    }
    for r in results:
        if r.ell == 0:
            xi_ref, m_ref = refs[r.k]
            assert abs(r.xi1 - xi_ref) < 2e-8
            assert abs(r.dimensionless_mass - m_ref) < 2e-8
        assert r.ode_integral_residual < 2e-8

    payload = {
        "model": "f(E,L)=C(Ecut-E)^k L^(2ell), ell>=0",
        "status": "sandboxed mathematical gate; no SAT/H(s)H physical claim",
        "results": [asdict(r) for r in results],
    }
    Path("mercer_cf028_constant_anisotropy_results.json").write_text(
        json.dumps(payload, indent=2) + "\n", encoding="utf-8"
    )
    print(json.dumps(payload, indent=2))


if __name__ == "__main__":
    main()
