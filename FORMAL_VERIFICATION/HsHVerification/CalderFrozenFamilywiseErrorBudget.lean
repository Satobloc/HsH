import Mathlib
import HsHVerification.PrecommittedHoldoutAdmission

/-!
# Frozen-family, dependence-robust error budgeting

A finite family of unique, source-addressed hypothesis keys is frozen before
the first external-corpus access. The family manifest is the source of target
values, tolerances, and the deduplication rule; this Lean structure carries
its locator and declared digest but does not authenticate the artifact.

For any finite family of rejection events, outer-measure subadditivity bounds
the familywise rejection event by the sum of the marginal rejection bounds.
No independence or disjointness assumption is required. The per-test bounds
remain premises: this theorem does not establish p-value validity, exchangeability,
a randomization scheme, or the correctness of a physical target.

The family size is the cardinality of the finite set of unique hypothesis
keys, not the number of source occurrences, equation variants, bins, pixels,
or repeated measurements.
-/

namespace HsHVerification.CalderFrozenFamilywiseErrorBudget

open MeasureTheory
open HsHVerification.EvidenceGatedAdmission

/-- A frozen, nonempty family of unique hypothesis keys. The manifest must
    contain the target values, tolerances, and deduplication rule. The clock
    fields are declared ticks in one named timebase; their ordering is a
    typed assertion, not authenticated event-log evidence. -/
structure FrozenTargetFamily where
  hypothesisKeys : Finset String
  sourceManifest : SourceArtifactRef
  manifestDigest : NonEmptyText
  clockId : NonEmptyText
  lockedAt : Nat
  firstCorpusAccessAt : Nat
  nonempty : hypothesisKeys.Nonempty
  lockedBeforeCorpusAccess : lockedAt < firstCorpusAccessAt

/-- The event that at least one unique hypothesis in the frozen family is
    rejected. -/
def anyFamilyRejection {Ω : Type*}
    (family : FrozenTargetFamily) (reject : String → Set Ω) : Set Ω :=
  ⋃ key ∈ family.hypothesisKeys, reject key

/-- If every hypothesis has marginal rejection measure at most perTestBudget
    and the sum of those budgets is at most totalBudget, then the familywise
    rejection measure is at most totalBudget. The theorem also exposes the
    declared target-lock-before-data-access relation. It requires no
    independence assumption; the union bound is valid under arbitrary
    dependence among the tests. -/
theorem frozenFamilywiseError_le_budget
    {Ω : Type*}
    (family : FrozenTargetFamily)
    (μ : OuterMeasure Ω)
    (reject : String → Set Ω)
    (perTestBudget totalBudget : ℝ≥0∞)
    (hEach : ∀ key ∈ family.hypothesisKeys,
      μ (reject key) ≤ perTestBudget)
    (hTotal :
      (family.hypothesisKeys.card : ℝ≥0∞) * perTestBudget ≤ totalBudget) :
    family.lockedAt < family.firstCorpusAccessAt ∧
      μ (anyFamilyRejection family reject) ≤ totalBudget := by
  refine ⟨family.lockedBeforeCorpusAccess, ?_⟩
  unfold anyFamilyRejection
  calc
    μ (⋃ key ∈ family.hypothesisKeys, reject key)
        ≤ ∑ key ∈ family.hypothesisKeys, μ (reject key) :=
      measure_biUnion_finset_le family.hypothesisKeys reject
    _ ≤ ∑ key ∈ family.hypothesisKeys, perTestBudget := by
      exact Finset.sum_le_sum fun key hkey => hEach key hkey
    _ = (family.hypothesisKeys.card : ℝ≥0∞) * perTestBudget := by
      simp
    _ ≤ totalBudget := hTotal

#print axioms frozenFamilywiseError_le_budget

end HsHVerification.CalderFrozenFamilywiseErrorBudget
