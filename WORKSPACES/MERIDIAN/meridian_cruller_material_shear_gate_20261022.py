#!/usr/bin/env python3
"""Native (++++), Planck-unit Cruller material-history / shear minimal pair.

SANDBOX: exact kinematics, no adopted constitutive law, optical response,
Kerr spacetime, or extra/fifth ambient dimension. Requires numpy, matplotlib.
"""
import json
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

R, omega0, omega_prime = 10., .06, .006
def omega_A(r): return omega0 + 0*r
def omega_B(r): return omega0 + omega_prime*(r-R)

def history(r, phi, w, om):
    alpha = phi + om*w
    return np.stack([r*np.cos(alpha),r*np.sin(alpha),np.zeros_like(w),w],axis=-1)

def k4E(r, om):
    return r*om**2/(1+(r*om)**2)

w=np.linspace(-30.,30.,181)
a=omega_A(R)
da=np.stack([-R*a*np.sin(a*w),R*a*np.cos(a*w),0*w,1+0*w],axis=-1)
dda=np.stack([-R*a*a*np.cos(a*w),-R*a*a*np.sin(a*w),0*w,0*w],axis=-1)
speed2=np.einsum('ij,ij->i',da,da)
acc2=np.einsum('ij,ij->i',dda,dda)
prod=np.einsum('ij,ij->i',da,dda)
knum=np.sqrt(speed2*acc2-prod**2)/speed2**1.5
assert np.allclose(knum,k4E(R,a),rtol=0,atol=1e-15)
assert np.array_equal(history(R,0.,w,omega_A(R)),history(R,0.,w,omega_B(R)))

def spatial_map(r, phi, w, om):
    angle = phi + (om(r)-omega0)*w
    return np.array([r*np.cos(angle),r*np.sin(angle)])

for t in [0.,1.,23.,50.,100.,180.]:
    for r in [9.2,10.,10.8]:
        h=1e-5
        dr=(spatial_map(r+h,.3,t,omega_B)-spatial_map(r-h,.3,t,omega_B))/(2*h)
        dp=(spatial_map(r,.3+h,t,omega_B)-spatial_map(r,.3-h,t,omega_B))/(2*h)
        g_num=np.array([[dr@dr,dr@dp],[dp@dr,dp@dp]])
        shear=r*omega_prime*t
        g_exact=np.array([[1+shear**2,r**2*omega_prime*t],
                          [r**2*omega_prime*t,r**2]])
        assert np.max(np.abs(g_num-g_exact))<2e-7
        assert abs(np.linalg.det(g_exact)-r*r)<5e-11

out={
    "status":"GEN/SANDBOX: ambient R4 curve curvature and material strain",
    "units":"Planck native, c=G=hbar=1",
    "radius_lP":R,"omega_inverse_lP":omega0,
    "omega_gradient_inverse_lP_squared":omega_prime,
    "center_speed_c":R*omega0,
    "center_acceleration_inverse_lP":R*omega0**2,
    "center_curve_curvature_inverse_lP":k4E(R,omega0),
    "rigid_D_rphi":0,
    "shearing_D_rphi_inverse_lP":R*omega_prime/2,
    "shearing_D_frobenius_inverse_lP":R*abs(omega_prime)/np.sqrt(2),
    "relative_angle_r9_r11_w100_rad":(omega_B(11)-omega_B(9))*100,
    "area_jacobian_check":"pass",
    "history_curvature_check":"pass"
}
outpath=Path(__file__).with_suffix('.json')
outpath.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))

fig,axes=plt.subplots(1,3,figsize=(15,5.25),layout='constrained')
rr=np.linspace(9,11,170)
for ax,t in zip(axes,[0,50,100]):
    for phi0 in np.arange(0,2*np.pi,np.pi/6):
        xy=np.stack([spatial_map(float(r),float(phi0),t,omega_B) for r in rr])
        ax.plot(xy[:,0],xy[:,1],lw=1.3)
        ax.plot(xy[0,0],xy[0,1],'.',ms=3)
    theta=np.linspace(0,2*np.pi,520)
    for radius in [9.,10.,11.]:
        ax.plot(radius*np.cos(theta),radius*np.sin(theta),lw=.6,alpha=.25)
    ax.set(aspect='equal',xlim=(-11.6,11.6),ylim=(-11.6,11.6),
           xlabel='x / lP',ylabel='y / lP',title=f'Material spokes: w={t} lP')
    ax.grid(alpha=.08)
fig.suptitle('Same center ring curvature, different neighboring material shear')
fig.savefig(Path(__file__).with_suffix('.png'),dpi=210)
plt.close(fig)
