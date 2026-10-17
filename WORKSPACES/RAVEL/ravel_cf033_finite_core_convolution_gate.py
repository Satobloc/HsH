#!/usr/bin/env python3
"""CF033: finite-core convolution gate for Mercer's hollow-core limit.

Starting point (CF032, Mercer):

    U'' + 2 U'/z + z^2 U^(n+1) = 0,
    rho_0(z) = z^2 U(z)^(n+1),                 0 <= z <= z0.

Here rho_0 is the radial source density because M'(z)=z^2 rho_0(z).
We convolve rho_0 in R^3 with a normalized isotropic Gaussian of width
sigma.  This is a deliberately minimal finite-core/readout model, not a
claim that Gaussian smoothing is H(s)H dynamics.

Two exact consequences provide a useful gate:

    M_sigma = M_0,
    <z^2>_sigma = <z^2>_0 + 3 sigma^2.

In physical xi coordinates L_eta=(a eta)^(-1/4).  Thus

  sigma_xi=lambda L_eta: R_rms=L_eta sqrt(R0^2+3 lambda^2), exponent -1/4;
  sigma_xi=sigma_* fixed: R_rms=sqrt(L_eta^2 R0^2+3 sigma_*^2), exponent -> 0.

The second case regularizes the hollow center but destroys asymptotic radial
contraction.  The first preserves contraction but requires a co-moving core.

Status: GEN/DERIVED sandbox mathematics; no SAT/H(s)H physical claim.
"""

from __future__ import annotations

import json
from dataclasses import asdict, dataclass

import numpy as np
from scipy.integrate import simpson, solve_ivp


@dataclass
class ProfileResult:
    k: float
    boundary_z0: float
    radial_mass: float
    rms_radius: float
    peak_density: float
    peak_location: float


def solve_pure_profile(k: float, *, tight: bool = False):
    """Solve the pure-L^2 compact profile and return a dense interpolant."""
    p = k + 2.5
    z_start = 1.0e-7
    u_start = 1.0 - z_start**4 / 20.0
    m_start = z_start**5 / 5.0

    def rhs(z: float, y: np.ndarray) -> tuple[float, float]:
        u, mass = y
        up = max(float(u), 0.0)
        return -mass / z**2, z**4 * up**p

    def zero(_z: float, y: np.ndarray) -> float:
        return float(y[0])

    zero.terminal = True
    zero.direction = -1
    controls = dict(rtol=2e-11, atol=2e-13, max_step=0.002)
    if tight:
        controls = dict(rtol=2e-13, atol=2e-15, max_step=0.0005)
    sol = solve_ivp(
        rhs, (z_start, 8.0), (u_start, m_start), method="DOP853",
        events=zero, dense_output=True, **controls,
    )
    if not sol.t_events[0].size:
        raise RuntimeError("compact boundary not found")
    return float(sol.t_events[0][0]), sol.sol


def density_from_solution(z: np.ndarray, boundary: float, dense, k: float) -> np.ndarray:
    u = np.zeros_like(z)
    inside = z <= boundary
    u[inside] = np.maximum(dense(z[inside])[0], 0.0)
    return z**2 * u ** (k + 2.5)


def profile_moments(k: float, *, tight: bool = False) -> tuple[ProfileResult, object]:
    boundary, dense = solve_pure_profile(k, tight=tight)
    z = np.linspace(0.0, boundary, 12001)
    rho = density_from_solution(z, boundary, dense, k)
    mass = float(simpson(z**2 * rho, x=z))
    r2 = float(simpson(z**4 * rho, x=z) / mass)
    imax = int(np.argmax(rho))
    return ProfileResult(
        k=k,
        boundary_z0=boundary,
        radial_mass=mass,
        rms_radius=float(np.sqrt(r2)),
        peak_density=float(rho[imax]),
        peak_location=float(z[imax]),
    ), dense


def gaussian_radial_convolution(
    k: float, boundary: float, dense, sigma: float,
    *, n_source: int = 2401, n_output: int = 2001,
) -> tuple[np.ndarray, np.ndarray]:
    """Directly evaluate the R^3 radial Gaussian convolution.

    Angular integration is analytic.  For r>0 we use the stable identity

      exp(-(r^2+s^2)/2q^2) sinh(rs/q^2)/(rs/q^2)
       = [exp(-(r-s)^2/2q^2)-exp(-(r+s)^2/2q^2)]/[2rs/q^2].
    """
    source_r = np.linspace(0.0, boundary, n_source)
    source_rho = density_from_solution(source_r, boundary, dense, k)
    out_r = np.linspace(0.0, boundary + 8.0 * sigma, n_output)
    out_rho = np.empty_like(out_r)
    prefactor = np.sqrt(2.0 / np.pi) / sigma**3

    # Exact r->0 limit of the angular factor.
    out_rho[0] = prefactor * simpson(
        source_r**2 * source_rho * np.exp(-source_r**2 / (2.0 * sigma**2)),
        x=source_r,
    )
    s = source_r
    for i, r in enumerate(out_r[1:], start=1):
        q = r * s / sigma**2
        angular = np.ones_like(s)
        nz = s > 0.0
        angular[nz] = (
            np.exp(-(r - s[nz])**2 / (2.0 * sigma**2))
            - np.exp(-(r + s[nz])**2 / (2.0 * sigma**2))
        ) / (2.0 * q[nz])
        angular[~nz] = np.exp(-r**2 / (2.0 * sigma**2))
        out_rho[i] = prefactor * simpson(s**2 * source_rho * angular, x=s)
    return out_r, out_rho


def log_slope(x: np.ndarray, y: np.ndarray, count: int = 4) -> float:
    return float(np.polyfit(np.log(x[-count:]), np.log(y[-count:]), 1)[0])


def main() -> None:
    k = 0.0
    a = 2.0 / (k + 2.5)
    profile, dense = profile_moments(k)
    profile_tight, _ = profile_moments(k, tight=True)

    # Direct convolution verifies the exact moment theorem independently.
    sigma_z = 0.25
    r, rho_s = gaussian_radial_convolution(k, profile.boundary_z0, dense, sigma_z)
    mass_s = float(simpson(r**2 * rho_s, x=r))
    rms_s = float(np.sqrt(simpson(r**4 * rho_s, x=r) / mass_s))
    rms_exact = float(np.sqrt(profile.rms_radius**2 + 3.0 * sigma_z**2))

    # Two inequivalent finite-core scalings in the physical xi coordinate.
    eta = np.logspace(2.0, 12.0, 21)
    L = (a * eta) ** (-0.25)
    lam = 0.25
    fixed_sigma = 0.05
    radius_comoving = L * np.sqrt(profile.rms_radius**2 + 3.0 * lam**2)
    radius_fixed = np.sqrt((L * profile.rms_radius) ** 2 + 3.0 * fixed_sigma**2)
    mass_physical = profile.radial_mass * L
    local_fixed_exponent = -0.25 * (L * profile.rms_radius) ** 2 / radius_fixed**2

    payload = {
        "status": "GEN/DERIVED sandbox mathematics; no SAT/H(s)H physical claim",
        "source": {
            "equation": "U''+2U'/z+z^2 U^(k+5/2)=0",
            "density_definition": "rho_0(z)=z^2 U^(k+5/2); M'=z^2 rho_0",
            "scale": "L_eta=(a eta)^(-1/4), a=2/(k+5/2)",
        },
        "unsmoothed_profile": asdict(profile),
        "numerical_uncertainty_tight_minus_default": {
            "boundary": profile_tight.boundary_z0 - profile.boundary_z0,
            "mass": profile_tight.radial_mass - profile.radial_mass,
            "rms_radius": profile_tight.rms_radius - profile.rms_radius,
        },
        "direct_convolution_check": {
            "sigma_z": sigma_z,
            "regularized_center_density": float(rho_s[0]),
            "center_to_original_peak_ratio": float(rho_s[0] / profile.peak_density),
            "mass_relative_error": float(mass_s / profile.radial_mass - 1.0),
            "rms_numeric": rms_s,
            "rms_exact_from_moment_addition": rms_exact,
            "rms_relative_error": float(rms_s / rms_exact - 1.0),
        },
        "scaling_gate": {
            "eta_range": [float(eta[0]), float(eta[-1])],
            "comoving_core_sigma_xi": "0.25 L_eta",
            "comoving_radius_fitted_exponent": log_slope(eta, radius_comoving),
            "fixed_core_sigma_xi": fixed_sigma,
            "fixed_radius_fitted_exponent_last_4": log_slope(eta, radius_fixed),
            "fixed_radius_local_exponent_at_eta_max": float(local_fixed_exponent[-1]),
            "fixed_radius_eta_max": float(radius_fixed[-1]),
            "fixed_radius_asymptotic_floor": float(np.sqrt(3.0) * fixed_sigma),
            "mass_fitted_exponent_both_cases": log_slope(eta, mass_physical),
        },
        "negative_controls": {
            "sigma_zero_rms": profile.rms_radius,
            "normalized_convolution_preserves_mass_exactly": True,
            "fixed_width_limit_radius_exponent": 0.0,
            "comoving_width_limit_radius_exponent": -0.25,
        },
        "discriminator": (
            "A finite core can fill the hollow center without changing total mass. "
            "But eta^(-1/4) radial contraction survives only for a co-moving core; "
            "an eta-independent physical core produces the floor sqrt(3)*sigma_* "
            "and forces the radius exponent to zero."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
