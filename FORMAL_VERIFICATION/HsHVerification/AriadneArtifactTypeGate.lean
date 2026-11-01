import Mathlib

/-!
Ariadne artifact-type and claim-eligibility gate, 2026-11-01.

Source basis:
* Library bundle 2026-10-31_BS_txt_0007 contains KIRK_mind.txt,
  READY_ROOM.txt, and READY_ROOM_README.txt as named text sections.
* Bundle 2026-10-31_BS_txt_0008 contains THE_WHOLE_READY.txt.
* A byte-preserving Python replay recomputed the section SHA-256 values after
  removing exactly the three LF separator bytes used by the bundle format;
  the resulting full digests match the embedded 16-hex prefixes.
* KIRK_mind.txt and READY_ROOM.txt share one exact LF-normalized block of
  12,598 lines. Their names do not make them independent witnesses.
* KIRK_mind and READY_ROOM are mixed dialogue-like text sections without raw
  outer role metadata, message UUIDs, or authenticated conversation envelopes.
  Their names do not establish that either is a standalone mind profile.
* READY_ROOM_README is a standalone instruction-document section labelled
  v1.2.1. THE_WHOLE_READY is a composite section containing a v1.3 guide.
  The higher version label alone does not establish authenticated
  supersession or canonical authority.
* A separate Library raw export has metadata title MARLOWE and conversation ID
  6aa8a2bf-8280-83e9-9d57-1e0af853b7f1. Its user-role message
  41fe4df4-fa3f-4045-bf99-0f095903c052 is timestamped and message-identified,
  but author.name is null. The HsH repository path label "Revival Rotation"
  points to a distinct serialized capture of the same conversation ID; the
  path label is not the metadata title, and byte identity is not established.

The Bool fields below are explicit external audit inputs. Lean does not parse
the Library files, verify their SHA-256 calculations, authenticate authorship,
or decide whether the human classification is correct. It checks only the
conditional eligibility rules encoded here.
-/

namespace HsHVerification.AriadneArtifactTypeGate

inductive ArtifactKind where
  | rawRoleTaggedConversation
  | speakerLabeledTranscript
  | mixedTranscriptWithoutRoleMetadata
  | instructionDocument
  | compositeDocument
  deriving DecidableEq, Repr

inductive ClaimKind where
  | contentDigestComputed
  | bundleSectionIntegrity
  | outerRoleAttribution
  | speakerAttribution
  | authorAttribution
  | chronologyAttribution
  | canonicalVersionAuthority
  deriving DecidableEq, Repr

structure ArtifactEvidence where
  displayName : String
  metadataTitle : Option String
  archivePathLabel : Option String
  kind : ArtifactKind
  contentDigestComputed : Bool
  embeddedDigestMatched : Bool
  hasOuterRoleMetadata : Bool
  hasExplicitSpeakerLabels : Bool
  hasConversationIdentity : Bool
  hasMessageIdentifiers : Bool
  hasTimestampMetadata : Bool
  hasAuthenticatedAuthorIdentity : Bool
  hasExplicitSupersession : Bool
  hasProvenanceLink : Bool
  versionLabelPresent : Bool
  deriving Repr

/-- Claim eligibility is determined by evidence type and metadata, not filename,
    archive path, conversation title, or version label. -/
def supports (a : ArtifactEvidence) (claim : ClaimKind) : Prop :=
  match claim with
  | .contentDigestComputed =>
      a.contentDigestComputed = true
  | .bundleSectionIntegrity =>
      a.contentDigestComputed = true ∧ a.embeddedDigestMatched = true
  | .outerRoleAttribution =>
      a.kind = .rawRoleTaggedConversation ∧
      a.hasOuterRoleMetadata = true
  | .speakerAttribution =>
      a.kind = .speakerLabeledTranscript ∧
      a.hasExplicitSpeakerLabels = true
  | .authorAttribution =>
      a.kind = .rawRoleTaggedConversation ∧
      a.hasOuterRoleMetadata = true ∧
      a.hasConversationIdentity = true ∧
      a.hasMessageIdentifiers = true ∧
      a.hasAuthenticatedAuthorIdentity = true
  | .chronologyAttribution =>
      a.kind = .rawRoleTaggedConversation ∧
      a.hasOuterRoleMetadata = true ∧
      a.hasConversationIdentity = true ∧
      a.hasMessageIdentifiers = true ∧
      a.hasTimestampMetadata = true
  | .canonicalVersionAuthority =>
      a.hasExplicitSupersession = true ∧
      a.hasProvenanceLink = true

/-- Section digest matched to its embedded bundle-header prefix; not original-binary identity. -/
def kirkMindSection : ArtifactEvidence :=
  { displayName := "KIRK_mind.txt"
    metadataTitle := none
    archivePathLabel := some "2026-10-31_BS_txt_0007.txt"
    kind := .mixedTranscriptWithoutRoleMetadata
    contentDigestComputed := true
    embeddedDigestMatched := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasMessageIdentifiers := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := false }

/-- Section digest matched to its embedded bundle-header prefix; not original-binary identity. -/
def readyRoomSection : ArtifactEvidence :=
  { displayName := "READY_ROOM.txt"
    metadataTitle := none
    archivePathLabel := some "2026-10-31_BS_txt_0007.txt"
    kind := .mixedTranscriptWithoutRoleMetadata
    contentDigestComputed := true
    embeddedDigestMatched := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasMessageIdentifiers := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := false }

/-- Standalone instruction-document section, labelled version 1.2.1. -/
def readmeV121 : ArtifactEvidence :=
  { displayName := "READY_ROOM_README.txt"
    metadataTitle := none
    archivePathLabel := some "2026-10-31_BS_txt_0007.txt"
    kind := .instructionDocument
    contentDigestComputed := true
    embeddedDigestMatched := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasMessageIdentifiers := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := true }

/-- Composite section containing a v1.3 guide; supersession is not authenticated. -/
def wholeReadyV13 : ArtifactEvidence :=
  { displayName := "THE_WHOLE_READY.txt"
    metadataTitle := none
    archivePathLabel := some "2026-10-31_BS_txt_0008.txt"
    kind := .compositeDocument
    contentDigestComputed := true
    embeddedDigestMatched := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasMessageIdentifiers := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := true }

/-- Library raw capture: title MARLOWE; archive path label is not its title. -/
def marloweRawExport : ArtifactEvidence :=
  { displayName := "MARLOWE — raw.json"
    metadataTitle := some "MARLOWE"
    archivePathLabel := some "26.09.14•26.09.22•Revival Rotation — raw (2).json"
    kind := .rawRoleTaggedConversation
    contentDigestComputed := true
    embeddedDigestMatched := false
    hasOuterRoleMetadata := true
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := true
    hasMessageIdentifiers := true
    hasTimestampMetadata := true
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := false }

theorem display_name_does_not_change_claim_eligibility
    (a : ArtifactEvidence) (newName : String) (claim : ClaimKind) :
    supports { a with displayName := newName } claim ↔ supports a claim := by
  rfl

theorem metadata_title_does_not_change_claim_eligibility
    (a : ArtifactEvidence) (newTitle : Option String) (claim : ClaimKind) :
    supports { a with metadataTitle := newTitle } claim ↔ supports a claim := by
  rfl

theorem archive_path_label_does_not_change_claim_eligibility
    (a : ArtifactEvidence) (newPath : Option String) (claim : ClaimKind) :
    supports { a with archivePathLabel := newPath } claim ↔ supports a claim := by
  rfl

theorem version_label_does_not_change_canonical_authority
    (a : ArtifactEvidence) (hasLabel : Bool) :
    supports { a with versionLabelPresent := hasLabel } .canonicalVersionAuthority ↔
      supports a .canonicalVersionAuthority := by
  rfl

theorem non_role_tagged_artifact_cannot_support_outer_role_attribution
    (a : ArtifactEvidence)
    (hKind : a.kind ≠ .rawRoleTaggedConversation) :
    ¬ supports a .outerRoleAttribution := by
  intro h
  exact hKind h.1

theorem canonical_version_requires_explicit_supersession
    (a : ArtifactEvidence)
    (hNoSupersession : a.hasExplicitSupersession = false) :
    ¬ supports a .canonicalVersionAuthority := by
  simp [supports, hNoSupersession]

theorem kirk_mind_section_not_role_attributed :
    ¬ supports kirkMindSection .outerRoleAttribution := by
  simp [supports, kirkMindSection]

theorem ready_room_section_not_role_attributed :
    ¬ supports readyRoomSection .outerRoleAttribution := by
  simp [supports, readyRoomSection]

theorem kirk_mind_section_not_author_attributed :
    ¬ supports kirkMindSection .authorAttribution := by
  simp [supports, kirkMindSection]

theorem ready_room_section_not_author_attributed :
    ¬ supports readyRoomSection .authorAttribution := by
  simp [supports, readyRoomSection]

theorem marlowe_export_supports_outer_role_attribution :
    supports marloweRawExport .outerRoleAttribution := by
  simp [supports, marloweRawExport]

theorem marlowe_export_supports_message_chronology :
    supports marloweRawExport .chronologyAttribution := by
  simp [supports, marloweRawExport]

theorem marlowe_export_does_not_authenticate_author_name :
    ¬ supports marloweRawExport .authorAttribution := by
  simp [supports, marloweRawExport]

theorem whole_ready_v13_not_canonical_version_authority :
    ¬ supports wholeReadyV13 .canonicalVersionAuthority := by
  simp [supports, wholeReadyV13]

theorem readme_v121_not_canonical_version_authority :
    ¬ supports readmeV121 .canonicalVersionAuthority := by
  simp [supports, readmeV121]

/-- Actual evaluation: raw role/timestamp evidence exists, but author-name evidence does not. -/
#eval decide (supports marloweRawExport .outerRoleAttribution)
#eval decide (supports marloweRawExport .chronologyAttribution)
#eval decide (supports marloweRawExport .authorAttribution)
#eval decide (supports kirkMindSection .bundleSectionIntegrity)
#eval decide (supports kirkMindSection .outerRoleAttribution)
#eval decide (supports readyRoomSection .outerRoleAttribution)
#eval decide (supports wholeReadyV13 .canonicalVersionAuthority)
#eval decide (supports readmeV121 .canonicalVersionAuthority)

#print axioms display_name_does_not_change_claim_eligibility
#print axioms metadata_title_does_not_change_claim_eligibility
#print axioms archive_path_label_does_not_change_claim_eligibility
#print axioms version_label_does_not_change_canonical_authority
#print axioms non_role_tagged_artifact_cannot_support_outer_role_attribution
#print axioms canonical_version_requires_explicit_supersession
#print axioms marlowe_export_supports_outer_role_attribution
#print axioms marlowe_export_supports_message_chronology
#print axioms marlowe_export_does_not_authenticate_author_name
#print axioms whole_ready_v13_not_canonical_version_authority

end HsHVerification.AriadneArtifactTypeGate
