import HsHVerification.NadirE989MeasuredAcceptance
import Mathlib

/-!
Conditional projection and closure-gate mathematics for actual Fermilab
E989 measured-anomaly inputs. Distinguish orbit return from relative spin
return. The pair space below is an observation-coordinate model, not a
constructed finite-core worldtube or an experimental muon spin state.
-/

namespace HsHVerification.NadirE989ClosureProjection
open HsHVerification.NadirE989MeasuredAcceptance

theorem orbit_projection_not_injective :
    ¬ Function.Injective (fun state : ℚ × ℚ => state.1) := by
  intro hinj
  have hpair : ((0 : ℚ), aMu) = ((0 : ℚ), 0) := hinj rfl
  have hzero : aMu = 0 := congrArg Prod.snd hpair
  exact (ne_of_gt measured_anomaly_positive) hzero

theorem spin_closure_condition (n k : ℕ) (r : ℚ)
    (h : r = (k : ℚ) / n) (hn : 0 < n) : (n : ℚ) * r = k := by
  rw [h]
  have hne : (n : ℚ) ≠ 0 := by exact_mod_cast Nat.ne_of_gt hn
  field_simp

theorem two_primitive_classes_distinct :
    (11 : ℚ) / 322 ≠ (3 : ℚ) / 88 := by
  norm_num

theorem distinct_in_range :
    targetMomentumSq 322 11 ≠ targetMomentumSq 88 3 := by
  norm_num [targetMomentumSq, targetGamma, aMu, massMeV]

#print axioms orbit_projection_not_injective
#print axioms spin_closure_condition
#print axioms two_primitive_classes_distinct
#print axioms distinct_in_range

end HsHVerification.NadirE989ClosureProjection
