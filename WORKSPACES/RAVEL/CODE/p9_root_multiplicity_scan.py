#!/usr/bin/env python3
"""Coarse sign-change scan around the inherited P9 contact."""
import json
import numpy as np
from p9_implicit_normal_jet import implicit_response
from p9_zero_curve_continuation import HREF

A0=float(HREF*np.geomspace(.14,1.55,16)[11]-1.0)
O=np.linspace(-.075,.03,22)
STEPS=(2e-5,1e-4,2e-5)

def main():
 out=[]
 for n in (61,121):
  h=HREF*np.geomspace(.14,1.55,n)
  for side,a in [('below',A0-1e-4),('above',A0+1e-4)]:
   f=np.array([implicit_response(a,float(o),h,*STEPS)['F_B_over_A'] for o in O])
   intervals=[]
   for i in range(len(O)-1):
    if f[i]*f[i+1] <= 0: intervals.append([float(O[i]),float(O[i+1])])
   out.append({'channels':n,'side':side,'a':a,'o_grid':O.tolist(),
               'F_grid':f.tolist(),'sign_change_intervals':intervals})
   print(n,side,intervals,flush=True)
 with open('p9_root_multiplicity_scan.json','w') as g: json.dump({'scan':out},g,indent=2)
if __name__=='__main__': main()
