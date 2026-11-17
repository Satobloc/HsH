import Mathlib

namespace HsHVerification

structure Vec4 where
  x0 : ℝ
  x1 : ℝ
  x2 : ℝ
  x3 : ℝ

def dot4 (a b : Vec4) : ℝ :=
  a.x0 * b.x0 + a.x1 * b.x1 + a.x2 * b.x2 + a.x3 * b.x3

/--
Tangent and acceleration components obtained by differentiating the
proposed Euclidean 4D helix gamma(s) = (s, R cos(k s), R sin(k s), v s),
with theta = k*s. The derivative-to-component step is documented here,
not independently formalized in this module.
-/
def helixTangent (R k v theta : ℝ) : Vec4 :=
  ⟨1, -R * k * Real.sin theta, R * k * Real.cos theta, v⟩

def helixAcceleration (R k theta : ℝ) : Vec4 :=
  ⟨0, -R * k^2 * Real.cos theta, -R * k^2 * Real.sin theta, 0⟩

theorem helixTangent_norm_sq (R k v theta : ℝ) :
    dot4 (helixTangent R k v theta) (helixTangent R k v theta) =
      1 + R^2 * k^2 + v^2 := by
  simp [dot4, helixTangent]
  nlinarith [Real.sin_sq_add_cos_sq theta]

theorem helixAcceleration_norm_sq (R k theta : ℝ) :
    dot4 (helixAcceleration R k theta) (helixAcceleration R k theta) =
      R^2 * k^4 := by
  simp [dot4, helixAcceleration]
  nlinarith [Real.sin_sq_add_cos_sq theta]

theorem helixTangent_dot_acceleration (R k v theta : ℝ) :
    dot4 (helixTangent R k v theta) (helixAcceleration R k theta) = 0 := by
  simp [dot4, helixTangent, helixAcceleration]
  ring

def gramCurvatureSq (R k v theta : ℝ) : ℝ :=
  (dot4 (helixTangent R k v theta) (helixTangent R k v theta) *
      dot4 (helixAcceleration R k theta) (helixAcceleration R k theta) -
    (dot4 (helixTangent R k v theta) (helixAcceleration R k theta))^2) /
    (dot4 (helixTangent R k v theta) (helixTangent R k v theta))^3

/--
For the Euclidean Gram expression |gamma'|^2 |gamma''|^2 -
(gamma' dot gamma'')^2 divided by |gamma'|^6, the squared-curvature
denominator is speed-squared cubed. This does not formalize the
derivative identities or choose a physical spacetime metric.
-/
theorem helix_gram_curvature_sq :
    ∀ R k v theta : ℝ,
      gramCurvatureSq R k v theta =
        (R^2 * k^4) / (1 + R^2 * k^2 + v^2)^3 := by
  intro R k v theta
  simp [gramCurvatureSq, helixTangent_norm_sq,
    helixAcceleration_norm_sq, helixTangent_dot_acceleration]

#print axioms helix_gram_curvature_sq

end HsHVerification
