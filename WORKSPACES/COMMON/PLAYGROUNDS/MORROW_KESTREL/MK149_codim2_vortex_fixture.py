#!/usr/bin/env python3
"""MK149 codimension-two winding and energy fixture. LOCAL:MK149."""
import numpy as np
import sympy as sp

phi=np.linspace(0,2*np.pi,40001)
rho=1.0
core=0.08

def winding(offset):
    z=offset+rho*np.exp(1j*phi)
    clearance=float(np.min(abs(z)))
    if clearance<1e-9: return (float('nan'),clearance)
    n=np.sum(np.angle(z[1:]/z[:-1]))/(2*np.pi)
    return (float(n),clearance)

for d in (0,.25,.7,.91,1.,1.09,1.3,2.):
    n,clearance=winding(d)
    print(f"delta={d:.2f}, winding={n}, clearance={clearance:.8f}, allowed={clearance>core}")
    if d<1: assert abs(n-1)<1e-10
    if d>1: assert abs(n)<1e-10

x,y=sp.symbols("x y",real=True)
ax=-y/(x*x+y*y)
ay=x/(x*x+y*y)
assert sp.simplify(sp.diff(ay,x)-sp.diff(ax,y))==0

r=np.geomspace(core,10,20001)
for n in (1,2,-1):
    numerical=np.trapezoid(.5*(n/r)**2*2*np.pi*r,r)
    exact=np.pi*n*n*np.log(10/core)
    assert abs(numerical/exact-1)<2e-8
    print(f"n={n}, gradient-energy/length numerical={numerical:.12f}, exact={exact:.12f}")

# Closed S2 in R4: x1²+x2²+x3²=R², x4=0.
# Normal spanning disk x1=x2=0, x3=R+u, x4=v, u²+v²<=rho².
# Intersections have v=0 and u=0 or -2R; R=3, rho=1 => one.
assert [u for u in (0,-6) if abs(u)<=rho]==[0]
print("MK149 passed")
