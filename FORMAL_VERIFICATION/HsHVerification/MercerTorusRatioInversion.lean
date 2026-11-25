import Mathlib

/-!
# Candidate-map algebra audit: torus aspect-ratio cross-inversion

Source context:
* `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/HsH COSMOTOPOLOGY.txt`
  blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`.
* The archive ingestion ledger classifies this as a July 2026 user/assistant
  exploratory dialogue. The text is speaker-labelled, but no raw conversation
  JSON or role/message UUIDs were recovered for this copy.
* The formulas audited here are in assistant-authored transcript segments
  (approximately lines 1261-1887), not verbatim Nathan Direct equations.

The module checks only the algebra of the assistant-proposed candidate map
  I_L(R,r) = (L^2/r, L^2/R)
and the standard ring-torus aspect ratio
  eta(R,r) = (R-r)/(R+r), for R>r>0.

It does not validate this map as Nathan Direct, derive an equation of state,
identify a physical particle/black-hole duality, or establish any physical
premise. The later assistant-proposed mass inversion is a separate map. Its algebra is
formalized separately below; no map from it to the torus variables is assumed.
-/

namespace HsHVerification.MercerTorusRatioInversion

/-- Standard aspect ratio for a ring torus with major radius R and minor radius r. -/
noncomputable def torusAspectRatio (R r : ℝ) : ℝ := (R - r) / (R + r)

/-- Assistant-proposed cross-inversion of the two torus radii. -/
noncomputable def crossInversion (L R r : ℝ) : ℝ × ℝ :=
  (L ^ 2 / r, L ^ 2 / R)

/-- The proposed cross-inversion is an involution away from zero denominators. -/
theorem crossInversion_involutive
    (L R r : ℝ) (hL : L ≠ 0) (hR : R ≠ 0) (hr : r ≠ 0) :
    crossInversion L (crossInversion L R r).1 (crossInversion L R r).2
      = (R, r) := by
  have hL2 : L ^ 2 ≠ 0 := pow_ne_zero 2 hL
  change (L ^ 2 / (L ^ 2 / R), L ^ 2 / (L ^ 2 / r)) = (R, r)
  apply Prod.ext
  · field_simp [hL2, hR] <;> ring
  · field_simp [hL2, hr] <;> ring

/-- Under the stated cross-inversion, the ring-torus aspect ratio is invariant. -/
theorem torusAspectRatio_crossInversion_invariant
    (L R r : ℝ) (hL : L ≠ 0) (hR : R ≠ 0) (hr : r ≠ 0)
    (hsum : R + r ≠ 0) :
    torusAspectRatio (crossInversion L R r).1 (crossInversion L R r).2
      = torusAspectRatio R r := by
  have hL2 : L ^ 2 ≠ 0 := pow_ne_zero 2 hL
  have hRr : R * r ≠ 0 := mul_ne_zero hR hr
  unfold torusAspectRatio crossInversion
  have hnum :
      L ^ 2 / r - L ^ 2 / R = L ^ 2 * (R - r) / (R * r) := by
    field_simp [hR, hr] <;> ring
  have hden :
      L ^ 2 / r + L ^ 2 / R = L ^ 2 * (R + r) / (R * r) := by
    field_simp [hR, hr] <;> ring
  rw [hnum, hden]
  field_simp [hL2, hRr, hsum] <;> ring

/-- For a ring torus with R>r>0, eta lies strictly between zero and one. -/
theorem torusAspectRatio_bounds
    (R r : ℝ) (hr : 0 < r) (hmajor : r < R) :
    0 < torusAspectRatio R r ∧ torusAspectRatio R r < 1 := by
  unfold torusAspectRatio
  constructor
  · exact div_pos (by linarith) (by linarith)
  · rw [div_lt_iff₀ (by linarith)]
    linarith

/-- The assistant's reciprocal-ratio claim is incompatible with this map
for a nondegenerate ring torus: eta is invariant and is strictly below one. -/
theorem torusAspectRatio_crossInversion_not_reciprocal
    (L R r : ℝ) (hL : L ≠ 0) (hR : R ≠ 0) (hr : 0 < r)
    (hmajor : r < R) :
    torusAspectRatio (crossInversion L R r).1 (crossInversion L R r).2
      ≠ (torusAspectRatio R r)⁻¹ := by
  have hsum : R + r ≠ 0 := ne_of_gt (by linarith)
  rw [torusAspectRatio_crossInversion_invariant L R r hL hR (ne_of_gt hr) hsum]
  have hb := torusAspectRatio_bounds R r hr hmajor
  intro heq
  have heta0 : torusAspectRatio R r ≠ 0 := ne_of_gt hb.1
  have hmul := congrArg (fun x : ℝ => x * torusAspectRatio R r) heq
  have hsq : torusAspectRatio R r * torusAspectRatio R r = 1 := by
    simpa [heta0] using hmul
  nlinarith [hb.1, hb.2, hsq]

/-- The logarithmic geometry variable -log(eta) is invariant under the
assistant's stated cross-inversion, not odd under it. -/
theorem logAspectRatio_crossInversion_invariant
    (L R r : ℝ) (hL : L ≠ 0) (hR : R ≠ 0) (hr : r ≠ 0)
    (hsum : R + r ≠ 0) :
    -Real.log (torusAspectRatio (crossInversion L R r).1 (crossInversion L R r).2)
      = -Real.log (torusAspectRatio R r) := by
  rw [torusAspectRatio_crossInversion_invariant L R r hL hR hr hsum]

/-- Ratio of two labelled circumferences. -/
noncomputable def circumferenceRatio (Cinner Couter : ℝ) : ℝ := Cinner / Couter

/-- The assistant's separately written cross-exchange of the two circumferences. -/
noncomputable def circumferenceCrossInversion (L Cinner Couter : ℝ) : ℝ × ℝ :=
  (L ^ 2 / Couter, L ^ 2 / Cinner)

/-- The written cross-exchange of circumferences also preserves their ratio. -/
theorem circumferenceRatio_crossInversion_invariant
    (L Cinner Couter : ℝ) (hL : L ≠ 0)
    (hinner : Cinner ≠ 0) (houter : Couter ≠ 0) :
    circumferenceRatio
      (circumferenceCrossInversion L Cinner Couter).1
      (circumferenceCrossInversion L Cinner Couter).2
      = circumferenceRatio Cinner Couter := by
  unfold circumferenceRatio circumferenceCrossInversion
  have hL2 : L ^ 2 ≠ 0 := pow_ne_zero 2 hL
  field_simp [hL2, hinner, houter] <;> ring

/-- Separate assistant-proposed Planck-centred mass inversion. -/
noncomputable def massInversion (m mP : ℝ) : ℝ := mP ^ 2 / m

/-- The corresponding dimensionless mass ratio; this is not definitionally
the torus aspect ratio above. -/
noncomputable def massRatio (m mP : ℝ) : ℝ := m / mP

/-- The assistant-proposed mass inversion is also an involution away from zero. -/
theorem massInversion_involutive
    (m mP : ℝ) (hm : m ≠ 0) (hmp : mP ≠ 0) :
    massInversion (massInversion m mP) mP = m := by
  unfold massInversion
  field_simp [hm, hmp] <;> ring

/-- For positive masses, the fixed point of the separate mass inversion is m=mP. -/
theorem massInversion_fixed_iff
    (m mP : ℝ) (hm : 0 < m) (hmp : 0 < mP) :
    massInversion m mP = m ↔ m = mP := by
  constructor
  · intro h
    have hmul := congrArg (fun x : ℝ => x * m) h
    unfold massInversion at hmul
    field_simp [ne_of_gt hm] at hmul
    nlinarith
  · intro h
    subst m
    unfold massInversion
    field_simp [ne_of_gt hmp]

/-- Unlike the geometric radius cross-inversion, the separate mass inversion
sends m/mP to its reciprocal. -/
theorem massRatio_massInversion_reciprocal
    (m mP : ℝ) (hm : m ≠ 0) (hmp : mP ≠ 0) :
    massRatio (massInversion m mP) mP = (massRatio m mP)⁻¹ := by
  unfold massRatio massInversion
  field_simp [hm, hmp] <;> ring

/-- The fixed locus of the radius cross-inversion is R*r = L^2. -/
theorem crossInversion_fixed_iff
    (L R r : ℝ) (hR : R ≠ 0) (hr : r ≠ 0) :
    crossInversion L R r = (R, r) ↔ R * r = L ^ 2 := by
  constructor
  · intro h
    have hfirst := congrArg Prod.fst h
    unfold crossInversion at hfirst
    field_simp [hr] at hfirst
    nlinarith
  · intro h
    apply Prod.ext
    · unfold crossInversion
      field_simp [hr]
      nlinarith
    · unfold crossInversion
      field_simp [hR]
      nlinarith

#print axioms crossInversion_involutive
#print axioms crossInversion_fixed_iff
#print axioms torusAspectRatio_crossInversion_invariant
#print axioms torusAspectRatio_bounds
#print axioms torusAspectRatio_crossInversion_not_reciprocal
#print axioms logAspectRatio_crossInversion_invariant

end HsHVerification.MercerTorusRatioInversion
