import Mathlib

/-!
Mercer, Workshop Relay :36, 2026-10-29 00:36 UTC.

Source-critical evidence-role gate for Tang et al., Nature Communications
14, 2941 (2023), DOI 10.1038/s41467-023-38787-w.

The published two-particle event reports the image-derived projected initial
half-separation d_p(0)/2 = 140.6 micrometres and says the S2W model reproduces
the data at the optimal fitted initial ring radius R(0) = 140.8 micrometres.
The source calls their numerical closeness suggestive of particles nearly
across the diameter. It does not make 140.8 micrometres an independent
prediction of the 140.6 micrometre observation.

These exact rationals encode source-rounded printed values and evidence labels.
Lean proves only the propositions below. It does not prove that the labels
faithfully translate the paper, validate S2W or H(s)H, supply missing
uncertainties/covariance, or establish empirical significance.
-/

namespace HsHVerification.MercerTangEvidenceRole

inductive QuantityKind where
  | projectedHalfSeparation
  | ringRadius
  deriving DecidableEq, Repr

inductive EvidenceRole where
  | imageDerivedObservation
  | sameEventModelFit
  | independentPrediction
  deriving DecidableEq, Repr

structure TaggedQuantity where
  valueMicrometres : ℚ
  kind : QuantityKind
  role : EvidenceRole
  deriving DecidableEq, Repr

def observedHalfSeparation : TaggedQuantity :=
  { valueMicrometres := 703 / 5
    kind := .projectedHalfSeparation
    role := .imageDerivedObservation }

def fittedInitialRadius : TaggedQuantity :=
  { valueMicrometres := 704 / 5
    kind := .ringRadius
    role := .sameEventModelFit }

/-- A prediction-versus-observation comparison requires both independent
prediction provenance and the same observable kind. This is a workflow gate,
not a physical law. -/
def AdmissibleIndependentComparison
    (prediction observation : TaggedQuantity) : Prop :=
  prediction.role = .independentPrediction ∧
  observation.role = .imageDerivedObservation ∧
  prediction.kind = observation.kind

theorem printed_value_gap_is_one_fifth_micrometre :
    fittedInitialRadius.valueMicrometres -
      observedHalfSeparation.valueMicrometres = (1 / 5 : ℚ) := by
  norm_num [fittedInitialRadius, observedHalfSeparation]

theorem same_event_fit_is_not_independent_prediction :
    fittedInitialRadius.role ≠ .independentPrediction := by
  decide

theorem radius_and_projected_half_separation_are_distinct_kinds :
    fittedInitialRadius.kind ≠ observedHalfSeparation.kind := by
  decide

theorem source_pair_is_not_an_admissible_independent_comparison :
    ¬ AdmissibleIndependentComparison fittedInitialRadius
        observedHalfSeparation := by
  simp [AdmissibleIndependentComparison, fittedInitialRadius,
    observedHalfSeparation]

theorem numerical_nearness_does_not_retag_evidence :
    fittedInitialRadius.valueMicrometres -
        observedHalfSeparation.valueMicrometres = (1 / 5 : ℚ) ∧
      fittedInitialRadius.role = .sameEventModelFit ∧
      fittedInitialRadius.role ≠ .independentPrediction := by
  constructor
  · exact printed_value_gap_is_one_fifth_micrometre
  constructor <;> decide

#print axioms printed_value_gap_is_one_fifth_micrometre
#print axioms same_event_fit_is_not_independent_prediction
#print axioms radius_and_projected_half_separation_are_distinct_kinds
#print axioms source_pair_is_not_an_admissible_independent_comparison
#print axioms numerical_nearness_does_not_retag_evidence

end HsHVerification.MercerTangEvidenceRole
