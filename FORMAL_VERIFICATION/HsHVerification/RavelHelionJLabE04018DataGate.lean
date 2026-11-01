import Mathlib

/-!
# Ravel: JLab Hall A E04-018 helion form-factor data gate (2017)

Source: A. Camsonne et al., "JLab Measurements of the 3He Form Factors at
Large Momentum Transfers", Phys. Rev. Lett. 119, 162501 (2017),
arXiv:1610.07456v1, DOI 10.1103/PhysRevLett.119.162501.

The encoded values are Table II's published *absolute magnitudes* |F_C| and
|F_M| at the listed effective Q^2 values Q^2_eff (fm^-2). The table reports
total errors with statistical and systematic components added in quadrature.
Each form-factor value and its quoted sigma is stored as an integer in units
of 10^-7; Q^2_eff is stored in tenths of fm^-2.

Important source limitations preserved as data gates:
* At Q^2_eff = 49.0 fm^-2, the experiment used only a forward angle and
  extracted F_C under the assumption that F_M did not contribute. Table II
  has no F_M entry at this point.
* At Q^2_eff = 60.8 fm^-2, the quoted F_C sigma (2.10e-5) exceeds its
  central magnitude (1.00e-5), so its one-sigma interval contains zero.
* The table contains absolute magnitudes, not signed form factors. It cannot
  by itself establish a sign change or a precise zero location.
* The experiment uses a Coulomb-distortion effective-Q^2 correction and
  does not include a two-photon-exchange correction in its radiative
  correction implementation.

These are exact finite arithmetic checks on a published extracted table.
They are not a reconstruction of raw events, a covariance analysis, a
worldtube-to-current map, an H(s)H prediction, or physical validation.
-/

namespace HsHVerification.RavelHelionJLabE04018

/-- Published magnitude and total one-sigma error, both scaled by 10^7. -/
structure MagnitudeMeasurement where
  value : Nat
  sigma : Nat
deriving DecidableEq, Repr

/-- One row of Table II, with Q^2_eff stored in tenths of fm^-2. -/
structure FormFactorPoint where
  q2EffTenths : Nat
  fc : MagnitudeMeasurement
  fm : Option MagnitudeMeasurement
deriving DecidableEq, Repr

def q24_7 : FormFactorPoint :=
  ⟨247, ⟨26500, 600⟩, some ⟨6030, 910⟩⟩

def q30_2 : FormFactorPoint :=
  ⟨302, ⟨15800, 500⟩, some ⟨4210, 750⟩⟩

def q34_1 : FormFactorPoint :=
  ⟨341, ⟨9730, 340⟩, some ⟨3070, 350⟩⟩

def q40_2 : FormFactorPoint :=
  ⟨402, ⟨5320, 210⟩, some ⟨1240, 270⟩⟩

def q45_0 : FormFactorPoint :=
  ⟨450, ⟨3020, 160⟩, some ⟨637, 183⟩⟩

def q49_0 : FormFactorPoint :=
  ⟨490, ⟨1810, 150⟩, none⟩

def q55_1 : FormFactorPoint :=
  ⟨551, ⟨697, 72⟩, some ⟨334, 100⟩⟩

def q60_8 : FormFactorPoint :=
  ⟨608, ⟨100, 210⟩, some ⟨234, 90⟩⟩

def table : List FormFactorPoint :=
  [q24_7, q30_2, q34_1, q40_2, q45_0, q49_0, q55_1, q60_8]

def magneticHoldoutTable : List FormFactorPoint :=
  table.filter (fun p => p.fm.isSome)

/-- Relative one-sigma error of a positive published magnitude. -/
def relativeError (m : MagnitudeMeasurement) : ℚ :=
  (m.sigma : ℚ) / (m.value : ℚ)

theorem table_has_eight_rows : table.length = 8 := by
  rfl

theorem effective_q2_rows_are_strictly_increasing :
    List.Pairwise (fun a b => a.q2EffTenths < b.q2EffTenths) table := by
  decide

theorem q49_0_has_no_magnetic_extraction :
    q49_0.fm = none := by
  rfl

theorem q49_0_is_excluded_from_magnetic_holdout :
    q49_0 ∉ magneticHoldoutTable := by
  decide

theorem q60_8_charge_sigma_exceeds_central_magnitude :
    q60_8.fc.sigma > q60_8.fc.value := by
  decide

theorem q60_8_charge_one_sigma_interval_contains_zero :
    (q60_8.fc.value : ℚ) - q60_8.fc.sigma ≤ 0 ∧
      0 ≤ (q60_8.fc.value : ℚ) + q60_8.fc.sigma := by
  norm_num [q60_8]

theorem q60_8_charge_relative_error_gt_two :
    2 < relativeError q60_8.fc := by
  norm_num [relativeError, q60_8]

theorem q55_1_magnetic_relative_error_gt_one_quarter :
    (1 : ℚ) / 4 < relativeError (MagnitudeMeasurement.mk 334 100) := by
  norm_num [relativeError]

theorem q60_8_magnetic_relative_error_gt_one_third :
    (1 : ℚ) / 3 < relativeError (MagnitudeMeasurement.mk 234 90) := by
  norm_num [relativeError]

theorem q24_7_charge_relative_error_lt_one_fortieth :
    relativeError q24_7.fc < (1 : ℚ) / 40 := by
  norm_num [relativeError, q24_7]

#print axioms table_has_eight_rows
#print axioms effective_q2_rows_are_strictly_increasing
#print axioms q49_0_has_no_magnetic_extraction
#print axioms q49_0_is_excluded_from_magnetic_holdout
#print axioms q60_8_charge_sigma_exceeds_central_magnitude
#print axioms q60_8_charge_one_sigma_interval_contains_zero
#print axioms q60_8_charge_relative_error_gt_two
#print axioms q55_1_magnetic_relative_error_gt_one_quarter
#print axioms q60_8_magnetic_relative_error_gt_one_third
#print axioms q24_7_charge_relative_error_lt_one_fortieth

end HsHVerification.RavelHelionJLabE04018
