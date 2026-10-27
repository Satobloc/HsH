import Mathlib

/-!
Nadir Voss | Gravity Probe B four-gyroscope covariance/observability gate
2026-10-27, sandbox research. Source:
C. W. F. Everitt et al., Phys. Rev. Lett. 106, 221101 (2011),
DOI 10.1103/PhysRevLett.106.221101, Table II.
Science 2004-08-28 to 2005-08-14, four gyroscopes.
All rates and quoted standard uncertainties are in mas/year.

These are source-transcribed RATIONAL values. The diagonal-only
inverse-variance estimators deliberately discard the experiment's
reported 2x2 gyro covariance blocks, parameter-sensitivity covariance,
and other systematics. They are NOT the published joint fit.

The six-coordinate structure below is an assistant-defined LINEARIZED
observability contract for the six-dimensional so(4) algebra; it is NOT
a physical GP-B SO(4) lift or an H(s)H constitutive law.
Lean verifies only the encoded mathematics and literal numeric identities.
-/

namespace HsHVerification.NadirGPBFourGyroGate

def nsDiagonalMean : ℚ :=
  (((-65886 : ℚ) / 10) / ((317 : ℚ) / 10)^2 +
   ((-67070 : ℚ) / 10) / ((641 : ℚ) / 10)^2 +
   ((-66105 : ℚ) / 10) / ((432 : ℚ) / 10)^2 +
   ((-65887 : ℚ) / 10) / ((332 : ℚ) / 10)^2) /
  (1 / ((317 : ℚ) / 10)^2 +
   1 / ((641 : ℚ) / 10)^2 +
   1 / ((432 : ℚ) / 10)^2 +
   1 / ((332 : ℚ) / 10)^2)

def weDiagonalMean : ℚ :=
  (((-413 : ℚ) / 10) / ((246 : ℚ) / 10)^2 +
   ((-161 : ℚ) / 10) / ((297 : ℚ) / 10)^2 +
   ((-250 : ℚ) / 10) / ((121 : ℚ) / 10)^2 +
   ((-493 : ℚ) / 10) / ((114 : ℚ) / 10)^2) /
  (1 / ((246 : ℚ) / 10)^2 +
   1 / ((297 : ℚ) / 10)^2 +
   1 / ((121 : ℚ) / 10)^2 +
   1 / ((114 : ℚ) / 10)^2)

/-- Published GP-B joint-fit geodetic residual against the quoted GR baseline. -/
theorem published_geodetic_residual :
    ((-66018 : ℚ) / 10) - ((-66061 : ℚ) / 10) = 43 / 10 := by
  norm_num

/-- Published GP-B joint-fit frame-dragging residual against GR. -/
theorem published_frame_dragging_residual :
    ((-372 : ℚ) / 10) - ((-392 : ℚ) / 10) = 2 := by
  norm_num

/-- Naive diagonal-only gyro weighting does NOT reproduce the published
    covariance-aware joint geodetic mean. -/
theorem geodetic_diagonal_not_published :
    nsDiagonalMean ≠ (-66018 : ℚ) / 10 := by
  norm_num [nsDiagonalMean]

/-- Same distinction for the second independently reported drift component. -/
theorem frame_drag_diagonal_not_published :
    weDiagonalMean ≠ (-372 : ℚ) / 10 := by
  norm_num [weDiagonalMean]

/-- A proposed six-component infinitesimal transport description, with
    two GP-B readout channels and four unmeasured algebra components.
    The projection is a declared ASSUMPTION, not a physical derivation. -/
structure LinearizedSixPlane where
  geodetic : ℝ
  frameDrag : ℝ
  hiddenA : ℝ
  hiddenB : ℝ
  hiddenC : ℝ
  hiddenD : ℝ

def measuredProjection (x : LinearizedSixPlane) : ℝ × ℝ :=
  (x.geodetic, x.frameDrag)

/-- For the declared projection, varying a hidden plane cannot affect
    the measured two-channel readout. -/
theorem hidden_plane_invisible (x : LinearizedSixPlane) (h : ℝ) :
    measuredProjection {x with hiddenA := h} = measuredProjection x := by
  rfl

/-- Two scalar GP-B readouts cannot uniquely identify all six components
    under the declared linearized projection. No physical lift follows. -/
theorem measured_projection_not_injective :
    ¬ Function.Injective measuredProjection := by
  intro h_inj
  let x : LinearizedSixPlane := ⟨0, 0, 0, 0, 0, 0⟩
  let y : LinearizedSixPlane := ⟨0, 0, 1, 0, 0, 0⟩
  have h_obs : measuredProjection x = measuredProjection y := by rfl
  have h_eq := congrArg LinearizedSixPlane.hiddenA (h_inj h_obs)
  have h_bad : (0 : ℝ) = 1 := by simpa [x, y] using h_eq
  norm_num at h_bad

#print axioms published_geodetic_residual
#print axioms published_frame_dragging_residual
#print axioms geodetic_diagonal_not_published
#print axioms frame_drag_diagonal_not_published
#print axioms hidden_plane_invisible
#print axioms measured_projection_not_injective

end HsHVerification.NadirGPBFourGyroGate
