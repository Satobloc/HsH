import Mathlib

/-!
Ariadne artifact-type and claim-eligibility gate, 2026-11-01.

Source basis:
* The Library bundle 2026-10-31_BS_txt_0007 contains KIRK_mind.txt,
  READY_ROOM.txt, and READY_ROOM_README.txt as named text sections.
* 2026-10-31_BS_txt_0008 contains THE_WHOLE_READY.txt.
* A byte-preserving Python replay independently recomputed each section SHA-256
  after removing the three LF separator bytes used by the bundle format.
* KIRK_mind.txt and READY_ROOM.txt share one exact LF-normalized block of
  12,598 lines; the names do not make them independent witnesses.
* The KIRK_mind and READY_ROOM sections contain dialogue-like mixed text but
  no raw outer role metadata, message UUIDs, or authenticated conversation
  envelope. Their names do not establish that either is a standalone mind
  profile or a role-tagged conversation export.
* READY_ROOM_README is a standalone instruction-document section labelled
  v1.2.1. THE_WHOLE_READY is a composite section containing a v1.3 guide.
  The higher version label alone does not establish authenticated
  supersession or canonical authority.

The Bool fields below are explicit external audit inputs. Lean does not parse
the Library bundles, verify their hashes, authenticate source authorship, or
decide whether the human classification is correct. It checks only the
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
  | sectionIntegrity
  | outerRoleAttribution
  | speakerAttribution
  | authorAttribution
  | chronologyAttribution
  | canonicalVersionAuthority
  deriving DecidableEq, Repr

structure ArtifactEvidence where
  displayName : String
  kind : ArtifactKind
  sectionHashVerified : Bool
  hasOuterRoleMetadata : Bool
  hasExplicitSpeakerLabels : Bool
  hasConversationIdentity : Bool
  hasTimestampMetadata : Bool
  hasAuthenticatedAuthorIdentity : Bool
  hasExplicitSupersession : Bool
  hasProvenanceLink : Bool
  versionLabelPresent : Bool
  deriving Repr

/-- Claim eligibility is determined by evidence type and metadata, not filename. -/
def supports (a : ArtifactEvidence) (claim : ClaimKind) : Prop :=
  match claim with
  | .sectionIntegrity =>
      a.sectionHashVerified = true
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
      a.hasAuthenticatedAuthorIdentity = true
  | .chronologyAttribution =>
      a.kind = .rawRoleTaggedConversation ∧
      a.hasOuterRoleMetadata = true ∧
      a.hasConversationIdentity = true ∧
      a.hasTimestampMetadata = true
  | .canonicalVersionAuthority =>
      a.hasExplicitSupersession = true ∧
      a.hasProvenanceLink = true

/-- Bundle section identity is verified; this does not authenticate the original standalone file. -/
def kirkMindSection : ArtifactEvidence :=
  { displayName := "KIRK_mind.txt"
    kind := .mixedTranscriptWithoutRoleMetadata
    sectionHashVerified := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := false }

/-- Bundle section identity is verified; this does not authenticate the original standalone file. -/
def readyRoomSection : ArtifactEvidence :=
  { displayName := "READY_ROOM.txt"
    kind := .mixedTranscriptWithoutRoleMetadata
    sectionHashVerified := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := false }

/-- Standalone instruction-document section, labelled version 1.2.1. -/
def readmeV121 : ArtifactEvidence :=
  { displayName := "READY_ROOM_README.txt"
    kind := .instructionDocument
    sectionHashVerified := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := true }

/-- Composite document section containing a v1.3 guide; supersession is not authenticated. -/
def wholeReadyV13 : ArtifactEvidence :=
  { displayName := "THE_WHOLE_READY.txt"
    kind := .compositeDocument
    sectionHashVerified := true
    hasOuterRoleMetadata := false
    hasExplicitSpeakerLabels := false
    hasConversationIdentity := false
    hasTimestampMetadata := false
    hasAuthenticatedAuthorIdentity := false
    hasExplicitSupersession := false
    hasProvenanceLink := true
    versionLabelPresent := true }

theorem display_name_does_not_change_claim_eligibility
    (a : ArtifactEvidence) (newName : String) (claim : ClaimKind) :
    supports { a with displayName := newName } claim ↔ supports a claim := by
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

theorem whole_ready_v13_not_canonical_version_authority :
    ¬ supports wholeReadyV13 .canonicalVersionAuthority := by
  simp [supports, wholeReadyV13]

theorem readme_v121_not_canonical_version_authority :
    ¬ supports readmeV121 .canonicalVersionAuthority := by
  simp [supports, readmeV121]

/-- Actual evaluation: section hashes are attested, role attribution is not. -/
#eval decide (supports kirkMindSection .sectionIntegrity)
#eval decide (supports kirkMindSection .outerRoleAttribution)
#eval decide (supports readyRoomSection .outerRoleAttribution)
#eval decide (supports wholeReadyV13 .canonicalVersionAuthority)
#eval decide (supports readmeV121 .canonicalVersionAuthority)

#print axioms display_name_does_not_change_claim_eligibility
#print axioms version_label_does_not_change_canonical_authority
#print axioms non_role_tagged_artifact_cannot_support_outer_role_attribution
#print axioms canonical_version_requires_explicit_supersession
#print axioms kirk_mind_section_not_role_attributed
#print axioms ready_room_section_not_role_attributed
#print axioms whole_ready_v13_not_canonical_version_authority

end HsHVerification.AriadneArtifactTypeGate
