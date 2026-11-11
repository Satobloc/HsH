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

variable {Center : Type uC} {Radius : Type uR} {Frame : Type uF}
variable {Mu : Type uMu} {Nu : Type uNu} {Xi : Type uXi}
variable {Phase : Type uPhase} {Chirality : Type uChi}
variable {CoreRatio : Type uCore}

abbrev State :=
  RotoexpandoAdjacentState Center Radius Frame Mu Nu Xi Phase Chirality CoreRatio

abbrev Extras :=
  RotoexpandoAtlasExtras Mu Nu Xi Phase Chirality CoreRatio

/--
Bare UI projection: retain only the two framed spheres. This is enough to
derive (Delta c, sigma, Q) once the center, radius and frame operations are
instantiated, but it does not itself retain the other candidate-atlas channels.
-/
def bareUI (s : State) : FramedSpherePair Center Radius Frame :=
  (s.lower, s.upper)

/-- Candidate augmented view: framed-sphere pair plus every listed atlas channel. -/
def candidateAtlasView (s : State) : FramedSpherePair Center Radius Frame × Extras :=
  (bareUI s, s.extras)

/-- Replacing atlas channels while keeping both framed spheres fixed. -/
def replaceExtras (s : State) (extras : Extras) : State :=
  { s with extras := extras }

/-- The candidate augmented view is injective at the descriptor level. -/
theorem candidateAtlasView_injective :
    Function.Injective (candidateAtlasView (Center := Center) (Radius := Radius)
      (Frame := Frame) (Mu := Mu) (Nu := Nu) (Xi := Xi)
      (Phase := Phase) (Chirality := Chirality) (CoreRatio := CoreRatio)) := by
  intro x y h
  cases x with
  | mk xLower xUpper xExtras =>
    cases y with
    | mk yLower yUpper yExtras =>
      simp [candidateAtlasView, bareUI] at h
      rcases h with ⟨hLower, hUpper, hExtras⟩
      cases hLower
      cases hUpper
      cases hExtras
      rfl

/-- The bare UI projection is unchanged when any atlas-only channel changes. -/
theorem bareUI_replaceExtras (s : State) (extras : Extras) :
    bareUI (replaceExtras s extras) = bareUI s := rfl

/-- Distinct atlas metadata produce distinct full states. -/
theorem replaceExtras_ne_of_ne (s : State) (extras : Extras)
    (hne : extras ≠ s.extras) :
    replaceExtras s extras ≠ s := by
  intro h
  exact hne (congrArg (fun z : State => z.extras) h)

/-- The bare framed-sphere/UI projection has a nontrivial fibre whenever extras vary. -/
theorem bareUI_has_distinct_extra_fiber (s : State) (extras : Extras)
    (hne : extras ≠ s.extras) :
    ∃ t : State, t ≠ s ∧ bareUI t = bareUI s := by
  exact ⟨replaceExtras s extras,
    replaceExtras_ne_of_ne s extras hne,
    bareUI_replaceExtras s extras⟩

/-- Therefore the bare UI projection is not injective when an atlas channel can vary. -/
theorem bareUI_not_injective_of_extra_variation (s : State) (extras : Extras)
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
    {Output : Type uOut} (readout : State → Output) :
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
    {Output : Type uOut} (readout : State → Output)
    (s : State) (extras : Extras)
    (hSensitive : readout (replaceExtras s extras) ≠ readout s) :
    ¬ ∃ induced : Set.range bareUI → Set.range readout,
      ∀ t, induced (imageProjection bareUI t) = imageProjection readout t := by
  intro hFactor
  have hFiber :=
    (bareUI_readout_factors_iff_fiberwise readout).mp hFactor
  exact hSensitive
    (hFiber (replaceExtras s extras) s (bareUI_replaceExtras s extras))

def relativePhaseReadout (s : State) : Phase := s.extras.deltaPhi

def replaceRelativePhase (s : State) (phase : Phase) : State :=
  { s with extras := { s.extras with deltaPhi := phase } }

/-- A phase-sensitive readout cannot descend through the bare framed-sphere/UI projection. -/
theorem relativePhase_readout_does_not_factor
    (s : State) (phase : Phase) (hphase : phase ≠ s.extras.deltaPhi) :
    ¬ ∃ induced : Set.range bareUI → Set.range relativePhaseReadout,
      ∀ t, induced (imageProjection bareUI t) = imageProjection relativePhaseReadout t := by
  apply no_bareUI_factorization_of_extra_sensitive_readout
    (readout := relativePhaseReadout) (s := s)
    (extras := { s.extras with deltaPhi := phase })
  simpa [relativePhaseReadout, replaceExtras] using hphase

def coreRatioReadout (s : State) : CoreRatio := s.extras.coreRatio

/-- A finite-core-ratio readout cannot descend through bare UI when that ratio varies. -/
theorem coreRatio_readout_does_not_factor
    (s : State) (coreRatio : CoreRatio)
    (hcore : coreRatio ≠ s.extras.coreRatio) :
    ¬ ∃ induced : Set.range bareUI → Set.range coreRatioReadout,
      ∀ t, induced (imageProjection bareUI t) = imageProjection coreRatioReadout t := by
  apply no_bareUI_factorization_of_extra_sensitive_readout
    (readout := coreRatioReadout) (s := s)
    (extras := { s.extras with coreRatio := coreRatio })
  simpa [coreRatioReadout, replaceExtras] using hcore

#print axioms candidateAtlasView_injective
#print axioms bareUI_not_injective_of_extra_variation
#print axioms bareUI_readout_factors_iff_fiberwise
#print axioms no_bareUI_factorization_of_extra_sensitive_readout
#print axioms relativePhase_readout_does_not_factor
#print axioms coreRatio_readout_does_not_factor

end HsHVerification.NadirRotoexpandoUIProjection
