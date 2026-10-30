import Mathlib

/-!
Conditional Euclidean model of a solid 4D tube cut by an oblique 3D timesheet.

The model is deliberately narrower than H(s)H:
* the carrier is the uniform cylinder B^3_a × ℝ;
* the timesheet is the hyperplane w = m x;
* the readout uses orthonormal coordinates induced on that hyperplane.

It establishes the coordinate map from the 4D intersection to a 3D ellipsoid.
It does NOT identify the physical H(s)H core with a Euclidean ball, identify
the Kerr mouth with that full core, or establish a physical response law.
-/

namespace HsH.Calder.ObliqueTubeSlice

abbrev V3 := ℝ × ℝ × ℝ
abbrev V4 := ℝ × ℝ × ℝ × ℝ

/-- The three-dimensional ball used as the transverse section of the ideal tube. -/
def ball3 (a : ℝ) : Set V3 :=
  {p | p.1 ^ 2 + p.2.1 ^ 2 + p.2.2 ^ 2 ≤ a ^ 2}

/-- A uniform solid 4D tube: a 3-ball cross-section extended along w. -/
def solidTube4 (a : ℝ) : Set V4 :=
  {q | q.1 ^ 2 + q.2.1 ^ 2 + q.2.2.1 ^ 2 ≤ a ^ 2}

/-- A local oblique 3D timesheet, with slope m relative to the tube axis. -/
def timesheet4 (m : ℝ) : Set V4 :=
  {q | q.2.2.2 = m * q.1}

/-- Parameterization of the tube-timesheet intersection. -/
def embedSlice (m : ℝ) (p : V3) : V4 :=
  (p.1, p.2.1, p.2.2, m * p.1)

/-- Stretch factor converting the sheet parameters to orthonormal coordinates. -/
def stretchFactor (m : ℝ) : ℝ :=
  Real.sqrt (1 + m ^ 2)

/-- Intrinsic orthonormal coordinates on the oblique sheet. -/
def readoutCoords (m : ℝ) (p : V3) : V3 :=
  (stretchFactor m * p.1, p.2.1, p.2.2)

/-- The solid ellipsoid expressed in intrinsic orthonormal sheet coordinates. -/
def ellipsoid3 (a m : ℝ) : Set V3 :=
  {q | q.1 ^ 2 / (1 + m ^ 2) + q.2.1 ^ 2 + q.2.2 ^ 2 ≤ a ^ 2}

def normSq3 (p : V3) : ℝ :=
  p.1 ^ 2 + p.2.1 ^ 2 + p.2.2 ^ 2

def normSq4 (q : V4) : ℝ :=
  q.1 ^ 2 + q.2.1 ^ 2 + q.2.2.1 ^ 2 + q.2.2.2 ^ 2

theorem stretchFactor_pos (m : ℝ) : 0 < stretchFactor m := by
  unfold stretchFactor
  exact Real.sqrt_pos.2 (by nlinarith)

theorem stretchFactor_sq (m : ℝ) :
    (stretchFactor m) ^ 2 = 1 + m ^ 2 := by
  unfold stretchFactor
  exact Real.sq_sqrt (by nlinarith)

theorem embedSlice_mem_tube_iff (a m : ℝ) (p : V3) :
    embedSlice m p ∈ solidTube4 a ↔ p ∈ ball3 a := by
  simp [embedSlice, solidTube4, ball3]

theorem embedSlice_mem_timesheet (m : ℝ) (p : V3) :
    embedSlice m p ∈ timesheet4 m := by
  simp [embedSlice, timesheet4]

/-- The parameterization identifies the 4D tube/timesheet intersection exactly. -/
theorem embedSlice_image_ball_eq_intersection (a m : ℝ) :
    embedSlice m '' ball3 a = solidTube4 a ∩ timesheet4 m := by
  ext q
  constructor
  · rintro ⟨p, hp, rfl⟩
    constructor
    · simpa [embedSlice, solidTube4, ball3] using hp
    · simp [embedSlice, timesheet4]
  · rintro ⟨htube, hsheet⟩
    refine ⟨(q.1, q.2.1, q.2.2.1), ?_, ?_⟩
    · simpa [solidTube4, ball3] using htube
    · ext <;> simp [embedSlice, hsheet]

/-- The ambient Euclidean norm on the oblique slice equals the readout norm. -/
theorem embedSlice_normSq_eq_readout (m : ℝ) (p : V3) :
    normSq4 (embedSlice m p) = normSq3 (readoutCoords m p) := by
  unfold normSq4 normSq3 embedSlice readoutCoords
  rw [show (stretchFactor m * p.1) ^ 2 =
      (stretchFactor m) ^ 2 * p.1 ^ 2 by ring]
  rw [stretchFactor_sq]
  ring

/--
The intrinsic readout of the 3-ball is a 3D ellipsoid.
Its semiaxes are |a|√(1+m²), |a|, |a|; for a ≥ 0 these are
a√(1+m²), a, a.
-/
theorem readoutCoords_image_ball_eq_ellipsoid (a m : ℝ) :
    readoutCoords m '' ball3 a = ellipsoid3 a m := by
  ext q
  constructor
  · rintro ⟨p, hp, rfl⟩
    change (stretchFactor m * p.1) ^ 2 / (1 + m ^ 2)
        + p.2.1 ^ 2 + p.2.2 ^ 2 ≤ a ^ 2
    change p.1 ^ 2 + p.2.1 ^ 2 + p.2.2 ^ 2 ≤ a ^ 2 at hp
    have hscale :
        (stretchFactor m * p.1) ^ 2 / (1 + m ^ 2) = p.1 ^ 2 := by
      rw [show (stretchFactor m * p.1) ^ 2 =
          (stretchFactor m) ^ 2 * p.1 ^ 2 by ring]
      rw [stretchFactor_sq]
      field_simp [show 1 + m ^ 2 ≠ 0 by nlinarith]
    rw [hscale]
    exact hp
  · intro hq
    refine ⟨(q.1 / stretchFactor m, q.2.1, q.2.2), ?_, ?_⟩
    · change (q.1 / stretchFactor m) ^ 2
        + q.2.1 ^ 2 + q.2.2 ^ 2 ≤ a ^ 2
      change q.1 ^ 2 / (1 + m ^ 2)
        + q.2.1 ^ 2 + q.2.2 ^ 2 ≤ a ^ 2 at hq
      have hscale :
          (q.1 / stretchFactor m) ^ 2 =
            q.1 ^ 2 / (1 + m ^ 2) := by
        rw [div_pow, stretchFactor_sq]
      rw [hscale]
      exact hq
    · ext <;> field_simp [ne_of_gt (stretchFactor_pos m)]

/-- The composed tube → timesheet → intrinsic-readout map is the ellipsoid. -/
theorem oblique_intersection_readout_is_ellipsoid (a m : ℝ) :
    readoutCoords m '' ball3 a = ellipsoid3 a m :=
  readoutCoords_image_ball_eq_ellipsoid a m

/-- Algebraic coarea cancellation: a 1/μ slice factor times μ advance is constant. -/
theorem coarea_factor_cancels (C μ : ℝ) (hμ : μ ≠ 0) :
    (C / μ) * μ = C := by
  field_simp [hμ]

#print axioms embedSlice_image_ball_eq_intersection
#print axioms embedSlice_normSq_eq_readout
#print axioms readoutCoords_image_ball_eq_ellipsoid
#print axioms coarea_factor_cancels

end HsH.Calder.ObliqueTubeSlice
