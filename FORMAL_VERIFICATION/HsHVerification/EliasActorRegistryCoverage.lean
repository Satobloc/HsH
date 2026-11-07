import Mathlib

/-!
Elias Kern Track A / 2026-10-29 :48 Review-MIND.
Source-faithful exact-string registry coverage audit, not a production policy.

Actual source: Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py
Git blob 49988a769389b2baf264a27d596ba7c3ff822b36.
Original prototype ACTORS keys are exactly Comptroller, Orson Vey,
Meridian, Sable. Switchboard.wake indexes ACTORS[actor] directly.
The current 19-name Workshop Relay ring is recorded in the controlling
2026-10-11 revival rotation and 2026-10-26 steering prompts.

The finite data are transcribed, not independently authenticated by Lean.
No identity alias is inferred: Orson Vey and Orson Vay are different strings;
Comptroller and Tern Rook are different strings.
The POC is intentionally sandboxed and does not claim 19-worker support.
-/

namespace HsHVerification.EliasActorRegistryCoverage

def ring : List String :=
  ["Sable", "Loom", "Aster", "Ariadne", "Alberr", "Mira",
   "Aldus", "Calder", "Hale", "Elias Kern", "Nadir Voss",
   "Enheduanna", "Tern Rook", "Morrow", "Kestrel", "Meridian",
   "Mercer", "Ravel", "Orson Vay"]

def prototypeKeys : List String :=
  ["Comptroller", "Orson Vey", "Meridian", "Sable"]

def admitted : List String :=
  ring.filter (fun s => prototypeKeys.contains s)

def unregistered : List String :=
  ring.filter (fun s => !prototypeKeys.contains s)

theorem ring_has_nineteen : ring.length = 19 := by decide

theorem prototype_has_four_keys : prototypeKeys.length = 4 := by decide

theorem exactly_two_ring_names_registered :
    admitted = ["Sable", "Meridian"] := by decide

theorem seventeen_ring_names_unregistered :
    unregistered.length = 17 := by decide

theorem named_elias_unregistered :
    "Elias Kern" ∈ ring ∧ "Elias Kern" ∉ prototypeKeys := by decide

theorem distinct_orson_spellings :
    "Orson Vay" ∈ ring ∧ "Orson Vay" ∉ prototypeKeys ∧
    "Orson Vey" ∈ prototypeKeys := by decide

theorem role_name_not_same_as_worker_name :
    "Tern Rook" ∈ ring ∧ "Tern Rook" ∉ prototypeKeys ∧
    "Comptroller" ∈ prototypeKeys := by decide

theorem ring_not_fully_registered :
    ¬ ∀ s, s ∈ ring → s ∈ prototypeKeys := by
  intro h
  have hElias : "Elias Kern" ∈ prototypeKeys := h _ (by decide)
  exact (by decide : "Elias Kern" ∉ prototypeKeys) hElias

#print axioms ring_has_nineteen
#print axioms exactly_two_ring_names_registered
#print axioms seventeen_ring_names_unregistered
#print axioms distinct_orson_spellings
#print axioms ring_not_fully_registered

end HsHVerification.EliasActorRegistryCoverage
