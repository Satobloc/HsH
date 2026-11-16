import Mathlib
import HsHVerification.EnheduannaPIVCountStage

/-!
# Set-valued acquisition lineage for derived count-stage outputs

The existing CountWitness records a count's processing stage and aggregation
scope. Calder's unit-level holdout theorem requires each channel to map to one
acquisition unit. A derived output can instead depend on several attempted
acquisitions. Its lineage must therefore be a set of contributing attempt IDs,
not a newly invented "aggregate unit".

This module formalizes the fold consequence of that set-valued lineage:
a derived output can receive one calibration/holdout fold exactly when every
attempt contributing to it has the same preassigned fold. Aggregation composes
lineage by taking the union of its inputs' source-attempt sets.

The source-attempt set is an evidence field, not something Lean discovers.
The AttemptLedger remains responsible for preserving every attempted run,
including attempts with no usable output. Fold purity prevents cross-fold
leakage; it does not prove statistical independence, lineage completeness,
correct count arithmetic, or a physical model.
-/

namespace HsHVerification.DerivedCountStageUnitLineage

open HsHVerification.EnheduannaPIVCountStage

/-- A typed processing-stage count bound to the attempted acquisitions that
contributed to this derived output. The source set is nonempty; missing or
failed attempts remain in the separate AttemptLedger. -/
structure CountStageLineageWitness (Attempt : Type*) [DecidableEq Attempt] where
  count : CountWitness
  sourceAttempts : Finset Attempt
  sourceAttempts_nonempty : sourceAttempts.Nonempty

/-- A derived count-stage output can be assigned one fold when all of its
contributing attempted acquisitions share that fold. -/
def SingleFoldAssigned {Attempt Fold : Type*} [DecidableEq Attempt]
    (witness : CountStageLineageWitness Attempt)
    (foldOfAttempt : Attempt → Fold) : Prop :=
  ∃ fold : Fold,
    ∀ attempt, attempt ∈ witness.sourceAttempts → foldOfAttempt attempt = fold

/-- All attempted acquisitions contributing to one derived output have the
same preassigned fold. -/
def FoldHomogeneous {Attempt Fold : Type*} [DecidableEq Attempt]
    (witness : CountStageLineageWitness Attempt)
    (foldOfAttempt : Attempt → Fold) : Prop :=
  ∀ a b, a ∈ witness.sourceAttempts → b ∈ witness.sourceAttempts →
    foldOfAttempt a = foldOfAttempt b

/-- A single fold assignment exists exactly when the witness's source-attempt
set is fold-homogeneous. Nonemptiness is part of CountStageLineageWitness. -/
theorem singleFoldAssigned_iff_foldHomogeneous
    {Attempt Fold : Type*} [DecidableEq Attempt]
    (witness : CountStageLineageWitness Attempt)
    (foldOfAttempt : Attempt → Fold) :
    SingleFoldAssigned witness foldOfAttempt ↔
      FoldHomogeneous witness foldOfAttempt := by
  constructor
  · rintro ⟨fold, hFold⟩ a b ha hb
    calc
      foldOfAttempt a = fold := hFold a ha
      _ = foldOfAttempt b := (hFold b hb).symm
  · intro hHomogeneous
    rcases witness.sourceAttempts_nonempty with ⟨a₀, ha₀⟩
    refine ⟨foldOfAttempt a₀, ?_⟩
    intro a ha
    exact hHomogeneous a a₀ ha ha₀

/-- If one derived output includes source attempts assigned to different
folds, it cannot be assigned to a single calibration/holdout fold. -/
theorem mixed_fold_sources_forbid_single_assignment
    {Attempt Fold : Type*} [DecidableEq Attempt]
    (witness : CountStageLineageWitness Attempt)
    (foldOfAttempt : Attempt → Fold)
    (hMixed :
      ∃ a b, a ∈ witness.sourceAttempts ∧
        b ∈ witness.sourceAttempts ∧
        foldOfAttempt a ≠ foldOfAttempt b) :
    ¬ SingleFoldAssigned witness foldOfAttempt := by
  rintro ⟨fold, hFold⟩
  rcases hMixed with ⟨a, b, ha, hb, hDifferent⟩
  apply hDifferent
  calc
    foldOfAttempt a = fold := hFold a ha
    _ = foldOfAttempt b := (hFold b hb).symm

/-- The transitive source-attempt set of an aggregate is the union of the
source-attempt sets of its input records. Inputs are assumed already to carry
their complete transitive lineage. -/
def aggregateSourceAttempts {Input Attempt : Type*} [DecidableEq Attempt]
    (sourceAttempts : Input → Finset Attempt)
    (inputs : Finset Input) : Finset Attempt :=
  inputs.biUnion sourceAttempts

theorem mem_aggregateSourceAttempts_iff
    {Input Attempt : Type*} [DecidableEq Attempt]
    (sourceAttempts : Input → Finset Attempt)
    (inputs : Finset Input)
    (attempt : Attempt) :
    attempt ∈ aggregateSourceAttempts sourceAttempts inputs ↔
      ∃ input, input ∈ inputs ∧ attempt ∈ sourceAttempts input := by
  simp [aggregateSourceAttempts]

/-- Aggregating only inputs whose contributing attempts all share one frozen
fold preserves fold-homogeneity. This is a conditional bookkeeping result,
not a claim that the contributing acquisitions are statistically independent. -/
theorem aggregate_foldHomogeneous_of_common_fold
    {Input Attempt Fold : Type*} [DecidableEq Attempt]
    (sourceAttempts : Input → Finset Attempt)
    (inputs : Finset Input)
    (foldOfAttempt : Attempt → Fold)
    (hCommon :
      ∃ fold, ∀ input, input ∈ inputs →
        ∀ attempt, attempt ∈ sourceAttempts input →
          foldOfAttempt attempt = fold) :
    ∀ a b,
      a ∈ aggregateSourceAttempts sourceAttempts inputs →
      b ∈ aggregateSourceAttempts sourceAttempts inputs →
      foldOfAttempt a = foldOfAttempt b := by
  rcases hCommon with ⟨fold, hFold⟩
  intro a b ha hb
  have ha' :=
    (mem_aggregateSourceAttempts_iff sourceAttempts inputs a).mp ha
  have hb' :=
    (mem_aggregateSourceAttempts_iff sourceAttempts inputs b).mp hb
  rcases ha' with ⟨inputA, hInputA, hA⟩
  rcases hb' with ⟨inputB, hInputB, hB⟩
  calc
    foldOfAttempt a = fold := hFold inputA hInputA a hA
    _ = foldOfAttempt b := (hFold inputB hInputB b hB).symm

#print axioms singleFoldAssigned_iff_foldHomogeneous
#print axioms mixed_fold_sources_forbid_single_assignment
#print axioms mem_aggregateSourceAttempts_iff
#print axioms aggregate_foldHomogeneous_of_common_fold

end HsHVerification.DerivedCountStageUnitLineage
