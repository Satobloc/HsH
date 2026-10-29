"""Source-anchored standard-physics baseline, Danner et al. arXiv:1904.07085v1.
CODATA 2022 neutron mass (NIST) and exact SI Planck constant.
No fabricated measurement errors, HsH parameters, or HsH prediction.
"""
from decimal import Decimal, getcontext
import sympy as s
getcontext().prec = 45
h = Decimal("6.62607015e-34")   # exact J s, SI 2019
mn = Decimal("1.67492750056e-27")  # kg, NIST CODATA 2022
u_m = Decimal("0.00000000085e-27") # kg, CODATA 2022 1 standard uncertainty
lam = Decimal("1.9e-10")        # m, Danner experiment nominal; uncertainty not given
v = h / (mn * lam)
u_v_mass_only = v * u_m / mn
f_max = Decimal("20000")        # Hz, reported frequency scan maximum
omega_max = 2 * Decimal(str(s.pi.evalf(45))) * f_max
phaseI, phaseII = s.symbols("phaseI phaseII", real=True)
relative = phaseI - phaseII
relabelled = phaseII - phaseI
assert s.simplify(relative + relabelled) == 0
assert s.simplify(relative**2 - relabelled**2) == 0
assert Decimal(2000) < v < Decimal(2200)
assert u_v_mass_only / v < Decimal("1e-9")
assert Decimal(125000) < omega_max < Decimal(126000)
print("neutron_speed_m_per_s", v)
print("mass_only_speed_std_uncertainty_m_per_s", u_v_mass_only)
print("full_uncertainty BLOCKED: source wavelength uncertainty/covariance absent")
print("scan_omega_max_rad_per_s", omega_max)
print("phase_swap_relation", s.simplify(relabelled/relative))
print("ASSERTIONS_PASS=5")
