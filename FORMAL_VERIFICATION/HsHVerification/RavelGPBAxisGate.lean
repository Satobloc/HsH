import Mathlib

/-!
# Ravel / GP-B: conditional tangent-axis reconstruction gate
Physical anchor: Gravity Probe B (Everitt et al., PRL 106 221101, 2011).
These are pure algebraic facts about a locally chosen orthonormal tangent frame.
No theorem says the local frame is a complete model of GP-B or H(s)H.
-/

namespace HsHVerification.RavelGPB

structure Rate3 where
  x : ℝ
  y : ℝ
  z : ℝ

-- Coordinates of omega cross e_z, in the local tangent basis.
def axisReadout (ω : Rate3) : ℝ × ℝ := (ω.y, -ω.x)

-- Coordinates of omega cross e_x; only two nonzero coordinates retained.
def secondDirectorReadout (ω : Rate3) : ℝ × ℝ := (ω.z, -ω.y)

theorem axial_change_invisible (ω : Rate3) (δ : ℝ) :
    axisReadout { ω with z := ω.z + δ } = axisReadout ω := by
  rfl

theorem equal_axis_readout_implies_transverse_equal (a b : Rate3)
    (h : axisReadout a = axisReadout b) : a.x = b.x ∧ a.y = b.y := by
  have h1 : a.y = b.y := congrArg Prod.fst h
  have h2 : -a.x = -b.x := congrArg Prod.snd h
  constructor
  · linarith
  · exact h1

theorem second_director_reads_axial (a b : Rate3)
    (h : secondDirectorReadout a = secondDirectorReadout b) : a.z = b.z := by
  exact congrArg Prod.fst h

theorem two_directors_identify_rate (a b : Rate3)
    (h1 : axisReadout a = axisReadout b)
    (h2 : secondDirectorReadout a = secondDirectorReadout b) : a = b := by
  obtain ⟨hx, hy⟩ := equal_axis_readout_implies_transverse_equal a b h1
  have hz := second_director_reads_axial a b h2
  cases a with
  | mk ax ay az =>
    cases b with
    | mk bx by bz =>
      simp_all

theorem gpb_geodetic_residual :
    (-6601.8 : ℝ) - (-6606.1) = 4.3 := by norm_num

theorem gpb_frame_dragging_residual :
    (-37.2 : ℝ) - (-39.2) = 2.0 := by norm_num

#print axioms HsHVerification.RavelGPB.axial_change_invisible
#print axioms HsHVerification.RavelGPB.equal_axis_readout_implies_transverse_equal
#print axioms HsHVerification.RavelGPB.second_director_reads_axial
#print axioms HsHVerification.RavelGPB.two_directors_identify_rate
#print axioms HsHVerification.RavelGPB.gpb_geodetic_residual
#print axioms HsHVerification.RavelGPB.gpb_frame_dragging_residual

end HsHVerification.RavelGPB
