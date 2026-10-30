import Mathlib

/-!
Archive recovery EQ-0008: D5 density-coupling and curvature-scaling audit.
Source: SAT O Derivations/CODE-LOCKED DERIVS.txt, D5, lines 222-275.
Blob: 783b05d39d59bf854b92090e15d205e6823b51c8

These theorems prove the scaling mismatch produced by A=gJ in a non-Abelian
constant-current test and the exponent required to make rho*ell^p dimensionless
when rho is explicitly a three-volume density.  They do not derive a gauge
group, connection, or physical coupling from filament topology.
-/

namespace HsHVerification.ArchiveEQ0008

theorem volume_density_requires_cubic_length : (-3 : ℤ) + 3 = 0 := by
  norm_num

theorem archive_square_length_mismatch : (-3 : ℤ) + 2 = -1 := by
  norm_num

theorem nonabelian_scaling_mismatch
    (g c : ℝ) (hg : g ≠ 0) (hg1 : g ≠ 1) (hc : c ≠ 0) :
    g ^ 2 * c ≠ g * c := by
  intro h
  have hfactor : g * (g - 1) * c = 0 := by
    nlinarith
  rcases mul_eq_zero.mp hfactor with hgc | hc0
  · rcases mul_eq_zero.mp hgc with hg0 | hgm1
    · exact hg hg0
    · exact hg1 (sub_eq_zero.mp hgm1)
  · exact hc hc0

theorem weak_coupling_orders_differ
    (g : ℝ) : g ^ 2 - g = g * (g - 1) := by
  ring

end HsHVerification.ArchiveEQ0008
