import Mathlib

/-!
# Ravel: support/current degree and local identifiability gate

## Source anchors and attribution

- SAT-O1 original: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC/SAT O1 4D.txt,
  Git blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc, SHA-256
  8e416ff440c45936c3588de0bd0c2ae49b529655ff452a64093a145416c62937.
  The file is unbylined. Its filesystem metadata was previously recorded as
  creation 2025-10-26 and last-write 2025-06-09, timezone unspecified; neither
  is treated as a demonstrated composition or authorship date. It defines
  gamma : R -> R^(3,1) as a one-parameter 1D curve and separately describes
  a worldtube as the 4D volume swept out by the vibrating filament.
- Blockwave original: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱BLOCKWAVE.txt,
  Git blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, SHA-256
  3d393efcedf9dc715cd49a319605fc5adc2011c5b5984abd9a2d280765953664.
  The attachment event is 2025-09-16T16:31:26.687Z, not a composition date.
  Its embedded prose is assistant-voiced; full authorship is not established
  as Nathan Direct. It defines a conserved rank-2 current
  nabla_mu J^{mu nu} = 0, describes it as a filament-worldsheet current,
  and gives J^{mu nu} = 1/2 epsilon^{mu nu rho sigma} nabla_rho B_sigma.
- Nathan Direct, Ravel conversation
  6a9d1a23-4fac-83ea-b76f-6805ece3ee9f:
  message 3d0ad680-51db-4c79-ad4a-9bbacada24ef (2026-09-07T07:46:38.573Z)
  says to choose a spatial Kerr section and extend that section along the
  filament, not use full 4D Kerr spacetime as the cross-section of another
  4D object. Message 496a15ea-0263-459d-b815-908f52155b90
  (2026-09-07T10:06:12.842Z) distinguishes the reduced 3D worldworm view,
  full 4D bulk, and actual 4D view containing a 3D slice.
- The current Ravel PR already contains a conditional rank gate for a
  spatial-section sweep. This module does not identify the SAT-O1 curve,
  Kerr section, Blockwave worldsheet current, or 4D worldtube as the same
  object.

## Formal scope

The first block is dimension bookkeeping under the conventional
Poincare-dual degree relation in a 4D ambient manifold. It does not construct
a differential form, orientation, distributional current, embedding, or
duality map.

The second block states a local linear identifiability criterion. In a
linearized observable model, the nuisance map sends allowed nuisance-parameter
shifts to observable shifts. If the proposed H(s)H response lies in that
range, an exact nuisance reparameterization absorbs it. If it lies outside,
that exact linear absorption is impossible. An invertible whitening map
preserves this range-membership criterion; covariance still controls the
size and uncertainty of the residual and the eventual statistical threshold.

Lean verifies only these formal statements. It does not establish a physical
current, a source-to-map translation, a helium response operator, or an
empirical prediction.
-/

namespace HsHVerification.RavelCurrentSupportIdentifiabilityGate

/-- Conditional Poincare-dual form degree for support dimension d
    in a four-dimensional ambient manifold. -/
def pdCurrentDegree (supportDimension : Nat) : Nat := 4 - supportDimension

/-- A 1D curve in 4D has degree-three Poincare-dual support bookkeeping. -/
theorem one_dimensional_curve_has_three_form_dual_degree :
    pdCurrentDegree 1 = 3 := by
  decide

/-- A 2D worldsheet in 4D has degree-two Poincare-dual support bookkeeping. -/
theorem two_dimensional_worldsheet_has_two_form_dual_degree :
    pdCurrentDegree 2 = 2 := by
  decide

/-- A full 4D volume has degree-zero dual support bookkeeping. -/
theorem four_dimensional_volume_has_zero_form_dual_degree :
    pdCurrentDegree 4 = 0 := by
  decide

/-- Under the 4D degree convention, a degree-two current requires 2D support. -/
theorem two_form_dual_degree_requires_two_dimensional_support
    (d : Nat) (hBounded : d ≤ 4)
    (hDegree : pdCurrentDegree d = 2) : d = 2 := by
  dsimp [pdCurrentDegree] at hDegree
  omega

/-- Product-domain dimension for a base and an independently parameterized
    extension. This is domain bookkeeping, not an assertion of injectivity. -/
def productSupportDimension (baseDimension extensionDimension : Nat) : Nat :=
  baseDimension + extensionDimension

/-- A 1D curve with one independent sweep parameter has a 2D product domain. -/
theorem curve_plus_one_sweep_parameter_is_two_dimensional :
    productSupportDimension 1 1 = 2 := by
  decide

/-- One independent sweep parameter cannot turn a 1D curve into a 4D volume. -/
theorem one_sweep_parameter_does_not_fill_four_dimensional_ambient :
    productSupportDimension 1 1 ≠ 4 := by
  decide

/-- Under product-domain bookkeeping, a 1D curve needs three independent
    extension parameters to reach a 4D domain. This does not assert that
    such a fiber exists in the source geometry. -/
theorem one_dimensional_curve_requires_three_extension_parameters_for_four_dimensions
    (extensionDimension : Nat)
    (hDomain : productSupportDimension 1 extensionDimension = 4) :
    extensionDimension = 3 := by
  dsimp [productSupportDimension] at hDomain
  omega

/-- A 2D worldsheet needs two independent thickness parameters to reach a
    4D product domain. This is not a physical thickening prescription. -/
theorem two_dimensional_worldsheet_requires_two_thickness_parameters_for_four_dimensions
    (thicknessDimension : Nat)
    (hDomain : productSupportDimension 2 thicknessDimension = 4) :
    thicknessDimension = 2 := by
  dsimp [productSupportDimension] at hDomain
  omega

/-- A 1D curve with three independent fiber parameters has a 4D product domain. -/
theorem curve_plus_three_fiber_parameters_is_four_dimensional :
    productSupportDimension 1 3 = 4 := by
  decide

/-- A 2D worldsheet with two independent thickness parameters has a 4D
    product domain. This does not select that construction physically. -/
theorem worldsheet_plus_two_thickness_parameters_is_four_dimensional :
    productSupportDimension 2 2 = 4 := by
  decide

variable {V E E' : Type*}
  [AddCommGroup V] [Module ℝ V]
  [AddCommGroup E] [Module ℝ E]
  [AddCommGroup E'] [Module ℝ E']

/-- A proposed H(s)H response is locally distinguishable from the declared
    linear nuisance model exactly when it is outside the nuisance map's range. -/
def locallyDistinguishable
    (nuisance : V →ₗ[ℝ] E) (signal : E) : Prop :=
  signal ∉ LinearMap.range nuisance

/-- If the H(s)H response lies in the nuisance range, a nuisance-parameter
    shift absorbs any scalar multiple of that response exactly. -/
theorem nuisance_range_absorbs_signal
    (nuisance : V →ₗ[ℝ] E) (signal : E)
    (hSignal : signal ∈ LinearMap.range nuisance)
    (eta : V) (beta : ℝ) :
    ∃ v, nuisance (eta + beta • v) =
      nuisance eta + beta • signal := by
  rcases LinearMap.mem_range.mp hSignal with ⟨v, hv⟩
  refine ⟨v, ?_⟩
  simp [hv]

/-- A response outside the nuisance range cannot be represented by one
    exact nuisance-parameter shift in this linearized model. -/
theorem outside_nuisance_range_forbids_exact_absorption
    (nuisance : V →ₗ[ℝ] E) (signal : E)
    (hSignal : signal ∉ LinearMap.range nuisance) :
    ¬ ∃ v, nuisance v = signal := by
  rintro ⟨v, hv⟩
  exact hSignal (LinearMap.mem_range.mpr ⟨v, hv⟩)

/-- Equivalent expression of the local identifiability criterion. -/
theorem local_distinguishability_iff_no_nuisance_representation
    (nuisance : V →ₗ[ℝ] E) (signal : E) :
    locallyDistinguishable nuisance signal ↔
      ¬ ∃ v, nuisance v = signal := by
  constructor
  · intro h hRepresentation
    rcases hRepresentation with ⟨v, hv⟩
    exact h (LinearMap.mem_range.mpr ⟨v, hv⟩)
  · intro h hRange
    rcases LinearMap.mem_range.mp hRange with ⟨v, hv⟩
    exact h ⟨v, hv⟩

/-- An invertible linear whitening transformation preserves exact
    nuisance-range membership. Covariance weighting changes residual size,
    not exact linear confounding. -/
theorem invertible_whitening_preserves_nuisance_membership
    (whiten : E ≃ₗ[ℝ] E') (nuisance : V →ₗ[ℝ] E) (signal : E) :
    signal ∈ LinearMap.range nuisance ↔
      whiten.toLinearMap signal ∈
        LinearMap.range (whiten.toLinearMap.comp nuisance) := by
  constructor
  · intro h
    rcases LinearMap.mem_range.mp h with ⟨v, hv⟩
    apply LinearMap.mem_range.mpr
    refine ⟨v, ?_⟩
    simpa [LinearMap.comp_apply] using congrArg whiten.toLinearMap hv
  · intro h
    rcases LinearMap.mem_range.mp h with ⟨v, hv⟩
    apply LinearMap.mem_range.mpr
    refine ⟨v, ?_⟩
    apply whiten.injective
    simpa [LinearMap.comp_apply] using hv

/-- Exact local distinguishability is invariant under invertible whitening. -/
theorem invertible_whitening_preserves_local_distinguishability
    (whiten : E ≃ₗ[ℝ] E') (nuisance : V →ₗ[ℝ] E) (signal : E) :
    locallyDistinguishable nuisance signal ↔
      locallyDistinguishable
        (whiten.toLinearMap.comp nuisance) (whiten.toLinearMap signal) := by
  constructor
  · intro h hRange
    apply h
    exact (invertible_whitening_preserves_nuisance_membership
      whiten nuisance signal).2 hRange
  · intro h hRange
    apply h
    exact (invertible_whitening_preserves_nuisance_membership
      whiten nuisance signal).1 hRange

#eval [pdCurrentDegree 1, pdCurrentDegree 2,
       pdCurrentDegree 3, pdCurrentDegree 4]
#eval [productSupportDimension 1 1,
       productSupportDimension 1 3,
       productSupportDimension 2 2]

#print axioms one_dimensional_curve_has_three_form_dual_degree
#print axioms two_dimensional_worldsheet_has_two_form_dual_degree
#print axioms four_dimensional_volume_has_zero_form_dual_degree
#print axioms two_form_dual_degree_requires_two_dimensional_support
#print axioms nuisance_range_absorbs_signal
#print axioms outside_nuisance_range_forbids_exact_absorption
#print axioms local_distinguishability_iff_no_nuisance_representation
#print axioms invertible_whitening_preserves_nuisance_membership
#print axioms invertible_whitening_preserves_local_distinguishability


/-!
## Product-domain dimension versus full-rank local support

The preceding product-dimension results count independent parameters. They do
not establish that a supplied map uses those parameters independently in the
ambient tangent space. The following gate makes that missing distinction
explicit for both the 1D-curve-plus-three-extensions and
2D-worldsheet-plus-two-thickness cases.

A rank-four differential gives a locally full-dimensional linearized image.
It does not by itself establish that the linear map is the derivative of a
source-defined smooth map, nor that the global image is embedded or injective.
-/

variable {K : Type*} [Field K]
variable {Base Extension Ambient : Type*}
  [AddCommGroup Base] [Module K Base] [FiniteDimensional K Base]
  [AddCommGroup Extension] [Module K Extension] [FiniteDimensional K Extension]
  [AddCommGroup Ambient] [Module K Ambient] [FiniteDimensional K Ambient]

/-- A supplied candidate differential from a base × extension parameter
    domain into a four-dimensional ambient tangent space. The dimensions
    count the product domain; the differential separately determines its
    local image rank. No source-to-map or smooth-derivative correspondence
    is assumed. -/
structure SupportExtensionLinearization where
  baseDimension : Nat
  extensionDimension : Nat
  baseDimension_eq : Module.finrank K Base = baseDimension
  extensionDimension_eq : Module.finrank K Extension = extensionDimension
  ambientDimension_eq : Module.finrank K Ambient = 4
  differential : (Base × Extension) →ₗ[K] Ambient

namespace SupportExtensionLinearization

variable (S : SupportExtensionLinearization
  (K := K) (Base := Base) (Extension := Extension) (Ambient := Ambient))

/-- Rank-nullity for the supplied product-domain differential. -/
theorem rank_add_nullity :
    Module.finrank K (LinearMap.range S.differential) +
      Module.finrank K (LinearMap.ker S.differential) =
      Module.finrank K (Base × Extension) :=
  S.differential.finrank_range_add_finrank_ker

/-- The product tangent-domain dimension is the sum of its base and
    extension dimensions. -/
theorem domain_dimension :
    Module.finrank K (Base × Extension) =
      S.baseDimension + S.extensionDimension := by
  rw [Module.finrank_prod, S.baseDimension_eq, S.extensionDimension_eq]

/-- If the parameter counts sum to four, the product domain is
    four-dimensional. This is not yet a statement about the image. -/
theorem four_dimensional_product_domain
    (hDomain : S.baseDimension + S.extensionDimension = 4) :
    Module.finrank K (Base × Extension) = 4 := by
  calc
    Module.finrank K (Base × Extension) =
        S.baseDimension + S.extensionDimension := S.domain_dimension
    _ = 4 := hDomain

/-- A four-dimensional product domain with injective supplied differential
    has a rank-four local linearized image. -/
theorem injective_differential_has_full_rank
    (hDomain : S.baseDimension + S.extensionDimension = 4)
    (hInjective : Function.Injective S.differential) :
    Module.finrank K (LinearMap.range S.differential) = 4 := by
  have hKer : LinearMap.ker S.differential = ⊥ :=
    LinearMap.ker_eq_bot.mpr hInjective
  have hNull : Module.finrank K (LinearMap.ker S.differential) = 0 := by
    rw [hKer]
    simp
  have hProduct := S.four_dimensional_product_domain hDomain
  have hRankNullity := S.rank_add_nullity
  rw [hProduct, hNull] at hRankNullity
  omega

/-- If a four-dimensional product domain has rank-deficient image, at least
    one parameter direction lies in the differential kernel. Parameter
    counting alone therefore does not establish a four-dimensional support. -/
theorem rank_defect_requires_nonzero_kernel
    (hDomain : S.baseDimension + S.extensionDimension = 4)
    (hRank : Module.finrank K (LinearMap.range S.differential) < 4) :
    0 < Module.finrank K (LinearMap.ker S.differential) := by
  have hProduct := S.four_dimensional_product_domain hDomain
  have hRankNullity := S.rank_add_nullity
  rw [hProduct] at hRankNullity
  omega

end SupportExtensionLinearization

#print axioms SupportExtensionLinearization.rank_add_nullity
#print axioms SupportExtensionLinearization.domain_dimension
#print axioms SupportExtensionLinearization.four_dimensional_product_domain
#print axioms SupportExtensionLinearization.injective_differential_has_full_rank
#print axioms SupportExtensionLinearization.rank_defect_requires_nonzero_kernel

end HsHVerification.RavelCurrentSupportIdentifiabilityGate


namespace HsHVerification.RavelCurrentSupportIdentifiabilityGate

/-!
## Local rank is not global identifiability

This is a deliberately abstract mathematical counterexample, not an
H(s)H physical map or a measured-system model.  It prevents the local
differential-rank gate above from being used as a global uniqueness claim.
-/

/-- The elementary square response used only as a local/global counterexample. -/
def squareResponse (x : ℝ) : ℝ := x ^ 2

/-- The admissible parameter domain excludes the singular point of the
    ambient polynomial extension. -/
abbrev NonzeroParameter := {x : ℝ // x ≠ 0}

/-- Restriction of the polynomial response to its nonzero parameter domain. -/
def squareResponseOnNonzero (x : NonzeroParameter) : ℝ :=
  squareResponse x.1

/-- The ambient derivative is nonzero at every admissible parameter. -/
theorem squareResponse_deriv_eq (x : ℝ) :
    deriv squareResponse x = 2 * x := by
  simpa [squareResponse] using (hasDerivAt_pow 2 x).deriv

/-- In one dimension, the ambient differential has full rank throughout
    the nonzero parameter domain. -/
theorem squareResponse_deriv_ne_zero_on_domain (x : NonzeroParameter) :
    deriv squareResponse x.1 ≠ 0 := by
  rw [squareResponse_deriv_eq]
  exact mul_ne_zero (by norm_num) x.2

/-- Two distinct regular parameter values have the same readout. -/
theorem squareResponse_collision_at_regular_parameters :
    squareResponse 1 = squareResponse (-1) ∧
    (1 : ℝ) ≠ -1 ∧
    deriv squareResponse 1 ≠ 0 ∧
    deriv squareResponse (-1) ≠ 0 := by
  constructor
  · norm_num [squareResponse]
  constructor
  · norm_num
  constructor
  · exact squareResponse_deriv_ne_zero_on_domain ⟨1, by norm_num⟩
  · exact squareResponse_deriv_ne_zero_on_domain ⟨-1, by norm_num⟩

/-- The restricted response is not globally injective, despite its
    nonzero ambient derivative at every point of its admissible domain. -/
theorem squareResponseOnNonzero_not_injective :
    ¬ Function.Injective squareResponseOnNonzero := by
  intro hinj
  have hImage :
      squareResponseOnNonzero ⟨1, by norm_num⟩ =
        squareResponseOnNonzero ⟨-1, by norm_num⟩ := by
    norm_num [squareResponseOnNonzero, squareResponse]
  have hDomain :
      (⟨1, by norm_num⟩ : NonzeroParameter) = ⟨-1, by norm_num⟩ :=
    hinj hImage
  have hValue : (1 : ℝ) = -1 := congrArg Subtype.val hDomain
  norm_num at hValue

/-- Local full rank everywhere on the admissible domain does not imply
    global parameter identifiability.  A separate fiber/global-injectivity
    gate is required. -/
theorem local_full_rank_does_not_imply_global_identifiability :
    (∀ x : NonzeroParameter, deriv squareResponse x.1 ≠ 0) ∧
    ¬ Function.Injective squareResponseOnNonzero := by
  constructor
  · intro x
    exact squareResponse_deriv_ne_zero_on_domain x
  · exact squareResponseOnNonzero_not_injective

/-- Executable numeral sanity check for the equal-readout pair.
    The Real-valued differential claims are kernel-checked above. -/
#eval ((1 : Int) ^ 2 == (-1 : Int) ^ 2)

#print axioms squareResponse_deriv_eq
#print axioms squareResponse_deriv_ne_zero_on_domain
#print axioms squareResponse_collision_at_regular_parameters
#print axioms squareResponseOnNonzero_not_injective
#print axioms local_full_rank_does_not_imply_global_identifiability

end HsHVerification.RavelCurrentSupportIdentifiabilityGate
