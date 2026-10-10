"""Mercer SAT/H(s)H ring-load Green-function test; LOCAL:MERCER-RING-LOAD-20261010.
A mathematical benchmark, NOT an ER/Kerr solution or an EM model.
"""
import numpy as np
from scipy.special import ellipk

N=16384
phi=2*np.pi*np.arange(N)/N

def h_ring(x, radius=1.):
    source=np.array([radius*np.cos(phi),radius*np.sin(phi),np.zeros(N)]).T
    return np.mean(1/np.linalg.norm(source-np.asarray(x),axis=1))

def ring_to_point(z, a=1.):
    return (1+(a/z)**2)**(-1.5)

def ring_to_ring(z, a=1.):
    return np.mean((1+4*(a/z)**2*np.sin(phi/2)**2)**(-1.5))

for rho in (1.2,2.,5.,10.,20.):
    k2=4*rho/(1+rho)**2
    exact=2*ellipk(k2)/(np.pi*(rho+1))
    assert abs(h_ring([rho,0,0])-exact)/exact<1e-12

for z in (1.,2.,5.,10.,20.,50.):
    print(f'z/a={z:g}: point-probe={ring_to_point(z):.10f}, ring-probe={ring_to_ring(z):.10f}')

# Ring multipole h=(Q/4piT)/r * [1+a²(1−3cos²θ)/(4r²)+O(r^-4)]
for r in (10.,20.,40.):
    for theta in (0.,np.pi/4,np.pi/2):
        exact=r*h_ring([r*np.sin(theta),0,r*np.cos(theta)])-1
        quadrupole=(1-3*np.cos(theta)**2)/(4*r*r)
        assert abs(exact-quadrupole)<0.4/r**4

# Balanced coaxial +Q and -Q rings: monopole and dipole cancel.
a,b=1.,1.5
for z in (10.,20.,40.):
    h=1/np.sqrt(z*z+a*a)-1/np.sqrt(z*z+b*b)
    leading=(b*b-a*a)/(2*z**3)
    assert abs(h/leading-1)<0.04
print('PASS: ring Green function, far-field quadrupole, balanced-load scaling')
