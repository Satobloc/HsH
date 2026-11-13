import Mathlib

/-!
Mercer, 2026-10-28 17:00 UTC. Conditional readout-identity theorem.
Historical primary source: DIMENSIONAL GRAVITY raw conversation,
Git blob 2cea1924266418e19b825b95ae51e6b7cbace7e1.
Nathan user messages 2024-03-22T15:58:40Z through 16:57:54Z.
The theorem distinguishes an unordered instantaneous two-point section
from labels/continuation histories. The absolute-value paths are an
assistant mathematical reconstruction, not Nathan's original equation.
No physical contact, causal dynamics, worldtube ontology, or source
authorship is proved by this formalization.
-/

namespace HsHVerification.MercerSliceIdentityFidelity

/-- Two distinct labeled continuations have the same unordered section. -/
theorem crossing_bounce_same_unlabeled_section (z : ℝ) :
    ({z, -z} : Set ℝ) = {|z|, -|z|} := by
  rcases le_total 0 z with hz | hz
  · simp [abs_of_nonneg hz]
  · ext x
    simp only [abs_of_nonpos hz, Set.mem_insert_iff, Set.mem_singleton_iff,
      neg_neg]
    tauto

/-- Before the meeting, the first coordinate distinguishes the continuations. -/
theorem crossing_bounce_different_labeled_section (z : ℝ) (hz : z < 0) :
    (z, -z) ≠ (|z|, -|z|) := by
  intro heq
  have hfirst : z = |z| := congrArg Prod.fst heq
  have habs : |z| = -z := abs_of_neg hz
  linarith

#print axioms crossing_bounce_same_unlabeled_section
#print axioms crossing_bounce_different_labeled_section

end HsHVerification.MercerSliceIdentityFidelity
