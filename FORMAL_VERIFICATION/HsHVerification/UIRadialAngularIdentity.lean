import Mathlib

/-!
Mercer-selected source-faithful proof candidate, 2026-10-27.
Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25,
2026/SAT CORE — UI CONFIG.txt (Git blob 6817caf68943593f31d72d51798e0ba4589624a4).
Frozen HsH implementation: tools/ui_blind_lab/FREEZE_MANIFEST.json,
freeze SAT-UI-BLIND-20261026-001.

This proves only a four-coordinate algebraic decomposition GIVEN
unit direction and orthogonality of its derivative. It does not prove
that the source's R(s) is a physical rotation, that any observed
worldtube obeys this map, or any material/particle prediction.
-/

namespace HsHVerification.UIRadialAngularIdentity

/-- Algebraic radial/angular split for a four-coordinate trajectory derivative.
The hypotheses encode u·u = 1 and u·du = 0; their physical or
differential origin is NOT proved here. -/
theorem four_coordinate_velocity_split
    (q dq : ℝ) (u du : Fin 4 → ℝ)
    (hu : (∑ i, (u i)^2) = 1)
    (horth : (∑ i, u i * du i) = 0) :
    (∑ i, (dq * u i + q * du i)^2) =
      dq^2 + q^2 * (∑ i, (du i)^2) := by
  calc
    (∑ i, (dq * u i + q * du i)^2) =
      ∑ i, (dq^2 * (u i)^2 + (2 * dq * q) * (u i * du i) +
        q^2 * (du i)^2) := by
          apply Finset.sum_congr rfl
          intro i hi
          ring
    _ = dq^2 * (∑ i, (u i)^2) +
        (2 * dq * q) * (∑ i, u i * du i) +
        q^2 * (∑ i, (du i)^2) := by
          simp [Finset.sum_add_distrib, Finset.mul_sum]
    _ = dq^2 + q^2 * (∑ i, (du i)^2) := by
          rw [hu, horth]
          ring

end HsHVerification.UIRadialAngularIdentity
