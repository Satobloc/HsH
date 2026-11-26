import Mathlib
import HsHVerification.FriedkinJohnsenSimplex

/-!
# Friedkin–Johnsen parameter identifiability boundaries

Source: Samira Abedini et al., "Don't Trust Stubborn Neighbors: A Security
Framework for Agentic Networks", arXiv:2603.15809v1 (16 March 2026), Eq. (1).

The source update is represented in the imported module as

  fjUpdate γ α prior current peer
    = γ * prior + (1 - γ) * α * current
      + (1 - γ) * (1 - α) * peer.

This module is an assistant reconstruction of exact algebraic consequences
of that source equation. It does not assert that the FJ model is a validated
model of any particular LLM system, and it does not establish H(s)H/SAT
physical claims.

The results are conditional, single-transition identifiability statements:
- α is identifiable from one noiseless transition only when γ ≠ 1 and
  current ≠ peer, assuming γ, prior, current, and peer are known;
- γ is identifiable from one noiseless transition only when prior differs
  from the α-weighted current/peer mixture, assuming the other inputs are
  known;
- in the degenerate cases, the update is exactly invariant to that parameter.

These are structural identifiability conditions, not finite-sample or
statistical-identifiability claims.
-/

namespace HsHVerification.FriedkinJohnsenIdentifiability

open HsHVerification.FriedkinJohnsenSimplex

/-- Exact change in one FJ update when only the self-retention parameter α changes. -/
theorem fjUpdate_alpha_difference
    (γ α₁ α₂ prior current peer : ℝ) :
    fjUpdate γ α₁ prior current peer - fjUpdate γ α₂ prior current peer
      = (1 - γ) * (α₁ - α₂) * (current - peer) := by
  unfold fjUpdate
  ring

/-- With γ and the two input beliefs known, α is injectively identifiable
    from a noiseless one-step output when γ ≠ 1 and current ≠ peer. -/
theorem fjUpdate_alpha_injective
    (γ prior current peer : ℝ)
    (hγ : γ ≠ 1)
    (hcurrent : current ≠ peer) :
    Function.Injective (fun α => fjUpdate γ α prior current peer) := by
  intro α₁ α₂ hEq
  have hprod :
      (1 - γ) * (α₁ - α₂) * (current - peer) = 0 := by
    calc
      (1 - γ) * (α₁ - α₂) * (current - peer)
          = fjUpdate γ α₁ prior current peer
              - fjUpdate γ α₂ prior current peer :=
                (fjUpdate_alpha_difference γ α₁ α₂ prior current peer).symm
      _ = 0 := sub_eq_zero.mpr hEq
  have hleft : (1 - γ) * (α₁ - α₂) = 0 :=
    (mul_eq_zero.mp hprod).resolve_right (sub_ne_zero.mpr hcurrent)
  have hα : α₁ - α₂ = 0 :=
    (mul_eq_zero.mp hleft).resolve_left
      (sub_ne_zero.mpr (Ne.symm hγ))
  exact sub_eq_zero.mp hα

/-- If the current and peer inputs coincide, α is completely unobservable
    in this one-step update. -/
theorem fjUpdate_alpha_invariant_when_peer_eq_current
    (γ α₁ α₂ prior current : ℝ) :
    fjUpdate γ α₁ prior current current
      = fjUpdate γ α₂ prior current current := by
  unfold fjUpdate
  ring

/-- If γ = 1, the update returns the prior and is independent of α. -/
theorem fjUpdate_alpha_invariant_when_gamma_eq_one
    (α₁ α₂ prior current peer : ℝ) :
    fjUpdate 1 α₁ prior current peer
      = fjUpdate 1 α₂ prior current peer := by
  unfold fjUpdate
  ring

/-- Exact change in one FJ update when only the stubbornness parameter γ changes. -/
theorem fjUpdate_gamma_difference
    (γ₁ γ₂ α prior current peer : ℝ) :
    fjUpdate γ₁ α prior current peer - fjUpdate γ₂ α prior current peer
      = (γ₁ - γ₂) * (prior - (α * current + (1 - α) * peer)) := by
  unfold fjUpdate
  ring

/-- With α and the input beliefs known, γ is injectively identifiable from
    a noiseless one-step output when the prior differs from the peer/self mixture. -/
theorem fjUpdate_gamma_injective
    (α prior current peer : ℝ)
    (hprior : prior ≠ α * current + (1 - α) * peer) :
    Function.Injective (fun γ => fjUpdate γ α prior current peer) := by
  intro γ₁ γ₂ hEq
  have hprod :
      (γ₁ - γ₂) * (prior - (α * current + (1 - α) * peer)) = 0 := by
    calc
      (γ₁ - γ₂) * (prior - (α * current + (1 - α) * peer))
          = fjUpdate γ₁ α prior current peer
              - fjUpdate γ₂ α prior current peer :=
                (fjUpdate_gamma_difference γ₁ γ₂ α prior current peer).symm
      _ = 0 := sub_eq_zero.mpr hEq
  have hγ : γ₁ - γ₂ = 0 :=
    (mul_eq_zero.mp hprod).resolve_right (sub_ne_zero.mpr hprior)
  exact sub_eq_zero.mp hγ

/-- If the prior equals the α-weighted current/peer mixture, γ is
    completely unobservable in this one-step update. -/
theorem fjUpdate_gamma_invariant_when_prior_eq_peer_mix
    (γ₁ γ₂ α current peer : ℝ) :
    fjUpdate γ₁ α (α * current + (1 - α) * peer) current peer
      = fjUpdate γ₂ α (α * current + (1 - α) * peer) current peer := by
  unfold fjUpdate
  ring

#print axioms fjUpdate_alpha_difference
#print axioms fjUpdate_alpha_injective
#print axioms fjUpdate_alpha_invariant_when_peer_eq_current
#print axioms fjUpdate_alpha_invariant_when_gamma_eq_one
#print axioms fjUpdate_gamma_difference
#print axioms fjUpdate_gamma_injective
#print axioms fjUpdate_gamma_invariant_when_prior_eq_peer_mix

end HsHVerification.FriedkinJohnsenIdentifiability
