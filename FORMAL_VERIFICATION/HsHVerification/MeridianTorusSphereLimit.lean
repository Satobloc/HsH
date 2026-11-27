import Mathlib

namespace HsHVerification.MeridianTorusSphereLimit

/-- A Cartesian point used only for the standard Euclidean torus parameterization. -/
structure Point3 where
  x : ℝ
  y : ℝ
  z : ℝ
deriving DecidableEq

/-- Standard ring-torus parameterization in Euclidean 3-space. -/
def torusPoint (R r θ φ : ℝ) : Point3 :=
  ⟨(R + r * Real.cos θ) * Real.cos φ,
   (R + r * Real.cos θ) * Real.sin φ,
   r * Real.sin θ⟩

def radiusSquared (p : Point3) : ℝ :=
  p.x ^ 2 + p.y ^ 2 + p.z ^ 2

/-- Coordinate scale of the primary-circumference tangent. -/
def azimuthalScale (R r θ : ℝ) : ℝ :=
  R + r * Real.cos θ

/-- The corresponding coefficient in the induced metric. -/
def azimuthalMetricCoefficient (R r θ : ℝ) : ℝ :=
  azimuthalScale R r θ ^ 2

/--
The Euclidean radius of a point on the parameterized torus is independent
of the azimuth φ and has the stated standard expression.
-/
theorem torusPoint_radiusSquared (R r θ φ : ℝ) :
    radiusSquared (torusPoint R r θ φ) =
      R ^ 2 + 2 * R * r * Real.cos θ + r ^ 2 := by
  have hθ : Real.cos θ ^ 2 + Real.sin θ ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq θ]
  have hφ : Real.cos φ ^ 2 + Real.sin φ ^ 2 = 1 := by
    nlinarith [Real.sin_sq_add_cos_sq φ]
  simp only [radiusSquared, torusPoint]
  calc
    ((R + r * Real.cos θ) * Real.cos φ) ^ 2
        + ((R + r * Real.cos θ) * Real.sin φ) ^ 2
        + (r * Real.sin θ) ^ 2
      = (R + r * Real.cos θ) ^ 2 *
          (Real.cos φ ^ 2 + Real.sin φ ^ 2)
          + r ^ 2 * Real.sin θ ^ 2 := by ring
    _ = (R + r * Real.cos θ) ^ 2 + r ^ 2 * Real.sin θ ^ 2 := by
      rw [hφ]
      ring
    _ = R ^ 2 + 2 * R * r * Real.cos θ
          + r ^ 2 * (Real.cos θ ^ 2 + Real.sin θ ^ 2) := by ring
    _ = R ^ 2 + 2 * R * r * Real.cos θ + r ^ 2 := by
      rw [hθ]
      ring

/-- At major radius R=0, the parameterized image is sphere-valued. -/
theorem sphereLimit_radiusSquared (r θ φ : ℝ) :
    radiusSquared (torusPoint 0 r θ φ) = r ^ 2 := by
  rw [torusPoint_radiusSquared]
  ring

/-- The two parameter branches identified by the R=0 sphere map. -/
def sphereDeck (θ φ : ℝ) : ℝ × ℝ :=
  (Real.pi - θ, φ + Real.pi)

/--
Applying the branch map twice returns θ and advances φ by one full period.
Thus it is order two on the torus angular coordinates modulo 2π.
-/
theorem sphereDeck_twice (θ φ : ℝ) :
    sphereDeck (sphereDeck θ φ).1 (sphereDeck θ φ).2 =
      (θ, φ + 2 * Real.pi) := by
  dsimp [sphereDeck]
  constructor <;> ring

/-- The R=0 parameterization is invariant under the branch identification. -/
theorem sphereLimit_deck_invariant (r θ φ : ℝ) :
    torusPoint 0 r (sphereDeck θ φ).1 (sphereDeck θ φ).2 =
      torusPoint 0 r θ φ := by
  ext <;>
    simp [torusPoint, sphereDeck, Real.cos_sub, Real.sin_sub,
      Real.cos_add, Real.sin_add]

/-- The azimuthal coordinate scale vanishes at the horn-torus inner equator R=r. -/
theorem hornTorus_innerScale_zero (r : ℝ) :
    azimuthalScale r r Real.pi = 0 := by
  simp [azimuthalScale]

/-- The azimuthal coordinate scale also vanishes at the poles of the R=0 sphere map. -/
theorem sphereLimit_poleScale_zero (r : ℝ) :
    azimuthalScale 0 r (Real.pi / 2) = 0 := by
  simp [azimuthalScale]

/--
For an embedded ring torus (R>r>0), the primary-circumference metric
coefficient is strictly positive. Its "null" label therefore denotes a
chosen zero-departure reference, not a Lorentzian null direction.
-/
theorem ringTorus_azimuthalScale_positive
    (R r θ : ℝ) (hr : 0 < r) (hR : r < R) :
    0 < azimuthalScale R r θ := by
  have hc : -1 ≤ Real.cos θ := Real.neg_one_le_cos θ
  dsimp [azimuthalScale]
  nlinarith

theorem ringTorus_azimuthalMetric_positive
    (R r θ : ℝ) (hr : 0 < r) (hR : r < R) :
    0 < azimuthalMetricCoefficient R r θ := by
  exact sq_pos_of_pos (ringTorus_azimuthalScale_positive R r θ hr hR)

/-- Explicit Euclidean cross product on Cartesian triples. -/
def crossProduct (a b : Point3) : Point3 :=
  ⟨a.y * b.z - a.z * b.y,
   a.z * b.x - a.x * b.z,
   a.x * b.y - a.y * b.x⟩

def dotProduct (a b : Point3) : ℝ :=
  a.x * b.x + a.y * b.y + a.z * b.z

/-- A vector in the plane spanned by a and b. -/
def linearCombination (a b : Point3) (s t : ℝ) : Point3 :=
  ⟨s * a.x + t * b.x,
   s * a.y + t * b.y,
   s * a.z + t * b.z⟩

def orientedTriple (a b c : Point3) : ℝ :=
  dotProduct (crossProduct a b) c

/--
If v is a linear combination of the two tangent-plane basis vectors,
then (a × b) · v is identically zero. This invalidates that expression
as a nonzero chirality proxy for a vector defined in the same tangent plane.
-/
theorem tangentPlane_orientedTriple_zero
    (a b : Point3) (s t : ℝ) :
    orientedTriple a b (linearCombination a b s t) = 0 := by
  simp [orientedTriple, dotProduct, crossProduct, linearCombination]
  ring

#print axioms torusPoint_radiusSquared
#print axioms sphereLimit_radiusSquared
#print axioms sphereLimit_deck_invariant
#print axioms ringTorus_azimuthalMetric_positive
#print axioms tangentPlane_orientedTriple_zero

end HsHVerification.MeridianTorusSphereLimit
