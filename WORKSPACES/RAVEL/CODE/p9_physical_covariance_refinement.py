#!/usr/bin/env python3
"""Resolver refinement with physical log-height covariance and fixed information.

Sandbox only.  Separates two changes that the prior index-AR(1) ladder mixed:
(i) fixing correlation length in physical log h, and (ii) conserving the total
quadratic-information budget as channels are subdivided.
"""
from __future__ import annotations
import json
import numpy as np
from scipy.optimize import brentq
import support_mirror_mode_asymmetry as sm
from p9_implicit_normal_jet import implicit_response
from p9_zero_curve_continuation import HREF

COUNTS=(16,31,61,121)
STEPS=(2e-5,1e-4,2e-5)
A_BULK=.055
SIDE=1e-4
REF_N=16
GAP16=np.log(1.55/.14)/(REF_N-1)
LAMBDA_LOG=GAP16/(-np.log(sm.AR_PHI))

def grid(n): return HREF*np.geomspace(.14,1.55,n)

def trap_weights(h):
 x=np.log(np.asarray(h)); w=np.empty(len(x))
 w[0]=(x[1]-x[0])/2; w[-1]=(x[-1]-x[-2])/2
 w[1:-1]=(x[2:]-x[:-2])/2
 return w/w.sum()

def covariance_physical(h, conserve_information):
 h=np.asarray(h); x=np.log(h)
 ar=np.exp(-np.abs(x[:,None]-x[None,:])/LAMBDA_LOG)
 if conserve_information:
  w=trap_weights(h)
  d=np.sqrt((1/REF_N)/w)
  ar=d[:,None]*ar*d[None,:]
 return sm.SIGMA**2*np.kron([[1,sm.CROSS],[sm.CROSS,1]],ar)

def builder(conserve): return lambda h: covariance_physical(h,conserve)

def solve(a,h,cov):
 cache={}
 def f(o):
  k=round(float(o),13)
  if k not in cache:
   cache[k]=implicit_response(float(a),float(o),h,*STEPS,covariance_builder=cov)
  return cache[k]['F_B_over_A']
 xs=np.linspace(-.10,.05,31); fs=[f(x) for x in xs]
 pairs=[(xs[i],xs[i+1]) for i in range(len(xs)-1) if fs[i]*fs[i+1]<=0]
 if len(pairs)!=1: raise RuntimeError(f'{len(pairs)} root intervals at a={a}: {pairs}')
 r=float(brentq(f,*pairs[0],xtol=2e-9,rtol=2e-11,maxiter=50))
 return r,implicit_response(float(a),r,h,*STEPS,covariance_builder=cov)

def fit(rows):
 x=np.array([r['gap'] for r in rows]); y=np.array([r['bulk_root'] for r in rows])
 p=np.polyfit(x,y,1); q=np.polyfit(x,y,2)
 return {'linear_limit':float(p[-1]),'quadratic_limit':float(q[-1]),
         'last_bulk_increment':float(y[-1]-y[-2]),
         'last_contact_jump':float(rows[-1]['contact_jump'])}

def main():
 a0=float(grid(16)[11]-1)
 schemes={}
 for name,conserve in [('physical_gp',False),('physical_gp_fixed_budget',True)]:
  rows=[]; cov=builder(conserve)
  for n in COUNTS:
   h=grid(n)
   rb,zb=solve(A_BULK,h,cov)
   rm,zm=solve(a0-SIDE,h,cov); rp,zp=solve(a0+SIDE,h,cov)
   row={'channels':n,'gap':float(np.max(np.diff(np.log(h)))),
        'bulk_root':rb,'root_below':rm,'root_above':rp,
        'contact_jump':float(rp-rm),
        'bulk_condition':zb['hessian_condition'],
        'crossing':bool(zm['crosses_train_contact_stratum'] or zp['crosses_train_contact_stratum'])}
   rows.append(row)
   print(name,n,f'bulk={rb:+.8f}',f'jump={rp-rm:+.8f}',flush=True)
  schemes[name]={'rows':rows,'fit':fit(rows)}
 out={'status':'sandbox fixed-physics resolver audit; not canonical theory',
      'parameters':{'lambda_log_h':float(LAMBDA_LOG),'reference_channels':REF_N,
       'ar_phi_matched_at_reference':sm.AR_PHI,'contact_a':a0,'side_epsilon':SIDE,
       'budget_rule':'C_eff=D C_phys D, D_ii=sqrt((1/16)/w_i), trapezoid w sums to 1'},
      'schemes':schemes}
 with open('p9_physical_covariance_refinement.json','w') as f: json.dump(out,f,indent=2)
 print(json.dumps({k:v['fit'] for k,v in schemes.items()},indent=2))
if __name__=='__main__': main()
