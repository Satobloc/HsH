import Mathlib

/-!
# Sable P1 evidence-stage gate

Systems/production architecture for the Nov. 9 LLM-cognition methods paper.

Motivating source record:
* aayambansal/ConsistencyBench sample blob
  `10eb2da27c84c706d8e9e2325afca864fcae6a0d`;
* evaluator blob `0453540cb7c19227601e59fb342fa93e736da849`;
* Orson's 17-file fourth-position replay, published HsH blob
  `72b7d0731dcc1afb99c91e7b870fc7255da1daff`.

The source record distinguishes a stored checker flag, an extracted-label edit,
agreement with a published source key, an independently adjudicated semantic
judgment, and a causal intervention/counterfactual. This module formalizes
those as successive completion types and proves that each forgetting map loses
information.

Lean checks only the encoded type/projection statements. It does not establish
source authenticity, key adequacy, semantic truth, model cognition, experimental
randomization, or a causal effect.
-/

namespace HsHVerification.SableP1EvidenceStageGate

/-- What the archived pipeline directly records at the operational layer. -/
structure OperationalTrace where
  checkerFlag : Bool
  labelChanged : Bool
deriving DecidableEq

/-- Operational trace completed by comparison with a published source key. -/
structure KeyScoredTrace extends OperationalTrace where
  initialKeyCorrect : Bool
  finalKeyCorrect : Bool
deriving DecidableEq

/-- Key-scored trace completed by an independent semantic adjudication. -/
structure SemanticCompletion extends KeyScoredTrace where
  semanticContradiction : Bool
deriving DecidableEq

/-- Semantic record completed by intervention/counterfactual information. -/
structure CausalCompletion extends SemanticCompletion where
  interventionAssigned : Bool
  counterfactualLabelChanged : Bool
deriving DecidableEq

def forgetKey (x : KeyScoredTrace) : OperationalTrace :=
  x.toOperationalTrace

def forgetSemantic (x : SemanticCompletion) : KeyScoredTrace :=
  x.toKeyScoredTrace

def forgetCausal (x : CausalCompletion) : SemanticCompletion :=
  x.toSemanticCompletion

/-- Alarm/edit records cannot reconstruct source-key status. -/
theorem operational_projection_not_injective :
    ¬ Function.Injective forgetKey := by
  intro hinj
  let operational : OperationalTrace := ⟨true, false⟩
  let a : KeyScoredTrace :=
    { toOperationalTrace := operational
      initialKeyCorrect := true
      finalKeyCorrect := true }
  let b : KeyScoredTrace :=
    { toOperationalTrace := operational
      initialKeyCorrect := false
      finalKeyCorrect := true }
  have hab : a = b := hinj rfl
  have hbool : true = false :=
    congrArg KeyScoredTrace.initialKeyCorrect hab
  simp at hbool

/-- Source-key scores cannot reconstruct semantic contradiction status. -/
theorem key_projection_not_injective :
    ¬ Function.Injective forgetSemantic := by
  intro hinj
  let keyed : KeyScoredTrace :=
    { toOperationalTrace := ⟨true, false⟩
      initialKeyCorrect := true
      finalKeyCorrect := true }
  let a : SemanticCompletion :=
    { toKeyScoredTrace := keyed
      semanticContradiction := false }
  let b : SemanticCompletion :=
    { toKeyScoredTrace := keyed
      semanticContradiction := true }
  have hab : a = b := hinj rfl
  have hbool : false = true :=
    congrArg SemanticCompletion.semanticContradiction hab
  simp at hbool

/-- Semantic adjudication alone cannot reconstruct a counterfactual outcome. -/
theorem semantic_projection_not_injective :
    ¬ Function.Injective forgetCausal := by
  intro hinj
  let semantic : SemanticCompletion :=
    { toKeyScoredTrace :=
        { toOperationalTrace := ⟨true, true⟩
          initialKeyCorrect := true
          finalKeyCorrect := false }
      semanticContradiction := true }
  let a : CausalCompletion :=
    { toSemanticCompletion := semantic
      interventionAssigned := true
      counterfactualLabelChanged := false }
  let b : CausalCompletion :=
    { toSemanticCompletion := semantic
      interventionAssigned := true
      counterfactualLabelChanged := true }
  have hab : a = b := hinj rfl
  have hbool : false = true :=
    congrArg CausalCompletion.counterfactualLabelChanged hab
  simp at hbool

/-- Semantic status cannot be computed from key-scored fields for every
    possible semantic completion. -/
theorem semantic_status_does_not_factor_through_key :
    ¬ ∃ readout : KeyScoredTrace → Bool,
        ∀ x : SemanticCompletion,
          x.semanticContradiction = readout (forgetSemantic x) := by
  rintro ⟨readout, hreadout⟩
  let keyed : KeyScoredTrace :=
    { toOperationalTrace := ⟨true, false⟩
      initialKeyCorrect := true
      finalKeyCorrect := true }
  let a : SemanticCompletion :=
    { toKeyScoredTrace := keyed
      semanticContradiction := false }
  let b : SemanticCompletion :=
    { toKeyScoredTrace := keyed
      semanticContradiction := true }
  have ha := hreadout a
  have hb := hreadout b
  have hbool : false = true := ha.trans hb.symm
  simp at hbool

/-- Counterfactual label behavior cannot be computed from the semantic record
    for every possible causal completion. -/
theorem counterfactual_does_not_factor_through_semantic :
    ¬ ∃ readout : SemanticCompletion → Bool,
        ∀ x : CausalCompletion,
          x.counterfactualLabelChanged = readout (forgetCausal x) := by
  rintro ⟨readout, hreadout⟩
  let semantic : SemanticCompletion :=
    { toKeyScoredTrace :=
        { toOperationalTrace := ⟨true, true⟩
          initialKeyCorrect := true
          finalKeyCorrect := false }
      semanticContradiction := true }
  let a : CausalCompletion :=
    { toSemanticCompletion := semantic
      interventionAssigned := true
      counterfactualLabelChanged := false }
  let b : CausalCompletion :=
    { toSemanticCompletion := semantic
      interventionAssigned := true
      counterfactualLabelChanged := true }
  have ha := hreadout a
  have hb := hreadout b
  have hbool : false = true := ha.trans hb.symm
  simp at hbool

/-- The complete forgetting path is explicit rather than an analogy. -/
theorem full_projection_composes (x : CausalCompletion) :
    forgetKey (forgetSemantic (forgetCausal x)) =
      x.toSemanticCompletion.toKeyScoredTrace.toOperationalTrace := rfl

#print axioms operational_projection_not_injective
#print axioms key_projection_not_injective
#print axioms semantic_projection_not_injective
#print axioms semantic_status_does_not_factor_through_key
#print axioms counterfactual_does_not_factor_through_semantic
#print axioms full_projection_composes

end HsHVerification.SableP1EvidenceStageGate
