#!/usr/bin/env python3
"""Aster s2, 2026-10-14 23Z: second harmonic rescues centered phase.
GEN/DERIVED geometry only; not a SAT/H(s)H physical assertion.
Checkpoint: WORKSPACES/ASTER/aster_phase_gauge_vector_gate_20261014.py

h(t)=1{|A sin(t-alpha)-d|<=a}, A,d,a in meters, t,alpha in radians.
M_n=<h exp(i*n*t)> over [0,2*pi).
L=clip((d-a)/A,-1,1), U=clip((d+a)/A,-1,1).
M0=(asin(U)-asin(L))/pi;
M1=i*(sqrt(1-L²)-sqrt(1-U²))/pi * exp(i*alpha);
M2=(U*sqrt(1-U²)-L*sqrt(1-L²))/pi * exp(2i*alpha).
For d=0, 0<a<A: M1=0, |M2|=sin(pi*M0)/pi>0.
Therefore alpha=arg(M2)/2 mod pi; sigma_alpha≈sigma/(2|M2|).
Standard comparator: Fourier symmetry selection rule for pi-periodic gates.
Counterexample: first harmonic loses alpha at d=0; full saturation
(a>=A,d=0) loses alpha at every harmonic.
"""
import math, json
import numpy as np
P=math.pi
def moments(A,d,a,alpha):
    if A<=0 or a<0: raise ValueError("A>0,a>=0")
    L=float(np.clip((d-a)/A,-1,1))
    U=float(np.clip((d+a)/A,-1,1))
    if L>=U: return 0.,0j,0j
    f=(math.asin(U)-math.asin(L))/P
    m=(math.sqrt(1-L*L)-math.sqrt(1-U*U))/P
    q=(U*math.sqrt(1-U*U)-L*math.sqrt(1-L*L))/P
    return f,1j*m*np.exp(1j*alpha),q*np.exp(2j*alpha)
def wrap(x,period): return (x+period/2)%period-period/2
def main():
    A=math.sin(.246); a=.1; alpha=.73; sigma=1e-4
    center=moments(A,0,a,alpha)
    near=moments(A,.001,a,alpha)
    assert abs(center[1])<1e-15
    assert abs(abs(center[2])-math.sin(P*center[0])/P)<1e-14
    assert abs(wrap(np.angle(center[2])/2-alpha,P))<1e-14
    assert max(abs(near[k]-moments(A,-.001,a,alpha+P)[k]) for k in range(3))<1e-14
    assert moments(A,0,0,alpha)==(0.,0j,0j)
    assert abs(moments(A,0,A,alpha)[2])<1e-14
    s=a/A; slope=2*s/(P*A*math.sqrt(1-s*s))
    assert abs(abs(moments(A,1e-6,a,alpha)[1])/(slope*1e-6)-1)<1e-8
    N=1_000_003; t=2*P*np.arange(N)/N
    h=np.abs(A*np.sin(t-alpha))<=a
    quadrature=[np.mean(h),np.mean(h*np.exp(1j*t)),np.mean(h*np.exp(2j*t))]
    qerr=max(abs(center[i]-quadrature[i]) for i in range(3))
    assert qerr<2e-6
    rng=np.random.default_rng(202610142326); n=120000
    z=lambda: sigma*(rng.standard_normal(n)+1j*rng.standard_normal(n))
    e1=wrap(np.angle(near[1]+z())-P/2-alpha,2*P)
    e2=wrap(np.angle(near[2]+z())/2-alpha,P)
    measured=[float(np.std(e1,ddof=1)),float(np.std(e2,ddof=1))]
    predicted=[sigma/abs(near[1]),sigma/(2*abs(near[2]))]
    assert max(abs(measured[i]/predicted[i]-1) for i in range(2))<.025
    print(json.dumps(dict(A_m=A,a_m=a,alpha_rad=alpha,center_f=center[0],
        center_abs_M1=abs(center[1]),center_abs_M2=abs(center[2]),
        near_d_m=.001,near_abs_M1=abs(near[1]),near_abs_M2=abs(near[2]),
        predicted_sigma_alpha_rad=predicted,MC_sigma_alpha_rad=measured,
        MC_ratio=measured[0]/measured[1],MC_draws=n,
        quadrature_error=qerr),indent=2))
    print("PASS: centered phase recovered modulo pi from second harmonic")
if __name__=="__main__": main()
