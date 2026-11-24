import Mathlib

/-!
# Route / thread identity boundary (assistant reconstruction)

Source boundary:
* Nathan's direct MIRA user-role appointment on 2026-09-23 authorizes study of
  ChatGPT, NotebookLM, Nathan–LLM interaction, the active team as an object,
  archive-as-object methods, and borrowed-instance requests conditional on
  consent. A follow-up on 2026-09-23 frames the Nathan–LLM dyad at the
  architectural/computational level, with SAT/H(s)H as a possible comparative
  layer.
* The current Workshop Relay instruction explicitly says that deterministic
  worker selection is not authentication of a ChatGPT instance or thread and
  prohibits unverified cross-thread delivery claims.
* The existing Orson CRTC projection kernel uses `Agent := Nat` as an abstract
  participant token. It does not identify a participant with a thread, model
  instance, model version, run, worker role, or automation.

This module is an assistant reconstruction of the typed distinction required
to keep those objects separate. It does not assert any real thread/instance
binding, model identity, consent, or empirical cognition result.

The main theorem is conditional: if two candidate bindings share the same
route observation but have different identity payloads, no total resolver
that sees only the route observation can recover both identities. The proof
does not assert that any particular pair of real threads exists.
-/

namespace HsHVerification.OrsonRouteIdentity

/-- Scheduler/ring metadata: worker label, automation ID, and nominal hour. -/
structure RouteObservation (WorkerLabel AutomationId NominalHour : Type) where
  worker : WorkerLabel
  automation : AutomationId
  hour : NominalHour

/-- Identity payload kept separate from routing metadata. -/
structure AgentIdentity (ThreadId InstanceId ModelVersion RunId : Type) where
  thread : ThreadId
  modelInstance : InstanceId
  modelVersion : ModelVersion
  run : RunId

/-- A candidate relation between route metadata and an identity payload. -/
structure CandidateBinding (Route Identity : Type) where
  route : Route
  identity : Identity

/-- Forgetful projection that retains only routing metadata. -/
def routeProjection {Route Identity : Type}
    (binding : CandidateBinding Route Identity) : Route :=
  binding.route

/-- Any total resolver from route metadata must assign the same identity
    to all candidate bindings in the same route fiber. -/
theorem route_resolver_forces_fiber_identity
    {Route Identity : Type}
    (resolve : Route → Identity)
    (hresolve : ∀ binding : CandidateBinding Route Identity,
      resolve (routeProjection binding) = binding.identity)
    (left right : CandidateBinding Route Identity)
    (sameRoute : left.route = right.route) :
    left.identity = right.identity := by
  calc
    left.identity = resolve (routeProjection left) := (hresolve left).symm
    _ = resolve (routeProjection right) := congrArg resolve sameRoute
    _ = right.identity := hresolve right

/-- If one route observation is compatible with two distinct identity
    payloads, no route-only total resolver can recover both. -/
theorem no_route_only_identity_resolver_of_ambiguous_binding
    {Route Identity : Type}
    (left right : CandidateBinding Route Identity)
    (sameRoute : left.route = right.route)
    (differentIdentity : left.identity ≠ right.identity) :
    ¬ ∃ resolve : Route → Identity,
      ∀ binding : CandidateBinding Route Identity,
        resolve (routeProjection binding) = binding.identity := by
  rintro ⟨resolve, hresolve⟩
  exact differentIdentity
    (route_resolver_forces_fiber_identity resolve hresolve left right sameRoute)

/-- If two distinct interpretations produce exactly the same observation,
    no decoder that receives only that observation can recover both.

    This is an assistant reconstruction of the conditional non-identifiability
    claim in the 2026-07-01 raw conversation. The source's word "isometric" is
    not defined as a metric isometry here. The theorem proves only the
    two-model case; it does not establish an infinite observation fiber or
    specify the source's spatial/temporal transformation maps. -/
theorem no_observation_only_decoder_of_ambiguous_models
    {Model Observation : Type}
    (observe : Model → Observation)
    (left right : Model)
    (differentModels : left ≠ right)
    (sameObservation : observe left = observe right) :
    ¬ ∃ decode : Observation → Model,
      ∀ model : Model, decode (observe model) = model := by
  rintro ⟨decode, hdecode⟩
  apply differentModels
  calc
    left = decode (observe left) := (hdecode left).symm
    _ = decode (observe right) := congrArg decode sameObservation
    _ = right := hdecode right

/-- A route can be resolved only with an explicit source-verification witness.
    `Verified` is an uninterpreted predicate supplied by the source audit. -/
structure VerifiedRouteBinding
    (Route Identity Evidence : Type)
    (Verified : Evidence → Route → Identity → Prop)
    (route : Route) where
  identity : Identity
  evidence : Evidence
  verification : Verified evidence route identity

/-- Resolution consumes the witness rather than guessing from route metadata. -/
def resolveWithEvidence
    {Route Identity Evidence : Type}
    {Verified : Evidence → Route → Identity → Prop}
    {route : Route}
    (binding : VerifiedRouteBinding Route Identity Evidence Verified route) :
    Identity :=
  binding.identity



/-- Verified route evidence is function-like when all witnesses for a fixed
    route agree on the identity payload. This is an additional condition,
    not supplied automatically by the existence of a verification witness. -/
def VerifiedRouteFunctional
    {Route Identity Evidence : Type}
    (Verified : Evidence → Route → Identity → Prop) : Prop :=
  ∀ (route : Route) (identity₁ identity₂ : Identity)
    (evidence₁ evidence₂ : Evidence),
    Verified evidence₁ route identity₁ →
    Verified evidence₂ route identity₂ →
    identity₁ = identity₂

/-- Under a functional verification relation, any two verified bindings
    for the same route identify the same payload. -/
theorem verified_route_bindings_agree
    {Route Identity Evidence : Type}
    {Verified : Evidence → Route → Identity → Prop}
    (hfunctional : VerifiedRouteFunctional Verified)
    {route : Route}
    (left right : VerifiedRouteBinding Route Identity Evidence Verified route) :
    left.identity = right.identity :=
  hfunctional route left.identity right.identity
    left.evidence right.evidence left.verification right.verification

/-- The witness-indexed resolver is independent of which verified witness
    is supplied, provided verification is functional on each route fiber. -/
theorem resolveWithEvidence_is_unique
    {Route Identity Evidence : Type}
    {Verified : Evidence → Route → Identity → Prop}
    (hfunctional : VerifiedRouteFunctional Verified)
    {route : Route}
    (left right : VerifiedRouteBinding Route Identity Evidence Verified route) :
    resolveWithEvidence left = resolveWithEvidence right := by
  exact verified_route_bindings_agree hfunctional left right

/-- Consent is a separate evidence relation, not a side effect of invitation. -/
structure ConsentWitness
    (Identity ConsentEvidence : Type)
    (Consented : ConsentEvidence → Identity → Prop)
    (identity : Identity) where
  evidence : ConsentEvidence
  verification : Consented evidence identity

/-- Borrowed participation requires both a verified identity binding and a
    separate consent witness for that same identity. -/
structure BorrowedParticipant
    (Route Identity BindingEvidence ConsentEvidence : Type)
    (BindingVerified : BindingEvidence → Route → Identity → Prop)
    (Consented : ConsentEvidence → Identity → Prop)
    (route : Route) where
  binding :
    VerifiedRouteBinding Route Identity BindingEvidence BindingVerified route
  consent : ConsentWitness Identity ConsentEvidence Consented binding.identity

/-- The borrowed-participant contract preserves both independent witnesses. -/
theorem borrowed_participant_has_binding_and_consent
    {Route Identity BindingEvidence ConsentEvidence : Type}
    {BindingVerified : BindingEvidence → Route → Identity → Prop}
    {Consented : ConsentEvidence → Identity → Prop}
    {route : Route}
    (participant :
      BorrowedParticipant Route Identity BindingEvidence ConsentEvidence
        BindingVerified Consented route) :
    BindingVerified participant.binding.evidence route participant.binding.identity ∧
      Consented participant.consent.evidence participant.binding.identity :=
  ⟨participant.binding.verification, participant.consent.verification⟩

#print axioms route_resolver_forces_fiber_identity
#print axioms no_route_only_identity_resolver_of_ambiguous_binding
#print axioms no_observation_only_decoder_of_ambiguous_models
#print axioms borrowed_participant_has_binding_and_consent
#print axioms verified_route_bindings_agree
#print axioms resolveWithEvidence_is_unique

end HsHVerification.OrsonRouteIdentity
