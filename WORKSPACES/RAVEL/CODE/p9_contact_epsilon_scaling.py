#!/usr/bin/env python3
import json
from p9_physical_covariance_refinement import grid,builder,solve

def main():
 prior=json.load(open('p9_physical_covariance_refinement.json'))
 a0=prior['parameters']['contact_a']; out=[]; cov=builder(True)
 prior_rows={q['channels']:q for q in prior['schemes']['physical_gp_fixed_budget']['rows']}
 for n in (61,121):
  h=grid(n)
  for eps in (2e-4,1e-4,5e-5):
   if eps==1e-4:
    q=prior_rows[n]; rm=q['root_below']; rp=q['root_above']
   else:
    rm,_=solve(a0-eps,h,cov); rp,_=solve(a0+eps,h,cov)
   out.append({'channels':n,'epsilon':eps,'below':rm,'above':rp,'jump':rp-rm,'jump_over_2epsilon':(rp-rm)/(2*eps)})
   print(n,eps,rp-rm,flush=True)
 with open('p9_contact_epsilon_scaling.json','w') as f: json.dump({'status':'sandbox','rows':out},f,indent=2)
if __name__=='__main__': main()
