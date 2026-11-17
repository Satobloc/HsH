import Mathlib

/-!
Source-first conditional geometry for the measured Wettzell G ring-laser.
Böhm et al., Adv. Geosci. 50 (2019), 9-15, DOI 10.5194/adgeo-50-9-2019,
Eq. (1): delta f = (4 A/(P lambda)) n dot Omega.
The instrument measures one scalar projection, not a complete rotation
vector or a material worldtube. The 4D historical construction is separate.
No H(s)H physical prediction or empirical detector validation is claimed.
-/

namespace HsHVerification.MeridianSagnacProjection

/-- k is the calibrated scalar 4A/(P lambda); n is the detector normal. -/
def sagnac (k nx ny nz wx wy wz : ℝ) : ℝ :=
  k * (nx * wx + ny * wy + nz * wz)

/-- A shift perpendicular to the detector normal is invisible to one ring. -/
theorem orthogonal_shift
    (k nx ny nz wx wy wz dx dy dz : ℝ)
    (horth : nx * dx + ny * dy + nz * dz = 0) :
    sagnac k nx ny nz (wx + dx) (wy + dy) (wz + dz) =
      sagnac k nx ny nz wx wy wz := by
  unfold sagnac
  calc
    k * (nx * (wx + dx) + ny * (wy + dy) + nz * (wz + dz)) =
        k * (nx * wx + ny * wy + nz * wz) +
          k * (nx * dx + ny * dy + nz * dz) := by ring
    _ = k * (nx * wx + ny * wy + nz * wz) := by rw [horth]; ring

/-- Explicit null direction; it does not require a numerical fixture. -/
theorem horizontal_kernel
    (k nx ny nz wx wy wz t : ℝ) :
    sagnac k nx ny nz (wx + ny * t) (wy - nx * t) wz =
      sagnac k nx ny nz wx wy wz := by
  unfold sagnac
  ring

/-- For a vertical normal, horizontal rotation components are invisible. -/
theorem vertical_normal_kernel
    (k nz wx wy wz dx dy : ℝ) :
    sagnac k 0 0 nz (wx + dx) (wy + dy) wz =
      sagnac k 0 0 nz wx wy wz := by
  simp [sagnac]

/-- Unlike a scalar unsigned curvature, an oriented Sagnac signal is odd. -/
theorem sign_reversal
    (k nx ny nz wx wy wz : ℝ) :
    sagnac k nx ny nz (-wx) (-wy) (-wz) =
      -sagnac k nx ny nz wx wy wz := by
  unfold sagnac
  ring

/-- If the horizontal normal is nonzero, the displayed null direction
can be chosen nonzero; this is conditional rank information. -/
theorem horizontal_kernel_nontrivial
    (nx ny t : ℝ) (hn : nx ≠ 0 ∨ ny ≠ 0) (ht : t ≠ 0) :
    nx * t ≠ 0 ∨ ny * t ≠ 0 := by
  rcases hn with hx | hy
  · exact Or.inl (mul_ne_zero hx ht)
  · exact Or.inr (mul_ne_zero hy ht)

#print axioms orthogonal_shift
#print axioms horizontal_kernel
#print axioms vertical_normal_kernel
#print axioms sign_reversal
#print axioms horizontal_kernel_nontrivial

end HsHVerification.MeridianSagnacProjection
