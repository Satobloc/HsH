import Mathlib

/-!
# Aldus: SAT-X scalar phase versus spinor double-cover source-fidelity gate

Original assistant-authored module:
Satobloc/SAT_THEORY_ARCHIVE_2023-25,
SAT X/SATx CANONICAL.txt, blob afbf610347a6a39c74cf52cbe3818ef22ab3ebcf,
lines 68-76, especially line 72 and line 76.

The archived assistant claims that Psi = exp(i psi) * phi changes sign
when psi advances by a full 2*pi turn. The displayed scalar exponential
does not: it is 2*pi periodic. A pi shift does reverse the scalar sign.
This is a precise mathematical correction to that formula only.
A spinor can instead transform under the double cover of rotations,
with a half-angle, but that extra structure is not present in this formula.

Module 1 of the same source uses psi as noncompact rapidity, whereas
Module 4 uses psi as compact internal phase. Those types must be
disambiguated before combining the modules.

Real experimental comparator: Werner, Colella, Overhauser and Eagen,
Phys. Rev. Lett. 35, 1053 (20 Oct 1975), DOI 10.1103/PhysRevLett.35.1053.
Observed neutron interferometer sign reversal after 2*pi precession.
The theorems below check only exact complex-exponential identities,
not neutron dynamics, quantum statistics or an H(s)H physical law.
-/

namespace HsHVerification

theorem aldus_scalar_full_turn (z : ℂ) :
    Complex.exp (z + (2 * (Real.pi : ℂ)) * Complex.I) = Complex.exp z := by
  rw [Complex.exp_add, Complex.exp_two_pi_mul_I]
  simp

theorem aldus_scalar_half_turn (z : ℂ) :
    Complex.exp (z + (Real.pi : ℂ) * Complex.I) = -Complex.exp z := by
  exact Complex.exp_add_pi_mul_I z

theorem aldus_scalar_full_turn_not_minus_one :
    Complex.exp ((2 * (Real.pi : ℂ)) * Complex.I) ≠ -(1 : ℂ) := by
  rw [Complex.exp_two_pi_mul_I]
  norm_num

#print axioms aldus_scalar_full_turn
#print axioms aldus_scalar_half_turn
#print axioms aldus_scalar_full_turn_not_minus_one

end HsHVerification
