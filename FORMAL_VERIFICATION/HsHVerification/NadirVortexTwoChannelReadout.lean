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

noncomputable section

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
  ext <;> dsimp [reconstruct, displacement, coreRadius] <;> ring_nf

theorem observe_reconstruct (η a : ℝ) :
    observe (a + η) (a - η) = (η, a) := by
  ext <;> dsimp [observe, displacement, coreRadius] <;> ring_nf

/-- The paired readout preserves both contour radii exactly. -/
theorem observe_injective :
    Function.Injective (fun p : Readout => observe p.1 p.2) := by
  intro p q h
  have h' := congrArg (fun y : Readout => reconstruct y.1 y.2) h
  simpa [observe, reconstruct_observe] using h'

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
  have hEq :
      (fun p : Readout => displacementOnly p.1 p.2) (0, 0) =
      (fun p : Readout => displacementOnly p.1 p.2) (1, 1) := by
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
  have hEq :
      (fun p : Readout => radiusOnly p.1 p.2) (0, 0) =
      (fun p : Readout => radiusOnly p.1 p.2) (1, -1) := by
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

end
end HsHVerification.NadirVortexTwoChannelReadout


namespace HsHVerification.NadirVortexTwoChannelReadout

noncomputable section

/-!
## Mode-label identifiability of the antipodal pair

The source paper's single-harmonic radial ansatz has phase phi = k z + omega t
and azimuthal factor cos(phi + m theta). At fixed z,t, this records the exact
consequence of evaluating the ansatz at the two antipodal angles 0 and pi:
the pair, and hence the derived (eta,a) readout, is two-periodic in the natural
mode index. Thus this two-sample map alone cannot identify m uniquely.

This is conditional on the stated radial ansatz and the two-point sampling
map. It does NOT assert that the experiment's full camera projection,
contour processing, additional views, or spectral analysis reduce to this
map alone, and it does not claim that the paper misidentified a mode.
Those upstream maps are outside this module and are required to explain
how the experiment separates m = 1 from higher odd modes.
-/

def radialModeContour (m : ℕ) (a₀ ε φ θ : ℝ) : ℝ :=
  a₀ + ε * Real.cos (φ + (m : ℝ) * θ)

/-- Apply the paper's two-contour readout to one radial Fourier mode. -/
def antipodalModeReadout (m : ℕ) (a₀ ε φ : ℝ) : Readout :=
  observe (radialModeContour m a₀ ε φ 0)
    (radialModeContour m a₀ ε φ Real.pi)

lemma cos_add_two_pi (x : ℝ) :
    Real.cos (x + 2 * Real.pi) = Real.cos x := by
  rw [Real.cos_add]
  simp

/-- The source ansatz has identical antipodal samples for modes m and m+2. -/
theorem antipodalModeReadout_two_step (m : ℕ) (a₀ ε φ : ℝ) :
    antipodalModeReadout (m + 2) a₀ ε φ =
      antipodalModeReadout m a₀ ε φ := by
  unfold antipodalModeReadout observe
  have h₀ :
      radialModeContour (m + 2) a₀ ε φ 0 =
        radialModeContour m a₀ ε φ 0 := by
    simp [radialModeContour]
  have hπ :
      radialModeContour (m + 2) a₀ ε φ Real.pi =
        radialModeContour m a₀ ε φ Real.pi := by
    unfold radialModeContour
    have harg :
        φ + ((m + 2 : ℕ) : ℝ) * Real.pi =
          (φ + (m : ℝ) * Real.pi) + 2 * Real.pi := by
      push_cast
      ring
    rw [harg, cos_add_two_pi]
  rw [h₀, hπ]

/-- Even the paired readout cannot identify the mode index on {0,1,2,3}. -/
theorem antipodalModeReadout_not_injective (a₀ ε φ : ℝ) :
    ¬ Function.Injective
      (fun m : Fin 4 => antipodalModeReadout m.val a₀ ε φ) := by
  intro hinj
  have hEq :
      antipodalModeReadout (1 + 2) a₀ ε φ =
        antipodalModeReadout 1 a₀ ε φ :=
    antipodalModeReadout_two_step 1 a₀ ε φ
  have hne : (1 : Fin 4) ≠ 3 := by decide
  exact hne (hinj (by simpa using hEq.symm))

#print axioms antipodalModeReadout_two_step


/-- Any deterministic downstream classifier preserves the m ↔ m+2 alias. -/
theorem downstreamModeClassifier_two_step
    (m : ℕ) (a₀ ε φ : ℝ) {α : Type}
    (classify : Readout → α) :
    classify (antipodalModeReadout (m + 2) a₀ ε φ) =
      classify (antipodalModeReadout m a₀ ε φ) := by
  exact congrArg classify (antipodalModeReadout_two_step m a₀ ε φ)

/-- No deterministic classifier of the two antipodal scalars is injective
on the finite mode set {0,1,2,3}; a downstream function cannot restore the
m=1 versus m=3 distinction after the upstream readout has aliased it. -/
theorem downstreamModeClassifier_not_injective
    (a₀ ε φ : ℝ) {α : Type} (classify : Readout → α) :
    ¬ Function.Injective
      (fun n : Fin 4 => classify (antipodalModeReadout n.val a₀ ε φ)) := by
  intro hinj
  have hEq :
      (fun n : Fin 4 => classify (antipodalModeReadout n.val a₀ ε φ)) 3 =
      (fun n : Fin 4 => classify (antipodalModeReadout n.val a₀ ε φ)) 1 := by
    simpa using downstreamModeClassifier_two_step 1 a₀ ε φ classify
  have hne : (1 : Fin 4) ≠ 3 := by decide
  exact hne (hinj hEq.symm)

#print axioms downstreamModeClassifier_two_step
#print axioms downstreamModeClassifier_not_injective

#print axioms antipodalModeReadout_not_injective

end
end HsHVerification.NadirVortexTwoChannelReadout
