import Mathlib
import HsHVerification.LoomSourceBoundComparison

/-!
# Typed temporal provenance and pre-unblinding chronology

This is an additive, specification-level extension of the source-bound P2
comparison contract. It distinguishes event time from audit-observation time,
first-extant-known from first-public claims, and public availability from
analyst/context exposure. It also refuses to order timestamps across different
clock domains or units, and represents date uncertainty as intervals.

The scoped-first certificate is only relative to its declared candidate set
and coverage manifest. A declared coverage-completeness value is an input
attestation, not something Lean can authenticate. The pre-unblinding theorem
proves only the supplied, verified event-time intervals are strictly ordered.
It does not prove that the prediction was cryptographically sealed, that the
holdout was inaccessible, that source/context exposure was absent, or that a
reviewer was independent.

A separate draft formalization in Enheduanna PR #1619 addresses a different
relation: source identity/read extent does not determine whether a source was
included in a particular execution context. This module does not duplicate or
replace that draft.
-/

namespace HsHVerification.AldusTemporalProvenance

open HsHVerification.NadirComparisonFreezeCoherence
open HsHVerification.LoomSourceBoundComparison

inductive ClockDomain where
  | utcEpoch
  | gitPlatformClock
  | conversationExportClock
  | filesystemClock
  | publicationPlatformClock
  | providerSchedulerClock
  | notebookCollectionClock
  | auditRetrievalClock
  | localCivilClock
  | unknown
  deriving DecidableEq, Repr

inductive ClockScale where
  | unixSeconds
  | unixMilliseconds
  | nativeOrdinal
  | providerTicks
  | unknown
  deriving DecidableEq, Repr

inductive TimePrecision where
  | year
  | month
  | day
  | hour
  | minute
  | second
  | millisecond
  | unknown
  deriving DecidableEq, Repr

/-- A timestamp is an interval in one named clock domain and unit.
    Bounds encode source precision and uncertainty; they are not inferred
    automatically from the precision label. -/
structure TimeInterval where
  clockDomain : ClockDomain
  clockScale : ClockScale
  lower : Nat
  upper : Nat
  ordered : lower ≤ upper

inductive TemporalOrder where
  | before
  | after
  | overlap
  | incomparable
  | unknown
  deriving DecidableEq, Repr

/-- Strict ordering is permitted only within the same clock and scale, and
    only when the intervals do not overlap. -/
def sameKnownClock (a b : TimeInterval) : Prop :=
  a.clockDomain = b.clockDomain ∧
  a.clockScale = b.clockScale ∧
  a.clockDomain ≠ .unknown ∧
  a.clockScale ≠ .unknown

def definitelyBefore (a b : TimeInterval) : Prop :=
  sameKnownClock a b ∧ a.upper < b.lower

def compareIntervals (a b : TimeInterval) : TemporalOrder :=
  if a.clockDomain = .unknown then .unknown
  else if b.clockDomain = .unknown then .unknown
  else if a.clockScale = .unknown then .unknown
  else if b.clockScale = .unknown then .unknown
  else if hDomain : a.clockDomain = b.clockDomain then
    if hScale : a.clockScale = b.clockScale then
      if a.upper < b.lower then .before
      else if b.upper < a.lower then .after
      else .overlap
    else .incomparable
  else .incomparable

def compareOptionalTimes
    (a b : Option TimeInterval) : TemporalOrder :=
  match a, b with
  | some ta, some tb => compareIntervals ta tb
  | _, _ => .unknown

theorem definitelyBefore_irreflexive (a : TimeInterval) :
    ¬ definitelyBefore a a := by
  intro h
  have hlt : a.upper < a.lower := h.2
  have hlt' : a.upper < a.upper :=
    Nat.lt_of_lt_of_le hlt a.ordered
  exact Nat.lt_irrefl a.upper hlt'

theorem definitelyBefore_transitive
    {a b c : TimeInterval}
    (hab : definitelyBefore a b)
    (hbc : definitelyBefore b c) :
    definitelyBefore a c := by
  rcases hab with ⟨habClock, habTime⟩
  rcases hbc with ⟨hbcClock, hbcTime⟩
  rcases habClock with ⟨habDomain, habRest⟩
  rcases habRest with ⟨habScale, habKnown⟩
  rcases habKnown with ⟨habDomainKnown, habScaleKnown⟩
  rcases hbcClock with ⟨hbcDomain, hbcRest⟩
  rcases hbcRest with ⟨hbcScale, _⟩
  have hacClock : sameKnownClock a c :=
    ⟨habDomain.trans hbcDomain,
      ⟨habScale.trans hbcScale, ⟨habDomainKnown, habScaleKnown⟩⟩⟩
  exact ⟨hacClock,
    Nat.lt_trans (Nat.lt_of_lt_of_le habTime b.ordered) hbcTime⟩

theorem no_order_across_clock_domains
    (a b : TimeInterval)
    (h : a.clockDomain ≠ b.clockDomain) :
    ¬ definitelyBefore a b := by
  intro hBefore
  exact h hBefore.1.1

theorem no_order_across_clock_scales
    (a b : TimeInterval)
    (h : a.clockScale ≠ b.clockScale) :
    ¬ definitelyBefore a b := by
  intro hBefore
  exact h hBefore.1.2.1

theorem unknown_left_clock_domain_is_unknown
    (a b : TimeInterval)
    (h : a.clockDomain = .unknown) :
    compareIntervals a b = .unknown := by
  simp [compareIntervals, h]

theorem unknown_right_clock_domain_is_unknown
    (a b : TimeInterval)
    (h : b.clockDomain = .unknown) :
    compareIntervals a b = .unknown := by
  unfold compareIntervals
  by_cases hLeft : a.clockDomain = .unknown
  · simp [hLeft]
  · simp [hLeft, h]

theorem unknown_left_clock_scale_is_unknown
    (a b : TimeInterval)
    (h : a.clockScale = .unknown) :
    compareIntervals a b = .unknown := by
  unfold compareIntervals
  by_cases hLeftDomain : a.clockDomain = .unknown
  · simp [hLeftDomain]
  · by_cases hRightDomain : b.clockDomain = .unknown
    · simp [hLeftDomain, hRightDomain]
    · simp [hLeftDomain, hRightDomain, h]

theorem unknown_right_clock_scale_is_unknown
    (a b : TimeInterval)
    (h : b.clockScale = .unknown) :
    compareIntervals a b = .unknown := by
  unfold compareIntervals
  by_cases hLeftDomain : a.clockDomain = .unknown
  · simp [hLeftDomain]
  · by_cases hRightDomain : b.clockDomain = .unknown
    · simp [hLeftDomain, hRightDomain]
    · by_cases hLeftScale : a.clockScale = .unknown
      · simp [hLeftDomain, hRightDomain, hLeftScale]
      · simp [hLeftDomain, hRightDomain, hLeftScale, h]

theorem incomparable_when_known_clock_domains_differ
    (a b : TimeInterval)
    (ha : a.clockDomain ≠ .unknown)
    (hb : b.clockDomain ≠ .unknown)
    (hsa : a.clockScale ≠ .unknown)
    (hsb : b.clockScale ≠ .unknown)
    (h : a.clockDomain ≠ b.clockDomain) :
    compareIntervals a b = .incomparable := by
  simp [compareIntervals, ha, hb, hsa, hsb, h]

theorem incomparable_when_known_clock_scales_differ
    (a b : TimeInterval)
    (ha : a.clockDomain ≠ .unknown)
    (hb : b.clockDomain ≠ .unknown)
    (hsa : a.clockScale ≠ .unknown)
    (hsb : b.clockScale ≠ .unknown)
    (h : a.clockScale ≠ b.clockScale) :
    compareIntervals a b = .incomparable := by
  by_cases hDomain : a.clockDomain = b.clockDomain
  · simp [compareIntervals, ha, hb, hsa, hsb, hDomain, h]
  · simp [compareIntervals, ha, hb, hsa, hsb, hDomain]

theorem missing_left_time_is_unknown
    (b : Option TimeInterval) :
    compareOptionalTimes none b = .unknown := by
  cases b <;> rfl

theorem missing_right_time_is_unknown
    (a : Option TimeInterval) :
    compareOptionalTimes a none = .unknown := by
  cases a <;> rfl

inductive EventKind where
  | sourceMessageCreated
  | sourceFileCreated
  | repositoryIngested
  | collectionIndexed
  | publiclyReleased
  | publiclyMentioned
  | analystAccess
  | messageDelivered
  | messageIncludedInContext
  | predictionSealed
  | holdoutUnblinded
  | runScheduled
  | runStarted
  | runCompleted
  | resultPersisted
  | taskMetadataUpdated
  | schedulerSnapshotObserved
  | auditRetrieved
  deriving DecidableEq, Repr

inductive ChronologyClaimKind where
  | earliestExtantKnown
  | firstPublicMention
  deriving DecidableEq, Repr

/-- Candidate event classes are claim-specific. A repository-ingest event
    can establish an extant witness without establishing first public mention. -/
def eligibleForClaim :
    ChronologyClaimKind → EventKind → Bool
  | .earliestExtantKnown, .sourceMessageCreated => true
  | .earliestExtantKnown, .sourceFileCreated => true
  | .earliestExtantKnown, .repositoryIngested => true
  | .earliestExtantKnown, .collectionIndexed => true
  | .earliestExtantKnown, .publiclyReleased => true
  | .earliestExtantKnown, .publiclyMentioned => true
  | .firstPublicMention, .publiclyReleased => true
  | .firstPublicMention, .publiclyMentioned => true
  | _, _ => false

inductive EpistemicStatus where
  | primaryVerified
  | secondaryVerified
  | inferred
  | memory
  | unknown
  deriving DecidableEq, Repr

def isVerified : EpistemicStatus → Bool
  | .primaryVerified => true
  | .secondaryVerified => true
  | _ => false

inductive CoverageStatus where
  | boundedSearch
  | completeForDeclaredCorpus
  | unknown
  deriving DecidableEq, Repr

/-- Event time and the time at which an auditor observed/retrieved the record
    are separate fields. A retrieval timestamp is not a substitute for event time. -/
structure TemporalEvidence where
  evidenceId : String
  subjectId : String
  actorId : String
  comparisonId : Option String
  eventKind : EventKind
  eventTime : Option TimeInterval
  observedAt : Option TimeInterval
  sourceId : String
  sourceLocator : String
  observationMethod : String
  coverageId : String
  epistemicStatus : EpistemicStatus
  statedPrecision : TimePrecision

/-- Coverage is explicit and source-bundle-bound. completeForDeclaredCorpus
    is an attestation about the named corpus only, never a universal/global
    completeness theorem. Candidate events are the declared comparison set. -/
structure CoverageManifest where
  id : String
  subjectId : String
  sourceBundleId : String
  claimKind : ChronologyClaimKind
  clockDomain : ClockDomain
  clockScale : ClockScale
  includedSourceIds : List String
  excludedSourceIds : List String
  searchWindow : String
  searchMethod : String
  coverageStatus : CoverageStatus
  evidenceManifestId : String
  candidateEvents : List TemporalEvidence

/-- A proof-carrying earliest verified candidate within one declared coverage
    manifest. Every eligible verified candidate must have a known time in the
    same clock domain/scale; overlapping candidate intervals prevent a
    first-witness certificate. No global-first claim is represented here. -/
structure ScopedFirstWitness (C : CoverageManifest) where
  witness : TemporalEvidence
  witnessTime : TimeInterval
  manifestIdNonempty : C.id ≠ ""
  sourceBundleIdNonempty : C.sourceBundleId ≠ ""
  evidenceManifestIdNonempty : C.evidenceManifestId ≠ ""
  searchWindowNonempty : C.searchWindow ≠ ""
  searchMethodNonempty : C.searchMethod ≠ ""
  subjectMatches : witness.subjectId = C.subjectId
  claimKindMatches : eligibleForClaim C.claimKind witness.eventKind = true
  coverageMatches : witness.coverageId = C.id
  witnessEvidenceIdNonempty : witness.evidenceId ≠ ""
  witnessSourceIdNonempty : witness.sourceId ≠ ""
  witnessLocatorNonempty : witness.sourceLocator ≠ ""
  witnessObservationMethodNonempty : witness.observationMethod ≠ ""
  witnessSourceIncluded : witness.sourceId ∈ C.includedSourceIds
  witnessSourceNotExcluded : witness.sourceId ∉ C.excludedSourceIds
  witnessVerified : isVerified witness.epistemicStatus = true
  witnessTimeMatches : witness.eventTime = some witnessTime
  witnessClockDomainMatches : witnessTime.clockDomain = C.clockDomain
  witnessClockScaleMatches : witnessTime.clockScale = C.clockScale
  coverageClockDomainKnown : C.clockDomain ≠ .unknown
  coverageClockScaleKnown : C.clockScale ≠ .unknown
  coverageStatusKnown : C.coverageStatus ≠ .unknown
  candidateTimesKnown :
    ∀ candidate, candidate ∈ C.candidateEvents →
      candidate.subjectId = C.subjectId →
      eligibleForClaim C.claimKind candidate.eventKind = true →
      candidate.coverageId = C.id →
      candidate.sourceId ∈ C.includedSourceIds →
      candidate.sourceId ∉ C.excludedSourceIds →
      isVerified candidate.epistemicStatus = true →
      ∃ candidateTime : TimeInterval,
        candidate.eventTime = some candidateTime ∧
        candidateTime.clockDomain = C.clockDomain ∧
        candidateTime.clockScale = C.clockScale
  earliestWithinCoverage :
    ∀ candidate, candidate ∈ C.candidateEvents →
      candidate.evidenceId ≠ witness.evidenceId →
      candidate.subjectId = C.subjectId →
      eligibleForClaim C.claimKind candidate.eventKind = true →
      candidate.coverageId = C.id →
      candidate.sourceId ∈ C.includedSourceIds →
      candidate.sourceId ∉ C.excludedSourceIds →
      isVerified candidate.epistemicStatus = true →
      ∀ candidateTime : TimeInterval,
        candidate.eventTime = some candidateTime →
        candidateTime.clockDomain = C.clockDomain →
        candidateTime.clockScale = C.clockScale →
        witnessTime.upper ≤ candidateTime.lower

theorem first_extant_and_first_public_are_distinct_claims :
    ChronologyClaimKind.earliestExtantKnown ≠
      ChronologyClaimKind.firstPublicMention := by
  decide

theorem repository_ingest_is_extant_not_public_mention :
    eligibleForClaim .earliestExtantKnown .repositoryIngested = true ∧
    eligibleForClaim .firstPublicMention .repositoryIngested = false := by
  decide

theorem public_mention_is_not_analyst_access :
    EventKind.publiclyMentioned ≠ EventKind.analystAccess := by
  decide

theorem public_mention_is_not_context_inclusion :
    EventKind.publiclyMentioned ≠ EventKind.messageIncludedInContext := by
  decide

theorem scoped_first_witness_carries_coverage
    {C : CoverageManifest} (w : ScopedFirstWitness C) :
    w.witness.coverageId = C.id :=
  w.coverageMatches

theorem scoped_first_witness_carries_verified_witness
    {C : CoverageManifest} (w : ScopedFirstWitness C) :
    isVerified w.witness.epistemicStatus = true :=
  w.witnessVerified

/-- A P2 chronology wrapper adds two separately scoped chronology claims and
    a verified prediction-seal/holdout-unblinding order to the existing
    source-bound E/D/F/R comparison bundle. It adds no fifth evidence axis. -/
structure ChronologyBoundP2Bundle (F : ComparisonFreeze) where
  sourceBound : SourceBoundP2Bundle F
  sourceBundleId : String
  sourceBundleMatches : sourceBundleId = sourceBound.sourceBundle.id
  comparisonId : String
  comparisonIdNonempty : comparisonId ≠ ""
  comparisonMatches : comparisonId = F.id
  extantCoverage : CoverageManifest
  extantClaimKind : extantCoverage.claimKind =
    ChronologyClaimKind.earliestExtantKnown
  extantSourceBundleMatches :
    extantCoverage.sourceBundleId = sourceBundleId
  extantWitness : ScopedFirstWitness extantCoverage
  publicCoverage : CoverageManifest
  publicClaimKind : publicCoverage.claimKind =
    ChronologyClaimKind.firstPublicMention
  publicSourceBundleMatches :
    publicCoverage.sourceBundleId = sourceBundleId
  publicWitness : ScopedFirstWitness publicCoverage
  predictionSeal : TemporalEvidence
  holdoutUnblinding : TemporalEvidence
  predictionFreezeTime : TimeInterval
  holdoutUnblindingTime : TimeInterval
  predictionEventKind :
    predictionSeal.eventKind = EventKind.predictionSealed
  unblindingEventKind :
    holdoutUnblinding.eventKind = EventKind.holdoutUnblinded
  predictionSubjectMatches :
    predictionSeal.subjectId = comparisonId
  unblindingSubjectMatches :
    holdoutUnblinding.subjectId = comparisonId
  predictionComparisonMatches :
    predictionSeal.comparisonId = some comparisonId
  unblindingComparisonMatches :
    holdoutUnblinding.comparisonId = some comparisonId
  predictionTimeMatches :
    predictionSeal.eventTime = some predictionFreezeTime
  unblindingTimeMatches :
    holdoutUnblinding.eventTime = some holdoutUnblindingTime
  predictionSealVerified :
    isVerified predictionSeal.epistemicStatus = true
  unblindingVerified :
    isVerified holdoutUnblinding.epistemicStatus = true
  freezeDefinitelyBeforeUnblinding :
    definitelyBefore predictionFreezeTime holdoutUnblindingTime

theorem chronology_bound_bundle_preserves_existing_p2_contract
    {F : ComparisonFreeze} (b : ChronologyBoundP2Bundle F) :
    p2Ready F :=
  source_bound_bundle_satisfies_existing_p2_contract b.sourceBound

theorem chronology_bound_bundle_prediction_precedes_unblinding
    {F : ComparisonFreeze} (b : ChronologyBoundP2Bundle F) :
    definitelyBefore b.predictionFreezeTime b.holdoutUnblindingTime :=
  b.freezeDefinitelyBeforeUnblinding

theorem chronology_bound_bundle_binds_both_first_claims_to_source_bundle
    {F : ComparisonFreeze} (b : ChronologyBoundP2Bundle F) :
    b.extantCoverage.sourceBundleId = b.sourceBound.sourceBundle.id ∧
    b.publicCoverage.sourceBundleId = b.sourceBound.sourceBundle.id := by
  exact ⟨b.extantSourceBundleMatches.trans b.sourceBundleMatches,
    b.publicSourceBundleMatches.trans b.sourceBundleMatches⟩

theorem chronology_bound_bundle_keeps_first_claims_scoped
    {F : ComparisonFreeze} (b : ChronologyBoundP2Bundle F) :
    b.extantWitness.witness.coverageId = b.extantCoverage.id ∧
    b.publicWitness.witness.coverageId = b.publicCoverage.id :=
  ⟨b.extantWitness.coverageMatches, b.publicWitness.coverageMatches⟩

/-
## Public-availability censoring boundary

A single positive public-access snapshot supplies an upper bound on a release
time, not an exact T0. A verified earlier negative snapshot and a later
positive snapshot can bracket the first accessible tick only within a
declared subject, exact content version, surface, clock, and observation
scope, and only under an explicit monotonic-availability assumption.

The completeness status below is an input attestation for the declared
corpus/scope. It is not authenticated by Lean. This construction does not
establish a global first exposure across undeclared surfaces or time ranges.
-/

/-- Public availability history for one subject, exact content version,
    surface, clock domain/scale, and declared observation scope. Monotonicity
    is an explicit assumption; if public access can be revoked or toggled,
    this history model is not applicable to first-ever exposure. -/
structure PublicAccessHistory where
  coverageId : String
  subjectId : String
  contentVersionId : String
  surfaceId : String
  clockDomain : ClockDomain
  clockScale : ClockScale
  scopeStart : Nat
  coverageStatus : CoverageStatus
  publiclyAccessible : Nat → Prop
  monotoneWithinScope :
    ∀ ⦃a b : Nat⦄, scopeStart ≤ a → a ≤ b →
      publiclyAccessible a → publiclyAccessible b

/-- A pair of verified, source-located observations on the same
    PublicAccessHistory. This establishes a transition window, not by itself
    a global-first claim. -/
structure PublicAvailabilityTransitionWindow (H : PublicAccessHistory) where
  lastNegativeAt : Nat
  laterPositiveAt : Nat
  lowerEvidenceId : String
  upperEvidenceId : String
  lowerSourceId : String
  upperSourceId : String
  lowerLocator : String
  upperLocator : String
  lowerStatus : EpistemicStatus
  upperStatus : EpistemicStatus
  coverageIdNonempty : H.coverageId ≠ ""
  subjectNonempty : H.subjectId ≠ ""
  contentVersionNonempty : H.contentVersionId ≠ ""
  surfaceNonempty : H.surfaceId ≠ ""
  clockDomainKnown : H.clockDomain ≠ .unknown
  clockScaleKnown : H.clockScale ≠ .unknown
  lowerEvidenceIdNonempty : lowerEvidenceId ≠ ""
  upperEvidenceIdNonempty : upperEvidenceId ≠ ""
  lowerSourceIdNonempty : lowerSourceId ≠ ""
  upperSourceIdNonempty : upperSourceId ≠ ""
  lowerLocatorNonempty : lowerLocator ≠ ""
  upperLocatorNonempty : upperLocator ≠ ""
  lowerVerified : isVerified lowerStatus = true
  upperVerified : isVerified upperStatus = true
  lowerInScope : H.scopeStart ≤ lastNegativeAt
  upperInScope : H.scopeStart ≤ laterPositiveAt
  lowerNotPublic : ¬ H.publiclyAccessible lastNegativeAt
  upperPublic : H.publiclyAccessible laterPositiveAt
  ordered : lastNegativeAt < laterPositiveAt

/-- A first-public-T0 claim scoped to a declared corpus/surface/version and
    observation window. Completeness for the declared corpus remains an
    attestation, not a theorem about omitted sources or undeclared surfaces. -/
structure ScopedFirstPublicT0 (H : PublicAccessHistory) extends
    PublicAvailabilityTransitionWindow H where
  coverageCompleteForDeclaredCorpus :
    H.coverageStatus = CoverageStatus.completeForDeclaredCorpus

/-- Under the explicit monotonicity premise, the first accessible tick in
    the declared scope lies strictly after the negative observation and no
    later than the positive observation. -/
theorem transitionWindow_contains_first_accessible_tick
    {H : PublicAccessHistory}
    (w : PublicAvailabilityTransitionWindow H) :
    ∃ t : Nat,
      w.lastNegativeAt < t ∧
      t ≤ w.laterPositiveAt ∧
      H.publiclyAccessible t ∧
      ∀ s : Nat, H.scopeStart ≤ s → s < t →
        ¬ H.publiclyAccessible s := by
  classical
  let hExists : ∃ t : Nat,
      H.scopeStart ≤ t ∧ H.publiclyAccessible t :=
    ⟨w.laterPositiveAt, w.upperInScope, w.upperPublic⟩
  let t : Nat := Nat.find hExists
  have ht : H.scopeStart ≤ t ∧ H.publiclyAccessible t :=
    Nat.find_spec hExists
  have hle : t ≤ w.laterPositiveAt :=
    Nat.find_min' hExists ⟨w.upperInScope, w.upperPublic⟩
  have hgt : w.lastNegativeAt < t := by
    by_contra hnot
    have hleLower : t ≤ w.lastNegativeAt := by omega
    exact w.lowerNotPublic
      (H.monotoneWithinScope ht.1 hleLower ht.2)
  refine ⟨t, hgt, hle, ht.2, ?_⟩
  intro s hsScope hsLt hAccessible
  have hmin : t ≤ s :=
    Nat.find_min' hExists ⟨hsScope, hAccessible⟩
  omega

theorem scopedFirstPublicT0_has_first_accessible_tick
    {H : PublicAccessHistory} (w : ScopedFirstPublicT0 H) :
    ∃ t : Nat,
      w.lastNegativeAt < t ∧
      t ≤ w.laterPositiveAt ∧
      H.publiclyAccessible t ∧
      ∀ s : Nat, H.scopeStart ≤ s → s < t →
        ¬ H.publiclyAccessible s :=
  transitionWindow_contains_first_accessible_tick
    (H := H) w.toPublicAvailabilityTransitionWindow

/-- In the monotone release model, a single positive snapshot at observedAt
    is compatible with multiple release times. It therefore cannot identify
    an exact T0 without an earlier negative observation or other evidence. -/
def releasePublicBy (releaseAt observedAt : Nat) : Prop :=
  releaseAt ≤ observedAt

theorem one_positive_snapshot_does_not_identify_exact_T0
    (observedAt : Nat) (h : 0 < observedAt) :
    ∃ t₁ t₂ : Nat,
      t₁ ≠ t₂ ∧
      releasePublicBy t₁ observedAt ∧
      releasePublicBy t₂ observedAt := by
  refine ⟨0, observedAt, ?_, ?_, ?_⟩
  · omega
  · exact Nat.zero_le observedAt
  · exact Nat.le_refl observedAt

#eval eligibleForClaim .firstPublicMention .repositoryIngested
#eval eligibleForClaim .firstPublicMention .publiclyReleased
#eval eligibleForClaim .firstPublicMention .analystAccess
#eval eligibleForClaim .earliestExtantKnown .repositoryIngested

#print axioms definitelyBefore_irreflexive
#print axioms definitelyBefore_transitive
#print axioms no_order_across_clock_domains
#print axioms no_order_across_clock_scales
#print axioms unknown_left_clock_domain_is_unknown
#print axioms unknown_right_clock_domain_is_unknown
#print axioms unknown_left_clock_scale_is_unknown
#print axioms unknown_right_clock_scale_is_unknown
#print axioms incomparable_when_known_clock_domains_differ
#print axioms incomparable_when_known_clock_scales_differ
#print axioms missing_left_time_is_unknown
#print axioms missing_right_time_is_unknown
#print axioms first_extant_and_first_public_are_distinct_claims
#print axioms repository_ingest_is_extant_not_public_mention
#print axioms public_mention_is_not_analyst_access
#print axioms public_mention_is_not_context_inclusion
#print axioms scoped_first_witness_carries_coverage
#print axioms scoped_first_witness_carries_verified_witness
#print axioms chronology_bound_bundle_preserves_existing_p2_contract
#print axioms chronology_bound_bundle_prediction_precedes_unblinding
#print axioms chronology_bound_bundle_binds_both_first_claims_to_source_bundle
#print axioms chronology_bound_bundle_keeps_first_claims_scoped
#print axioms transitionWindow_contains_first_accessible_tick
#print axioms scopedFirstPublicT0_has_first_accessible_tick
#print axioms one_positive_snapshot_does_not_identify_exact_T0

end HsHVerification.AldusTemporalProvenance
