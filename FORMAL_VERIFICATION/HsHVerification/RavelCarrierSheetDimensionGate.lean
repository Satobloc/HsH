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

/-- Expected dimension of a transverse intersection of submanifolds with
    dimensions `left` and `right` in an `ambient`-dimensional manifold. -/
def expectedTransverseIntersectionDimension
    (left right ambient : Nat) : Nat :=
  left + right - ambient

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

#eval [carrierProfile 1, carrierProfile 2,
       carrierProfile 3, carrierProfile 4]

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

end HsHVerification.RavelCarrierSheetDimensionGate
