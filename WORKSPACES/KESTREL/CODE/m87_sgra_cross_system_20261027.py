#!/usr/bin/env python3
"""Two observed black-hole image/orbit scales; no H(s)H forward model.
M87*: EHT 2019 42 +/- 3 microas; Gebhardt et al 2011 M=(6.6+/-0.4)e9
nominal solar masses at adopted D=17.9 Mpc, fixed here.
Sgr A*: EHT 2022 51.8 +/- 2.3 microas; VLTI stellar-orbit theta_g
5.125 +/- 0.009(stat) +/- 0.020(sys) microas.
The apparent standardized difference is NOT a calibrated hypothesis test.
"""
import math, json
GM_sun_nominal = 1.3271244e20  # IAU 2015 exact conversion
c, au = 299792458, 149597870700  # exact SI
pc = 648000/math.pi*au
uas = math.pi/(180*3600*1e6)
m87_mass, m87_mass_err, m87_D = 6.6e9, 0.4e9, 17.9e6*pc
m87_ring, m87_ring_err = 42., 3.
m87_theta = m87_mass*GM_sun_nominal/(c*c*m87_D)/uas
m87_k = m87_ring/m87_theta
m87_sigma = m87_k*math.hypot(m87_ring_err/m87_ring, m87_mass_err/m87_mass)
sgra_k = 51.8/5.125
sgra_sigma = sgra_k*math.hypot(2.3/51.8, math.hypot(.009,.020)/5.125)
delta = m87_k - sgra_k
sigma = math.hypot(m87_sigma, sgra_sigma)
print(json.dumps({
 "M87_theta_g_uas":m87_theta,
 "M87_k_eff":m87_k,"M87_k_conditional_sigma":m87_sigma,
 "SgrA_k_eff":sgra_k,"SgrA_k_approx_sigma":sgra_sigma,
 "M87_minus_SgrA_k":delta,"conditional_combined_sigma":sigma,
 "conditional_standardized_difference_not_significance":delta/sigma,
 "limitation":"M87 distance fixed, different emission models and data calibration, non-Gaussian/correlated systematics not included; no HsH prediction"
},indent=2))
