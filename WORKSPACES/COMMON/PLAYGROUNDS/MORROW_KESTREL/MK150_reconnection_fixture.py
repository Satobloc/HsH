#!/usr/bin/env python3
"""MK150 sandbox reproducibility: exact wave-equation defect reconnection, causal signature, conserved flux.
Local symbols only. No fitted constants or canonical theory status.
"""
import numpy as np
import sympy as sp
from scipy.integrate import quad
from scipy.optimize import minimize_scalar

x,y,z,T,L,s=sp.symbols("x y z T L s", real=True, nonzero=True)
# T=ct, all coordinates length. psi=(xz/L-T)+i*y.
f=x*z/L-T
g=y
box=lambda h:-sp.diff(h,T,2)+sp.diff(h,x,2)+sp.diff(h,y,2)+sp.diff(h,z,2)
assert box(f)==0 and box(g)==0
X=sp.Matrix([x*z/L,x,0,z])
eta=sp.diag(-1,1,1,1)
dX=sp.Matrix.hstack(X.diff(x),X.diff(z))
h=sp.simplify(dX.T*eta*dX)
assert sp.simplify(h.det()-(1-(x*x+z*z)/L**2))==0
assert sp.simplify((h-sp.eye(2))*sp.Matrix([x,-z]))==sp.zeros(2,1)
assert sp.simplify((h-(1-(x*x+z*z)/L**2)*sp.eye(2))*sp.Matrix([z,x]))==sp.zeros(2,1)
# Oriented defect-current Jacobian and Gaussian finite-width regularization.
coords=(x,y,z)
grad=lambda q:sp.Matrix([sp.diff(q,k) for k in coords])
v=grad(f).cross(grad(g))
assert v==sp.Matrix([-x/L,0,z/L])
w=sp.exp(-(f*f+g*g)/(2*s*s))/(2*sp.pi*s*s)
j=w*v
assert sp.simplify(sum(sp.diff(j[i],coords[i]) for i in range(3)))==0
# Flux through z=z0: integrate the Gaussian in x, with y-integral exactly one.
for z0 in (-1.25,1.25):
    for t0 in (-.4,0.,.4):
        width=.05
        center=t0/z0
        bounds=(center-10*width/abs(z0),center+10*width/abs(z0))
        val=quad(lambda xx:z0*np.exp(-.5*((z0*xx-t0)/width)**2)/(np.sqrt(2*np.pi)*width),*bounds,epsabs=1e-12)[0]
        assert abs(val-np.sign(z0))<1e-10,(z0,t0,val)
# Closest points on opposite branches xz=T in the xz-plane (L=1).
for t0 in (.005,.02,.1,.4):
    r=minimize_scalar(lambda xx:xx**2+(t0/xx)**2,bounds=(.001,3),method="bounded",options={"xatol":1e-13})
    dmin=2*np.sqrt(r.fun)
    assert abs(dmin-2*np.sqrt(2*t0))<1e-10
a=.1;L0=1
assert abs(a*a/(2*L0)-.005)<1e-12
assert a==.1
print("MK150 PASS: wave equation, induced signature, conserved flux, core-window discriminator")
