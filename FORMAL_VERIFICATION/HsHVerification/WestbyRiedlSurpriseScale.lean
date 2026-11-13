import Mathlib

/-!
# Westby–Riedl (2023): scale sensitivity of the surprise-weighted update

Source: Matthew Westby and Martin Riedl, “Collective Intelligence in Human-AI Teams:
A Bayesian Theory of Mind Approach,” AAAI 37(5) (2023), 6119–6127,
doi:10.1609/aaai.v37i5.25755; arXiv:2208.11660v4.

Source equation (Eq. 1), represented componentwise:
  score(p, L) = p * L ^ (-log p)

This module proves a derived property of that equation: multiplying every
state-likelihood by the same positive constant c shifts pairwise log-odds by
(log q - log p) * log c. Thus the common likelihood scale generally does not
cancel when the two prior masses differ. The neutral likelihood baseline is
therefore a model calibration choice, not an arbitrary normalization.

Epistemic limits:
* This is a source-conditioned assistant reconstruction, not a theorem stated
  by the authors and not an empirical result.
* We formalize positive scalar prior masses and positive likelihood weights;
  zero-prior/zero-likelihood handling is outside the source formula's stated
  domain and is not supplied here.
* We do not formalize the full finite-state normalization, Eq. 2's
  multi-agent aggregation, Eq. 3's message argmin/tie handling, or the paper's
  empirical experiment. No dataset, numerical fixture, or physical premise
  is used.
* Lean checks only the formalized statement and its proof. It does not verify
  that this scalar model captures every implementation detail of the paper.
-/

namespace HsHVerification.WestbyRiedlSurpriseScale

/-- Eq. 1's unnormalized component score for positive prior mass p
and positive likelihood weight L. -/
noncomputable def surpriseScore (p L : ℝ) : ℝ :=
  p * Real.rpow L (-Real.log p)

/-- Log-coordinate form of the Eq. 1 score. -/
noncomputable def logSurpriseScore (p L : ℝ) : ℝ :=
  Real.log p + (-Real.log p) * Real.log L

/-- Pairwise log-odds of the unnormalized surprise-weighted scores.
A common posterior normalizer cancels from this difference. -/
noncomputable def logOdds (p q Lp Lq : ℝ) : ℝ :=
  logSurpriseScore p Lp - logSurpriseScore q Lq

lemma surpriseScore_pos {p L : ℝ} (hp : 0 < p) (hL : 0 < L) :
    0 < surpriseScore p L := by
  unfold surpriseScore
  exact mul_pos hp (Real.rpow_pos_of_pos hL _)

lemma logSurpriseScore_eq_log_score {p L : ℝ}
    (hp : 0 < p) (hL : 0 < L) :
    logSurpriseScore p L = Real.log (surpriseScore p L) := by
  unfold logSurpriseScore surpriseScore
  rw [Real.rpow_def_of_pos hL]
  rw [Real.log_mul (ne_of_gt hp) (ne_of_gt (Real.exp_pos _))]
  rw [Real.log_exp]
  ring

theorem logOdds_eq_log_ratio {p q Lp Lq : ℝ}
    (hp : 0 < p) (hq : 0 < q)
    (hLp : 0 < Lp) (hLq : 0 < Lq) :
    logOdds p q Lp Lq =
      Real.log (surpriseScore p Lp / surpriseScore q Lq) := by
  unfold logOdds
  rw [logSurpriseScore_eq_log_score hp hLp,
      logSurpriseScore_eq_log_score hq hLq]
  rw [← Real.log_div
    (ne_of_gt (surpriseScore_pos hp hLp))
    (ne_of_gt (surpriseScore_pos hq hLq))]

/-- Exact source-derived shift under a common positive rescaling of both
state-likelihood weights. -/
theorem common_likelihood_scale_shift {p q Lp Lq c : ℝ}
    (hp : 0 < p) (hq : 0 < q)
    (hLp : 0 < Lp) (hLq : 0 < Lq) (hc : 0 < c) :
    logOdds p q (c * Lp) (c * Lq) =
      logOdds p q Lp Lq + (Real.log q - Real.log p) * Real.log c := by
  unfold logOdds logSurpriseScore
  rw [Real.log_mul (ne_of_gt hc) (ne_of_gt hLp)]
  rw [Real.log_mul (ne_of_gt hc) (ne_of_gt hLq)]
  ring

/-- If the prior masses differ and the common likelihood scale differs from
one, the pairwise log-odds change. This is a calibration-sensitivity result,
not a claim that the source's chosen neutral baseline is wrong. -/
theorem common_scale_changes_log_odds {p q Lp Lq c : ℝ}
    (hp : 0 < p) (hq : 0 < q) (hpq : p ≠ q)
    (hLp : 0 < Lp) (hLq : 0 < Lq)
    (hc : 0 < c) (hc1 : c ≠ 1) :
    logOdds p q (c * Lp) (c * Lq) ≠ logOdds p q Lp Lq := by
  rw [common_likelihood_scale_shift hp hq hLp hLq hc]
  have hprior : Real.log q - Real.log p ≠ 0 := by
    intro h
    have hexp := congrArg Real.exp h
    have hqp : q = p := by
      simpa [Real.exp_log hq, Real.exp_log hp] using hexp
    exact hpq hqp.symm
  have hscale : Real.log c ≠ 0 := by
    intro h
    have hexp := congrArg Real.exp h
    have hc_eq : c = 1 := by
      simpa [Real.exp_log hc] using hexp
    exact hc1 hc_eq
  have hshift : (Real.log q - Real.log p) * Real.log c ≠ 0 :=
    mul_ne_zero hprior hscale
  intro heq
  have hzero : (Real.log q - Real.log p) * Real.log c = 0 := by
    linarith
  exact hshift hzero

/-- Equal prior masses are the exceptional case: the common scale shift
cancels from pairwise log-odds. -/
theorem equal_prior_scale_invariant {p Lp Lq c : ℝ}
    (hp : 0 < p) (hLp : 0 < Lp) (hLq : 0 < Lq) (hc : 0 < c) :
    logOdds p p (c * Lp) (c * Lq) = logOdds p p Lp Lq := by
  rw [common_likelihood_scale_shift hp hp hLp hLq hc]
  ring

#print axioms logSurpriseScore_eq_log_score
#print axioms logOdds_eq_log_ratio
#print axioms common_likelihood_scale_shift
#print axioms common_scale_changes_log_odds
#print axioms equal_prior_scale_invariant

end HsHVerification.WestbyRiedlSurpriseScale
