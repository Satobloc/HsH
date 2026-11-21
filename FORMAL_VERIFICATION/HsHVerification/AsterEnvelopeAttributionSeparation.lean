import Mathlib

/-!
# Aster: outer message role versus span-origin attribution

This companion module audits the source-span model introduced in
EnheduannaObservedSliceIdentifiability.lean.

The source export supplies an outer message role (for example, `user`).
A span inside that message can have a different origin (for example,
Nathan-authored framing versus an embedded assistant quotation). These are
different facts:

* `outerRole` is an observed message-envelope field;
* `origin` is a revisable attribution of a particular span.

The legacy shape placed `outerRole` inside the revisable attribution record.
The first theorem below shows that this permits a reclassification operation
to change the raw outer role while leaving the content key untouched.

The corrected shape stores `outerRole` beside the content key and keeps only
span-origin classification in `SourceAttribution`. Reclassification can then
change origin attribution without changing either the source content key or
the outer message role. A correction to the outer role is a distinct operation
and changes the claim key.

This is a type-level contract. It does not authenticate an export, verify
SHA-256 values, prove authorship, or establish the correctness of an origin
classification. No physical system or H(s)H model is instantiated.
-/

namespace HsHVerification.AsterEnvelopeAttributionSeparation

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

/-- Opaque, externally computed identifiers for one source-span occurrence. -/
structure SourceSpanContentKey where
  rawExportSha256 : String
  conversationId : String
  messageId : String
  bodySha256 : String
  startByte : Nat
  endByte : Nat
  offsetProfile : String
  spanSha256 : String
  deriving DecidableEq, Repr

/-! ## Regression model: the legacy attribution record -/

/-- Reproduces the field placement in the current Enheduanna PR #2293. -/
structure LegacySourceAttribution where
  outerRole : MessageRole
  origin : SourceOrigin
  classificationBasis : String
  deriving DecidableEq, Repr

structure LegacySourceSpanEvidence where
  content : SourceSpanContentKey
  attribution : LegacySourceAttribution
  deriving DecidableEq, Repr

namespace LegacySourceSpanEvidence

def reclassify (e : LegacySourceSpanEvidence)
    (a : LegacySourceAttribution) : LegacySourceSpanEvidence :=
  { e with attribution := a }

/--
The legacy reclassification operation can change the serialized outer message
role while preserving the content key. This is a structural counterexample
to treating the entire legacy attribution record as freely revisable.
-/
theorem reclassification_can_change_outer_role
    (e : LegacySourceSpanEvidence)
    (r : MessageRole)
    (hDifferent : e.attribution.outerRole ≠ r) :
    (e.reclassify { e.attribution with outerRole := r }).content = e.content ∧
    (e.reclassify { e.attribution with outerRole := r }).attribution.outerRole = r ∧
    (e.reclassify { e.attribution with outerRole := r }).attribution ≠ e.attribution := by
  constructor
  · rfl
  constructor
  · rfl
  · intro hEqual
    apply hDifferent
    exact (congrArg LegacySourceAttribution.outerRole hEqual).symm

end LegacySourceSpanEvidence

/-! ## Corrected model: envelope role and span attribution are separate -/

/-- Revisable span-origin interpretation; it does not contain the outer role. -/
structure SourceAttribution where
  origin : SourceOrigin
  classificationBasis : String
  deriving DecidableEq, Repr

/-- A claim key binds content, the observed envelope role, and span attribution. -/
structure SourceClaimKey where
  content : SourceSpanContentKey
  outerRole : MessageRole
  attribution : SourceAttribution
  deriving DecidableEq, Repr

/-- The raw envelope role is stored separately from revisable span attribution. -/
structure SourceSpanEvidence where
  content : SourceSpanContentKey
  outerRole : MessageRole
  attribution : SourceAttribution
  deriving DecidableEq, Repr

namespace SourceSpanEvidence

def claimKey (e : SourceSpanEvidence) : SourceClaimKey where
  content := e.content
  outerRole := e.outerRole
  attribution := e.attribution

/-- Reclassification changes only the span-origin attribution. -/
def reclassify (e : SourceSpanEvidence)
    (a : SourceAttribution) : SourceSpanEvidence :=
  { e with attribution := a }

/-- Correcting a raw envelope-role observation is not a reclassification. -/
def correctOuterRole (e : SourceSpanEvidence)
    (r : MessageRole) : SourceSpanEvidence :=
  { e with outerRole := r }

@[simp] theorem reclassify_preserves_content
    (e : SourceSpanEvidence) (a : SourceAttribution) :
    (e.reclassify a).content = e.content := by
  rfl

@[simp] theorem reclassify_preserves_outer_role
    (e : SourceSpanEvidence) (a : SourceAttribution) :
    (e.reclassify a).outerRole = e.outerRole := by
  rfl

theorem reclassify_changes_claim_key_of_attribution_change
    (e : SourceSpanEvidence) (a : SourceAttribution)
    (hDifferent : e.attribution ≠ a) :
    (e.reclassify a).claimKey ≠ e.claimKey := by
  intro hEqual
  apply hDifferent
  exact (congrArg SourceClaimKey.attribution hEqual).symm

@[simp] theorem correct_outer_role_preserves_content
    (e : SourceSpanEvidence) (r : MessageRole) :
    (e.correctOuterRole r).content = e.content := by
  rfl

@[simp] theorem correct_outer_role_preserves_attribution
    (e : SourceSpanEvidence) (r : MessageRole) :
    (e.correctOuterRole r).attribution = e.attribution := by
  rfl

theorem correct_outer_role_changes_claim_key_of_role_change
    (e : SourceSpanEvidence) (r : MessageRole)
    (hDifferent : e.outerRole ≠ r) :
    (e.correctOuterRole r).claimKey ≠ e.claimKey := by
  intro hEqual
  apply hDifferent
  exact (congrArg SourceClaimKey.outerRole hEqual).symm

end SourceSpanEvidence

/-- A source witness retains the raw envelope role outside its attribution. -/
structure SourceSpanWitness where
  content : SourceSpanContentKey
  outerRole : MessageRole
  origin : SourceOrigin
  classificationBasis : String
  deriving DecidableEq, Repr

namespace SourceSpanWitness

def attribution (w : SourceSpanWitness) : SourceAttribution where
  origin := w.origin
  classificationBasis := w.classificationBasis

def evidence (w : SourceSpanWitness) : SourceSpanEvidence where
  content := w.content
  outerRole := w.outerRole
  attribution := w.attribution

theorem evidence_preserves_outer_role (w : SourceSpanWitness) :
    w.evidence.outerRole = w.outerRole := by
  rfl

end SourceSpanWitness

end HsHVerification.AsterEnvelopeAttributionSeparation

/-! Theorem-specific dependency reports for exact-head CI inspection. -/
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.LegacySourceSpanEvidence.reclassification_can_change_outer_role
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.SourceSpanEvidence.reclassify_preserves_content
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.SourceSpanEvidence.reclassify_preserves_outer_role
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.SourceSpanEvidence.reclassify_changes_claim_key_of_attribution_change
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.SourceSpanEvidence.correct_outer_role_preserves_content
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.SourceSpanEvidence.correct_outer_role_preserves_attribution
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.SourceSpanEvidence.correct_outer_role_changes_claim_key_of_role_change
#print axioms HsHVerification.AsterEnvelopeAttributionSeparation.SourceSpanWitness.evidence_preserves_outer_role
