#!/usr/bin/env python3
"""Measured Werner et al 1975 neutron-interferometry calibration identifiability.

Original PRL 35,1053-55 Eq 5-7: wavelength 1.445 Å; probe-derived
integral L=2.7 cm times magnet gap field; oscillation period 62 +/- 2 G.
NIST CODATA 2022 v9.0: neutron mass, gyromagnetic frequency, exact h.
No H(s)H prediction; conditional standard Pauli spin precession only.
"""
from decimal import Decimal, getcontext
from pathlib import Path
import json
import sympy as sp
getcontext().prec=70
D=Decimal
h=D('6.62607015e-34')
m=D('1.67492750056e-27')
gamma_over_2pi=D('29.1646935e6')
lam=D('1.445e-10')
L=D('2.7')
B=D('62')
uB=D('2')
K=(D(2)*h/(m*lam*gamma_over_2pi))*D(10)**6
B0=K/L
Lcentral=K/B
Llow=K/(B+uB)
ratio=B0/B
ratioband=B0/(B+uB)
# first-order Gaussian conditional, only if +/-2 G is one sigma and independent.
uL1=((B0-B)**2-uB**2).sqrt()*L/B0
uL2=(((B0-B)/D(2))**2-uB**2).sqrt()*L/B0
uL3=(((B0-B)/D(3))**2-uB**2).sqrt()*L/B0
Broundlo=K/D('2.75')
Broundhi=K/D('2.65')
# independent cross-check with SymPy rationals from published decimal input
r=lambda s:sp.Rational(str(s))
Ks=2*r(h)*sp.Integer(10)**6/(r(m)*r(lam)*r(gamma_over_2pi))
assert abs(sp.N(Ks-r(K),75)) < sp.Rational(1,10**60)
assert abs(sp.N(Ks/r(B)-r(Lcentral),75)) < sp.Rational(1,10**60)
assert abs(sp.N(Ks/r(B+uB)-r(Llow),75)) < sp.Rational(1,10**60)
assert B0>B+uB and Broundlo>B+uB
# unit and inverse checks
assert abs((B0*L-K))<D('1e-55')
assert abs((Lcentral*B-K))<D('1e-55')
res={
 'system':'Werner et al. neutron spinor interferometer, Ford Nuclear Reactor, 1975',
 'source':'Phys Rev Lett 35 1053 (1975) DOI 10.1103/PhysRevLett.35.1053; Eq 5-7',
 'inputs':{'neutron_wavelength_A':'1.445 (uncertainty unreported)', 'probe_field_integral_coefficient_cm':'2.7 (uncertainty unreported)', 'measured_period_G':'62 ± 2 (interpretation unreported)', 'CODATA2022_neutron_mass_kg':str(m), 'CODATA2022_neutron_gyromagnetic_frequency_Hz_T':str(gamma_over_2pi)},
 'standard_QM_integral_Gcm':str(K),
 'standard_QM_gap_period_G':str(B0),
 'observed_minus_predicted_G':str(B-B0),
 'required_effective_length_central_cm':str(Lcentral),
 'required_length_shift_central_cm':str(Lcentral-L),
 'required_length_shift_central_percent':str(D(100)*(Lcentral/L-D(1))),
 'required_length_to_touch_upper_reported_64G_cm':str(Llow),
 'required_length_shift_to_touch_64G_cm':str(Llow-L),
 'required_length_shift_to_touch_64G_percent':str(D(100)*(Llow/L-D(1))),
 'joint_lambda_length_product_factor_to_center':str(ratio),
 'joint_lambda_length_product_factor_to_touch_64G':str(ratioband),
 'if_L_rounded_to_nearest_0.1_cm_predicted_G_interval':[str(Broundlo),str(Broundhi)],
 'conditional_1sigma_independent_linearized_sigma_L_cm':str(uL1),
 'conditional_2sigma_independent_linearized_sigma_L_cm':str(uL2),
 'conditional_3sigma_independent_linearized_sigma_L_cm':str(uL3),
 'checks':'SymPy exact rational inputs crosschecked against 70-digit Decimal within rounding tolerance; Decimal inverse and interval checks PASS',
 'physical_HsH_prediction':'NONE',
 'unavailable':'Raw field-probe profile, calibration uncertainty/covariance, neutron wavelength uncertainty, raw count covariance, published confidence meaning of +/-2 G',
 'note':'Conditional calibration sensitivity is not a statistical significance or a new spin law.'
}
p=Path(__file__).with_suffix('.json');p.write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res,indent=2))
