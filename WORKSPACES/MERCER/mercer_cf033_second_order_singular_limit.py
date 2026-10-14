#!/usr/bin/env python3
"""CF033: second-order high-anisotropy asymptotics for Mercer's CF032 gate.

Scaled equation (n=k+3/2, p=n+1):
  u'' + 2u'/z + z^2 u^p + eps u^n = 0,
  eps=(a*eta)^(-1/2), a=2/(k+5/2).

This integrates u, u_eps, and u_eps_eps at eps=0, derives the moving-zero
correction, and checks O(eps^3) remainders against direct nonlinear solves.
GEN/DERIVED Newtonian Vlasov-Poisson sandbox; no SAT/H(s)H physical claim.
"""

from __future__ import annotations
from dataclasses import dataclass
import numpy as np
from scipy.integrate import solve_ivp


ETAS = np.array([1e2, 3e2, 1e3, 3e3, 1e4, 3e4, 1e5, 3e5, 1e6, 3e6])


@dataclass
class Expansion:
    radius0: float
    radius1: float
    radius2: float  # second derivative; Taylor coefficient is radius2/2
    mass0: float
    mass1: float
    mass2: float    # second derivative; Taylor coefficient is mass2/2


def zero_event(_z: float, y: np.ndarray) -> float:
    return float(y[0])


zero_event.terminal = True
zero_event.direction = -1


def solve_expansion(k: float, tight: bool = False) -> Expansion:
    n, p = k + 1.5, k + 2.5
    z = 1e-6
    # Central series: u=1-eps*z^2/6-z^4/20+n*eps^2*z^4/120+...
    u = 1 - z**4 / 20
    mass = z**5 / 5
    v, sens_mass = -z**2 / 6, z**3 / 3
    w, sens2_mass = n * z**4 / 60, -n * z**5 / 15

    def rhs(x: float, y: np.ndarray) -> tuple[float, ...]:
        u, mass, v, sm, w, s2m = y
        t = max(u, 0.0)
        return (
            -mass / x**2,
            x**4 * t**p,
            -sm / x**2,
            x**4 * p * t**(p - 1) * v + x**2 * t**n,
            -s2m / x**2,
            x**4 * (p * t**(p - 1) * w
                    + p * (p - 1) * t**(p - 2) * v**2)
            + 2 * x**2 * n * t**(n - 1) * v,
        )

    kwargs = dict(rtol=2e-12, atol=2e-14, max_step=.002)
    if tight:
        kwargs = dict(rtol=2e-13, atol=2e-15, max_step=.0007)
    sol = solve_ivp(rhs, (z, 8.), (u, mass, v, sens_mass, w, sens2_mass),
                    method="DOP853", events=zero_event, **kwargs)
    r = float(sol.t_events[0][0])
    u, mass, v, sm, w, s2m = map(float, sol.y_events[0][0])
    uz = -mass / r**2
    uzz = -2 * uz / r  # source vanishes at u=0
    vz = -sm / r**2
    r1 = -v / uz
    r2 = -(w + 2 * vz * r1 + uzz * r1**2) / uz
    # Boundary mass flux and its first derivatives vanish for n>1, so M''=s2m.
    return Expansion(r, r1, r2, mass, sm, s2m)


def solve_finite(k: float, eps: float, tight: bool = False) -> tuple[float, float]:
    n, p = k + 1.5, k + 2.5
    z = 1e-6
    u = 1 - eps*z**2/6 - z**4/20 + n*eps**2*z**4/120
    mass = z**5/5 + eps*z**3/3 - n*eps**2*z**5/30

    def rhs(x: float, y: np.ndarray) -> tuple[float, float]:
        u, mass = y
        t = max(u, 0.0)
        return -mass/x**2, x**4*t**p + eps*x**2*t**n

    kwargs = dict(rtol=2e-12, atol=2e-14, max_step=.002)
    if tight:
        kwargs = dict(rtol=2e-13, atol=2e-15, max_step=.0007)
    sol = solve_ivp(rhs, (z, 8.), (u, mass), method="DOP853",
                    events=zero_event, **kwargs)
    return float(sol.t_events[0][0]), float(sol.y_events[0][0][1])


def fit_order(eps: np.ndarray, residual: np.ndarray, lo: int, hi: int) -> float:
    return float(np.polyfit(np.log(eps[lo:hi]), np.log(np.abs(residual[lo:hi])), 1)[0])


def main() -> None:
    print("Mercer CF033 second-order singular-limit gate")
    for k in (0., 1.):
        a = 2 / (k + 2.5)
        eps = (a * ETAS) ** -.5
        ex = solve_expansion(k)
        ex_tight = solve_expansion(k, tight=True)
        direct = np.array([solve_finite(k, e) for e in eps])
        r, m = direct[:, 0], direct[:, 1]

        r_first = ex.radius0 + eps*ex.radius1
        r_second = r_first + .5*eps**2*ex.radius2
        m_first = ex.mass0 + eps*ex.mass1
        m_second = m_first + .5*eps**2*ex.mass2

        # ETAS ascend, so eps descend. Use mid/high-eta points before roundoff floor.
        r_order1 = fit_order(eps, r-r_first, 2, 8)
        m_order1 = fit_order(eps, m-m_first, 2, 8)
        r_order2 = fit_order(eps, r-r_second, 2, 8)
        m_order2 = fit_order(eps, m-m_second, 2, 8)
        tight_delta = max(abs(ex.radius2-ex_tight.radius2),
                          abs(ex.mass2-ex_tight.mass2))

        print(f"k={k:.0f}: r0={ex.radius0:.12f} r1={ex.radius1:.9f} "
              f"r2/2={.5*ex.radius2:.9f}")
        print(f"     M0={ex.mass0:.12f} M1={ex.mass1:.9f} "
              f"M2/2={.5*ex.mass2:.9f}")
        print(f"     first-only orders radius={r_order1:.5f}, mass={m_order1:.5f}")
        print(f"     second-order orders radius={r_order2:.5f}, mass={m_order2:.5f}")
        print(f"     eta=3e6 residuals radius={r[-1]-r_second[-1]:.3e}, "
              f"mass={m[-1]-m_second[-1]:.3e}; sensitivity uncertainty<={tight_delta:.3e}")

        assert 1.96 < r_order1 < 2.04 and 1.96 < m_order1 < 2.04
        assert 2.90 < r_order2 < 3.10 and 2.90 < m_order2 < 3.10
        assert tight_delta < 5e-10

        # Negative control: omitting the 1/2 Taylor factor must remain O(eps^2).
        wrong = ex.radius0 + eps*ex.radius1 + eps**2*ex.radius2
        wrong_order = fit_order(eps, r-wrong, 2, 8)
        print(f"     no-1/2 negative-control radius order={wrong_order:.5f}")
        assert 1.96 < wrong_order < 2.04


if __name__ == "__main__":
    main()
