import Mathlib

/-!
# Aldus: Blockwave Ideal scalar kinetic-sign source gate

Historical source (not authenticated Nathan-authored equations):
HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT—Blockwave Ideal Model.txt
Git blob dd0631bc0b25c951dc5e1d6738280e08487b46b2,
lines 96-104 (Lagrangian) and 383-405 (FRW metric, canonical momentum,
Hamiltonian). The source writes signature (-,+,+,+), a positive scalar
gradient term +f^2/2 * g^{mu nu} d_mu theta d_nu theta, and then the
canonical momentum +a^3 f^2 theta_dot and positive quadratic Hamiltonian.

Independent role-tagged historical review:
25.10.19 Full action definitions raw.json, blob
1f074cc67057ae9df1e92bab45e8ba34c96b0d77,
user message f77f769e-8e74-4def-b4c9-bced0edbb8bc at
2025-10-19T14:49:49Z and assistant review
68759291-9b8b-473f-81e4-08f563a15d0b.
That review silently quotes the *negative* standard kinetic sign although
the submitted action is *positive*.

K denotes the positive coefficient a^3 f^2. p is a symbolic canonical
momentum and q a nonnegative squared spatial-gradient magnitude.
These theorems are exact algebraic/conditional source checks, not a
physical system, measured prediction, demonstration of ghosts in the
full coupled theory, or endorsement of a historical action.
-/

namespace HsHVerification.AldusBlockwaveIdealSign

def sourceMomentum (K v : ℝ) : ℝ := -(K * v)
def printedMomentum (K v : ℝ) : ℝ := K * v

theorem source_momentum_disagrees_with_printed
    (K v : ℝ) (hK : K ≠ 0) (hv : v ≠ 0) :
    sourceMomentum K v ≠ printedMomentum K v := by
  intro h
  have hzero : K * v = 0 := by
    dsimp [sourceMomentum, printedMomentum] at h
    linarith
  exact (mul_ne_zero hK hv) hzero

noncomputable def sourceTimeLagrangian (K v : ℝ) : ℝ := -(K * v ^ 2) / 2

theorem source_legendre_time_term (K v : ℝ) :
    sourceMomentum K v * v - sourceTimeLagrangian K v =
      -(K * v ^ 2) / 2 := by
  dsimp [sourceMomentum, sourceTimeLagrangian]
  ring

theorem source_kinetic_opposite_of_printed (K p q : ℝ) :
    -p ^ 2 / (2 * K) - K * q / 2 =
      -(p ^ 2 / (2 * K) + K * q / 2) := by
  ring

theorem source_kinetic_negative_if_nonzero_time_mode
    (K p q : ℝ) (hK : 0 < K) (hp : p ≠ 0) (hq : 0 ≤ q) :
    -p ^ 2 / (2 * K) - K * q / 2 < 0 := by
  have hp2 : 0 < p ^ 2 := sq_pos_of_ne_zero hp
  have hden : 0 < 2 * K := by positivity
  have htime : 0 < p ^ 2 / (2 * K) := div_pos hp2 hden
  have hgrad : 0 ≤ K * q / 2 :=
    div_nonneg (mul_nonneg (le_of_lt hK) hq) (by norm_num)
  calc
    -p ^ 2 / (2 * K) - K * q / 2 =
        -(p ^ 2 / (2 * K) + K * q / 2) :=
          source_kinetic_opposite_of_printed K p q
    _ < 0 := by
      have hsum : 0 < p ^ 2 / (2 * K) + K * q / 2 :=
        add_pos_of_pos_of_nonneg htime hgrad
      linarith

#print axioms source_momentum_disagrees_with_printed
#print axioms source_legendre_time_term
#print axioms source_kinetic_opposite_of_printed
#print axioms source_kinetic_negative_if_nonzero_time_mode

end HsHVerification.AldusBlockwaveIdealSign
