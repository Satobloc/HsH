#!/usr/bin/env python3
"""Ravel 2026-10-09: GR + constant 4-form + conserved repulsive 2+1 shell.
Units G=c=1; A=m_s*N/(4*pi), B=g_s*N^2/(32*pi^2).
Source eq: sigma(n)=m_s*n+(g_s/2)*n^2, P=(g_s/2)*n^2.
Standard Israel shell, no SAT microscopic identification. Requires scipy.
"""
import math
from scipy.optimize import brentq
pi=math.pi

def shell(r,rhov,A,B):
    H2=8*pi*rhov/3
    s2=1-H2*r*r
    if s2<=0: return None
    s=math.sqrt(s2)
    sigma=A/r**2+B/r**4
    z=s-4*pi*r*sigma
    if z<=0 or z>=1: return None
    M=r*(1-z*z)/2
    pressure=B/r**4
    p_israel=((1-M/r)/z-(1-2*H2*r*r)/s)/(8*pi*r)
    return (M,p_israel-pressure,pressure,sigma)

def v_potential(r,M,rhov,A,B):
    fmin=1-8*pi*rhov*r*r/3
    fplus=1-2*M/r
    k=4*pi*(A/r+B/r**3)
    return fmin-((fmin-fplus+k*k)/(2*k))**2

def equilibria(rhov,A,B,n=600):
    rmin=.025
    rmax=.995*math.sqrt(3/(8*pi*rhov))
    logstep=math.log(rmax/rmin)/(n-1)
    samples=[rmin*math.exp(k*logstep) for k in range(n)]
    states=[shell(r,rhov,A,B) for r in samples]
    found=[]
    for i in range(n-1):
        left,right=states[i],states[i+1]
        if left is None or right is None or left[1]*right[1]>=0: continue
        R=brentq(lambda x:shell(x,rhov,A,B)[1],samples[i],samples[i+1],xtol=1e-13)
        M,err,P,sigma=shell(R,rhov,A,B)
        step=R*1e-4
        h=lambda rr:v_potential(rr,M,rhov,A,B)
        Vpp=(h(R+step)-2*h(R)+h(R-step))/step**2
        cs2=2*B/(A*R**2+2*B)
        found.append(dict(R=R,M=M,compactness=2*M/R,Vpp=Vpp,
            radial_stable=Vpp>0,has_exterior_photon_orbit=R<3*M,
            shell_sound_speed_sq=cs2,pressure_error=err,
            shell_pressure=P,shell_energy=sigma))
    return found

if __name__=='__main__':
    a,b,c=.01,.01,.1
    sols=equilibria(a,b,c)
    assert len(sols)==2
    assert sols[0]['Vpp']<0 and sols[1]['Vpp']>0
    assert sols[1]['has_exterior_photon_orbit']
    assert abs(sols[1]['pressure_error'])<1e-10
    assert 0<sols[1]['shell_sound_speed_sq']<1
    for x in sols:print(x)
    from itertools import product
    count=stable=ultra=0
    for a,b,c in product([.0001,.001,.01],[.0001,.001,.01,.1],
                         [1e-5,1e-4,.001,.01,.1,1.]):
        for x in equilibria(a,b,c,n=210):
            count+=1
            stable+=x['radial_stable']
            ultra+=x['radial_stable'] and x['has_exterior_photon_orbit']
    print('72-parameter sampled scan:',count,'equilibria;',stable,
          'radially stable;',ultra,'radially stable ultracompact')
