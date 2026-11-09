import Mathlib

/-!
# Code Grurple observation-gate typed identity model

This is an operational transition-system proposal for the existing
source -> feed -> adapter -> derivative -> deployment -> route chain.

The earlier model used one abstract Nat token for every identity. This
version separates Git blob SHA-1, Git commit SHA-1, SHA-256 content digests,
deployment references, and route references into distinct types. The
lexical predicates below check only lowercase-hex shape and expected length;
they do not compute a hash from bytes. The external workflow must independently
compute each digest and bind it to the actual repository object or artifact.

Deployment and route references are namespaced by DeploymentTarget. This
prevents a build in one hosting namespace (for example, GitHub Pages) from
being mistaken for a deployment in another (for example, ChatGPT Sites).
These target labels and references remain formal inputs, not observations of
a live deployment or reader.

The model is invalidation-only. Rebinding requires a new State constructed
after external source/feed/build/deployment checks have actually passed. It
formalizes no browser security property, no live route state, and no physical
H(s)H claim.
-/

namespace HsHVerification.CodeGrurpleObservationGate

/-- Hosting/deployment namespace. -/
inductive DeploymentTarget where
  | githubPages
  | chatgptSites
  | other
deriving DecidableEq, Repr

/-- Git blob SHA-1 identity; distinct from a Git commit SHA-1. -/
structure GitBlobSha1 where
  value : String
deriving DecidableEq, Repr

/-- Git commit SHA-1 identity; distinct from a blob identity. -/
structure GitCommitSha1 where
  value : String
deriving DecidableEq, Repr

/-- Content SHA-256 identity; not interchangeable with Git SHA-1. -/
structure Sha256Digest where
  value : String
deriving DecidableEq, Repr

/-- Provider-scoped deployment reference. -/
structure DeploymentId where
  target : DeploymentTarget
  value : String
deriving DecidableEq, Repr

/-- Provider-scoped reader-route reference. -/
structure RouteId where
  target : DeploymentTarget
  value : String
deriving DecidableEq, Repr

/-- ASCII lowercase hexadecimal character. -/
def isLowerHexDigit (c : Char) : Bool :=
  let n := c.toNat
  decide ((48 ≤ n ∧ n ≤ 57) ∨ (97 ≤ n ∧ n ≤ 102))

/-- Lexical shape only: exact length plus lowercase hexadecimal characters. -/
def lowerHexStringShape (s : String) (expectedLength : Nat) : Bool :=
  decide (s.length = expectedLength) && s.toList.all isLowerHexDigit

def gitBlobSha1Shape (x : GitBlobSha1) : Bool :=
  lowerHexStringShape x.value 40

def gitCommitSha1Shape (x : GitCommitSha1) : Bool :=
  lowerHexStringShape x.value 40

def sha256Shape (x : Sha256Digest) : Bool :=
  lowerHexStringShape x.value 64

def deploymentRefPresent (x : DeploymentId) : Bool :=
  decide (x.value.length > 0)

def routeRefPresent (x : RouteId) : Bool :=
  decide (x.value.length > 0)

/-- The source is identified by its Git blob object, not by a generic token. -/
structure SourceArtifact where
  id : GitBlobSha1
deriving DecidableEq, Repr

/-- The feed is a Git blob and explicitly binds the source Git blob. -/
structure FeedArtifact where
  id : GitBlobSha1
  sourceId : GitBlobSha1
deriving DecidableEq, Repr

/-- The adapter implementation is pinned by a Git commit. -/
structure AdapterArtifact where
  id : GitCommitSha1
  feedId : GitBlobSha1
deriving DecidableEq, Repr

/-- The compiled presentation derivative is identified by content SHA-256. -/
structure DerivativeArtifact where
  id : Sha256Digest
  adapterId : GitCommitSha1
deriving DecidableEq, Repr

/-- A deployment binds the exact derivative and a provider-scoped identity. -/
structure DeploymentArtifact where
  id : DeploymentId
  derivativeId : Sha256Digest
deriving DecidableEq, Repr

/-- A route binds the exact deployment and its provider namespace. -/
structure RouteArtifact where
  id : RouteId
  deploymentId : DeploymentId
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

/-- Every edge binds the exact typed upstream identity. Digest strings must
    have the expected lexical shape, and provider references must be nonempty.
    This does not compute hashes or establish the external byte-to-ID mapping. -/
def bindingsCurrent (s : State) : Bool :=
  match s.source, s.feed, s.adapter, s.derivative, s.deployment, s.route with
  | some source, some feed, some adapter, some derivative, some deployment, some route =>
      gitBlobSha1Shape source.id &&
      gitBlobSha1Shape feed.id &&
      gitCommitSha1Shape adapter.id &&
      sha256Shape derivative.id &&
      deploymentRefPresent deployment.id &&
      routeRefPresent route.id &&
      decide (feed.sourceId = source.id) &&
      decide (adapter.feedId = feed.id) &&
      decide (derivative.adapterId = adapter.id) &&
      decide (deployment.derivativeId = derivative.id) &&
      decide (route.deploymentId = deployment.id) &&
      decide (deployment.id.target = route.id.target)
  | _, _, _, _, _, _ => false

/-- A route probe requires a complete typed identity chain and a separately
    granted observation capability. -/
def routeProbeAuthorized (s : State) : Bool :=
  bindingsCurrent s && s.observationCapability

/-- The accepted Paper A source and current paper feed identifiers have the
    expected Git blob SHA-1 lexical form. This does not prove their repository
    binding; that remains an independently fetched source fact. -/
example : gitBlobSha1Shape ⟨"13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa"⟩ = true := by
  decide

example : gitBlobSha1Shape ⟨"e3552fdac0f187b066b59a9742563094efffe011"⟩ = true := by
  decide

/-- Binding validity is independent of the separately granted observation bit. -/
theorem bindingsCurrent_ignores_observation_capability (s : State) (capability : Bool) :
    bindingsCurrent { s with observationCapability := capability } = bindingsCurrent s := by
  cases s
  rfl

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
  simp [routeProbeAuthorized, step, grantObservation,
    bindingsCurrent_ignores_observation_capability]

theorem capability_grant_cannot_repair_incomplete_chain (s : State)
    (h : bindingsCurrent s = false) :
    routeProbeAuthorized (step s .capabilityGranted) = false := by
  rw [capability_grant_requires_complete_identity_chain]
  exact h

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

theorem mismatched_deployment_target_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : deployment.id.target ≠ route.id.target) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

theorem github_pages_ne_chatgpt_sites :
    DeploymentTarget.githubPages ≠ DeploymentTarget.chatgptSites := by
  decide

theorem github_pages_deployment_cannot_authorize_chatgpt_site_route
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool)
    (hDeployment : deployment.id.target = DeploymentTarget.githubPages)
    (hRoute : route.id.target = DeploymentTarget.chatgptSites) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  apply mismatched_deployment_target_blocks_probe
  intro hEqual
  exact github_pages_ne_chatgpt_sites (hDeployment.symm.trans (hEqual.trans hRoute))

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

theorem malformed_source_blob_shape_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : gitBlobSha1Shape source.id = false) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

theorem malformed_feed_blob_shape_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : gitBlobSha1Shape feed.id = false) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

theorem malformed_adapter_commit_shape_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : gitCommitSha1Shape adapter.id = false) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

theorem malformed_derivative_sha256_shape_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : sha256Shape derivative.id = false) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

theorem empty_deployment_ref_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : deploymentRefPresent deployment.id = false) :
    routeProbeAuthorized
      { source := some source, feed := some feed, adapter := some adapter,
        derivative := some derivative, deployment := some deployment,
        route := some route, observationCapability := capability } = false := by
  simp [routeProbeAuthorized, bindingsCurrent, h]

theorem empty_route_ref_blocks_probe
    (source : SourceArtifact) (feed : FeedArtifact)
    (adapter : AdapterArtifact) (derivative : DerivativeArtifact)
    (deployment : DeploymentArtifact) (route : RouteArtifact)
    (capability : Bool) (h : routeRefPresent route.id = false) :
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
#print axioms bindingsCurrent_ignores_observation_capability
#print axioms capability_grant_requires_complete_identity_chain
#print axioms capability_grant_cannot_repair_incomplete_chain
#print axioms source_change_does_not_grant_capability
#print axioms mismatched_source_feed_binding_blocks_probe
#print axioms mismatched_deployment_target_blocks_probe
#print axioms github_pages_ne_chatgpt_sites
#print axioms github_pages_deployment_cannot_authorize_chatgpt_site_route
#print axioms mismatched_route_deployment_binding_blocks_probe
#print axioms malformed_source_blob_shape_blocks_probe
#print axioms malformed_feed_blob_shape_blocks_probe
#print axioms malformed_adapter_commit_shape_blocks_probe
#print axioms malformed_derivative_sha256_shape_blocks_probe
#print axioms empty_deployment_ref_blocks_probe
#print axioms empty_route_ref_blocks_probe

end HsHVerification.CodeGrurpleObservationGate
