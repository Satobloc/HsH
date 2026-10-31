import Mathlib

/-!
Nadir Voss sandbox: conditional two-phase GP-B SQUID readout identifiability.

Standard-source basis:
C. W. F. Everitt et al., "Gravity Probe B: Final Results of a Space
Experiment to Test General Relativity", Phys. Rev. Lett. 106, 221101
(2011), DOI 10.1103/PhysRevLett.106.221101, measurement model Eq. (2).

The published model is
  z(t) = C_g(t) * [mu_NS(t) * cos(phi_r(t) + delta_phi)
                   + mu_WE(t) * sin(phi_r(t) + delta_phi)]
         + bias + noise,
where mu = tau - s.

This module isolates a conditional two-sample algebraic readout:
- the projected pair (mu_NS, mu_WE) is frozen across the two samples;
- both scale factors are known and nonzero;
- both roll phases are known;
- bias and noise have already been removed.

Under those assumptions, two phase samples identify the two projected
components exactly iff sin(alpha2 - alpha1) is nonzero. A single phase
sample is not injective. This is a local observability result, not a
reconstruction of the full GP-B time-varying estimator, not a 3D rotor
orientation reconstruction, not an SO(4) lift, and not an H(s)H law.

No Nathan Direct GP-B/worldtube readout equation was recovered. This is
a standard-reference formalization and assistant reconstruction only.
-/

namespace HsHVerification.NadirGPBPhaseReadout

/-- Bias-subtracted, noiseless one-sample projection from Eq. (2). -/
def onePhaseReadout (cg alpha : ℝ) (mu : ℝ × ℝ) : ℝ :=
  cg * (mu.1 * Real.cos alpha + mu.2 * Real.sin alpha)

/-- Two samples with known scale factors and roll phases. -/
def twoPhaseReadout (cg1 cg2 alpha1 alpha2 : ℝ)
    (mu : ℝ × ℝ) : ℝ × ℝ :=
  (onePhaseReadout cg1 alpha1 mu, onePhaseReadout cg2 alpha2 mu)

/-- At phase zero, one scalar sample cannot identify the second component. -/
theorem one_sample_phase_zero_not_injective :
    ¬ Function.Injective (onePhaseReadout 1 0) := by
  intro hinj
  have hread :
      onePhaseReadout 1 0 (0, 0) =
        onePhaseReadout 1 0 (0, 1) := by
    simp [onePhaseReadout, Real.cos_zero, Real.sin_zero]
  have hpair : ((0 : ℝ), 0) = ((0 : ℝ), 1) := hinj hread
  have hfalse : (0 : ℝ) = 1 := congrArg Prod.snd hpair
  norm_num at hfalse

/-- The 2x2 readout determinant is the sine of the phase separation. -/
theorem determinant_eq_sin_phase_difference (alpha1 alpha2 : ℝ) :
    Real.cos alpha1 * Real.sin alpha2 -
      Real.sin alpha1 * Real.cos alpha2 =
        Real.sin (alpha2 - alpha1) := by
  rw [Real.sin_sub]
  ring

/-- With nonzero gains and nondegenerate phase separation, the two-sample
    readout uniquely identifies the frozen NS/WE projected pair. -/
theorem two_phase_readout_injective
    (cg1 cg2 alpha1 alpha2 : ℝ)
    (hcg1 : cg1 ≠ 0)
    (hcg2 : cg2 ≠ 0)
    (hphase : Real.sin (alpha2 - alpha1) ≠ 0) :
    Function.Injective (twoPhaseReadout cg1 cg2 alpha1 alpha2) := by
  have hdet :
      Real.cos alpha1 * Real.sin alpha2 -
        Real.sin alpha1 * Real.cos alpha2 ≠ 0 := by
    rw [determinant_eq_sin_phase_difference]
    exact hphase
  intro x y h
  have h1 :
      onePhaseReadout cg1 alpha1 x =
        onePhaseReadout cg1 alpha1 y := congrArg Prod.fst h
  have h2 :
      onePhaseReadout cg2 alpha2 x =
        onePhaseReadout cg2 alpha2 y := congrArg Prod.snd h
  have h1' :
      x.1 * Real.cos alpha1 + x.2 * Real.sin alpha1 =
        y.1 * Real.cos alpha1 + y.2 * Real.sin alpha1 :=
    mul_left_cancel₀ hcg1 h1
  have h2' :
      x.1 * Real.cos alpha2 + x.2 * Real.sin alpha2 =
        y.1 * Real.cos alpha2 + y.2 * Real.sin alpha2 :=
    mul_left_cancel₀ hcg2 h2
  have hx :
      (x.1 - y.1) *
        (Real.cos alpha1 * Real.sin alpha2 -
          Real.sin alpha1 * Real.cos alpha2) = 0 := by
    linear_combination h1' * Real.sin alpha2 - h2' * Real.sin alpha1
  have hy :
      (x.2 - y.2) *
        (Real.cos alpha1 * Real.sin alpha2 -
          Real.sin alpha1 * Real.cos alpha2) = 0 := by
    linear_combination h2' * Real.cos alpha1 - h1' * Real.cos alpha2
  have hdx : x.1 - y.1 = 0 :=
    (mul_eq_zero.mp hx).resolve_right hdet
  have hdy : x.2 - y.2 = 0 :=
    (mul_eq_zero.mp hy).resolve_right hdet
  apply Prod.ext
  · exact sub_eq_zero.mp hdx
  · exact sub_eq_zero.mp hdy

#print axioms one_sample_phase_zero_not_injective
#print axioms determinant_eq_sin_phase_difference
#print axioms two_phase_readout_injective

end HsHVerification.NadirGPBPhaseReadout
