#!/usr/bin/env python3
"""Real-data, conditional covariance envelope for Sgr A* EHT ring vs shadow.
Original EHT Collaboration (2022) Paper I, ApJL 930 L12 Table 1,
DOI:10.3847/2041-8213/ac6674. These are reported 68% intervals,
not independently measured Gaussian standard deviations.
"""
from decimal import Decimal, getcontext
from hashlib import sha256
from pathlib import Path
import json
getcontext().prec = 48
R, uR = Decimal('51.8'), Decimal('2.3')
S, uS = Decimal('48.7'), Decimal('7.0')
D=R-S
# Conditional Gaussian linear covariance model: var(R-S)=uR^2+uS^2-2*rho*uR*uS
# rho in [-1,1] is a mathematical correlation constraint, not a measured parameter.
results={
  'source': 'EHT Collaboration 2022 Paper I Table 1, DOI:10.3847/2041-8213/ac6674',
  'real_system':'Sgr A* EHT 2017 April 1.3-mm observations',
  'observables':{
    'fitted_emission_ring_diameter_microas':str(R),
    'reported_68pct_interval_halfwidth_microas':str(uR),
    'simulation_calibrated_shadow_diameter_microas':str(S),
    'reported_shadow_interval_halfwidth_microas':str(uS),
  },
  'derived_central_gap_microas':str(D),
  'conditional_sigma_difference_bounds_microas': [str(abs(uS-uR)),str(uS+uR)],
  'conditional_max_abs_gap_over_sigma':str(D/abs(uS-uR)),
  'conditional_independent_sigma_microas':str((uR*uR+uS*uS).sqrt()),
  'conditional_independent_abs_gap_over_sigma':str(D/(uR*uR+uS*uS).sqrt()),
  'caveat':'Covariance unknown; reported credible intervals are not necessarily joint Gaussian sigmas; shadow is derived from same EHT data with simulation calibration; bounds are illustrative only conditional on treating marginals as standard deviations.',
  'physical_prediction':'NONE; no H(s)H forward map.'
}
path=Path.cwd() / 'aldus_eht_shared_data_covariance_20261027.json'
with open(path,'w',encoding='utf-8') as f: json.dump(results,f,indent=2); f.write('\n')
print(json.dumps(results,indent=2))
print('script_sha256',sha256(open(__file__,'rb').read()).hexdigest())
