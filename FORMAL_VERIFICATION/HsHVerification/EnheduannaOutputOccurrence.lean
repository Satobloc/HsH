import Mathlib
import HsHVerification.EnheduannaSourceExposure

/-!
Output-artifact occurrence is distinct from source attestation, context inclusion,
and output attribution.

This module adds a positive occurrence witness and a separately scoped completeness
contract for negative absence claims. It is an abstract information-architecture
specification, not an empirical claim about any particular execution.
-/ 

namespace HsHVerification.EnheduannaOutputOccurrence

open HsHVerification.EnheduannaSourceExposure

/--
A positive witness that one output artifact was captured for an exact run,
context snapshot, and output key.

The digest and locator are required to be nonempty. This structure does not
validate a SHA-256 encoding, prove that the locator is immutable, authenticate
the capture timestamp, or establish source use or causal influence.
-/
structure OutputArtifactOccurrenceWitness
    (Run SnapshotId OutputId CaptureTime : Type) where
  runId : Run
  snapshotId : SnapshotId
  outputId : OutputId
  artifactDigest : String
  artifactDigestNonempty : artifactDigest ≠ ""
  artifactLocator : String
  artifactLocatorNonempty : artifactLocator ≠ ""
  capturedAt : CaptureTime

/-- A run/snapshot/output key has at least one positive occurrence witness. -/
def HasOutputOccurrence
    (CaptureTime : Type)
    {Run SnapshotId OutputId : Type}
    (run : Run) (snapshot : SnapshotId) (output : OutputId) : Prop :=
  ∃ witness : OutputArtifactOccurrenceWitness Run SnapshotId OutputId CaptureTime,
    witness.runId = run ∧
    witness.snapshotId = snapshot ∧
    witness.outputId = output

/--
An occurrence witness and an output-attribution record are joined only when
their run, snapshot, and output identifiers match exactly.
-/
def occurrenceMatchesAttribution
    {Source Digest Run SnapshotId OutputId Span CaptureTime : Type}
    (witness : OutputArtifactOccurrenceWitness Run SnapshotId OutputId CaptureTime)
    (record : OutputAttributionRecord Source Digest Run SnapshotId OutputId Span) : Prop :=
  witness.runId = record.runId ∧
  witness.snapshotId = record.snapshotId ∧
  witness.outputId = record.outputId

/--
A claim-specific join of three separate evidence objects:
source attestation, output-attribution record, and observed output occurrence.
This join does not make semantic support or causal influence part of the same
evidence object.
-/
structure OccurrenceBoundAttribution
    (Source Digest Locator Role Timestamp Parent ReadExtent Run SnapshotId OutputId Span CaptureTime : Type) where
  sourceAttestation :
    SourceAttestation Source Digest Locator Role Timestamp Parent ReadExtent
  outputRecord :
    OutputAttributionRecord Source Digest Run SnapshotId OutputId Span
  sourceSpan : Span
  occurrence :
    OutputArtifactOccurrenceWitness Run SnapshotId OutputId CaptureTime
  exactKeyMatch :
    occurrenceMatchesAttribution occurrence outputRecord
  sourceSpanAttributed :
    outputAttributesSourceSpan sourceAttestation sourceSpan outputRecord

/-- The joined evidence object preserves exact run/snapshot/output identity. -/
theorem occurrence_bound_attribution_has_exact_key
    {Source Digest Locator Role Timestamp Parent ReadExtent Run SnapshotId OutputId Span CaptureTime : Type}
    (bundle :
      OccurrenceBoundAttribution Source Digest Locator Role Timestamp Parent ReadExtent
        Run SnapshotId OutputId Span CaptureTime) :
    bundle.occurrence.runId = bundle.outputRecord.runId ∧
    bundle.occurrence.snapshotId = bundle.outputRecord.snapshotId ∧
    bundle.occurrence.outputId = bundle.outputRecord.outputId :=
  bundle.exactKeyMatch

/--
An output-capture index records what its manifest lists. By itself it carries
no completeness claim, so absence from this index is not a negative occurrence
claim.
-/
structure OutputCaptureIndex
    (Run SnapshotId OutputId CaptureTime : Type) where
  runId : Run
  snapshotId : SnapshotId
  outputIds : Set OutputId
  manifestDigest : String
  manifestDigestNonempty : manifestDigest ≠ ""
  manifestLocator : String
  manifestLocatorNonempty : manifestLocator ≠ ""
  capturedAt : CaptureTime

/--
A completeness-bounded index for one declared run/snapshot scope.

The coverage field is an explicit premise supplied by the manifest/assay
process. The opaque integrity certificate is required to be present, but Lean
does not authenticate its issuer, signature, independence, or real-world
coverage. Those remain external verification obligations.
-/
structure CompleteOutputCaptureIndex
    (Run SnapshotId OutputId CaptureTime IntegrityCertificate : Type)
    extends OutputCaptureIndex Run SnapshotId OutputId CaptureTime where
  integrityCertificate : IntegrityCertificate
  coversEveryOccurrence :
    ∀ witness : OutputArtifactOccurrenceWitness Run SnapshotId OutputId CaptureTime,
      witness.runId = runId →
      witness.snapshotId = snapshotId →
      witness.outputId ∈ outputIds

/--
Absence from a complete index excludes an occurrence only inside the exact
run/snapshot scope for which completeness was supplied.
-/
theorem absence_from_complete_capture_excludes_scoped_occurrence
    {Run SnapshotId OutputId CaptureTime IntegrityCertificate : Type}
    (index :
      CompleteOutputCaptureIndex Run SnapshotId OutputId CaptureTime IntegrityCertificate)
    (output : OutputId)
    (hAbsent : output ∉ index.outputIds) :
    ¬ HasOutputOccurrence CaptureTime index.runId index.snapshotId output := by
  intro hOccurrence
  rcases hOccurrence with ⟨witness, hRun, hSnapshot, hOutput⟩
  exact hAbsent (hOutput ▸ index.coversEveryOccurrence witness hRun hSnapshot)

/--
A partial index can omit an output even when a positive occurrence witness
exists. This countermodel is conditional on the supplied witness; it invents
no physical system, measurement, or numerical fixture.
-/
theorem partial_index_absence_is_compatible_with_occurrence
    {Run SnapshotId OutputId CaptureTime : Type}
    (run : Run) (snapshot : SnapshotId) (output : OutputId)
    (witness : OutputArtifactOccurrenceWitness Run SnapshotId OutputId CaptureTime)
    (hRun : witness.runId = run)
    (hSnapshot : witness.snapshotId = snapshot)
    (hOutput : witness.outputId = output)
    (manifestDigest manifestLocator : String)
    (hManifestDigest : manifestDigest ≠ "")
    (hManifestLocator : manifestLocator ≠ "") :
    ∃ index : OutputCaptureIndex Run SnapshotId OutputId CaptureTime,
      output ∉ index.outputIds ∧
      HasOutputOccurrence CaptureTime run snapshot output := by
  let index : OutputCaptureIndex Run SnapshotId OutputId CaptureTime :=
    { runId := run
      snapshotId := snapshot
      outputIds := ∅
      manifestDigest := manifestDigest
      manifestDigestNonempty := hManifestDigest
      manifestLocator := manifestLocator
      manifestLocatorNonempty := hManifestLocator
      capturedAt := witness.capturedAt }
  refine ⟨index, ?_, ⟨witness, hRun, hSnapshot, hOutput⟩⟩
  simp [index]

#print axioms occurrence_bound_attribution_has_exact_key
#print axioms absence_from_complete_capture_excludes_scoped_occurrence
#print axioms partial_index_absence_is_compatible_with_occurrence

end HsHVerification.EnheduannaOutputOccurrence
