#!/usr/bin/env python3
"""CODATA 2022 helion magnetic readout audit: measured data, no invented inputs.
NIST free helion mu/mu_N -2.1276253498(17); neutral-gas shielded
-2.1274977624(17), gas sphere 25 C. Correlated evaluated quantities.
Schneider et al Nature 606 878 (2022), 3He+ Penning trap measured g'_I;
Wehrli et al PRL 127 263001 (2021), electronic shielding theory.
Historical SAT 2026/SAT MATH — BACKBONE.txt blob
1854995be3311f565739f2be64269cbb0385a82f says approx -2.127.
This script tests a hypothetical nearest-0.001 reading, NOT an asserted
historical uncertainty model or independently predicted H(s)H moment.
"""
from decimal import Decimal, getcontext
getcontext().prec = 45
D = Decimal
legacy = D('-2.127')
free = D('-2.1276253498')
shielded = D('-2.1274977624')
u_free = u_shielded = D('0.0000000017')
qed_neutral_sigma = D('59.967029e-6')
qed_neutral_sigma_u = D('0.000023e-6')
low, high = legacy-D('0.0005'), legacy+D('0.0005')
free_res, shield_res = legacy-free, legacy-shielded
shift = shielded-free
sigma_effective = D(1)-shielded/free
assert low == D('-2.1275') and high == D('-2.1265')
assert free < low < shielded < high
assert free_res == D('0.0006253498')
assert shield_res == D('0.0004977624')
assert shift == D('0.0001275874')
assert free_res-shield_res == shift
assert u_free == u_shielded == D('1.7e-9')
assert D(0) < sigma_effective < D('0.0001')
assert abs(sigma_effective-qed_neutral_sigma) < qed_neutral_sigma_u
assert free_res/free.copy_abs()*100 < D('0.03')
assert shield_res/shielded.copy_abs()*100 < D('0.03')
print('11 SOURCE-ANCHORED DECIMAL ASSERTIONS PASSED')
for key,val in {
 'free_muN':free,'shielded_muN':shielded,'legacy_approx_muN':legacy,
 'bin_lower_muN':low,'bin_upper_muN':high,
 'legacy_free_residual_muN':free_res,'legacy_shielded_residual_muN':shield_res,
 'screening_shift_muN':shift,'screening_effective_ppm':sigma_effective*D('1e6'),
 'qed_theory_neutral_sigma_ppm':qed_neutral_sigma*D('1e6'),
 'qed_effective_minus_theory_ppm':(sigma_effective-qed_neutral_sigma)*D('1e6'),
 'legacy_free_relative_percent':free_res/free.copy_abs()*100,
 'legacy_shielded_relative_percent':shield_res/shielded.copy_abs()*100,
 'screening_share_of_free_residual_percent':shift/free_res*100,
}.items(): print(f'{key}={val}')
print('NO independent measurements inferred from free/shielded adjusted ratio.')
print('NO H(s)H current operator, uncertainty model or physical prediction inferred.')
