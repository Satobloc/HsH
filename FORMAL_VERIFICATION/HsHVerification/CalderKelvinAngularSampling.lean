import Mathlib

/-!
# Full-band angular sampling bound for Kelvin-mode readout

The external Nature Physics source writes a single-harmonic radial profile
with integer azimuthal mode m and samples opposing azimuths. Existing HsH
formalizations cover the two-antipode alias and a conditional four-cardinal
operator. This module adds a general sample-count lower bound for resolving
the complete real Fourier band 0..M on an ideal uniform angular grid.

For a real Fourier band through M, full quadrature recovery must avoid:
* a reflected pair with distinct mode indices whose sum is N (the first
  real-Fourier wrap-around alias);
* an even-grid Nyquist mode 2m = N, whose sine quadrature vanishes.

The arithmetic theorem below proves that avoiding both degeneracies requires
N > 2M. For M = 7, at least 15 uniformly spaced angular samples are required.

This module proves only the integer alias/sample-count conditions. It does
NOT prove invertibility of the full DFT matrix, camera realizability,
calibration, synchronization, contour extraction, absence of modes above M,
or any physical H(s)H map. A finite bandlimit or an anti-alias control is
still required in an actual acquisition.
-/

namespace HsHVerification.CalderKelvinAngularSampling

/-- A first-wrap real-Fourier alias on an ideal N-point uniform angular grid:
distinct labels coincide by reflection (sum N) or by a one-step wrap in
either direction. Within a band with N > 2M, these are the only possible
nontrivial wrap relations. -/
def UniformGridAlias (N m n : ℕ) : Prop :=
  m ≠ n ∧ (m + n = N ∨ m + N = n ∨ n + N = m)

/-- If the sample count exceeds twice the maximum mode, distinct labels in
the band 0..M have no first-wrap real-Fourier alias. -/
theorem no_alias_of_twoM_lt_N
    {N M m n : ℕ}
    (hN : 2 * M < N)
    (hm : m ≤ M)
    (hn : n ≤ M)
    (hne : m ≠ n) :
    ¬ UniformGridAlias N m n := by
  intro h
  rcases h with ⟨_, hsum | hmn | hnm⟩
  · omega
  · omega
  · omega

/-- On an even N-point grid, the Nyquist mode N/2 lies in the band whenever
N ≤ 2M; its sine quadrature is self-conjugate and cannot be recovered. -/
theorem even_grid_has_nyquist
    {N M : ℕ}
    (hEven : N % 2 = 0)
    (hN : N ≤ 2 * M) :
    ∃ m, m ≤ M ∧ 2 * m = N := by
  have hdecomp := Nat.mod_add_div N 2
  refine ⟨N / 2, ?_, ?_⟩ <;> omega

/-- On an odd N-point grid with N ≤ 2M, the two adjacent modes around
N/2 are distinct members of the band and reflect into one another. -/
theorem odd_grid_has_reflected_alias
    {N M : ℕ}
    (hOdd : N % 2 = 1)
    (hN : N ≤ 2 * M) :
    ∃ m n, m ≤ M ∧ n ≤ M ∧ m ≠ n ∧ m + n = N := by
  have hdecomp := Nat.mod_add_div N 2
  refine ⟨N / 2 + 1, N / 2, ?_, ?_, ?_, ?_⟩ <;> omega

/-- Any uniform grid that avoids both Nyquist loss and reflected mode
aliasing over the complete real Fourier band 0..M needs at least 2M+1
samples. This is a necessary sampling bound, not a physical prediction. -/
theorem full_quadrature_requires_twoM_plus_one
    {N M : ℕ}
    (hNoNyquist : ∀ m, m ≤ M → 2 * m ≠ N)
    (hNoReflectedAlias :
      ∀ m n, m ≤ M → n ≤ M → m ≠ n → m + n ≠ N) :
    2 * M < N := by
  by_contra h
  have hN : N ≤ 2 * M := by omega
  by_cases hEven : N % 2 = 0
  · obtain ⟨m, hm, htwice⟩ := even_grid_has_nyquist hEven hN
    exact (hNoNyquist m hm) htwice
  · have hOdd : N % 2 = 1 := by omega
    obtain ⟨m, n, hm, hn, hmn, hsum⟩ :=
      odd_grid_has_reflected_alias hOdd hN
    exact (hNoReflectedAlias m n hm hn hmn) hsum

/-- The complete real Fourier band m = 0..7 requires at least fifteen
uniform angular samples if both quadratures of every mode are to remain
identifiable. -/
theorem modes_through_seven_require_fifteen
    {N : ℕ}
    (hNoNyquist : ∀ m, m ≤ 7 → 2 * m ≠ N)
    (hNoReflectedAlias :
      ∀ m n, m ≤ 7 → n ≤ 7 → m ≠ n → m + n ≠ N) :
    15 ≤ N := by
  have h := full_quadrature_requires_twoM_plus_one
    (N := N) (M := 7) hNoNyquist hNoReflectedAlias
  omega

/-- Fifteen samples introduce no first-wrap alias between distinct
frequency labels in the full band m = 0..7. -/
theorem fifteen_samples_no_alias_through_seven
    {m n : ℕ}
    (hm : m ≤ 7)
    (hn : n ≤ 7)
    (hne : m ≠ n) :
    ¬ UniformGridAlias 15 m n := by
  exact no_alias_of_twoM_lt_N
    (N := 15) (M := 7) (by omega) hm hn hne

#print axioms no_alias_of_twoM_lt_N
#print axioms even_grid_has_nyquist
#print axioms odd_grid_has_reflected_alias
#print axioms full_quadrature_requires_twoM_plus_one
#print axioms modes_through_seven_require_fifteen
#print axioms fifteen_samples_no_alias_through_seven

end HsHVerification.CalderKelvinAngularSampling
