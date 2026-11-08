import Mathlib

namespace HsHVerification.HumanAIMemoryCarryover

/-!
Source-grounded design context: Samadi et al., "TRAIL: A Platform for
Configurable Human-AI Teaming Experiments," arXiv:2607.12180v1 (2026-07-13).

The paper describes a configurable persona, short-term context plus reflective
long-term memory, persistent teams and stable participant/AI identities across
chained sessions. It does not specify whether reflective memory is carried
across session boundaries, reset, or cloned between conditions. The official
TRAIL site describes a separate ongoing five-session study with verbose versus
terse personas. Neither source establishes that persona and memory history are
actually aliased in a reported experiment.

This module proves a conditional design result for a saturated 2x2 mean model.
If only the diagonal persona/history cells are observed, the persona and history
main effects cannot be separated from their sum and interaction. If all four
cells are observed, the four coefficients are algebraically identifiable.
These are design-identifiability statements, not causal identification,
empirical results, or claims about TRAIL's unreported state semantics.
-/

/-- Saturated two-factor mean: persona, memory-history condition, and interaction. -/
def mean
    (intercept personaEffect historyEffect interactionEffect : ℝ)
    (persona history : Bool) : ℝ :=
  intercept
    + cond persona personaEffect 0
    + cond history historyEffect 0
    + cond (persona && history) interactionEffect 0

/--
With only the two diagonal cells, a nonzero shift from the persona coefficient
to the history coefficient preserves both observed means while changing the
coefficient triple. This is conditional non-identifiability, not a claim that
any particular study used only these cells.
-/
theorem diagonal_cells_alias_persona_and_history
    (α βPersona βHistory βInteraction δ : ℝ)
    (hδ : δ ≠ 0) :
    mean α βPersona βHistory βInteraction false false =
        mean α (βPersona + δ) (βHistory - δ) βInteraction false false ∧
    mean α βPersona βHistory βInteraction true true =
        mean α (βPersona + δ) (βHistory - δ) βInteraction true true ∧
    (βPersona, βHistory, βInteraction) ≠
        (βPersona + δ, βHistory - δ, βInteraction) := by
  constructor
  · simp [mean]
  constructor
  · simp [mean]
    ring
  · intro h
    have hPersona : βPersona = βPersona + δ := congrArg Prod.fst h
    have hZero : δ = 0 := by linarith
    exact hδ hZero

/--
In the saturated 2x2 model, equality of all four cell means forces equality
of the intercept, persona effect, history effect, and interaction effect.
This is algebraic parameter identifiability conditional on the model and
four-cell observation premises; it does not establish randomization or causality.
-/
theorem full_factorial_cells_identify_effects
    (α βPersona βHistory βInteraction
      α' βPersona' βHistory' βInteraction' : ℝ)
    (h00 : mean α βPersona βHistory βInteraction false false =
      mean α' βPersona' βHistory' βInteraction' false false)
    (h10 : mean α βPersona βHistory βInteraction true false =
      mean α' βPersona' βHistory' βInteraction' true false)
    (h01 : mean α βPersona βHistory βInteraction false true =
      mean α' βPersona' βHistory' βInteraction' false true)
    (h11 : mean α βPersona βHistory βInteraction true true =
      mean α' βPersona' βHistory' βInteraction' true true) :
    α = α' ∧
    βPersona = βPersona' ∧
    βHistory = βHistory' ∧
    βInteraction = βInteraction' := by
  have h00' : α = α' := by
    simpa [mean] using h00
  have h10' : α + βPersona = α' + βPersona' := by
    simpa [mean] using h10
  have h01' : α + βHistory = α' + βHistory' := by
    simpa [mean] using h01
  have h11' :
      α + βPersona + βHistory + βInteraction =
      α' + βPersona' + βHistory' + βInteraction' := by
    simpa [mean] using h11
  refine ⟨h00', ?_⟩
  refine ⟨?_, ?_⟩
  · linarith
  refine ⟨?_, ?_⟩
  · linarith
  · linarith

#print axioms diagonal_cells_alias_persona_and_history
#print axioms full_factorial_cells_identify_effects

end HsHVerification.HumanAIMemoryCarryover
