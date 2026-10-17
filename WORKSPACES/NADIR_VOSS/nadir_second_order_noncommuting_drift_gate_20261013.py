#!/usr/bin/env python3
"""Nadir Playground 008: exact quadratic drift under noncommuting SO(4) forcing.

Sandbox; source cursor: WORKSPACES/NADIR_VOSS/nadir_noncommuting_dyson_resonance_20261013.py.
New derivation, not a physical claim. Coordinate s is dimensionless, 0<=s<=2*pi.
t is in nm for ell=1 nm, eta dimensionless, k a positive integer.

Q'=Q(J12+2J34+eta*cos(k*s)*J23), Q(0)=I, t'=ell*Q*e1, t(0)=0.
J_ab e_a=e_b, J_ab e_b=-e_a. The unperturbed curve closes.

Writing q_a=Qe_a yields q1'=q2, q2'=-q1+eta*cos(ks)*q3,
q3'=2*q4-eta*cos(ks)*q2, q4'=-2*q3.
At first order, z=q3^(1)_1+i*q3^(1)_2 obeys
 z''+4*z=exp(i*s)*(cos(k*s)+i*k*sin(k*s)); z(0)=0,z'(0)=-i.
For integer k>=4, z=-i*sin(2s)/2 + sum A_n*F_n(s) over n=1+k,1-k,
 A_(1+k)=(1+k)/2, A_(1-k)=(1-k)/2,
 F_n=(exp(i*n*s)-cos(2s)-i*n*sin(2s)/2)/(4-n*n).
At second order x=q1^(2)_1+i*q1^(2)_2 satisfies
 x''+x=cos(k*s)*z, x(0)=x'(0)=0.
Integrating x over 0..2*pi and using Fourier orthogonality gives
 t(2*pi)/ell = eta**2*C2(k)*e1 + O(eta**3),
 C2(k)=-pi*(k*k+3)/(2*(k*k-1)*(k*k-9)) for integers k>=4.
The eta-even 12-plane channel has O(eta**4) next correction;
34-plane odd channel starts at O(eta**3). C2~ -pi/(2*k*k) for k->infinity.
Resonances k=1,2,3 are outside the stated formula.

Standard commuting control: replace J23 by J12. Then
 Qe1=exp(i*(s+eta*sin(k*s)/k)), and t(2*pi)=0 exactly for integer k>=2,
 by Fourier frequency selection. Noncommuting modulation does NOT close,
 even when first-order drift vanishes.
"""
import math
import numpy as np
from scipy.integrate import quad,solve_ivp
L=2*math.pi
def J(i,j):
 a=np.zeros((4,4));a[i,j]=-1;a[j,i]=1;return a
J12,J34,J23=J(0,1),J(2,3),J(1,2)
O0=J12+2*J34
def C2(k):
 assert isinstance(k,int) and k>=4
 return -math.pi*(k*k+3)/(2*(k*k-1)*(k*k-9))
def z1(k,s):
 def F(n):
  return (np.exp(1j*n*s)-np.cos(2*s)-.5j*n*np.sin(2*s))/(4-n*n)
 return -.5j*np.sin(2*s)+.5*(1+k)*F(1+k)+.5*(1-k)*F(1-k)
def integral_coefficient(k):
 def f(s):return (1-np.cos(s))*np.cos(k*s)*z1(k,s)
 return quad(lambda s:f(s).real,0,L,epsabs=1e-12)[0]+1j*quad(lambda s:f(s).imag,0,L,epsabs=1e-12)[0]
def run(k,eta,generator):
 def rhs(s,y):
  q=y[:16].reshape(4,4)
  return np.r_[(q@(O0+eta*np.cos(k*s)*generator)).ravel(),q[:,0]]
 y0=np.r_[np.eye(4).ravel(),np.zeros(4)]
 r=solve_ivp(rhs,(0,L),y0,method="DOP853",rtol=2e-13,atol=1e-14,max_step=.02)
 assert r.success
 return r.y[:16,-1].reshape(4,4),r.y[16:,-1]
def main():
 q0,t0=run(4,0,J23)
 assert np.linalg.norm(t0)<3e-12 and np.linalg.norm(q0-np.eye(4))<3e-12
 print("k C2_exact_nm C2_integral_nm quadrature_abs_error")
 for k in (4,5,6,8,12):
  c=C2(k);v=integral_coefficient(k)
  print(k,format(c,'.12f'),format(v.real,'.12f'),format(abs(c-v),'.3e'))
  assert abs(c-v)<3e-12
 print("eta t1_nm even_t1/eta²_nm rel_error odd_34_norm_nm commuting_norm_nm")
 errors=[]
 for eta in (.2,.1,.05,.025):
  qp,tp=run(4,eta,J23);_,tm=run(4,-eta,J23);_,tc=run(4,eta,J12)
  even=(tp+tm)/2;odd=(tp-tm)/2;rel=abs(even[0]/eta**2/C2(4)-1)
  errors.append(rel)
  print(eta,format(tp[0],'.12f'),format(even[0]/eta**2,'.12f'),format(rel,'.6e'),format(np.linalg.norm(odd[2:]),'.6e'),format(np.linalg.norm(tc),'.3e'))
  assert np.linalg.norm(qp.T@qp-np.eye(4))<1e-11
  assert np.linalg.norm(even[2:])<1e-11 and np.linalg.norm(odd[:2])<1e-11
  assert np.linalg.norm(tc)<1e-11
 assert all(3.8<errors[i]/errors[i+1]<4.2 for i in range(3))
 print("PASS: quadratic drift, commuting zero, O(eta²) coefficient convergence")
if __name__=="__main__":main()
