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


/-!
## Earlier optical-note source and scope chronology

A second raw conversation contains an earlier user-role message with the full
LaTeX optical note. It precedes the later PDF intake that received the temporary
O9 label. The outer role establishes user-supplied provenance, not sole
authorship of the embedded draft or its byline.

The first and repeated user prompts are sibling branches with the same parent.
The assistant cleanroom rewrite is a child of the repeated prompt, not of the
earlier sibling. The later PDF upload and O9 label belong to a different
conversation. Preserve these graph and timestamp facts separately.

The user later corrected the interpretation: the optical construction was
analogy/inspiration only, not a direct SAT contribution, SAT verification, or
SAT falsification route; the user also challenged novelty and the contextual
scope of MathProof. The later "CONFIRM" confirms the assistant's temporary
intake label and pipeline handling, not authorship, novelty, physical validity,
or canonical SAT-O status.

The first-public optical-O9 date remains unknown in the bounded public ledger.
Broad SAT exposure and the separate O9 graviton filename candidate are
different claim granularities/referents.
-/

namespace HsHVerification.AldusO9OpticalSourceChronology

inductive SourceEvent where
  | firstUserDraft
  | repeatedUserDraftPrompt
  | assistantCleanroomRewrite
  | userAnalogyOnlyCorrection
  | userNoNoveltyCorrection
  | userLabAnalogueSpeculation
  | userLabAnalogueCaveat
  | userMathProofContextCorrection
  | laterPdfUpload
  | assistantTemporaryO9Label
  | userLabelConfirmation
  deriving DecidableEq, Repr

inductive SourceRole where
  | user
  | assistant
  deriving DecidableEq, Repr

def sourceRole : SourceEvent → SourceRole
  | .firstUserDraft => .user
  | .repeatedUserDraftPrompt => .user
  | .assistantCleanroomRewrite => .assistant
  | .userAnalogyOnlyCorrection => .user
  | .userNoNoveltyCorrection => .user
  | .userLabAnalogueSpeculation => .user
  | .userLabAnalogueCaveat => .user
  | .userMathProofContextCorrection => .user
  | .laterPdfUpload => .user
  | .assistantTemporaryO9Label => .assistant
  | .userLabelConfirmation => .user

/-! Recorded create_time decimals, scaled to integer microseconds. -/
def sourceTimestampMicros : SourceEvent → Nat
  | .firstUserDraft => 1750642594820000
  | .repeatedUserDraftPrompt => 1750642710340000
  | .assistantCleanroomRewrite => 1750642711669365
  | .userAnalogyOnlyCorrection => 1750643282722000
  | .userNoNoveltyCorrection => 1750643477384000
  | .userLabAnalogueSpeculation => 1750643719983000
  | .userLabAnalogueCaveat => 1750643828186000
  | .userMathProofContextCorrection => 1750647288414000
  | .laterPdfUpload => 1750650472442000
  | .assistantTemporaryO9Label => 1750650473461564
  | .userLabelConfirmation => 1750650509080000

def sourceConversationId : SourceEvent → String
  | .firstUserDraft => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .repeatedUserDraftPrompt => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .assistantCleanroomRewrite => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .userAnalogyOnlyCorrection => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .userNoNoveltyCorrection => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .userLabAnalogueSpeculation => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .userLabAnalogueCaveat => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .userMathProofContextCorrection => "681da28f-2d44-8003-bc6e-0e1929c125c4"
  | .laterPdfUpload => "68430902-ada8-8003-981f-0bf779b8353f"
  | .assistantTemporaryO9Label => "68430902-ada8-8003-981f-0bf779b8353f"
  | .userLabelConfirmation => "68430902-ada8-8003-981f-0bf779b8353f"

def sourceMessageId : SourceEvent → String
  | .firstUserDraft => "73bab87f-6a86-45a8-aa20-6837b362438c"
  | .repeatedUserDraftPrompt => "d9b0bd7d-96d3-4a8a-9add-29bcffa4bec0"
  | .assistantCleanroomRewrite => "7b3532ea-c5ce-40d4-882a-45e15ff50cd3"
  | .userAnalogyOnlyCorrection => "c86811f9-5b46-4953-8c96-a48c049f294a"
  | .userNoNoveltyCorrection => "4ee764ed-85c0-46c2-944d-fbdd6e13981e"
  | .userLabAnalogueSpeculation => "ee668a69-b132-442a-9380-c4fb7251185a"
  | .userLabAnalogueCaveat => "1a875034-ddd0-48c3-af1e-4c77af02ef0f"
  | .userMathProofContextCorrection => "7e5b66bd-0d61-4a21-a162-ae2e5e3f45a0"
  | .laterPdfUpload => "13115169-09a8-4998-8d6e-3a8827c02c18"
  | .assistantTemporaryO9Label => "e893cb09-f28f-4aff-9c0f-05a8c6138861"
  | .userLabelConfirmation => "e60d3c5b-49e6-456a-ad0f-0f7e37552960"

def sourceParentId : SourceEvent → String
  | .firstUserDraft => "f8e5cc86-ed89-4f59-8d8a-da4496124e4a"
  | .repeatedUserDraftPrompt => "f8e5cc86-ed89-4f59-8d8a-da4496124e4a"
  | .assistantCleanroomRewrite => "d9b0bd7d-96d3-4a8a-9add-29bcffa4bec0"
  | .userAnalogyOnlyCorrection => "eda24ff2-a45f-4f69-afda-44749878cf6a"
  | .userNoNoveltyCorrection => "5ca58935-b645-4742-bb77-e2d649e0faea"
  | .userLabAnalogueSpeculation => "01a81054-ddd0-48c3-af1e-4c77af02ef0f"
  | .userLabAnalogueCaveat => "01a81054-ddd0-48c3-af1e-4c77af02ef0f"
  | .userMathProofContextCorrection => "e3988b24-4722-45bf-8463-f5c1ef9e3fc6"
  | .laterPdfUpload => "53b82f87-6517-4821-88a6-ec0f2b92966e"
  | .assistantTemporaryO9Label => "763322fa-6016-4b81-a8f6-e8d4976f1d46"
  | .userLabelConfirmation => "e893cb09-f28f-4aff-9c0f-05a8c6138861"

def boundedUserRoleRecords : List SourceEvent :=
  [ .firstUserDraft
  , .repeatedUserDraftPrompt
  , .userAnalogyOnlyCorrection
  , .userNoNoveltyCorrection
  , .userLabAnalogueSpeculation
  , .userLabAnalogueCaveat
  , .userMathProofContextCorrection
  , .laterPdfUpload
  , .userLabelConfirmation
  ]

def earlierSourceEvent (a b : SourceEvent) : SourceEvent :=
  if sourceTimestampMicros a ≤ sourceTimestampMicros b then a else b

def earliestSourceEvent (xs : List SourceEvent) : Option SourceEvent :=
  xs.foldl
    (fun acc e =>
      match acc with
      | none => some e
      | some prior => some (earlierSourceEvent prior e))
    none

theorem earliestUserRoleRecordInBoundedSet :
    earliestSourceEvent boundedUserRoleRecords = some .firstUserDraft := by
  decide

theorem firstDraftPrecedesLaterPdfIntake :
    sourceTimestampMicros .firstUserDraft <
      sourceTimestampMicros .laterPdfUpload := by
  decide

theorem userAnalogyCorrectionPrecedesO9Label :
    sourceTimestampMicros .userAnalogyOnlyCorrection <
      sourceTimestampMicros .assistantTemporaryO9Label := by
  decide

theorem userNoNoveltyCorrectionPrecedesO9Label :
    sourceTimestampMicros .userNoNoveltyCorrection <
      sourceTimestampMicros .assistantTemporaryO9Label := by
  decide

theorem userMathProofContextCorrectionPrecedesO9Label :
    sourceTimestampMicros .userMathProofContextCorrection <
      sourceTimestampMicros .assistantTemporaryO9Label := by
  decide

theorem pdfIntakePrecedesTemporaryO9Label :
    sourceTimestampMicros .laterPdfUpload <
      sourceTimestampMicros .assistantTemporaryO9Label := by
  decide

theorem temporaryO9LabelPrecedesUserConfirmation :
    sourceTimestampMicros .assistantTemporaryO9Label <
      sourceTimestampMicros .userLabelConfirmation := by
  decide

theorem firstAndRepeatedDraftPromptsShareParent :
    sourceParentId .firstUserDraft =
      sourceParentId .repeatedUserDraftPrompt := rfl

theorem assistantRewriteIsChildOfRepeatedPrompt :
    sourceParentId .assistantCleanroomRewrite =
      sourceMessageId .repeatedUserDraftPrompt := rfl

theorem firstDraftAndPdfIntakeAreDifferentConversations :
    sourceConversationId .firstUserDraft ≠
      sourceConversationId .laterPdfUpload := by
  decide

theorem firstDraftAndAssistantRewriteHaveDifferentOuterRoles :
    sourceRole .firstUserDraft = .user ∧
    sourceRole .assistantCleanroomRewrite = .assistant := by
  decide

theorem pdfUploadAndTemporaryLabelHaveDifferentOuterRoles :
    sourceRole .laterPdfUpload = .user ∧
    sourceRole .assistantTemporaryO9Label = .assistant := by
  decide

theorem labelConfirmationIsUserRole :
    sourceRole .userLabelConfirmation = .user := rfl

/-! The original attachment binary hash is unavailable. The two archive
paths share a blob, but that does not establish attachment-to-archive
byte identity. -/
def originalPdfAttachmentSha256 : Option String := none
def archivePdfBlobSha1 : String :=
  "cfaad753c7c7d9302dfa6594f7ee495421af4505"
def archivePdfBytes : Nat := 382611
def chatAttachmentBytes : Nat := 382611

theorem originalPdfAttachmentSha256Unavailable :
    originalPdfAttachmentSha256 = none := rfl

theorem archiveAndAttachmentSizesMatch :
    archivePdfBytes = chatAttachmentBytes := rfl

/-! This none is a bounded-ledger result, not proof of global absence. -/
def opticalO9PublicT0InBoundedLedger : Option Nat := none

theorem opticalO9PublicT0NotEstablishedInBoundedLedger :
    opticalO9PublicT0InBoundedLedger = none := rfl

#print axioms earliestUserRoleRecordInBoundedSet
#print axioms firstDraftPrecedesLaterPdfIntake
#print axioms userAnalogyCorrectionPrecedesO9Label
#print axioms userNoNoveltyCorrectionPrecedesO9Label
#print axioms userMathProofContextCorrectionPrecedesO9Label
#print axioms pdfIntakePrecedesTemporaryO9Label
#print axioms temporaryO9LabelPrecedesUserConfirmation
#print axioms firstAndRepeatedDraftPromptsShareParent
#print axioms assistantRewriteIsChildOfRepeatedPrompt
#print axioms firstDraftAndPdfIntakeAreDifferentConversations
#print axioms firstDraftAndAssistantRewriteHaveDifferentOuterRoles
#print axioms pdfUploadAndTemporaryLabelHaveDifferentOuterRoles
#print axioms labelConfirmationIsUserRole
#print axioms originalPdfAttachmentSha256Unavailable
#print axioms archiveAndAttachmentSizesMatch
#print axioms opticalO9PublicT0NotEstablishedInBoundedLedger

end HsHVerification.AldusO9OpticalSourceChronology
