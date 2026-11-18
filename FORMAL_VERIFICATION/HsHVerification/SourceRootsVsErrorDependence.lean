import HsHVerification.CognitionSourceOverlap
import Mathlib

/-!
# Source-root disjointness is not statistical error independence

This finite countermodel separates two axes:

* provenance: the two evidence reports have disjoint source-root sets;
* outcome dependence: their error events are perfectly coupled by a shared
  latent failure bit.

The theorem is a logical counterexample to inferring error-independence from
source-root disjointness alone. It is not a model of any actual LLM, and the
uniform two-state sample space is illustrative rather than empirical.
-/

namespace HsHVerification.SourceRootsVsErrorDependence

inductive SourceRoot
  | alpha
  | beta
  deriving DecidableEq

def rootsA : Set SourceRoot := {SourceRoot.alpha}
def rootsB : Set SourceRoot := {SourceRoot.beta}

/-- The existing source-overlap predicate on evidence-root sets. -/
theorem source_roots_disjoint : ¬ SharesSource rootsA rootsB := by
  intro h
  rcases h with ⟨x, hxA, hxB⟩
  cases x with
  | alpha => simp [rootsA, rootsB] at hxB
  | beta => simp [rootsA, rootsB] at hxA

/-- A common latent failure bit is used by both otherwise distinct reports. -/
def errorA (ω : Bool) : Bool := ω
def errorB (ω : Bool) : Bool := ω

/-- Uniform probability on the two-point sample space Bool. -/
def probabilityOfError (e : Bool → Bool) : ℚ :=
  (((if e false then (1 : ℚ) else 0) +
    (if e true then 1 else 0)) / 2)

/-- Probability that both error events occur on the same sampled world. -/
def jointErrorProbability (eA eB : Bool → Bool) : ℚ :=
  (((if eA false && eB false then (1 : ℚ) else 0) +
    (if eA true && eB true then 1 else 0)) / 2)

theorem error_maps_identical : ∀ ω, errorA ω = errorB ω := by
  intro ω
  rfl

theorem errorA_probability : probabilityOfError errorA = 1 / 2 := by
  norm_num [probabilityOfError, errorA]

theorem errorB_probability : probabilityOfError errorB = 1 / 2 := by
  norm_num [probabilityOfError, errorB]

theorem joint_error_probability :
    jointErrorProbability errorA errorB = 1 / 2 := by
  norm_num [jointErrorProbability, errorA, errorB]

/-- For these two events, the independence factorization fails exactly. -/
theorem error_events_not_independent :
    jointErrorProbability errorA errorB ≠
      probabilityOfError errorA * probabilityOfError errorB := by
  norm_num [jointErrorProbability, probabilityOfError, errorA, errorB]

/--
Disjoint source roots can coexist with perfectly identical error maps and
non-independent error events. Source lineage and statistical dependence must
therefore be audited separately.
-/
theorem disjoint_roots_can_have_correlated_errors :
    ¬ SharesSource rootsA rootsB ∧
      (∀ ω, errorA ω = errorB ω) ∧
      jointErrorProbability errorA errorB ≠
        probabilityOfError errorA * probabilityOfError errorB := by
  exact ⟨source_roots_disjoint, error_maps_identical,
    error_events_not_independent⟩

#eval probabilityOfError errorA
#eval probabilityOfError errorB
#eval jointErrorProbability errorA errorB
#eval probabilityOfError errorA * probabilityOfError errorB

#print axioms disjoint_roots_can_have_correlated_errors

end HsHVerification.SourceRootsVsErrorDependence
