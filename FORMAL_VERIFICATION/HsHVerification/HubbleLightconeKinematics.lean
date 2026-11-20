import Mathlib

namespace HsHVerification

/-!
# Conditional cosmology/kinematics comparators

These lemmas formalize only coordinate-level or algebraic statements.

* The past-null-cone slice is a Euclidean sphere in the specified
  3+1 Minkowski coordinate model.
* The Hubble-scale normalization is an algebraic identity.
* The equal-rate two-plane rotation is a skew 4x4 Euclidean generator
  whose square is -omega^2 times the identity.

No observer-to-sky map, CMB/stellar data, H(s)H metric, material response,
Einstein solution, or physical prediction is encoded. Real-valued variables
do not carry units in this module.
-/

/-- Coordinate-level past null cone for an observer event at the origin.
    c is a coordinate speed, t is coordinate time, and x is a
    three-dimensional spatial position. -/
def pastNullCone (c t : ℝ) (x : Fin 3 → ℝ) : Prop :=
  t ≤ 0 ∧ (c * t)^2 = ∑ i : Fin 3, (x i)^2

/-- A fixed lookback-time slice of this coordinate null cone is a
    Euclidean sphere of radius c*T when T ≥ 0. This is a standard
    Minkowski comparator, not an identification of observed big circles
    with a particular emission or last-scattering surface. -/
theorem pastNullCone_slice_is_sphere
    (c T : ℝ) (hT : 0 ≤ T) (x : Fin 3 → ℝ) :
    pastNullCone c (-T) x ↔
      ∑ i : Fin 3, (x i)^2 = (c * T)^2 := by
  simp [pastNullCone, hT, mul_neg, sq_neg, eq_comm]

/-- Hubble radius R_H = c/H0, as recorded in the current BEDROCK. -/
def hubbleRadius (c H0 : ℝ) : ℝ := c / H0

/-- Dimensionless Hubble scale epsilon_H(L) = H0*L/c. -/
def epsilonH (H0 L c : ℝ) : ℝ := H0 * L / c

/-- Algebraic equivalence H0*L/c = L/R_H, assuming nonzero c and H0.
    Units and the physical interpretation of H0 are not represented here. -/
theorem epsilonH_eq_length_over_hubbleRadius
    (c H0 L : ℝ) (hc : c ≠ 0) (hH0 : H0 ≠ 0) :
    epsilonH H0 L c = L / hubbleRadius c H0 := by
  unfold epsilonH hubbleRadius
  field_simp [hc, hH0]
  ring

/-- Equal-rate rotation in two orthogonal Euclidean 2-planes.
    This is the explicit block generator omega*J direct-sum omega*J,
    with J = [[0,-1],[1,0]]. -/
def omega4 (w : ℝ) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![0, -w, 0, 0;
     w, 0, 0, 0;
     0, 0, 0, -w;
     0, 0, w, 0]

/-- The block generator is skew-symmetric. -/
theorem omega4_skew (w : ℝ) :
    (omega4 w)ᵀ = -omega4 w := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [omega4]

/-- The corresponding linear vector field has zero divergence,
    since its divergence is the trace of the constant generator. -/
theorem omega4_trace_zero (w : ℝ) :
    Matrix.trace (omega4 w) = 0 := by
  simp [Matrix.trace, omega4]

/-- Applying the generator twice gives centripetal acceleration
    -omega^2 x in this equal-rate Euclidean block-rotation model. -/
theorem omega4_sq (w : ℝ) :
    omega4 w * omega4 w =
      (-(w^2)) • (1 : Matrix (Fin 4) (Fin 4) ℝ) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [omega4, Matrix.mul_apply, Fin.sum_univ_succ] <;> ring

end HsHVerification
