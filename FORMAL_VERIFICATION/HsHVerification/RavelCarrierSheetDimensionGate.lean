import Mathlib

/-!
# Ravel carrier / finite-core / timesheet dimension gate

## Source constraints (not a single settled construction)

- The July 2025 SAT.O Official Directives source (raw Git blob
  `167136310cdf33ca8f986f33634692314c1a0946`) describes a 4D manifold
  populated by 1D filaments and a propagating 3D wavefront.
- The June 2025 SAT4D Canonical Summary extraction (raw Git blob
  `2a79fe25018cce7e99a2c33786d88b0551db6ae7`) defines a 1D curve
  `gamma : R -> R^(3,1)` and separately calls the 4D volume swept by a
  vibrating filament its worldtube.
- Nathan's 2026-10-09 Meridian Free Build statements (raw conversation blob
  `7af1561b321f4d9364da5eb111df689efc652827`) distinguish the helical core,
  hollow outer winding, a 3D intersectional trace, and an interacting 3D
  timesheet bulk. They do not supply the embedding/thickening or response map.
- The 2024 DIMENSIONAL GRAVITY construction (raw conversation blob
  `2cea1924266418e19b825b95ae51e6b7cbace7e1`) is explicitly a geometric
  heuristic, not an assertion of physical ontology.

The later phrase "4D filament" is therefore not silently identified with the
1D SAT.O curve, the 4D worldtube volume, or a 4D intrinsic support. Those are
different typed candidates until an explicit map is recovered.

## Formal scope

The arithmetic below assumes a 4D ambient space and a 3D timesheet. The
intrinsic dimension `k` of the carrier remains a parameter. The formulas are
the standard expected-dimension/codimension bookkeeping **conditional on**
the relevant smooth embeddings, a chosen normal complement, and transversality.
They do not prove any of those geometric hypotheses.

The `4-k` normal-complement rank is numerically the same codimension that
appears in the existing `pdDegree` bookkeeping, but it is not the same object:
normal-fiber rank and Poincare-dual form degree must not be conflated.

A projection from a tube/timesheet pullback to a carrier/timesheet pullback is
also conditional. A tube-to-carrier retraction alone is insufficient: it must
preserve the timesheet, possibly through an explicit sheet reparameterization.
The structure below requires that law as input; it does not construct or
physically validate it.

No physical metric, tubular radius, constitutive law, electromagnetic current,
or empirical prediction is supplied by this module.
-/

namespace HsHVerification.RavelCarrierSheetDimensionGate

/-- Codimension arithmetic for a carrier in an ambient space.
    This represents normal-complement rank only when a suitable complement
    exists and the carrier dimension does not exceed the ambient dimension. -/
def normalComplementRank (ambient carrier : Nat) : Nat := ambient - carrier

/-- Nat-valued convenience for nonnegative expected dimensions only.
    When `left + right < ambient`, natural subtraction truncates the
    negative expected dimension to zero; use
    `expectedTransverseIntersectionOutcome` for the generic-empty case. -/
def expectedTransverseIntersectionDimension
    (left right ambient : Nat) : Nat :=
  left + right - ambient

/-- A typed result for a generic transverse-intersection dimension.
    Negative expected dimension is represented as generic emptiness with
    a positive deficit, not truncated to Nat zero. -/
inductive ExpectedTransverseIntersectionOutcome where
  | genericEmpty (deficit : Nat)
  | dimension (value : Nat)
  deriving DecidableEq, Repr

/-- Classify the expected generic transverse-intersection result while
    preserving the distinction between generic emptiness and a 0D point
    intersection. This is dimension bookkeeping conditional on
    transversality, not a proof that a particular physical intersection
    exists or is transverse. -/
def expectedTransverseIntersectionOutcome
    (left right ambient : Nat) : ExpectedTransverseIntersectionOutcome :=
  if h : left + right < ambient then
    .genericEmpty (ambient - (left + right))
  else
    .dimension (left + right - ambient)

/-- The carrier-slice dimension for a k-dimensional carrier and a 3D
    timesheet in a 4D ambient space, conditional on transversality. -/
theorem carrierSliceDimension_eq_k_minus_one
    (k : Nat) (hPositive : 1 ≤ k) (hBounded : k ≤ 4) :
    expectedTransverseIntersectionDimension k 3 4 = k - 1 := by
  change k + 3 - 4 = k - 1
  omega

/-- A 1D carrier generically meets a 3D timesheet in a 0D trace. -/
theorem lineCarrierSliceDimension_four_three :
    expectedTransverseIntersectionDimension 1 3 4 = 0 := by
  decide

/-- A full-dimensional 4D core region generically meets a 3D timesheet
    in a 3D slice. This is distinct from the 1D carrier intersection. -/
theorem fullCoreSliceDimension_four_three :
    expectedTransverseIntersectionDimension 4 3 4 = 3 := by
  decide

/-- A 1D carrier in a 4D ambient space has three normal directions,
    if a smooth embedded normal complement is defined. -/
theorem lineCarrierNormalComplementRank :
    normalComplementRank 4 1 = 3 := by
  decide

/-- A 4D carrier in the same 4D ambient space has no normal directions.
    A nontrivial finite core would then need intrinsic/internal structure
    or a different ambient space, not ordinary normal thickening. -/
theorem fullDimensionalCarrierNormalComplementRank :
    normalComplementRank 4 4 = 0 := by
  decide

/-- If a normal complement in 4D has positive rank, the carrier is
    strictly lower-dimensional than the ambient space. -/
theorem positiveNormalRank_implies_carrier_lt_four
    (k : Nat) (hPositive : 0 < normalComplementRank 4 k) :
    k < 4 := by
  simp [normalComplementRank] at hPositive
  omega

/-- Profile pair: (normal-complement rank, expected carrier/timesheet
    intersection dimension). The carrier dimension remains an input. -/
def carrierProfile (k : Nat) : Nat × Nat :=
  (normalComplementRank 4 k,
   expectedTransverseIntersectionDimension k 3 4)

theorem profile_one_dimensional_carrier :
    carrierProfile 1 = (3, 0) := by
  decide

theorem profile_two_dimensional_carrier :
    carrierProfile 2 = (2, 1) := by
  decide

theorem profile_three_dimensional_carrier :
    carrierProfile 3 = (1, 2) := by
  decide

theorem profile_four_dimensional_carrier :
    carrierProfile 4 = (0, 3) := by
  decide

/-- A 3D trace of a full 4D core region is not the same dimension as the
    transverse intersection of the 1D SAT.O carrier with the timesheet. -/
theorem line_trace_ne_full_core_slice :
    expectedTransverseIntersectionDimension 1 3 4 ≠
      expectedTransverseIntersectionDimension 4 3 4 := by
  decide


/-!
## Typed expected-intersection outcomes

The legacy Nat helper maps both a negative expected dimension and a genuine
zero-dimensional expected intersection to zero. The typed companion keeps
those cases distinct. Aldus independently identified this truncation hazard
in the 2026-11-02 cross-read of PR #1133 (comment #6573688058).
-/

/-- Two 1D carriers in a 4D ambient space have negative expected
    transverse-intersection dimension, hence generic emptiness. -/
theorem expected_two_lines_in_four_dimensions_is_generic_empty :
    expectedTransverseIntersectionOutcome 1 1 4 =
      .genericEmpty 2 := by
  decide

/-- A 1D carrier and a 3D timesheet in 4D have a 0D expected
    transverse intersection. -/
theorem expected_line_timesheet_in_four_dimensions_is_zero_dimensional :
    expectedTransverseIntersectionOutcome 1 3 4 =
      .dimension 0 := by
  decide

/-- A full 4D core region and a 3D timesheet in 4D have a 3D
    expected intersection. -/
theorem expected_full_core_timesheet_in_four_dimensions_is_three_dimensional :
    expectedTransverseIntersectionOutcome 4 3 4 =
      .dimension 3 := by
  decide

/-- Regression witness: the legacy Nat helper conflates a generic-empty
    1D/1D intersection with a genuine 0D 1D/3D intersection in 4D. -/
theorem legacy_nat_helper_conflates_empty_and_point :
    expectedTransverseIntersectionDimension 1 1 4 =
      expectedTransverseIntersectionDimension 1 3 4 := by
  decide

/-- The typed result separates the same two cases. -/
theorem typed_outcome_separates_empty_and_point :
    expectedTransverseIntersectionOutcome 1 1 4 ≠
      expectedTransverseIntersectionOutcome 1 3 4 := by
  decide

/-- In the nonnegative regime, the typed result agrees with the legacy
    Nat-valued dimension formula. -/
theorem nonnegative_outcome_agrees_with_nat_helper
    (left right ambient : Nat) (h : ambient ≤ left + right) :
    expectedTransverseIntersectionOutcome left right ambient =
      .dimension (expectedTransverseIntersectionDimension left right ambient) := by
  simp [expectedTransverseIntersectionOutcome,
    expectedTransverseIntersectionDimension, Nat.not_lt.mpr h]

#eval [carrierProfile 1, carrierProfile 2,
       carrierProfile 3, carrierProfile 4]
#eval [expectedTransverseIntersectionOutcome 1 1 4,
       expectedTransverseIntersectionOutcome 1 3 4,
       expectedTransverseIntersectionOutcome 4 3 4]

/-- A tube with a zero section and retraction does not automatically project
    its timesheet slice onto the carrier's timesheet slice. The extra
    `preservesSlice` field is the explicit compatibility condition needed
    to induce that map. -/
structure SliceCompatibleRetraction
    (Ambient Tube Carrier Sheet : Type*) where
  tubeEmbed : Tube → Ambient
  carrierEmbed : Carrier → Ambient
  sheetEmbed : Sheet → Ambient
  zeroSection : Carrier → Tube
  projectCarrier : Tube → Carrier
  sheetReparameterization : Sheet → Sheet
  project_zero : ∀ c, projectCarrier (zeroSection c) = c
  embed_zero : ∀ c, tubeEmbed (zeroSection c) = carrierEmbed c
  preservesSlice : ∀ t s, tubeEmbed t = sheetEmbed s →
    carrierEmbed (projectCarrier t) =
      sheetEmbed (sheetReparameterization s)

variable {Ambient Tube Carrier Sheet : Type*}

/-- Pullback of the tube embedding and the sheet embedding. -/
def tubeSheetPullback
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet) :=
  {p : Tube × Sheet // R.tubeEmbed p.1 = R.sheetEmbed p.2}

/-- Pullback of the carrier embedding and the sheet embedding. -/
def carrierSheetPullback
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet) :=
  {p : Carrier × Sheet // R.carrierEmbed p.1 = R.sheetEmbed p.2}

/-- The induced map exists only because `preservesSlice` is supplied. -/
def inducedCarrierSliceMap
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet)
    (p : tubeSheetPullback R) : carrierSheetPullback R :=
  ⟨(R.projectCarrier p.1.1, R.sheetReparameterization p.1.2),
    R.preservesSlice p.1.1 p.1.2 p.2⟩

theorem inducedMap_carrierProjection
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet)
    (p : tubeSheetPullback R) :
    (inducedCarrierSliceMap R p).1.1 =
      R.projectCarrier p.1.1 := by
  rfl

theorem inducedMap_sheetReparameterization
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet)
    (p : tubeSheetPullback R) :
    (inducedCarrierSliceMap R p).1.2 =
      R.sheetReparameterization p.1.2 := by
  rfl

theorem inducedMap_commutingWitness
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet)
    (p : tubeSheetPullback R) :
    R.carrierEmbed (R.projectCarrier p.1.1) =
      R.sheetEmbed (R.sheetReparameterization p.1.2) :=
  (inducedCarrierSliceMap R p).2

theorem project_retracts_zeroSection
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet)
    (c : Carrier) :
    R.projectCarrier (R.zeroSection c) = c :=
  R.project_zero c

theorem zeroSection_embedding_agrees_with_carrier
    (R : SliceCompatibleRetraction Ambient Tube Carrier Sheet)
    (c : Carrier) :
    R.tubeEmbed (R.zeroSection c) = R.carrierEmbed c :=
  R.embed_zero c


#print axioms carrierSliceDimension_eq_k_minus_one
#print axioms lineCarrierSliceDimension_four_three
#print axioms fullCoreSliceDimension_four_three
#print axioms lineCarrierNormalComplementRank
#print axioms fullDimensionalCarrierNormalComplementRank
#print axioms positiveNormalRank_implies_carrier_lt_four
#print axioms inducedMap_commutingWitness
#print axioms expected_two_lines_in_four_dimensions_is_generic_empty
#print axioms expected_line_timesheet_in_four_dimensions_is_zero_dimensional
#print axioms expected_full_core_timesheet_in_four_dimensions_is_three_dimensional
#print axioms legacy_nat_helper_conflates_empty_and_point
#print axioms typed_outcome_separates_empty_and_point
#print axioms nonnegative_outcome_agrees_with_nat_helper

end HsHVerification.RavelCarrierSheetDimensionGate
