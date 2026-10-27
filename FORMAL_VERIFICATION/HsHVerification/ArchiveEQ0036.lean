import Mathlib

/-!
# ArchiveEQ0036 — Extra-structure observability gate

Historical source anchor:
Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt
blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc.

That source defines a centerline gamma and a centerline action while describing a
finite worldtube in prose.  The declarations below therefore treat thickness,
twist, framing, or contact data as an explicit extra type, not as content already
derived from the archived equations.

These theorems prove only an abstract factorization criterion for typed readouts.
They do not establish that the formalization is a faithful SAT/H(s)H translation,
that any physical channel depends on the extra data, or that a worldtube model is
empirically valid.
-/

namespace HsHVerification.ArchiveEQ0036

/-- A heterogeneous family of observable readouts, indexed by channel. -/
abbrev Readout (Channel : Type*) (Observable : Channel → Type*) :=
  (i : Channel) → Observable i

/-- All predictions can be computed from the base state alone. -/
def FactorsThroughBase
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable) : Prop :=
  ∃ basePredict : Base → Readout Channel Observable,
    ∀ b e, predict (b, e) = basePredict b

/-- Varying extra structure at fixed base state changes no channel readout. -/
def ExtraInvisible
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable) : Prop :=
  ∀ b e₁ e₂ i, predict (b, e₁) i = predict (b, e₂) i

theorem factorization_makes_extra_invisible
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (hfactor : FactorsThroughBase predict) :
    ExtraInvisible predict := by
  rcases hfactor with ⟨basePredict, hbase⟩
  intro b e₁ e₂ i
  rw [hbase b e₁, hbase b e₂]

/-- One fixed-base, one-channel witness blocks every base-only factorization. -/
theorem channel_witness_blocks_factorization
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    {b : Base} {e₁ e₂ : Extra} {i : Channel}
    (hchange : predict (b, e₁) i ≠ predict (b, e₂) i) :
    ¬ FactorsThroughBase predict := by
  intro hfactor
  exact hchange
    (factorization_makes_extra_invisible predict hfactor b e₁ e₂ i)

/-- A declared reference extra state is sufficient to construct a base-only
predictor when all extra states are observationally indistinguishable. -/
theorem invisibility_implies_factorization
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (e₀ : Extra) (hinvisible : ExtraInvisible predict) :
    FactorsThroughBase predict := by
  refine ⟨fun b => predict (b, e₀), ?_⟩
  intro b e
  funext i
  exact hinvisible b e e₀ i

/-- For an inhabited extra-state type, base factorization is equivalent to
pointwise invisibility of the extra state. -/
theorem factorization_iff_invisible
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (e₀ : Extra) :
    FactorsThroughBase predict ↔ ExtraInvisible predict := by
  constructor
  · exact factorization_makes_extra_invisible predict
  · exact invisibility_implies_factorization predict e₀

#print axioms factorization_makes_extra_invisible
#print axioms channel_witness_blocks_factorization
#print axioms invisibility_implies_factorization
#print axioms factorization_iff_invisible

end HsHVerification.ArchiveEQ0036
