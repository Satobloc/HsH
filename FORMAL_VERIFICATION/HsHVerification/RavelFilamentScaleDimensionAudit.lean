import Mathlib
import HsHVerification.RavelCouplingDimensionalAudit
import HsHVerification.RavelCarrierSheetDimensionGate
import HsHVerification.RavelFiberTransportNonuniqueness

namespace HsHVerification.RavelFilamentScaleDimensionAudit

open HsHVerification.RavelCouplingDimensionalAudit

/-!
Source audit of the archived SAT-O5/SAT-O8 filament-scale equations.

This module formalizes only SI dimension-exponent arithmetic under explicitly
named alternative unit assignments. It does not decide which assignment the
historical source intended, validate a constitutive law, or establish a
physical model.

The source equation ell_f^3 = 2 A / T requires [A] = [T] L^3.
-/

def scaleDim (n : Int) (d : Dim) : Dim :=
  ⟨n * d.M, n * d.L, n * d.T⟩

def dLength : Dim := ⟨0, 1, 0⟩
def dSpeed : Dim := ⟨0, 1, -1⟩
def dForce : Dim := ⟨1, 1, -2⟩
def dForcePerLength : Dim := ⟨1, 0, -2⟩
/-- Newton's gravitational constant in SI base dimensions. -/
def dNewtonG : Dim := ⟨-1, 3, -2⟩
def dMass : Dim := ⟨1, 0, 0⟩
def dDimensionless : Dim := ⟨0, 0, 0⟩
def dEnergy : Dim := ⟨1, 2, -2⟩
def dSpatialVolumeDensity : Dim := ⟨0, -3, 0⟩
def dSpacetimeVolumeDensity : Dim := ⟨0, -4, 0⟩
def dAreaDensity : Dim := ⟨0, -2, 0⟩

/-- Conventional beam/rod flexural-rigidity dimension: force × length². -/
def dFlexuralRigidity : Dim := Dim.mul dForce (scaleDim 2 dLength)

/-- Generic dimensional condition for ell_f³ = 2 A / T. -/
theorem cube_root_scale_condition (dA dTension : Dim) :
    Dim.div dA dTension = scaleDim 3 dLength ↔
      dA = Dim.mul dTension (scaleDim 3 dLength) := by
  constructor
  · intro h
    cases dA with
    | mk aM aL aT =>
      cases dTension with
      | mk tM tL tT =>
        simp [Dim.div, Dim.mul, scaleDim, dLength] at h ⊢
        omega
  · intro h
    cases dA with
    | mk aM aL aT =>
      cases dTension with
      | mk tM tL tT =>
        simp [Dim.div, Dim.mul, scaleDim, dLength] at h ⊢
        omega

/-- The source relation T ~ c^4/G has force dimension in SI. -/
theorem c_four_over_G_has_force_dimension :
    Dim.div (scaleDim 4 dSpeed) dNewtonG = dForce := by
  decide

/-- If T is a force (N), A must have units N·m³. -/
theorem cube_root_scale_force_tension_requires_N_m3 :
    Dim.mul dForce (scaleDim 3 dLength) = ⟨1, 4, -2⟩ := by
  decide

/-- If T is force per length (N/m), A must have units N·m². -/
theorem cube_root_scale_force_per_length_requires_N_m2 :
    Dim.mul dForcePerLength (scaleDim 3 dLength) = ⟨1, 3, -2⟩ := by
  decide

/-- The conventional beam/rod flexural-rigidity dimension is N·m². -/
theorem conventional_flexural_rigidity_is_N_m2 :
    dFlexuralRigidity = ⟨1, 3, -2⟩ := by
  decide

/-- The cube-root scale formula matches N·m² rigidity if T is N/m. -/
theorem cube_root_scale_matches_flexural_rigidity_if_T_is_N_per_m :
    Dim.mul dForcePerLength (scaleDim 3 dLength) = dFlexuralRigidity := by
  decide

/-- It does not match N·m² rigidity if T is a force in N. -/
theorem cube_root_scale_does_not_match_flexural_rigidity_if_T_is_N :
    Dim.mul dForce (scaleDim 3 dLength) ≠ dFlexuralRigidity := by
  decide

/-- T·ell_f/c² has mass dimension when T is a force in N. -/
theorem mass_scale_has_mass_if_T_is_N :
    Dim.div (Dim.mul dForce dLength) (scaleDim 2 dSpeed) = dMass := by
  decide

/-- T·ell_f/c² has mass-per-length dimension when T is N/m. -/
theorem mass_scale_has_mass_per_length_if_T_is_N_per_m :
    Dim.div (Dim.mul dForcePerLength dLength) (scaleDim 2 dSpeed)
      = ⟨1, -1, 0⟩ := by
  decide

/-- A spatial volume density (m⁻³) times ell_f² is not dimensionless. -/
theorem spatial_volume_link_density_times_ell_f_sq_not_dimensionless :
    Dim.mul dSpatialVolumeDensity (scaleDim 2 dLength) ≠ dDimensionless := by
  decide

/-- A spacetime volume density (m⁻⁴) times ell_f² is not dimensionless. -/
theorem spacetime_volume_link_density_times_ell_f_sq_not_dimensionless :
    Dim.mul dSpacetimeVolumeDensity (scaleDim 2 dLength) ≠ dDimensionless := by
  decide

/-- An areal density (m⁻²) times ell_f² is dimensionless. -/
theorem areal_link_density_times_ell_f_sq_is_dimensionless :
    Dim.mul dAreaDensity (scaleDim 2 dLength) = dDimensionless := by
  decide

/--
A 1D centerline can have codimension three while its 1D×3D total tube is
full-dimensional in a 4D ambient space. These rank statements are compatible.
This is dimension bookkeeping only; no tubular embedding is constructed.
-/
theorem centerline_and_total_tube_codimensions_are_compatible :
    HsHVerification.RavelCarrierSheetDimensionGate.normalComplementRank 4 1 = 3 ∧
    HsHVerification.RavelFiberTransportNonuniqueness.localProductDimension 1 3 = 4 ∧
    HsHVerification.RavelCarrierSheetDimensionGate.normalComplementRank 4
      (HsHVerification.RavelFiberTransportNonuniqueness.localProductDimension 1 3) = 0 := by
  decide

/-- The alternate O8 .tex variant m₀ ~ T/ℓ_f is not a mass if T is a force (N). -/
theorem o8_tex_mass_scale_t_over_ell_not_mass_if_T_is_N :
    Dim.div dForce dLength ≠ dMass := by
  decide

/-- The same T/ℓ_f variant is not a mass if T is force per length (N/m). -/
theorem o8_tex_mass_scale_t_over_ell_not_mass_if_T_is_N_per_m :
    Dim.div dForcePerLength dLength ≠ dMass := by
  decide

/-- The same T/ℓ_f variant is not a mass if T is energy (J). -/
theorem o8_tex_mass_scale_t_over_ell_not_mass_if_T_is_J :
    Dim.div dEnergy dLength ≠ dMass := by
  decide

#eval Dim.div (scaleDim 4 dSpeed) dNewtonG
#eval Dim.mul dForce (scaleDim 3 dLength)
#eval Dim.mul dForcePerLength (scaleDim 3 dLength)
#eval Dim.mul dSpatialVolumeDensity (scaleDim 2 dLength)
#eval Dim.mul dSpacetimeVolumeDensity (scaleDim 2 dLength)
#eval Dim.mul dAreaDensity (scaleDim 2 dLength)

#print axioms c_four_over_G_has_force_dimension
#print axioms cube_root_scale_condition
#print axioms cube_root_scale_force_tension_requires_N_m3
#print axioms cube_root_scale_force_per_length_requires_N_m2
#print axioms cube_root_scale_matches_flexural_rigidity_if_T_is_N_per_m
#print axioms cube_root_scale_does_not_match_flexural_rigidity_if_T_is_N
#print axioms mass_scale_has_mass_if_T_is_N
#print axioms mass_scale_has_mass_per_length_if_T_is_N_per_m
#print axioms spatial_volume_link_density_times_ell_f_sq_not_dimensionless
#print axioms spacetime_volume_link_density_times_ell_f_sq_not_dimensionless
#print axioms areal_link_density_times_ell_f_sq_is_dimensionless
#print axioms centerline_and_total_tube_codimensions_are_compatible

end HsHVerification.RavelFilamentScaleDimensionAudit
#eval Dim.div dForce dLength
#eval Dim.div dForcePerLength dLength
#eval Dim.div dEnergy dLength

#print axioms o8_tex_mass_scale_t_over_ell_not_mass_if_T_is_N
#print axioms o8_tex_mass_scale_t_over_ell_not_mass_if_T_is_N_per_m
#print axioms o8_tex_mass_scale_t_over_ell_not_mass_if_T_is_J
