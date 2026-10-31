import Mathlib

/-!
Nadir Voss source-grounded GP-B observational arithmetic gate, 2026-10-27.
Wei-Tou Ni, "Rotation, Equivalence Principle, and GP-B Experiment",
arXiv:1105.4305v1 (2011), Tables II and III; Everitt et al., PRL 106,
221101 (2011). Ni's Table II contains actual GP-B rotor frequencies
and spin-frequency slopes. Ni's 30 percent unexplained-dissipation
allowance is a stated modeling assumption, NOT a statistical one-sigma
measurement or an H(s)H physical prediction.

bound13 returns the modeled anomalous axial fractional spin-rate
envelope in units of 1e-13 per second. The gyro-frequency magnitudes
are used because the table includes opposite spin orientations.
The source-to-model interpretation remains open to independent review.
-/

namespace HsHVerification.NadirGPBNiAxialBound

def bound13 (frequencyHz slopeMicroHzPerHour : ℚ) : ℚ :=
  (3 / 10) * slopeMicroHzPerHour / (3600 * frequencyHz) * 10000000

def g1Bound : ℚ := bound13 (7939 / 100) (57 / 100)
def g2Bound : ℚ := bound13 (6182 / 100) (52 / 100)
def g3Bound : ℚ := bound13 (8209 / 100) (130 / 100)
def g4Bound : ℚ := bound13 (6485 / 100) (28 / 100)

/-- Exact source-parameter arithmetic, not a new measurement. -/
theorem g4_exact_value : g4Bound = (14000 : ℚ) / 3891 := by
  norm_num [g4Bound, bound13]

/-- Of Ni's four source-reported gyros, G4 gives the tightest
    30%-allowance envelope, conditional on Ni's phenomenological rule. -/
theorem g4_strictly_smallest :
    g4Bound < g1Bound ∧ g4Bound < g2Bound ∧ g4Bound < g3Bound := by
  norm_num [g1Bound, g2Bound, g3Bound, g4Bound, bound13]

/-- The conditional G4 envelope rounds to Ni's displayed 3.60 in
    units of 1e-13 per second. Not a Gaussian standard error. -/
theorem g4_published_rounding :
    (359 : ℚ) / 100 < g4Bound ∧ g4Bound < (361 : ℚ) / 100 := by
  norm_num [g4Bound, bound13]

#print axioms g4_exact_value
#print axioms g4_strictly_smallest
#print axioms g4_published_rounding

end HsHVerification.NadirGPBNiAxialBound
