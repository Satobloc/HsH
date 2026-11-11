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
def toRadiusDisplacement (samples : ℝ × ℝ) : ℝ × ℝ :=
  ((samples.1 + samples.2) / 2, (samples.1 - samples.2) / 2)

/-- Inverse transformation from (a,η) to the two sampled radii. -/
def fromRadiusDisplacement (channels : ℝ × ℝ) : ℝ × ℝ :=
  (channels.1 + channels.2, channels.1 - channels.2)

theorem from_toRadiusDisplacement (samples : ℝ × ℝ) :
    fromRadiusDisplacement (toRadiusDisplacement samples) = samples := by
  rcases samples with ⟨r₀, rπ⟩
  simp [fromRadiusDisplacement, toRadiusDisplacement] <;> ring

theorem to_fromRadiusDisplacement (channels : ℝ × ℝ) :
    toRadiusDisplacement (fromRadiusDisplacement channels) = channels := by
  rcases channels with ⟨a, η⟩
  simp [fromRadiusDisplacement, toRadiusDisplacement] <;> ring

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
def radiusDisplacementReadout {Angle : Type*} (θ₀ θπ : Angle)
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
  exact hReadoutInjective r₁ r₂
    ((radiusDisplacementReadout_eq_iff_samplePair_eq θ₀ θπ r₁ r₂).2 hSamples)

#print axioms from_toRadiusDisplacement
#print axioms to_fromRadiusDisplacement
#print axioms toRadiusDisplacement_injective
#print axioms toRadiusDisplacement_surjective
#print axioms toRadiusDisplacement_bijective
#print axioms radiusDisplacementReadout_eq_iff_samplePair_eq
#print axioms samplePair_not_injective
#print axioms radiusDisplacementReadout_not_injective

end HsHVerification.AriadneAntipodalContourReadout
