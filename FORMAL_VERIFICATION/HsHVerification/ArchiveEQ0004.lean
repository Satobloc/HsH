import Mathlib

/-!
Archive recovery for EQ-0004: action-to-Hamiltonian Legendre transform.
Source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/
  SAT O Derivations/CODE-LOCKED DERIVS.txt
Blob: 783b05d39d59bf854b92090e15d205e6823b51c8

The first theorem checks the archive's single-degree-of-freedom identity.
The second states the corrected field-density version, with spatial-gradient
and potential-density terms retained.  Neither theorem selects an H(s)H
action or establishes physical applicability.
-/

namespace HsHVerification.ArchiveEQ0004

theorem particle_legendre_transform
    (m v potential p : ℝ)
    (hm : m ≠ 0)
    (hp : p = m * v) :
    p * v - (m * v ^ 2 / 2 - potential) =
      p ^ 2 / (2 * m) + potential := by
  subst p
  field_simp [hm]
  ring

theorem field_density_legendre_transform
    (mu velocity slope tension potentialDensity momentumDensity : ℝ)
    (hmu : mu ≠ 0)
    (hp : momentumDensity = mu * velocity) :
    momentumDensity * velocity -
        (mu * velocity ^ 2 / 2 - tension * slope ^ 2 / 2 - potentialDensity) =
      momentumDensity ^ 2 / (2 * mu) +
        tension * slope ^ 2 / 2 + potentialDensity := by
  subst momentumDensity
  field_simp [hmu]
  ring

end HsHVerification.ArchiveEQ0004
