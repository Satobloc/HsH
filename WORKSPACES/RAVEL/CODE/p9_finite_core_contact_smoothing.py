#!/usr/bin/env python3
"""Finite-width contact discriminator for the P9 readout.

LOCAL:P9_SMOOTH_CONTACT uses softplus smoothing of x_+ with local width
h*sigma_c.  sigma_c is dimensionless and approximates a width in log h.
This is a declared toy readout, not a carrier law.
"""
from __future__ import annotations
import json
import numpy as np
from scipy.optimize import brentq
from p9_implicit_normal_jet import implicit_response
from p9_physical_covariance_refinement import grid,builder

COUNTS=(31,61,121)
WIDTHS=(.02,.08)
STEPS=(2e-5,1e-4,2e-5)
A_BULK=.055
SIDE=1e-4

def solve(a,h,cov,width):
 cache={}
 def f(o):
  k=round(float(o),13)
  if k not in cache:
   cache[k]=implicit_response(float(a),float(o),h,*STEPS,
      covariance_builder=cov,contact_width=width)
  return cache[k]['F_B_over_A']
 xs=np.linspace(-.10,.05,31); fs=[f(x) for x in xs]
 pairs=[(xs[i],xs[i+1]) for i in range(len(xs)-1) if fs[i]*fs[i+1]<=0]
 if len(pairs)!=1: raise RuntimeError(f'{len(pairs)} roots: a={a}, width={width}, {pairs}')
 r=float(brentq(f,*pairs[0],xtol=2e-9,rtol=2e-11,maxiter=50))
 return r,cache

def main():
 cov=builder(True); a0=float(grid(16)[11]-1); rows=[]
 for width in WIDTHS:
  for n in COUNTS:
   h=grid(n); gap=float(np.max(np.diff(np.log(h))))
   rb,_=solve(A_BULK,h,cov,width)
   rm,_=solve(a0-SIDE,h,cov,width); rp,_=solve(a0+SIDE,h,cov,width)
   row={'contact_width':width,'channels':n,'gap':gap,'gap_over_width':gap/width,
        'bulk_root':rb,'below':rm,'above':rp,'jump':rp-rm}
   rows.append(row); print(width,n,f'bulk={rb:+.8f}',f'jump={rp-rm:+.3e}',flush=True)
 eps_rows=[]; width=.08; n=121; h=grid(n)
 for eps in (2e-4,1e-4,5e-5):
  rm,_=solve(a0-eps,h,cov,width); rp,_=solve(a0+eps,h,cov,width)
  eps_rows.append({'contact_width':width,'channels':n,'epsilon':eps,
                   'jump':rp-rm,'jump_over_2epsilon':(rp-rm)/(2*eps)})
  print('eps',eps,rp-rm,flush=True)
 out={'status':'sandbox finite-core smoothing discriminator',
      'definition':'x_+ -> h sigma_c log(1+exp(x/(h sigma_c)))',
      'contact_a':a0,'rows':rows,'epsilon_scaling':eps_rows}
 with open('p9_finite_core_contact_smoothing.json','w') as f: json.dump(out,f,indent=2)
if __name__=='__main__': main()
