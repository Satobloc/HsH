import Mathlib

/-!
# 19-worker nominal assignment geometry

Controlling schedule: WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md
Git blob 90863a2a2b82b2d8e37ba1bd9f796389066f5409.
Controlling five-slot roster: WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md
Git blob 6b0bf56316fe14bfd2b0e925154025bd8d04eaa1.

The fixed :00 map h ↦ 5*h mod 19 is bijective. The phase-parameterized
extension proves that, for every one of the five slot offsets s ∈ Fin 5,
h ↦ (5*h+s) mod 19 is a bijection over a 19-hour nominal window. Thus each
worker occurs once in each phase, hence five times across the 95 nominal
(hour, phase) assignments in a complete 19-hour five-phase cycle.

These are nominal index theorems only. They do NOT prove that a task ran,
that its scheduled_for value was faithfully used, that a worker/thread was
authenticated, that a receipt exists, or that a handoff was delivered.
They say nothing about physical geometry or H(s)H theory.
-/

namespace HsHVerification.TernRotationFairness

def selectedIndex (h : Fin 19) : Fin 19 :=
  ⟨(5 * h.val) % 19, Nat.mod_lt _ (by decide)⟩

set_option maxRecDepth 4096 in
theorem selectedIndex_injective : Function.Injective selectedIndex := by
  decide

set_option maxRecDepth 4096 in
theorem selectedIndex_surjective : Function.Surjective selectedIndex := by
  decide

def selectedIndexAtPhase (phase : Fin 5) (h : Fin 19) : Fin 19 :=
  ⟨(5 * h.val + phase.val) % 19, Nat.mod_lt _ (by decide)⟩

set_option maxRecDepth 8192 in
theorem selectedIndexAtPhase_injective :
    ∀ phase : Fin 5, Function.Injective (selectedIndexAtPhase phase) := by
  decide

set_option maxRecDepth 8192 in
theorem selectedIndexAtPhase_surjective :
    ∀ phase : Fin 5, Function.Surjective (selectedIndexAtPhase phase) := by
  decide

theorem selectedIndexAtPhase_bijective (phase : Fin 5) :
    Function.Bijective (selectedIndexAtPhase phase) :=
  ⟨selectedIndexAtPhase_injective phase, selectedIndexAtPhase_surjective phase⟩

/-- The nominal h=564, s=4 assignment has ring index 12. -/
theorem scheduled_h564_s4_index : (5 * 564 + 4) % 19 = 12 := by
  decide

/-- The following nominal sequence index is 13. -/
theorem scheduled_h564_s4_next_index : (5 * 564 + 4 + 1) % 19 = 13 := by
  decide

#print axioms selectedIndex_injective
#print axioms selectedIndex_surjective
#print axioms selectedIndexAtPhase_injective
#print axioms selectedIndexAtPhase_surjective
#print axioms selectedIndexAtPhase_bijective
#print axioms scheduled_h564_s4_index
#print axioms scheduled_h564_s4_next_index

end HsHVerification.TernRotationFairness
