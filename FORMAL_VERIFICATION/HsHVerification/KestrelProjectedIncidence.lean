import Mathlib

/-!
# Projected incidence is not physical intersection
Source-conditioned formalization for Workshop Relay Kestrel, 2026-10-29.
Historical source: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/
FINDING THE DONUT (nolat).txt, Git blob a788b5cc415f90de2d0382d3596ef07d68604687,
pp. 24-27, and user-role verified 2026-09-07 Ravel conversation,
message 496a15ea-0263-459d-b815-908f52155b90.
Theorems are standard set-map geometry, NOT proof of Nathan's proposed
physical correspondence, actual curve intersection, or a causal mechanism.
-/

namespace HsHVerification.KestrelProjectedIncidence

variable {X Y Z : Type*}

/-- Genuine source-space intersection always yields projected overlap. -/
theorem genuine_intersection_projects_to_overlap
    (p : X → Y) (A B : Set X) :
    p '' (A ∩ B) ⊆ (p '' A) ∩ (p '' B) := by
  rintro y ⟨x, hx, rfl⟩
  exact ⟨⟨x, hx.1, rfl⟩, ⟨x, hx.2, rfl⟩⟩

/-- Reversing projected overlap to a common source point is guaranteed
by injectivity (or by a suitable fiber-separation condition for the
particular source sets). -/
theorem projected_overlap_lifts_if_injective
    (p : X → Y) (hp : Function.Injective p) (A B : Set X) :
    (p '' A) ∩ (p '' B) ⊆ p '' (A ∩ B) := by
  rintro y ⟨⟨x, hx, hxy⟩, ⟨z, hz, hzy⟩⟩
  have hxz : x = z := hp (hxy.trans hzy.symm)
  refine ⟨x, ⟨hx, ?_⟩, hxy⟩
  simpa only [hxz] using hz

/-- Disjoint material sets stay disjoint in the readout if the map
is injective; ordinary 4D-to-3D projection is not assumed injective. -/
theorem disjointness_preserved_if_injective
    (p : X → Y) (hp : Function.Injective p) (A B : Set X)
    (hdisj : Disjoint A B) :
    Disjoint (p '' A) (p '' B) := by
  apply Set.disjoint_left.mpr
  intro y hyA hyB
  obtain ⟨x, hx, _⟩ :=
    projected_overlap_lifts_if_injective p hp A B ⟨hyA, hyB⟩
  exact (Set.disjoint_left.mp hdisj) hx.1 hx.2

/-- Abstract finite-set counterexample, not a physical fixture:
a non-injective readout can make disjoint source sets appear to overlap. -/
def collapsedReadout : Fin 2 → Fin 1 := fun _ => 0

def leftSource : Set (Fin 2) := {0}
def rightSource : Set (Fin 2) := {1}

theorem noninjective_readout_can_create_spurious_overlap :
    ((collapsedReadout '' leftSource) ∩
      (collapsedReadout '' rightSource)).Nonempty ∧
      leftSource ∩ rightSource = ∅ := by
  constructor
  · refine ⟨0, ?_⟩
    constructor
    · exact ⟨0, by simp [leftSource], by simp [collapsedReadout]⟩
    · exact ⟨1, by simp [rightSource], by simp [collapsedReadout]⟩
  · ext x
    simp [leftSource, rightSource]

/-- Two distinct source sets can have exactly the same non-injective
readout, so inverse reconstruction is not unique in general. -/
theorem distinct_sources_can_have_same_readout :
    leftSource ≠ rightSource ∧
      collapsedReadout '' leftSource =
        collapsedReadout '' rightSource := by
  constructor
  · intro h
    have h0 : (0 : Fin 2) ∈ rightSource := by
      simpa [h] using (show (0 : Fin 2) ∈ leftSource by simp [leftSource])
    simp [rightSource] at h0
  · simp [collapsedReadout, leftSource, rightSource]

/-- Two individually non-injective sector readouts can jointly identify a
source configuration if, on the admissible domain, every distinct pair is
separated by at least one channel. This is a conditional identifiability
criterion; it does not establish that any physical H(s)H readout pair has
the required separation property. -/
theorem joint_readout_injective_of_separating_pair
    {Z : Type*} (p₁ : X → Y) (p₂ : X → Z)
    (hsep : ∀ x₁ x₂, x₁ ≠ x₂ →
      p₁ x₁ ≠ p₁ x₂ ∨ p₂ x₁ ≠ p₂ x₂) :
    Function.Injective (fun x => (p₁ x, p₂ x)) := by
  intro x₁ x₂ hpair
  have hp₁ : p₁ x₁ = p₁ x₂ := congrArg Prod.fst hpair
  have hp₂ : p₂ x₁ = p₂ x₂ := congrArg Prod.snd hpair
  by_contra hne
  rcases hsep x₁ x₂ hne with hne₁ | hne₂
  · exact hne₁ hp₁
  · exact hne₂ hp₂

/-- Once coarse-graining identifies two source configurations, no
deterministic downstream readout can recover their distinction. -/
theorem downstream_readout_cannot_restore_coarse_collapsed_pair
    {Z : Type*} (g : X → Y) (r : Y → Z)
    {x₁ x₂ : X} (h : g x₁ = g x₂) :
    (r ∘ g) x₁ = (r ∘ g) x₂ := by
  change r (g x₁) = r (g x₂)
  exact congrArg r h

#print axioms genuine_intersection_projects_to_overlap
#print axioms projected_overlap_lifts_if_injective
#print axioms disjointness_preserved_if_injective
#print axioms noninjective_readout_can_create_spurious_overlap
#print axioms distinct_sources_can_have_same_readout
#print axioms joint_readout_injective_of_separating_pair
#print axioms downstream_readout_cannot_restore_coarse_collapsed_pair


/-!
## Back-hallway factorization

Source context:
* User-role clarification in "Meridian Minkowski Ring Analysis",
  conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`,
  raw export blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`,
  message `090f5160-1020-486d-9c42-df3d7dff2063`,
  2026-10-21T00:17:23.235Z. The user says the corridors are
  metaphorical/mathematical and that the earlier reciprocal
  filament/timesheet-deformation model is no longer current.
* The attached `Back hallways .txt` proposes a candidate
  `pi_j ∘ pi_i^{-1}` translation. That attachment's exact author
  is not established; this module formalizes the well-definedness
  condition without promoting the candidate equation to Nathan Direct.

A deterministic hallway on the image/range of `piI` exists exactly
when `piJ` is constant on every fiber of `piI`. This is a conditional
factorization theorem, not a supplied SAT/H(s)H projection, dataset,
physical prediction, or claim that a hallway exists for any named
pair of physical theories.
-/

/-- A single-valued map from the source-observable range to target
observables exists exactly when the target map is constant on each
fiber of the source map. -/
theorem hallway_factorization_iff_fiber_compatibility
    (piI : X → Y) (piJ : X → Z) :
    (∃ H : Set.range piI → Z,
      ∀ x, H ⟨piI x, ⟨x, rfl⟩⟩ = piJ x) ↔
    ∀ x₁ x₂, piI x₁ = piI x₂ → piJ x₁ = piJ x₂ := by
  constructor
  · rintro ⟨H, hH⟩ x₁ x₂ h
    have hsub :
        (⟨piI x₁, ⟨x₁, rfl⟩⟩ : Set.range piI) =
          ⟨piI x₂, ⟨x₂, rfl⟩⟩ := by
      exact Subtype.ext h
    calc
      piJ x₁ = H ⟨piI x₁, ⟨x₁, rfl⟩⟩ := (hH x₁).symm
      _ = H ⟨piI x₂, ⟨x₂, rfl⟩⟩ := congrArg H hsub
      _ = piJ x₂ := hH x₂
  · intro h
    classical
    refine ⟨(fun y : Set.range piI => piJ (Classical.choose y.property)), ?_⟩
    intro x
    have hmem : piI x ∈ Set.range piI := ⟨x, rfl⟩
    simpa using h (Classical.choose hmem) x (Classical.choose_spec hmem)

/-- Once defined on the entire range, a deterministic hallway factor
map is unique. -/
theorem hallway_factorization_unique
    (piI : X → Y) (piJ : X → Z)
    {H₁ H₂ : Set.range piI → Z}
    (h₁ : ∀ x, H₁ ⟨piI x, ⟨x, rfl⟩⟩ = piJ x)
    (h₂ : ∀ x, H₂ ⟨piI x, ⟨x, rfl⟩⟩ = piJ x) :
    H₁ = H₂ := by
  funext y
  rcases y.property with ⟨x, hx⟩
  have hy : y = (⟨piI x, ⟨x, rfl⟩⟩ : Set.range piI) := by
    exact Subtype.ext hx.symm
  rw [hy]
  exact (h₁ x).trans (h₂ x).symm

/-- If the source-observable projection is injective, a deterministic
hallway factor map always exists on its range. -/
theorem hallway_factorization_exists_of_source_injective
    (piI : X → Y) (piJ : X → Z)
    (hinj : Function.Injective piI) :
    ∃ H : Set.range piI → Z,
      ∀ x, H ⟨piI x, ⟨x, rfl⟩⟩ = piJ x := by
  apply (hallway_factorization_iff_fiber_compatibility piI piJ).2
  intro x₁ x₂ h
  exact congrArg piJ (hinj h)

#print axioms hallway_factorization_iff_fiber_compatibility
#print axioms hallway_factorization_unique
#print axioms hallway_factorization_exists_of_source_injective

end HsHVerification.KestrelProjectedIncidence

/-!
## Scale-route commutation and observational identifiability

Let `f` and `g` stand for two typed compositions from the same
fine-scale source to the same coarse geometric target, for example
slice-then-coarse-grain and coarse-grain-then-slice. Let `R` be the
downstream observer/instrument readout, restricted to the admissible
target domain.

Geometric route equality always implies observed equality. The converse
holds only when the readout is injective on that admissible domain.
Consequently, agreement of measured outputs alone cannot establish that
two geometric routes commute when the readout is lossy.

This is conditional map mathematics. No physical SAT/H(s)H slice,
coarse-graining, projection, medium-response, or instrument map is
instantiated here; measurement uncertainty is also outside this exact
equality theorem.
-/

/-- Exact agreement of two upstream scale routes. -/
def ScaleRouteAgreement (f g : X → Y) : Prop :=
  ∀ x, f x = g x

/-- Agreement of two scale routes after a downstream readout. -/
def ObservableScaleRouteAgreement
    (R : Y → Z) (f g : X → Y) : Prop :=
  ∀ x, R (f x) = R (g x)

/-- If the geometric routes agree, every downstream readout agrees. -/
theorem scale_route_agreement_implies_observable_agreement
    (R : Y → Z) (f g : X → Y)
    (h : ScaleRouteAgreement f g) :
    ObservableScaleRouteAgreement R f g := by
  intro x
  exact congrArg R (h x)

/-- An injective readout reflects observed route agreement back to
agreement of the upstream geometric routes. -/
theorem observable_agreement_reflects_scale_route_agreement_if_injective
    (R : Y → Z) (hR : Function.Injective R)
    (f g : X → Y)
    (h : ObservableScaleRouteAgreement R f g) :
    ScaleRouteAgreement f g := by
  intro x
  exact hR (h x)

/-- On an admissible domain where the readout is injective, exact
observable agreement is equivalent to exact geometric route agreement. -/
theorem observable_scale_route_agreement_iff_of_injective
    (R : Y → Z) (hR : Function.Injective R)
    (f g : X → Y) :
    ObservableScaleRouteAgreement R f g ↔ ScaleRouteAgreement f g := by
  constructor
  · exact observable_agreement_reflects_scale_route_agreement_if_injective
      R hR f g
  · exact scale_route_agreement_implies_observable_agreement R f g

/-- A non-injective readout necessarily collapses some distinct
admissible target states. This is the abstract witness behind hidden
route differences; it does not assert that a physical instrument has
such a pair in its actual support. -/
theorem noninjective_readout_has_indistinguishable_pair
    (R : Y → Z) (hR : ¬ Function.Injective R) :
    ∃ a b : Y, a ≠ b ∧ R a = R b := by
  classical
  by_contra h
  apply hR
  intro a b hab
  by_contra hne
  exact h ⟨a, b, hne, hab⟩

#print axioms scale_route_agreement_implies_observable_agreement
#print axioms observable_agreement_reflects_scale_route_agreement_if_injective
#print axioms observable_scale_route_agreement_iff_of_injective
#print axioms noninjective_readout_has_indistinguishable_pair


end HsHVerification.KestrelProjectedIncidence
