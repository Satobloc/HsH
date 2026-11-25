import Mathlib
import HsHVerification.NadirWitnessCarryingComposition

/-!
# Rotoexpando atlas versus bare framed-sphere/UI projection

Source boundary:
- Rotoexpando Geometry: Definitions and Characterization, 2026-09-11,
  HSH_RESOURCES blob 5c21c6152482249e4432ded423b0040e70fc8b4f.
- The source defines a framed sphere as (c_i, r_i, F_i), gives adjacent
  relative data (Delta c, sigma, Q), and separately lists the candidate
  adjacent-order atlas (mu, nu, xi, Delta phi, Q, chi, a/D).
- The source explicitly leaves the nested-helix-to-framed-sphere map for
  later definition.

This module formalizes a data-contract consequence, not that missing
geometric map. It keeps mu separate from sigma and xi separate from a
normalized center offset until explicit bridge assumptions are supplied.
The frame pair retains F_i and F_j; a concrete SO(d) instance can form
Q = F_j * F_i^{-1}. No physical system, measured dataset, or H(s)H
prediction is instantiated here.
-/

namespace HsHVerification.NadirRotoexpandoUIProjection

universe uC uR uF uMu uNu uXi uPhase uChi uCore uOut

/-- Source-defined framed-sphere data (c_i, r_i, F_i). -/
structure FramedSphere
    (Center : Type uC) (Radius : Type uR) (Frame : Type uF) where
  center : Center
  radius : Radius
  frame : Frame

/-- A pair of adjacent framed spheres, retaining both centers, radii and frames. -/
abbrev FramedSpherePair
    (Center : Type uC) (Radius : Type uR) (Frame : Type uF) :=
  FramedSphere Center Radius Frame × FramedSphere Center Radius Frame

/--
The non-frame coordinates listed in the source's candidate adjacent-order
atlas. Q is represented by the two retained frames; mu and xi are deliberately
not identified with sigma and Delta c without additional bridge assumptions.
-/
structure RotoexpandoAtlasExtras
    (Mu : Type uMu) (Nu : Type uNu) (Xi : Type uXi)
    (Phase : Type uPhase) (Chirality : Type uChi)
    (CoreRatio : Type uCore) where
  mu : Mu
  nu : Nu
  xi : Xi
  deltaPhi : Phase
  chi : Chirality
  coreRatio : CoreRatio

/-- Full adjacent-order descriptor: two framed spheres plus the candidate atlas. -/
structure RotoexpandoAdjacentState
    (Center : Type uC) (Radius : Type uR) (Frame : Type uF)
    (Mu : Type uMu) (Nu : Type uNu) (Xi : Type uXi)
    (Phase : Type uPhase) (Chirality : Type uChi)
    (CoreRatio : Type uCore) where
  lower : FramedSphere Center Radius Frame
  upper : FramedSphere Center Radius Frame
  extras : RotoexpandoAtlasExtras Mu Nu Xi Phase Chirality CoreRatio

abbrev State
    (Center : Type uC) (Radius : Type uR) (Frame : Type uF)
    (Mu : Type uMu) (Nu : Type uNu) (Xi : Type uXi)
    (Phase : Type uPhase) (Chirality : Type uChi)
    (CoreRatio : Type uCore) :=
  RotoexpandoAdjacentState Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio

abbrev Extras
    (Mu : Type uMu) (Nu : Type uNu) (Xi : Type uXi)
    (Phase : Type uPhase) (Chirality : Type uChi)
    (CoreRatio : Type uCore) :=
  RotoexpandoAtlasExtras Mu Nu Xi Phase Chirality CoreRatio

variable {Center : Type uC} {Radius : Type uR} {Frame : Type uF}
variable {Mu : Type uMu} {Nu : Type uNu} {Xi : Type uXi}
variable {Phase : Type uPhase} {Chirality : Type uChi}
variable {CoreRatio : Type uCore}

def bareUI
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) :
    FramedSpherePair Center Radius Frame :=
  (s.lower, s.upper)

/-- Candidate augmented view: framed-sphere pair plus every listed atlas channel. -/
def candidateAtlasView
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) :
    FramedSpherePair Center Radius Frame × Extras Mu Nu Xi Phase Chirality CoreRatio :=
  (bareUI s, s.extras)

/-- Inverse descriptor reconstruction for the candidate augmented view. -/
def candidateAtlasUnview
    (view : FramedSpherePair Center Radius Frame × Extras Mu Nu Xi Phase Chirality CoreRatio) :
    State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio :=
  ⟨view.1.1, view.1.2, view.2⟩

/-- The augmented view has an explicit inverse on its image. -/
theorem candidateAtlasView_leftInverse
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) :
    candidateAtlasUnview (candidateAtlasView s) = s := by
  cases s
  rfl

/-- The augmented view is a left-invertible, hence injective, descriptor encoding. -/
theorem candidateAtlasView_injective :
    Function.Injective (candidateAtlasView (Center := Center) (Radius := Radius)
      (Frame := Frame) (Mu := Mu) (Nu := Nu) (Xi := Xi)
      (Phase := Phase) (Chirality := Chirality) (CoreRatio := CoreRatio)) := by
  intro x y h
  calc
    x = candidateAtlasUnview (candidateAtlasView x) :=
      (candidateAtlasView_leftInverse x).symm
    _ = candidateAtlasUnview (candidateAtlasView y) :=
      congrArg candidateAtlasUnview h
    _ = y := candidateAtlasView_leftInverse y

/-- Replacing atlas channels while keeping both framed spheres fixed. -/
def replaceExtras
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (extras : Extras Mu Nu Xi Phase Chirality CoreRatio) :
    State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio :=
  { s with extras := extras }

/-- The bare UI projection is unchanged when any atlas-only channel changes. -/
theorem bareUI_replaceExtras
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (extras : Extras Mu Nu Xi Phase Chirality CoreRatio) :
    bareUI (replaceExtras s extras) = bareUI s := rfl

/-- Distinct atlas metadata produce distinct full states. -/
theorem replaceExtras_ne_of_ne
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (extras : Extras Mu Nu Xi Phase Chirality CoreRatio)
    (hne : extras ≠ s.extras) :
    replaceExtras s extras ≠ s := by
  intro h
  exact hne (congrArg (fun z : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio => z.extras) h)

/-- The bare framed-sphere/UI projection has a nontrivial fibre whenever extras vary. -/
theorem bareUI_has_distinct_extra_fiber
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (extras : Extras Mu Nu Xi Phase Chirality CoreRatio)
    (hne : extras ≠ s.extras) :
    ∃ t : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio,
      t ≠ s ∧ bareUI t = bareUI s := by
  exact ⟨replaceExtras s extras,
    replaceExtras_ne_of_ne s extras hne,
    bareUI_replaceExtras s extras⟩

/-- Therefore the bare UI projection is not injective when an atlas channel can vary. -/
theorem bareUI_not_injective_of_extra_variation
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (extras : Extras Mu Nu Xi Phase Chirality CoreRatio)
    (hne : extras ≠ s.extras) :
    ¬ Function.Injective (bareUI (Center := Center) (Radius := Radius)
      (Frame := Frame) (Mu := Mu) (Nu := Nu) (Xi := Xi)
      (Phase := Phase) (Chirality := Chirality) (CoreRatio := CoreRatio)) := by
  intro hinj
  exact replaceExtras_ne_of_ne s extras hne
    (hinj (bareUI_replaceExtras s extras))

open HsHVerification.NadirProjectionCoarseGrainFactorization

/--
A readout descends to a deterministic, witness-carrying function on the bare
UI image iff it is constant on every bare-UI fibre. This specializes the
existing generic Nadir factorization theorem; it is not a new physical map.
-/
theorem bareUI_readout_factors_iff_fiberwise
    {Output : Type uOut}
    (readout : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio → Output) :
    (∃ induced : Set.range bareUI → Set.range readout,
      ∀ s, induced (imageProjection bareUI s) = imageProjection readout s) ↔
    (∀ s t, bareUI s = bareUI t → readout s = readout t) := by
  simpa using
    HsHVerification.NadirWitnessCarryingComposition.rangeFactorization_iff_fiberwise
      bareUI (fun s => s) readout

/--
Any readout that changes when atlas metadata change, while the framed-sphere
pair is held fixed, cannot be represented by a deterministic function of
bare UI alone.
-/
theorem no_bareUI_factorization_of_extra_sensitive_readout
    {Output : Type uOut}
    (readout : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio → Output)
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (extras : Extras Mu Nu Xi Phase Chirality CoreRatio)
    (hSensitive : readout (replaceExtras s extras) ≠ readout s) :
    ¬ ∃ induced : Set.range bareUI → Set.range readout,
      ∀ t, induced (imageProjection bareUI t) = imageProjection readout t := by
  intro hFactor
  have hFiber :=
    (bareUI_readout_factors_iff_fiberwise readout).mp hFactor
  exact hSensitive
    (hFiber (replaceExtras s extras) s (bareUI_replaceExtras s extras))

def relativePhaseReadout
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) : Phase :=
  s.extras.deltaPhi

def coreRatioReadout
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) : CoreRatio :=
  s.extras.coreRatio

/-- A phase-sensitive readout cannot descend through the bare framed-sphere/UI projection. -/
theorem relativePhase_readout_does_not_factor
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (phase : Phase) (hphase : phase ≠ s.extras.deltaPhi) :
    ¬ ∃ induced :
      Set.range (@bareUI Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) →
      Set.range (@relativePhaseReadout Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio),
      ∀ t, induced (imageProjection bareUI t) =
        imageProjection (@relativePhaseReadout Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) t := by
  apply no_bareUI_factorization_of_extra_sensitive_readout
    (readout := @relativePhaseReadout Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (s := s)
    (extras := { s.extras with deltaPhi := phase })
  simpa [relativePhaseReadout, replaceExtras] using hphase

/-- A finite-core-ratio readout cannot descend through bare UI when that ratio varies. -/
theorem coreRatio_readout_does_not_factor
    (s : State Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (coreRatio : CoreRatio) (hcore : coreRatio ≠ s.extras.coreRatio) :
    ¬ ∃ induced :
      Set.range (@bareUI Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) →
      Set.range (@coreRatioReadout Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio),
      ∀ t, induced (imageProjection bareUI t) =
        imageProjection (@coreRatioReadout Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio) t := by
  apply no_bareUI_factorization_of_extra_sensitive_readout
    (readout := @coreRatioReadout Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio)
    (s := s)
    (extras := { s.extras with coreRatio := coreRatio })
  simpa [coreRatioReadout, replaceExtras] using hcore

#print axioms candidateAtlasView_injective
#print axioms bareUI_not_injective_of_extra_variation
#print axioms bareUI_readout_factors_iff_fiberwise
#print axioms no_bareUI_factorization_of_extra_sensitive_readout
#print axioms relativePhase_readout_does_not_factor
#print axioms coreRatio_readout_does_not_factor

end HsHVerification.NadirRotoexpandoUIProjection


/-!
## Point-pair / oriented-segment source equivalence

The Rotoexpando geometry source writes an ordered endpoint pair as an
oriented affine segment. The parameter interval retains the endpoint order.
This section proves exact endpoint recovery and injectivity on that
parameterized-segment representation. It does not identify arbitrary
curves, helices, framed spheres, phase oscillators, or toroidal windings.
-/

namespace HsHVerification.NadirRotoexpandoUIProjection.PointPairSegment

/-- Coordinate points in a finite-dimensional real affine model. -/
abbrev CoordinatePoint (d : ℕ) := Fin d → ℝ

/-- The closed unit interval supplies an ordered segment parameter. -/
abbrev ClosedUnitInterval := Set.Icc (0 : ℝ) 1

/-- The oriented affine segment from p to q, parameterized from p at 0 to q at 1. -/
def orientedAffineSegment {d : ℕ} (p q : CoordinatePoint d) :
    ClosedUnitInterval → CoordinatePoint d :=
  fun u i => p i + (u : ℝ) * (q i - p i)

/-- Recover the ordered endpoints from a parameterized segment. -/
def orientedSegmentEndpoints {d : ℕ}
    (s : ClosedUnitInterval → CoordinatePoint d) :
    CoordinatePoint d × CoordinatePoint d :=
  (s ⟨0, by norm_num⟩, s ⟨1, by norm_num⟩)

/-- Endpoint recovery is a left inverse of the point-pair-to-segment map. -/
theorem orientedSegmentEndpoints_orientedAffineSegment
    {d : ℕ} (p q : CoordinatePoint d) :
    orientedSegmentEndpoints (orientedAffineSegment p q) = (p, q) := by
  apply Prod.ext
  · ext i
    simp [orientedSegmentEndpoints, orientedAffineSegment]
  · ext i
    simp [orientedSegmentEndpoints, orientedAffineSegment]

/-- Consequently, the parameterized oriented segment uniquely determines
its ordered endpoint pair. This is injectivity on the affine-segment image,
not a claim that every curve is an affine segment. -/
theorem orientedAffineSegment_injective {d : ℕ} :
    Function.Injective (fun pq : CoordinatePoint d × CoordinatePoint d =>
      orientedAffineSegment pq.1 pq.2) := by
  intro a b h
  have h' := congrArg orientedSegmentEndpoints h
  rw [orientedSegmentEndpoints_orientedAffineSegment,
      orientedSegmentEndpoints_orientedAffineSegment] at h'
  exact h'

end HsHVerification.NadirRotoexpandoUIProjection.PointPairSegment

#print axioms HsHVerification.NadirRotoexpandoUIProjection.PointPairSegment.orientedSegmentEndpoints_orientedAffineSegment
#print axioms HsHVerification.NadirRotoexpandoUIProjection.PointPairSegment.orientedAffineSegment_injective


/-!
## Conditional origin-anchor fraction for a radial connector

The March 2026 direct-source geometry describes a connector joining points on
two coordinate spheres and passing through the origin. This subsection
formalizes only the radial, antipodal special case: the second endpoint is a
positive scalar multiple of the first endpoint with reversed direction.
It does not assert that the source curves, later R/Q/GrAnn toy, or any physical
system satisfy this special case.
-/

/-- The opposite-ray endpoint obtained by positive radial scale σ. -/
def antipodalScaledEndpoint {d : ℕ} (p : CoordinatePoint d) (σ : ℝ) :
    CoordinatePoint d :=
  fun i => -σ * p i

/-- The oriented segment from p to -σ p reaches the origin at the
affine parameter u = 1 / (1 + σ), for every positive scale σ. -/
theorem origin_on_antipodal_scaled_segment
    {d : ℕ} (p : CoordinatePoint d) {σ : ℝ} (hσ : 0 < σ) :
    orientedAffineSegment p (antipodalScaledEndpoint p σ)
      ⟨1 / (1 + σ), by positivity, by
        have hden : 0 < 1 + σ := by linarith
        rw [div_le_one hden]
        linarith⟩
      = fun _ => 0 := by
  funext i
  simp [orientedAffineSegment, antipodalScaledEndpoint]
  field_simp [ne_of_gt (show 0 < 1 + σ by linarith)]
  <;> ring

/-- When σ is the outer-to-inner radius ratio rⱼ/rᵢ, the origin's
segment parameter is rᵢ/(rᵢ+rⱼ). This is a conditional scalar bridge to
the Hagalaz relative scale, not an assertion that the source defines
antipodal endpoints. -/
theorem origin_anchor_fraction_eq_radius_ratio
    {r_i r_j : ℝ} (h_i : 0 < r_i) (h_j : 0 < r_j) :
    1 / (1 + r_j / r_i) = r_i / (r_i + r_j) := by
  field_simp [ne_of_gt h_i, ne_of_gt (add_pos h_i h_j)]
  <;> ring

#print axioms origin_on_antipodal_scaled_segment
#print axioms origin_anchor_fraction_eq_radius_ratio
