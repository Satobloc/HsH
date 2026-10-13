#!/usr/bin/env python3
"""TERN | 2026-10-13 18:24Z | SAT/H(s)H SANDBOX, NOT PHYSICAL CLAIM.
Source checkpoint: WORKSPACES/TERN/MK171_VS_SUSSKIND_TECHNICAL_REVIEW_2026-10-11.md.
Test whether the Householder director's Z2 loop can be inferred from AB U(1).

u_q(theta)=(cos(q theta),sin(q theta),0,0), P=uu^T, g=I-2P.
q half integer gives periodic g but u(2pi)=-u(0); projective Z2=-1.
q integer has oriented periodic u, Z2=+1. g has signature (-,+,+,+).
For annulus a<=r<=b, chosen Dirichlet energy per axial length:
E/L=(kappa/2) int ||grad P||_F^2 dA
   =2*pi*kappa*q^2*ln(b/a), kappa in J/m.
Equivalent standard planar nematic Frank energy pi*K*q^2*ln(b/a)
with K=2*kappa. a->0 yields logarithmic defect divergence.
This test functional is not derived from SAT/H(s)H dynamics.

At a=1nm, b=1um, kappa=1e-12 J/m:
q=0:   0 J/m, holonomy +1
q=1/2: 1.085067661862e-11 J/m, holonomy -1
q=1:   4.340270647449e-11 J/m, holonomy +1

Independent AB counterexample: with q=0 (constant time-normal),
standard ideal electron ring of radius 100nm has alpha=0 revival
1.085482183119 ns, alpha=1/2 revival 0.542741091559 ns.
Thus AB factor-two return does not require projective Z2 winding.
Conversely q=1/2 with alpha=0 has Z2=-1 but no AB flux shift.
No coupling between these mathematical structures has been derived.
"""
import math
import numpy as np
pi=math.pi
kappa=1e-12; a=1e-9; b=1e-6
def P(theta,q):
    u=np.stack([np.cos(q*theta),np.sin(q*theta),
                np.zeros_like(theta),np.zeros_like(theta)],axis=-1)
    return u[..., :, None]*u[..., None, :]
def energy(q): return 2*pi*kappa*q*q*math.log(b/a)
def fd(q,n):
    p=P(2*pi*np.arange(n)/n,q)
    d=(np.roll(p,-1,axis=0)-np.roll(p,1,axis=0))/(4*pi/n)
    return .5*kappa*math.log(b/a)*(2*pi/n)*np.sum(d*d)
def z2(q,n=256):
    t=2*pi*np.arange(n)/n
    u=np.stack((np.cos(q*t),np.sin(q*t)),axis=1)
    overlap=np.sum(u*np.roll(u,-1,axis=0),axis=1)
    return int(np.prod(np.sign(overlap)))
for q in (0,.5,1,1.5):
    assert z2(q)==(-1 if (2*q)%2 else 1)
    if q:
        assert abs(fd(q,1024)/energy(q)-np.sinc(4*q/1024)**2)<1e-12
    print(q,z2(q),f'{energy(q):.12e}',f'{fd(q,1024):.12e}')
g=np.eye(4)-2*P(np.array(0.3),.5)
assert np.allclose(g@g,np.eye(4))
assert np.allclose(np.linalg.eigvalsh(g),[-1,1,1,1])
m=9.1093837139e-31; hbar=1.054571817e-34; R=100e-9
T0=4*pi*m*R*R/hbar
T_half=T0/2
print('AB control ns:',T0*1e9,T_half*1e9)
print('PASS: Z2/Householder/Frank/finite-difference/AB independence')
