import Mathlib

/-!
Ariadne artifact-type and claim-eligibility gate, 2026-11-01.

Source basis:
* Library bundle 2026-10-31_BS_txt_0007 contains KIRK_mind.txt,
  READY_ROOM.txt, and READY_ROOM_README.txt as named text sections.
* Bundle 2026-10-31_BS_txt_0008 contains THE_WHOLE_READY.txt.
* Bundle 2026-10-31_BS_txt_0009 contains a separately delimited `TOS_S1.txt` script-corpus section. Its embedded SHA-256 prefix `b8258f1fb476f2fd` matches full digest `b8258f1fb476f2fdc5548a1d9abc182d108006157dbd9fb2bd15dc954fd4d087` after removing exactly the three trailing LF bundle-separator bytes; no leading LF is removed. Python `str.splitlines()` on that extracted section yields 14,945 lines. This is a structural count, not a completeness, author, or creation-date claim. Character-label-shaped line starts are script roles, not ChatGPT outer roles.
* A byte-preserving replay of the seven named sections in bundles 0007–0009
  (KIRK_mind, READY_ROOM, READY_ROOM_README, THE_WHOLE_READY,
  THE_WHOLE_READY2, THE_WHOLE_READY3, and TOS_S1) verifies six embedded
  16-hex SHA-256 prefixes after removing exactly three trailing LF
  bundle-separator bytes. `READY_ROOM_README.txt` is the exception: marker
  prefix `415dd87ab00d2e81` does not match the extracted section SHA-256
  `da0d034314393bf6009f76699fdd36155ca1d89faa53af2684a3c837e0b38d16`
  (8,868 bytes under that extraction rule). Keep its bundle integrity
  unverified; the mismatch may reflect a stale marker or transformed source
  text. The standalone original bytes were not located. Matching a
  bundle-section digest does not authenticate original storage history.
* KIRK_mind.txt and READY_ROOM.txt share one exact LF-normalized block of
  12,598 lines. Their names do not make them independent witnesses.
* KIRK_mind and READY_ROOM are mixed dialogue-like text sections without raw
  outer role metadata, message UUIDs, or authenticated conversation envelopes.
  Their names do not establish that either is a standalone mind profile.
* Both shared sections contain in-text character dialogue labels (six Kirk
  and nineteen Spock line starts in the normalized shared block). These are
  not ChatGPT outer user/assistant role labels.
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
  | scriptCorpus
  | mixedTranscriptWithoutRoleMetadata
  | instructionDocument
  | compositeDocument
  deriving DecidableEq, Repr

inductive ClaimKind where
  | contentDigestComputed
  | bundleSectionIntegrity
  | outerRoleAttribution
  | characterSpeakerAttribution
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
  hasCharacterDialogueLabels : Bool
  hasConversationIdentity : Bool
  hasMessageIdentifiers : Bool
  hasTimestampMetadata : Bool
  hasAuthenticatedAuthorIdentity : Bool
  hasExplicitSupersession : Bool
  hasProvenanceLink : Bool
  versionLabelPresent : Bool
  deriving Repr

/-- Claim eligibility is determined by artifact kind and the relevant evidence,
    not filename, archive path, conversation title, or version label. -/
def supports (a : ArtifactEvidence) (claim : ClaimKind) : Prop :=
  match claim with
  | .contentDigestComputed =>
      a.contentDigestComputed = true
  | .bundleSectionIntegrity =>
      a.contentDigestComputed = true ∧ a.embeddedDigestMatched = true
  | .outerRoleAttribution =>
      a.kind = .rawRoleTaggedConversation ∧
      a.hasOuterRoleMetadata = true
  | .characterSpeakerAttribution =>
      a.hasCharacterDialogueLabels = true
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

/-- Executable Boolean counterpart of the claim predicate above. This avoids
    asking Lean's evaluator to synthesize a Decidable instance for an opaque
    proposition; the theorem below proves the Bool implementation agrees with
    the proposition for every artifact and claim kind. -/
def supportsBool (a : ArtifactEvidence) (claim : ClaimKind) : Bool :=
  match claim with
  | .contentDigestComputed => a.contentDigestComputed
  | .bundleSectionIntegrity =>
      a.contentDigestComputed && a.embeddedDigestMatched
  | .outerRoleAttribution =>
      if a.kind = .rawRoleTaggedConversation then a.hasOuterRoleMetadata else false
  | .characterSpeakerAttribution => a.hasCharacterDialogueLabels
  | .authorAttribution =>
      if a.kind = .rawRoleTaggedConversation then
        a.hasOuterRoleMetadata && a.hasConversationIdentity &&
          a.hasMessageIdentifiers && a.hasAuthenticatedAuthorIdentity
      else false
  | .chronologyAttribution =>
      if a.kind = .rawRoleTaggedConversation then
        a.hasOuterRoleMetadata && a.hasConversationIdentity &&
          a.hasMessageIdentifiers && a.hasTimestampMetadata
      else false
  | .canonicalVersionAuthority =>
      a.hasExplicitSupersession && a.hasProvenanceLink

theorem supportsBool_correct (a : ArtifactEvidence) (claim : ClaimKind) :
    supports a claim ↔ supportsBool a claim = true := by
  cases claim <;> by_cases h : a.kind = .rawRoleTaggedConversation <;>
    simp [supports, supportsBool, h, and_assoc]

/-- Section digest matched to its embedded bundle-header prefix; not original-binary identity. -/
def kirkMindSection : ArtifactEvidence :=
  { displayName := "KIRK_mind.txt"
    metadataTitle := none
    archivePathLabel := some "2026-10-31_BS_txt_0007.txt"
    kind := .mixedTranscriptWithoutRoleMetadata
    contentDigestComputed := true
    embeddedDigestMatched := true
    hasOuterRoleMetadata := false
    hasCharacterDialogueLabels := true
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
    hasCharacterDialogueLabels := true
    hasConversationIdentity := false
    hasMessageIdentifiers := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := false }

/-- Standalone instruction-document section labelled 1.2.1; the embedded
    digest does not match the extracted section under the documented
    three-LF boundary rule, so bundle integrity is not attested. -/
def readmeV121 : ArtifactEvidence :=
  { displayName := "READY_ROOM_README.txt"
    metadataTitle := none
    archivePathLabel := some "2026-10-31_BS_txt_0007.txt"
    kind := .instructionDocument
    contentDigestComputed := true
    embeddedDigestMatched := false
    hasOuterRoleMetadata := false
    hasCharacterDialogueLabels := false
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
    hasCharacterDialogueLabels := false
    hasConversationIdentity := false
    hasMessageIdentifiers := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := true }

/-- Separately delimited script-corpus section. Digest and character labels are external audit inputs. -/
def tosSeasonOneScripts : ArtifactEvidence :=
  { displayName := "TOS_S1.txt"
    metadataTitle := none
    archivePathLabel := some "2026-10-31_BS_txt_0009.txt"
    kind := .scriptCorpus
    contentDigestComputed := true
    embeddedDigestMatched := true
    hasOuterRoleMetadata := false
    hasCharacterDialogueLabels := true
    hasConversationIdentity := false
    hasMessageIdentifiers := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := false }

/-- Library raw capture: title MARLOWE; archive path label is not its title. -/
def marloweRawExport : ArtifactEvidence :=
  { displayName := "MARLOWE — raw.json"
    metadataTitle := some "MARLOWE"
    archivePathLabel := some "26.09.14•26.09.22•Revival Rotation — raw (2).json"
    kind := .rawRoleTaggedConversation
    contentDigestComputed := true
    embeddedDigestMatched := false
    hasOuterRoleMetadata := true
    hasCharacterDialogueLabels := false
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

theorem kirk_mind_section_supports_character_speaker_attribution :
    supports kirkMindSection .characterSpeakerAttribution := by
  simp [supports, kirkMindSection]

theorem ready_room_section_supports_character_speaker_attribution :
    supports readyRoomSection .characterSpeakerAttribution := by
  simp [supports, readyRoomSection]

theorem kirk_mind_section_not_author_attributed :
    ¬ supports kirkMindSection .authorAttribution := by
  simp [supports, kirkMindSection]

theorem ready_room_section_not_author_attributed :
    ¬ supports readyRoomSection .authorAttribution := by
  simp [supports, readyRoomSection]

theorem tos_s1_script_section_supports_character_labels :
    supports tosSeasonOneScripts .characterSpeakerAttribution := by
  rfl

theorem tos_s1_script_section_supports_bundle_integrity :
    supports tosSeasonOneScripts .bundleSectionIntegrity := by
  constructor <;> rfl

theorem tos_s1_script_section_not_outer_role_attributed :
    ¬ supports tosSeasonOneScripts .outerRoleAttribution := by
  exact non_role_tagged_artifact_cannot_support_outer_role_attribution
    tosSeasonOneScripts (by decide)

theorem tos_s1_script_section_not_author_attributed :
    ¬ supports tosSeasonOneScripts .authorAttribution := by
  intro h
  have hKind : tosSeasonOneScripts.kind ≠ .rawRoleTaggedConversation := by decide
  exact hKind h.1

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

theorem readme_v121_bundle_integrity_not_verified :
    ¬ supports readmeV121 .bundleSectionIntegrity := by
  simp [supports, readmeV121]

/- Actual evaluation: character labels and outer conversation roles are distinct. -/
#eval supportsBool kirkMindSection .characterSpeakerAttribution
#eval supportsBool kirkMindSection .outerRoleAttribution
#eval supportsBool readyRoomSection .characterSpeakerAttribution
#eval supportsBool readyRoomSection .outerRoleAttribution
#eval supportsBool marloweRawExport .outerRoleAttribution
#eval supportsBool marloweRawExport .chronologyAttribution
#eval supportsBool marloweRawExport .authorAttribution
#eval supportsBool wholeReadyV13 .canonicalVersionAuthority
#eval supportsBool readmeV121 .bundleSectionIntegrity
#eval supportsBool tosSeasonOneScripts .characterSpeakerAttribution
#eval supportsBool tosSeasonOneScripts .bundleSectionIntegrity
#eval supportsBool tosSeasonOneScripts .outerRoleAttribution
#eval supportsBool tosSeasonOneScripts .authorAttribution

#print axioms supportsBool_correct
#print axioms display_name_does_not_change_claim_eligibility
#print axioms metadata_title_does_not_change_claim_eligibility
#print axioms archive_path_label_does_not_change_claim_eligibility
#print axioms version_label_does_not_change_canonical_authority
#print axioms non_role_tagged_artifact_cannot_support_outer_role_attribution
#print axioms canonical_version_requires_explicit_supersession
#print axioms kirk_mind_section_supports_character_speaker_attribution
#print axioms ready_room_section_supports_character_speaker_attribution
#print axioms marlowe_export_supports_outer_role_attribution
#print axioms marlowe_export_supports_message_chronology
#print axioms marlowe_export_does_not_authenticate_author_name
#print axioms whole_ready_v13_not_canonical_version_authority
#print axioms readme_v121_bundle_integrity_not_verified
#print axioms tos_s1_script_section_supports_character_labels
#print axioms tos_s1_script_section_supports_bundle_integrity
#print axioms tos_s1_script_section_not_outer_role_attributed
#print axioms tos_s1_script_section_not_author_attributed

end HsHVerification.AriadneArtifactTypeGate
