import Mathlib

/-!
# Werner et al. (1975) unpolarized-neutron phase readout: conditional identifiability

Physical anchor: Werner, Colella, Overhauser and Eagen, Phys. Rev. Lett. 35,
1053 (1975), DOI 10.1103/PhysRevLett.35.1053, printed Eqs. (3) and (4).
Actual measured system: unpolarized 1.445 Angstrom neutron interferometer;
reported magnetic-field fringe period 62 plus or minus 2 gauss.

The symbols below are the paper's instrumental intensities and phases:
  C2 = gamma - alpha * cos(delta) * cos(beta)
  C3 = alpha * (1 + cos(delta) * cos(beta))
where delta is residual interferometer phase, beta the spin precession phase.

Theorems show mathematical observational nonidentifiability of phase sign and
exchange of two phase factors in this idealized readout. They do NOT establish
which sign occurs physically, that beta equals any H(s)H twist, nor the
validity of the underlying measurement model beyond its stated assumptions.
-/

namespace HsHVerification.MorrowNeutronPhaseIdentifiability

noncomputable def countC2 (gamma alpha delta beta : ℝ) : ℝ :=
  gamma - alpha * Real.cos delta * Real.cos beta

noncomputable def countC3 (alpha delta beta : ℝ) : ℝ :=
  alpha * (1 + Real.cos delta * Real.cos beta)

theorem c2_spin_sign_unidentified (gamma alpha delta beta : ℝ) :
    countC2 gamma alpha delta beta = countC2 gamma alpha delta (-beta) := by
  simp [countC2]

theorem c3_spin_sign_unidentified (alpha delta beta : ℝ) :
    countC3 alpha delta beta = countC3 alpha delta (-beta) := by
  simp [countC3]

theorem c2_residual_sign_unidentified (gamma alpha delta beta : ℝ) :
    countC2 gamma alpha delta beta = countC2 gamma alpha (-delta) beta := by
  simp [countC2]

theorem c3_residual_sign_unidentified (alpha delta beta : ℝ) :
    countC3 alpha delta beta = countC3 alpha (-delta) beta := by
  simp [countC3]

theorem c2_phase_exchange (gamma alpha delta beta : ℝ) :
    countC2 gamma alpha delta beta = countC2 gamma alpha beta delta := by
  unfold countC2
  ring

theorem c3_phase_exchange (alpha delta beta : ℝ) :
    countC3 alpha delta beta = countC3 alpha beta delta := by
  unfold countC3
  ring

theorem summed_counts_cancel_phase (gamma alpha delta beta : ℝ) :
    countC2 gamma alpha delta beta + countC3 alpha delta beta = gamma + alpha := by
  unfold countC2 countC3
  ring

theorem detector_difference_spin_sign_unidentified
    (gamma alpha delta beta : ℝ) :
    countC2 gamma alpha delta beta - countC3 alpha delta beta =
    countC2 gamma alpha delta (-beta) - countC3 alpha delta (-beta) := by
  simp [countC2, countC3]

#print axioms c2_spin_sign_unidentified
#print axioms c3_spin_sign_unidentified
#print axioms c2_residual_sign_unidentified
#print axioms c3_residual_sign_unidentified
#print axioms c2_phase_exchange
#print axioms c3_phase_exchange
#print axioms summed_counts_cancel_phase
#print axioms detector_difference_spin_sign_unidentified

end HsHVerification.MorrowNeutronPhaseIdentifiability
