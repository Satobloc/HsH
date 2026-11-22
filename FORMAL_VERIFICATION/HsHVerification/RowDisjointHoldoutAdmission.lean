import Mathlib
import HsHVerification.PrecommittedHoldoutAdmission

/-
Row- and split-unit-disjoint precommitted holdout admission.

The existing PrecommittedHoldoutPlan requires distinct calibration and holdout
set identifiers and carries artifact locators, but it does not require the
artifacts to enumerate non-overlapping record keys or non-overlapping
split-unit keys. Distinct labels alone therefore do not establish a
leakage-resistant holdout.

This opt-in wrapper requires nonempty calibration and holdout record sets,
both drawn from one declared dataset inventory, with disjoint split-unit
keys. It binds the dataset, calibration and holdout artifact locators to the
existing precommitted plan. Unused dataset rows may remain outside both sets.

The split-unit key is the declared grouping unit appropriate to the
evaluation design (for example an event, subject, run or source unit). The
formalization proves only that no declared split-unit key crosses the
partitions. It does not prove statistical independence between distinct
units, authenticate the artifacts, validate the row-key or grouping map,
establish clock provenance, or verify the recorded physical outcome.

No physical dataset, numerical fixture or physical calculation is instantiated.
-/

namespace HsHVerification.RowDisjointHoldoutAdmission

open HsHVerification.EvidenceGatedAdmission
open HsHVerification.PrecommittedHoldoutAdmission

universe uH uS uHF uSF uCF uP uR uU

/-- A source-addressed dataset split with explicit record and grouping keys.
    The record and split-unit values may be opaque/pseudonymous identifiers;
    their source mapping must be reviewed outside Lean. -/
structure DatasetRowSplitWitness
    (RecordId : Type uR) (SplitUnitId : Type uU)
    [DecidableEq RecordId] [DecidableEq SplitUnitId] where
  datasetId : NonEmptyText
  datasetArtifact : SourceArtifactRef
  inventoryArtifact : SourceArtifactRef
  inventorySourceDatasetArtifact : SourceArtifactRef
  recordKeySchemaArtifact : SourceArtifactRef
  splitUnitMapArtifact : SourceArtifactRef
  calibrationSetId : NonEmptyText
  holdoutSetId : NonEmptyText
  calibrationArtifact : SourceArtifactRef
  holdoutArtifact : SourceArtifactRef
  datasetRows : Finset RecordId
  calibrationRows : Finset RecordId
  holdoutRows : Finset RecordId
  splitUnitOf : RecordId → SplitUnitId
  datasetSplitUnits : Finset SplitUnitId
  calibrationSplitUnits : Finset SplitUnitId
  holdoutSplitUnits : Finset SplitUnitId
  inventorySourceBound :
    inventorySourceDatasetArtifact = datasetArtifact
  datasetRowsUseDeclaredSplitUnits :
    ∀ r, r ∈ datasetRows → splitUnitOf r ∈ datasetSplitUnits
  calibrationRowsWithinDataset :
    ∀ r, r ∈ calibrationRows → r ∈ datasetRows
  holdoutRowsWithinDataset :
    ∀ r, r ∈ holdoutRows → r ∈ datasetRows
  calibrationRowsNonempty : calibrationRows.Nonempty
  holdoutRowsNonempty : holdoutRows.Nonempty
  calibrationSplitUnitsWithinDataset :
    ∀ u, u ∈ calibrationSplitUnits → u ∈ datasetSplitUnits
  holdoutSplitUnitsWithinDataset :
    ∀ u, u ∈ holdoutSplitUnits → u ∈ datasetSplitUnits
  calibrationRowsUseDeclaredSplitUnits :
    ∀ r, r ∈ calibrationRows → splitUnitOf r ∈ calibrationSplitUnits
  holdoutRowsUseDeclaredSplitUnits :
    ∀ r, r ∈ holdoutRows → splitUnitOf r ∈ holdoutSplitUnits
  splitUnitKeysDisjoint :
    ∀ u, u ∈ calibrationSplitUnits → u ∉ holdoutSplitUnits

/-- Distinct set labels do not imply distinct underlying records. This
    abstract counterexample explains why ID inequality alone is insufficient. -/
structure LabelledRecordSet (RecordId : Type uR)
    [DecidableEq RecordId] where
  id : String
  rows : Finset RecordId

theorem distinctSetIds_do_not_imply_recordDisjointness
    {RecordId : Type uR} [DecidableEq RecordId] (r : RecordId) :
    ∃ calibration holdout : LabelledRecordSet RecordId,
      calibration.id ≠ holdout.id ∧
      r ∈ calibration.rows ∧ r ∈ holdout.rows := by
  refine ⟨⟨"calibration", {r}⟩, ⟨"holdout", {r}⟩, ?_, ?_, ?_⟩
  · decide
  · simp
  · simp

/-- Every calibration record is absent from the holdout record set. -/
theorem DatasetRowSplitWitness.calibrationRows_disjoint
    {RecordId : Type uR} {SplitUnitId : Type uU}
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    (split : DatasetRowSplitWitness RecordId SplitUnitId) :
    ∀ r, r ∈ split.calibrationRows → r ∉ split.holdoutRows := by
  intro r hCalibration hHoldout
  exact split.splitUnitKeysDisjoint (split.splitUnitOf r)
    (split.calibrationRowsUseDeclaredSplitUnits r hCalibration)
    (split.holdoutRowsUseDeclaredSplitUnits r hHoldout)

/-- No declared split-unit key is shared across calibration and holdout. -/
theorem DatasetRowSplitWitness.crossPartitionSplitUnits_distinct
    {RecordId : Type uR} {SplitUnitId : Type uU}
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    (split : DatasetRowSplitWitness RecordId SplitUnitId) :
    ∀ calibrationRow, calibrationRow ∈ split.calibrationRows →
      ∀ holdoutRow, holdoutRow ∈ split.holdoutRows →
        split.splitUnitOf calibrationRow ≠ split.splitUnitOf holdoutRow := by
  intro calibrationRow hCalibration holdoutRow hHoldout hSameUnit
  have hCalibrationUnit :
      split.splitUnitOf holdoutRow ∈ split.calibrationSplitUnits := by
    rw [← hSameUnit]
    exact split.calibrationRowsUseDeclaredSplitUnits calibrationRow hCalibration
  exact split.splitUnitKeysDisjoint (split.splitUnitOf holdoutRow)
    hCalibrationUnit
    (split.holdoutRowsUseDeclaredSplitUnits holdoutRow hHoldout)

/-- A row-disjoint comparison wraps the existing precommitted heterogeneous
    comparison without changing its legacy API. The split's source artifacts
    and identifiers must match the same frozen evaluation plan. -/
structure RowDisjointPrecommittedComparison
    (RecordId : Type uR) (SplitUnitId : Type uU)
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    (HState : Type uH) (SState : Type uS)
    (HField : Type uHF) (SField : Type uSF)
    (CommonField : Type uCF)
    (Payload : MeasurementMode → Type uP) where
  comparison :
    PrecommittedHeterogeneousModelComparison
      HState SState HField SField CommonField Payload
  split : DatasetRowSplitWitness RecordId SplitUnitId
  datasetIdBound :
    split.datasetId.value = comparison.holdout.datasetId.value
  datasetArtifactBound :
    split.datasetArtifact = comparison.holdout.datasetArtifact
  calibrationSetIdBound :
    split.calibrationSetId.value = comparison.holdout.calibrationSetId.value
  holdoutSetIdBound :
    split.holdoutSetId.value = comparison.holdout.holdoutSetId.value
  calibrationArtifactBound :
    split.calibrationArtifact = comparison.holdout.calibrationSetArtifact
  holdoutArtifactBound :
    split.holdoutArtifact = comparison.holdout.holdoutSetArtifact

/-- The stricter wrapper preserves all existing precommitted evidence. -/
theorem rowDisjointComparison_preserves_precommittedEvidence
    {RecordId : Type uR} {SplitUnitId : Type uU}
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    {HState : Type uH} {SState : Type uS}
    {HField : Type uHF} {SField : Type uSF}
    {CommonField : Type uCF}
    {Payload : MeasurementMode → Type uP}
    (c : RowDisjointPrecommittedComparison
      RecordId SplitUnitId HState SState HField SField CommonField Payload) :
    PrecommittedComparisonEvidence c.comparison :=
  precommittedComparison_has_evidence c.comparison

/-- The split is bound to the exact dataset, calibration and holdout artifacts
    and identifiers already carried by the precommitted evaluation plan. -/
theorem rowDisjointComparison_has_bound_splitArtifacts
    {RecordId : Type uR} {SplitUnitId : Type uU}
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    {HState : Type uH} {SState : Type uS}
    {HField : Type uHF} {SField : Type uSF}
    {CommonField : Type uCF}
    {Payload : MeasurementMode → Type uP}
    (c : RowDisjointPrecommittedComparison
      RecordId SplitUnitId HState SState HField SField CommonField Payload) :
    c.split.datasetArtifact = c.comparison.holdout.datasetArtifact ∧
    c.split.inventorySourceDatasetArtifact = c.split.datasetArtifact ∧
    c.split.calibrationArtifact = c.comparison.holdout.calibrationSetArtifact ∧
    c.split.holdoutArtifact = c.comparison.holdout.holdoutSetArtifact ∧
    c.split.datasetId.value = c.comparison.holdout.datasetId.value ∧
    c.split.calibrationSetId.value = c.comparison.holdout.calibrationSetId.value ∧
    c.split.holdoutSetId.value = c.comparison.holdout.holdoutSetId.value := by
  exact
    ⟨c.datasetArtifactBound,
      c.split.inventorySourceBound,
      c.calibrationArtifactBound,
      c.holdoutArtifactBound,
      c.datasetIdBound,
      c.calibrationSetIdBound,
      c.holdoutSetIdBound⟩

/-- The admitted split has nonempty calibration and holdout sets, both drawn
    from the same declared dataset inventory, with no row or split-unit
    overlap. -/
theorem rowDisjointComparison_has_nonempty_nonoverlappingSplit
    {RecordId : Type uR} {SplitUnitId : Type uU}
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    {HState : Type uH} {SState : Type uS}
    {HField : Type uHF} {SField : Type uSF}
    {CommonField : Type uCF}
    {Payload : MeasurementMode → Type uP}
    (c : RowDisjointPrecommittedComparison
      RecordId SplitUnitId HState SState HField SField CommonField Payload) :
    c.split.calibrationRows.Nonempty ∧
    c.split.holdoutRows.Nonempty ∧
    (∀ r, r ∈ c.split.calibrationRows → r ∈ c.split.datasetRows) ∧
    (∀ r, r ∈ c.split.holdoutRows → r ∈ c.split.datasetRows) ∧
    (∀ r, r ∈ c.split.calibrationRows → r ∉ c.split.holdoutRows) ∧
    (∀ calibrationRow, calibrationRow ∈ c.split.calibrationRows →
      ∀ holdoutRow, holdoutRow ∈ c.split.holdoutRows →
        c.split.splitUnitOf calibrationRow ≠ c.split.splitUnitOf holdoutRow) := by
  refine ⟨c.split.calibrationRowsNonempty,
    c.split.holdoutRowsNonempty,
    c.split.calibrationRowsWithinDataset,
    c.split.holdoutRowsWithinDataset,
    ?_,
    ?_⟩
  · exact c.split.calibrationRows_disjoint
  · exact c.split.crossPartitionSplitUnits_distinct

/-- Two candidate comparisons can be tied only when they share the exact same
    precommitted evaluation and the exact same source-bound row/split-unit
    partition, not merely matching calibration/holdout labels. -/
def rowDisjointPrecommittedIntelligibilityTieBreak
    {RecordId : Type uR} {SplitUnitId : Type uU}
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    {HState : Type uH} {SState : Type uS}
    {HField : Type uHF} {SField : Type uSF}
    {CommonField : Type uCF}
    {Payload : MeasurementMode → Type uP}
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : RowDisjointPrecommittedComparison
      RecordId SplitUnitId HState SState HField SField CommonField Payload) :
    Prop :=
  precommittedHeterogeneousIntelligibilityTieBreak
    empiricallyEquivalent humanPrefers a.comparison b.comparison ∧
  a.split = b.split

theorem rowDisjointTieBreak_requires_same_split
    {RecordId : Type uR} {SplitUnitId : Type uU}
    [DecidableEq RecordId] [DecidableEq SplitUnitId]
    {HState : Type uH} {SState : Type uS}
    {HField : Type uHF} {SField : Type uSF}
    {CommonField : Type uCF}
    {Payload : MeasurementMode → Type uP}
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : RowDisjointPrecommittedComparison
      RecordId SplitUnitId HState SState HField SField CommonField Payload)
    (h : rowDisjointPrecommittedIntelligibilityTieBreak
      empiricallyEquivalent humanPrefers a b) :
    a.split = b.split :=
  h.2

#print axioms distinctSetIds_do_not_imply_recordDisjointness
#print axioms DatasetRowSplitWitness.calibrationRows_disjoint
#print axioms DatasetRowSplitWitness.crossPartitionSplitUnits_distinct
#print axioms rowDisjointComparison_preserves_precommittedEvidence
#print axioms rowDisjointComparison_has_bound_splitArtifacts
#print axioms rowDisjointComparison_has_nonempty_nonoverlappingSplit
#print axioms rowDisjointTieBreak_requires_same_split

end HsHVerification.RowDisjointHoldoutAdmission
