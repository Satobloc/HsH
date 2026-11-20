import Mathlib

/-!
# Calder: projection / inverse-identifiability gate

Historical source: HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Back hallways .txt
Git blob 312927701d258855da75594b945deaf66987ca84, lines 10-29.
The assistant-authored historical harness proposes pi_i : P -> O_i and
H_ij = pi_j o pi_i^{-1}, only where pi_i is invertible.

This module checks a CONDITIONAL information-loss theorem for a
projection that forgets one component. It does not establish that the
actual physical SAT projection has this exact form, or that any two
distinct physical worldtubes exist with the same measured image.
-/

namespace HsHVerification.CalderProjectionGate

variable {Obs Hidden Extra : Type*}

/-- A generic readout that does not observe the hidden coordinate. -/
def firstReadout (p : Obs × Hidden) : Obs := p.1

/-- If distinct hidden states are admitted, their first-component
    readouts agree while the full descriptions differ. -/
theorem hidden_fiber_collision (o : Obs) (a b : Hidden) (hab : a ≠ b) :
    firstReadout (o, a) = firstReadout (o, b) ∧
      (o, a) ≠ (o, b) := by
  constructor
  · rfl
  · intro h
    exact hab (congrArg Prod.snd h)

/-- The one-component readout cannot be injective if a hidden fiber
    contains two distinguishable candidates. -/
theorem readout_not_injective (o : Obs) (a b : Hidden) (hab : a ≠ b) :
    ¬ Function.Injective (firstReadout (Obs := Obs) (Hidden := Hidden)) := by
  intro hinj
  have h : (o, a) = (o, b) := hinj rfl
  exact hab (congrArg Prod.snd h)

/-- A single readout admits no globally exact inverse on the whole
    candidate space when the hidden fiber has two distinct members. -/
theorem no_global_reconstruction (o : Obs) (a b : Hidden) (hab : a ≠ b) :
    ¬ ∃ reconstruct : Obs → Obs × Hidden,
      ∀ p : Obs × Hidden, reconstruct (firstReadout p) = p := by
  rintro ⟨reconstruct, hrec⟩
  have ha := hrec (o, a)
  have hb := hrec (o, b)
  have heq : (o, a) = (o, b) := by
    calc
      (o, a) = reconstruct (firstReadout (o, a)) := ha.symm
      _ = reconstruct (firstReadout (o, b)) := rfl
      _ = (o, b) := hb
  exact hab (congrArg Prod.snd heq)

/-- Adding a second readout, but without asserting it is actually
    measured or physically realizable. -/
def augmentedReadout (extra : Hidden → Extra) (p : Obs × Hidden) :
    Obs × Extra := (p.1, extra p.2)

/-- The extra readout restores injectivity only if it independently
    distinguishes every hidden candidate. -/
theorem augmented_injective_of_extra_injective
    (extra : Hidden → Extra) (hextra : Function.Injective extra) :
    Function.Injective (augmentedReadout (Obs := Obs) extra) := by
  intro x y h
  have hobs : x.1 = y.1 := by
    exact congrArg (fun q : Obs × Extra => q.1) h
  have hex : extra x.2 = extra y.2 := by
    exact congrArg (fun q : Obs × Extra => q.2) h
  exact Prod.ext hobs (hextra hex)

#print axioms hidden_fiber_collision
#print axioms readout_not_injective
#print axioms no_global_reconstruction
#print axioms augmented_injective_of_extra_injective

end HsHVerification.CalderProjectionGate
