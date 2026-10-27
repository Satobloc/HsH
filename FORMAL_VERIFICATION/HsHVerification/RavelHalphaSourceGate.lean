import Mathlib

/-!
# Source-defined curve non-identifiability

The two curves are the *assistant-authored* 2026-06-23 SAT Overview examples,
not Nathan Direct or an empirical hydrogen model. These theorems concern
exactly the encoded mathematical functions. They do not prove physics.
-/

namespace HsHVerification.RavelHalphaSourceGate

-- Tuple used as a lightweight four-coordinate carrier. No SU(2) or H-alpha
-- physical semantics are assumed.
noncomputable def sourceCurve (t : ℝ) : ℝ × ℝ × ℝ × ℝ :=
  (Real.cos t, Real.sin t, Real.cos (2 * t), Real.sin (2 * t))

noncomputable def hAlphaLabelCurve (t : ℝ) : ℝ × ℝ × ℝ × ℝ :=
  sourceCurve ((5 / 36 : ℝ) * t)

theorem hAlpha_is_reparametrized (t : ℝ) :
    hAlphaLabelCurve t = sourceCurve ((5 / 36 : ℝ) * t) := rfl

theorem source_curve_ranges_equal :
    Set.range hAlphaLabelCurve = Set.range sourceCurve := by
  ext p
  constructor
  · rintro ⟨t, rfl⟩
    exact ⟨(5 / 36 : ℝ) * t, rfl⟩
  · rintro ⟨t, rfl⟩
    refine ⟨(36 / 5 : ℝ) * t, ?_⟩
    change sourceCurve ((5 / 36 : ℝ) * ((36 / 5 : ℝ) * t)) = sourceCurve t
    have h : (5 / 36 : ℝ) * ((36 / 5 : ℝ) * t) = t := by ring
    rw [h]

theorem no_total_boolean_curve_label_discriminator
    (f : (ℝ × ℝ × ℝ × ℝ) → Bool)
    (hSU : ∀ t, f (sourceCurve t) = true)
    (hHa : ∀ t, f (hAlphaLabelCurve t) = false) : False := by
  have h := hSU ((5 / 36 : ℝ) * 0)
  have j := hHa 0
  change f (sourceCurve ((5 / 36 : ℝ) * 0)) = false at j
  rw [h] at j
  cases j

end HsHVerification.RavelHalphaSourceGate
