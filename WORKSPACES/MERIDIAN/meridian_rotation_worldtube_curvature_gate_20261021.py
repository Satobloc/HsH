#!/usr/bin/env python3
"""Meridian: material-history curvature for circular 3D motion in an external Euclidean R4 comparator.

GEN/DERIVED kinematics; not an H(s)H force or metric field equation.
Default Planck units c=G=hbar=1. External coordinate q=ct; do not equate it
to the unresolved native cw=t notation. Requires numpy and matplotlib.
"""
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

R = 10.0  # Planck lengths, dimensioned illustrative control only
v = 0.6   # c=1
omega = v / R  # inverse Planck length, equivalently inverse Planck time at c=1
q = np.linspace(0, 6*np.pi/omega, 1500)  # q=ct, external comparison coordinate
x = R*np.cos(omega*q)
y = R*np.sin(omega*q)
a3 = R*omega**2
kE = R*omega**2/(1+R**2*omega**2)
kM = R*omega**2/(1-R**2*omega**2)

# Independent direct check from the curve vectors in q.
dX = np.column_stack((
    -R*omega*np.sin(omega*q),
     R*omega*np.cos(omega*q),
     np.zeros_like(q),
     np.ones_like(q)
))
ddX = np.column_stack((
    -R*omega**2*np.cos(omega*q),
    -R*omega**2*np.sin(omega*q),
    np.zeros_like(q),
    np.zeros_like(q)
))
norm = np.linalg.norm(dX, axis=1)
k_num = np.sqrt(
    np.sum(dX*dX, axis=1)*np.sum(ddX*ddX, axis=1)
    - np.sum(dX*ddX, axis=1)**2
) / norm**3
assert np.allclose(k_num, kE, rtol=0, atol=1e-12)
print(dict(R_Planck=R, v_over_c=v, omega_inverse_Planck=omega,
           a3_inverse_Planck=a3, k4E_inverse_Planck=kE,
           k4M_inverse_Planck=kM, ambient_Riemann_zero=True,
           coordinate="external q=ct; not native cw=t"))

vs = np.linspace(0, .94, 350)
fig = plt.figure(figsize=(12.5, 5.3), layout="constrained")
ax = fig.add_subplot(121, projection="3d")
ax.plot(x, y, q/R, lw=2.6)
sel = np.arange(0, len(q), max(1, len(q)//10))
for j in sel[1::2]:
    ax.quiver(x[j], y[j], q[j]/R, -x[j], -y[j], 0,
              length=.32, normalize=True, arrow_length_ratio=.24, lw=1.1)
ax.set(xlabel="x / Planck length", ylabel="y / Planck length",
       zlabel="q=ct / R", title="Marked rotating history: external 4D curve")
ax.view_init(elev=22, azim=-67)
ax.set_box_aspect((1, 1, 2.5), zoom=.9)
ax2 = fig.add_subplot(122)
ax2.plot(vs, vs**2/(1+vs**2), label="R kappa_E")
ax2.plot(vs, vs**2/(1-vs**2), label="R kappa_M (Lorentzian comparison)")
ax2.axvline(v, ls=":")
ax2.scatter([v, v], [kE*R, kM*R])
ax2.set(xlabel="Orbital speed v/c", ylabel="Dimensionless R times curvature",
        title="Same path, different arclengths", xlim=(0, .94), ylim=(0, 5))
ax2.grid(alpha=.2)
ax2.legend()
fig.suptitle("Material-history curvature is distinct from ambient Riemann curvature")
fig.savefig(Path(__file__).with_name(
    "meridian_rotation_worldtube_curvature_gate_20261021.png"
), dpi=200)
