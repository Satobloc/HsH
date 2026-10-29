#!/usr/bin/env python3
"""Tang et al. (2023), Fig 2d, source-pinned circular-ring inverse bound.
Inputs are the reported image-derived projected half-separation 140.6 um,
the S2W-fitted radius 140.8 um, and brightness-derived tilt bound.
Not a blind H(s)H prediction; original pointwise errors not recovered.
"""
from fractions import Fraction
import math
import mpmath as mp

mp.mp.dps = 60
projected_half_um = Fraction(1406, 10)
fitted_radius_um = Fraction(1408, 10)
c = projected_half_um / fitted_radius_um
cosine_upper = 1 - 2*c*c
angle_min = 2*mp.asin(mp.mpf(c.numerator)/c.denominator)*180/mp.pi
tilt_tan_bound = Fraction(2,10)/Fraction(112,100)
tilt_deg = mp.atan(mp.mpf(tilt_tan_bound.numerator)/tilt_tan_bound.denominator)*180/mp.pi
checks = [
    c == Fraction(703,704),
    cosine_upper == Fraction(-246401,247808),
    2*projected_half_um == Fraction(2812,10),
    2*fitted_radius_um == Fraction(2816,10),
    0 < c < 1,
    abs(float(angle_min) - math.degrees(2*math.asin(float(c)))) < 1e-10,
    abs(math.cos(math.radians(float(angle_min))) - float(cosine_upper)) < 1e-13,
    tilt_tan_bound == Fraction(5,28),
    173 < float(angle_min) < 174,
]
assert all(checks), checks
print("checks",sum(checks),"/",len(checks))
print("projection factor",c)
print("cosine upper bound",cosine_upper)
print("smaller central angle lower bound degrees",angle_min)
print("max departure from antipodal degrees",180-angle_min)
print("independent optical propagation tilt upper bound degrees",tilt_deg)
print("model fitted R, no pointwise covariance: NOT a confidence interval")
