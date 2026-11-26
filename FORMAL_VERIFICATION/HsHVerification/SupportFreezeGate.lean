import Mathlib

/-!
Support-freeze gate for confirmatory model comparison.

This is a workflow/identity contract, not a physical theorem. It composes the
existing source-support-relative map requirement with the existing rule that
the source map, domain, calibration, holdout split, and scoring rule are frozen
before holdout access.

The Nat fields are abstract monotone audit-clock ticks, not physical time.
String digests/IDs are supplied external witnesses: this module does not prove
that a digest faithfully serializes a support predicate, that timestamps are
truthful, or that holdout access was actually prevented.
-/

namespace HsHVerification.SupportFreezeGate

/-- The generation token is compared exactly below. Its global non-reuse across
    support versions is an external protocol invariant, not proved here. -/
structure SupportSpec where
  id : String
  sourceContextId : String
  generation : Nat
  digest : String
  frozenAt : Nat
deriving Repr, DecidableEq

structure HoldoutSpec where
  id : String
  firstAccessAt : Nat
deriving Repr, DecidableEq

structure ComparisonRecord where
  supportId : String
  sourceContextId : String
  supportGeneration : Nat
  supportDigest : String
  holdoutId : String
  hshReadoutId : String
  standardReadoutId : String
  hshCalibrationId : String
  standardCalibrationId : String
  hshSharedParameterSetId : String
  standardSharedParameterSetId : String
  evaluatedAt : Nat
deriving Repr, DecidableEq

/-- The confirmatory envelope: the exact support specification must predate
    first holdout access and remain identical in the comparison record.
    Both model arms must share the readout, calibration, and shared-parameter
    identities. H(s)H-specific derived parameters remain separately governed
    by the source-derived map contract. -/
structure ConfirmatoryWitness
    (s : SupportSpec) (h : HoldoutSpec) (c : ComparisonRecord) : Prop where
  frozenBeforeFirstAccess : s.frozenAt < h.firstAccessAt
  supportIdentityMatches : c.supportId = s.id
  sourceContextMatches : c.sourceContextId = s.sourceContextId
  generationMatches : c.supportGeneration = s.generation
  digestMatches : c.supportDigest = s.digest
  holdoutMatches : c.holdoutId = h.id
  evaluatedAfterAccess : h.firstAccessAt ≤ c.evaluatedAt
  sameReadout : c.hshReadoutId = c.standardReadoutId
  sameCalibration : c.hshCalibrationId = c.standardCalibrationId
  sameSharedParameters :
    c.hshSharedParameterSetId = c.standardSharedParameterSetId

/-- Executable Boolean projection of the confirmatory identity/time gate. -/
def confirmatoryGate (s : SupportSpec) (h : HoldoutSpec)
    (c : ComparisonRecord) : Bool :=
  decide (s.frozenAt < h.firstAccessAt) &&
  decide (c.supportId = s.id) &&
  decide (c.sourceContextId = s.sourceContextId) &&
  decide (c.supportGeneration = s.generation) &&
  decide (c.supportDigest = s.digest) &&
  decide (c.holdoutId = h.id) &&
  decide (h.firstAccessAt ≤ c.evaluatedAt) &&
  decide (c.hshReadoutId = c.standardReadoutId) &&
  decide (c.hshCalibrationId = c.standardCalibrationId) &&
  decide (c.hshSharedParameterSetId = c.standardSharedParameterSetId)

theorem witness_implies_gate_true
    {s : SupportSpec} {h : HoldoutSpec} {c : ComparisonRecord}
    (w : ConfirmatoryWitness s h c) :
    confirmatoryGate s h c = true := by
  cases w
  simp [confirmatoryGate, *]

theorem changed_support_digest_blocks_gate
    {s : SupportSpec} {h : HoldoutSpec} {c : ComparisonRecord}
    (hd : c.supportDigest ≠ s.digest) :
    confirmatoryGate s h c = false := by
  simp [confirmatoryGate, hd]

theorem changed_support_generation_blocks_gate
    {s : SupportSpec} {h : HoldoutSpec} {c : ComparisonRecord}
    (hg : c.supportGeneration ≠ s.generation) :
    confirmatoryGate s h c = false := by
  simp [confirmatoryGate, hg]

theorem support_frozen_after_first_access_blocks_gate
    {s : SupportSpec} {h : HoldoutSpec} {c : ComparisonRecord}
    (hlate : h.firstAccessAt ≤ s.frozenAt) :
    confirmatoryGate s h c = false := by
  have hnot : ¬ s.frozenAt < h.firstAccessAt := by omega
  simp [confirmatoryGate, hnot]

/-! Pure logical smoke witnesses only. These identifiers and clock ticks are
    illustrative software-state values, not physical fixtures or observations. -/

def demoSupport : SupportSpec :=
  { id := "support-v1"
    sourceContextId := "source-release-v1"
    generation := 1
    digest := "digest-v1"
    frozenAt := 10 }

def demoHoldout : HoldoutSpec :=
  { id := "holdout-v1"
    firstAccessAt := 20 }

def demoComparison : ComparisonRecord :=
  { supportId := "support-v1"
    sourceContextId := "source-release-v1"
    supportGeneration := 1
    supportDigest := "digest-v1"
    holdoutId := "holdout-v1"
    hshReadoutId := "readout-v1"
    standardReadoutId := "readout-v1"
    hshCalibrationId := "calibration-v1"
    standardCalibrationId := "calibration-v1"
    hshSharedParameterSetId := "shared-parameters-v1"
    standardSharedParameterSetId := "shared-parameters-v1"
    evaluatedAt := 21 }

#eval confirmatoryGate demoSupport demoHoldout demoComparison
#eval confirmatoryGate
  { demoSupport with digest := "support-v2-digest" }
  demoHoldout demoComparison
#eval confirmatoryGate
  { demoSupport with frozenAt := 21 }
  demoHoldout demoComparison
#eval confirmatoryGate
  { demoSupport with generation := 2 }
  demoHoldout demoComparison

#print axioms witness_implies_gate_true
#print axioms changed_support_digest_blocks_gate
#print axioms changed_support_generation_blocks_gate
#print axioms support_frozen_after_first_access_blocks_gate

end HsHVerification.SupportFreezeGate
