import Mathlib

/-!
Loom source-typed current audit for the SAT4D / Blockwave document family.

Source scope (manual transcription; not a parser):
* SAT4D Live Draft, Git blob
  2a79fe25018cce7e99a2c33786d88b0551db6ae7; first archived in commit
  b543eb3fbf16e50500ceadad83dc9a7dc0759e5b (2025-10-27). Its document
  header claims June 2025.
* SAT4D clean draft, Git blob
  a7b59de14c100dfaf13c4b0a13e46baf3285d8a6 (same 2025-10-27 upload batch).
* SAT.4D Sketch, Git blob
  1644c03ad5d15a99c844d1b5b5e6e266bec92813 (first archived 2026-09-07;
  its document header claims June 2025).
* SAT4D Covariant Field Equations, Team-attributed, Git blob
  c2493431c743ab14e677aae0a18bce7fb32880da, first archived 2026-09-04;
  header claims June 2025.
* SAT4D Derivations Master, project-attributed, Git blob
  e2db11592040fd6962d3b7a9528e1386275eb830, first archived 2026-09-04;
  header claims June 2025.
* Nathan Direct raw message 496a15ea-0263-459d-b815-908f52155b90,
  2026-09-07T10:06:12.842Z, in raw conversation blob
  c49367b0faa424491e7b3520a034b9e44fe6897f. The phrase
  "something like an induction current connection" is qualitative and
  declares no tensor rank or equation.
* Blockwave raw conversation blob
  1f074cc67057ae9df1e92bab45e8ba34c96b0d77, assistant message
  121d607d-53e7-4b5a-8a7a-75d7e09deb3d, 2025-10-19T12:29:46.538Z.
  The two-form current is assistant-generated.

This module formalizes only manually transcribed index signatures and
source-namespace separation. It does not authenticate document authorship,
parse source strings, derive an electromagnetic current, prove a physical
equivalence, or validate any physical premise. The rank attached to the
filament-flux item is inferred from the document's J_mu notation only.
-/

namespace HsHVerification.LoomSAT4DCurrentTypeGate

inductive Variance where
  | up
  | down
  deriving BEq, DecidableEq, Repr

structure IndexSlot where
  label : String
  variance : Variance
  deriving BEq, DecidableEq, Repr

def validContraction (derivative field : IndexSlot) : Bool :=
  derivative.label == field.label && derivative.variance != field.variance

def sameFreeSignature (lhs rhs : List IndexSlot) : Bool :=
  lhs == rhs

def muDown : IndexSlot := ⟨"mu", .down⟩
def muUp : IndexSlot := ⟨"mu", .up⟩
def nuDown : IndexSlot := ⟨"nu", .down⟩
def nuUp : IndexSlot := ⟨"nu", .up⟩

/-- SAT.4D Sketch: ∂_mu F_{mu nu}; the repeated mu slots are both down. -/
def sketchDerivativeMu : IndexSlot := muDown
def sketchFieldStrengthMu : IndexSlot := muDown

/-- Live/Clean draft: ∂^mu F_{mu nu}; the mu slots are opposite. -/
def liveDerivativeMu : IndexSlot := muUp
def liveFieldStrengthMu : IndexSlot := muDown

/-- Free-index signatures after the mu contraction. -/
def liveLhsFree : List IndexSlot := [nuDown]
def scalarRhsFree : List IndexSlot := []
def covectorRhsFree : List IndexSlot := [nuDown]

/-- Standard contravariant-current form: ∂_mu F^{mu nu} = mu0 j^nu. -/
def standardVectorDerivativeMu : IndexSlot := muDown
def standardVectorFieldStrengthMu : IndexSlot := muUp
def standardVectorLhsFree : List IndexSlot := [nuUp]
def standardVectorRhsFree : List IndexSlot := [nuUp]

/-- Blockwave J^{mu nu} is a two-index antisymmetric current, not a 4-current. -/
def blockwaveCurrentFree : List IndexSlot := [muUp, nuUp]

/-- Provenance/type tags. Equal rank does not identify source or definition. -/
inductive CurrentNamespace where
  | satFilamentFluxAverage
  | satDiracBilinear
  | blockwaveWorldsheetTwoForm
  | nathanInductionPhrase
  deriving DecidableEq, Repr

def notationalRank : CurrentNamespace → Option Nat
  | .satFilamentFluxAverage => some 1
  | .satDiracBilinear => some 1
  | .blockwaveWorldsheetTwoForm => some 2
  | .nathanInductionPhrase => none

theorem sketch_flux_mu_contraction_invalid :
    validContraction sketchDerivativeMu sketchFieldStrengthMu = false := by
  decide

theorem live_flux_mu_contraction_valid :
    validContraction liveDerivativeMu liveFieldStrengthMu = true := by
  decide

theorem live_flux_rhs_scalar_misses_free_nu :
    sameFreeSignature liveLhsFree scalarRhsFree = false := by
  decide

theorem proposed_covector_rhs_matches_live_lhs :
    sameFreeSignature liveLhsFree covectorRhsFree = true := by
  decide

theorem standard_vector_current_form_is_index_consistent :
    validContraction standardVectorDerivativeMu standardVectorFieldStrengthMu = true ∧
    sameFreeSignature standardVectorLhsFree standardVectorRhsFree = true := by
  decide

theorem blockwave_twoform_signature_is_not_vector_signature :
    sameFreeSignature blockwaveCurrentFree standardVectorRhsFree = false := by
  decide

theorem flux_and_dirac_share_notational_rank_but_not_namespace :
    notationalRank .satFilamentFluxAverage = notationalRank .satDiracBilinear ∧
    CurrentNamespace.satFilamentFluxAverage ≠ CurrentNamespace.satDiracBilinear := by
  decide

theorem blockwave_current_has_rank_two :
    notationalRank .blockwaveWorldsheetTwoForm = some 2 := by
  decide

theorem induction_phrase_has_no_declared_rank :
    notationalRank .nathanInductionPhrase = none := by
  decide

#print axioms sketch_flux_mu_contraction_invalid
#print axioms live_flux_mu_contraction_valid
#print axioms live_flux_rhs_scalar_misses_free_nu
#print axioms proposed_covector_rhs_matches_live_lhs
#print axioms standard_vector_current_form_is_index_consistent
#print axioms blockwave_twoform_signature_is_not_vector_signature
#print axioms flux_and_dirac_share_notational_rank_but_not_namespace
#print axioms blockwave_current_has_rank_two
#print axioms induction_phrase_has_no_declared_rank


/-!
## Exact-phase field-strength consequence

Source: assistant message `121d607d-53e7-4b5a-8a7a-75d7e09deb3d`,
conversation `68f4d9b5-b908-832e-940e-6782db174a4a`,
2025-10-19T12:29:46.538Z, raw export blob
`1f074cc67057ae9df1e92bab45e8ba34c96b0d77`. The action defines
`A_μ = α_* ∇_μ θ` and `F_{μν}=∇_[μ A_{ν]}`.
The assistant's later review message
`68759291-9b8b-473f-81e4-08f563a15d0b` (2025-10-19T14:50:59.139Z)
explicitly notes that this exact-gradient choice gives zero local field
strength on a smooth patch.

The theorem below formalizes the standard exterior-calculus statement
`d(α dθ)=0) for a sufficiently smooth 0-form and constant `α`.
Translating the source's antisymmetrized covariant derivative into the
exterior derivative additionally requires a torsion-free connection.
This module does not prove that connection assumption, global smoothness,
defect structure, nontrivial holonomy, or physical applicability.
-/ 

theorem constant_smul_exact_phase_has_zero_field_strength
    {𝕜 E F : Type*}
    [NontriviallyNormedField 𝕜]
    [NormedAddCommGroup E] [NormedSpace 𝕜 E]
    [NormedAddCommGroup F] [NormedSpace 𝕜 F]
    {r : WithTop ℕ∞}
    (theta : E → E [⋀^Fin 0]→L[𝕜] F)
    (hTheta : ContDiff 𝕜 r theta)
    (hSmooth : minSmoothness 𝕜 2 ≤ r)
    (alpha : 𝕜) :
    extDeriv (alpha • extDeriv theta) = 0 := by
  ext x
  rw [extDeriv_smul]
  rw [extDeriv_extDeriv hTheta hSmooth]
  simp

#print axioms constant_smul_exact_phase_has_zero_field_strength

end HsHVerification.LoomSAT4DCurrentTypeGate
