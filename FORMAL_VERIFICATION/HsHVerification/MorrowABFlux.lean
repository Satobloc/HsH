import Mathlib

/-!
# Morrow: measured shielded-toroid Aharonov–Bohm flux normalization

REAL SYSTEM: Osakabe et al., Phys. Rev. A 34, 815 (1986),
DOI 10.1103/PhysRevA.34.815. Electron holography around a
superconductor-shielded toroidal ferromagnet measured relative
phase classes 0 and pi. These Lean propositions do not prove
the experimental observation, the flatness of the exterior
connection, or the physical applicability of a worldtube model.

CODATA 2022/SI 2019: h and e are exact defining constants.
Here they are abstract nonzero real quantities; no measured
per-sample flux, uncertainties or fitted inputs are invented.
-/

namespace HsHVerification.MorrowABFlux

/-- Superconducting flux quantum as a typed ratio (SI units external). -/
def fluxQuantum (h e : ℝ) : ℝ := h / (2 * e)

/-- The exact cancellation in the flux-quantum definition. -/
theorem flux_quantum_closure (h e : ℝ) (he : e ≠ 0) :
    (2 * e) * fluxQuantum h e = h := by
  dsimp [fluxQuantum]
  field_simp [he]
  ring

/-- Standard-QM electron phase in cycles per superconducting flux quantum. -/
theorem electron_phase_half_cycle (h e : ℝ)
    (hh : h ≠ 0) (he : e ≠ 0) :
    (e * fluxQuantum h e) / h = (1 / 2 : ℝ) := by
  dsimp [fluxQuantum]
  field_simp [hh, he]
  ring

#print axioms flux_quantum_closure
#print axioms electron_phase_half_cycle

end HsHVerification.MorrowABFlux
