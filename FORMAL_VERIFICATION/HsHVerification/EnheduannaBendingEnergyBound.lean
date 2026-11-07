import Mathlib

/-!
# Conditional curvature-capped bending-energy bound

Source boundary:
* Ravel, `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-bending-arclength-gate-20261023t08z-001.md`,
  blob `d72b16f40b6cd6a6b30a016e17870e38ba405ebb`, records the conditional
  reach-style inequality `E ≤ B_line * L / (2 * a_core^2)`.
* Meridian, `WORKSPACES/MERIDIAN/SANDBOX_2026-10-21_NLM_BENDING_ENERGY_RECOVERY.md`,
  blob `6c7e1a8843632f766151df0d466d1ab3f5f85b4e`, distinguishes recovered
  historical bending functionals from the still-unlocated historical maximum.
* Nathan Direct, `Minkowski Ring Analysis`, conversation
  `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, raw export blob
  `56a84cb85d5c386efa4ea11d322d11e95e2c7703`, messages
  `2bef9e5d-cf4d-4cb2-959f-218e032e5263` (2026-10-21T06:32:15.993Z) and
  `a0e0be28-5bd8-45da-9991-1e075f09728d` (2026-10-21T06:34:36.336Z).
  These direct messages recall a prior maximum but do not state its formula.

This module proves only a conditional mathematical bound for the declared
quadratic arclength functional. It does NOT recover the remembered historical
maximum, derive the curvature ceiling from H(s)H, prove that a historical
parameter is physical arclength, or establish a physical constitutive law.
The reach specialization assumes the pointwise bound `κ(s) ≤ 1/a`.
The equality theorem shows sharpness only in the unconstrained scalar-function
class; closure, topology, boundary conditions, causality, finite-core
geometry, and the source-to-observable map are not modeled.
-/

namespace HsHVerification.EnheduannaBendingEnergyBound

/-- Quadratic arclength bending functional for a scalar curvature magnitude. -/
noncomputable def bendingEnergy (B L : ℝ) (κ : ℝ → ℝ) : ℝ :=
  (B / 2) * ∫ s in (0 : ℝ)..L, (κ s) ^ 2

/-- A pointwise squared-curvature ceiling gives a global energy bound. -/
theorem bendingEnergy_le_of_curvature_bound
    (B L K : ℝ) (κ : ℝ → ℝ)
    (hB : 0 ≤ B) (hL : 0 ≤ L)
    (hκ : Continuous κ)
    (hcap : ∀ s ∈ Set.Icc (0 : ℝ) L, (κ s) ^ 2 ≤ K ^ 2) :
    bendingEnergy B L κ ≤ (B / 2) * (L * K ^ 2) := by
  unfold bendingEnergy
  have hmono :
      (∫ s in (0 : ℝ)..L, (κ s) ^ 2) ≤
        ∫ s in (0 : ℝ)..L, (fun _ : ℝ => K ^ 2) s := by
    exact intervalIntegral.integral_mono_on hL
      ((hκ.pow 2).intervalIntegrable 0 L)
      (continuous_const.intervalIntegrable 0 L)
      hcap
  have hconst :
      (∫ s in (0 : ℝ)..L, (fun _ : ℝ => K ^ 2) s) = L * K ^ 2 := by
    simp [intervalIntegral.integral_const, smul_eq_mul]
  have hfactor : 0 ≤ B / 2 := by positivity
  calc
    (B / 2) * (∫ s in (0 : ℝ)..L, (κ s) ^ 2)
        ≤ (B / 2) * (∫ s in (0 : ℝ)..L, (fun _ : ℝ => K ^ 2) s) :=
          mul_le_mul_of_nonneg_left hmono hfactor
    _ = (B / 2) * (L * K ^ 2) := by rw [hconst]

/-- If curvature magnitude is bounded by the reciprocal of a positive
    core/reach scale, then E ≤ B*L/(2*a^2). This is conditional on that
    geometric ceiling; the theorem does not derive it. -/
theorem bendingEnergy_le_of_reach_radius
    (B L a : ℝ) (κ : ℝ → ℝ)
    (hB : 0 ≤ B) (hL : 0 ≤ L) (ha : 0 < a)
    (hκ : Continuous κ)
    (hκ_nonneg : ∀ s ∈ Set.Icc (0 : ℝ) L, 0 ≤ κ s)
    (hreach : ∀ s ∈ Set.Icc (0 : ℝ) L, κ s ≤ a⁻¹) :
    bendingEnergy B L κ ≤ (B / 2) * (L * (a⁻¹) ^ 2) := by
  apply bendingEnergy_le_of_curvature_bound B L a⁻¹ κ hB hL hκ
  intro s hs
  have hInv : 0 ≤ a⁻¹ := by positivity
  have hleft : 0 ≤ a⁻¹ - κ s := sub_nonneg.mpr (hreach s hs)
  have hright : 0 ≤ a⁻¹ + κ s :=
    add_nonneg hInv (hκ_nonneg s hs)
  have hprod : 0 ≤ (a⁻¹ - κ s) * (a⁻¹ + κ s) :=
    mul_nonneg hleft hright
  nlinarith

/-- Constant curvature attains the bound. This establishes sharpness only
    in the abstract scalar-function class, not physical attainability. -/
theorem constant_curvature_saturates
    (B L K : ℝ) :
    bendingEnergy B L (fun _ : ℝ => K) =
      (B / 2) * (L * K ^ 2) := by
  unfold bendingEnergy
  simp [intervalIntegral.integral_const, smul_eq_mul]

/-- Exact arithmetic sanity check for the abstract expression only. -/
example : (2 : ℝ) / 2 * (3 * (4 : ℝ) ^ 2) = 48 := by
  norm_num

#eval (2 : Nat) * 3 * 4 ^ 2 / 2

#print axioms bendingEnergy_le_of_curvature_bound
#print axioms bendingEnergy_le_of_reach_radius
#print axioms constant_curvature_saturates

end HsHVerification.EnheduannaBendingEnergyBound
