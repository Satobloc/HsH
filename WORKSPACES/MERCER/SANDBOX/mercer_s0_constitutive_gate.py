#!/usr/bin/env python3
"""Mercer s0 2026-10-15 06Z: 4D finite-core bending/tension threshold sandbox."""
import json
from pathlib import Path
import numpy as np
from scipy.integrate import simpson
from scipy.optimize import brentq
import matplotlib.pyplot as plt
OUT=Path(__file__).resolve().parent
ell,B,tau=1.0,1.0,1.0  # m, J*m, J/m
H=np.sqrt(3)*ell/2
T=3*np.pi*H/2
u=np.linspace(0,1,32769)
th=np.pi*(3*u*u-2*u*u*u)
p=6*np.pi*u*(1-u)
pp=6*np.pi*(1-2*u)
S=T*T+H*H*p*p
Q=H*H*(p**4+pp**2)
D=H*H*p*pp
v0=np.sqrt(S)
kappa0=np.sqrt(Q/S**2-D**2/S**3)
L0=simpson(v0,x=u)
E0=B*simpson(Q/S**1.5-D**2/S**2.5,x=u)/2
def geom(n,A):
    k=2*np.pi*n
    sn,cs=np.sin(k*u),np.cos(k*u)
    v2=S+(A*k*cs)**2
    a2=Q+(A*k*k*sn)**2
    va=D-A*A*k**3*cs*sn
    kap=np.sqrt(np.maximum(0,a2/v2**2-va**2/v2**3))
    length=simpson(np.sqrt(v2),x=u)
    bending=B*simpson(a2/v2**1.5-va**2/v2**2.5,x=u)/2
    return float(np.max(kap)),float(length),float(bending)
def stiffness(n):
    k=2*np.pi*n
    sn,cs=np.sin(k*u),np.cos(k*u)
    integrand=(k**4*sn**2/S**1.5
        -1.5*Q*k*k*cs**2/S**2.5
        +2*D*k**3*cs*sn/S**2.5
        +2.5*D**2*k*k*cs**2/S**3.5)
    kb=B*simpson(integrand,x=u)
    kt=tau*simpson(k*k*cs**2/np.sqrt(S),x=u)
    return float(kb),float(kt)
c_of_u=S/(4*np.pi**2)*np.sqrt(np.maximum(0,4/ell**2-kappa0**2))
cstar=float(np.min(c_of_u))
I3=float(simpson(S**-1.5,x=u))
I1=float(simpson(S**-0.5,x=u))
E_limit=B*(2*np.pi)**4*cstar**2*I3/4
print("MODEL ell=1 m, B=1 J*m, tau=1 J/m, core radius ell/2")
print(f"L0={L0:.12f} m, E_B0={E0:.12f} J, max_kappa0={max(kappa0):.12f} 1/m")
print(f"cstar_grid={cstar:.12f} m, min_u={u[np.argmin(c_of_u)]:.8f}")
print(f"I3={I3:.12f} m^-3, Ecritical_limit={E_limit:.12f} J")
print(" n    n^2*Acrit(m)    dE_B(J)       dE_T(J)       K_B(J/m^2)      K_T(J/m^2)")
rows=[]
for n in [2,4,8,16,32,64]:
    def f(A):return geom(n,A)[0]-2/ell
    upper=2*cstar/n**2
    while f(upper)<0: upper*=2
    ac=brentq(f,0.,upper,xtol=1e-15,rtol=1e-13)
    km,l,b=geom(n,ac)
    kb,kt=stiffness(n)
    dEb=b-E0
    dEt=tau*(l-L0)
    rows.append(dict(n=n,Acrit_m=ac,n2_Acrit_m=n*n*ac,dEb_J=dEb,
                     dEt_J=dEt,Kb_J_per_m2=kb,Kt_J_per_m2=kt,
                     kmax_per_m=km))
    print(f"{n:2d} {n*n*ac:15.9f} {dEb:14.9f} {dEt:14.9f} {kb:17.5f} {kt:17.5f}")
assert max(kappa0)<2/ell
for n in [2,8,32]:
    kmax,L,E=geom(n,0)
    assert abs(kmax-max(kappa0))<1e-12
    assert abs(L-L0)<1e-12 and abs(E-E0)<1e-12
    A=1e-5/n**2
    kb,kt=stiffness(n)
    _,L,E=geom(n,A)
    quadratic=0.5*(kb+kt)*A*A
    exact=(E-E0)+tau*(L-L0)
    assert abs(exact/quadratic-1)<1e-4,(n,exact/quadratic)
for r in rows:
    assert abs(r["kmax_per_m"]-2/ell)<1e-8
    assert r["Acrit_m"]<T/(2*np.pi*r["n"])
tension_limit=tau*(2*np.pi)**2*cstar**2*I1/4
assert abs(rows[-1]["dEt_J"]*64**2/tension_limit-1)<0.01
assert rows[-1]["dEb_J"]>0 and rows[-1]["dEt_J"]<rows[0]["dEt_J"]
print("CONTROLS: zero amplitude, quadratic stiffness, six curvature roots, no-double-normal, tension-only decay PASS")
print(f"tension n^2*energy limit={tension_limit:.12f} J")
print(f'n=64: bending-to-limit ratio={rows[-1]["dEb_J"]/E_limit:.9f}, tension-to-bending={rows[-1]["dEt_J"]/rows[-1]["dEb_J"]:.9f}')
with (OUT/"mercer_s0_constitutive_results.json").open("w") as fp:
    json.dump(dict(ell_m=ell,B_Jm=B,tau_J_per_m=tau,cstar_m=cstar,
                   Ecritical_limit_J=E_limit,rows=rows),fp,indent=2)
ns=np.array([r["n"] for r in rows])
eb=np.array([r["dEb_J"] for r in rows])
et=np.array([r["dEt_J"] for r in rows])
fig,ax=plt.subplots(figsize=(7,4.6))
ax.plot(ns,eb,"o-",label="Bending increment at curvature threshold")
ax.plot(ns,et,"s-",label="Tension increment at curvature threshold")
ax.axhline(E_limit,linestyle="--",label="Asymptotic bending limit")
ax.set(xscale="log",xlabel="Harmonic n (dimensionless)",
       ylabel="Excess energy (J)",title="Class P: 4D tube, curvature cap 2/ell")
ax.set_xticks(ns)
ax.set_xticklabels([str(n) for n in ns])
ax.grid(True,alpha=.25)
ax.legend(fontsize=8)
fig.tight_layout()
fig.savefig(OUT/"mercer_s0_constitutive_gate.png",dpi=180)
