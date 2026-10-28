#!/usr/bin/env python3
"""S2 measured-fit apsis Euclidean marked-curve comparator.
GRAVITY Collaboration 2020 A&A 636 L5 Table E.1; NOT H(s)H physics.
Run: python WORKSPACES/RAVEL/CODE/s2_marked_gram_replay_20261028.py
Outputs a JSON summary to stdout. Requires mpmath for independent replay.
"""
from decimal import Decimal as D, getcontext
from itertools import product
import json
import mpmath as mp
getcontext().prec=65
mp.mp.dps=85

# Correlated fitted source inputs, not independently observed held-out values.
M,dM=D("4.261"),D("0.012")       # million nominal solar masses
R,dR=D("8246.7"),D("9.3")        # parsec
a,da=D("125.058"),D("0.041")    # milliarcseconds
e,de=D("0.884649"),D("0.000066")
c=D("299792458")                 # exact SI m/s
AU=D("149597870700")            # exact SI m
GMsol=D("1.3271244e20")        # IAU 2015 nominal conversion, m^3/s^2
pi=D(str(mp.pi))
pc=AU*D(648000)/pi
mas=pi/D(180*3600*1000)

def calc(m,dist,semi,ecc):
    gm=m*D(10)**6*GMsol
    A=semi*mas*dist*pc
    rp=A*(1-ecc)
    ra=A*(1+ecc)
    vp=(gm*(1+ecc)/rp).sqrt()
    ap=gm/rp**2
    k=ap/(c**2+vp**2)  # alpha=+1 or -1 Euclidean marked-lift at apsis
    dphi=6*pi*gm/(A*(1-ecc**2)*c**2)
    return {"peri_AU":rp/AU,"apo_AU":ra/AU,"speed_km_s":vp/D(1000),
            "accel_m_s2":ap,"kappa_m_inv":k,"v2_c2":(vp/c)**2,
            "precession_arcmin":dphi*D(180)/pi*D(60)}

out=calc(M,R,a,e)
corners=[calc(m,r,aa,ee) for m,r,aa,ee in
         product((M-dM,M+dM),(R-dR,R+dR),(a-da,a+da),(e-de,e+de))]
# Independent arbitrary-precision replay of the same actual fitted physical inputs.
gm2=mp.mpf("4.261")*10**6*mp.mpf("1.3271244e20")
sma2=mp.mpf("125.058")*mp.pi/mp.mpf(648000000)*mp.mpf("8246.7")*mp.mpf("149597870700")*mp.mpf(648000)/mp.pi
rp2=sma2*(1-mp.mpf("0.884649"))
v2=mp.sqrt(gm2*(1+mp.mpf("0.884649"))/rp2)
k2=(gm2/rp2**2)/(mp.mpf("299792458")**2+v2**2)
assert abs(mp.mpf(str(out["kappa_m_inv"]))-k2)/k2 < mp.mpf("1e-58")
result={"system":"S2/Sgr A*","source":"GRAVITY 2020 A&A 636 L5 Table E.1",
        "status":"joint fit, covariance missing, standard Kepler/GR comparator only",
        "nominal":{k:str(v) for k,v in out.items()},
        "marginal_endpoint_sensitivity_not_CI":{
          "kappa_m_inv":[str(min(x["kappa_m_inv"] for x in corners)),
                         str(max(x["kappa_m_inv"] for x in corners))]},
        "mpmath_crosscheck":"PASS <1e-58","alpha_reflection":"identical squared Gram curvature"}
print(json.dumps(result,indent=2))
