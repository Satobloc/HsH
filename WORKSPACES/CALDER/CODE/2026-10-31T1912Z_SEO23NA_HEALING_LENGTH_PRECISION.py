#!/usr/bin/env python3
"""Source-locked central-value consistency check for Seo et al. (2017).

This script uses only values reported for the 23Na experiment and CODATA/NIST
constants. It does not invent raw shots, uncertainties, or a physical model.
The paper gives mu ~= h * 510 Hz and xi = hbar/sqrt(2*m*mu) ~= 0.6 um.
"""
from math import sqrt

# Exact SI Planck constant; CODATA 2022 atomic-mass constant; NIST 23Na mass.
H_J_S = 6.62607015e-34
U_KG = 1.66053906892e-27
NA23_U = 22.9897692820

# Seo et al. (2017), Methods: approximate central/rounded experimental inputs.
MU_OVER_H_HZ = 510.0
RX_M = 155e-6
RY_M = 190e-6
RZ_M = 1.9e-6
NV_INITIAL = 26.0
XI_PAPER_UM = 0.6
R_BAR_OVER_XI_REPORTED = 290.0

HBAR_J_S = 1.054571817e-34       # J s, CODATA 2022 rounded table value
M_NA23_KG = NA23_U * U_KG
MU_J = H_J_S * MU_OVER_H_HZ
XI_FROM_MU_M = HBAR_J_S / sqrt(2.0 * M_NA23_KG * MU_J)
R_BAR_M = sqrt(RX_M * RY_M)
L_V_M = R_BAR_M / sqrt(NV_INITIAL)
XI_IMPLIED_BY_REPORTED_RATIO_M = R_BAR_M / R_BAR_OVER_XI_REPORTED

# Back-substitution: what mu/h would correspond to a specified xi?
def mu_over_h_for_xi_hz(xi_m: float) -> float:
    return (HBAR_J_S**2 / (2.0 * M_NA23_KG * xi_m**2)) / H_J_S

print(f"m(23Na) = {M_NA23_KG:.14e} kg")
print(f"mu = h * {MU_OVER_H_HZ:.1f} Hz = {MU_J:.14e} J")
print(f"xi(mu) = {XI_FROM_MU_M*1e6:.9f} um")
print(f"xi(paper rounded) = {XI_PAPER_UM:.6f} um")
print(f"Rbar = sqrt(Rx*Ry) = {R_BAR_M*1e6:.9f} um")
print(f"Rbar/xi(mu) = {R_BAR_M/XI_FROM_MU_M:.9f}")
print(f"Rbar/xi(0.6 um) = {R_BAR_M/(XI_PAPER_UM*1e-6):.9f}")
print(f"Rz/xi(mu) = {RZ_M/XI_FROM_MU_M:.9f}")
print(f"Rz/xi(0.6 um) = {RZ_M/(XI_PAPER_UM*1e-6):.9f}")
print(f"lv = Rbar/sqrt(Nv) = {L_V_M*1e6:.9f} um")
print(f"lv/xi(mu) = {L_V_M/XI_FROM_MU_M:.9f}")
print(f"xi implied by Rbar/xi=290 = {XI_IMPLIED_BY_REPORTED_RATIO_M*1e6:.9f} um")
print(f"mu/h for xi=0.6 um = {mu_over_h_for_xi_hz(XI_PAPER_UM*1e-6):.6f} Hz")
print(f"mu/h for Rbar/xi=290 = {mu_over_h_for_xi_hz(XI_IMPLIED_BY_REPORTED_RATIO_M):.6f} Hz")
print(f"xi(mu) relative to 0.6 um = {(XI_FROM_MU_M/(XI_PAPER_UM*1e-6)-1)*100:.6f}%")
print(f"Rbar/xi(mu) relative to 290 = {(R_BAR_M/XI_FROM_MU_M/290-1)*100:.6f}%")
