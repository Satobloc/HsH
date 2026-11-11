import Mathlib

/-!
# Ariadne antipodal contour readout

Source: Jason Barckicke, Eric Falcon & Christophe Gissinger,
"Kelvin wave propagation along vortex cores", Nature Physics 22, 409–414
(2026), DOI 10.1038/s41567-026-03175-w, published 10 February 2026.
The source data are identified at Figshare DOI 10.6084/m9.figshare.30903347.

For fixed (z,t), the Methods define the two measured antipodal contour samples
r₀ = r(z,t,θ=0) and rπ = r(z,t,θ=π), then define

  a(z,t) = (r₀ + rπ) / 2
  η(z,t) = (r₀ - rπ) / 2.

This module proves two distinct facts:

1. The transformation from the two sampled radii (r₀,rπ) to (a,η) is
   bijective. No information is lost by this two-channel reparameterization.
2. Sampling an otherwise arbitrary angular profile at only two angles is
   non-injective whenever a third angle exists outside the sampled pair.
   Therefore the pair (a,η) does not reconstruct the full angular contour.

The result is pointwise in (z,t). It does not establish a 3D surface
reconstruction, unique Fourier-mode recovery, the physical validity of the
Rankine model, the dispersion relation, or an H(s)H worldtube/timesheet map.
It formalizes only the source-defined measurement/readout map.
-/

namespace HsHVerification.AriadneAntipodalContourReadout

abbrev AngularProfile (Angle : Type*) := Angle → ℝ

/-- The two contour samples at the selected angular positions. -/
def samplePair {Angle : Type*} (θ₀ θπ : Angle)
    (r : AngularProfile Angle) : ℝ × ℝ :=
  (r θ₀, r θπ)

/-- Source-defined channels: mean core radius and half-difference displacement. -/
noncomputable def toRadiusDisplacement (samples : ℝ × ℝ) : ℝ × ℝ :=
  ((samples.1 + samples.2) / 2, (samples.1 - samples.2) / 2)

/-- Inverse transformation from (a,η) to the two sampled radii. -/
def fromRadiusDisplacement (channels : ℝ × ℝ) : ℝ × ℝ :=
  (channels.1 + channels.2, channels.1 - channels.2)

theorem from_toRadiusDisplacement (samples : ℝ × ℝ) :
    fromRadiusDisplacement (toRadiusDisplacement samples) = samples := by
  rcases samples with ⟨r₀, rπ⟩
  apply Prod.ext
  · dsimp [fromRadiusDisplacement, toRadiusDisplacement]
    field_simp
    ring
  · dsimp [fromRadiusDisplacement, toRadiusDisplacement]
    field_simp
    ring

theorem to_fromRadiusDisplacement (channels : ℝ × ℝ) :
    toRadiusDisplacement (fromRadiusDisplacement channels) = channels := by
  rcases channels with ⟨a, η⟩
  simp [fromRadiusDisplacement, toRadiusDisplacement]

theorem toRadiusDisplacement_injective :
    Function.Injective toRadiusDisplacement := by
  intro x y h
  calc
    x = fromRadiusDisplacement (toRadiusDisplacement x) :=
      (from_toRadiusDisplacement x).symm
    _ = fromRadiusDisplacement (toRadiusDisplacement y) :=
      congrArg fromRadiusDisplacement h
    _ = y := from_toRadiusDisplacement y

theorem toRadiusDisplacement_surjective :
    Function.Surjective toRadiusDisplacement := by
  intro channels
  exact ⟨fromRadiusDisplacement channels, to_fromRadiusDisplacement channels⟩

theorem toRadiusDisplacement_bijective :
    Function.Bijective toRadiusDisplacement :=
  ⟨toRadiusDisplacement_injective, toRadiusDisplacement_surjective⟩

/-- The source-defined two-channel readout of an angular contour. -/
noncomputable def radiusDisplacementReadout {Angle : Type*} (θ₀ θπ : Angle)
    (r : AngularProfile Angle) : ℝ × ℝ :=
  toRadiusDisplacement (samplePair θ₀ θπ r)

/-- Equality of readout channels is equivalent to equality of the two
    underlying sampled contour values. The invertible channel transform
    adds no further information loss. -/
theorem radiusDisplacementReadout_eq_iff_samplePair_eq
    {Angle : Type*} (θ₀ θπ : Angle) (r₁ r₂ : AngularProfile Angle) :
    radiusDisplacementReadout θ₀ θπ r₁ = radiusDisplacementReadout θ₀ θπ r₂ ↔
      samplePair θ₀ θπ r₁ = samplePair θ₀ θπ r₂ := by
  constructor
  · intro h
    have h' :
        toRadiusDisplacement (samplePair θ₀ θπ r₁) =
          toRadiusDisplacement (samplePair θ₀ θπ r₂) := by
      simpa [radiusDisplacementReadout] using h
    exact toRadiusDisplacement_injective h'
  · intro h
    exact congrArg toRadiusDisplacement h

/-- Two angular samples cannot identify an arbitrary profile if a third
    angular position is available outside the sampled pair. -/
theorem samplePair_not_injective
    {Angle : Type*} [DecidableEq Angle]
    (θ₀ θπ θ₁ : Angle)
    (h₁₀ : θ₁ ≠ θ₀) (h₁π : θ₁ ≠ θπ) :
    ¬ Function.Injective (samplePair θ₀ θπ) := by
  intro hInjective
  let f : AngularProfile Angle := fun _ => 0
  let g : AngularProfile Angle := fun θ => if θ = θ₁ then 1 else 0
  have hSamples : samplePair θ₀ θπ f = samplePair θ₀ θπ g := by
    simp [samplePair, f, g, Ne.symm h₁₀, Ne.symm h₁π]
  have hFunctions : f = g := hInjective hSamples
  have hAtWitness := congrFun hFunctions θ₁
  norm_num [f, g] at hAtWitness

/-- The composed two-channel readout is also non-injective on arbitrary
    angular profiles. Its information loss occurs in two-point sampling,
    not in the invertible (r₀,rπ) ↔ (a,η) coordinate change. -/
theorem radiusDisplacementReadout_not_injective
    {Angle : Type*} [DecidableEq Angle]
    (θ₀ θπ θ₁ : Angle)
    (h₁₀ : θ₁ ≠ θ₀) (h₁π : θ₁ ≠ θπ) :
    ¬ Function.Injective (radiusDisplacementReadout θ₀ θπ) := by
  intro hReadoutInjective
  apply samplePair_not_injective θ₀ θπ θ₁ h₁₀ h₁π
  intro r₁ r₂ hSamples
  have hReadout :
      radiusDisplacementReadout θ₀ θπ r₁ =
        radiusDisplacementReadout θ₀ θπ r₂ := by
    simpa [radiusDisplacementReadout] using congrArg toRadiusDisplacement hSamples
  exact hReadoutInjective hReadout

/-!
## Conditional modal-separation gate

The source Methods state that combining the left- and right-hand profiles into
core position and radius selects the m = 1 contribution for position and the
other reported modes for radius. The arbitrary-profile non-injectivity result
above does not contradict that source-specific claim: it concerns all
functions, whereas modal separation requires restrictions on the admissible
mode family.

The following theorem makes a sufficient two-sample condition explicit. It
does NOT derive that condition from the Euler/Rankine model or the raw data.
The target mode must have normalized opposite samples, while every other
included mode must have equal samples. Under those assumptions the
half-difference readout isolates the target coefficient, and the target's
mean-channel contribution vanishes. Establishing that the physical mode
shapes satisfy these hypotheses remains a separate source/geometric task.
-/ 

/-- Mean-channel weight of one mode at two sampled positions. -/
noncomputable def meanWeight {Mode Angle : Type*} (basis : Mode → Angle → ℝ)
    (θ₀ θπ : Angle) (m : Mode) : ℝ :=
  (basis m θ₀ + basis m θπ) / 2

/-- Half-difference weight of one mode at two sampled positions. -/
noncomputable def halfDifferenceWeight {Mode Angle : Type*} (basis : Mode → Angle → ℝ)
    (θ₀ θπ : Angle) (m : Mode) : ℝ :=
  (basis m θ₀ - basis m θπ) / 2

/-- Finite modal half-difference readout. -/
noncomputable def positionReadout {Mode Angle : Type*} [DecidableEq Mode]
    (modes : Finset Mode) (coeff : Mode → ℝ)
    (basis : Mode → Angle → ℝ) (θ₀ θπ : Angle) : ℝ :=
  modes.sum (fun m => coeff m * halfDifferenceWeight basis θ₀ θπ m)

/-- An antisymmetric target mode contributes zero to the mean/radius channel. -/
theorem meanWeight_zero_of_antisymmetric
    {Mode Angle : Type*} (basis : Mode → Angle → ℝ)
    (θ₀ θπ : Angle) (target : Mode)
    (hTarget : basis target θ₀ + basis target θπ = 0) :
    meanWeight basis θ₀ θπ target = 0 := by
  simp [meanWeight, hTarget]

/-- If the target mode has opposite normalized samples and every other
    included mode has equal samples, the finite half-difference readout
    returns exactly the target coefficient. These are explicit assumptions,
    not a derivation of the physical mode shapes. -/
theorem positionReadout_eq_target
    {Mode Angle : Type*} [DecidableEq Mode]
    (modes : Finset Mode) (target : Mode)
    (hmem : target ∈ modes)
    (coeff : Mode → ℝ) (basis : Mode → Angle → ℝ)
    (θ₀ θπ : Angle)
    (hTarget : basis target θ₀ - basis target θπ = 2)
    (hOther : ∀ m ∈ modes, m ≠ target →
      basis m θ₀ = basis m θπ) :
    positionReadout modes coeff basis θ₀ θπ = coeff target := by
  unfold positionReadout halfDifferenceWeight
  rw [Finset.sum_eq_single target]
  · simp [hTarget]
  · intro m hm hne
    simp [hOther m hm hne]
  · intro hnot
    exact (hnot hmem).elim


#print axioms from_toRadiusDisplacement
#print axioms to_fromRadiusDisplacement
#print axioms toRadiusDisplacement_injective
#print axioms toRadiusDisplacement_surjective
#print axioms toRadiusDisplacement_bijective
#print axioms radiusDisplacementReadout_eq_iff_samplePair_eq
#print axioms samplePair_not_injective
#print axioms radiusDisplacementReadout_not_injective
#print axioms meanWeight_zero_of_antisymmetric
#print axioms positionReadout_eq_target

end HsHVerification.AriadneAntipodalContourReadout
