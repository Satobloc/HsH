"""Class P source-located geometry plate for a proposed Kerr-like singular support.
No dynamics, physical ontology, core scale, or standard-physics identity is inferred.
Install numpy and matplotlib to render: python tools/render_mercer_kerr_active_slab_class_p.py
"""
from __future__ import annotations
import argparse
import math
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

p=argparse.ArgumentParser(description=__doc__)
p.add_argument("--out",type=Path,default=Path("mercer_hsh_kerr_slab_geometry_class_p.png"))
a=p.parse_args()

radius=1.0
phi=np.linspace(0,2*math.pi,360)
w=np.linspace(-1,1,61)
P,W=np.meshgrid(phi,w)
X=radius*np.cos(P)
Y=radius*np.sin(P)
fig=plt.figure(figsize=(12,5.2),layout="constrained")
ax=fig.add_subplot(121,projection="3d")
ax.plot_surface(X,Y,W,alpha=.17,edgecolor="none")
ax.plot(radius*np.cos(phi),radius*np.sin(phi),np.zeros_like(phi),linewidth=2.2,label="intersection: S¹ at w=0")
ax.plot_wireframe(X[::12,::30],Y[::12,::30],W[::12,::30],linewidth=.5,alpha=.5)
ax.set(xlabel="x/a",ylabel="y/a",zlabel="w/a",title="P1: ring worldsheet S¹ × R\nintersection with 3D timesheet w=0")
ax.set_box_aspect((1,1,1.05));ax.view_init(elev=20,azim=-60)

ax2=fig.add_subplot(122)
slab=1.0
s=np.linspace(0,slab,300)
ax2.fill_betweenx(s,-s,s,alpha=.18,label="locally reachable at c")
ax2.plot(s,s,linestyle="--",linewidth=1.5)
ax2.plot(-s,s,linestyle="--",linewidth=1.5)
ax2.axhline(slab,linewidth=1.2,label="end of active slab")
ax2.set(xlim=(-1.25,1.25),ylim=(0,1.15),xlabel="spatial separation x / Δw",
        ylabel="wavefront advance / Δw",title="P2: local light cone in active slab\nmax |x| = Δw = c Δt")
ax2.legend(loc="upper left",fontsize=8);ax2.set_aspect("equal",adjustable="box")
fig.suptitle("H(s)H scratch geometry: analytic dimension/causality checks, not a particle model")
assert np.max(np.abs(radius**2-X**2-Y**2)) < 1e-12
assert not (2.0<=slab)
a.out.parent.mkdir(parents=True,exist_ok=True)
fig.savefig(a.out,dpi=170,bbox_inches="tight")
print("PASS:",a.out)
