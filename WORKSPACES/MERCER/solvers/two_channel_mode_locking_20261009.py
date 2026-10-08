#!/usr/bin/env python3
"""Mercer LOCAL sandbox: two-channel static/dynamic Green function verification."""
import numpy as np
from scipy.integrate import quad
from scipy.linalg import eigh

Ks,Kf,rhos,rhof,g=4.,1.,4.,1.,.2
Ksum=Ks+Kf
Kred=Ks*Kf/Ksum
ell=np.sqrt(Kred/g)
gap=np.sqrt(g*(1/rhos+1/rhof))
c=np.sqrt(Ksum/(rhos+rhof))
assert np.isclose(ell*gap,c)
for k in np.linspace(0,3,301):
    H=np.array([[Ks*k*k+g,-g],[-g,Kf*k*k+g]])
    vals=eigh(H,np.diag([rhos,rhof]),eigvals_only=True)
    assert np.allclose(vals,[c*c*k*k,c*c*k*k+gap*gap],atol=2e-14)
for r in [0.7,2.,7.]:
    m=1/ell
    integral,_=quad(lambda k:k/(k*k+m*m),0,np.inf,weight="sin",wvar=r,epsabs=1e-11,limit=400)
    num=(Ks/Kf)*integral/(2*np.pi**2*Ksum*r)
    exact=(Ks/Kf)*np.exp(-r/ell)/(4*np.pi*Ksum*r)
    assert abs(num-exact)<1e-8
for x in [0.1,1.,3.,10.]:
    factor=(1+x)*np.exp(-x)
    print(x,1+(Kf/Ks)*factor,1+(Ks/Kf)*factor,1-factor)
print("passed",ell,gap,c)
