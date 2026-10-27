import Mathlib

/-!
# Elias Kern: evidence-revision blindness in the sandboxed Hydra history key

Source: Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py
Git blob: 49988a769389b2baf264a27d596ba7c3ff822b36
Source methods: Switchboard.apply_checks, Switchboard.condition, Switchboard.hydra.

The Python statekey serializes node, stage and directive-incorporation state,
but omits candidate ID and evidence revision. This file formalizes only that
information projection and its equality consequences. It does NOT prove that
the Python implementation is equivalent to this model, that a review occurred,
or that any physical proposition is true.
-/

namespace HsHVerification.EliasHydraRevision

structure Snapshot where
  node : String
  stage : String
  directives : List (String × Bool)
  candidateId : String
  revision : Nat
deriving DecidableEq, Repr

structure LegacyKey where
  node : String
  stage : String
  directives : List (String × Bool)
deriving DecidableEq, Repr

structure RevisionKey where
  node : String
  stage : String
  directives : List (String × Bool)
  candidateId : String
  revision : Nat
deriving DecidableEq, Repr

def legacyKey (s : Snapshot) : LegacyKey :=
  ⟨s.node, s.stage, s.directives⟩

def revisionKey (s : Snapshot) : RevisionKey :=
  ⟨s.node, s.stage, s.directives, s.candidateId, s.revision⟩

def legacySeen (recorded : LegacyKey) (s : Snapshot) : Prop :=
  legacyKey s = recorded

theorem legacy_key_ignores_revision (s : Snapshot) (r : Nat) :
    legacyKey {s with revision := r} = legacyKey s := by
  rfl

theorem legacy_guard_suppresses_revisit (s : Snapshot) (r : Nat) :
    legacySeen (legacyKey s) {s with revision := r} := by
  rfl

theorem legacy_key_ignores_candidate (s : Snapshot) (other : String) :
    legacyKey {s with candidateId := other} = legacyKey s := by
  rfl

theorem revision_key_distinguishes_revision
    (s : Snapshot) (r : Nat) (hne : r ≠ s.revision) :
    revisionKey {s with revision := r} ≠ revisionKey s := by
  intro he
  have hrev := congrArg RevisionKey.revision he
  have : r = s.revision := by simpa [revisionKey] using hrev
  exact hne this

#print axioms legacy_key_ignores_revision
#print axioms legacy_guard_suppresses_revisit
#print axioms legacy_key_ignores_candidate
#print axioms revision_key_distinguishes_revision

end HsHVerification.EliasHydraRevision
