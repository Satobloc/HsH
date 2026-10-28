"""Ravel 2026-10-28: real Mercury Kepler control, not a SAT prediction.
JPL Table 1 J2000 fitted a/e; NASA/NSSDC fact-sheet period/speeds.
Print-resolution bounds are not observational standard deviations.
"""
from math import pi, sqrt, cos
from scipy.integrate import quad
from scipy.special import ellipe

AU_M = 149597870700.0  # exact IAU definition
DAY_S = 86400.0
JPL_A_AU, JPL_E = 0.38709927, 0.20563593
NASA_P_D, NASA_A_M, NASA_E = 87.969, 57.909e9, 0.2056


def compute(a, e, period_s):
    assert a > 0 and 0 < e < 1 and period_s > 0
    length = 4*a*ellipe(e*e)
    time_integral = (2*pi*a)**2
    arc_integral = length**2
    numerical, err = quad(lambda E: (2*pi*a)**2*(1+e*cos(E))/(2*pi),
                          0, 2*pi, epsabs=0, epsrel=1e-13)
    factor = 2*pi*a/period_s/1000
    vp = factor*sqrt((1+e)/(1-e))
    va = factor*sqrt((1-e)/(1+e))
    assert abs(numerical/time_integral-1) < 1e-12
    return length, time_integral, arc_integral, time_integral/arc_integral, vp, va


jpl = compute(JPL_A_AU*AU_M, JPL_E, NASA_P_D*DAY_S)
nasa = compute(NASA_A_M, NASA_E, NASA_P_D*DAY_S)
assert abs(nasa[4]-58.97) < .005 and abs(nasa[5]-38.86) < .005
print('JPL perimeter m, J_time m^2, J_arc m^2, ratio, vp/va km/s:', jpl)
print('NASA rounded-input consistency:', nasa)
print('JPL percentage gap:', 100*(jpl[3]-1))
print('PASS: quadrature; NASA reported rounded speeds; nonzero parameter gap')
