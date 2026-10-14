#!/usr/bin/env python3
"""Alberr-source-reconstructed first-principles Householder holonomy gate.
2026-10-14 s2. GEN/DERIVED mathematical sandbox; no physical claim.

Euclidean delta in four dimensions; coordinates and a in metres.
u_a=(x,y,a,0)/sqrt(x*x+y*y+a*a), a>0; g=delta-2u_a tensor u_a.
In (r,phi,z,w):
g_rr=(a²-r²)/(a²+r²), g_rz=-2ar/(a²+r²),
g_zz=(r²-a²)/(a²+r²), g_phi,phi=r², g_ww=1.
g is Lorentzian and smooth everywhere for a>0; the z=w=0 pullback
alone is degenerate at r=a. The 4D scalar curvature is
R=4a²(3a²-r²)/(a²+r²)^3, with units m^-2.

For a constant-r phi-loop, the parallel transport generator
A^i_j=Gamma^i_{phi j}, i,j=(r,phi,z), has eigenvalues
0, ±sqrt((r²-a²)/(r²+a²)).
Thus the holonomy exp(-2pi A) is elliptic for r<a, parabolic at r=a,
hyperbolic for r>a, without any singularity or quantized dynamics.
For a=0, r>0, g=-dr²+r²dphi²+dz²+dw²: locally flat with
nontrivial boost holonomy of rapidity 2pi. Euclidean polar comparison
has identity holonomy. This is a counterexample to treating a holonomy
class change as proof of a physical transition.
"""
import math
import numpy as np
import sympy as sp
from scipy.linalg import expm
from scipy.integrate import solve_ivp

def curvature(r,a):
    return 4*a*a*(3*a*a-r*r)/(a*a+r*r)**3

def generator(r,a):
    q=r*r+a*a
    return np.array([[0.,r*(r*r-a*a)/q,0.],
                     [1./r,0.,0.],
                     [0.,2*a*r*r/q,0.]])

def analytic_trace(r,a):
    s=(r*r-a*a)/(r*r+a*a)
    return 1+2*(math.cosh(2*math.pi*math.sqrt(s)) if s>=0 else
                math.cos(2*math.pi*math.sqrt(-s)))

def verify_curvature_symbolically():
    r,a=sp.symbols('r a', positive=True, real=True)
    q=r*r+a*a
    g=sp.Matrix([[(a*a-r*r)/q,0,-2*a*r/q],
                 [0,r*r,0],
                 [-2*a*r/q,0,(r*r-a*a)/q]])
    gi=sp.simplify(g.inv())
    coords=[r,sp.Symbol('phi'),sp.Symbol('z')]
    C=[[[sp.simplify(sum(gi[i,k]*(sp.diff(g[k,j],coords[l])
         +sp.diff(g[k,l],coords[j])-sp.diff(g[j,l],coords[k]))
         for k in range(3))/2) for l in range(3)]
         for j in range(3)] for i in range(3)]
    Ric=sp.Matrix(3,3,lambda i,j:sp.factor(sum(
        sp.diff(C[k][i][j],coords[k])-sp.diff(C[k][i][k],coords[j])
        +sum(C[k][i][j]*C[l][k][l]-C[l][i][k]*C[k][j][l]
             for l in range(3)) for k in range(3))))
    R=sp.factor(sp.trace(gi*Ric))
    assert sp.simplify(R-4*a*a*(3*a*a-r*r)/q**3)==0
    assert sp.simplify(g.det()+r*r)==0
    return str(R)

def main():
    print('symbolic_R:',verify_curvature_symbolically())
    a=0.25
    print('a_m=',a)
    print('r_m,class,R_m^-2,holonomy_trace,ODE_error')
    for ratio in (0.5,1.,2.,4.,8.):
        r=a*ratio
        A=generator(r,a)
        H=expm(-2*math.pi*A)
        ode=solve_ivp(lambda t,v:(-A@v.reshape(3,3)).reshape(9),
                      (0,2*math.pi),np.eye(3).reshape(9),
                      method='DOP853',rtol=1e-12,atol=1e-13)
        err=np.max(np.abs(H-ode.y[:,-1].reshape(3,3)))
        assert err<3e-8
        assert abs(np.trace(H)-analytic_trace(r,a))<3e-10
        q=r*r+a*a
        g=np.array([[(a*a-r*r)/q,0.,-2*a*r/q],
                    [0.,r*r,0.],[-2*a*r/q,0.,(r*r-a*a)/q]])
        assert np.max(np.abs(H.T@g@H-g))<3e-9
        kind='elliptic' if r<a else 'parabolic' if r==a else 'hyperbolic'
        print(f'{r:.6f},{kind},{curvature(r,a):.9f},{np.trace(H):.9f},{err:.2e}')
        if r==a:
            assert np.linalg.norm(H-np.eye(3))>1
            assert abs(np.linalg.det(g)+r*r)<1e-12
    H0=expm(-2*math.pi*generator(1.,0.))
    assert abs(np.trace(H0)-(1+2*math.cosh(2*math.pi)))<1e-10
    E=np.array([[0.,-1.,0.],[1.,0.,0.],[0.,0.,0.]])
    assert np.max(np.abs(expm(-2*math.pi*E)-np.eye(3)))<1e-13
    assert abs(curvature(0,a)-12/a**2)<1e-10
    assert abs(curvature(math.sqrt(3)*a,a))<1e-12
    print('a=0 flat puncture trace=',np.trace(H0))
    print('Euclidean polar trace=3, identity; all checks passed')

if __name__=='__main__':
    main()
