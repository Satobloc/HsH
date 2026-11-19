#!/usr/bin/env python3
"""S2 measured-fit anchored SO(4) stabilizer nonidentifiability audit.
Primary input: GRAVITY Collaboration (2020), A&A 636 L5, Appendix E Table E.1.
Historical UI source: Satobloc/HsH WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py
Git blob 373d8632429e010532e6ca2589465bb90a9a3c1d.
Gauge frame is a mathematical alternative, not a physical rotor/measurement or HsH prediction.
"""
from math import sqrt
import json
import numpy as np
AU=149597870700.0  # exact SI m, IAU
GM_NOM=1.3271244e20 # IAU 2015 B3 nominal solar gravitational parameter m3/s2
C=299792458.0
INPUT={'M_million_nominal_solar':(4.261,0.012), 'R0_pc':(8246.7,9.3),
       'a_mas':(125.058,0.041), 'e':(0.884649,0.000066)}
def observed_fit_kinematics(z):
    mu=z['M_million_nominal_solar']*1e6*GM_NOM
    a=z['a_mas']*1e-3*z['R0_pc']*AU
    rp=a*(1-z['e'])
    vp=sqrt(mu*(1+z['e'])/rp)
    return {'a_AU':a/AU,'rp_AU':rp/AU,'vp_km_s':vp/1000,
            'omega_pericenter_rad_s':vp/rp,
            'period_local_angular_days':2*np.pi/(vp/rp)/86400,
            'beta':vp/C}
z={k:v[0] for k,v in INPUT.items()}
r=observed_fit_kinematics(z)
w=r['omega_pericenter_rad_s']
# At t=0, the actual S2 event has X=(ct,x,y,z)=(0,rp,0,0),
# normalized to e1; seed e0, and R0 is the proper 90-degree rotation e0->e1.
seed=np.array([1.,0.,0.,0.])
R=np.eye(4);R[0,0]=0;R[0,1]=-1;R[1,0]=1;R[1,1]=0
# Stabilizer Q(f(t)) rotates the e1-e2 plane, leaving seed e0 fixed.
# f(t) is the S2 Kepler true anomaly, with f(0)=0 and f'(0)=vp/rp.
Q=np.eye(4)
Qdot=np.zeros((4,4));Qdot[1,2]=-w;Qdot[2,1]=w
# Original UI frame and alternative R Q yield same X for all t, because Q e0=e0.
# At pericenter Q=I, yet their angular-velocity matrices differ.
delta_omega=R@Qdot@R.T
assert np.allclose(R@Q@seed,R@seed)
assert np.allclose(R.T@R,np.eye(4)) and np.linalg.det(R)>0
assert np.allclose(delta_omega+delta_omega.T,0)
assert np.isclose(np.linalg.norm(delta_omega,'fro'),sqrt(2)*w,rtol=1e-14)
assert np.isclose(np.linalg.norm(delta_omega,'fro'),np.linalg.norm(Qdot,'fro'),rtol=1e-14)
# finite one-sigma signed sensitivities from original published marginal errors
terms={}
for k,(v,sigma) in INPUT.items():
    zp=z.copy();zm=z.copy();zp[k]=v+sigma;zm[k]=v-sigma
    terms[k]=(observed_fit_kinematics(zp)['omega_pericenter_rad_s']-
              observed_fit_kinematics(zm)['omega_pericenter_rad_s'])/2
r['omega_independent_marginal_error_proxy_rad_s']=sqrt(sum(x*x for x in terms.values()))
r['delta_omega_frobenius_rad_s']=float(np.linalg.norm(delta_omega,'fro'))
r['delta_omega_frobenius_independent_error_proxy_rad_s']=sqrt(2)*r['omega_independent_marginal_error_proxy_rad_s']
r['gauge_generator_matrix_rad_s']=delta_omega.tolist()
r['signed_marginal_error_terms_rad_s']=terms
r['status']='Real S2 orbital-fit anchor; SO(4) gauge witness is a mathematical construction; no measured spin, no HsH physical prediction; full covariance missing.'
r['primary_paper']='GRAVITY Collaboration 2020 A&A 636 L5, DOI 10.1051/0004-6361/202037813, Appendix E Table E.1'
r['input_fit_marginals']=INPUT
print(json.dumps(r,indent=2))
