#!/usr/bin/env python3
"""MK153 sandbox: independent quadrature for integer 3D normal texture."""
import numpy as np
from scipy.integrate import quad
from scipy.optimize import minimize_scalar

pi=np.pi
def q_radial(r,a):
    return -16*a**3*r*r/(pi*(r*r+a*a)**3)
def e2_radial(r,a,k2):
    return 24*pi*k2*a*a*r*r/(r*r+a*a)**2
def e4_radial(r,a,k4):
    return 96*pi*k4*a**4*r*r/(r*r+a*a)**4

for a in (0.3,1.0,3.0):
    q=quad(q_radial,0,np.inf,args=(a,))[0]
    e2=quad(e2_radial,0,np.inf,args=(a,1))[0]
    e4=quad(e4_radial,0,np.inf,args=(a,1))[0]
    assert abs(q+1)<1e-9
    assert abs(e2-6*pi*pi*a)<1e-8
    assert abs(e4-3*pi*pi/a)<1e-8
    print('a, degree, E2, E4:',a,q,e2,e4)

k2,k4=2.3,0.7
f=lambda a:6*pi*pi*k2*a+3*pi*pi*k4/a
opt=minimize_scalar(f,bounds=(0.1,2),method='bounded')
print('minimum numerical',opt.x,'analytic',np.sqrt(k4/(2*k2)))
print('fixed-time cone boundaries r/a:',np.sqrt(2)-1,np.sqrt(2)+1)
