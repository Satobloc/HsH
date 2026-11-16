import Mathlib

/-!
# SAT O9 source-fidelity gates: local strain and transverse completion

Primary historical equation: SAT_O9_Graviton_Topological_Strain.txt
Git blob c7095697a70f39b3bd05af414e1124ae45a17926.

The historical right-hand side for S_mu_nu(x) has no explicit x-localizer.
Its covariant transverse derivative also requires a neighborhood extension
and a connection, not merely a filament centerline.

These theorems prove only necessary typing/factorization conditions.
No claim that distinct completions physically exist; no physical
measurement, covariance, connection or strain law is established.
-/

namespace HsHVerification.MiraO9StrainLocality

/-- A purported field defined by one x-independent RHS is constant. -/
theorem x_free_rhs_constant {X S : Type*} (rhs : S) (x y : X) :
    (fun _ : X => rhs) x = (fun _ : X => rhs) y := rfl

/-- A nonconstant local field cannot equal an x-independent RHS everywhere. -/
theorem nonconstant_field_needs_localizer {X S : Type*}
    (field : X → S) (x y : X) (hxy : field x ≠ field y) :
    ¬ ∃ rhs : S, ∀ z : X, field z = rhs := by
  rintro ⟨rhs, h⟩
  apply hxy
  calc
    field x = rhs := h x
    _ = field y := (h y).symm

/-- If a transverse jet is recoverable from the centerline trace,
    it must agree on every fiber of the trace map. -/
theorem trace_factor_forces_jet_agreement
    {E T J : Type*} (trace : E → T) (jet : E → J)
    (readout : T → J) (hreadout : ∀ e, jet e = readout (trace e))
    (a b : E) (hab : trace a = trace b) :
    jet a = jet b := by
  calc
    jet a = readout (trace a) := hreadout a
    _ = readout (trace b) := congrArg readout hab
    _ = jet b := (hreadout b).symm

/-- A witness of equal trace but unequal jet blocks a trace-only strain law.
    The witness is a hypothesis, not asserted as physical observation. -/
theorem distinct_jets_block_trace_only_recovery
    {E T J : Type*} (trace : E → T) (jet : E → J)
    (a b : E) (htrace : trace a = trace b)
    (hjet : jet a ≠ jet b) :
    ¬ ∃ readout : T → J, ∀ e, jet e = readout (trace e) := by
  rintro ⟨readout, hreadout⟩
  exact hjet (trace_factor_forces_jet_agreement
    trace jet readout hreadout a b htrace)

#print axioms x_free_rhs_constant
#print axioms nonconstant_field_needs_localizer
#print axioms trace_factor_forces_jet_agreement
#print axioms distinct_jets_block_trace_only_recovery

end HsHVerification.MiraO9StrainLocality
