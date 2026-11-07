import Mathlib

/-!
Source-conditional formalization of an ACTUAL archive conversation graph.
Primary: HsH/DEVELOPMENT_FULL_CONVOS/26.06.20•26.06.22•Einstein-Rosen Bridges — raw.json
Git blob 849f2a00cb93e50cf16c440ff91468c1f3f2d0f3, 97 mapping nodes.
Current-node ancestry has 87 nodes. Parent
7750b27d-22f0-4722-bf05-970ec2515ace has three user-edit siblings.
Their IDs and branch membership were inspected directly, not inferred
from flattened text. The third is the only one on the exported selected
ancestry. This file checks transcribed finite graph facts, NOT the
correctness of a neutrino theory, observational fit or physical ontology.
-/

namespace HsHVerification.LoomJune2026EditGraph

inductive Version where
  | first
  | revised
  | selected
  deriving DecidableEq, Repr

def rawUUID : Version → String
  | .first => "8aa597fa-5f31-417d-89ab-75e63450ce27"
  | .revised => "0990d002-9443-41f2-ae72-a5a72cd496d3"
  | .selected => "52e37185-74b2-4e34-9e06-758e13de0e67"

def parentUUID (_ : Version) : String :=
  "7750b27d-22f0-4722-bf05-970ec2515ace"

def onSelectedAncestry : Version → Bool
  | .first => false
  | .revised => false
  | .selected => true

theorem all_three_are_siblings :
    parentUUID .first = parentUUID .revised ∧
    parentUUID .revised = parentUUID .selected := by decide

theorem different_source_nodes :
    rawUUID .first ≠ rawUUID .revised ∧
    rawUUID .revised ≠ rawUUID .selected ∧
    rawUUID .first ≠ rawUUID .selected := by decide

theorem only_final_variant_on_exported_ancestry :
    onSelectedAncestry .first = false ∧
    onSelectedAncestry .revised = false ∧
    onSelectedAncestry .selected = true := by decide

theorem ancestry_selection_is_unique :
    ∀ v : Version, onSelectedAncestry v = true ↔ v = .selected := by
  intro v
  cases v <;> decide

#print axioms all_three_are_siblings
#print axioms different_source_nodes
#print axioms only_final_variant_on_exported_ancestry
#print axioms ancestry_selection_is_unique

end HsHVerification.LoomJune2026EditGraph
