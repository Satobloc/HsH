import Mathlib

/-!
# Enheduanna: observed-slice identifiability and source-bound map lineage

This module adds a finite-resolution identifiability layer to the existing
source-attestation, output-occurrence, exact-fiber, projection-composition and
resolution-neighborhood work.

The central distinction is between:
* identifying an entire candidate history/representation; and
* identifying a particular property that is constant across all candidates
  compatible with one declared observation.

Compatibility is anchored to one observed value and one declared tolerance.
It is deliberately not defined as a pairwise "within tolerance" equivalence:
fixed-radius closeness need not be transitive.

The two-tolerance separation theorem is a deterministic metric bound. It is
not a p-value, confidence interval, covariance estimate, or physical result.
The tolerance must be supplied from a real measurement protocol and its joint
uncertainty model before the theorem can be instantiated empirically.

The source-span example below is an exact locator for one mixed-origin user
message. The message's outer role is `user`, but an explicitly introduced
embedded assistant report occupies a different span. The origin labels are
source-critical classifications encoded as data; Lean does not authenticate
the raw export or independently establish authorship.

No physical geometry, detector, dataset, parameter, fit, or H(s)H prediction
is instantiated here.
-/

namespace HsHVerification.EnheduannaObservedSliceIdentifiability

inductive MessageRole
  | user
  | assistant
  | system
  | tool
  | unknown
  deriving DecidableEq, Repr

inductive SourceOrigin
  | nathanDirect
  | assistantQuoted
  | historicalSource
  | standardReference
  | independentMeasurement
  | unknown
  deriving DecidableEq, Repr

inductive MapConstructionStatus
  | sourceDefined
  | assistantReconstruction
  | standardReference
  | proposal
  | measuredOperator
  | unknown
  deriving DecidableEq, Repr

/--
A source span bound to exact source artifacts.

Offsets are half-open UTF-8 byte offsets under the named offset profile.
The digest strings are opaque identifiers here: Lean does not verify their
cryptographic correctness or retrieve the underlying source artifact.
-/
structure SourceSpanWitness where
  artifactName : String
  rawExportSha256 : String
  conversationId : String
  messageId : String
  bodySha256 : String
  outerRole : MessageRole
  startByte : Nat
  endByte : Nat
  offsetProfile : String
  origin : SourceOrigin
  classificationBasis : String
  nonempty : startByte < endByte

/--
Direct user-authored prose before the explicit embedded-report marker in
message 100388c5-89d6-4ffd-a895-598990636057.

Raw Library export:
* artifact: Workshop Relay _24 _ Geometry - raw (1).json
* conversation: 6aea46dd-dc60-83ea-8d50-689c152340e3
* raw-export SHA-256:
  de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e
* message-body SHA-256:
  8aa01ead3eed55c9b7a48fc5cbeda59a3829e3461d4aa9ba88ed64661b990c78

The exact digests are opaque source locators, not theorem premises.
-/
def nov04DirectSpan : SourceSpanWitness where
  artifactName := "Workshop Relay _24 _ Geometry - raw (1).json"
  rawExportSha256 := "de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e"
  conversationId := "6aea46dd-dc60-83ea-8d50-689c152340e3"
  messageId := "100388c5-89d6-4ffd-a895-598990636057"
  bodySha256 := "8aa01ead3eed55c9b7a48fc5cbeda59a3829e3461d4aa9ba88ed64661b990c78"
  outerRole := .user
  startByte := 0
  endByte := 2374
  offsetProfile := "UTF-8 bytes in decoded content.parts[0]; half-open; separator excluded"
  origin := .nathanDirect
  classificationBasis := "direct user-authored prose before explicit embedded-report marker"
  nonempty := by decide

/--
The embedded prior assistant report in the same user-role message. The two
newline delimiter bytes [2374, 2376) are intentionally not assigned to either
claim-bearing span.
-/
def nov04AssistantQuoteSpan : SourceSpanWitness where
  artifactName := "Workshop Relay _24 _ Geometry - raw (1).json"
  rawExportSha256 := "de035c9ee69a0a1916d9fb938e32355be23bf05054cd77bc4a810c5af3f7cf0e"
  conversationId := "6aea46dd-dc60-83ea-8d50-689c152340e3"
  messageId := "100388c5-89d6-4ffd-a895-598990636057"
  bodySha256 := "8aa01ead3eed55c9b7a48fc5cbeda59a3829e3461d4aa9ba88ed64661b990c78"
  outerRole := .user
  startByte := 2376
  endByte := 15732
  offsetProfile := "UTF-8 bytes in decoded content.parts[0]; half-open; separator excluded"
  origin := .assistantQuoted
  classificationBasis := "embedded prior assistant report after explicit quote marker; original assistant thread unauthenticated"
  nonempty := by decide

/-- One raw user-role message can contain spans with different source origins. -/
theorem nov04_user_role_message_has_distinct_span_origins :
    nov04DirectSpan.outerRole = .user ∧
    nov04AssistantQuoteSpan.outerRole = .user ∧
    nov04DirectSpan.messageId = nov04AssistantQuoteSpan.messageId ∧
    nov04DirectSpan.bodySha256 = nov04AssistantQuoteSpan.bodySha256 ∧
    nov04DirectSpan.origin = .nathanDirect ∧
    nov04AssistantQuoteSpan.origin = .assistantQuoted ∧
    nov04DirectSpan.origin ≠ nov04AssistantQuoteSpan.origin := by
  decide

/-- The two claim-bearing spans do not overlap. -/
theorem nov04_source_spans_are_disjoint :
    nov04DirectSpan.endByte ≤ nov04AssistantQuoteSpan.startByte := by
  decide

/--
Lineage for one candidate interpretation. Source origin and map-construction
status are separate fields: a direct source segment can be the input to an
assistant-authored translation without making that translation source-defined.
Map IDs must be bound externally to immutable code/source digests.
-/
structure SourceBoundMapLineage where
  candidateId : String
  sourceSpan : SourceSpanWitness
  /-- Canonical external key bound to the exact source-span witness. -/
  sourceSpanKey : String
  sourceToCandidateMapId : String
  translationStatus : MapConstructionStatus
  candidateToGeometryMapId : String
  geometryToSliceMapId : String
  sliceToObservableMapId : String
  instrumentMapId : String

/--
A typed, end-to-end source-to-measurement chain. The source-span key and
source-to-candidate map identity/status are explicit parts of the contract,
followed by candidate-to-geometry, geometry-to-slice, slice-to-observable,
and instrument/readout maps. The sourceSpanKey must be externally bound to
the exact SourceSpanWitness; Lean does not authenticate that binding.
-/
structure ObservationPipeline
    (Source Candidate Geometry Slice Observable Measured : Type*) where
  sourceSpanKey : String
  sourceToCandidateMapId : String
  sourceToCandidateStatus : MapConstructionStatus
  candidateToGeometryMapId : String
  geometryToSliceMapId : String
  sliceToObservableMapId : String
  instrumentMapId : String
  sourceToCandidate : Source → Candidate
  candidateToGeometry : Candidate → Geometry
  geometryToSlice : Geometry → Slice
  sliceToObservable : Slice → Observable
  instrumentToMeasured : Observable → Measured

/--
The source-span key, source-to-candidate map identity/status, and all downstream
map identities must match the executable pipeline. This is an identity check,
not a proof that a map is physically or semantically correct.
-/
def lineageMatchesPipeline
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured) :
    Prop :=
  lineage.sourceSpanKey = pipeline.sourceSpanKey ∧
  lineage.sourceToCandidateMapId = pipeline.sourceToCandidateMapId ∧
  lineage.translationStatus = pipeline.sourceToCandidateStatus ∧
  lineage.candidateToGeometryMapId = pipeline.candidateToGeometryMapId ∧
  lineage.geometryToSliceMapId = pipeline.geometryToSliceMapId ∧
  lineage.sliceToObservableMapId = pipeline.sliceToObservableMapId ∧
  lineage.instrumentMapId = pipeline.instrumentMapId

theorem source_span_key_mismatch_breaks_lineage_match
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (hMismatch : lineage.sourceSpanKey ≠ pipeline.sourceSpanKey) :
    ¬ lineageMatchesPipeline lineage pipeline := by
  intro hMatch
  exact hMismatch hMatch.1

theorem source_map_identity_mismatch_breaks_lineage_match
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (hMismatch : lineage.sourceToCandidateMapId ≠ pipeline.sourceToCandidateMapId) :
    ¬ lineageMatchesPipeline lineage pipeline := by
  intro hMatch
  exact hMismatch hMatch.2.1

theorem source_map_status_mismatch_breaks_lineage_match
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (hMismatch : lineage.translationStatus ≠ pipeline.sourceToCandidateStatus) :
    ¬ lineageMatchesPipeline lineage pipeline := by
  intro hMatch
  exact hMismatch hMatch.2.2.1

namespace ObservationPipeline

variable {Source Candidate Geometry Slice Observable Measured : Type*}

/-- Explicit composition from candidate representation to measured output. -/
def predict
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured) :
    Candidate → Measured :=
  pipeline.instrumentToMeasured ∘
    pipeline.sliceToObservable ∘
    pipeline.geometryToSlice ∘
    pipeline.candidateToGeometry

/-- Full composition from the source object through every declared map. -/
def predictFromSource
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured) :
    Source → Measured :=
  pipeline.predict ∘ pipeline.sourceToCandidate

@[simp] theorem predict_apply
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (candidate : Candidate) :
    pipeline.predict candidate =
      pipeline.instrumentToMeasured
        (pipeline.sliceToObservable
          (pipeline.geometryToSlice
            (pipeline.candidateToGeometry candidate))) := by
  rfl

@[simp] theorem predictFromSource_apply
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (source : Source) :
    pipeline.predictFromSource source =
      pipeline.instrumentToMeasured
        (pipeline.sliceToObservable
          (pipeline.geometryToSlice
            (pipeline.candidateToGeometry (pipeline.sourceToCandidate source)))) := by
  rfl

end ObservationPipeline

/-- One measured value and one predeclared, nonnegative observation tolerance. -/
structure ObservationWindow (Measured : Type*) [PseudoMetricSpace Measured] where
  observed : Measured
  tolerance : ℝ
  tolerance_nonnegative : 0 ≤ tolerance

/--
Candidates compatible with one specific observation under one declared
metric and tolerance. This observation-anchored set is not a pairwise
tolerance relation and makes no transitivity assumption.
-/
def CompatibleCandidates
    {Candidate Measured : Type*} [PseudoMetricSpace Measured]
    (predict : Candidate → Measured)
    (window : ObservationWindow Measured) : Set Candidate :=
  {candidate | dist (predict candidate) window.observed ≤ window.tolerance}

/-- A property is identifiable on a compatible set exactly when it is constant there. -/
def PropertyIdentifiableOn
    {Candidate Value : Type*}
    (property : Candidate → Value)
    (compatible : Set Candidate) : Prop :=
  ∀ c₁, c₁ ∈ compatible → ∀ c₂, c₂ ∈ compatible → property c₁ = property c₂

/-- The complete candidate state is unique on the compatible set. -/
def CandidateUniqueOn
    {Candidate : Type*}
    (compatible : Set Candidate) : Prop :=
  ∀ c₁, c₁ ∈ compatible → ∀ c₂, c₂ ∈ compatible → c₁ = c₂

/-- Full candidate identity is identifiable iff the compatible set is at most one. -/
theorem candidate_identity_identifiable_iff_unique
    {Candidate : Type*}
    (compatible : Set Candidate) :
    PropertyIdentifiableOn (fun candidate : Candidate => candidate) compatible ↔
      CandidateUniqueOn compatible := by
  rfl

/--
For a nonempty compatible set, an identifiable property has one unique value
on that set. This does not require the complete candidate to be unique.
-/
theorem property_identifiable_iff_single_value
    {Candidate Value : Type*}
    (compatible : Set Candidate)
    (hNonempty : compatible.Nonempty)
    (property : Candidate → Value) :
    PropertyIdentifiableOn property compatible ↔
      ∃ value, ∀ candidate, candidate ∈ compatible → property candidate = value := by
  constructor
  · intro hIdent
    rcases hNonempty with ⟨candidate₀, hCandidate₀⟩
    exact ⟨property candidate₀, fun candidate hCandidate =>
      hIdent candidate hCandidate candidate₀ hCandidate₀⟩
  · rintro ⟨value, hValue⟩ candidate₁ h₁ candidate₂ h₂
    rw [hValue candidate₁ h₁, hValue candidate₂ h₂]

/--
A property can remain identifiable while the full candidate state is not:
the property must be constant on the compatible set, while that set contains
at least two distinct candidates.
-/
theorem property_identifiable_without_candidate_uniqueness
    {Candidate Value : Type*}
    (compatible : Set Candidate)
    (c₁ c₂ : Candidate)
    (h₁ : c₁ ∈ compatible)
    (h₂ : c₂ ∈ compatible)
    (hDifferent : c₁ ≠ c₂)
    (property : Candidate → Value)
    (value : Value)
    (hConstant : ∀ candidate, candidate ∈ compatible → property candidate = value) :
    PropertyIdentifiableOn property compatible ∧
      ¬ CandidateUniqueOn compatible := by
  constructor
  · intro a ha b hb
    rw [hConstant a ha, hConstant b hb]
  · intro hUnique
    exact hDifferent (hUnique c₁ h₁ c₂ h₂)

/-- Different values on two compatible candidates block identifiability. -/
theorem differing_compatible_property_values_block_identifiability
    {Candidate Value : Type*}
    (compatible : Set Candidate)
    (c₁ c₂ : Candidate)
    (h₁ : c₁ ∈ compatible)
    (h₂ : c₂ ∈ compatible)
    (property : Candidate → Value)
    (hDifferent : property c₁ ≠ property c₂) :
    ¬ PropertyIdentifiableOn property compatible := by
  intro hIdent
  exact hDifferent (hIdent c₁ h₁ c₂ h₂)

/--
If two candidates fit the same observation window, their predicted outputs
must be within twice that window's tolerance.
-/
theorem two_compatible_predictions_within_twice_tolerance
    {Candidate Measured : Type*} [PseudoMetricSpace Measured]
    (predict : Candidate → Measured)
    (window : ObservationWindow Measured)
    (c₁ c₂ : Candidate)
    (h₁ : c₁ ∈ CompatibleCandidates predict window)
    (h₂ : c₂ ∈ CompatibleCandidates predict window) :
    dist (predict c₁) (predict c₂) ≤ 2 * window.tolerance := by
  change dist (predict c₁) window.observed ≤ window.tolerance at h₁
  change dist (predict c₂) window.observed ≤ window.tolerance at h₂
  have h₂' : dist window.observed (predict c₂) ≤ window.tolerance := by
    simpa [dist_comm] using h₂
  calc
    dist (predict c₁) (predict c₂)
        ≤ dist (predict c₁) window.observed + dist window.observed (predict c₂) :=
          dist_triangle _ _ _
    _ ≤ window.tolerance + window.tolerance := add_le_add h₁ h₂'
    _ = 2 * window.tolerance := by ring

/--
If two candidate predictions are separated by more than twice the declared
tolerance, they cannot both be compatible with the same observation.
The converse is not asserted.
-/
theorem prediction_separation_excludes_joint_compatibility
    {Candidate Measured : Type*} [PseudoMetricSpace Measured]
    (predict : Candidate → Measured)
    (window : ObservationWindow Measured)
    (c₁ c₂ : Candidate)
    (hSeparated :
      2 * window.tolerance < dist (predict c₁) (predict c₂)) :
    ¬ (c₁ ∈ CompatibleCandidates predict window ∧
       c₂ ∈ CompatibleCandidates predict window) := by
  intro hBoth
  have hClose :=
    two_compatible_predictions_within_twice_tolerance
      predict window c₁ c₂ hBoth.1 hBoth.2
  exact (not_lt_of_ge hClose) hSeparated

end HsHVerification.EnheduannaObservedSliceIdentifiability

/-! Theorem-specific dependency reports for exact-head CI inspection. -/
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_user_role_message_has_distinct_span_origins
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_source_spans_are_disjoint
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.candidate_identity_identifiable_iff_unique
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.property_identifiable_iff_single_value
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.property_identifiable_without_candidate_uniqueness
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.differing_compatible_property_values_block_identifiability
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.two_compatible_predictions_within_twice_tolerance
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.prediction_separation_excludes_joint_compatibility
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.lineageMatchesPipeline
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.source_span_key_mismatch_breaks_lineage_match
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.source_map_identity_mismatch_breaks_lineage_match
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.source_map_status_mismatch_breaks_lineage_match
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.ObservationPipeline.predict_apply
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.ObservationPipeline.predictFromSource_apply
