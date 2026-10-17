#!/usr/bin/env python3
"""Ravel SANDBOX 2026-10-11: finite-core normal holonomy and mode-leakage control.
Runs: python WORKSPACES/RAVEL/CODE/geometric_holonomy_backreaction.py
Requires numpy, matplotlib. Outputs JSON and a script-generated Class P figure.
No inferred particle constants, no HsH physical authority.
"""
import json
import math
from pathlib import Path
import numpy as np

R, A, B_VIEW, CORE = 1.0, 0.1, 0.12, 0.04
M, K, GAMMA, KBT = 1.0, 4.0, 2.0, 0.04
E0_OVER_HBAR, ELL = 1.0, 1
Q = 4096
T = 2*np.pi*np.arange(Q)/Q
ROOT = Path(__file__).resolve().parent.parent
DATA_DIR, FIG_DIR = ROOT/"DATA", ROOT/"FIGURES"
DATA_DIR.mkdir(exist_ok=True)
FIG_DIR.mkdir(exist_ok=True)

def geometry(t, a, b, R=R):
    c,s=np.cos(t),np.sin(t); C,S=np.cos(2*t),np.sin(2*t)
    er=np.stack((c,s,np.zeros_like(c)),1)
    et=np.stack((-s,c,np.zeros_like(c)),1)
    ez=np.zeros_like(er);ez[:,2]=1
    r0=R+a*C; r1=-2*a*S; r2=-4*a*C; r3=8*a*S
    z=b*S;z1=2*b*C;z2=-4*b*S;z3=-8*b*C
    x=r0[:,None]*er+z[:,None]*ez
    v=r1[:,None]*er+r0[:,None]*et+z1[:,None]*ez
    w=(r2-r0)[:,None]*er+(2*r1)[:,None]*et+z2[:,None]*ez
    j=(r3-3*r1)[:,None]*er+(3*r2-r0)[:,None]*et+z3[:,None]*ez
    pb=2*C[:,None]*ez
    vnorm=np.linalg.norm(v,axis=1); cp=np.cross(v,w)
    kappa=np.linalg.norm(cp,axis=1)/vnorm**3
    tau=np.sum(cp*j,axis=1)/np.sum(cp**2,axis=1)
    fb=-np.sum(v*np.cross(pb,w),axis=1)/vnorm**3
    return x,vnorm,kappa,tau,fb

def integrate(f):return float(np.mean(f)*2*np.pi)
def evaluate(a,b):
    x,speed,kappa,tau,fb=geometry(T,a,b)
    return integrate(tau*speed),integrate(speed),float(kappa.max()),fb

def S_b(omega):
    return 2*GAMMA*KBT/((K-M*omega**2)**2+(GAMMA*omega)**2)

def main():
    h0,length,k0,F=evaluate(A,0)
    eps=1e-5
    hprime=(evaluate(A,eps)[0]-evaluate(A,-eps)[0])/(2*eps)
    g=hprime/(2*np.pi)
    zero_noise=S_b(0)
    dephase=0.5*(2*E0_OVER_HBAR*ELL*g)**2*zero_noise
    fourier=np.fft.fft(F)/Q
    rates={}
    for j in range(1,13):
        frequency=j*j*E0_OVER_HBAR
        single=ELL**2*abs(fourier[j]/j)**2*frequency**2*S_b(frequency)
        rates[str(j)]=float(2*single)
    leak2=rates["2"]
    x_draw,_,k_draw,_,_=geometry(T,A,B_VIEW)
    _,splus,kplus,_,_=geometry(T,A,eps)
    _,sminus,kminus,_,_=geometry(T,A,-eps)
    assert abs(integrate(F)-hprime)<5e-5
    assert abs(h0)<1e-12
    assert CORE*max(k0,k_draw)<1
    assert np.max(np.abs((splus-sminus)/(2*eps)))<1e-8
    assert np.max(np.abs((kplus-kminus)/(2*eps)))<1e-8
    assert dephase>0 and min(rates.values())>=0
    result={
        "status":"sandbox_fixture_not_HsH_gravity",
        "R":R,"a":A,"b_display":B_VIEW,"core_radius":CORE,
        "samples":Q,"length_b0":length,"holonomy_b0":h0,
        "holonomy_derivative_fd":hprime,
        "holonomy_derivative_integral_F":integrate(F),
        "small_amplitude_formula_6pi_a_over_R2":6*np.pi*A/R**2,
        "phi_prime":g,
        "F_fourier_real":{"0":float(fourier[0].real),
                          "2":float(fourier[2].real),
                          "4":float(fourier[4].real),
                          "6":float(fourier[6].real)},
        "max_core_times_curvature":CORE*max(k0,k_draw),
        "bath":{"M":M,"K":K,"Gamma":GAMMA,"kBT":KBT,
                "variance_b":KBT/K,"S_b_at_zero":zero_noise},
        "D_hol":dephase,"W_leak_pm2":leak2,
        "W_leak_all_1_to_12":sum(rates.values()),
        "leakage_over_dephasing":leak2/dephase,
        "n1_reactive_force_at_origin":2*E0_OVER_HBAR*ELL*g,
        "static_susceptibility":1/K,
        "negative_a0_dphi_db":(evaluate(0,eps)[0]-evaluate(0,-eps)[0])/(4*np.pi*eps),
        "negative_ell0_D_and_W":[0,0],
    }
    (DATA_DIR/"geometric_holonomy_backreaction.json").write_text(
        json.dumps(result,indent=2)+"\n",encoding="utf-8")
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    fig=plt.figure(figsize=(12,5),layout="constrained")
    ax=fig.add_subplot(121,projection="3d")
    flat=geometry(T,A,0)[0]
    ax.plot(*flat.T,ls="--",label="reference b=0")
    ax.plot(*x_draw.T,label="out-of-plane b=0.12")
    ax.set(xlabel="x/R",ylabel="y/R",zlabel="z/R",
           title="Exact centerline geometry")
    ax.set_box_aspect((2.2,2.2,.6));ax.view_init(elev=25,azim=-58)
    ax.legend(fontsize=8)
    bx=fig.add_subplot(122)
    bx.plot(T,F,label="Berry transport curvature")
    bx.axhline(g,ls="--",label="loop mean")
    bx.set(xlabel="theta (radians)",ylabel="F_btheta",
           title="Local harmonics versus holonomy")
    bx.legend(fontsize=8)
    fig.suptitle("Ravel | finite-core transport | SANDBOXED Class P")
    fig.savefig(FIG_DIR/"finite_tube_transport_class_P.png",dpi=220)
    print(json.dumps(result,indent=2))

if __name__=="__main__":main()
