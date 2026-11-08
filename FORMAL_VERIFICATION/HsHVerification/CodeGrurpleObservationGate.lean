import Mathlib

/-!
A small operational state machine for the Code Grurple presentation gate.

This formalizes only the proposed workflow rule: source/feed/adapter/derivative/
deployment invalidations cannot themselves authorize a route probe. A probe
requires all source-to-route bindings plus an independently granted observation
capability. This is not a model of browser security, a deployment system, or
physical H(s)H behavior.
-/

namespace HsHVerification.CodeGrurpleObservationGate

inductive Event where
  | sourceChanged
  | feedChanged
  | adapterChanged
  | derivativeChanged
  | deploymentChanged
  | capabilityGranted
  | capabilityRevoked
deriving DecidableEq, Repr

structure State where
  sourceCurrent : Bool
  feedCurrent : Bool
  adapterCurrent : Bool
  derivativeBound : Bool
  deploymentBound : Bool
  routeBound : Bool
  observationCapability : Bool
deriving DecidableEq, Repr

def step (s : State) : Event → State
  | .sourceChanged =>
      { s with sourceCurrent := false,
        adapterCurrent := false,
        derivativeBound := false,
        deploymentBound := false,
        routeBound := false }
  | .feedChanged =>
      { s with feedCurrent := false,
        deploymentBound := false,
        routeBound := false }
  | .adapterChanged =>
      { s with adapterCurrent := false,
        derivativeBound := false,
        deploymentBound := false }
  | .derivativeChanged =>
      { s with derivativeBound := false,
        deploymentBound := false }
  | .deploymentChanged =>
      { s with deploymentBound := false }
  | .capabilityGranted =>
      { s with observationCapability := true }
  | .capabilityRevoked =>
      { s with observationCapability := false }

def routeProbeAuthorized (s : State) : Bool :=
  s.sourceCurrent && s.feedCurrent && s.adapterCurrent &&
    s.derivativeBound && s.deploymentBound && s.routeBound &&
    s.observationCapability

theorem source_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .sourceChanged) = false := by
  simp [routeProbeAuthorized, step]

theorem feed_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .feedChanged) = false := by
  simp [routeProbeAuthorized, step]

theorem adapter_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .adapterChanged) = false := by
  simp [routeProbeAuthorized, step]

theorem derivative_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .derivativeChanged) = false := by
  simp [routeProbeAuthorized, step]

theorem deployment_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .deploymentChanged) = false := by
  simp [routeProbeAuthorized, step]

theorem capability_revocation_blocks_probe (s : State) :
    routeProbeAuthorized (step s .capabilityRevoked) = false := by
  simp [routeProbeAuthorized, step]

theorem capability_grant_requires_all_bindings (s : State) :
    routeProbeAuthorized (step s .capabilityGranted) =
      (s.sourceCurrent && s.feedCurrent && s.adapterCurrent &&
        s.derivativeBound && s.deploymentBound && s.routeBound) := by
  simp [routeProbeAuthorized, step]

theorem source_change_does_not_grant_capability (s : State) :
    (step s .sourceChanged).observationCapability = s.observationCapability := by
  rfl

#print axioms source_change_invalidates_probe
#print axioms feed_change_invalidates_probe
#print axioms adapter_change_invalidates_probe
#print axioms derivative_change_invalidates_probe
#print axioms deployment_change_invalidates_probe
#print axioms capability_revocation_blocks_probe
#print axioms capability_grant_requires_all_bindings
#print axioms source_change_does_not_grant_capability

end HsHVerification.CodeGrurpleObservationGate
