import Mathlib

/-!
# Conditional thin-slab configuration-space straightening

This is an abstract point-centre model, not an H(s)H physical premise.

Assumptions:
* N labelled centres in an unbounded planar base times one bounded transverse
  coordinate of total width h;
* isotropic pairwise hard-core separation D;
* 0 <= h < D.

The module formalizes a collision-preserving straightening path and endpoint
maps. It does not model finite-core tube orientation, framing, self-linking,
fixed lateral boundaries, matter response, or a physical value of h or D.
Continuity of the displayed homotopies is not yet formalized here, so this
module does not claim a Lean-proved pi_1 isomorphism.
-/

noncomputable section

namespace HsHVerification.ThinSlabConfigurationHomotopy

abbrev Point2 := ℝ × ℝ
abbrev Point3 := ℝ × ℝ × ℝ

def sqDist2 (p q : Point2) : ℝ :=
  (p.1 - q.1)^2 + (p.2 - q.2)^2

def sqDist3 (p q : Point3) : ℝ :=
  (p.1 - q.1)^2 + (p.2.1 - q.2.1)^2 + (p.2.2 - q.2.2)^2

def SlabConfig (n : ℕ) (h D : ℝ) :=
  {p : Fin n → Point3 //
    (∀ i, |(p i).2.2| ≤ h / 2) ∧
    (∀ i j, i ≠ j → D^2 ≤ sqDist3 (p i) (p j))}

def PlanarConfig (n : ℕ) (D : ℝ) :=
  {p : Fin n → Point2 //
    ∀ i j, i ≠ j → D^2 ≤ sqDist2 (p i) (p j)}

/-- The scale factor used to straighten the bounded transverse coordinate. -/
def slabScale (t h D : ℝ) : ℝ :=
  1 + (1 - (1 - t)^2) * h^2 / (D^2 - h^2)

/-- Pointwise straightening: expand in the plane while contracting the slab coordinate. -/
def straightenPoint (t h D : ℝ) (p : Point3) : Point3 :=
  (slabScale t h D * p.1,
   slabScale t h D * p.2.1,
   (1 - t) * p.2.2)

/-- The core algebraic gate: the straightening path cannot reduce any
pairwise squared separation below D^2 when h < D. -/
theorem straightening_pairwise
    (h D t x1 y1 z1 x2 y2 z2 : ℝ)
    (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 1)
    (hz1 : |z1| ≤ h / 2) (hz2 : |z2| ≤ h / 2)
    (hsep : D^2 ≤ (x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2) :
    D^2 ≤ (slabScale t h D)^2 * ((x1 - x2)^2 + (y1 - y2)^2)
      + (1 - t)^2 * (z1 - z2)^2 := by
  have hDplus : 0 < D + h := by linarith
  have hA : 0 < D^2 - h^2 := by
    have hprod : 0 < (D - h) * (D + h) :=
      mul_pos (sub_pos.mpr hthin) hDplus
    nlinarith
  have hdzAbs : |z1 - z2| ≤ h := by
    calc
      |z1 - z2| ≤ |z1| + |z2| := abs_sub_le z1 0 z2
      _ ≤ h / 2 + h / 2 := add_le_add hz1 hz2
      _ = h := by ring
  have hdzLo : -h ≤ z1 - z2 := (abs_le.mp hdzAbs).1
  have hdzHi : z1 - z2 ≤ h := (abs_le.mp hdzAbs).2
  have hprod : 0 ≤ (h - (z1 - z2)) * (h + (z1 - z2)) :=
    mul_nonneg (sub_nonneg.mpr hdzHi) (by linarith)
  have hdz2 : (z1 - z2)^2 ≤ h^2 := by nlinarith [hprod]
  let s : ℝ := (1 - t)^2
  have hs0 : 0 ≤ s := by dsimp [s]; positivity
  have hs1 : s ≤ 1 := by
    dsimp [s]
    have hprod' : 0 ≤ t * (2 - t) := mul_nonneg ht0 (by linarith)
    nlinarith [hprod']
  let u : ℝ := ((1 - s) * h^2) / (D^2 - h^2)
  have hu : 0 ≤ u := by
    dsimp [u]
    apply div_nonneg
    · exact mul_nonneg (sub_nonneg.mpr hs1) (sq_nonneg h)
    · exact le_of_lt hA
  have hscale : slabScale t h D = 1 + u := by
    dsimp [slabScale, u, s]
  have hscale1 : 1 ≤ slabScale t h D := by
    rw [hscale]
    linarith
  have hscale2 : 0 ≤ (slabScale t h D)^2 - s := by
    have hsq : 1 ≤ (slabScale t h D)^2 := by nlinarith
    linarith
  have hr2 : D^2 - (z1 - z2)^2 ≤ (x1 - x2)^2 + (y1 - y2)^2 := by
    nlinarith [hsep]
  have hidentity :
      (1 + u)^2 * (D^2 - h^2) + s * h^2 - D^2
        = (1 - s) * h^2 + u^2 * (D^2 - h^2) := by
    dsimp [u]
    field_simp [ne_of_gt hA]
    ring
  have hright : 0 ≤ (1 - s) * h^2 + u^2 * (D^2 - h^2) :=
    add_nonneg
      (mul_nonneg (sub_nonneg.mpr hs1) (sq_nonneg h))
      (mul_nonneg (sq_nonneg u) (le_of_lt hA))
  have hfinal : D^2 ≤ (slabScale t h D)^2 * (D^2 - h^2) + s * h^2 := by
    rw [hscale]
    nlinarith [hidentity, hright]
  have hmain : D^2 ≤ (slabScale t h D)^2 * ((x1 - x2)^2 + (y1 - y2)^2)
      + s * (z1 - z2)^2 := by
    calc
      D^2 ≤ (slabScale t h D)^2 * (D^2 - h^2) + s * h^2 := hfinal
      _ = (slabScale t h D)^2 * D^2
          - ((slabScale t h D)^2 - s) * h^2 := by ring
      _ ≤ (slabScale t h D)^2 * D^2
          - ((slabScale t h D)^2 - s) * (z1 - z2)^2 := by
            exact sub_le_sub_left
              (mul_le_mul_of_nonneg_left hdz2 hscale2) _
      _ = (slabScale t h D)^2 * (D^2 - (z1 - z2)^2)
          + s * (z1 - z2)^2 := by ring
      _ ≤ (slabScale t h D)^2 * ((x1 - x2)^2 + (y1 - y2)^2)
          + s * (z1 - z2)^2 := by
            exact add_le_add
              (mul_le_mul_of_nonneg_left hr2 (sq_nonneg (slabScale t h D)))
              le_rfl
  simpa [s] using hmain

/-- The full pointwise path on a labelled finite configuration. -/
def slabStraightening
    (h D t : ℝ) (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 1)
    {n : ℕ} (x : SlabConfig n h D) : SlabConfig n h D := by
  refine ⟨fun i => straightenPoint t h D (x.1 i), ?_⟩
  constructor
  · intro i
    have hfac0 : 0 ≤ 1 - t := by linarith
    have hfac1 : 1 - t ≤ 1 := by linarith
    have hzi := x.2.1 i
    calc
      |(1 - t) * (x.1 i).2.2|
          = (1 - t) * |(x.1 i).2.2| := by
              rw [abs_mul, abs_of_nonneg hfac0]
      _ ≤ 1 * |(x.1 i).2.2| :=
          mul_le_mul_of_nonneg_right hfac1 (abs_nonneg _)
      _ ≤ 1 * (h / 2) :=
          mul_le_mul_of_nonneg_left hzi (by norm_num)
      _ = h / 2 := by ring
  · intro i j hij
    have hpair := straightening_pairwise h D t
      (x.1 i).1 (x.1 i).2.1 (x.1 i).2.2
      (x.1 j).1 (x.1 j).2.1 (x.1 j).2.2
      hh hD hthin ht0 ht1 (x.2.1 i) (x.2.1 j) (x.2.2 i j hij)
    dsimp [sqDist3, straightenPoint]
    nlinarith [hpair]

/-- The endpoint of straightening lies in the planar hard-core configuration space. -/
def slabToPlanar
    (h D : ℝ) (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    {n : ℕ} (x : SlabConfig n h D) : PlanarConfig n D := by
  refine ⟨fun i => (slabScale 1 h D * (x.1 i).1,
      slabScale 1 h D * (x.1 i).2.1), ?_⟩
  intro i j hij
  have hpair := straightening_pairwise h D 1
    (x.1 i).1 (x.1 i).2.1 (x.1 i).2.2
    (x.1 j).1 (x.1 j).2.1 (x.1 j).2.2
    hh hD hthin (by norm_num) (by norm_num)
    (x.2.1 i) (x.2.1 j) (x.2.2 i j hij)
  have hpair' : D^2 ≤ (slabScale 1 h D)^2 *
      ((x.1 i).1 - (x.1 j).1)^2
      + (slabScale 1 h D)^2 *
      ((x.1 i).2.1 - (x.1 j).2.1)^2 := by
    simpa using hpair
  dsimp [sqDist2]
  nlinarith [hpair']

/-- Embed a planar hard-core configuration as a zero-slab configuration. -/
def planarToSlab
    (h D : ℝ) (hh : 0 ≤ h) {n : ℕ} (x : PlanarConfig n D) : SlabConfig n h D := by
  refine ⟨fun i => ((x.1 i).1, (x.1 i).2, 0), ?_⟩
  constructor
  · intro i
    simpa using (half_nonneg hh)
  · intro i j hij
    simpa [sqDist2, sqDist3] using x.2 i j hij

/-- At t=0, straightening is the identity on the slab configuration. -/
theorem slabStraightening_zero
    (h D : ℝ) (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    {n : ℕ} (x : SlabConfig n h D) :
    slabStraightening h D 0 hh hD hthin (by norm_num) (by norm_num) x = x := by
  apply Subtype.ext
  funext i
  simp [slabStraightening, straightenPoint, slabScale]

/-- At t=1, straightening is the planar embedding after the planar map. -/
theorem slabStraightening_one
    (h D : ℝ) (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    {n : ℕ} (x : SlabConfig n h D) :
    slabStraightening h D 1 hh hD hthin (by norm_num) (by norm_num) x
      = planarToSlab h D hh (slabToPlanar h D hh hD hthin x) := by
  apply Subtype.ext
  funext i
  simp [slabStraightening, straightenPoint, slabScale, slabToPlanar, planarToSlab]

/-- Uniform planar dilation preserves the hard-core condition. -/
def planarDilation
    (h D t : ℝ) (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 1)
    {n : ℕ} (x : PlanarConfig n D) : PlanarConfig n D := by
  let a : ℝ := slabScale t h D
  have hDplus : 0 < D + h := by linarith
  have hA : 0 < D^2 - h^2 := by
    have hprod : 0 < (D - h) * (D + h) :=
      mul_pos (sub_pos.mpr hthin) hDplus
    nlinarith
  have hfactor : 0 ≤ 1 - (1 - t)^2 := by
    have hprod : 0 ≤ t * (2 - t) := mul_nonneg ht0 (by linarith)
    nlinarith [hprod]
  have hnum : 0 ≤ (1 - (1 - t)^2) * h^2 :=
    mul_nonneg hfactor (sq_nonneg h)
  have hratio : 0 ≤ ((1 - (1 - t)^2) * h^2) / (D^2 - h^2) :=
    div_nonneg hnum (le_of_lt hA)
  have ha : 1 ≤ a := by
    dsimp [a, slabScale]
    exact le_add_of_nonneg_right hratio
  refine ⟨fun i => (a * (x.1 i).1, a * (x.1 i).2), ?_⟩
  intro i j hij
  have hsep := x.2 i j hij
  have hr2 : 0 ≤ sqDist2 (x.1 i) (x.1 j) := by
    dsimp [sqDist2]
    exact add_nonneg (sq_nonneg _) (sq_nonneg _)
  have ha2 : 1 ≤ a^2 := by nlinarith
  have hscaled : D^2 ≤ a^2 * sqDist2 (x.1 i) (x.1 j) := by
    calc
      D^2 ≤ sqDist2 (x.1 i) (x.1 j) := hsep
      _ ≤ a^2 * sqDist2 (x.1 i) (x.1 j) :=
        mul_le_mul_of_nonneg_right ha2 hr2
  dsimp [sqDist2]
  nlinarith [hscaled]

/-- At t=0, planar dilation is the identity. -/
theorem planarDilation_zero
    (h D : ℝ) (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    {n : ℕ} (x : PlanarConfig n D) :
    planarDilation h D 0 hh hD hthin (by norm_num) (by norm_num) x = x := by
  apply Subtype.ext
  funext i
  simp [planarDilation, slabScale]

/-- At t=1, planar dilation is the composite of planar embedding and straightening. -/
theorem planarDilation_one
    (h D : ℝ) (hh : 0 ≤ h) (hD : 0 < D) (hthin : h < D)
    {n : ℕ} (x : PlanarConfig n D) :
    planarDilation h D 1 hh hD hthin (by norm_num) (by norm_num) x
      = slabToPlanar h D hh hD hthin (planarToSlab h D hh x) := by
  apply Subtype.ext
  funext i
  simp [planarDilation, slabScale, slabToPlanar, planarToSlab]

#print axioms straightening_pairwise
#print axioms slabStraightening
#print axioms slabToPlanar
#print axioms planarToSlab
#print axioms slabStraightening_zero
#print axioms slabStraightening_one
#print axioms planarDilation
#print axioms planarDilation_zero
#print axioms planarDilation_one

end HsHVerification.ThinSlabConfigurationHomotopy
