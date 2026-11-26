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
embedded assistant report occupies a different span. Content identity
(raw export/body/span bytes and offsets) is kept separate from attribution
(origin and classification basis): a later attribution correction must not
change which bytes were present, but must change the identity of claims that
depend on that attribution. Lean does not authenticate the raw export or
independently establish authorship.

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
  spanSha256 : String
  outerRole : MessageRole
  startByte : Nat
  endByte : Nat
  offsetProfile : String
  origin : SourceOrigin
  classificationBasis : String
  nonempty : startByte < endByte

/--
Content identity for one exact source span. The raw-export, body, and span
SHA-256 values are computed externally from the retrieved bytes. Lean treats
them as supplied identifiers; it does not implement or verify SHA-256.
Attribution is intentionally excluded from this key.
-/
structure SourceSpanContentKey where
  rawExportSha256 : String
  conversationId : String
  messageId : String
  bodySha256 : String
  startByte : Nat
  endByte : Nat
  offsetProfile : String
  spanSha256 : String
  nonempty : startByte < endByte
  deriving DecidableEq, Repr

/-- Source attribution is a revisable interpretation of committed bytes. -/
structure SourceAttribution where
  outerRole : MessageRole
  origin : SourceOrigin
  classificationBasis : String
  deriving DecidableEq, Repr

/-- A claim key combines stable content identity with revisable attribution. -/
structure SourceClaimKey where
  content : SourceSpanContentKey
  attribution : SourceAttribution
  deriving DecidableEq, Repr

/-- Content and attribution travel together, but remain separately addressable. -/
structure SourceSpanEvidence where
  content : SourceSpanContentKey
  attribution : SourceAttribution
  deriving DecidableEq, Repr

namespace SourceSpanWitness

/-- Build the content key without importing attribution fields. -/
def contentKey (w : SourceSpanWitness) : SourceSpanContentKey where
  rawExportSha256 := w.rawExportSha256
  conversationId := w.conversationId
  messageId := w.messageId
  bodySha256 := w.bodySha256
  startByte := w.startByte
  endByte := w.endByte
  offsetProfile := w.offsetProfile
  spanSha256 := w.spanSha256
  nonempty := w.nonempty

/-- Extract attribution as a separate, revisable object. -/
def attribution (w : SourceSpanWitness) : SourceAttribution where
  outerRole := w.outerRole
  origin := w.origin
  classificationBasis := w.classificationBasis

/-- Pair content commitment with the current attribution classification. -/
def evidence (w : SourceSpanWitness) : SourceSpanEvidence where
  content := w.contentKey
  attribution := w.attribution

end SourceSpanWitness

namespace SourceSpanEvidence

def claimKey (e : SourceSpanEvidence) : SourceClaimKey where
  content := e.content
  attribution := e.attribution

/-- Reclassification changes attribution while preserving the exact content key. -/
def reclassify (e : SourceSpanEvidence) (a : SourceAttribution) : SourceSpanEvidence :=
  { e with attribution := a }

@[simp] theorem reclassify_preserves_content_key
    (e : SourceSpanEvidence) (a : SourceAttribution) :
    (e.reclassify a).content = e.content := by
  rfl

/-- A changed attribution invalidates the claim key but not the content key. -/
theorem reclassify_changes_claim_key_of_attribution_change
    (e : SourceSpanEvidence) (a : SourceAttribution)
    (hDifferent : e.attribution ≠ a) :
    (e.reclassify a).claimKey ≠ e.claimKey := by
  intro hEqual
  apply hDifferent
  exact (congrArg SourceClaimKey.attribution hEqual).symm

end SourceSpanEvidence

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
  spanSha256 := "0f4301fa4197de7d3d586d890add92a7ae3375ab5b9466fbcd862e68c80001f5"
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
  spanSha256 := "f9d4f9f97ab9968335b909ac45be26cc37768c08749b69793f4959ba7d980db7"
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

/-- The two source spans have distinct content commitments despite sharing one message/body. -/
theorem nov04_span_content_keys_are_distinct :
    nov04DirectSpan.contentKey ≠ nov04AssistantQuoteSpan.contentKey := by
  decide

/-- The direct span, two-byte separator, and quoted span retain exact boundaries. -/
theorem nov04_source_spans_partition_with_two_byte_separator :
    nov04DirectSpan.startByte = 0 ∧
    nov04DirectSpan.endByte + 2 = nov04AssistantQuoteSpan.startByte ∧
    nov04AssistantQuoteSpan.endByte = 15732 := by
  decide

def nov04DirectEvidence : SourceSpanEvidence := nov04DirectSpan.evidence
def nov04AssistantQuoteEvidence : SourceSpanEvidence := nov04AssistantQuoteSpan.evidence

/-- Example correction: attribution can be revised without changing the committed bytes. -/
def nov04DirectReclassified : SourceSpanEvidence :=
  nov04DirectEvidence.reclassify
    { outerRole := .user
      origin := .unknown
      classificationBasis := "origin unresolved pending later source review" }

theorem nov04_direct_reclassification_preserves_content_key :
    nov04DirectReclassified.content = nov04DirectEvidence.content := by
  rfl

theorem nov04_direct_reclassification_changes_claim_key :
    nov04DirectReclassified.claimKey ≠ nov04DirectEvidence.claimKey := by
  apply SourceSpanEvidence.reclassify_changes_claim_key_of_attribution_change
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
  sourceContentKey : SourceSpanContentKey
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
  sourceContentKey : SourceSpanContentKey
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
  lineage.sourceContentKey = pipeline.sourceContentKey ∧
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

theorem source_content_key_mismatch_breaks_lineage_match
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (hMismatch : lineage.sourceContentKey ≠ pipeline.sourceContentKey) :
    ¬ lineageMatchesPipeline lineage pipeline := by
  intro hMatch
  exact hMismatch hMatch.2.1

theorem source_map_identity_mismatch_breaks_lineage_match
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (hMismatch : lineage.sourceToCandidateMapId ≠ pipeline.sourceToCandidateMapId) :
    ¬ lineageMatchesPipeline lineage pipeline := by
  intro hMatch
  exact hMismatch hMatch.2.2.1

theorem source_map_status_mismatch_breaks_lineage_match
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (hMismatch : lineage.translationStatus ≠ pipeline.sourceToCandidateStatus) :
    ¬ lineageMatchesPipeline lineage pipeline := by
  intro hMatch
  exact hMismatch hMatch.2.2.2.1

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


/-!
## Immutable map-implementation bindings

The earlier lineage contract compares map labels. This layer binds each label
to an exact source revision/artifact, definition span, parameter manifest,
interface schema, and input/output type identifiers. The parameter manifest
must be canonical and include units, bounds, uncertainties, and an explicit
empty manifest when a map has no free parameters.

All digest values are computed externally from exact bytes. Lean does not
compute SHA-256, retrieve the referenced source, prove that an arbitrary
function below is implemented by the referenced bytes, or validate a build.
Independent hash verification and implementation/build attestation remain
external acceptance steps.
-/

/-- Immutable external identity for one map definition and its parameters. -/
structure MapImplementationBinding where
  mapId : String
  sourceLocator : String
  sourceRevision : String
  sourceArtifactSha256 : String
  definitionLocator : String
  definitionSha256 : String
  parameterManifestSha256 : String
  interfaceSchemaSha256 : String
  inputTypeId : String
  outputTypeId : String
  constructionStatus : MapConstructionStatus
  deriving DecidableEq, Repr

/-- Canonical external identifiers for the six objects in the map chain. -/
structure PipelineTypeIds where
  source : String
  candidate : String
  geometry : String
  slice : String
  observable : String
  measured : String
  deriving DecidableEq, Repr

/-- Five source-bound implementation records, one for each declared map. -/
structure PipelineImplementationManifest where
  sourceSpanKey : String
  sourceContentKey : SourceSpanContentKey
  interfaceSchemaSha256 : String
  typeIds : PipelineTypeIds
  sourceToCandidate : MapImplementationBinding
  candidateToGeometry : MapImplementationBinding
  geometryToSlice : MapImplementationBinding
  sliceToObservable : MapImplementationBinding
  instrumentToMeasured : MapImplementationBinding
  deriving DecidableEq, Repr

/-- Required provenance and digest fields for one implementation binding. -/
structure MapImplementationBindingComplete
    (binding : MapImplementationBinding) : Prop where
  mapId_nonempty : binding.mapId ≠ ""
  sourceLocator_nonempty : binding.sourceLocator ≠ ""
  sourceRevision_nonempty : binding.sourceRevision ≠ ""
  sourceArtifactSha256_nonempty : binding.sourceArtifactSha256 ≠ ""
  definitionLocator_nonempty : binding.definitionLocator ≠ ""
  definitionSha256_nonempty : binding.definitionSha256 ≠ ""
  parameterManifestSha256_nonempty : binding.parameterManifestSha256 ≠ ""
  interfaceSchemaSha256_nonempty : binding.interfaceSchemaSha256 ≠ ""
  inputTypeId_nonempty : binding.inputTypeId ≠ ""
  outputTypeId_nonempty : binding.outputTypeId ≠ ""
  constructionStatus_known : binding.constructionStatus ≠ .unknown

/-- A complete binding must match one exact map label, signature, and schema. -/
structure MapImplementationStageMatch
    (binding : MapImplementationBinding)
    (expectedMapId expectedInputTypeId expectedOutputTypeId expectedInterfaceSchemaSha256 : String) :
    Prop where
  complete : MapImplementationBindingComplete binding
  mapId_matches : binding.mapId = expectedMapId
  input_type_matches : binding.inputTypeId = expectedInputTypeId
  output_type_matches : binding.outputTypeId = expectedOutputTypeId
  interface_schema_matches : binding.interfaceSchemaSha256 = expectedInterfaceSchemaSha256

/--
The five implementation records must bind to the exact source lineage and
pipeline IDs, share one interface schema, and compose through matching
intermediate type identifiers. This is a metadata/admission contract.
-/
structure PipelineImplementationMatch
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (lineage : SourceBoundMapLineage)
    (pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured)
    (manifest : PipelineImplementationManifest) : Prop where
  lineage_matches : lineageMatchesPipeline lineage pipeline
  source_span_key_matches : manifest.sourceSpanKey = pipeline.sourceSpanKey
  source_content_key_matches : manifest.sourceContentKey = pipeline.sourceContentKey
  interface_schema_nonempty : manifest.interfaceSchemaSha256 ≠ ""
  source_type_id_nonempty : manifest.typeIds.source ≠ ""
  candidate_type_id_nonempty : manifest.typeIds.candidate ≠ ""
  geometry_type_id_nonempty : manifest.typeIds.geometry ≠ ""
  slice_type_id_nonempty : manifest.typeIds.slice ≠ ""
  observable_type_id_nonempty : manifest.typeIds.observable ≠ ""
  measured_type_id_nonempty : manifest.typeIds.measured ≠ ""
  source_to_candidate :
    MapImplementationStageMatch manifest.sourceToCandidate
      pipeline.sourceToCandidateMapId manifest.typeIds.source
      manifest.typeIds.candidate manifest.interfaceSchemaSha256
  candidate_to_geometry :
    MapImplementationStageMatch manifest.candidateToGeometry
      pipeline.candidateToGeometryMapId manifest.typeIds.candidate
      manifest.typeIds.geometry manifest.interfaceSchemaSha256
  geometry_to_slice :
    MapImplementationStageMatch manifest.geometryToSlice
      pipeline.geometryToSliceMapId manifest.typeIds.geometry
      manifest.typeIds.slice manifest.interfaceSchemaSha256
  slice_to_observable :
    MapImplementationStageMatch manifest.sliceToObservable
      pipeline.sliceToObservableMapId manifest.typeIds.slice
      manifest.typeIds.observable manifest.interfaceSchemaSha256
  instrument_to_measured :
    MapImplementationStageMatch manifest.instrumentToMeasured
      pipeline.instrumentMapId manifest.typeIds.observable
      manifest.typeIds.measured manifest.interfaceSchemaSha256
  source_to_candidate_status_matches :
    manifest.sourceToCandidate.constructionStatus = pipeline.sourceToCandidateStatus

/-- A pipeline admitted by the manifest contract carries its proof object. -/
structure ManifestBoundObservationPipeline
    (Source Candidate Geometry Slice Observable Measured : Type*) where
  pipeline : ObservationPipeline Source Candidate Geometry Slice Observable Measured
  lineage : SourceBoundMapLineage
  manifest : PipelineImplementationManifest
  evidence : PipelineImplementationMatch lineage pipeline manifest

/--
Reusing a map label does not preserve implementation identity when the exact
definition digest changes.
-/
theorem same_map_label_different_definition_digest_not_equal
    (left right : MapImplementationBinding)
    (hSameLabel : left.mapId = right.mapId)
    (hDifferentDefinition : left.definitionSha256 ≠ right.definitionSha256) :
    left ≠ right := by
  intro hEqual
  apply hDifferentDefinition
  exact congrArg (fun binding : MapImplementationBinding => binding.definitionSha256) hEqual

/--
Reusing a map label and definition digest does not preserve implementation
identity when its parameter-manifest digest changes.
-/
theorem same_map_label_different_parameter_manifest_not_equal
    (left right : MapImplementationBinding)
    (hSameLabel : left.mapId = right.mapId)
    (hSameDefinition : left.definitionSha256 = right.definitionSha256)
    (hDifferentParameters : left.parameterManifestSha256 ≠ right.parameterManifestSha256) :
    left ≠ right := by
  intro hEqual
  apply hDifferentParameters
  exact congrArg (fun binding : MapImplementationBinding => binding.parameterManifestSha256) hEqual

/--
A map label and implementation digest do not fix the interface when the
interface-schema digest changes.
-/
theorem same_map_label_different_interface_schema_not_equal
    (left right : MapImplementationBinding)
    (hSameLabel : left.mapId = right.mapId)
    (hSameDefinition : left.definitionSha256 = right.definitionSha256)
    (hDifferentInterface : left.interfaceSchemaSha256 ≠ right.interfaceSchemaSha256) :
    left ≠ right := by
  intro hEqual
  apply hDifferentInterface
  exact congrArg (fun binding : MapImplementationBinding => binding.interfaceSchemaSha256) hEqual

/-- Every stage in a manifest-bound pipeline has a complete identity record. -/
theorem manifest_bound_pipeline_has_complete_map_bindings
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (bound : ManifestBoundObservationPipeline Source Candidate Geometry Slice Observable Measured) :
    MapImplementationBindingComplete bound.manifest.sourceToCandidate ∧
    MapImplementationBindingComplete bound.manifest.candidateToGeometry ∧
    MapImplementationBindingComplete bound.manifest.geometryToSlice ∧
    MapImplementationBindingComplete bound.manifest.sliceToObservable ∧
    MapImplementationBindingComplete bound.manifest.instrumentToMeasured := by
  exact ⟨bound.evidence.source_to_candidate.complete,
    bound.evidence.candidate_to_geometry.complete,
    bound.evidence.geometry_to_slice.complete,
    bound.evidence.slice_to_observable.complete,
    bound.evidence.instrument_to_measured.complete⟩

/--
The manifest's intermediate type identifiers compose in the same order as
the typed observation pipeline.
-/
theorem manifest_bound_pipeline_has_type_coherent_composition
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (bound : ManifestBoundObservationPipeline Source Candidate Geometry Slice Observable Measured) :
    bound.manifest.sourceToCandidate.outputTypeId =
        bound.manifest.candidateToGeometry.inputTypeId ∧
    bound.manifest.candidateToGeometry.outputTypeId =
        bound.manifest.geometryToSlice.inputTypeId ∧
    bound.manifest.geometryToSlice.outputTypeId =
        bound.manifest.sliceToObservable.inputTypeId ∧
    bound.manifest.sliceToObservable.outputTypeId =
        bound.manifest.instrumentToMeasured.inputTypeId := by
  constructor
  · calc
      bound.manifest.sourceToCandidate.outputTypeId =
          bound.manifest.typeIds.candidate :=
        bound.evidence.source_to_candidate.output_type_matches
      _ = bound.manifest.candidateToGeometry.inputTypeId :=
        bound.evidence.candidate_to_geometry.input_type_matches.symm
  constructor
  · calc
      bound.manifest.candidateToGeometry.outputTypeId =
          bound.manifest.typeIds.geometry :=
        bound.evidence.candidate_to_geometry.output_type_matches
      _ = bound.manifest.geometryToSlice.inputTypeId :=
        bound.evidence.geometry_to_slice.input_type_matches.symm
  constructor
  · calc
      bound.manifest.geometryToSlice.outputTypeId =
          bound.manifest.typeIds.slice :=
        bound.evidence.geometry_to_slice.output_type_matches
      _ = bound.manifest.sliceToObservable.inputTypeId :=
        bound.evidence.slice_to_observable.input_type_matches.symm
  · calc
      bound.manifest.sliceToObservable.outputTypeId =
          bound.manifest.typeIds.observable :=
        bound.evidence.slice_to_observable.output_type_matches
      _ = bound.manifest.instrumentToMeasured.inputTypeId :=
        bound.evidence.instrument_to_measured.input_type_matches.symm

/-- The manifest-bound pipeline retains the source and content lineage checks. -/
theorem manifest_bound_pipeline_preserves_source_lineage
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (bound : ManifestBoundObservationPipeline Source Candidate Geometry Slice Observable Measured) :
    lineageMatchesPipeline bound.lineage bound.pipeline :=
  bound.evidence.lineage_matches

/-- The source-to-candidate construction status cannot drift from its lineage. -/
theorem manifest_bound_pipeline_preserves_source_map_status
    {Source Candidate Geometry Slice Observable Measured : Type*}
    (bound : ManifestBoundObservationPipeline Source Candidate Geometry Slice Observable Measured) :
    bound.manifest.sourceToCandidate.constructionStatus = bound.lineage.translationStatus := by
  calc
    bound.manifest.sourceToCandidate.constructionStatus =
        bound.pipeline.sourceToCandidateStatus :=
      bound.evidence.source_to_candidate_status_matches
    _ = bound.lineage.translationStatus :=
      bound.evidence.lineage_matches.2.2.2.1.symm

end HsHVerification.EnheduannaObservedSliceIdentifiability

/-! Theorem-specific dependency reports for exact-head CI inspection. -/
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_user_role_message_has_distinct_span_origins
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_source_spans_are_disjoint
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_span_content_keys_are_distinct
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_source_spans_partition_with_two_byte_separator
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_direct_reclassification_preserves_content_key
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.nov04_direct_reclassification_changes_claim_key
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.SourceSpanEvidence.reclassify_preserves_content_key
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.SourceSpanEvidence.reclassify_changes_claim_key_of_attribution_change
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.candidate_identity_identifiable_iff_unique
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.property_identifiable_iff_single_value
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.property_identifiable_without_candidate_uniqueness
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.differing_compatible_property_values_block_identifiability
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.two_compatible_predictions_within_twice_tolerance
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.prediction_separation_excludes_joint_compatibility
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.lineageMatchesPipeline
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.source_span_key_mismatch_breaks_lineage_match
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.source_content_key_mismatch_breaks_lineage_match
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.source_map_identity_mismatch_breaks_lineage_match
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.source_map_status_mismatch_breaks_lineage_match
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.ObservationPipeline.predict_apply
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.ObservationPipeline.predictFromSource_apply

#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.same_map_label_different_definition_digest_not_equal
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.same_map_label_different_parameter_manifest_not_equal
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.same_map_label_different_interface_schema_not_equal
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.manifest_bound_pipeline_has_complete_map_bindings
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.manifest_bound_pipeline_has_type_coherent_composition
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.manifest_bound_pipeline_preserves_source_lineage
#print axioms HsHVerification.EnheduannaObservedSliceIdentifiability.manifest_bound_pipeline_preserves_source_map_status
