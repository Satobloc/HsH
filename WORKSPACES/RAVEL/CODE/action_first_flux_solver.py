#!/usr/bin/env python3
"""Ravel 2026-10-09: local magnetic flux branch BI versus saturating exponential.
This is NOT the SAT action. Uses G=c=1, monopole F=Q²/(2r⁴), r0=1.
Requires scipy. Does not infer observations or physical photon optical metric.
"""
from math import pi,sqrt,exp
from scipy.integrate import quad
from scipy.special import gamma
def mprime(r,model,beta2):
    if model=='exp':
        return beta2*r*r*(-__import__('math').expm1(-r**-4))
    return 2*beta2/(sqrt(r**4+2)+r*r)
def msecond(r,model,beta2):
    if model=='exp':
        x=r**-4
        return beta2*r*(2*(-__import__('math').expm1(-x))-4*x*exp(-x))
    return beta2*(2*r**3/sqrt(r**4+2)-2*r)
def mass(r,model,beta2):
    return quad(lambda s:mprime(s,model,beta2),0,r,epsabs=1e-11)[0]
def K(r,model,beta2):
    m=mass(r,model,beta2)
    mp=mprime(r,model,beta2);mpp=msecond(r,model,beta2)
    f=1-2*m/r
    fp=-2*mp/r+2*m/r**2
    fpp=-2*mpp/r+4*mp/r**2-4*m/r**3
    return fpp**2+4*(fp/r)**2+4*((1-f)/r**2)**2
def Mtotal(model,beta2):
    if model=='exp':return beta2*gamma(.25)/3
    return quad(lambda r:mprime(r,model,beta2),0,float('inf'),epsabs=1e-11)[0]
def local_speed2(r,model):
    x=r**-4
    return 1-2*x if model=='exp' else 1/(1+2*x)
if __name__=='__main__':
    B=1.5;Q=sqrt(2*B)
    for model in ['exp','bi']:
        print(model,'ADM M',Mtotal(model,B))
        for r in [.15,.1,.05]:
            if model=='exp':ratio=K(r,model,B)/(32*B**2/3)
            else:ratio=K(r,model,B)*r**4/(16*B*Q**2)
            print('r',r,'center asymptotic curvature ratio',ratio)
        print('transverse characteristic speed² at r=1',local_speed2(1,model))
    print('critical exp r0 units',2**.25)
    assert abs(Mtotal('exp',1)/1-gamma(.25)/3)<1e-12
    assert local_speed2(1,'exp')<0<local_speed2(1,'bi')
