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
- Blockwave original: DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/BLOCKWAVE.txt,
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

end HsHVerification.RavelCurrentSupportIdentifiabilityGate
