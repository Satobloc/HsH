import Mathlib

/-!
# Loom Compendium source-identity gate (2026-11-01)

Primary raw source:
- Conversation: "🪡 The Tourist Tailor [e-]"
- Conversation ID: 68cad3d4-0ccc-8325-be36-94c5b5527997
- Raw path: DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/25.09.17•26.06.01•🪡 The Tourist Tailor [e-] — raw.json
- Raw Git blob recorded in the existing source ledger: dd2b6141af86dea54e4ba2e782214128619ce78c
- Message: 9dc27aac-b34d-46db-8bb1-be603ba3fb73
- Outer role: user; timestamp: 2025-09-18T15:42:49.979981Z
- Independently recomputed raw message-text SHA-256: b35d770dc0ef53d851ca82f56b88709b9f943898113805cdd366fd1d56b5f7b2
- Prior Compendium blockquote SHA-256: 34a2387645523c57eb0e17f1b8018a7ad64decba7a6e5bb8bd80b3b2b215c0c6

Aster issue #1184 instead names the ASTER conversation
6ab006ce-e358-83ea-b3dd-7b23a26c00fa and reports digest
04ef80436f2a3897bed1cb8471a53ba7df7e42d58c4f08210a11373d624262f3.
The ASTER raw export was parsed independently: 1,817 messages; the target
message ID and exact source text are absent. The actual message is present
in The Tourist Tailor export (3,031 messages).

The previous Compendium blockquote is absent from the cited raw conversation
and its adjacent assistant message. Its origin remains unresolved.

This module formalizes only the encoded source-identity and digest gate.
The source membership, role, timestamps and SHA-256 values are external
observations/transcriptions. Lean does not authenticate the export, verify
the SHA-256 computation, establish authorship beyond the raw role field,
or prove any J3/J2 physical map.
-/

namespace HsHVerification.LoomCompendiumSourceBinding

inductive OuterRole where
  | user
  | assistant
  deriving DecidableEq, Repr

structure RawMessageWitness where
  conversationId : String
  messageId : String
  role : OuterRole
  createdAt : String
  textSha256 : String
  deriving DecidableEq, Repr

structure ExportMembership where
  conversationId : String
  messageId : String
  messageCount : Nat
  containsMessage : Bool
  deriving DecidableEq, Repr

structure QuoteWitness where
  conversationId : String
  messageId : String
  textSha256 : String
  markedVerbatim : Bool
  deriving DecidableEq, Repr

structure SourceLocatorWitness where
  conversationId : String
  messageId : String
  role : OuterRole
  reportedTextSha256 : String
  deriving DecidableEq, Repr

def rawMessage : RawMessageWitness :=
  { conversationId := "68cad3d4-0ccc-832e-b766-c267190aaffa"
    messageId := "9dc27aac-b34d-46db-8bb1-be603ba3fb73"
    role := .user
    createdAt := "2025-09-18T15:42:49.979981Z"
    textSha256 := "b35d770dc0ef53d851ca82f56b88709b9f943898113805cdd366fd1d56b5f7b2" }

def touristTailorExport : ExportMembership :=
  { conversationId := "68cad3d4-0ccc-832e-b766-c267190aaffa"
    messageId := "9dc27aac-b34d-46db-8bb1-be603ba3fb73"
    messageCount := 3031
    containsMessage := true }

def asterExport : ExportMembership :=
  { conversationId := "6ab006ce-e358-83ea-b3dd-7b23a26c00fa"
    messageId := "9dc27aac-b34d-46db-8bb1-be603ba3fb73"
    messageCount := 1817
    containsMessage := false }

def displacedCompendiumQuote : QuoteWitness :=
  { conversationId := ""
    messageId := "9dc27aac-b34d-46db-8bb1-be603ba3fb73"
    textSha256 := "34a2387645523c57eb0e17f1b8018a7ad64decba7a6e5bb8bd80b3b2b215c0c6"
    markedVerbatim := true }

def correctedCompendiumQuote : QuoteWitness :=
  { conversationId := "68cad3d4-0ccc-832e-b766-c267190aaffa"
    messageId := "9dc27aac-b34d-46db-8bb1-be603ba3fb73"
    textSha256 := "b35d770dc0ef53d851ca82f56b88709b9f943898113805cdd366fd1d56b5f7b2"
    markedVerbatim := true }

def asterIssueLocator : SourceLocatorWitness :=
  { conversationId := "6ab006ce-e358-83ea-b3dd-7b23a26c00fa"
    messageId := "9dc27aac-b34d-46db-8bb1-be603ba3fb73"
    role := .user
    reportedTextSha256 := "04ef80436f2a3897bed1cb8471a53ba7df7e42d58c4f08210a11373d624262f3" }

def correctedSourceLocator : SourceLocatorWitness :=
  { conversationId := "68cad3d4-0ccc-832e-b766-c267190aaffa"
    messageId := "9dc27aac-b34d-46db-8bb1-be603ba3fb73"
    role := .user
    reportedTextSha256 := "b35d770dc0ef53d851ca82f56b88709b9f943898113805cdd366fd1d56b5f7b2" }

/-- A verbatim Nathan quotation must bind conversation, message, outer role,
    and the exact UTF-8 text digest. -/
abbrev validVerbatimQuote (raw : RawMessageWitness) (quote : QuoteWitness) : Prop :=
  quote.conversationId = raw.conversationId ∧
  quote.messageId = raw.messageId ∧
  raw.role = .user ∧
  quote.textSha256 = raw.textSha256 ∧
  quote.markedVerbatim = true

/-- A source locator must identify the same conversation, message, role,
    and recomputed message-text digest. -/
abbrev validSourceLocator (raw : RawMessageWitness) (loc : SourceLocatorWitness) : Prop :=
  loc.conversationId = raw.conversationId ∧
  loc.messageId = raw.messageId ∧
  loc.role = raw.role ∧
  loc.reportedTextSha256 = raw.textSha256

/-- Make decidability of the source predicates explicit for decide and #eval.
    The predicates reduce to finite conjunctions of decidable String and
    OuterRole equalities plus a Boolean flag. -/
instance (raw : RawMessageWitness) (quote : QuoteWitness) :
    Decidable (validVerbatimQuote raw quote) := by
  unfold validVerbatimQuote
  infer_instance

instance (raw : RawMessageWitness) (loc : SourceLocatorWitness) :
    Decidable (validSourceLocator raw loc) := by
  unfold validSourceLocator
  infer_instance

theorem target_message_in_tourist_tailor_export :
    touristTailorExport.containsMessage = true ∧
    touristTailorExport.messageCount = 3031 := by
  decide

theorem target_message_absent_from_aster_export :
    asterExport.containsMessage = false ∧
    asterExport.messageCount = 1817 := by
  decide

theorem same_message_id_does_not_bind_export :
    asterIssueLocator.messageId = rawMessage.messageId ∧
    asterIssueLocator.conversationId ≠ rawMessage.conversationId := by
  decide

theorem displaced_compendium_quote_not_source_bound :
    ¬ validVerbatimQuote rawMessage displacedCompendiumQuote := by
  decide

theorem corrected_compendium_quote_is_source_bound :
    validVerbatimQuote rawMessage correctedCompendiumQuote := by
  decide

theorem aster_issue_locator_not_source_bound :
    ¬ validSourceLocator rawMessage asterIssueLocator := by
  decide

theorem corrected_source_locator_is_bound :
    validSourceLocator rawMessage correctedSourceLocator := by
  decide

theorem user_role_and_message_id_do_not_rescue_digest_mismatch :
    rawMessage.role = .user ∧
    displacedCompendiumQuote.messageId = rawMessage.messageId ∧
    displacedCompendiumQuote.textSha256 ≠ rawMessage.textSha256 := by
  decide

theorem aster_reported_digest_differs_from_raw :
    asterIssueLocator.reportedTextSha256 ≠ rawMessage.textSha256 := by
  decide

/-- A previous continuity transcription omitted one hexadecimal character
    from the Tag Conversation Corpus Git blob ID. -/
def malformedTagCorpusBlobSha : String :=
  "6668ca60e451f873790342372da7f9a430484e1"

/-- The current main tree entry and successful blob fetch give this 40-character ID. -/
def verifiedTagCorpusBlobSha : String :=
  "6668ca60e451f8737903423727da7f9a430484e1"

theorem prior_tag_corpus_blob_id_is_truncated :
    malformedTagCorpusBlobSha.length = 39 := by
  decide

theorem corrected_tag_corpus_blob_id_has_sha1_length :
    verifiedTagCorpusBlobSha.length = 40 := by
  decide

#eval decide (validVerbatimQuote rawMessage displacedCompendiumQuote)
#eval decide (validVerbatimQuote rawMessage correctedCompendiumQuote)
#eval decide (validSourceLocator rawMessage asterIssueLocator)
#eval decide (validSourceLocator rawMessage correctedSourceLocator)
#eval malformedTagCorpusBlobSha.length
#eval verifiedTagCorpusBlobSha.length

#print axioms target_message_in_tourist_tailor_export
#print axioms target_message_absent_from_aster_export
#print axioms same_message_id_does_not_bind_export
#print axioms displaced_compendium_quote_not_source_bound
#print axioms corrected_compendium_quote_is_source_bound
#print axioms aster_issue_locator_not_source_bound
#print axioms corrected_source_locator_is_bound
#print axioms user_role_and_message_id_do_not_rescue_digest_mismatch
#print axioms aster_reported_digest_differs_from_raw
#print axioms prior_tag_corpus_blob_id_is_truncated
#print axioms corrected_tag_corpus_blob_id_has_sha1_length

end HsHVerification.LoomCompendiumSourceBinding
