#!/usr/bin/env python3
"""Reproducible leading-order standard-physics sanity checks for Comma Gate 003.

This is NOT an H(s)H calculation and NOT a precision GP-B orbit reconstruction.
Inputs are published mission-level summary values / stated reference constants.
The circular-orbit GP-B estimates are intentionally diagnostic only.
"""
import math

# SI constants and reference values
G = 6.67430e-11
c = 299792458.0
mu_earth = 3.98600435507e14       # m^3 s^-2, JPL DE440 Earth GM
earth_radius = 6_378_137.0        # m, reference equatorial radius
altitude = 642_000.0              # m, approximate GP-B orbital altitude
earth_mass = 5.9722e24            # kg, reference value
earth_inertia_factor = 0.3307     # approximate C/(M R^2), model input
earth_spin = 7.2921150e-5         # rad s^-1

mas_per_rad = (180.0 / math.pi) * 3600.0 * 1000.0
seconds_per_julian_year = 365.25 * 86400.0
rate_to_mas_per_year = mas_per_rad * seconds_per_julian_year

# GP-B circular polar-orbit diagnostic
r = earth_radius + altitude
n = math.sqrt(mu_earth / r**3)
period = 2.0 * math.pi / n
geodetic_rate = 1.5 * mu_earth * n / (c**2 * r) * rate_to_mas_per_year

# Approximate Earth angular momentum and leading Lense-Thirring precession.
# For a circular polar orbit, orbit-averaged vector coefficient is 1/2.
earth_J = earth_inertia_factor * earth_mass * earth_radius**2 * earth_spin
lt_rate = (G * earth_J / (2.0 * c**2 * r**3)) * rate_to_mas_per_year

gpb_geod_obs, gpb_geod_sigma, gpb_geod_gr = -6601.8, 18.3, -6606.1
gpb_fd_obs, gpb_fd_sigma, gpb_fd_gr = -37.2, 7.2, -39.2

# Cassini 2002 superior-conjunction leading Shapiro round-trip delay.
mu_sun = 1.32712440018e20       # m^3 s^-2, nominal solar GM
au = 149_597_870_700.0          # m, exact astronomical unit
solar_radius = 6.957e8          # m, nominal photospheric radius
r1 = 1.0 * au
r2 = 8.43 * au
impact = 1.6 * solar_radius
gamma = 1.0
shapiro_round_trip = (
    2.0 * (1.0 + gamma) * mu_sun / c**3
    * math.log(4.0 * r1 * r2 / impact**2)
)

print(f"GPB approximate circular radius: {r:.3f} m")
print(f"GPB approximate circular period: {period/60:.6f} min")
print(f"GPB leading geodetic magnitude: {geodetic_rate:.6f} mas/year")
print(f"GPB leading orbit-averaged LT magnitude: {lt_rate:.6f} mas/year")
print(f"Published GPB full-GR geodetic: {abs(gpb_geod_gr):.1f} mas/year")
print(f"Published GPB full-GR frame dragging: {abs(gpb_fd_gr):.1f} mas/year")
print(f"Observed GPB geodetic: {abs(gpb_geod_obs):.1f} +/- {gpb_geod_sigma:.1f} mas/year")
print(f"Observed GPB frame dragging: {abs(gpb_fd_obs):.1f} +/- {gpb_fd_sigma:.1f} mas/year")
print(f"Geodetic diagnostic minus published GR: {geodetic_rate-abs(gpb_geod_gr):.6f} mas/year")
print(f"LT diagnostic minus published GR: {lt_rate-abs(gpb_fd_gr):.6f} mas/year")
print(f"Cassini leading Shapiro round-trip delay (gamma=1): {shapiro_round_trip*1e6:.6f} microseconds")
print("STATUS: standard-physics sanity checks only; H(s)H connection/readout map NOT DERIVED.")
