import Mathlib

/-!
# Kestrel: conditional symmetry check for the 4D superhelix curvature candidate

Source: DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_24/Superhelix Field Theory.md,
blob b13a45b68ffc9a7c22011f5d8586e0c4c08fc2fb, user-role message [1].
The four-message export does not recover the context preceding that message;
the displayed action is therefore a user-role working formulation, while
authorship of the embedded equations remains unresolved.

The source writes, schematically,
R_{μνρσ} ~ ⟨a_μ a_ν v_ρ v_σ⟩_F.
This file formalizes only the literal scalar-product / finite weighted-ensemble
reading of the right-hand side. It does not formalize the meaning of ~,
the averaging measure, a connection, a metric, or a physical curvature map.

A Riemann tensor is antisymmetric in its first index pair. The displayed
rank-four product is symmetric in that pair. If it is intended to be the
tensor itself up to a scalar coefficient, the two properties force it to
vanish. A nonzero curvature construction therefore needs an additional
antisymmetrizing operation or a different index structure, explicitly
defined rather than silently supplied.
-/

namespace HsHVerification.KestrelSuperhelixCurvature

abbrev Index := Fin 4

/-- Earlier three-axis hyperhelix form from the June 2025 SAT4D summary. -/
def threeAxisHyperhelix
    (λ A_x A_y A_z k_x k_y k_z φ_x φ_y φ_z : ℝ) :
    ℝ × ℝ × ℝ × ℝ :=
  (λ,
    A_x * Real.sin (k_x * λ + φ_x),
    A_y * Real.sin (k_y * λ + φ_y),
    A_z * Real.sin (k_z * λ + φ_z))

/-- The n = 3 coordinate-axis specialization of the later harmonic generator. -/
def nthSuperhelixThreeMode
    (λ l_f : ℝ) (n_x n_y n_z : ℕ) (φ_x φ_y φ_z : ℝ) :
    ℝ × ℝ × ℝ × ℝ :=
  (λ,
    l_f * Real.sin ((2 * Real.pi * (n_x : ℝ) / l_f) * λ + φ_x),
    l_f * Real.sin ((2 * Real.pi * (n_y : ℝ) / l_f) * λ + φ_y),
    l_f * Real.sin ((2 * Real.pi * (n_z : ℝ) / l_f) * λ + φ_z))

/--
The later three-mode formula reduces to the earlier three-axis form only
under the displayed amplitude and wavenumber identifications. This does not
establish recursive nesting or an arbitrary-n extension.
-/
theorem nthSuperhelixThreeMode_is_special_case
    (λ l_f A_x A_y A_z k_x k_y k_z φ_x φ_y φ_z : ℝ)
    (n_x n_y n_z : ℕ)
    (hA_x : A_x = l_f) (hA_y : A_y = l_f) (hA_z : A_z = l_f)
    (hk_x : k_x = 2 * Real.pi * (n_x : ℝ) / l_f)
    (hk_y : k_y = 2 * Real.pi * (n_y : ℝ) / l_f)
    (hk_z : k_z = 2 * Real.pi * (n_z : ℝ) / l_f) :
    threeAxisHyperhelix λ A_x A_y A_z k_x k_y k_z φ_x φ_y φ_z =
      nthSuperhelixThreeMode λ l_f n_x n_y n_z φ_x φ_y φ_z := by
  simp [threeAxisHyperhelix, nthSuperhelixThreeMode,
    hA_x, hA_y, hA_z, hk_x, hk_y, hk_z]

/-- Literal rank-four product appearing on the right-hand side of the source expression. -/
def rawCandidate (a v : Index → ℝ) (i j k l : Index) : ℝ :=
  a i * a j * v k * v l

theorem rawCandidate_symmetric_first_pair
    (a v : Index → ℝ) (i j k l : Index) :
    rawCandidate a v i j k l = rawCandidate a v j i k l := by
  simp only [rawCandidate]
  ring

/-- Any tensor symmetric and antisymmetric in the same pair is zero. -/
theorem symmetric_and_antisymmetric_forces_zero
    (T : Index → Index → Index → Index → ℝ)
    (hSymm : ∀ i j k l, T i j k l = T j i k l)
    (hAnti : ∀ i j k l, T i j k l = - T j i k l) :
    ∀ i j k l, T i j k l = 0 := by
  intro i j k l
  have hs := hSymm i j k l
  have ha := hAnti i j k l
  linarith

/--
If the literal product is required to obey Riemann first-pair antisymmetry,
every component must vanish. This is conditional on no omitted projection
or antisymmetrization in the source's schematic relation.
-/
theorem rawCandidate_zero_if_riemann_first_pair_antisymmetric
    (a v : Index → ℝ)
    (hAnti : ∀ i j k l,
      rawCandidate a v i j k l = - rawCandidate a v j i k l) :
    ∀ i j k l, rawCandidate a v i j k l = 0 := by
  exact symmetric_and_antisymmetric_forces_zero
    (rawCandidate a v)
    (rawCandidate_symmetric_first_pair a v)
    hAnti

/-- Finite weighted ensemble version of the source's averaging brackets. -/
def finiteEnsembleCandidate {ι : Type*} [Fintype ι]
    (w : ι → ℝ) (a v : ι → Index → ℝ)
    (i j k l : Index) : ℝ :=
  ∑ n, w n * a n i * a n j * v n k * v n l

theorem finiteEnsembleCandidate_symmetric_first_pair
    {ι : Type*} [Fintype ι]
    (w : ι → ℝ) (a v : ι → Index → ℝ) (i j k l : Index) :
    finiteEnsembleCandidate w a v i j k l =
      finiteEnsembleCandidate w a v j i k l := by
  unfold finiteEnsembleCandidate
  apply Finset.sum_congr rfl
  intro n hn
  ring

theorem finiteEnsembleCandidate_zero_if_riemann_first_pair_antisymmetric
    {ι : Type*} [Fintype ι]
    (w : ι → ℝ) (a v : ι → Index → ℝ)
    (hAnti : ∀ i j k l,
      finiteEnsembleCandidate w a v i j k l =
        - finiteEnsembleCandidate w a v j i k l) :
    ∀ i j k l, finiteEnsembleCandidate w a v i j k l = 0 := by
  exact symmetric_and_antisymmetric_forces_zero
    (finiteEnsembleCandidate w a v)
    (finiteEnsembleCandidate_symmetric_first_pair w a v)
    hAnti

/-- Purely algebraic witness: the displayed product need not be zero. -/
def basis0 : Index → ℝ := fun i => if i = 0 then 1 else 0

theorem basis0_candidate_nonzero :
    rawCandidate basis0 basis0 0 0 0 0 = 1 := by
  norm_num [rawCandidate, basis0]

theorem basis0_candidate_cannot_have_riemann_first_pair_antisymmetry :
    ¬ (∀ i j k l,
      rawCandidate basis0 basis0 i j k l =
        - rawCandidate basis0 basis0 j i k l) := by
  intro h
  have hz := rawCandidate_zero_if_riemann_first_pair_antisymmetric
    basis0 basis0 h
  have h00 := hz 0 0 0 0
  norm_num [rawCandidate, basis0] at h00

/-- Rational counterpart used for a concrete executable witness. -/
def rawCandidateRat (a v : Index → ℚ) (i j k l : Index) : ℚ :=
  a i * a j * v k * v l

def basis0Rat : Index → ℚ := fun i => if i = 0 then 1 else 0

#eval rawCandidateRat basis0Rat basis0Rat 0 0 0 0

#print axioms nthSuperhelixThreeMode_is_special_case
#print axioms rawCandidate_symmetric_first_pair
#print axioms symmetric_and_antisymmetric_forces_zero
#print axioms rawCandidate_zero_if_riemann_first_pair_antisymmetric
#print axioms finiteEnsembleCandidate_symmetric_first_pair
#print axioms finiteEnsembleCandidate_zero_if_riemann_first_pair_antisymmetric
#print axioms basis0_candidate_nonzero
#print axioms basis0_candidate_cannot_have_riemann_first_pair_antisymmetry

end HsHVerification.KestrelSuperhelixCurvature
