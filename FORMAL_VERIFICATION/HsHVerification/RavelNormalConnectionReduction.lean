import Mathlib

/-!
# Ravel: conditional SO(3) to SO(2) normal-connection reduction

## Source anchors

- Nathan Direct, Ravel conversation `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`,
  message `3d0ad680-51db-4c79-ad4a-9bbacada24ef`,
  2026-09-07T07:46:38.573Z: choose a spatial Kerr section and extend it
  along the filament; do not use the full 4D Kerr spacetime as the
  cross-section of another 4D object.
- Nathan Direct, same conversation, message
  `b9805319-9d77-4b43-874a-5af50c0b6ef7`,
  2026-09-07T08:06:58.114Z: filament-side and timesheet-side distortions
  mutually accommodate; force is the primitive.
- Nathan Direct, same conversation, message
  `496a15ea-0263-459d-b815-908f52155b90`,
  2026-09-07T10:06:12.842Z: an induction-current connection within
  timesheet thickness is tentative interpretation, not an equation.
- Ravel sandbox `SANDBOX_2026-10-11_FINITE_TUBE_HOLONOMY_NOISE_GATE.md`,
  blob `410642ba5765bfb4394205ec733fd0396dbbd03f`, lines 26-43:
  an independently specified apparatus centerline `gamma_t : S¹ → Σ_t`
  lies in a resolving hypersurface; an oriented two-frame is chosen in a
  two-plane of its normal bundle and a scalar loop connection is read out.
- Ravel sandbox `SANDBOX_2026-10-11_MATERIAL_FRAME_ACTION_AND_LEAKAGE.md`,
  blob `27efcf287fd3e5e4b8dcf6a33cead996dba20e32`, lines 13-31:
  the apparatus tube is explicitly not the SAT worldtube; its prepared
  transverse angular mode couples to an SO(2) normal-plane connection.
- Existing `RavelCarrierSheetDimensionGate` and
  `RavelFiberTransportNonuniqueness` distinguish a 1D curve in M⁴
  (conditional rank-three normal complement) from a 1D base with a
  3D spatial fiber (conditional 4D total support and zero ordinary
  normal-complement rank).

## Formal scope

In a chosen orthonormal frame, the three independent coefficients of an
so(3)-valued normal connection are represented by a triple of real numbers.
The apparatus's in-timesheet two-plane readout retains only the coefficient
of the so(2) stabilizer. The two remaining coefficients mix that plane with
the selected timesheet-normal axis.

This module proves:

1. the one-coefficient readout is not injective on general so(3) connection
   coefficients;
2. it is injective on the reduced subspace where both mixing coefficients
   vanish.

The second condition is the component-level requirement for the connection
to preserve the selected timesheet-normal line. It is not derived from the
source. The module does not prove a smooth normal-bundle splitting, a
connection-preserving geometric section, a physical map from the apparatus
tube to the SAT filament, or any physical law. Lean checks only these exact
finite-dimensional propositions.
-/

namespace HsHVerification.RavelNormalConnectionReduction

/-- Three coefficients of an so(3)-valued normal connection in a chosen
    oriented orthonormal frame: one in-sheet plane rotation and two
    components mixing that plane with the selected timesheet-normal axis. -/
abbrev SO3NormalConnectionCoefficients := Fin 3 → ℝ

/-- The in-timesheet so(2) readout retains only the plane-rotation
    coefficient. -/
def inSheetSO2Coefficient
    (omega : SO3NormalConnectionCoefficients) : ℝ :=
  omega 0

/-- Component-level reduction condition: the connection has no components
    mixing the selected in-sheet normal plane with the timesheet-normal axis. -/
def preservesTimesheetNormal
    (omega : SO3NormalConnectionCoefficients) : Prop :=
  omega 1 = 0 ∧ omega 2 = 0

def zeroConnection : SO3NormalConnectionCoefficients := fun _ => 0

/-- A connection with a nonzero component invisible to the in-sheet SO(2)
    readout. -/
def offPlaneConnection : SO3NormalConnectionCoefficients :=
  fun i => if i = 1 then 1 else 0

theorem inSheetReadout_same_for_distinct_connections :
    inSheetSO2Coefficient zeroConnection =
      inSheetSO2Coefficient offPlaneConnection := by
  simp [inSheetSO2Coefficient, zeroConnection, offPlaneConnection]

theorem zeroConnection_ne_offPlaneConnection :
    zeroConnection ≠ offPlaneConnection := by
  intro h
  have h1 := congrFun h 1
  norm_num [zeroConnection, offPlaneConnection] at h1

/-- A scalar SO(2) component cannot reconstruct a general three-component
    SO(3) normal connection. -/
theorem inSheetReadout_not_injective :
    ¬ Function.Injective inSheetSO2Coefficient := by
  intro h
  exact zeroConnection_ne_offPlaneConnection
    (h inSheetReadout_same_for_distinct_connections)

/-- Once the two mixing components are independently constrained to zero,
    the in-sheet SO(2) component determines the full reduced connection. -/
theorem inSheetReadout_injective_on_reduced_subspace
    (omega nu : SO3NormalConnectionCoefficients)
    (hOmega : preservesTimesheetNormal omega)
    (hNu : preservesTimesheetNormal nu)
    (hReadout :
      inSheetSO2Coefficient omega = inSheetSO2Coefficient nu) :
    omega = nu := by
  funext i
  fin_cases i
  · exact hReadout
  · exact hOmega.1.trans hNu.1.symm
  · exact hOmega.2.trans hNu.2.symm

#eval (inSheetSO2Coefficient zeroConnection,
       inSheetSO2Coefficient offPlaneConnection)

#print axioms inSheetReadout_not_injective
#print axioms inSheetReadout_injective_on_reduced_subspace

end HsHVerification.RavelNormalConnectionReduction
