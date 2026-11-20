import HsHVerification.AriadneD3Projection

/-!
# Ariadne: D3 observable readout / inverse gate

A readout that factors through the historical D3 projected Q cannot
distinguish states collapsed by Q. This is a conditional theorem, not
evidence that two distinct measured physical worldtubes exist.
-/

namespace HsHVerification.AriadneD3

def FactorsThroughQ {Obs : Type*}
    (readout : Descriptor → Obs) : Prop :=
  ∃ f : ℝ → Obs, ∀ x, readout x = f (projectedQ x)

theorem factor_readout_collapses
    {Obs : Type*} (readout : Descriptor → Obs)
    (hfactor : FactorsThroughQ readout)
    (a b : Descriptor)
    (hw : a.wind = b.wind)
    (hl : a.link = b.link)
    (hr : a.writhe = b.writhe) :
    readout a = readout b := by
  rcases hfactor with ⟨f, hf⟩
  calc
    readout a = f (projectedQ a) := hf a
    _ = f (projectedQ b) :=
      congrArg f (projectedQ_eq_of_components a b hw hl hr)
    _ = readout b := (hf b).symm

theorem distinguishable_readout_refutes_factorization
    {Obs : Type*} (readout : Descriptor → Obs)
    (a b : Descriptor)
    (hw : a.wind = b.wind)
    (hl : a.link = b.link)
    (hr : a.writhe = b.writhe)
    (hdifferent : readout a ≠ readout b) :
    ¬ FactorsThroughQ readout := by
  intro hfactor
  exact hdifferent (factor_readout_collapses readout hfactor a b hw hl hr)

end HsHVerification.AriadneD3
