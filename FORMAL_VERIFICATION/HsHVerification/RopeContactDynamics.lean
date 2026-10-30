import Mathlib

/-!
Source-conditional rope mechanics formalization, 2026-10-30.

Measured comparator A:
G. Kozyreff and B. Seron, "Dynamical elastic contact of a rope with the
ground", Phys. Rev. Research 3, L022026 (2021),
DOI 10.1103/PhysRevResearch.3.L022026, arXiv:2103.14395.
The experimental rope was a 2 mm stranded metallic wire rope with line
density rho = 15 g/m, estimated bending stiffness B ~= 0.0005 N m^2,
and static elevation Z0 = 0.81 m. The authors manually applied tension
of order 1 N, but did not directly measure T; x0 was used as a monotone
proxy for tension. Their Table I reports x0 +/- 0.03 m and f1 +/- 0.02 Hz:
x0 = [1.08, 1.20, 1.47, 1.65, 1.80, 2.30, 2.45] m,
f1 = [1.18, 1.19, 1.20, 1.20, 1.23, 1.17, 1.20] Hz.
The cancellation theorem below is conditional on the paper's small-slope,
uniform-tension, weak-bending approximation (B/(T*x0^2) -> 0). It is not
a theorem about finite bending stiffness or a roughly 90-degree kink.

Measured comparator B:
H. Endo, S.-J. Yoon, and K. Arakawa, "Effects of Torsion on Mechanical
Properties of Polymeric Fiber Ropes", Advanced Experimental Mechanics 1
(2016), 210-213, DOI 10.11395/aem.1.0_210.
Three 3 mm solid-braid rope types (cotton, Cremona, nylon) were tested.
The paper reports mean tensile fracture loads at R=0 and R=50 revolutions:
cotton 89 -> 63 N, Cremona 130 -> 87 N, nylon 365 -> 320 N.
Each condition was repeated at least three times with new samples; reported
measurement-value differences were within 5%, but no SD/covariance matrix
is supplied. The rational theorems below verify arithmetic on printed means,
not a statistical model or a universal constitutive law.

These are ordinary-rope measurements, not Petzl climbing-rope tests.
No H(s)H constitutive map, independent H(s)H prediction, or BEDROCK
promotion is claimed.
-/

namespace HsHVerification.RopeContactDynamics

/-- Table I frequencies, exactly as printed to 0.01 Hz. -/
def observedF1 : List ℚ :=
  [118 / 100, 119 / 100, 120 / 100, 120 / 100, 123 / 100, 117 / 100, 120 / 100]

/-- Sum of the seven rounded Table I frequencies. -/
theorem observedF1_sum : observedF1.sum = 837 / 100 := by
  norm_num [observedF1]

/-- Arithmetic mean of the seven rounded Table I frequencies. -/
theorem observedF1_mean : observedF1.sum / 7 = 837 / 700 := by
  norm_num [observedF1]

/-- Printed frequency range: 1.23 - 1.17 = 0.06 Hz. -/
theorem observedF1_range : (123 : ℚ) / 100 - 117 / 100 = 3 / 50 := by
  norm_num

/-- The paper's approximate reference inputs g=9.81 and Z0=0.81 give
    f1^2 = 109/72 Hz^2 under f1^2=g/(8 Z0). -/
theorem reference_frequency_squared :
    ((981 : ℚ) / 100) / (8 * ((81 : ℚ) / 100)) = 109 / 72 := by
  norm_num

/-- Within the source's weak-bending, small-slope, uniform-tension model,
    c^2=T/rho and x0^2=2*T*Z0/(rho*g) imply c^2/x0^2=g/(2*Z0).
    This is a conditional algebraic cancellation, not an empirical law. -/
theorem contact_resonance_tension_cancellation
    (T rho Z0 g c x0 : ℝ)
    (hT : 0 < T) (hrho : 0 < rho) (hZ0 : 0 < Z0) (hg : 0 < g)
    (hc : c ^ 2 = T / rho)
    (hx0 : x0 ^ 2 = (2 * T * Z0) / (rho * g)) :
    c ^ 2 / x0 ^ 2 = g / (2 * Z0) := by
  rw [hc, hx0]
  field_simp [ne_of_gt hT, ne_of_gt hrho, ne_of_gt hZ0, ne_of_gt hg]
  <;> ring

/-- With the source resonance relation f1=c/(2*x0), the same assumptions
    yield f1^2=g/(8*Z0); the positive-frequency branch gives the paper's
    f1=sqrt(g/(8*Z0)). -/
theorem contact_resonance_fundamental_frequency_squared
    (T rho Z0 g c x0 f1 : ℝ)
    (hT : 0 < T) (hrho : 0 < rho) (hZ0 : 0 < Z0) (hg : 0 < g)
    (hc : c ^ 2 = T / rho)
    (hx0 : x0 ^ 2 = (2 * T * Z0) / (rho * g))
    (hf1 : f1 = c / (2 * x0)) :
    f1 ^ 2 = g / (8 * Z0) := by
  have hx0_ne : x0 ≠ 0 := by
    intro h
    rw [h] at hx0
    have hpos : 0 < (2 * T * Z0) / (rho * g) := by positivity
    linarith
  have hcancel :=
    contact_resonance_tension_cancellation T rho Z0 g c x0 hT hrho hZ0 hg hc hx0
  rw [hf1]
  calc
    (c / (2 * x0)) ^ 2 = (c ^ 2 / x0 ^ 2) / 4 := by
      field_simp [hx0_ne]
      <;> ring
    _ = (g / (2 * Z0)) / 4 := by rw [hcancel]
    _ = g / (8 * Z0) := by ring

/-- Endo et al. printed mean fracture loads at zero and fifty imposed turns. -/
def cottonR0 : ℚ := 89
def cottonR50 : ℚ := 63
def cremonaR0 : ℚ := 130
def cremonaR50 : ℚ := 87
def nylonR0 : ℚ := 365
def nylonR50 : ℚ := 320

theorem cotton_fracture_load_decreases :
    cottonR50 < cottonR0 := by
  norm_num [cottonR0, cottonR50]

theorem cremona_fracture_load_decreases :
    cremonaR50 < cremonaR0 := by
  norm_num [cremonaR0, cremonaR50]

theorem nylon_fracture_load_decreases :
    nylonR50 < nylonR0 := by
  norm_num [nylonR0, nylonR50]

/-- Exact relative decrease in the printed cotton means: 26/89. -/
theorem cotton_relative_decrease :
    (cottonR0 - cottonR50) / cottonR0 = 26 / 89 := by
  norm_num [cottonR0, cottonR50]

/-- Exact relative decrease in the printed Cremona means: 43/130. -/
theorem cremona_relative_decrease :
    (cremonaR0 - cremonaR50) / cremonaR0 = 43 / 130 := by
  norm_num [cremonaR0, cremonaR50]

/-- Exact relative decrease in the printed nylon means: 9/73. -/
theorem nylon_relative_decrease :
    (nylonR0 - nylonR50) / nylonR0 = 9 / 73 := by
  norm_num [nylonR0, nylonR50]

/-- On the printed means, nylon's relative decrease is smaller than cotton's.
    This is a finite comparison of these three tested specimens/materials,
    not a universal material ranking. -/
theorem nylon_relative_decrease_below_cotton :
    (nylonR0 - nylonR50) / nylonR0 <
      (cottonR0 - cottonR50) / cottonR0 := by
  norm_num [nylonR0, nylonR50, cottonR0, cottonR50]

#print axioms observedF1_sum
#print axioms observedF1_mean
#print axioms observedF1_range
#print axioms reference_frequency_squared
#print axioms contact_resonance_tension_cancellation
#print axioms contact_resonance_fundamental_frequency_squared
#print axioms cotton_fracture_load_decreases
#print axioms cremona_fracture_load_decreases
#print axioms nylon_fracture_load_decreases
#print axioms cotton_relative_decrease
#print axioms cremona_relative_decrease
#print axioms nylon_relative_decrease
#print axioms nylon_relative_decrease_below_cotton

end HsHVerification.RopeContactDynamics
