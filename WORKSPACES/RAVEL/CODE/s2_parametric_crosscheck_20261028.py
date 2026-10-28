#!/usr/bin/env python3
"""Independent parametric Kepler S2 apsis derivative crosscheck.
Real fitted S2 inputs: GRAVITY Collaboration 2020 A&A 636 L5 Table E.1.
This is a standard Kepler/Euclidean comparator, not H(s)H physics.
Requires sympy and mpmath.
"""
import sympy as sp
import mpmath as mp

E=sp.symbols("E",real=True)
a,e,n=sp.symbols("a e n",positive=True,real=True)
x=a*(sp.cos(E)-e)
y=a*sp.sqrt(1-e**2)*sp.sin(E)
dt_dE=(1-e*sp.cos(E))/n
Dt=lambda f: sp.diff(f,E)/dt_dE
vx,vy=sp.simplify(Dt(x)),sp.simplify(Dt(y))
ax,ay=sp.simplify(Dt(vx)),sp.simplify(Dt(vy))
vp=sp.simplify(vy.subs(E,0))
ap=sp.simplify(-ax.subs(E,0))
assert sp.simplify(vx.subs(E,0))==0
assert sp.simplify(ay.subs(E,0))==0
assert sp.simplify(vp-a*n*sp.sqrt(1-e**2)/(1-e))==0
assert sp.simplify(ap-a*n**2/(1-e)**2)==0
assert sp.simplify(vp**2-a**2*n**2*(1+e)/(1-e))==0

mp.mp.dps=75
sma=mp.mpf("125.058")*mp.mpf("8246.7")/1000*mp.mpf("149597870700")
ecc=mp.mpf("0.884649")
gm=mp.mpf("4.261e6")*mp.mpf("1.3271244e20")
nmean=mp.sqrt(gm/sma**3)
v=sma*nmean*mp.sqrt(1-ecc**2)/(1-ecc)
acc=sma*nmean**2/(1-ecc)**2
c=mp.mpf("299792458")
print("v_km_s",mp.nstr(v/1000,30))
print("a_m_s2",mp.nstr(acc,30))
print("Euclidean_marked_kappa_m_inv",mp.nstr(acc/(v*v+c*c),30))
print("Kepler derivatives, apsis orthogonality: PASS")
