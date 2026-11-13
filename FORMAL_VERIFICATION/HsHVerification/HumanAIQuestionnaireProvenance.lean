import Mathlib

namespace HsHVerification.HumanAIQuestionnaireProvenance

/-!
Source transcription: Lin Chen, Ziyi Liu, Xia Hu, and Yong Li,
"AI agents reshape consensus formation in human groups", arXiv:2609.02122
(2026-09-02), especially Supplementary Information, "Participants",
"Post-experiment Questionnaire", and "Game Procedure".

Public processed data source:
tsinghua-fib-lab/human-ai-consensus at commit
74b79b65f221a01ba9c6744dc4f107741fcd8908.

Personalized CSV blobs:
A2 9ea458f5ba92fb0aedccfffbf497fb01a8f92ddf
A3 36330599372bd4ddabbb98b973326260e28e07ee
A4 29eb49d6143217d4101269446a0f79bf3cdbab4c
A5 7ffbd3e6c22093016163aee5280a018fc3f50e62

Common-question CSV blobs:
A2 70fc55bdcf6e127404e2666f0cf8a7dcddf91c80
A3 aa6e461f1ca4f0db00d42f631b2aa890ed095475
A4 ae2e945f85ec63713ea1860c3826c924b33d8158
A5 4d552df4650366912f922e8a278c9e879080b197

The public personalized CSV schema is:
round,you,peer,judged_ai,willingness.
The file identity is attached by the analysis code as exp_id / agent_ratio.
The public common-question CSV schema is:
agreement,ai_leadership.

The paper describes nine sampled interactions per human respondent and a
three-option partner-identity judgment (human / AI / not sure). The public
processed personalized CSV stores a binary judged_ai field. The public
analysis script reads this field as numeric and uses it as binary; the
raw-category-to-binary transformation is not specified in that script.

The public CSVs do not contain respondent IDs, session IDs, or a join key
between the common and personalized questionnaire sections. This module
therefore models those as optional, potentially recovered metadata and does
not invent values or a recoding function.

The count theorems below verify only arithmetic over transcribed public row
counts. The projection theorems are conditional information-loss results.
Neither proves the paper's causal interpretation, the existence of a particular
respondent collision, the validity of its standard errors, or any physical
claim.
-/

/-- The four public mixed-agent questionnaire files. -/
inductive QuestionnaireFile
  | A2
  | A3
  | A4
  | A5
  deriving DecidableEq, Repr

/-- Agent-ratio condition encoded by the public analysis script's file map. -/
inductive AgentRatio
  | pct12_5
  | pct33_3
  | pct50
  | pct75
  deriving DecidableEq, Repr

def ratioOfFile : QuestionnaireFile → AgentRatio
  | .A2 => .pct50
  | .A3 => .pct33_3
  | .A4 => .pct12_5
  | .A5 => .pct75

inductive ConsensusRegime
  | H1
  | H2
  | H3
  deriving DecidableEq, Repr

def regimeOfRatio : AgentRatio → ConsensusRegime
  | .pct12_5 => .H1
  | .pct33_3 => .H2
  | .pct50 => .H2
  | .pct75 => .H3

theorem A2_maps_to_H2 :
    regimeOfRatio (ratioOfFile .A2) = .H2 := rfl

theorem A3_maps_to_H2 :
    regimeOfRatio (ratioOfFile .A3) = .H2 := rfl

theorem A4_maps_to_H1 :
    regimeOfRatio (ratioOfFile .A4) = .H1 := rfl

theorem A5_maps_to_H3 :
    regimeOfRatio (ratioOfFile .A5) = .H3 := rfl

/-- Human counts reported for the four Study A mixed-agent conditions. -/
def reportedHumanRespondents : QuestionnaireFile → Nat
  | .A2 => 12
  | .A3 => 16
  | .A4 => 21
  | .A5 => 6

/-- Row counts independently read from the four common-question CSVs. -/
def commonQuestionnaireRows : QuestionnaireFile → Nat
  | .A2 => 12
  | .A3 => 16
  | .A4 => 21
  | .A5 => 6

/-- Row counts independently read from the four personalized-question CSVs. -/
def personalizedQuestionnaireRows : QuestionnaireFile → Nat
  | .A2 => 108
  | .A3 => 144
  | .A4 => 189
  | .A5 => 54

theorem common_rows_match_reported_human_counts :
    ∀ f, commonQuestionnaireRows f = reportedHumanRespondents f := by
  intro f
  cases f <;> rfl

/-- Each personalized file has nine rows per reported human respondent. -/
theorem personalized_rows_are_nine_per_reported_respondent :
    ∀ f, personalizedQuestionnaireRows f =
      9 * reportedHumanRespondents f := by
  intro f
  cases f <;> norm_num [personalizedQuestionnaireRows, reportedHumanRespondents]

theorem total_common_questionnaire_rows :
    commonQuestionnaireRows .A2 +
      commonQuestionnaireRows .A3 +
      commonQuestionnaireRows .A4 +
      commonQuestionnaireRows .A5 = 55 := by
  norm_num [commonQuestionnaireRows]

theorem total_personalized_questionnaire_rows :
    personalizedQuestionnaireRows .A2 +
      personalizedQuestionnaireRows .A3 +
      personalizedQuestionnaireRows .A4 +
      personalizedQuestionnaireRows .A5 = 495 := by
  norm_num [personalizedQuestionnaireRows]

theorem total_personalized_rows_are_nine_per_common_row :
    personalizedQuestionnaireRows .A2 +
      personalizedQuestionnaireRows .A3 +
      personalizedQuestionnaireRows .A4 +
      personalizedQuestionnaireRows .A5 =
    9 * (commonQuestionnaireRows .A2 +
      commonQuestionnaireRows .A3 +
      commonQuestionnaireRows .A4 +
      commonQuestionnaireRows .A5) := by
  norm_num [personalizedQuestionnaireRows, commonQuestionnaireRows]

/-- The original three-category partner-identity response described in the paper. -/
inductive PartnerJudgment
  | human
  | ai
  | unsure
  deriving DecidableEq, Repr

/--
A public processed personalized-question row.

roundIndex is zero-based (the CSV values are 0 through 39); adding one gives
the paper's one-based round number. rowIndex is an external source-location
locator, not a respondent identifier. file is attached from the CSV filename.
-/
structure PublicQuestionnaireRow where
  file : QuestionnaireFile
  rowIndex : Nat
  roundIndex : Fin 40
  you : String
  peer : String
  judgedAI : Bool
  willingness : {n : Nat // 1 ≤ n ∧ n ≤ 5}

/-- Convert the public CSV's zero-based round index to the paper's numbering. -/
def paperRoundNumber (r : PublicQuestionnaireRow) : Nat :=
  r.roundIndex.val + 1

/--
A provenance-complete target record. Optional fields make missing source
metadata explicit; they do not assert that the missing values were recovered.
-/
structure PotentiallyAugmentedQuestionnaireRecord where
  public : PublicQuestionnaireRow
  respondentId : Option Nat
  sessionId : Option Nat
  rawPartnerJudgment : Option PartnerJudgment

/-- The readout retained by the public processed CSV representation. -/
def publicProjection
    (r : PotentiallyAugmentedQuestionnaireRecord) : PublicQuestionnaireRow :=
  r.public

/--
Any deterministic statistic computed only from the public readout is constant
on every fiber of that readout. This is a direct congruence result.
-/
theorem public_statistic_constant_on_projection_fibers
    {α : Type*}
    (f : PublicQuestionnaireRow → α)
    {r₁ r₂ : PotentiallyAugmentedQuestionnaireRecord}
    (hPublic : publicProjection r₁ = publicProjection r₂) :
    f (publicProjection r₁) = f (publicProjection r₂) := by
  exact congrArg f hPublic

/--
Conditional non-recoverability of respondent identity: if two augmented
records have the same public row but different respondent IDs, no deterministic
function of the public row alone recovers both IDs.
This theorem does not assert that such a collision was observed in the CSVs.
-/
theorem respondent_id_not_recoverable_of_projection_collision
    {r₁ r₂ : PotentiallyAugmentedQuestionnaireRecord}
    (hPublic : publicProjection r₁ = publicProjection r₂)
    (hRespondent : r₁.respondentId ≠ r₂.respondentId) :
    ¬ ∃ recover : PublicQuestionnaireRow → Option Nat,
      ∀ r : PotentiallyAugmentedQuestionnaireRecord,
        recover (publicProjection r) = r.respondentId := by
  rintro ⟨recover, hrecover⟩
  apply hRespondent
  calc
    r₁.respondentId = recover (publicProjection r₁) :=
      (hrecover r₁).symm
    _ = recover (publicProjection r₂) :=
      congrArg recover hPublic
    _ = r₂.respondentId := hrecover r₂

/--
Conditional non-recoverability of session identity under the same projection
collision condition. This does not assert that the public files identify
session-level replication.
-/
theorem session_id_not_recoverable_of_projection_collision
    {r₁ r₂ : PotentiallyAugmentedQuestionnaireRecord}
    (hPublic : publicProjection r₁ = publicProjection r₂)
    (hSession : r₁.sessionId ≠ r₂.sessionId) :
    ¬ ∃ recover : PublicQuestionnaireRow → Option Nat,
      ∀ r : PotentiallyAugmentedQuestionnaireRecord,
        recover (publicProjection r) = r.sessionId := by
  rintro ⟨recover, hrecover⟩
  apply hSession
  calc
    r₁.sessionId = recover (publicProjection r₁) :=
      (hrecover r₁).symm
    _ = recover (publicProjection r₂) :=
      congrArg recover hPublic
    _ = r₂.sessionId := hrecover r₂

/--
Conditional non-recoverability of the original three-way judgment from the
public binary row. The source-to-binary recoding is intentionally not defined
because it is not specified in the public analysis script.
-/
theorem raw_partner_judgment_not_recoverable_of_projection_collision
    {r₁ r₂ : PotentiallyAugmentedQuestionnaireRecord}
    (hPublic : publicProjection r₁ = publicProjection r₂)
    (hRaw : r₁.rawPartnerJudgment ≠ r₂.rawPartnerJudgment) :
    ¬ ∃ recover : PublicQuestionnaireRow → Option PartnerJudgment,
      ∀ r : PotentiallyAugmentedQuestionnaireRecord,
        recover (publicProjection r) = r.rawPartnerJudgment := by
  rintro ⟨recover, hrecover⟩
  apply hRaw
  calc
    r₁.rawPartnerJudgment = recover (publicProjection r₁) :=
      (hrecover r₁).symm
    _ = recover (publicProjection r₂) :=
      congrArg recover hPublic
    _ = r₂.rawPartnerJudgment := hrecover r₂

#print axioms A2_maps_to_H2
#print axioms A3_maps_to_H2
#print axioms A4_maps_to_H1
#print axioms A5_maps_to_H3
#print axioms common_rows_match_reported_human_counts
#print axioms personalized_rows_are_nine_per_reported_respondent
#print axioms total_common_questionnaire_rows
#print axioms total_personalized_questionnaire_rows
#print axioms total_personalized_rows_are_nine_per_common_row
#print axioms public_statistic_constant_on_projection_fibers
#print axioms respondent_id_not_recoverable_of_projection_collision
#print axioms session_id_not_recoverable_of_projection_collision
#print axioms raw_partner_judgment_not_recoverable_of_projection_collision

end HsHVerification.HumanAIQuestionnaireProvenance
