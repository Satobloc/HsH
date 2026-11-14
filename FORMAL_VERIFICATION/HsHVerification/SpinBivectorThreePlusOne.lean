import Mathlib

/-!
# 3+1 coordinate split of a skew four-dimensional tensor

This module is a standard-reference algebraic comparator, not an H(s)H
equation and not a transcription of Nathan's unresolved November 9 discussion.

Relative to a chosen time index 0 and oriented spatial indices (1,2,3), a
skew 4×4 array is represented by two three-component coordinate projections:
the time-space column and the spatial two-form dual.  The reconstruction
identity proves that these are two projections of one skew tensor, not
automatically two independent physical fields.

If the time-space projection vanishes in the chosen frame, the tensor is
reconstructed from the spatial-spin projection alone.  In the standard
relativistic-spin literature this is the coordinate pattern obtained in a
momentum rest frame under a spin-supplementary condition.  The theorem below
formalizes only the coordinate algebra; it does not formalize the covariant
Tulczyjew condition, the Mathisson-Papapetrou-Dixon equations, a Lorentzian
metric, a timesheet embedding, or a physical readout.
-/

namespace HsHVerification.SpinBivectorThreePlusOne

abbrev Matrix4 := Matrix (Fin 4) (Fin 4) ℝ
abbrev Vec3 := Fin 3 → ℝ

/-- Skew-symmetry of a four-dimensional antisymmetric tensor in a chosen basis. -/
def IsSkew (S : Matrix4) : Prop :=
  ∀ i j, S i j = -S j i

/-- The three time-space components relative to the selected time index 0. -/
def timeSpacePart (S : Matrix4) : Vec3 :=
  fun i => S i.succ 0

/-- The spatial two-form dualized to a three-vector using orientation (1,2,3). -/
def spatialSpinPart (S : Matrix4) : Vec3
  | 0 => S 2 3
  | 1 => S 3 1
  | 2 => S 1 2

/-- Reconstruct a skew 4×4 array from its time-space and spatial-spin parts. -/
def assemble (d s : Vec3) : Matrix4 :=
  !![0, -d 0, -d 1, -d 2;
     d 0, 0, s 2, -s 1;
     d 1, -s 2, 0, s 0;
     d 2, s 1, -s 0, 0]

theorem assemble_isSkew (d s : Vec3) : IsSkew (assemble d s) := by
  intro i j
  fin_cases i <;> fin_cases j <;> simp [IsSkew, assemble]

theorem assemble_timeSpacePart (d s : Vec3) :
    timeSpacePart (assemble d s) = d := by
  funext i
  fin_cases i <;> simp [timeSpacePart, assemble]

theorem assemble_spatialSpinPart (d s : Vec3) :
    spatialSpinPart (assemble d s) = s := by
  funext i
  fin_cases i <;> simp [spatialSpinPart, assemble]

/-- Every skew four-dimensional tensor is reconstructed by its two
    three-vector coordinate projections. -/
theorem skew_reassembles (S : Matrix4) (hS : IsSkew S) :
    assemble (timeSpacePart S) (spatialSpinPart S) = S := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [assemble, timeSpacePart, spatialSpinPart] <;>
    linarith [
      hS 0 0, hS 0 1, hS 0 2, hS 0 3,
      hS 1 0, hS 1 1, hS 1 2, hS 1 3,
      hS 2 0, hS 2 1, hS 2 2, hS 2 3,
      hS 3 0, hS 3 1, hS 3 2, hS 3 3
    ]

/-- The time-space projection vanishes exactly when all three
    spatial entries in the selected time column vanish. -/
theorem timeSpacePart_zero_iff (S : Matrix4) :
    timeSpacePart S = 0 ↔ ∀ i : Fin 3, S i.succ 0 = 0 := by
  constructor
  · intro h i
    have hi := congrFun h i
    simpa [timeSpacePart] using hi
  · intro h
    funext i
    exact h i

/-- With the chosen-frame time-space part zero, the skew tensor is
    reconstructed from the spatial-spin vector alone. -/
theorem skew_reassembles_spatial_only
    (S : Matrix4) (hS : IsSkew S)
    (hD : timeSpacePart S = 0) :
    assemble (0 : Vec3) (spatialSpinPart S) = S := by
  rw [← skew_reassembles S hS]
  simp [hD]

/-- The two coordinate projections uniquely determine the reconstructed tensor. -/
theorem assemble_injective :
    Function.Injective (fun p : Vec3 × Vec3 => assemble p.1 p.2) := by
  intro p q h
  have hd := congrArg timeSpacePart h
  have hs := congrArg spatialSpinPart h
  simp [assemble_timeSpacePart, assemble_spatialSpinPart] at hd hs
  exact Prod.ext hd hs

#print axioms assemble_isSkew
#print axioms assemble_timeSpacePart
#print axioms assemble_spatialSpinPart
#print axioms skew_reassembles
#print axioms timeSpacePart_zero_iff
#print axioms skew_reassembles_spatial_only
#print axioms assemble_injective

end HsHVerification.SpinBivectorThreePlusOne
