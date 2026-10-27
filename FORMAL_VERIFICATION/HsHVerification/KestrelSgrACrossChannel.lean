import Mathlib

/-!
Sgr A* cross-channel angular-scale identifiability gate (2026-10-27).

Real physical anchor:
* EHT Sgr A* 2017 1.3 mm ring diameter, 51.8 ± 2.3 microarcsec
  (EHT Collaboration 2022, ApJL 930 L15, DOI 10.3847/2041-8213/ac6736).
* Independently inferred angular gravitational radius from GRAVITY/VLTI
  stellar orbits, 5.125 ± 0.009(stat) ± 0.020(sys) microarcsec, quoted
  in EHT Collaboration 2022, ApJL 930 L17 (metric test paper).
These data are analyzed numerically in the Kestrel research packet.

The theorems are CONDITIONAL algebraic properties of a proposed
single-scale observable law theta = k * mass / distance. They do not
assert that this law models H(s)H, EHT plasma emission, or worldtubes.
In particular, the observed coefficient k_eff = theta_ring / theta_g
is a derived calibration and NOT an independent H(s)H prediction.
-/

namespace HsHVerification.KestrelSgrACrossChannel

/-- Abstract single angular observable with a dimensionless factor k. -/
def angularScale (k mass distance : ℝ) : ℝ :=
  k * mass / distance

/-- One angular readout alone cannot break a joint positive or negative
    mass-distance scaling, provided the scale and distance are nonzero. -/
theorem joint_scale_invariance
    (k mass distance scale : ℝ)
    (hd : distance ≠ 0) (hs : scale ≠ 0) :
    angularScale k (scale * mass) (scale * distance) =
      angularScale k mass distance := by
  unfold angularScale
  field_simp [hd, hs]
  ring

/-- Once distance and nonzero k are supplied externally, the algebraic
    forward map can be inverted to recover mass. -/
theorem recover_mass_given_distance
    (k mass distance : ℝ)
    (hd : distance ≠ 0) (hk : k ≠ 0) :
    angularScale k mass distance * distance / k = mass := by
  unfold angularScale
  field_simp [hd, hk]
  ring

/-- A coefficient defined by dividing the observed diameter by an
    independently estimated scale reproduces that same observed diameter
    automatically. This is calibration, not a new prediction. -/
theorem observed_ratio_roundtrip
    (observedDiameter angularGravityScale : ℝ)
    (hg : angularGravityScale ≠ 0) :
    (observedDiameter / angularGravityScale) * angularGravityScale =
      observedDiameter := by
  field_simp [hg]

#print axioms joint_scale_invariance
#print axioms recover_mass_given_distance
#print axioms observed_ratio_roundtrip

end HsHVerification.KestrelSgrACrossChannel
