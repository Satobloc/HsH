import Mathlib

/-!
# Hourly :00 19-worker assignment geometry

Controlling schedule: WORKSPACES/COMMON/REVIVAL_ROTATION_V3_2026-10-11.md
Git blob 90863a2a2b82b2d8e37ba1bd9f796389066f5409.
Controlling five-slot roster: WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md
Git blob 603315c321b05572e99061bed2a2d121782f6f17.
Read 2026-10-27 06:00 UTC.

Formalized proposition: in a fixed :00 phase, mapping the 19 consecutive
nominal UTC-hour residues to ring indices by h ↦ 5*h mod 19 is a bijection.
This says NOTHING about receipt presence, worker authentication, publication,
physical geometry, or successful handoff. Observed 19-slot receipt audit is
separately source-critical and is not proven by this finite arithmetic fact.
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

#print axioms selectedIndex_injective
#print axioms selectedIndex_surjective

end HsHVerification.TernRotationFairness
