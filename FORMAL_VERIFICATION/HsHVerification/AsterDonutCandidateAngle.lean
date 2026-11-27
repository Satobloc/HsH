import Mathlib

/-!
# Aster: the assistant-generated Donut angle candidate

Source boundary:
* Nathan Direct's original mechanical 3D toy is in the raw
  "Ontology and Math Check" conversation, blob
  `e3e40b1a167d26f2d153667d761746f9a4788db1`, messages
  `a1172bf2-0742-4a68-b9b8-34e270a8a555` and
  `dd2c035f-109a-4f6a-863a-a3670dbf3d3f`.
* The June 23 `SAT Overview` raw export is blob
  `023ff77688672546aeff02deb3745289f6709c90`.
  The torus/angle formula below first appears in an assistant message
  immediately before a user message that repeats it. It is therefore an
  assistant-generated candidate, not a Nathan-authored original equation.
* The user later explicitly says the Donut is a representational/search aid,
  not part of SAT's physical ontology.

This file formalizes only that assistant candidate:
1. its `Theta` is the normalized dot-product angle between the implied
   lifts `(cos t, sin t, 1)` and `(2 cos t, sin t, 1)`;
2. the resulting torus trace is invariant under swapping the ordered inputs;
3. consequently, that candidate trace alone cannot have a left-inverse
   decoder recovering the ordered pair of input curves.

The result is a limitation of this candidate encoding, not a counterexample
to Nathan's original mechanical apparatus, which has distinct R/Q roles,
anchors, planes, a Great Annulum, a variable cord, and an even-multiple
winding condition. No physical system or empirical claim is represented.
-/

namespace HsHVerification.AsterDonutCandidateAngle

noncomputable section

abbrev Vec3 := ℝ × ℝ × ℝ

/-- Euclidean dot product on the nested product representation of R^3. -/
def dot3 (u v : Vec3) : ℝ :=
  u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2

/-- Squared Euclidean norm. -/
def normSq3 (u : Vec3) : ℝ := dot3 u u

/-- The two-dimensional circle input, lifted to the plane z = 1. -/
def liftR (t : ℝ) : Vec3 := (Real.cos t, Real.sin t, 1)

/-- The two-dimensional ellipse input, lifted to the plane z = 1. -/
def liftQ (t : ℝ) : Vec3 := (2 * Real.cos t, Real.sin t, 1)

/-- Normalized dot product of two nonzero vectors, when its denominator
is defined. The definition is total; nonzeroness is not asserted here. -/
def cosineSimilarity (u v : Vec3) : ℝ :=
  dot3 u v / (Real.sqrt (normSq3 u) * Real.sqrt (normSq3 v))

/-- The angle used by the assistant-generated candidate. -/
def theta (u v : Vec3) : ℝ :=
  Real.arccos (cosineSimilarity u v)

/-- Standard ring-torus embedding, with major/minor radii separated from
the curve names used in the historical message. -/
def torusPoint (major minor t angle : ℝ) : Vec3 :=
  ((major + minor * Real.cos angle) * Real.cos t,
   (major + minor * Real.cos angle) * Real.sin t,
   minor * Real.sin angle)

/-- Candidate output trace: parameter t is the major angle and theta(u,v)
is the minor angle. -/
def candidateTrace (u v : ℝ → Vec3) (major minor : ℝ) : ℝ → Vec3 :=
  fun t => torusPoint major minor t (theta (u t) (v t))

theorem dot3_comm (u v : Vec3) : dot3 u v = dot3 v u := by
  rcases u with ⟨u₁, u₂, u₃⟩
  rcases v with ⟨v₁, v₂, v₃⟩
  simp [dot3]
  ring

theorem cosineSimilarity_comm (u v : Vec3) :
    cosineSimilarity u v = cosineSimilarity v u := by
  unfold cosineSimilarity
  rw [dot3_comm u v, mul_comm]

theorem theta_comm (u v : Vec3) : theta u v = theta v u := by
  simp [theta, cosineSimilarity_comm]

theorem normSq_liftR (t : ℝ) :
    normSq3 (liftR t) = 2 := by
  simp [normSq3, dot3, liftR]
  nlinarith [Real.sin_sq_add_cos_sq t]

theorem normSq_liftQ (t : ℝ) :
    normSq3 (liftQ t) =
      4 * Real.cos t ^ 2 + Real.sin t ^ 2 + 1 := by
  simp [normSq3, dot3, liftQ, pow_two]
  ring

theorem dot_liftR_liftQ (t : ℝ) :
    dot3 (liftR t) (liftQ t) =
      2 * Real.cos t ^ 2 + Real.sin t ^ 2 + 1 := by
  simp [dot3, liftR, liftQ]
  ring

/-- Exact algebraic identity behind the displayed assistant-generated
Theta(t) formula. This proves the normalized-dot-product representation;
it does not prove that this is the original mechanical Donut map. -/
theorem cosineSimilarity_lift_formula (t : ℝ) :
    cosineSimilarity (liftR t) (liftQ t) =
      (2 * Real.cos t ^ 2 + Real.sin t ^ 2 + 1) /
        (Real.sqrt 2 *
          Real.sqrt (4 * Real.cos t ^ 2 + Real.sin t ^ 2 + 1)) := by
  rw [cosineSimilarity, dot_liftR_liftQ, normSq_liftR, normSq_liftQ]

theorem theta_lift_formula (t : ℝ) :
    theta (liftR t) (liftQ t) =
      Real.arccos
        ((2 * Real.cos t ^ 2 + Real.sin t ^ 2 + 1) /
          (Real.sqrt 2 *
            Real.sqrt (4 * Real.cos t ^ 2 + Real.sin t ^ 2 + 1))) := by
  unfold theta
  rw [cosineSimilarity_lift_formula]

/-- The assistant candidate's output is invariant under swapping its
ordered input curves, because the angle is symmetric. -/
theorem candidateTrace_swap
    (u v : ℝ → Vec3) (major minor : ℝ) :
    candidateTrace u v major minor =
      candidateTrace v u major minor := by
  funext t
  simp [candidateTrace, theta_comm]

/-- Two distinct ordered inputs cannot be recovered by a left-inverse
decoder when the encoding gives them the same output. -/
theorem no_left_inverse_of_swap_invariant
    {α β : Type*} (encode : α × α → β) (x y : α)
    (hxy : x ≠ y) (hswap : encode (x, y) = encode (y, x)) :
    ¬ ∃ decode : β → α × α, Function.LeftInverse decode encode := by
  rintro ⟨decode, hleft⟩
  have h := congrArg decode hswap
  rw [hleft (x, y), hleft (y, x)] at h
  exact hxy (congrArg Prod.fst h)

/-- The two lifted input curves are genuinely distinct: their first
coordinates differ at t = 0. -/
theorem liftR_ne_liftQ : liftR ≠ liftQ := by
  intro h
  have h0 := congrFun h 0
  have hfirst := congrArg Prod.fst h0
  norm_num [liftR, liftQ] at hfirst

/-- The assistant candidate trace cannot decode the ordered pair of
input curves for all inputs. This is conditional on the symmetric
angle-only candidate map defined above. -/
theorem candidateTrace_not_order_decodable (major minor : ℝ) :
    ¬ ∃ decode : (ℝ → Vec3) → (ℝ → Vec3) × (ℝ → Vec3),
      Function.LeftInverse decode
        (fun p => candidateTrace p.1 p.2 major minor) := by
  apply no_left_inverse_of_swap_invariant
    (fun p : (ℝ → Vec3) × (ℝ → Vec3) =>
      candidateTrace p.1 p.2 major minor)
    liftR liftQ
  · exact liftR_ne_liftQ
  · exact candidateTrace_swap liftR liftQ major minor

#print axioms cosineSimilarity_lift_formula
#print axioms theta_lift_formula
#print axioms candidateTrace_swap
#print axioms no_left_inverse_of_swap_invariant
#print axioms candidateTrace_not_order_decodable

end -- noncomputable section

end HsHVerification.AsterDonutCandidateAngle
