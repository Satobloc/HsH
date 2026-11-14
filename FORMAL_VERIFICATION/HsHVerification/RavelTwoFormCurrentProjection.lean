import Mathlib

/-!
# Conditional projection of a conserved two-form current

## Source boundary

The Blockwave rank-2 current is assistant-authored, not Nathan Direct:
conversation raw blob
1f074cc67057ae9df1e92bab45e8ba34c96b0d77, conversation
68f4d9b5-b908-832e-940e-6782db174a4a, assistant message
3039b226-02d4-41a3-a2d3-c338e25204a9 (2025-10-19 12:31:03Z).
Its displayed conservation law is ∇_μ J^{μν} = 0.

The June 2025 SAT4D live draft (document-level byline Nathan McKnight;
AI assistance acknowledged; Git blob
2a79fe25018cce7e99a2c33786d88b0551db6ae7) uses a rank-1
J_μ and displays a Maxwell source whose right-hand side lacks the
free ν index. The map from its averaged filament-flux quantity to a
covector current is not defined.

This module proposes only a conditional algebraic projection of a
rank-2 antisymmetric current using a chosen covector u_μ. It does not
identify the assistant-authored Blockwave current with the SAT4D current,
supply a charge normalization, or establish a physical H(s)H law.

## Formal statement

For antisymmetric J^{μν}, define the projected vector
j^ν = Σ_μ J^{μν} u_μ. It is orthogonal to u_ν, so it is a
spatial current relative to u, not a complete four-current with a
charge density.

Under the explicit product-rule expansion and the contracted
two-form-conservation premise encoded below,

∇_ν j^ν = -½ J^{μν} ω_{μν},
where ω_{μν} = ∇_μ u_ν - ∇_ν u_μ.

Thus this projected current is conserved only when its contraction with
the antisymmetric derivative of u vanishes. A full four-current still
requires an independently specified scalar charge density ρ and
the corresponding continuity equation.

## Limits

The finite-index model uses Fin 4 and real components. It does not
encode a metric, raising/lowering, a Levi-Civita connection, a physical
unit timelike field, the source's worldsheet support, or a constitutive
law. The product-rule expression and contracted conservation premise
are explicit inputs. Lean checks only the conditional component
algebra, not the translation to the source equations or their physical
truth.
-/

namespace HsHVerification.RavelTwoFormCurrentProjection

abbrev Index := Fin 4

def vorticity (Du : Index → Index → ℝ) (μ ν : Index) : ℝ :=
  Du μ ν - Du ν μ

def spatialCurrent (J : Index → Index → ℝ)
    (uCov : Index → ℝ) (ν : Index) : ℝ :=
  ∑ μ : Index, J μ ν * uCov μ

def vorticityContraction (J Du : Index → Index → ℝ) : ℝ :=
  ∑ μ : Index, ∑ ν : Index, J μ ν * vorticity Du μ ν

/-- Product-rule expansion of the divergence of
    j^ν = Σ_μ J^{μν} u_μ.
    The derivative indices are explicit inputs; this is not a
    formalized connection. -/
def projectedDivergence
    (dJ : Index → Index → Index → ℝ)
    (J : Index → Index → ℝ)
    (uCov : Index → ℝ)
    (DuCov : Index → Index → ℝ) : ℝ :=
  (∑ ν : Index, ∑ μ : Index, dJ ν μ ν * uCov μ) +
  (∑ ν : Index, ∑ μ : Index, J μ ν * DuCov ν μ)

/-- Antisymmetry converts the mixed contraction into minus one half
    of the contraction with the antisymmetric derivative. -/
theorem antisymmetric_mixed_contraction_eq_neg_half_vorticity
    (J D : Index → Index → ℝ)
    (hJ : ∀ μ ν, J μ ν = -J ν μ) :
    (∑ ν : Index, ∑ μ : Index, J μ ν * D ν μ) =
      -(1 / 2 : ℝ) *
        (∑ μ : Index, ∑ ν : Index,
          J μ ν * (D μ ν - D ν μ)) := by
  classical
  let T : ℝ := ∑ μ : Index, ∑ ν : Index, J μ ν * D μ ν
  have hMixed :
      (∑ μ : Index, ∑ ν : Index, J μ ν * D ν μ) = -T := by
    calc
      _ = ∑ μ : Index, ∑ ν : Index, (-J ν μ) * D ν μ := by
        apply Finset.sum_congr rfl
        intro μ hμ
        apply Finset.sum_congr rfl
        intro ν hν
        rw [hJ μ ν]
      _ = -(∑ μ : Index, ∑ ν : Index, J ν μ * D ν μ) := by
        simp [Finset.sum_neg_distrib]
      _ = -T := by
        congr 1
        rw [Finset.sum_comm]
  have hVorticity :
      (∑ μ : Index, ∑ ν : Index,
        J μ ν * (D μ ν - D ν μ)) = 2 * T := by
    calc
      _ = (∑ μ : Index, ∑ ν : Index, J μ ν * D μ ν) -
          (∑ μ : Index, ∑ ν : Index, J μ ν * D ν μ) := by
        simp_rw [mul_sub, Finset.sum_sub_distrib]
      _ = T - (-T) := by
        rw [hMixed]
      _ = 2 * T := by ring
  calc
    _ = ∑ μ : Index, ∑ ν : Index, J μ ν * D ν μ := by
      rw [Finset.sum_comm]
    _ = -T := hMixed
    _ = -(1 / 2 : ℝ) * (2 * T) := by ring
    _ = -(1 / 2 : ℝ) *
        (∑ μ : Index, ∑ ν : Index,
          J μ ν * (D μ ν - D ν μ)) := by rw [← hVorticity]

/-- The contraction of an antisymmetric two-form with the same covector
    in both slots vanishes: the projected current is spatial relative to u. -/
theorem spatialCurrent_orthogonal_to_u
    (J : Index → Index → ℝ)
    (uCov : Index → ℝ)
    (hJ : ∀ μ ν, J μ ν = -J ν μ) :
    (∑ ν : Index, spatialCurrent J uCov ν * uCov ν) = 0 := by
  classical
  have h := antisymmetric_mixed_contraction_eq_neg_half_vorticity
    J (fun μ ν => uCov μ * uCov ν) hJ
  unfold spatialCurrent
  simp_rw [Finset.sum_mul]
  simpa [mul_comm, mul_left_comm, mul_assoc] using h

/-- If the contracted derivative of the two-form vanishes, the
    projected-current divergence is entirely the vorticity contraction. -/
theorem projectedDivergence_eq_neg_half_vorticityContraction
    (dJ : Index → Index → Index → ℝ)
    (J : Index → Index → ℝ)
    (uCov : Index → ℝ)
    (DuCov : Index → Index → ℝ)
    (hJ : ∀ μ ν, J μ ν = -J ν μ)
    (hDiv : ∀ μ : Index, (∑ ν : Index, dJ ν μ ν) = 0) :
    projectedDivergence dJ J uCov DuCov =
      -(1 / 2 : ℝ) * vorticityContraction J DuCov := by
  classical
  have hFirst :
      (∑ ν : Index, ∑ μ : Index, dJ ν μ ν * uCov μ) = 0 := by
    calc
      _ = ∑ μ : Index, ∑ ν : Index, dJ ν μ ν * uCov μ := by
        rw [Finset.sum_comm]
      _ = ∑ μ : Index, (∑ ν : Index, dJ ν μ ν) * uCov μ := by
        apply Finset.sum_congr rfl
        intro μ hμ
        rw [Finset.sum_mul]
      _ = 0 := by simp [hDiv]
  have hSecond :=
    antisymmetric_mixed_contraction_eq_neg_half_vorticity J DuCov hJ
  unfold projectedDivergence vorticityContraction vorticity
  rw [hFirst]
  simpa using hSecond

/-- The projected current is divergence-free if its vorticity contraction
    vanishes. This is a sufficient condition, not an asserted property of
    the physical medium. -/
theorem projectedCurrent_conserved_of_vorticity_orthogonality
    (dJ : Index → Index → Index → ℝ)
    (J : Index → Index → ℝ)
    (uCov : Index → ℝ)
    (DuCov : Index → Index → ℝ)
    (hJ : ∀ μ ν, J μ ν = -J ν μ)
    (hDiv : ∀ μ : Index, (∑ ν : Index, dJ ν μ ν) = 0)
    (hOrthogonal : vorticityContraction J DuCov = 0) :
    projectedDivergence dJ J uCov DuCov = 0 := by
  rw [projectedDivergence_eq_neg_half_vorticityContraction
    dJ J uCov DuCov hJ hDiv, hOrthogonal]
  simp

#print axioms antisymmetric_mixed_contraction_eq_neg_half_vorticity
#print axioms spatialCurrent_orthogonal_to_u
#print axioms projectedDivergence_eq_neg_half_vorticityContraction
#print axioms projectedCurrent_conserved_of_vorticity_orthogonality

end HsHVerification.RavelTwoFormCurrentProjection
