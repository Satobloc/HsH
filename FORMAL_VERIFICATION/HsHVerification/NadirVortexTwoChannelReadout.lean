import Mathlib

/-!
# Two-channel optical readout for a finite vortex core

Source: Barckicke, Falcon & Gissinger, "Kelvin wave propagation along vortex
cores", Nature Physics (2026), DOI 10.1038/s41567-026-03175-w, Methods.

The paper defines, from two opposing contour radii r₀ and rπ,

  η = (r₀ - rπ) / 2
  a = (r₀ + rπ) / 2

where η is the vortex-core displacement and a is its radius.

This module proves only the algebraic information content of that final
two-scalar readout. It does NOT formalize camera projection, contour
detection, PIV/PTV calibration, reconstruction of the complete 3D core,
the Rankine-vortex constitutive model, or Kelvin-wave dynamics. The public
data DOI is recorded in the accompanying research note; no raw dataset or
physical parameters are embedded here.
-/

namespace HsHVerification.NadirVortexTwoChannelReadout

abbrev Readout := ℝ × ℝ

def displacement (r₀ rπ : ℝ) : ℝ := (r₀ - rπ) / 2

def coreRadius (r₀ rπ : ℝ) : ℝ := (r₀ + rπ) / 2

def observe (r₀ rπ : ℝ) : Readout :=
  (displacement r₀ rπ, coreRadius r₀ rπ)

/-- Reconstruct the two opposing contour radii from displacement and radius. -/
def reconstruct (η a : ℝ) : Readout :=
  (a + η, a - η)

theorem reconstruct_observe (r₀ rπ : ℝ) :
    reconstruct (displacement r₀ rπ) (coreRadius r₀ rπ) = (r₀, rπ) := by
  simp [reconstruct, displacement, coreRadius]
  ring

theorem observe_reconstruct (η a : ℝ) :
    observe (a + η) (a - η) = (η, a) := by
  simp [observe, displacement, coreRadius]
  ring

/-- The paired readout preserves both contour radii exactly. -/
theorem observe_injective :
    Function.Injective (fun p : Readout => observe p.1 p.2) := by
  intro p q h
  rcases p with ⟨r₀, rπ⟩
  rcases q with ⟨s₀, sπ⟩
  dsimp [observe, displacement, coreRadius] at h
  rcases h with ⟨hη, ha⟩
  constructor <;> linarith

/-- The two-channel readout is onto ℝ², with the displayed reconstruction. -/
theorem observe_surjective :
    Function.Surjective (fun p : Readout => observe p.1 p.2) := by
  intro y
  rcases y with ⟨η, a⟩
  refine ⟨(a + η, a - η), ?_⟩
  exact observe_reconstruct η a

theorem observe_bijective :
    Function.Bijective (fun p : Readout => observe p.1 p.2) :=
  ⟨observe_injective, observe_surjective⟩

/-- A displacement-only measurement loses the common-radius degree of freedom. -/
def displacementOnly (r₀ rπ : ℝ) : ℝ :=
  displacement r₀ rπ

theorem displacementOnly_not_injective :
    ¬ Function.Injective (fun p : Readout => displacementOnly p.1 p.2) := by
  intro h
  have hEq : displacementOnly 0 0 = displacementOnly 1 1 := by
    norm_num [displacementOnly, displacement]
  have hPair := h hEq
  have hFalse : (0 : ℝ) = 1 := congrArg Prod.fst hPair
  norm_num at hFalse

/-- A radius-only measurement loses the centerline-displacement degree of freedom. -/
def radiusOnly (r₀ rπ : ℝ) : ℝ :=
  coreRadius r₀ rπ

theorem radiusOnly_not_injective :
    ¬ Function.Injective (fun p : Readout => radiusOnly p.1 p.2) := by
  intro h
  have hEq : radiusOnly 0 0 = radiusOnly 1 (-1) := by
    norm_num [radiusOnly, coreRadius]
  have hPair := h hEq
  have hFalse : (0 : ℝ) = 1 := congrArg Prod.fst hPair
  norm_num at hFalse

/-- Linear matrix for (r₀,rπ) ↦ (η,a). -/
def readoutMatrix : Matrix (Fin 2) (Fin 2) ℝ :=
  !![(1 : ℝ) / 2, -(1 : ℝ) / 2; (1 : ℝ) / 2, (1 : ℝ) / 2]

/-- Exact inverse matrix for (η,a) ↦ (r₀,rπ). -/
def inverseReadoutMatrix : Matrix (Fin 2) (Fin 2) ℝ :=
  !![1, 1; -1, 1]

theorem readoutMatrix_mul_inverse :
    readoutMatrix * inverseReadoutMatrix = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [readoutMatrix, inverseReadoutMatrix, Matrix.mul_apply,
      Fin.sum_univ_succ]

theorem inverse_mul_readoutMatrix :
    inverseReadoutMatrix * readoutMatrix = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [readoutMatrix, inverseReadoutMatrix, Matrix.mul_apply,
      Fin.sum_univ_succ]

#print axioms reconstruct_observe
#print axioms observe_reconstruct
#print axioms observe_injective
#print axioms observe_surjective
#print axioms observe_bijective
#print axioms displacementOnly_not_injective
#print axioms radiusOnly_not_injective
#print axioms readoutMatrix_mul_inverse
#print axioms inverse_mul_readoutMatrix

end HsHVerification.NadirVortexTwoChannelReadout
