import Mathlib

/-!
# Aldus: O9 optical extraction and chronology gate

Source: HsH conversation export
`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_12/25.06.06•26.06.15•🤖 SAT O REWRITE SUPERVISOR — raw.json`.

The repository blob is `d6faa4aef4c7549e233c7eb169b6362040a2911f`
(3,701,950 bytes). The same raw export was materialized from the Library;
its Git blob SHA-1 recomputation matched this repository blob exactly.

The attachment is user-supplied, but its embedded author is unresolved.
A conversation-local `tether_quote` extraction exists. It is not the
original PDF binary and does not provide a byte hash of the upload.

The raw mapping's parent chain places the extraction before the assistant
label proposal, while the recorded create_time values place the proposal
before the extraction. Preserve both relations; do not infer which one
reflects the actual information-flow chronology.

The extracted text states a nominal phase of about 1.48 rad and prints
1.475 rad from code, while its stated rejection band is 0.1–0.3 rad.
This module proves only the arithmetic relation among those transcribed
values. It does not execute the PDF's code, evaluate the optical integral,
validate a physical model, or establish an experimental result.

All source facts below are transcribed from the bounded export and current
archive metadata. Lean checks the encoded finite record, not the source
authenticity or the semantic correctness of the transcription.
-/

namespace HsHVerification.AldusO9ExtractionChronology

inductive Event where
  | upload
  | searchDisplay
  | tetherQuote
  | filesLoaded
  | labelProposal
  | userConfirmation
  deriving DecidableEq, Repr

inductive Role where
  | user
  | tool
  | assistant
  deriving DecidableEq, Repr

def role : Event → Role
  | .upload => .user
  | .searchDisplay => .tool
  | .tetherQuote => .tool
  | .filesLoaded => .tool
  | .labelProposal => .assistant
  | .userConfirmation => .user

/-! Parent pointers restricted to the six-node subgraph. The upload's
external parent is outside this bounded subgraph. -/
def parent : Event → Option Event
  | .upload => none
  | .searchDisplay => some .upload
  | .tetherQuote => some .searchDisplay
  | .filesLoaded => some .tetherQuote
  | .labelProposal => some .filesLoaded
  | .userConfirmation => some .labelProposal

def parentChainIndex : Event → Nat
  | .upload => 0
  | .searchDisplay => 1
  | .tetherQuote => 2
  | .filesLoaded => 3
  | .labelProposal => 4
  | .userConfirmation => 5

/-! Recorded create_time decimals, scaled to integer microseconds. This
is a transcription of the exported decimal values, not a clock-accuracy
claim. -/
def timestampMicros : Event → Nat
  | .upload => 1750650472442000
  | .searchDisplay => 1750650481214018
  | .tetherQuote => 1750650481214068
  | .filesLoaded => 1750650481214108
  | .labelProposal => 1750650473461564
  | .userConfirmation => 1750650509080000

theorem upload_role_is_user : role .upload = .user := rfl
theorem extraction_role_is_tool : role .tetherQuote = .tool := rfl
theorem label_proposal_role_is_assistant : role .labelProposal = .assistant := rfl
theorem confirmation_role_is_user : role .userConfirmation = .user := rfl

theorem quote_parent_is_search_display :
    parent .tetherQuote = some .searchDisplay := rfl

theorem proposal_parent_is_files_loaded :
    parent .labelProposal = some .filesLoaded := rfl

theorem confirmation_parent_is_label_proposal :
    parent .userConfirmation = some .labelProposal := rfl

theorem quote_precedes_proposal_in_parent_chain :
    parentChainIndex .tetherQuote < parentChainIndex .labelProposal := by
  decide

theorem proposal_precedes_quote_by_recorded_timestamp :
    timestampMicros .labelProposal < timestampMicros .tetherQuote := by
  decide

/-- The parent-chain and timestamp orderings disagree for this pair.
This is a source-export chronology conflict, not a causal conclusion. -/
theorem parent_and_timestamp_orders_conflict :
    parentChainIndex .tetherQuote < parentChainIndex .labelProposal ∧
    timestampMicros .labelProposal < timestampMicros .tetherQuote := by
  decide

theorem proposal_to_quote_timestamp_gap_microseconds :
    timestampMicros .tetherQuote - timestampMicros .labelProposal = 7752504 := by
  decide

theorem upload_to_proposal_timestamp_gap_microseconds :
    timestampMicros .labelProposal - timestampMicros .upload = 1019564 := by
  decide

theorem proposal_to_confirmation_timestamp_gap_microseconds :
    timestampMicros .userConfirmation - timestampMicros .labelProposal = 35618436 := by
  decide

/-! The user-upload record and the tether_quote record point to the same
attachment identifier. This does not establish byte identity. -/
def attachmentId : String := "file-HFGRyeSmmQNsmLwnnw61NW"
def tetherQuoteUrl : String := "file-HFGRyeSmmQNsmLwnnw61NW"
def attachmentBytes : Nat := 382611
def attachmentMimeType : String := "application/pdf"

theorem quote_references_uploaded_attachment :
    tetherQuoteUrl = attachmentId := rfl

/-! Conversation-local text extraction identity. -/
def extractionTextSha256 : String :=
  "3a4b3c59db64985416fe19a8837b3251e150c289fa150be3e0b3596f50744482"
def extractionTextCodepoints : Nat := 3151
def extractionTextUtf8Bytes : Nat := 3268
def extractionPageMarkers : List Nat := [1, 2, 3]
def extractionTableContainsEllipsis : Bool := true

theorem extraction_page_marker_count :
    extractionPageMarkers.length = 3 := by
  decide

theorem extracted_table_is_abbreviated :
    extractionTableContainsEllipsis = true := rfl

/-! The two SAT-archive paths share one Git blob. Their separate path
commits are not independent binary witnesses. -/
def archiveBlobPathA : String :=
  "cfaad753c7c7d9302dfa6594f7ee495421af4505"
def archiveBlobPathB : String :=
  "cfaad753c7c7d9302dfa6594f7ee495421af4505"
def archivePdfBytes : Nat := 382611
def archivePathAFirstGitCommitSeconds : Nat := 1788558297
def archivePathBFirstGitCommitSeconds : Nat := 1788558743

theorem archive_paths_share_one_git_blob :
    archiveBlobPathA = archiveBlobPathB := rfl

theorem archive_path_commit_gap_seconds :
    archivePathBFirstGitCommitSeconds -
      archivePathAFirstGitCommitSeconds = 446 := by
  decide

/-! Unknowns are represented as unknown, not inferred from matching
filename and size. -/
def originalAttachmentSha256 : Option String := none
def archiveToOriginalByteIdentity : Option Bool := none
def historicalVisibilityAtArchiveCommits : Option Bool := none
def firstPublicT0 : Option Nat := none
def originalAttachmentBinaryAvailableInCurrentSourceSet : Bool := false

theorem original_attachment_sha256_unavailable :
    originalAttachmentSha256 = none := rfl

theorem archive_to_original_byte_identity_unresolved :
    archiveToOriginalByteIdentity = none := rfl

theorem historical_visibility_at_archive_commits_unresolved :
    historicalVisibilityAtArchiveCommits = none := rfl

theorem first_public_t0_not_established :
    firstPublicT0 = none := rfl

/-! The old-archive queue reports no archive extraction mapping. That
does not erase the separate conversation-local tether_quote extraction. -/
def conversationLocalExtractionAvailable : Bool := true
def archiveQueueExtractionAvailable : Bool := false

theorem extraction_scope_distinction :
    conversationLocalExtractionAvailable = true ∧
    archiveQueueExtractionAvailable = false := by
  decide

/-! Source-internal numerical consistency check. Values are transcribed
from the extracted text and converted to integer milliradians. -/
def abstractNominalPhaseMilliRad : Nat := 1480
def codePrintedPhaseMilliRad : Nat := 1475
def statedRejectionBandLowerMilliRad : Nat := 100
def statedRejectionBandUpperMilliRad : Nat := 300

theorem abstract_nominal_phase_exceeds_stated_upper_bound :
    statedRejectionBandUpperMilliRad < abstractNominalPhaseMilliRad := by
  decide

theorem code_printed_phase_exceeds_stated_upper_bound :
    statedRejectionBandUpperMilliRad < codePrintedPhaseMilliRad := by
  decide

theorem both_printed_nominal_values_outside_stated_band :
    statedRejectionBandUpperMilliRad < abstractNominalPhaseMilliRad ∧
    statedRejectionBandUpperMilliRad < codePrintedPhaseMilliRad := by
  decide

#print axioms parent_and_timestamp_orders_conflict
#print axioms proposal_to_quote_timestamp_gap_microseconds
#print axioms quote_references_uploaded_attachment
#print axioms archive_paths_share_one_git_blob
#print axioms archive_path_commit_gap_seconds
#print axioms extraction_scope_distinction
#print axioms abstract_nominal_phase_exceeds_stated_upper_bound
#print axioms code_printed_phase_exceeds_stated_upper_bound
#print axioms both_printed_nominal_values_outside_stated_band

end HsHVerification.AldusO9ExtractionChronology
