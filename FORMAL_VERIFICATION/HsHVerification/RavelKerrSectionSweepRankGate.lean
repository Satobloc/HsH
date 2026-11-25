import Mathlib

/-!
# Ravel: rank gate for a spatial Kerr-section sweep

## Source anchors

- Nathan Direct, Ravel conversation 6a9d1a23-4fac-83ea-b76f-6805ece3ee9f,
  user message 3d0ad680-51db-4c79-ad4a-9bbacada24ef,
  2026-09-07T07:46:38.573Z: choose a spatial Kerr section and extend that
  section along the filament; do not use the full four-dimensional Kerr
  spacetime as the cross-section of another four-dimensional object.
- Nathan Direct, same conversation, user message
  496a15ea-0263-459d-b815-908f52155b90,
  2026-09-07T10:06:12.842Z: keep distinct the reduced 3D Minkowski/worldworm
  representation, the full 4D bulk, and the actual 4D view with a 3D slice.
- SAT-O1 4D historical source, SATOBLOC/SAT O1 4D.txt, blob
  7577aa1ee5a6c3850ce3b226c75377de6367aedc: defines a 1D filament
  gamma : R -> R^(3,1) and describes the worldtube as the 4D volume swept
  out by the vibrating filament.
- Nathan Direct, `ND Workshop Relay :24 Geometry` raw export, user message
  `c0520975-02a0-408f-a250-364b88ab7b30`, 2026-11-08T20:18:10.172Z:
  explores w as a fourth spatial direction and time proper as distinct or
  emergent along w, while leaving the Crullerverse/same-c-different-paths
  construction tentative. It does not identify the September Kerr sweep
  parameter with either w or proper time. The immediate assistant response's
  "Minkowski-first home model" is not a Nathan Direct model-selection statement.
- Separate SAT4D Canonical Summary, SATOBLOC/SAT4D_LIVE_DRAFT.txt,
  blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7, byline Nathan McKnight,
  document date June 2025: repeats the 1D-curve / 4D-volume wording.

The direct Kerr-section statement does not specify the section's intrinsic
dimension, the sweep parameter's relation to the SAT-O1 affine parameter,
the actual sweep map, its differential, its image, or any quotient/fiber
structure. The SAT-O1 curve and the later Kerr-section proposal are separate
source objects; no map identifying them is supplied.

## Formal scope

SweepLinearization stores a candidate linear map from the product of a
section tangent space and a one-dimensional filament-parameter tangent
space into a four-dimensional ambient tangent space. It does not prove that
the supplied linear map is the derivative of an existing smooth sweep map.

The theorems use Mathlib's finite-dimensional rank-nullity theorem:

- If the section is 3D and the candidate differential is injective, its
  image rank is 4. This is the full-dimensional branch, compatible with a
  4D-volume interpretation.
- If the section is 3D but the intended local image rank is 3, the kernel
  must have dimension 1. A quotient/fiber-collapse or other rank-defect
  construction is therefore an additional obligation.
- If the section is 2D and the differential is injective, the image rank is
  3. This is a different dimensional branch, not an assertion about which
  section Nathan intended.

The rank statements are local linear algebra only. They do not establish
smoothness, constant rank, an embedded submanifold, a global quotient,
Kerr geometry, a metric, a timesheet map, or a physical worldtube.
-/

namespace HsHVerification.RavelKerrSectionSweepRankGate

variable {K : Type*} [Field K]
variable {SectionTangent FilamentParameterTangent AmbientTangent : Type*}
  [AddCommGroup SectionTangent] [Module K SectionTangent]
  [FiniteDimensional K SectionTangent]
  [AddCommGroup FilamentParameterTangent] [Module K FilamentParameterTangent]
  [FiniteDimensional K FilamentParameterTangent]
  [AddCommGroup AmbientTangent] [Module K AmbientTangent]
  [FiniteDimensional K AmbientTangent]

/-- A supplied first-order candidate for extending a spatial section along
    a one-dimensional filament parameter into a four-dimensional ambient
    tangent space. The source does not type that ambient as Lorentzian
    spacetime or as the proposed four-dimensional spatial Crullerverse, and
    it does not identify the filament parameter with proper time or the
    spatial w direction. The source-to-map correspondence and smooth-map
    derivative are not supplied by this structure. -/
structure SweepLinearization where
  sectionDimension : Nat
  sectionDimension_eq :
    Module.finrank K SectionTangent = sectionDimension
  filamentParameterDimension_eq :
    Module.finrank K FilamentParameterTangent = 1
  ambientDimension_eq :
    Module.finrank K AmbientTangent = 4
  differential :
    (SectionTangent × FilamentParameterTangent) →ₗ[K] AmbientTangent

namespace SweepLinearization

variable (S : SweepLinearization (K := K)
  (SectionTangent := SectionTangent)
  (FilamentParameterTangent := FilamentParameterTangent)
  (AmbientTangent := AmbientTangent))

/-- The actual rank-nullity identity for the supplied linearized sweep map. -/
theorem rank_add_nullity :
    Module.finrank K (LinearMap.range S.differential) +
      Module.finrank K (LinearMap.ker S.differential) =
      Module.finrank K (SectionTangent × FilamentParameterTangent) :=
  S.differential.finrank_range_add_finrank_ker

/-- The product tangent-space dimension is section dimension plus one
    filament-parameter dimension. -/
theorem domain_dimension :
    Module.finrank K (SectionTangent × FilamentParameterTangent) =
      S.sectionDimension + 1 := by
  rw [Module.finrank_prod, S.sectionDimension_eq,
    S.filamentParameterDimension_eq]

/-- A 3D section swept along one parameter has a 4D domain. If its
    differential is injective, the local linearized image has rank four. -/
theorem three_dimensional_section_injective_rank_four
    (hSection : S.sectionDimension = 3)
    (hInjective : Function.Injective S.differential) :
    Module.finrank K (LinearMap.range S.differential) = 4 := by
  have hKer : LinearMap.ker S.differential = ⊥ :=
    LinearMap.ker_eq_bot.mpr hInjective
  have hNull : Module.finrank K (LinearMap.ker S.differential) = 0 := by
    rw [hKer]
    simp
  have hDomain : Module.finrank K
      (SectionTangent × FilamentParameterTangent) = 4 := by
    rw [S.domain_dimension, hSection]
  have hRankNullity := S.rank_add_nullity
  rw [hDomain, hNull] at hRankNullity
  omega

/-- If a 3D section sweep is intended to have a 3D local image, its
    four-dimensional domain differential must have a one-dimensional kernel. -/
theorem three_dimensional_section_rank_three_requires_one_kernel_dimension
    (hSection : S.sectionDimension = 3)
    (hRank : Module.finrank K (LinearMap.range S.differential) = 3) :
    Module.finrank K (LinearMap.ker S.differential) = 1 := by
  have hDomain : Module.finrank K
      (SectionTangent × FilamentParameterTangent) = 4 := by
    rw [S.domain_dimension, hSection]
  have hRankNullity := S.rank_add_nullity
  rw [hDomain, hRank] at hRankNullity
  omega

/-- A rank-three image from a 3D section sweep is incompatible with an
    injective differential. -/
theorem three_dimensional_section_rank_three_not_injective
    (hSection : S.sectionDimension = 3)
    (hRank : Module.finrank K (LinearMap.range S.differential) = 3) :
    ¬ Function.Injective S.differential := by
  intro hInjective
  have hFull :=
    S.three_dimensional_section_injective_rank_four hSection hInjective
  omega

/-- A 2D section swept along one parameter has a 3D domain. If its
    differential is injective, the local linearized image has rank three. -/
theorem two_dimensional_section_injective_rank_three
    (hSection : S.sectionDimension = 2)
    (hInjective : Function.Injective S.differential) :
    Module.finrank K (LinearMap.range S.differential) = 3 := by
  have hKer : LinearMap.ker S.differential = ⊥ :=
    LinearMap.ker_eq_bot.mpr hInjective
  have hNull : Module.finrank K (LinearMap.ker S.differential) = 0 := by
    rw [hKer]
    simp
  have hDomain : Module.finrank K
      (SectionTangent × FilamentParameterTangent) = 3 := by
    rw [S.domain_dimension, hSection]
  have hRankNullity := S.rank_add_nullity
  rw [hDomain, hNull] at hRankNullity
  omega

/-- In the 3D-section/injective branch, the linearized image has the same
    dimension as the four-dimensional ambient tangent space. -/
theorem three_dimensional_full_rank_fills_ambient_dimension
    (hSection : S.sectionDimension = 3)
    (hInjective : Function.Injective S.differential) :
    Module.finrank K (LinearMap.range S.differential) =
      Module.finrank K AmbientTangent := by
  calc
    Module.finrank K (LinearMap.range S.differential) = 4 :=
      S.three_dimensional_section_injective_rank_four hSection hInjective
    _ = Module.finrank K AmbientTangent := S.ambientDimension_eq.symm

end SweepLinearization

#print axioms SweepLinearization.rank_add_nullity
#print axioms SweepLinearization.domain_dimension
#print axioms SweepLinearization.three_dimensional_section_injective_rank_four
#print axioms SweepLinearization.three_dimensional_section_rank_three_requires_one_kernel_dimension
#print axioms SweepLinearization.three_dimensional_section_rank_three_not_injective
#print axioms SweepLinearization.two_dimensional_section_injective_rank_three
#print axioms SweepLinearization.three_dimensional_full_rank_fills_ambient_dimension

end HsHVerification.RavelKerrSectionSweepRankGate
