import Mathlib
import HsHVerification.PrecommittedHoldoutAdmission

/-!
# Frozen statistical-test families and dependence-robust error budgeting

This is a separate statistical-test family, not the model-candidate family
already carried by PrecommittedHoldoutPlan. Its finite set contains unique
hypothesis keys. The source manifest defines target values, tolerances, and
the deduplication rule; this Lean record carries a locator and declared digest
but does not authenticate the artifact.

The family must be locked before first external-corpus access. The familywise
bound below uses finite-union subadditivity, so it requires no independence
or disjointness assumption. Per-test rejection bounds remain premises: the
theorem does not establish p-value validity, exchangeability, a randomization
scheme, or the correctness of a physical target.

The family size is the cardinality of unique hypothesis keys, not the number
of source occurrences, equation variants, bins, pixels, snapshots, or repeated
measurements.
-/

namespace HsHVerification.CalderFrozenFamilywiseErrorBudget

open MeasureTheory
open HsHVerification.EvidenceGatedAdmission
open HsHVerification.PrecommittedHoldoutAdmission

/-- A frozen, nonempty family of unique statistical hypothesis keys. The
    manifest must contain the target values, tolerances, and deduplication
    rule. Clock values are declared ticks in one named timebase; their order
    is a typed assertion, not authenticated event-log evidence. -/
structure FrozenStatisticalTestFamily where
  hypothesisKeys : Finset String
  sourceManifest : SourceArtifactRef
  manifestDigest : NonEmptyText
  timeBaseId : NonEmptyText
  lockedAt : Nat
  firstExternalCorpusAccessAt : Nat
  nonempty : hypothesisKeys.Nonempty
  lockedBeforeFirstCorpusAccess : lockedAt < firstExternalCorpusAccessAt

/-- The event that at least one unique hypothesis in the frozen family is
    rejected. -/
def anyFamilyRejection {Ω : Type*}
    (family : FrozenStatisticalTestFamily) (reject : String → Set Ω) : Set Ω :=
  ⋃ key ∈ family.hypothesisKeys, reject key

/-- If every hypothesis has marginal rejection measure at most perTestBudget
    and the sum of those budgets is at most totalBudget, then the familywise
    rejection measure is at most totalBudget. The theorem also exposes the
    declared target-lock-before-data-access relation. It requires no
    independence assumption; the union bound is valid under arbitrary
    dependence among the tests. -/
theorem frozenFamilywiseError_le_budget
    {Ω : Type*}
    (family : FrozenStatisticalTestFamily)
    (μ : OuterMeasure Ω)
    (reject : String → Set Ω)
    (perTestBudget totalBudget : ENNReal)
    (hEach : ∀ key ∈ family.hypothesisKeys,
      μ (reject key) ≤ perTestBudget)
    (hTotal :
      (family.hypothesisKeys.card : ENNReal) * perTestBudget ≤ totalBudget) :
    family.lockedAt < family.firstExternalCorpusAccessAt ∧
      μ (anyFamilyRejection family reject) ≤ totalBudget := by
  refine ⟨family.lockedBeforeFirstCorpusAccess, ?_⟩
  unfold anyFamilyRejection
  calc
    μ (⋃ key ∈ family.hypothesisKeys, reject key)
        ≤ ∑ key ∈ family.hypothesisKeys, μ (reject key) :=
      measure_biUnion_finset_le family.hypothesisKeys reject
    _ ≤ ∑ key ∈ family.hypothesisKeys, perTestBudget := by
      exact Finset.sum_le_sum fun key hkey => hEach key hkey
    _ = (family.hypothesisKeys.card : ENNReal) * perTestBudget := by
      simp
    _ ≤ totalBudget := hTotal

/-- The statistical-test family lock composes with the existing one-shot
    holdout plan only when both records use the same declared timebase and
    first external-corpus access precedes or equals holdout access. -/
theorem familyLock_precedes_holdoutAccess
    (family : FrozenStatisticalTestFamily)
    (plan : PrecommittedHoldoutPlan)
    (hSameTimeBase : family.timeBaseId.value = plan.timeBaseId.value)
    (hCorpusBeforeHoldout :
      family.firstExternalCorpusAccessAt ≤ plan.firstHoldoutAccessAt) :
    family.timeBaseId.value = plan.timeBaseId.value ∧
      family.lockedAt < plan.firstHoldoutAccessAt := by
  exact
    ⟨hSameTimeBase,
      lt_of_lt_of_le family.lockedBeforeFirstCorpusAccess hCorpusBeforeHoldout⟩

#print axioms frozenFamilywiseError_le_budget
#print axioms familyLock_precedes_holdoutAccess

end HsHVerification.CalderFrozenFamilywiseErrorBudget
