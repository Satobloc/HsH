import HsHVerification.AlberrPolarimeterContrastGate

/-!
Kestrel source-grounded phase-winding identifiability gate, 2026-10-28.
Demirel, Sponar & Hasegawa, New J. Phys. 17 (2015) 023065,
DOI 10.1088/1367-2630/17/2/023065.
The measured neutron polarimeter uses an approximately 0.20 m rotating
field coil and approximately 2000 m/s neutrons, with 12 applied frequencies.
These theorems are conditional consequences of the source's ideal
cosine/sine detector model. No source uncertainty, phase calibration,
worldtube ontology, or physical H(s)H model is proved here.
-/

namespace HsHVerification.KestrelPhaseWrapGate

open HsHVerification.AlberrPolarimeterContrastGate

/-- A calibrated cosine detector still loses whole 2pi windings. -/
theorem intensity_add_full_turn (C alpha phi : ℝ) :
    visibilityIntensity C alpha (phi + 2 * Real.pi) =
    visibilityIntensity C alpha phi := by
  unfold visibilityIntensity
  have h : alpha + (phi + 2 * Real.pi) =
      (alpha + phi) + 2 * Real.pi := by ring
  rw [h, Real.cos_add_two_pi]

/-- The opposite winding also leaves a cosine detector unchanged. -/
theorem intensity_sub_full_turn (C alpha phi : ℝ) :
    visibilityIntensity C alpha (phi - 2 * Real.pi) =
    visibilityIntensity C alpha phi := by
  unfold visibilityIntensity
  have h : alpha + (phi - 2 * Real.pi) =
      (alpha + phi) - 2 * Real.pi := by ring
  rw [h, Real.cos_sub_two_pi]

/-- Ideal source phase slope with f in kHz and t in seconds.
    The minus sign matches the paper's plotted phase convention. -/
noncomputable def phaseModel (t f : ℝ) : ℝ :=
  -(2 * Real.pi) * (1000 * f * t)

/-- Two frequency settings separated by one whole rotation during transit
    have phases differing by 2pi, conditional on t and delta. -/
theorem phase_alias_if_cycle (t f delta : ℝ)
    (hcycle : 1000 * delta * t = 1) :
    phaseModel t (f + delta) = phaseModel t f - 2 * Real.pi := by
  unfold phaseModel
  calc
    -(2 * Real.pi) * (1000 * (f + delta) * t) =
        -(2 * Real.pi) * (1000 * f * t) -
        (2 * Real.pi) * (1000 * delta * t) := by ring
    _ = -(2 * Real.pi) * (1000 * f * t) - 2 * Real.pi := by
      rw [hcycle]
      ring

/-- Any calibrated contrast and reference phase share this alias. -/
theorem intensity_frequency_alias (C alpha t f delta : ℝ)
    (hcycle : 1000 * delta * t = 1) :
    visibilityIntensity C alpha (phaseModel t (f + delta)) =
    visibilityIntensity C alpha (phaseModel t f) := by
  rw [phase_alias_if_cycle t f delta hcycle]
  exact intensity_sub_full_turn C alpha (phaseModel t f)

/-- Conditional NOMINAL apparatus consequence: 0.20 m / 2000 m/s
    gives t = 0.0001 s and a 10 kHz alias spacing. The published
    2015 frequency set did not include a 10 kHz measured point. -/
theorem nominal_ten_khz_alias (C alpha f : ℝ) :
    visibilityIntensity C alpha (phaseModel (1 / 10000) (f + 10)) =
    visibilityIntensity C alpha (phaseModel (1 / 10000) f) := by
  apply intensity_frequency_alias C alpha (1 / 10000) f 10
  norm_num

#print axioms intensity_add_full_turn
#print axioms intensity_sub_full_turn
#print axioms phase_alias_if_cycle
#print axioms intensity_frequency_alias
#print axioms nominal_ten_khz_alias

end HsHVerification.KestrelPhaseWrapGate
