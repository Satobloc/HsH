import Mathlib

/-!
Nadir :12, 2026-10-28 08:12Z. Source-conditioned arithmetic gate.
Original historical SAT Module 8-H draft, 20 June 2025:
Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT 4D Theory Work/module8H.tex
Git blob 6748806846b4fa72a5271a6ad856dad14963691c.
Parallel HOLONOMY DRAFT.txt blob 2b35f0f98d307d518d387855818e973d251e22b4.
Original authorship is NOT authenticated Nathan Direct.

Measured-system comparator: cosmic microwave background B-mode observations
Planck PR4 + BK18 + BAO, Tristram et al., Phys Rev D 105 083524
(2022), r_0.05 < 0.032 at 95% CL (one-sided bound).
The exact rational values below encode printed historical assumptions,
NOT independently derived H(s)H physical predictions or measured r.
-/
namespace HsHVerification.NadirModule8HBK18Gate

/-- Literal historical approximate formula, treated as a formal expression. -/
def sourceR (n fhat : ℚ) : ℚ := 8 / (n^2 * fhat^2)

/-- At the historical N=55 and fhat=5, the printed expression is exact. -/
theorem source_nominal_value :
    sourceR 55 5 = (8 : ℚ) / 75625 := by
  norm_num [sourceR]

/-- The historical table's r=0.029 does not evaluate its own formula. -/
theorem historical_table_not_formula :
    sourceR 55 5 ≠ (29 : ℚ) / 1000 := by
  norm_num [sourceR]

/-- Factor by which the printed table exceeds the literal expression. -/
theorem printed_to_formula_factor :
    ((29 : ℚ) / 1000) / sourceR 55 5 = (17545 : ℚ) / 64 := by
  norm_num [sourceR]

/-- Both values lie below the reported one-sided 95% observational bound.
    This is NOT a model likelihood, parameter fit, or positive detection. -/
theorem literal_formula_below_measured_limit :
    sourceR 55 5 < (32 : ℚ) / 1000 := by
  norm_num [sourceR]

theorem printed_table_below_measured_limit :
    (29 : ℚ) / 1000 < (32 : ℚ) / 1000 := by
  norm_num

/-- Even the largest value in the historical proposed fhat=[4,10]
    interval, attained at its lower endpoint, lies below 0.02. -/
theorem source_lower_endpoint_below_claimed_detection_band :
    sourceR 55 4 < (2 : ℚ) / 100 := by
  norm_num [sourceR]

/-- Forward encoding factors through the product N*fhat; inverse recovery
    from a single scalar r cannot determine those two inputs separately. -/
theorem same_product_same_readout
    (n fhat n' fhat' : ℚ) (h : n * fhat = n' * fhat') :
    sourceR n fhat = sourceR n' fhat' := by
  unfold sourceR
  have ha : n^2 * fhat^2 = (n * fhat)^2 := by ring
  have hb : n'^2 * fhat'^2 = (n' * fhat')^2 := by ring
  rw [ha, hb, h]

#print axioms source_nominal_value
#print axioms historical_table_not_formula
#print axioms printed_to_formula_factor
#print axioms literal_formula_below_measured_limit
#print axioms printed_table_below_measured_limit
#print axioms source_lower_endpoint_below_claimed_detection_band
#print axioms same_product_same_readout

end HsHVerification.NadirModule8HBK18Gate
