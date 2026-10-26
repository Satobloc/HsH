import Mathlib

/-!
Mercer source-recovery negative control, 2026-10-26.
Source 1: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/Orders and Q numbers.txt,
Git blob 5a1d72f012dcbd5bbf2681593bba005c15741d1e,
original PDF SHA256 83d3c68a0fe7df6e5bc9589ba309af92b35e43594a7081d2232acadd62e14693.
Source 2: SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt,
Git blob 1854995be3311f565739f2be64269cbb0385a82f.
External physical labels: NIST Atomic Weights and Isotopic Compositions,
https://physics.nist.gov/cgi-bin/Compositions/stand_alone.pl?ele=He
and https://physics.nist.gov/cgi-bin/Compositions/stand_alone.pl?ascii=ascii
He-3 has Z=2,A=3; tritium H-3 has Z=1,A=3.

The conditional SAT-source counting convention Q_fund=3*A is represented,
not physically validated. The 3*Z alternative is kept separate because the
PDF says "atomic number" in one passage but elsewhere uses 3*A.
No physical masses or uncertainties are asserted in Lean.
-/

namespace HsHVerification.MercerHe3Q

structure Nuclide where
  atomicNumber : Nat
  massNumber : Nat
  deriving DecidableEq, Repr

def helium3 : Nuclide := ⟨2, 3⟩
def tritium : Nuclide := ⟨1, 3⟩

/-- Conditional source counting rule: three fundamental strands per nucleon. -/
def fundamentalQ (n : Nuclide) : Nat := 3 * n.massNumber

/-- Literal alternate interpretation of the source's "atomic number" wording. -/
def atomicNumberQ (n : Nuclide) : Nat := 3 * n.atomicNumber

theorem same_fundamentalQ : fundamentalQ helium3 = fundamentalQ tritium := by
  decide

theorem distinct_nuclides : helium3 ≠ tritium := by
  decide

/-- Forward map Q=3A loses the proton count: it is not injective. -/
theorem q_not_injective : ¬ Function.Injective fundamentalQ := by
  intro hinj
  exact distinct_nuclides (hinj same_fundamentalQ)

/-- A complete inverse Q -> nuclide cannot exist for this representation. -/
theorem no_total_recovery :
    ¬ ∃ recover : Nat → Nuclide,
      ∀ n : Nuclide, recover (fundamentalQ n) = n := by
  rintro ⟨recover, h⟩
  have eq : helium3 = tritium := by
    calc
      helium3 = recover (fundamentalQ helium3) := (h helium3).symm
      _ = recover (fundamentalQ tritium) := congrArg recover same_fundamentalQ
      _ = tritium := h tritium
  exact distinct_nuclides eq

/-- The two literal historical counting formulas disagree for He-3. -/
theorem atomic_vs_mass_number_disagree :
    atomicNumberQ helium3 ≠ fundamentalQ helium3 := by
  decide

/-- A mass law depending ONLY on Q predicts equal values for these nuclides. -/
theorem q_only_mass_cannot_distinguish (massByQ : Nat → ℝ) :
    massByQ (fundamentalQ helium3) =
      massByQ (fundamentalQ tritium) := by
  exact congrArg massByQ same_fundamentalQ

end HsHVerification.MercerHe3Q
