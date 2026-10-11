#!/usr/bin/env python3
"""Ravel SANDBOX: static thin-tube arclength spectrum, not a physical claim."""
import numpy as np, json
from pathlib import Path
t=np.arange(4096)*2*np.pi/4096
a=0.1; c=np.cos(t);s=np.sin(t);C=np.cos(2*t);S=np.sin(2*t)
r=1+a*C; r1=-2*a*S; r2=-4*a*C
v=np.column_stack((r1*c-r*s,r1*s+r*c,np.zeros_like(t)))
w=np.column_stack(((r2-r)*c-2*r1*s,(r2-r)*s+2*r1*c,np.zeros_like(t)))
sp=np.linalg.norm(v,axis=1)
cur=np.linalg.norm(np.cross(v,w),axis=1)/sp**3
L=2*np.pi*np.mean(sp)
spx=np.r_[sp,sp[0]]
arc=np.r_[0,np.cumsum((spx[:-1]+spx[1:])*np.pi/4096)]
chi=2*np.pi*arc[:-1]/arc[-1]
U=-.25*(L/(2*np.pi))**2*cur**2
def fourier(k):return (2*np.pi/L)*np.mean(U*sp*np.exp(-1j*k*chi))
def eigens(cut=14,flux=0):
    n=np.arange(-cut,cut+1)
    H=np.diag((n-flux)**2).astype(complex)
    for i,ni in enumerate(n):
        for j,nj in enumerate(n):H[i,j]+=fourier(int(ni-nj))
    ev,V=np.linalg.eigh(H)
    currents=V.conj().T@np.diag(n.astype(float))@V
    return ev,currents
ev,curm=eigens()
g=.3008057775659518
gap=ev[2]-ev[1]
S=lambda omega:0.16/((4-omega**2)**2+(2*omega)**2)
W=(2*g)**2*abs(curm[1,2])**2*S(gap)
slopes=(eigens(14,.0001)[0][:5]-eigens(14,-.0001)[0][:5])/.0002
assert np.max(abs(slopes))<1e-8
output={"status":"SANDBOX","L":L,"eigenvalues":ev[:5].tolist(),
        "split":float(gap),"N12_squared":float(abs(curm[1,2])**2),
        "slopes_flux0":slopes.tolist(),"uniform_channel_transition_W12":float(W),
        "warning":"Uniform and nonuniform Berry responses share a bath and may interfere."}
data=Path(__file__).resolve().parent.parent/"DATA"
data.mkdir(exist_ok=True)
(data/"exact_deformed_ring_spectrum.json").write_text(json.dumps(output,indent=2))
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
phis=np.linspace(-.18,.18,145)
levels=np.array([eigens(10,x)[0][:5] for x in phis])
fig,ax=plt.subplots(figsize=(8,5))
for i in range(5):ax.plot(phis,levels[:,i],label=f"level {i}")
ax.set(xlabel="geometric flux (turns)",ylabel="energy / E0",
       title="Ravel | SANDBOXED Class P | symmetry-broken ring spectrum")
ax.grid(alpha=.2);ax.legend(ncol=2)
out=Path(__file__).resolve().parent.parent/"FIGURES";out.mkdir(exist_ok=True)
fig.savefig(out/"finite_tube_avoided_spectral_crossing_class_P.png",dpi=220)
print(json.dumps(output,indent=2))
