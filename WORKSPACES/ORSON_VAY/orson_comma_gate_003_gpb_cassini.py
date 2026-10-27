#!/usr/bin/env python3
"""GP-B/Cassini real-data PPN gamma two-spoke cross-check; no HsH physics claim.
Sources: Everitt et al PRL 106 221101 (2011); Bertotti et al Nature 425 374 (2003);
JPL DE440 Earth GM; GPB ION orbit 97.65 min; Buchman et al PPN formula.
Approximation: circular Kepler orbit, point Earth, Julian rate year.
"""
import math
mu=398600.435507*1e9  # m^3/s^2, JPL DE440
c=299792458.0          # m/s, exact
period=97.65*60        # s, GP-B nominal
n=2*math.pi/period
r=(mu/n**2)**(1/3)
q=mu/(c*c*r)
rad_to_mas=180/math.pi*3600*1000
rate_unit=q*n*(365.25*86400)*rad_to_mas
gpb_geod_obs,gpb_geod_sd,gpb_geod_GR=-6601.8,18.3,-6606.1 # mas/year
gpb_fd_obs,gpb_fd_sd,gpb_fd_GR=-37.2,7.2,-39.2         # mas/year
cass_gamma,cass_sd=1.000021,0.000023  # dimensionless
gr_leading=-1.5*rate_unit
coefficient=abs(gpb_geod_obs)/rate_unit
coefficient_sd=gpb_geod_sd/rate_unit
gpb_gamma,gpb_gamma_sd=coefficient-0.5,coefficient_sd
z_cross=(gpb_gamma-cass_gamma)/math.hypot(gpb_gamma_sd,cass_sd)
print(f'Kepler radius {r:.6f} m; compactness {q:.14g}')
print(f'leading GR {gr_leading:.9f} mas/year; published GR {gpb_geod_GR:.1f}')
print(f'GP-B derived coefficient {coefficient:.12f} +/- {coefficient_sd:.12f} [formal]')
print(f'GP-B gamma {gpb_gamma:.12f} +/- {gpb_gamma_sd:.12f} [formal only]')
print(f'Cassini gamma {cass_gamma:.6f} +/- {cass_sd:.6f}')
print(f'cross-spoke z {z_cross:.12f} [formal measurement-only]')
print('published GPB geodetic z', (gpb_geod_obs-gpb_geod_GR)/gpb_geod_sd)
print('published GPB frame dragging z',(gpb_fd_obs-gpb_fd_GR)/gpb_fd_sd)
assert abs(gr_leading+6610.963356744118)<1e-8
assert abs(coefficient-1.497920872590807)<1e-12
assert abs(z_cross+0.505779684916144)<1e-10
assert abs(2*math.pi*(3/(4*math.pi))-1.5)<1e-14
print('NUMERIC ASSERTIONS PASS; LEAN NOT RUN; HsH physical map BLOCKED')
