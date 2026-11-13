import Mathlib

/-!
Archive recovery EQ-0017: the 17 mK helium lambda-window construction.
Sources: `GNEW 2.txt`, blob 2588c591264b6c6cfd7846cac7fc3e46b05e4de8,
lines 219--287; ancestor `2026/SAT THOUGHTS — Mechwaall.txt`, blob
5e0f2fd4a8b1f4a344dfa9ac84f09211151ad74d, lines 541--650.

These theorems check only algebra, limits, sign erasure, and the archived
decimal tolerance. They do not establish a physical law or topology.
-/

namespace HsHVerification.ArchiveEQ0017

def window (T B j : ℝ) : ℝ := T * B * |j|

theorem symmetric_bounds_recover_width (T d : ℝ) :
    (T + d / 2) - (T - d / 2) = d := by
  ring

theorem sign_is_erased (T B j : ℝ) : window T B (-j) = window T B j := by
  simp [window]

theorem zero_coupling_limit (T B : ℝ) : window T B 0 = 0 := by
  simp [window]

theorem zero_temperature_limit (B j : ℝ) : window 0 B j = 0 := by
  simp [window]

theorem inverse_fit_reproduces_target
    (T B target : ℝ) (hT : T ≠ 0) (hB : B ≠ 0) :
    T * B * (target / (T * B)) = target := by
  field_simp [hT, hB]

theorem archived_tolerance_accepts :
    |(17095628212216 : ℝ) / 1000000000000000 - 17 / 1000| ≤
      15 / 100000 := by
  norm_num [abs_of_nonneg, abs_of_nonpos]

theorem standard_J_substitution_is_not_17mK :
    (16421657958 : ℝ) / 1000000000000000 < 17 / 1000 := by
  norm_num

end HsHVerification.ArchiveEQ0017
