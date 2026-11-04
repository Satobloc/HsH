import Mathlib

namespace HsHVerification.NISTC4Symmetry

/-
  The NIST torsion-balance source/test-mass arrangement has fourfold
  azimuthal symmetry.  This module proves the corresponding root-of-unity
  selection rule for the four equally spaced angular positions.

  It is a conditional algebraic statement about a C4 orbit sum.  It does
  not derive the paper's full Legendre expansion, mass integration, or
  physical torque model.
-/

def c4HarmonicSum (m : ℕ) : ℂ :=
  1 + Complex.I ^ m + Complex.I ^ (2 * m) + Complex.I ^ (3 * m)

private lemma I_pow_mod4_zero (m : ℕ) (h : m % 4 = 0) :
    Complex.I ^ m = 1 := by
  have hm : m = 4 * (m / 4) := by omega
  rw [hm, pow_mul]
  norm_num [Complex.I_sq]

private lemma I_pow_mod4_one (m : ℕ) (h : m % 4 = 1) :
    Complex.I ^ m = Complex.I := by
  have hm : m = 4 * (m / 4) + 1 := by omega
  rw [hm, pow_add, pow_mul]
  norm_num [Complex.I_sq]

private lemma I_pow_mod4_two (m : ℕ) (h : m % 4 = 2) :
    Complex.I ^ m = -1 := by
  have hm : m = 4 * (m / 4) + 2 := by omega
  rw [hm, pow_add, pow_mul]
  norm_num [Complex.I_sq]

private lemma I_pow_mod4_three (m : ℕ) (h : m % 4 = 3) :
    Complex.I ^ m = -Complex.I := by
  have hm : m = 4 * (m / 4) + 3 := by omega
  rw [hm, pow_add, pow_mul]
  norm_num [Complex.I_sq]

private lemma I_pow_two_mul (m : ℕ) :
    Complex.I ^ (2 * m) = (Complex.I ^ m) ^ 2 := by
  rw [show 2 * m = m * 2 by omega, pow_mul]

private lemma I_pow_three_mul (m : ℕ) :
    Complex.I ^ (3 * m) = (Complex.I ^ m) ^ 3 := by
  rw [show 3 * m = m * 3 by omega, pow_mul]

theorem c4HarmonicSum_eq_four_of_dvd (m : ℕ) (h : 4 ∣ m) :
    c4HarmonicSum m = 4 := by
  have hmod : m % 4 = 0 := Nat.mod_eq_zero_of_dvd h
  have hz := I_pow_mod4_zero m hmod
  unfold c4HarmonicSum
  rw [hz, I_pow_two_mul, I_pow_three_mul, hz]
  norm_num

theorem c4HarmonicSum_eq_zero_of_not_dvd (m : ℕ) (h : ¬ 4 ∣ m) :
    c4HarmonicSum m = 0 := by
  have hmod : m % 4 ≠ 0 := by
    intro hz
    exact h (Nat.dvd_of_mod_eq_zero hz)
  have hcases : m % 4 = 1 ∨ m % 4 = 2 ∨ m % 4 = 3 := by omega
  rcases hcases with h1 | h2 | h3
  · have hz := I_pow_mod4_one m h1
    unfold c4HarmonicSum
    rw [hz, I_pow_two_mul, I_pow_three_mul, hz]
    norm_num [Complex.I_sq]
  · have hz := I_pow_mod4_two m h2
    unfold c4HarmonicSum
    rw [hz, I_pow_two_mul, I_pow_three_mul, hz]
    norm_num
  · have hz := I_pow_mod4_three m h3
    unfold c4HarmonicSum
    rw [hz, I_pow_two_mul, I_pow_three_mul, hz]
    norm_num [Complex.I_sq]

#eval c4HarmonicSum 1
#eval c4HarmonicSum 4

#print axioms c4HarmonicSum_eq_four_of_dvd
#print axioms c4HarmonicSum_eq_zero_of_not_dvd

end HsHVerification.NISTC4Symmetry
