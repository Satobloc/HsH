#!/usr/bin/env python3
"""Ravel: finite-time colored-noise gate for the common b/bdot bath.

GEN/DERIVED sandbox mathematics.  This continues Ravel's conditional
thin-waveguide fixture in
WORKSPACES/RAVEL/RUNS/2026-10-14T1500Z_s0_CORRELATED_B_BDOT_GATE.md.
It is not a finite-core SAT/H(s)H derivation or a physical-particle claim.

For delta H(t) = V b(t) + A bdot(t), with stationary two-sided spectrum

  S_b(nu) = 2 Gamma kBT / [(K-M nu^2)^2 + Gamma^2 nu^2],

the finite-window transition rate is

  R_T = (1/T) E |integral_0^T exp(i omega t)
                       [V b(t)+A bdot(t)] dt|^2
      = integral S_b(nu)|V-i nu A|^2
          T sinc^2[(omega-nu)T/2] dnu/(2 pi).

For the underdamped oscillator, this is evaluated more accurately in time
using its exact covariance C(tau), including the b/bdot cross covariance.
The independent frequency-domain integral is retained as a numerical check.
"""

from __future__ import annotations

import hashlib
import math
from dataclasses import dataclass

import numpy as np
from scipy.integrate import quad
from scipy.optimize import brentq, minimize_scalar


@dataclass(frozen=True)
class Fixture:
    omega: float = 0.143833264176
    K: float = 4.0
    mass: float = 1.0
    Gamma: float = 2.0
    kBT: float = 0.04
    W_V: float = 0.00363923235465
    W_A: float = 0.00004685325558
    W_X: float = 0.00082585684870


F = Fixture()


def spectrum(nu: float) -> float:
    return 2.0 * F.Gamma * F.kBT / (
        (F.K - F.mass * nu * nu) ** 2 + F.Gamma**2 * nu * nu
    )


# The reported cross rate saturates Cauchy-Schwarz to rounding precision, so
# choose V real and -i omega A real-positive.  Thus A=i*a with a>0.
S_OMEGA = spectrum(F.omega)
V = math.sqrt(F.W_V / S_OMEGA)
a = math.sqrt(F.W_A / S_OMEGA) / F.omega
A = 1j * a
W_GOLDEN = S_OMEGA * abs(V - 1j * F.omega * A) ** 2
W_INCOHERENT = F.W_V + F.W_A


gamma = F.Gamma / (2.0 * F.mass)
omega_0_sq = F.K / F.mass
omega_d = math.sqrt(omega_0_sq - gamma * gamma)
C0 = F.kBT / F.K


def covariance_derivatives(tau: float) -> tuple[float, float, float]:
    """Return C, C', C'' for tau>=0 for the equilibrium oscillator."""
    e = math.exp(-gamma * tau)
    c = math.cos(omega_d * tau)
    s = math.sin(omega_d * tau)
    C = C0 * e * (c + gamma * s / omega_d)
    Cp = -C0 * omega_0_sq * e * s / omega_d
    Cpp = C0 * omega_0_sq * e * (-c + gamma * s / omega_d)
    return C, Cp, Cpp


def coupled_covariance(tau: float, coherent: bool = True) -> complex:
    """<y(t)y*(t-tau)> for y=V b+A bdot and tau>=0."""
    C, Cp, Cpp = covariance_derivatives(tau)
    cross = (A * V - V * A.conjugate()) * Cp if coherent else 0.0j
    return V * V * C + cross - abs(A) ** 2 * Cpp


def finite_rate(T: float, coherent: bool = True, tol: float = 2e-12) -> float:
    """Exact covariance integral for R_T."""
    if T <= 0:
        raise ValueError("T must be positive")

    def integrand(tau: float) -> complex:
        return (
            (1.0 - tau / T)
            * np.exp(1j * F.omega * tau)
            * coupled_covariance(tau, coherent)
        )

    re = quad(
        lambda x: float(np.real(integrand(x))),
        0.0,
        T,
        epsabs=tol,
        epsrel=tol,
        limit=1000,
    )[0]
    return 2.0 * re


def finite_rate_frequency(T: float, cutoff: float = 100.0) -> float:
    """Independent spectral integral; the omitted tail is O(cutoff^-3)."""

    def integrand(nu: float) -> float:
        x = (F.omega - nu) * T / 2.0
        kernel = T if x == 0.0 else T * (math.sin(x) / x) ** 2
        return spectrum(nu) * abs(V - 1j * nu * A) ** 2 * kernel / (2.0 * math.pi)

    # Split around the oscillator peaks and narrow Fejer peak.
    bounds = sorted(
        {
            -cutoff,
            -10.0,
            -3.0,
            -1.0,
            F.omega - 1.0,
            F.omega - 0.1,
            F.omega,
            F.omega + 0.1,
            F.omega + 1.0,
            3.0,
            10.0,
            cutoff,
        }
    )
    return sum(
        quad(integrand, lo, hi, epsabs=2e-11, epsrel=2e-11, limit=1000)[0]
        for lo, hi in zip(bounds[:-1], bounds[1:])
    )


def rel_error(T: float) -> float:
    return finite_rate(T) / W_GOLDEN - 1.0


def main() -> None:
    cross_cosine = F.W_X / (2.0 * math.sqrt(F.W_V * F.W_A))
    assert abs(cross_cosine - 1.0) < 3e-10
    assert abs(W_GOLDEN - (F.W_V + F.W_A + F.W_X)) < 4e-14

    table_T = [0.1, 0.5, 1, 2, 5, 10, 20, 50, 100, 200, 500, 1000]
    rows = [(T, finite_rate(T), rel_error(T)) for T in table_T]

    # Largest finite-window overshoot on the first 10 time units.
    peak = minimize_scalar(
        lambda x: -finite_rate(x), bounds=(0.05, 10.0), method="bounded",
        options={"xatol": 2e-11},
    )
    peak_T = float(peak.x)
    peak_rate = -float(peak.fun)

    # After the transient maximum the error is positive and monotone here.
    T_1pct = brentq(lambda x: rel_error(x) - 0.01, 50.0, 200.0, xtol=1e-11)
    T_01pct = brentq(lambda x: rel_error(x) - 0.001, 500.0, 1500.0, xtol=1e-10)

    # Short-time law R_T = T <|y|^2> + O(T^2).
    short_slope = float(np.real(coupled_covariance(0.0)))
    short_test = finite_rate(1e-3) / 1e-3

    # Independent frequency-domain check and integration uncertainty proxy.
    checks = []
    for T in (0.5, 2.0, 20.0):
        rt = finite_rate(T)
        rf = finite_rate_frequency(T, 100.0)
        checks.append((T, rt, rf, abs(rt - rf)))
    tolerance_delta = max(
        abs(finite_rate(T, tol=2e-10) - finite_rate(T, tol=2e-12))
        for T in (0.5, 2.0, 20.0, 1000.0)
    )

    print("RAVEL FINITE-TIME COMMON-BATH GATE")
    print(f"S_b(omega)                 = {S_OMEGA:.15g}")
    print(f"V, A                       = {V:.15g}, {A}")
    print(f"cross Cauchy cosine        = {cross_cosine:.12f}")
    print(f"Golden-rule coherent rate  = {W_GOLDEN:.15g}")
    print(f"incoherent asymptotic rate = {W_INCOHERENT:.15g}")
    print(
        "incoherent deficit           = "
        f"{(W_GOLDEN-W_INCOHERENT)/W_GOLDEN:.6%} of coherent rate"
    )
    print("\nT          R_T                 relative-to-Golden")
    for T, rate, err in rows:
        print(f"{T:7g}  {rate:.12g}  {err:+.8%}")
    print(
        f"\npeak transient: T={peak_T:.9f}, R_T={peak_rate:.12g}, "
        f"overshoot={peak_rate/W_GOLDEN-1:.6%}"
    )
    print(f"post-transient |error| <1% after T={T_1pct:.9f}")
    print(f"post-transient |error| <0.1% after T={T_01pct:.9f}")
    print(
        f"short-time slope exact/test = {short_slope:.12g} / {short_test:.12g} "
        f"(rel {short_test/short_slope-1:+.3e})"
    )
    print("\nindependent spectral checks (T,time,freq,absdiff)")
    for row in checks:
        print("  " + ", ".join(f"{x:.12g}" for x in row))
    print(f"quadrature-tolerance delta <= {tolerance_delta:.3e}")

    # Negative control: decorrelating the channels removes only the cross term.
    incoh_1000 = finite_rate(1000.0, coherent=False)
    print(
        "negative control (independent channels): "
        f"R_1000={incoh_1000:.12g}, asymptote={W_INCOHERENT:.12g}, "
        f"rel={incoh_1000/W_INCOHERENT-1:+.6%}"
    )

    assert peak_rate / W_GOLDEN - 1.0 > 0.55
    assert 98.0 < T_1pct < 101.0
    assert 985.0 < T_01pct < 995.0
    assert max(x[3] for x in checks) < 1.6e-8
    assert tolerance_delta < 2e-12

    digest = hashlib.sha256(open(__file__, "rb").read()).hexdigest()
    print(f"artifact sha256             = {digest}")
    print(
        "STATUS: GEN/DERIVED conditional apparatus model; finite-time rate, "
        "not SAT/H(s)H ontology or a physical-particle prediction."
    )


if __name__ == "__main__":
    main()
