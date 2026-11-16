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

The existing Enheduanna source-attestation/context-snapshot formalization
addresses a different relation: source identity/read extent does not determine
whether a source was included in a particular execution context. This module
does not duplicate or replace that theorem.
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
def definitelyBefore (a b : TimeInterval) : Prop :=
  a.clockDomain = b.clockDomain ∧
  a.clockScale = b.clockScale ∧
  a.upper < b.lower

def compareIntervals (a b : TimeInterval) : TemporalOrder :=
  if hDomain : a.clockDomain = b.clockDomain then
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
  have hlt : a.upper < a.lower := h.2.2
  have hlt' : a.upper < a.upper :=
    Nat.lt_of_lt_of_le hlt a.ordered
  exact Nat.lt_irrefl a.upper hlt'

theorem definitelyBefore_transitive
    {a b c : TimeInterval}
    (hab : definitelyBefore a b)
    (hbc : definitelyBefore b c) :
    definitelyBefore a c := by
  refine ⟨hab.1.trans hbc.1, hab.2.1.trans hbc.2.1, ?_⟩
  exact Nat.lt_trans (Nat.lt_of_lt_of_le hab.2.2 b.ordered) hbc.2.2

theorem no_order_across_clock_domains
    (a b : TimeInterval)
    (h : a.clockDomain ≠ b.clockDomain) :
    ¬ definitelyBefore a b := by
  intro hBefore
  exact h hBefore.1

theorem no_order_across_clock_scales
    (a b : TimeInterval)
    (h : a.clockScale ≠ b.clockScale) :
    ¬ definitelyBefore a b := by
  intro hBefore
  exact h hBefore.2.1

theorem incomparable_when_clock_domains_differ
    (a b : TimeInterval)
    (h : a.clockDomain ≠ b.clockDomain) :
    compareIntervals a b = .incomparable := by
  unfold compareIntervals
  simp [h]

theorem incomparable_when_clock_scales_differ
    (a b : TimeInterval)
    (h : a.clockScale ≠ b.clockScale) :
    compareIntervals a b = .incomparable := by
  unfold compareIntervals
  by_cases hDomain : a.clockDomain = b.clockDomain
  · simp [hDomain, h]
  · simp [hDomain]

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
  predictionCoverageMatches :
    predictionSeal.coverageId = comparisonId
  unblindingCoverageMatches :
    holdoutUnblinding.coverageId = comparisonId
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

#eval eligibleForClaim .firstPublicMention .repositoryIngested
#eval eligibleForClaim .firstPublicMention .publiclyReleased
#eval eligibleForClaim .firstPublicMention .analystAccess
#eval eligibleForClaim .earliestExtantKnown .repositoryIngested

#print axioms definitelyBefore_irreflexive
#print axioms definitelyBefore_transitive
#print axioms no_order_across_clock_domains
#print axioms no_order_across_clock_scales
#print axioms incomparable_when_clock_domains_differ
#print axioms incomparable_when_clock_scales_differ
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

end HsHVerification.AldusTemporalProvenance
