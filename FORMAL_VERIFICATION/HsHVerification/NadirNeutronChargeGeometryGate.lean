import HsHVerification.NadirNeutronChargeData
import Mathlib

/-!
Nadir Voss | source-conditioned neutron geometric readout type gate.
Original Nathan statement: HsH_INFORMATION_CONSERVATION.txt,
blob 7838ee3582d248233e642dca6dc03d042b08fd51,
NATHAN lines 925-926 asks whether nucleon diameter and He-3 diameter
can be locked in. Assistant response correctly distinguishes the
neutron's signed mean-square ELECTRIC charge moment from a positive
hard-core geometric radius. These theorems formalize the obstruction
for a naive readout r² = <r²_n> using actual PDG 2025 and Heacock 2021
printed measurements. They do NOT rule out finite-core worldtubes or
more general signed charge/current distributions.
-/

namespace HsHVerification.NadirNeutronChargeGeometryGate
open HsHVerification.NadirNeutronChargeData

theorem nominal_discrepancy_below_quadrature_one_sigma :
    (heacockMeanSqFm2 - pdgMeanSqFm2) ^ 2 <
    pdgSigmaFm2 ^ 2 + heacockSigmaFm2 ^ 2 := by
  norm_num [heacockMeanSqFm2, pdgMeanSqFm2, pdgSigmaFm2, heacockSigmaFm2]

theorem pdg_negative_cannot_be_real_squared_length (r : ℝ) :
    r ^ 2 ≠ -(1155 : ℝ) / 10000 := by
  nlinarith [sq_nonneg r]

theorem heacock_negative_cannot_be_real_squared_length (r : ℝ) :
    r ^ 2 ≠ -(1101 : ℝ) / 10000 := by
  nlinarith [sq_nonneg r]

theorem pdg_one_sigma_interval_excludes_square (r x : ℝ)
    (hupper : x ≤ -(1138 : ℝ) / 10000) :
    r ^ 2 ≠ x := by
  nlinarith [sq_nonneg r]

theorem heacock_one_sigma_interval_excludes_square (r x : ℝ)
    (hupper : x ≤ -(1012 : ℝ) / 10000) :
    r ^ 2 ≠ x := by
  nlinarith [sq_nonneg r]

theorem no_pdg_geometric_radius :
    ¬ ∃ r : ℝ, r ^ 2 = -(1155 : ℝ) / 10000 := by
  intro h
  obtain ⟨r, hr⟩ := h
  exact (pdg_negative_cannot_be_real_squared_length r) hr

#print axioms nominal_discrepancy_below_quadrature_one_sigma
#print axioms pdg_negative_cannot_be_real_squared_length
#print axioms heacock_negative_cannot_be_real_squared_length
#print axioms pdg_one_sigma_interval_excludes_square
#print axioms heacock_one_sigma_interval_excludes_square
#print axioms no_pdg_geometric_radius

end HsHVerification.NadirNeutronChargeGeometryGate
