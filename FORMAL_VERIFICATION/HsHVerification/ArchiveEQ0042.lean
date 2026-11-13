import Mathlib

/-!
# Archive EQ0042 — layered-source entailment gate

Ariadne source-stratigraphic reconstruction, 2026-10-27.

Mersearch-first routing:
* `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`
  blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, generated
  2026-10-07, records 3,987 files / 6,597,201 records / 224 hits.

Historical SAT-O equation layer:
* `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`
  blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`; internal date/authorship
  unresolved.  It defines a centerline `gamma : R -> R^(3,1)`, gives a
  hyperhelix `gamma^mu(lambda)`, tangent `v^mu = d gamma^mu / d lambda`,
  and an action `S[gamma]`.  The same source also calls the worldtube the
  four-dimensional volume swept out by the vibrating filament.

Later Nathan-direct source layer:
* `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/
  H(SAT)H - init/H(s)H 2026 STARTUP DOCS.txt`
  blob `68200d849152dcb0c4fc1814f8b1789d499ebca8`, archived in the
  30 September 2026 dump.  At character offset 18076 the user states that
  thickness, bending, and interaction had already been modeled, while the
  accessible cross-sectional geometry may be only thickness and interaction
  properties.  The internal “Today 4:09 AM” timestamp is not independently
  resolved.

The formal result below is deliberately source-agnostic.  It proves that an
equation-only countermodel refutes entailment from the equation layer, but
cannot refute entailment from the intersection of equation and additional
source constraints unless it also satisfies those additional constraints.
It does not decide which prose is mathematically adequate, which source layer
controls, or whether finite thickness is physically true.
-/

namespace HsHVerification.ArchiveEQ0042

/-- Every model admitted by a source layer satisfies the stated claim. -/
def Entails {Model : Type*}
    (admissible claim : Model → Prop) : Prop :=
  ∀ model, admissible model → claim model

/-- Models admitted simultaneously by two source layers. -/
def Combined {Model : Type*}
    (first second : Model → Prop) : Model → Prop :=
  fun model => first model ∧ second model

/-- Adding a source constraint can only shrink the admissible model class, so
an entailment already valid in the first layer remains valid after conjunction. -/
theorem entailment_monotone_under_added_source
    {Model : Type*}
    (equationLayer sourceLayer claim : Model → Prop)
    (hentails : Entails equationLayer claim) :
    Entails (Combined equationLayer sourceLayer) claim := by
  intro model hadmissible
  exact hentails model hadmissible.1

/-- A model satisfying the equation layer while violating the claim is a valid
countermodel to equation-layer entailment. -/
theorem equation_countermodel_refutes_equation_entailment
    {Model : Type*}
    (equationLayer claim : Model → Prop)
    (model : Model)
    (hequation : equationLayer model)
    (hnotClaim : ¬ claim model) :
    ¬ Entails equationLayer claim := by
  intro hentails
  exact hnotClaim (hentails model hequation)

/-- If the combined source stack entails a claim but an equation-admissible
model violates it, that model must fail the additional source constraint.
It is not a countermodel to the combined stack. -/
theorem equation_countermodel_excluded_by_combined_entailment
    {Model : Type*}
    (equationLayer sourceLayer claim : Model → Prop)
    (model : Model)
    (hcombined : Entails (Combined equationLayer sourceLayer) claim)
    (hequation : equationLayer model)
    (hnotClaim : ¬ claim model) :
    ¬ sourceLayer model := by
  intro hsource
  exact hnotClaim (hcombined model ⟨hequation, hsource⟩)

/-- To refute entailment from the full two-layer source stack, the witness must
satisfy both layers and violate the claim. -/
theorem combined_countermodel_refutes_combined_entailment
    {Model : Type*}
    (equationLayer sourceLayer claim : Model → Prop)
    (model : Model)
    (hequation : equationLayer model)
    (hsource : sourceLayer model)
    (hnotClaim : ¬ claim model) :
    ¬ Entails (Combined equationLayer sourceLayer) claim := by
  intro hentails
  exact hnotClaim (hentails model ⟨hequation, hsource⟩)

#print axioms entailment_monotone_under_added_source
#print axioms equation_countermodel_refutes_equation_entailment
#print axioms equation_countermodel_excluded_by_combined_entailment
#print axioms combined_countermodel_refutes_combined_entailment

end HsHVerification.ArchiveEQ0042
