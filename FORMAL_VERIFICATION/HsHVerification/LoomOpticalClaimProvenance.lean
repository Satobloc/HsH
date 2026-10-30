import Mathlib

/-!
# Loom optical-claim provenance graph, 2026-10-30

Source-first archive audit. This module encodes a small, manually audited
subgraph from two raw conversation exports. It proves only properties of
the encoded role/provenance/parent fields. It does not authenticate the
embedded document author, establish the optical claim, derive a phase shift,
or validate any physical model.

Primary conversation:
"0.239 Radians in Science", conversation UUID
699e4a02-26e4-832a-86ea-ad1dcaf3c4e3.
Full 812-node raw export:
DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.02.24•26.09.08•0.239 Radians in Science — raw (1).json
Git blob 8c87b92285f87ed3865fc1577a7a81b0661452b2.
Equivalent full export in SAT_CONVOS_13 has blob
8b6794a2be3e19b6bba32acfbbc4c6636b1b02e3. Their 812 message IDs,
roles, content and timestamps match. The 100-node SAT_CONVOS_7 export
(blob 67702fc58b0efce1d0f89d950b86a8819a189afb) is an exact prefix
by message ID/content/role/timestamp.

The first inspected raw turn carrying the 0.246-rad optical-phase passage
is user message 15338421-a5e7-4538-879a-d25d840d2bdd at
2026-02-25T01:12:37.975Z. Its outer role is user. The internal authorship
of the submitted "Page One: SAT - Ontology and Unified Action" document
is not established by the raw envelope, so it is tagged
unresolvedEmbeddedDocument, not reassigned to assistant or a third party.

Assistant message c2f22ca2-e462-407b-b930-a70cde34f670 at
2026-02-25T01:12:38.187Z is its direct child and claims the 0.246-rad
phase shift comes from Z3 scalar misalignment and 4D projection, without
a derivation in that response.

Nathan-direct user message 8690f979-d3f3-4e67-807b-90d34b2f0cc9 at
2026-02-25T01:23:20.560Z asks whether the described results follow
"without squinting and shoehorning". Assistant message
be9d54f6-0da9-496a-a764-21558b33c7bf is its direct child and retracts
the earlier automatic-derivation claims, explicitly saying optical
Delta-phi requires an extra mapping to real physics.

Further Nathan-direct turns:
- 980c80a0-fd6d-44cb-9f24-7498dfdad1b0, 2026-02-25T01:26:06.369Z:
  requests a rigorous fact check and reality check.
- 8db86dc4-5a37-4672-885e-f81354ed7a26, 2026-02-25T01:27:17.742Z:
  "We don't know what's a coincidence and what's not until we do the math".
- 4dbcbf32-ed4d-4b4f-83af-768c975be39c, 2026-02-25T01:30:08.903Z:
  proposes, conditionally, to assume local curvature of the time-wavefront
  hypersphere as a candidate source. This is a hypothesis, not a derivation.
- 77fd1295-39da-4064-a668-8f1a19c7f4cf, 2026-02-25T01:06:37.925Z:
  states the 0.239-rad candidate is an artifact of projecting 4-space
  down to 3-space. This is a direct interpretation, not a proof.

The later "Ok, what about 14.1" user question
b8cc4592-3a32-4893-9857-21f2b1e28e4b at 2026-09-08T07:03:06.791Z
is followed by assistant continuation nodes and assistant message
15ddd967-5143-4a9e-bcf3-aec8f7e736f5. That assistant message calls
14.1 degrees an existing 0.246-rad SAT target. The user question itself
does not assert that target. This later target expansion is assistant-authored.

Second conversation:
"Scaling Postulates Testing", conversation UUID
69a49445-e3b4-8333-8dce-6713108a6e2d.
A-grade raw export blob a2d72dd38d9bc671f5b81f20d965407cc8ac72ca;
SAT_CONVOS_17 blob 32c49e7bf4818fe9798bb7372b64fd5768c1b440;
SAT_CONVOS_18 and SAT_CONVOS_21 both use blob
0fb8ea34f86260d52deabc984b71c56b415e96c2.
All four contain the same 155 message IDs, roles, content and timestamps.
The user-role optical-test passage is message
9060d0da-daca-4a76-8903-9d3f94541c9a at 2026-03-01T19:34:20.335Z.
Its direct assistant child is
4d4f999a-fb1b-439e-a6ed-a3b0db0e6f3f. The assistant's 25-nm
conversion is a model calculation from the supplied premise, not a
measurement or a cited interferometry survey.

The first-person "This keeps coming up..." objection also occurs in
standalone compiled text files 4DHHUC-DISCUSSION.txt and SAT RADIAN LEAP.txt.
Neither file carries a raw message UUID or role metadata for that passage.
It remains transcript-only / speaker-unverified here.
-/

namespace HsHVerification.LoomOpticalClaimProvenance

inductive OuterRole where
  | user
  | assistant
  deriving DecidableEq, Repr

inductive Provenance where
  | directNathanTurn
  | unresolvedEmbeddedDocument
  | assistantGenerated
  deriving DecidableEq, Repr

inductive ClaimKind where
  | submittedDocument
  | directInterpretation
  | directChallenge
  | methodDirective
  | hypothesis
  | assistantInterpretation
  | assistantCorrection
  | assistantContinuation
  | assistantTargetReframing
  | assistantUnitConversion
  deriving DecidableEq, Repr

structure Turn where
  id : String
  role : OuterRole
  provenance : Provenance
  kind : ClaimKind
  parentId : String
  deriving DecidableEq, Repr

def userSuppliedOpticalPage : Turn :=
  ⟨"15338421-a5e7-4538-879a-d25d840d2bdd",
    .user, .unresolvedEmbeddedDocument, .submittedDocument,
    "26a26c3e-f33a-46b4-a450-6b73c2d47bb3"⟩

def assistantZ3Interpretation : Turn :=
  ⟨"c2f22ca2-e462-407b-b930-a70cde34f670",
    .assistant, .assistantGenerated, .assistantInterpretation,
    "15338421-a5e7-4538-879a-d25d840d2bdd"⟩

def nathanDirectChallenge : Turn :=
  ⟨"8690f979-d3f3-4e67-807b-90d34b2f0cc9",
    .user, .directNathanTurn, .directChallenge,
    "3b75f99e-2415-4c73-8dfc-b017b9198131"⟩

def assistantCorrection : Turn :=
  ⟨"be9d54f6-0da9-496a-a764-21558b33c7bf",
    .assistant, .assistantGenerated, .assistantCorrection,
    "8690f979-d3f3-4e67-807b-90d34b2f0cc9"⟩

def nathanFactRealityCheck : Turn :=
  ⟨"980c80a0-fd6d-44cb-9f24-7498dfdad1b0",
    .user, .directNathanTurn, .methodDirective,
    "be9d54f6-0da9-496a-a764-21558b33c7bf"⟩

def nathanCoincidenceRule : Turn :=
  ⟨"8db86dc4-5a37-4672-885e-f81354ed7a26",
    .user, .directNathanTurn, .methodDirective,
    "f0b1a4ff-7149-4e85-b688-15decb3f6e6c"⟩

def nathanCurvatureHypothesis : Turn :=
  ⟨"4dbcbf32-ed4d-4b4f-83af-768c975be39c",
    .user, .directNathanTurn, .hypothesis,
    "786f871e-7756-4ba2-83d1-038e5559c42c"⟩

def nathanProjectionInterpretation : Turn :=
  ⟨"77fd1295-39da-4064-a668-8f1a19c7f4cf",
    .user, .directNathanTurn, .directInterpretation,
    "02807951-98ea-429d-9cf0-6629b3ad8a9f"⟩

def nathanQuestion141 : Turn :=
  ⟨"b8cc4592-3a32-4893-9857-21f2b1e28e4b",
    .user, .directNathanTurn, .methodDirective,
    "9d017c80-44e0-45b2-af66-f31d452be3b9"⟩

def assistant141Hop1 : Turn :=
  ⟨"394ad346-5f2b-43dd-acc3-02754f8e2df4",
    .assistant, .assistantGenerated, .assistantContinuation,
    "b8cc4592-3a32-4893-9857-21f2b1e28e4b"⟩

def assistant141Hop2 : Turn :=
  ⟨"c86623d3-559c-47bd-8d2f-24df1c663396",
    .assistant, .assistantGenerated, .assistantContinuation,
    "394ad346-5f2b-43dd-acc3-02754f8e2df4"⟩

def assistant141Reframing : Turn :=
  ⟨"15ddd967-5143-4a9e-bcf3-aec8f7e736f5",
    .assistant, .assistantGenerated, .assistantTargetReframing,
    "c86623d3-559c-47bd-8d2f-24df1c663396"⟩

def marchUserSuppliedOpticalTest : Turn :=
  ⟨"9060d0da-daca-4a76-8903-9d3f94541c9a",
    .user, .unresolvedEmbeddedDocument, .submittedDocument,
    "1b98e195-71fa-49b0-a7c5-23638749bcda"⟩

def marchAssistantConversion : Turn :=
  ⟨"4d4f999a-fb1b-439e-a6ed-a3b0db0e6f3f",
    .assistant, .assistantGenerated, .assistantUnitConversion,
    "9060d0da-daca-4a76-8903-9d3f94541c9a"⟩

def parentOf (child parent : Turn) : Bool :=
  child.parentId == parent.id

theorem same_outer_user_role_different_embedded_provenance :
    userSuppliedOpticalPage.role = nathanDirectChallenge.role ∧
    userSuppliedOpticalPage.provenance ≠ nathanDirectChallenge.provenance := by
  decide

theorem assistant_z3_interpretation_is_direct_child_of_submitted_page :
    parentOf assistantZ3Interpretation userSuppliedOpticalPage = true := by
  decide

theorem assistant_correction_is_direct_child_of_nathan_challenge :
    parentOf assistantCorrection nathanDirectChallenge = true := by
  decide

theorem fact_reality_request_follows_assistant_correction :
    parentOf nathanFactRealityCheck assistantCorrection = true := by
  decide

theorem march_assistant_conversion_is_direct_child_of_submitted_test :
    parentOf marchAssistantConversion marchUserSuppliedOpticalTest = true := by
  decide

theorem 141_target_reframing_is_an_assistant_only_chain :
    parentOf assistant141Hop1 nathanQuestion141 = true ∧
    parentOf assistant141Hop2 assistant141Hop1 = true ∧
    parentOf assistant141Reframing assistant141Hop2 = true ∧
    assistant141Reframing.role = OuterRole.assistant := by
  decide

theorem local_curvature_statement_is_a_direct_hypothesis :
    nathanCurvatureHypothesis.provenance = Provenance.directNathanTurn ∧
    nathanCurvatureHypothesis.kind = ClaimKind.hypothesis := by
  decide

theorem projection_statement_is_direct_interpretation_not_formal_proof :
    nathanProjectionInterpretation.provenance = Provenance.directNathanTurn ∧
    nathanProjectionInterpretation.kind = ClaimKind.directInterpretation := by
  decide

#print axioms same_outer_user_role_different_embedded_provenance
#print axioms assistant_z3_interpretation_is_direct_child_of_submitted_page
#print axioms assistant_correction_is_direct_child_of_nathan_challenge
#print axioms fact_reality_request_follows_assistant_correction
#print axioms march_assistant_conversion_is_direct_child_of_submitted_test
#print axioms 141_target_reframing_is_an_assistant_only_chain
#print axioms local_curvature_statement_is_a_direct_hypothesis
#print axioms projection_statement_is_direct_interpretation_not_formal_proof

end HsHVerification.LoomOpticalClaimProvenance
