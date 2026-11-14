import Mathlib

/-!
Elias Kern Track A / Review-MIND, 2026-11-09.

Source reviewed:
- HSH_RESOURCES/info/WORKFLOW_THREADING_PROTOTYPE.md,
  blob f87ff21918b6fa4804d090cdb9153aa0dd53d288.
- HSH_RESOURCES/tools/workflow_threading_demo.py,
  blob ce313e46b1b85ae35028b46a4196d2a945b535d8.

The source OutputReceipt contains a human-readable worker string, artifact,
seed_version, outcome, timestamp and metadata. The source's distinct_workers
property counts distinct worker strings. The sample return gate requires four
receipt rows, three distinct worker strings, and both success/failure labels.
It does not read an authenticated worker-instance or conversation identifier.

The IdentityAnnotatedReceipt below adds an authenticatedSubject field only
to model two possible identity assignments over the same source-visible rows.
That field is NOT present in the Python source. The witnesses are synthetic
software-state counterexamples, not actual worker records or human/model data.

The result is conditional: if the return threshold is intended to count
distinct labels, the source predicate does that. It cannot, by itself, establish
a count of authenticated worker instances or independent reasoning sources.
Distinct identity and source/exposure independence are separate dimensions.

Lean checks only this formalized projection and finite witness. It does not
authenticate repository records, prove the Python-to-Lean translation, or
establish any empirical fact about workers.
-/

namespace HsHVerification.EliasThreadingWorkerIdentity

structure VisibleReceipt where
  worker : String
  artifact : String
  seedVersion : String
  outcome : String
  deriving DecidableEq, Repr

structure IdentityAnnotatedReceipt where
  visible : VisibleReceipt
  authenticatedSubject : Option String
  deriving DecidableEq, Repr

def sourceVisibleProjection (rs : List IdentityAnnotatedReceipt) :
    List VisibleReceipt :=
  rs.map IdentityAnnotatedReceipt.visible

def distinctWorkerLabels (rs : List VisibleReceipt) : List String :=
  (rs.map VisibleReceipt.worker).eraseDups

/-- Source-shaped sample return predicate: four rows, three worker labels,
    and both outcome labels. -/
def sourceReturnGate (rs : List VisibleReceipt) : Bool :=
  (rs.length >= 4) &&
  ((distinctWorkerLabels rs).length >= 3) &&
  ((rs.map VisibleReceipt.outcome).contains "success") &&
  ((rs.map VisibleReceipt.outcome).contains "failure")

def distinctAuthenticatedSubjects
    (rs : List IdentityAnnotatedReceipt) : List String :=
  (rs.filterMap IdentityAnnotatedReceipt.authenticatedSubject).eraseDups

def authenticatedSubjectCount
    (rs : List IdentityAnnotatedReceipt) : Nat :=
  (distinctAuthenticatedSubjects rs).length

def row1 : VisibleReceipt :=
  ⟨"Mercer", "case-001.json", "demo-v1", "success"⟩

def row2 : VisibleReceipt :=
  ⟨"Orson", "case-002.json", "demo-v1", "failure"⟩

def row3 : VisibleReceipt :=
  ⟨"Comptroller", "case-003.json", "demo-v1", "success"⟩

def row4 : VisibleReceipt :=
  ⟨"Aster", "case-004.json", "demo-v1", "success"⟩

/-- Same four visible worker labels and outcomes, but one hypothetical
    authenticated subject behind all labels. -/
def aliasedWorld : List IdentityAnnotatedReceipt :=
  [ ⟨row1, some "subject-A"⟩
  , ⟨row2, some "subject-A"⟩
  , ⟨row3, some "subject-A"⟩
  , ⟨row4, some "subject-A"⟩
  ]

/-- The same visible receipts under a different hypothetical identity map. -/
def distinctWorld : List IdentityAnnotatedReceipt :=
  [ ⟨row1, some "subject-A"⟩
  , ⟨row2, some "subject-B"⟩
  , ⟨row3, some "subject-C"⟩
  , ⟨row4, some "subject-D"⟩
  ]

theorem same_source_visible_projection :
    sourceVisibleProjection aliasedWorld =
      sourceVisibleProjection distinctWorld := by
  decide

theorem source_gate_passes_for_aliased_world :
    sourceReturnGate (sourceVisibleProjection aliasedWorld) = true := by
  decide

theorem source_gate_passes_for_distinct_world :
    sourceReturnGate (sourceVisibleProjection distinctWorld) = true := by
  decide

theorem aliased_world_has_one_authenticated_subject :
    authenticatedSubjectCount aliasedWorld = 1 := by
  decide

theorem distinct_world_has_four_authenticated_subjects :
    authenticatedSubjectCount distinctWorld = 4 := by
  decide

/-- No deterministic function of the source-visible receipt projection can
    recover authenticated-subject count for every identity assignment. -/
theorem no_label_only_function_recovers_authenticated_count :
    ¬ ∃ f : List VisibleReceipt → Nat,
        ∀ rs : List IdentityAnnotatedReceipt,
          f (sourceVisibleProjection rs) =
            authenticatedSubjectCount rs := by
  rintro ⟨f, hf⟩
  have hAlias := hf aliasedWorld
  have hDistinct := hf distinctWorld
  have hSame := congrArg f same_source_visible_projection
  rw [aliased_world_has_one_authenticated_subject] at hAlias
  rw [distinct_world_has_four_authenticated_subjects] at hDistinct
  omega

/-- The source gate can pass while the authenticated-subject count is one. -/
theorem source_gate_does_not_imply_three_authenticated_subjects :
    sourceReturnGate (sourceVisibleProjection aliasedWorld) = true ∧
      authenticatedSubjectCount aliasedWorld = 1 := by
  exact ⟨source_gate_passes_for_aliased_world,
    aliased_world_has_one_authenticated_subject⟩

#eval sourceReturnGate (sourceVisibleProjection aliasedWorld)
#eval authenticatedSubjectCount aliasedWorld
#eval authenticatedSubjectCount distinctWorld

#print axioms same_source_visible_projection
#print axioms source_gate_passes_for_aliased_world
#print axioms source_gate_passes_for_distinct_world
#print axioms aliased_world_has_one_authenticated_subject
#print axioms distinct_world_has_four_authenticated_subjects
#print axioms no_label_only_function_recovers_authenticated_count
#print axioms source_gate_does_not_imply_three_authenticated_subjects

end HsHVerification.EliasThreadingWorkerIdentity
