#!/usr/bin/env python3
"""Source-locked published observational controls; no H(s)H prediction or fit.

Primary published values:
- Everitt et al. (2011), PRL 106 221101, doi:10.1103/PhysRevLett.106.221101
- GRAVITY Collaboration (2020), A&A 636 L5, doi:10.1051/0004-6361/202037813
- EHT Collaboration (2022), ApJL 930 L15, doi:10.3847/2041-8213/ac6736
- EHT Collaboration (2022), Paper VI and GRAVITY orbit angular radius as quoted therein.

These are heterogeneous fitted/inferred observables, not independent raw measurements;
no cross-sector chi-squared or joint likelihood is formed.
"""
from decimal import Decimal, getcontext
import json
getcontext().prec=40
D=Decimal
controls=[
 dict(name='GPB_geodetic',system='Earth orbit, Gravity Probe B',observed='-6601.8',sigma='18.3',baseline='-6606.1',units='mas/year',source='Everitt et al. 2011 PRL 106 221101'),
 dict(name='GPB_frame_dragging',system='Earth orbit, Gravity Probe B',observed='-37.2',sigma='7.2',baseline='-39.2',units='mas/year',source='Everitt et al. 2011 PRL 106 221101'),
 dict(name='S2_Schwarzschild_precession_scale',system='S2 orbit around Sgr A*',observed='1.10',sigma='0.19',baseline='1',units='dimensionless',source='GRAVITY 2020 A&A 636 L5'),
]
for c in controls:
 c['observed_minus_GR']=str(D(c['observed'])-D(c['baseline']))
 c['z_marginal']=str((D(c['observed'])-D(c['baseline']))/D(c['sigma']))
 c['abs_z_marginal']=str(abs(D(c['z_marginal'])))
# EHT image ring vs separately inferred orbital gravitational angular radius.
# sigma_orbit = quadrature of quoted statistical/systematic uncertainties,
# treating them as independent for this sensitivity-only estimate.
ring=D('51.8'); ring_s=D('2.3'); theta_g=D('5.125'); theta_stat=D('0.009'); theta_sys=D('0.020')
sg=(theta_stat**2+theta_sys**2).sqrt()
k=ring/theta_g
ks=((ring_s/theta_g)**2+(ring*sg/theta_g**2)**2).sqrt()
ratio={'name':'SgrA_EHT_ring_to_orbital_theta_g','system':'Sgr A* EHT 2017 April 230 GHz and GRAVITY stellar orbits','ring_diameter_microas':str(ring),'ring_sigma_microas':str(ring_s),'theta_g_microas':str(theta_g),'theta_g_stat_microas':str(theta_stat),'theta_g_sys_microas':str(theta_sys),'sigma_theta_g_quadrature_microas':str(sg),'k_eff':str(k),'k_eff_sigma_first_order':str(ks),'kind':'image-to-orbital ratio; not a GR residual or H(s)H prediction'}
assert D(controls[0]['observed_minus_GR'])==D('4.3')
assert D(controls[1]['observed_minus_GR'])==D('2.0')
assert D(controls[2]['observed_minus_GR'])==D('0.10')
assert D('10.10') < k < D('10.12')
print(json.dumps({'controls':controls,'EHT':ratio,'notes':['GPB drifts are two correlated fitted components; only marginal standardized residuals shown.','S2 f_SP is a model-fitted scale with 0=Newtonian and 1=GR.','No joint significance, no fitted H(s)H parameter, no held-out prediction.','GR baseline values are source-reported, not recomputed here.']},indent=2))
