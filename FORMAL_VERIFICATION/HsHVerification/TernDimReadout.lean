import Mathlib

/-!
Tern Rook | 2026-10-28 | finite-core scalar readout source-fidelity gate.

Historical source: SAT_THEORY_ARCHIVE_2023-25/Dim.txt,
Git blob 8f019606e52cbc8e45bd7638395f994777a3a446.
Nathan's raw-user message 456841be-463b-43c8-9042-f7f4c19c50a8
(2026-06-23) explicitly marks the quoted artifact tentative/probably wrong.

The source's scalar readout uses the absolute incidence of a worldtube
tangent with a sheet normal. Reversing the sign of that incidence leaves
this unsigned scalar and any K/|u| slice factor unchanged. This proves
a loss of SIGN information for this PARTICULAR scalar representation,
not a loss of all geometry, phase, spin, or physical chirality.

No physical data, constants, fixture or empirical inference occurs here.
-/

namespace HsHVerification.TernDimReadout

noncomputable def unsignedIncidence (u : ℝ) : ℝ := |u|
noncomputable def sliceFactor (K u : ℝ) : ℝ := K / |u|

theorem unsigned_incidence_reversal (u : ℝ) :
    unsignedIncidence u = unsignedIncidence (-u) := by
  simp [unsignedIncidence]

theorem scalar_slice_factor_reversal (K u : ℝ) :
    sliceFactor K u = sliceFactor K (-u) := by
  simp [sliceFactor]

theorem distinct_signed_inputs_same_unsigned
    (u : ℝ) (hu : u ≠ 0) :
    u ≠ -u ∧ unsignedIncidence u = unsignedIncidence (-u) := by
  constructor
  · intro h
    have hz : u = 0 := by linarith
    exact hu hz
  · exact unsigned_incidence_reversal u

theorem no_two_sided_sign_recovery
    (decode : ℝ → ℝ) (u : ℝ) (hu : u ≠ 0)
    (hforward : decode (unsignedIncidence u) = u)
    (hreverse : decode (unsignedIncidence (-u)) = -u) : False := by
  have heq : u = -u := by
    calc
      u = decode (unsignedIncidence u) := hforward.symm
      _ = decode (unsignedIncidence (-u)) := by rw [unsigned_incidence_reversal]
      _ = -u := hreverse
  have hz : u = 0 := by linarith
  exact hu hz

#print axioms unsigned_incidence_reversal
#print axioms scalar_slice_factor_reversal
#print axioms distinct_signed_inputs_same_unsigned
#print axioms no_two_sided_sign_recovery

end HsHVerification.TernDimReadout
