#!/usr/bin/env python3
"""Measured S2 osculating-orbit -> sky projection and EHT ring ratio.
GRAVITY 2020 A&A 636 L5 Table E.1 (fit marginal errors);
EHT 2022 ApJL 930 L15 ring diameter (68% credible interval).
No invented physical inputs; covariance unavailable, no HsH prediction.
"""
import json, math
from pathlib import Path
import sympy as sp

x={'a_mas':125.058,'e':0.884649,'i_deg':134.567,'omega_deg':66.263,'ring_uas':51.8}
sigma={'a_mas':0.041,'e':0.000066,'i_deg':0.033,'omega_deg':0.031,'ring_uas':2.3}
a,e,i,w,d=sp.symbols('a e i w d',real=True)
q=sp.sqrt(1-sp.sin(i*sp.pi/180)**2*sp.sin(w*sp.pi/180)**2)
exprs={'intrinsic_peri_mas':a*(1-e),'sky_peri_mas':a*(1-e)*q,
       'projection_factor':q,'intrinsic_peri_to_ring_diameter':1000*a*(1-e)/d,
       'sky_peri_to_ring_diameter':1000*a*(1-e)*q/d,
       'sky_peri_to_ring_radius':2000*a*(1-e)*q/d}
keys=['a_mas','e','i_deg','omega_deg','ring_uas']
syms=[a,e,i,w,d]
vals=[x[k] for k in keys]
results={}
for name,expr in exprs.items():
    f=sp.lambdify(syms,expr,'math')
    value=float(f(*vals))
    derivs={k:float(sp.lambdify(syms,sp.diff(expr,s),'math')(*vals)) for k,s in zip(keys,syms)}
    contributions={k:abs(derivs[k])*sigma[k] for k in keys}
    quadrature=math.sqrt(sum(z*z for z in contributions.values()))
    envelope=sum(contributions.values())
    results[name]={'central':value,'sigma_diagonal_approx':quadrature,
                   'first_order_max_correlated_bound':envelope,
                   'sensitivity':derivs,'sigma_contributions':contributions}
q2=math.sqrt(math.cos(math.radians(x['omega_deg']))**2 + math.cos(math.radians(x['i_deg']))**2 * math.sin(math.radians(x['omega_deg']))**2)
assert abs(q2-results['projection_factor']['central'])<1e-13
# Independent Rz(node) Rx(inclination) Rz(omega) sky-plane check.
# Node rotates the sky vector but cannot change its magnitude.
rr=results['intrinsic_peri_mas']['central']
ii,ww,oo=map(math.radians,[x['i_deg'],x['omega_deg'],228.171])
xp=rr*math.cos(ww)
yp=rr*math.sin(ww)*math.cos(ii)
xs=xp*math.cos(oo)-yp*math.sin(oo)
ys=xp*math.sin(oo)+yp*math.cos(oo)
assert math.isclose(math.hypot(xs,ys),results['sky_peri_mas']['central'],rel_tol=0,abs_tol=1e-11)
assert 0<q2<1
assert results['sky_peri_mas']['central']<results['intrinsic_peri_mas']['central']
assert abs(results['sky_peri_to_ring_radius']['central']-2*results['sky_peri_to_ring_diameter']['central'])<1e-10
obj={'physical_system':'S2 orbit about Sgr A* and EHT Sgr A* ring',
 'sources':{'S2':'GRAVITY Collaboration 2020, A&A 636 L5, Table E.1, doi:10.1051/0004-6361/202037813',
            'ring':'EHT Collaboration 2022, ApJL 930 L15, doi:10.3847/2041-8213/ac6736'},
 'inputs':x,'marginal_uncertainties':sigma,
 'limitations':['S2 osculating elements are quoted for last apocentre epoch 2010; simple Kepler sky projection is not a relativistic 2018 astrometric forward fit.',
 'Fit marginal uncertainties are correlated, full covariance unavailable; diagonal uncertainty is illustrative and not a full credible interval.',
 'EHT ring diameter is a model-dependent image feature, not an observed material core diameter or Kerr ring.',
 'EHT and S2 are different epochs and wavebands; joint theory and systematics not modeled.',
 'The computed ratio is a data reduction, not a held-out prediction.'],
 'derived':results}
path=Path(__file__).with_suffix('.json');path.write_text(json.dumps(obj,indent=2)+'\n')
print(json.dumps({k:{z:round(v[z],10) for z in ['central','sigma_diagonal_approx','first_order_max_correlated_bound']} for k,v in results.items()},indent=2))
print('PASS: independent projection identity, inequalities, radius/diameter distinction')
