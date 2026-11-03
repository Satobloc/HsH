import HsHVerification.MeridianUIOrigin

/-!
# Mercer S2: same observed direction, distinct frame lifts
Measured anchor: S2 around Sgr A*, GRAVITY Collaboration (2020),
A&A 636 L5, Appendix E Table E.1. The S2 numbers are used in a
separate executed Python audit, not encoded as physics axioms here.
Historical UI mapper source blob 373d8632429e010532e6ca2589465bb90a9a3c1d.

These propositions concern function composition and non-identifiability.
They do not prove that the UI map is a physical worldtube connection.
-/
namespace HsHVerification.MercerS2GaugeLift

theorem stabilizer_preserves_seed_readout
    {V : Type*} (R Q : V → V) (seed : V)
    (hfix : Q seed = seed) : R (Q seed) = R seed := by
  rw [hfix]

theorem time_dependent_stabilizer_preserves_history
    {T V : Type*} (R Q : T → V → V) (seed : V)
    (hfix : ∀ t, Q t seed = seed) :
    ∀ t, R t (Q t seed) = R t seed := by
  intro t
  exact stabilizer_preserves_seed_readout (R t) (Q t) seed (hfix t)

theorem distinct_lifts_can_share_readout
    {V : Type*} (R Q₁ Q₂ : V → V) (seed : V)
    (hR : Function.Injective R)
    (hdistinct : Q₁ ≠ Q₂)
    (hfix₁ : Q₁ seed = seed) (hfix₂ : Q₂ seed = seed) :
    (fun v => R (Q₁ v)) ≠ (fun v => R (Q₂ v)) ∧
    R (Q₁ seed) = R (Q₂ seed) := by
  constructor
  · intro heq
    apply hdistinct
    funext v
    apply hR
    exact congrFun heq v
  · rw [hfix₁, hfix₂]

#print axioms stabilizer_preserves_seed_readout
#print axioms time_dependent_stabilizer_preserves_history
#print axioms distinct_lifts_can_share_readout
end HsHVerification.MercerS2GaugeLift
