import Mathlib

/-!
# Ravel: historical Blockwave projector and C1/C2 dependency audit
Source: Satobloc/SAT_THEORY_ARCHIVE_2023-25,
SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt,
Git blob 13b6da983ea8dcad5509b1c6941b8855a2653677.
That document is assistant-style historical mathematics; it is NOT a
verified Nathan-authored equation. See also the original user-role
2024-03-22 DIMENSIONAL GRAVITY message
aaa28a9a-dcfc-4835-8359-e7da7b36911c (3D time surface and 4D strings),
verified in HsH NATHAN_VERIFIED_WORDS_COMPENDIUM.md
blob 1076d5841ea8ec67ddae39e8949dbc5b2649b35c.

This is a conditional coordinate-algebra audit of the historical
Lorentz-signature projector, NOT a derivation of two propagating GW
polarizations, ghost freedom, an independent second-class C2 constraint,
or physical H(s)H truth. The real GW170814 measured-data comparison
is separately executed in Ravel's Python control script and is NOT
proved by this Lean module.
-/

namespace HsHVerification.RavelBlockwaveConstraintGate

structure V4 where
  t : ℝ
  x : ℝ
  y : ℝ
  z : ℝ

/-- The standard local (-+++) Minkowski inner product. -/
def minkDot (a b : V4) : ℝ :=
  -a.t * b.t + a.x * b.x + a.y * b.y + a.z * b.z

/-- Adapted unit timelike normal, a coordinate choice not a new field law. -/
def timeU : V4 := ⟨1, 0, 0, 0⟩

/-- Historical Lorentzian mixed projector P(v)=v+u*g(u,v). -/
def lorentzProj (v : V4) : V4 :=
  ⟨v.t + minkDot timeU v * timeU.t,
   v.x + minkDot timeU v * timeU.x,
   v.y + minkDot timeU v * timeU.y,
   v.z + minkDot timeU v * timeU.z⟩

/-- The adapted-frame coordinate expression for the same projector. -/
def spatialProj (v : V4) : V4 := ⟨0, v.x, v.y, v.z⟩

theorem lorentz_projector_matches_adapted_frame (v : V4) :
    lorentzProj v = spatialProj v := by
  cases v with
  | mk t x y z =>
    simp [lorentzProj, spatialProj, minkDot, timeU]
    <;> ring

theorem spatial_projector_idempotent (v : V4) :
    spatialProj (spatialProj v) = spatialProj v := by
  rfl

theorem spatial_projector_annihilates_time (t : ℝ) :
    spatialProj ⟨t, 0, 0, 0⟩ = (⟨0, 0, 0, 0⟩ : V4) := by
  rfl

/-- All three independent spatial coordinates survive the projection. -/
def spatialEmbed (a : Fin 3 → ℝ) : V4 :=
  ⟨0, a 0, a 1, a 2⟩

theorem spatial_projector_fixes_three_coordinates (a : Fin 3 → ℝ) :
    spatialProj (spatialEmbed a) = spatialEmbed a := by
  rfl

theorem spatial_embedding_injective : Function.Injective spatialEmbed := by
  intro a b h
  have hx : a 0 = b 0 := congrArg V4.x h
  have hy : a 1 = b 1 := congrArg V4.y h
  have hz : a 2 = b 2 := congrArg V4.z h
  funext i
  fin_cases i <;> assumption

/-- This C2 is the historical u·(partial_0 u), NOT a canonical momentum constraint. -/
def C2 (u du : V4) : ℝ := minkDot u du

/-- Algebraic first directional derivative of C1(u)=g(u,u)+1. -/
def dC1 (u du : V4) : ℝ :=
  -2 * u.t * du.t + 2 * u.x * du.x +
  2 * u.y * du.y + 2 * u.z * du.z

theorem dC1_is_twice_C2 (u du : V4) :
    dC1 u du = 2 * C2 u du := by
  dsimp [dC1, C2, minkDot]
  ring

theorem C2_zero_if_C1_preserved (u du : V4)
    (h : dC1 u du = 0) : C2 u du = 0 := by
  have h2 : 2 * C2 u du = 0 := by
    rw [← dC1_is_twice_C2]
    exact h
  nlinarith

theorem C2_zero_iff_C1_preserved (u du : V4) :
    C2 u du = 0 ↔ dC1 u du = 0 := by
  constructor
  · intro h
    rw [dC1_is_twice_C2, h]
    ring
  · exact C2_zero_if_C1_preserved u du


/-!
The historical C2 writes u^mu * partial_0(u_mu), with an index lowered
by g. If g varies, differentiating u_mu differentiates the metric too.
Let q=(partial_0 g)(u,u). Then
  partial_0 C1 = 2*g(u,partial_0 u) + q
  u^mu partial_0 u_mu = g(u,partial_0 u) + q.
This section does NOT assume a dynamical equation for q.
-/

/-- Rate of C1 when the metric itself has a nonzero rate q. -/
def dynamicC1Rate (u du : V4) (q : ℝ) : ℝ := dC1 u du + q

/-- The actual lower-index C2 in the time-varying-metric case. -/
def dynamicLoweredC2 (u du : V4) (q : ℝ) : ℝ := C2 u du + q

theorem dynamic_metric_rate_identity (u du : V4) (q : ℝ) :
    dynamicC1Rate u du q = 2 * dynamicLoweredC2 u du q - q := by
  dsimp [dynamicC1Rate, dynamicLoweredC2]
  rw [dC1_is_twice_C2]
  ring

theorem dynamic_lowered_C2_from_preserved_C1 (u du : V4) (q : ℝ)
    (h : dynamicC1Rate u du q = 0) :
    2 * dynamicLoweredC2 u du q = q := by
  rw [dynamic_metric_rate_identity] at h
  linarith

#print axioms lorentz_projector_matches_adapted_frame
#print axioms spatial_embedding_injective
#print axioms dC1_is_twice_C2
#print axioms C2_zero_iff_C1_preserved
#print axioms dynamic_metric_rate_identity
#print axioms dynamic_lowered_C2_from_preserved_C1

end HsHVerification.RavelBlockwaveConstraintGate
