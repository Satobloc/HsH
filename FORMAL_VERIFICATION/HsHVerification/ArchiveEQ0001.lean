import Mathlib

/-!
Archive recovery for EQ-0001.
Source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SPHERECHECKQC.txt
Blob: 7ea46f7d3461061a3b5f51fa7ee58b926b8404f0

These theorems verify real-algebra consequences only. They do not prove the
geometric hypotheses, regular-value condition, S^1 topology, or H(s)H use.
-/

namespace HsHVerification.ArchiveEQ0001

theorem radius_rearrangement
    (R d rho : ℝ)
    (h : rho ^ 2 = R ^ 2 - d ^ 2 / 3) :
    3 * rho ^ 2 = 3 * R ^ 2 - d ^ 2 := by
  nlinarith

theorem coincident_center_boundary
    (R rho : ℝ)
    (h : rho ^ 2 = R ^ 2 - (0 : ℝ) ^ 2 / 3) :
    rho ^ 2 = R ^ 2 := by
  nlinarith

theorem collapse_boundary
    (R d rho : ℝ)
    (hRadius : rho ^ 2 = R ^ 2 - d ^ 2 / 3)
    (hCollapse : d ^ 2 = 3 * R ^ 2) :
    rho ^ 2 = 0 := by
  nlinarith

theorem positive_radius_implies_subcritical
    (R d rho : ℝ)
    (hRadius : rho ^ 2 = R ^ 2 - d ^ 2 / 3)
    (hPositive : 0 < rho ^ 2) :
    d ^ 2 < 3 * R ^ 2 := by
  nlinarith

end HsHVerification.ArchiveEQ0001
