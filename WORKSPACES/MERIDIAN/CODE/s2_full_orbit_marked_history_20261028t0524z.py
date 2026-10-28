#!/usr/bin/env python3
"""GRAVITY 2020 S2 fit -> Keplerian osculating marked-R4 curvature.
Source: A&A 636 L5, Table E.1; IAU 2015 B3 nominal solar GM.
Not a H(s)H physical prediction. No orbital covariance supplied.
"""
from math import pi, tan, sqrt, sin, cos
from scipy.constants import c, astronomical_unit as AU, parsec
from scipy.integrate import quad

M_million, R0_pc, a_mas, e = 4.261, 8246.7, 125.058, 0.884649
mu = M_million * 1e6 * 1.3271244e20  # m^3/s^2, nominal IAU 2015
a = R0_pc * parsec * tan(a_mas * pi / (180 * 3600 * 1000))
p = a * (1-e*e)
h = sqrt(mu*p)
rp, ra = a*(1-e), a*(1+e)
vp = sqrt(mu*(1+e)/(a*(1-e)))
va = sqrt(mu*(1-e)/(a*(1+e)))
kp = (mu/rp**2)/(c*c+vp*vp)
ka = (mu/ra**2)/(c*c+va*va)

def bend_true(f):
    r = p/(1+e*cos(f))
    vt = h/r
    vr = mu*e*sin(f)/h
    return mu/(c*h) * sqrt(1+(vt/c)**2)/(1+(vt*vt+vr*vr)/c**2)

n = sqrt(mu/a**3)
def bend_eccentric(E):
    D = 1-e*cos(E)
    r = a*D
    vr = n*a*e*sin(E)/D
    vt = n*a*sqrt(1-e*e)/D
    return (mu/r**2)/c * sqrt(1+(vt/c)**2)/(1+(vt*vt+vr*vr)/c**2) * D/n

bend1, err1 = quad(bend_true, 0, 2*pi, epsabs=1e-14, epsrel=1e-13)
bend2, err2 = quad(bend_eccentric, 0, 2*pi, epsabs=1e-14, epsrel=1e-13)
assert abs(bend1-bend2) < 3e-14
gr = 6*pi*mu/(p*c*c)
print(dict(a_AU=a/AU, peri_AU=rp/AU, apo_AU=ra/AU,
           v_peri_kms=vp/1000, v_apo_kms=va/1000,
           kappa_peri_inv_m=kp, kappa_apo_inv_m=ka,
           kappa_ratio=kp/ka,
           marked_R4_turn_rad=bend1, marked_R4_turn_deg=bend1*180/pi,
           GR_precession_arcmin=gr*180/pi*60,
           ratio_distinct_observables=bend1/gr,
           independent_quadrature_delta=abs(bend1-bend2)))
