import Mathlib

/-!
# Code Grurple observation-gate invalidation model

This is an operational transition-system proposal for the existing
source -> feed -> adapter -> derivative -> deployment -> route chain.

Unlike a Boolean "current" flag model, this version carries an opaque
identifier for each artifact and an explicit identifier binding at each
dependency edge. The identifiers stand for externally verified version
identities. They are not hashes computed by Lean, and this module does not
inspect repository bytes, a PDF, a deployment, or a live reader.

The model is invalidation-only. Rebinding requires a new State constructed
after the external source/feed/build/deployment checks have actually passed.
It formalizes no browser security property, no live route state, and no
physical H(s)H claim.
-/

namespace HsHVerification.CodeGrurpleObservationGate

/-- Abstract version identity. The external workflow must bind this token
    to the actual SHA/deployment identifier; Nat is not a hash function. -/
abbrev ArtifactId := Nat

structure SourceArtifact where
  id : ArtifactId
deriving DecidableEq, Repr

structure FeedArtifact where
  id : ArtifactId
  sourceId : ArtifactId
deriving DecidableEq, Repr

structure AdapterArtifact where
  id : ArtifactId
  feedId : ArtifactId
deriving DecidableEq, Repr

structure DerivativeArtifact where
  id : ArtifactId
  adapterId : ArtifactId
deriving DecidableEq, Repr

structure DeploymentArtifact where
  id : ArtifactId
  derivativeId : ArtifactId
deriving DecidableEq, Repr

structure RouteArtifact where
  id : ArtifactId
  deploymentId : ArtifactId
deriving DecidableEq, Repr

inductive Event where
  | sourceChanged
  | feedChanged
  | adapterChanged
  | derivativeChanged
  | deploymentChanged
  | routeChanged
  | capabilityGranted
  | capabilityRevoked
deriving DecidableEq, Repr

structure State where
  source : Option SourceArtifact
  feed : Option FeedArtifact
  adapter : Option AdapterArtifact
  derivative : Option DerivativeArtifact
  deployment : Option DeploymentArtifact
  route : Option RouteArtifact
  observationCapability : Bool
deriving DecidableEq, Repr

/-- Every edge in the artifact chain must identify the exact upstream
    artifact used to produce the downstream one. Missing artifacts or
    mismatched identities make the chain incomplete. -/
def bindingsCurrent (s : State) : Bool :=
  match s.source, s.feed, s.adapter, s.derivative, s.deployment, s.route with
  | some source, some feed, some adapter, some derivative, some deployment, some route =>
      decide (feed.sourceId = source.id) &&
      decide (adapter.feedId = feed.id) &&
      decide (derivative.adapterId = adapter.id) &&
      decide (deployment.derivativeId = derivative.id) &&
      decide (route.deploymentId = deployment.id)
  | _, _, _, _, _, _ => false

/-- A route probe requires both a complete identity chain and an
    independently granted observation capability. -/
def routeProbeAuthorized (s : State) : Bool :=
  bindingsCurrent s && s.observationCapability

def clearSource (s : State) : State := { s with source := none }
def clearFeed (s : State) : State := { s with feed := none }
def clearAdapter (s : State) : State := { s with adapter := none }
def clearDerivative (s : State) : State := { s with derivative := none }
def clearDeployment (s : State) : State := { s with deployment := none }
def clearRoute (s : State) : State := { s with route := none }
def grantObservation (s : State) : State := { s with observationCapability := true }
def revokeObservation (s : State) : State := { s with observationCapability := false }

/-- A change invalidates the changed artifact and every downstream artifact
    whose identity depends on it. No invalidation event grants observation
    capability or manufactures a replacement artifact. -/
def step (s : State) : Event → State
  | .sourceChanged =>
      clearRoute (clearDeployment (clearDerivative (clearAdapter (clearFeed (clearSource s)))))
  | .feedChanged =>
      clearRoute (clearDeployment (clearDerivative (clearAdapter (clearFeed s))))
  | .adapterChanged =>
      clearRoute (clearDeployment (clearDerivative (clearAdapter s)))
  | .derivativeChanged =>
      clearRoute (clearDeployment (clearDerivative s))
  | .deploymentChanged =>
      clearRoute (clearDeployment s)
  | .routeChanged =>
      clearRoute s
  | .capabilityGranted =>
      grantObservation s
  | .capabilityRevoked =>
      revokeObservation s

theorem source_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .sourceChanged) = false := by
  simp [routeProbeAuthorized, bindingsCurrent, step, clearRoute, clearDeployment,
    clearDerivative, clearAdapter, clearFeed, clearSource]

theorem feed_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .feedChanged) = false := by
  simp [routeProbeAuthorized, bindingsCurrent, step, clearRoute, clearDeployment,
    clearDerivative, clearAdapter, clearFeed]

theorem adapter_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .adapterChanged) = false := by
  simp [routeProbeAuthorized, bindingsCurrent, step, clearRoute, clearDeployment,
    clearDerivative, clearAdapter]

theorem derivative_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .derivativeChanged) = false := by
  simp [routeProbeAuthorized, bindingsCurrent, step, clearRoute, clearDeployment,
    clearDerivative]

theorem deployment_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .deploymentChanged) = false := by
  simp [routeProbeAuthorized, bindingsCurrent, step, clearRoute, clearDeployment]

theorem route_change_invalidates_probe (s : State) :
    routeProbeAuthorized (step s .routeChanged) = false := by
  simp [routeProbeAuthorized, bindingsCurrent, step, clearRoute]

theorem capability_revocation_blocks_probe (s : State) :
    routeProbeAuthorized (step s .capabilityRevoked) = false := by
  simp [routeProbeAuthorized, step, revokeObservation]

/-- Granting access changes only the capability bit. It cannot repair a
    missing or mismatched source-to-route identity chain. -/
theorem capability_grant_requires_complete_identity_chain (s : State) :
    routeProbeAuthorized (step s .capabilityGranted) = bindingsCurrent s := by
  simp [routeProbeAuthorized, step, grantObservation]

theorem capability_grant_cannot_repair_incomplete_chain (s : State)
    (h : bindingsCurrent s = false) :
    routeProbeAuthorized (step s .capabilityGranted) = false := by
  simp [routeProbeAuthorized, bindingsCurrent, step, grantObservation, h]

theorem source_change_does_not_grant_capability (s : State) :
    (step s .sourceChanged).observationCapability = s.observationCapability := by
  simp [step, clearRoute, clearDeployment, clearDerivative, clearAdapter,
    clearFeed, clearSource]

theorem mismatched_source_feed_binding_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : feed.sourceId ≠ source.id) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

theorem mismatched_route_deployment_binding_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : route.deploymentId ≠ deployment.id) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

#print axioms source_change_invalidates_probe
#print axioms feed_change_invalidates_probe
#print axioms adapter_change_invalidates_probe
#print axioms derivative_change_invalidates_probe
#print axioms deployment_change_invalidates_probe
#print axioms route_change_invalidates_probe
#print axioms capability_revocation_blocks_probe
#print axioms capability_grant_requires_complete_identity_chain
#print axioms capability_grant_cannot_repair_incomplete_chain
#print axioms source_change_does_not_grant_capability
#print axioms mismatched_source_feed_binding_blocks_probe
#print axioms mismatched_route_deployment_binding_blocks_probe

end HsHVerification.CodeGrurpleObservationGate
