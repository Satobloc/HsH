import HsHVerification.CalderProjectionGate
import Mathlib

/-!
# Calder: M87* ring diameter as an incomplete candidate-core readout

Empirical anchor, NOT a theorem premise:
Event Horizon Telescope Collaboration, 2019, ApJL 875 L1
DOI 10.3847/2041-8213/ab0ec7, 2017 1.3 mm interferometry,
reported image-domain ring diameter 42 ± 3 microarcseconds.
Paper VI uses geometric and GRMHD calibration to infer angular
gravitational radius and mass; these are not raw independent diameter
observations. This Lean model DOES NOT reproduce EHT interferometric
forward imaging, Kerr/GRMHD radiative transfer, calibration, or errors.

The Latent type is deliberately unspecified: an observational
equivalence class may have several possible models, but this formal
statement does not prove two actual physical worldtubes exist.
-/

namespace HsHVerification.CalderM87Gate

open HsHVerification.CalderProjectionGate

variable {Latent Extra : Type*}

abbrev CoreDescriptor (Latent : Type*) := ℝ × Latent

/-- Formalized scalar angular-diameter readout only; NOT an EHT forward law. -/
def angularDiameter (c : CoreDescriptor Latent) : ℝ := firstReadout c

theorem equal_diameter_can_hide_distinct_descriptors
    (diameter : ℝ) (x y : Latent) (hxy : x ≠ y) :
    angularDiameter (diameter, x) = angularDiameter (diameter, y) ∧
      (diameter, x) ≠ (diameter, y) := by
  exact hidden_fiber_collision diameter x y hxy

theorem no_exact_core_reconstruction_from_diameter_alone
    (diameter : ℝ) (x y : Latent) (hxy : x ≠ y) :
    ¬ ∃ reconstruct : ℝ → CoreDescriptor Latent,
      ∀ p : CoreDescriptor Latent,
        reconstruct (angularDiameter p) = p := by
  exact no_global_reconstruction diameter x y hxy

theorem extra_core_observable_makes_injective_if_distinguishing
    (extra : Latent → Extra) (hextra : Function.Injective extra) :
    Function.Injective
      (fun c : CoreDescriptor Latent => (angularDiameter c, extra c.2)) := by
  exact augmented_injective_of_extra_injective extra hextra

#print axioms equal_diameter_can_hide_distinct_descriptors
#print axioms no_exact_core_reconstruction_from_diameter_alone
#print axioms extra_core_observable_makes_injective_if_distinguishing

end HsHVerification.CalderM87Gate
