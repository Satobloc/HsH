import HsHVerification.KestrelHeliumScaleGate
import HsHVerification.KestrelReadoutComposition

/-!
Source-conditioned observation-chain contract for Tang et al. (2023),
doi:10.1038/s41467-023-38787-w.
A bare helium vortex, its deuterium tracer decoration and a 2D camera image
are distinct mathematical objects. The actual dynamics of decoration and
optical projection are NOT established here, and no H(s)H law is proved.
-/
namespace HsHVerification.KestrelHeliumReadoutGate

/-- The ratio of two measured/inferred length scales composes only when the
intermediate scale and denominator are nonzero. -/
theorem positive_scale_composition
    (tracer ring core : ℝ) (hring : ring ≠ 0) (hcore : core ≠ 0) :
    (tracer / ring) * (ring / core) = tracer / core := by
  field_simp [hring, hcore]

/-- Source-labelled rounded scale arithmetic feeds the reciprocal ratio.
This uses the independently proved rounded-value theorem from module 1. -/
theorem nominal_two_ring_to_tracer_positive :
    (0 : ℚ) < ((1408 : ℚ) / 10) / ((11 : ℚ) / 10) := by
  rw [HsHVerification.KestrelHeliumScaleGate.nominal_two_ring_to_tracer]
  norm_num

/-- If tracer decoration already loses latent information, imaging cannot
restore it. This is conditional on actual noninjectivity of the decoration
map, which is not demonstrated by the experiment's pictures alone. -/
theorem decoration_alias_persists
    {Core Tracer Image : Type*}
    (decorate : Core → Tracer) (camera : Tracer → Image)
    (h : ¬ Function.Injective decorate) :
    ¬ Function.Injective (camera ∘ decorate) :=
  HsHVerification.KestrelReadoutComposition.upstream_noninjectivity_survives_readout
    decorate camera h

#print axioms positive_scale_composition
#print axioms nominal_two_ring_to_tracer_positive
#print axioms decoration_alias_persists

end HsHVerification.KestrelHeliumReadoutGate
