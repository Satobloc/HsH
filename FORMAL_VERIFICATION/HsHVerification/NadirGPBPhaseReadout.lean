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
components when the phase-separation determinant is nonzero. A single
phase sample is not injective. This is a local observability result, not a
reconstruction of the full GP-B time-varying estimator, not a 3D rotor
orientation reconstruction, not an SO(4) lift, and not an H(s)H law.

No Nathan Direct GP-B/worldtube readout equation was recovered. This is
a standard-reference formalization and assistant reconstruction only.
Local Lean identifiers use descriptive names rather than bare alpha, which
is reserved in the shared symbol registry for the fine-structure constant.
-/

namespace HsHVerification.NadirGPBPhaseReadout

/-- Bias-subtracted, noiseless one-sample projection from Eq. (2). -/
noncomputable def onePhaseReadout
    (scaleFactor rollPhase : ℝ) (misalignmentNSWE : ℝ × ℝ) : ℝ :=
  scaleFactor *
    (misalignmentNSWE.1 * Real.cos rollPhase +
      misalignmentNSWE.2 * Real.sin rollPhase)

/-- Two samples with known scale factors and roll phases. -/
noncomputable def twoPhaseReadout
    (scaleFactor1 scaleFactor2 rollPhase1 rollPhase2 : ℝ)
    (misalignmentNSWE : ℝ × ℝ) : ℝ × ℝ :=
  (onePhaseReadout scaleFactor1 rollPhase1 misalignmentNSWE,
   onePhaseReadout scaleFactor2 rollPhase2 misalignmentNSWE)

/-- Any single scalar phase readout has a nontrivial one-dimensional kernel. -/
theorem one_sample_readout_not_injective
    (scaleFactor rollPhase : ℝ) :
    ¬ Function.Injective (onePhaseReadout scaleFactor rollPhase) := by
  intro hinj
  let zero : ℝ × ℝ := (0, 0)
  let kernel : ℝ × ℝ := (-Real.sin rollPhase, Real.cos rollPhase)
  have hneq : zero ≠ kernel := by
    intro h
    have hs : Real.sin rollPhase = 0 := by
      have hfst := congrArg Prod.fst h
      dsimp [zero, kernel] at hfst
      linarith
    have hc : Real.cos rollPhase = 0 := by
      have hsnd := congrArg Prod.snd h
      dsimp [zero, kernel] at hsnd
      exact hsnd.symm
    nlinarith [Real.sin_sq_add_cos_sq rollPhase]
  have hread :
      onePhaseReadout scaleFactor rollPhase zero =
        onePhaseReadout scaleFactor rollPhase kernel := by
    change scaleFactor *
        (0 * Real.cos rollPhase + 0 * Real.sin rollPhase) =
      scaleFactor *
        ((-Real.sin rollPhase) * Real.cos rollPhase +
          Real.cos rollPhase * Real.sin rollPhase)
    ring
  exact hneq (hinj hread)

/-- The 2x2 readout determinant is the sine of the phase separation. -/
theorem determinant_eq_sin_phase_difference
    (rollPhase1 rollPhase2 : ℝ) :
    Real.cos rollPhase1 * Real.sin rollPhase2 -
      Real.sin rollPhase1 * Real.cos rollPhase2 =
        Real.sin (rollPhase2 - rollPhase1) := by
  rw [Real.sin_sub]
  ring

/-- With nonzero gains and nondegenerate phase separation, the two-sample
    readout uniquely identifies the frozen NS/WE projected pair. -/
theorem two_phase_readout_injective
    (scaleFactor1 scaleFactor2 rollPhase1 rollPhase2 : ℝ)
    (hscale1 : scaleFactor1 ≠ 0)
    (hscale2 : scaleFactor2 ≠ 0)
    (hphase : Real.sin (rollPhase2 - rollPhase1) ≠ 0) :
    Function.Injective
      (twoPhaseReadout scaleFactor1 scaleFactor2 rollPhase1 rollPhase2) := by
  have hdet :
      Real.cos rollPhase1 * Real.sin rollPhase2 -
        Real.sin rollPhase1 * Real.cos rollPhase2 ≠ 0 := by
    rw [determinant_eq_sin_phase_difference]
    exact hphase
  intro x y h
  have h1 :
      onePhaseReadout scaleFactor1 rollPhase1 x =
        onePhaseReadout scaleFactor1 rollPhase1 y := congrArg Prod.fst h
  have h2 :
      onePhaseReadout scaleFactor2 rollPhase2 x =
        onePhaseReadout scaleFactor2 rollPhase2 y := congrArg Prod.snd h
  have h1' :
      x.1 * Real.cos rollPhase1 + x.2 * Real.sin rollPhase1 =
        y.1 * Real.cos rollPhase1 + y.2 * Real.sin rollPhase1 :=
    mul_left_cancel₀ hscale1 h1
  have h2' :
      x.1 * Real.cos rollPhase2 + x.2 * Real.sin rollPhase2 =
        y.1 * Real.cos rollPhase2 + y.2 * Real.sin rollPhase2 :=
    mul_left_cancel₀ hscale2 h2
  have hx :
      (x.1 - y.1) *
        (Real.cos rollPhase1 * Real.sin rollPhase2 -
          Real.sin rollPhase1 * Real.cos rollPhase2) = 0 := by
    linear_combination h1' * Real.sin rollPhase2 -
      h2' * Real.sin rollPhase1
  have hy :
      (x.2 - y.2) *
        (Real.cos rollPhase1 * Real.sin rollPhase2 -
          Real.sin rollPhase1 * Real.cos rollPhase2) = 0 := by
    linear_combination h2' * Real.cos rollPhase1 -
      h1' * Real.cos rollPhase2
  have hdx : x.1 - y.1 = 0 :=
    (mul_eq_zero.mp hx).resolve_right hdet
  have hdy : x.2 - y.2 = 0 :=
    (mul_eq_zero.mp hy).resolve_right hdet
  apply Prod.ext
  · exact sub_eq_zero.mp hdx
  · exact sub_eq_zero.mp hdy

#print axioms one_sample_readout_not_injective
#print axioms determinant_eq_sin_phase_difference
#print axioms two_phase_readout_injective

end HsHVerification.NadirGPBPhaseReadout
