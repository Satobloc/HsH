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


/-!
## Workflow-trigger scope layer

The typed source/feed/adapter/derivative/deployment/route chain above is necessary
but not sufficient to establish that a particular workflow event is relevant
to a particular reader route. This layer adds an explicit path-scope witness,
workflow-run status, commit binding, and route/deployment identity binding.

The path-match booleans below are external attestations: this module does not
implement GitHub Actions glob semantics, inspect a Git diff, fetch a workflow
run, or observe a deployment. The external evidence producer must bind the
exact changed path, workflow watch pattern, run ID, run commit, deployment
commit, deployment target, and route to their actual sources.

This remains an operational gate model. It does not establish browser access,
live rendering, manuscript correctness, or any physical H(s)H claim.
-/

namespace HsHVerification.CodeGrurpleWorkflowScope

open HsHVerification.CodeGrurpleObservationGate

/-- One exact changed-path / workflow-watch-pattern witness.
    The two Bool fields must be supplied from independently inspected
    workflow and diff evidence; Lean does not compute glob matching. -/
structure PathScopeWitness where
  changedPath : String
  watchPattern : String
  /-- Digest of the exact changed-path manifest from which the path-presence
      attestation was derived. -/
  manifestSha256 : Sha256Digest
  pathAppearsInRunDiff : Bool
  patternMatchesChangedPath : Bool
deriving DecidableEq, Repr

def pathScopeWitnessCurrent (w : PathScopeWitness) : Bool :=
  decide (w.changedPath.length > 0) &&
  decide (w.watchPattern.length > 0) &&
  sha256Shape w.manifestSha256 &&
  w.pathAppearsInRunDiff &&
  w.patternMatchesChangedPath

/-- Identity of the exact workflow definition used by one workflow run.
    sourceCommit is intentionally not forced equal to the run commit:
    GitHub's event semantics can select a workflow definition from a different
    ref. sourceBindingVerified is an external attestation that the recorded
    path/blob/commit/event identify the definition actually used by this run.
    Lean does not resolve GitHub event semantics or hash repository bytes. -/
structure WorkflowDefinitionWitness where
  workflowPath : String
  workflowBlob : GitBlobSha1
  sourceCommit : GitCommitSha1
  eventName : String
  workflowRunId : String
  sourceBindingVerified : Bool
deriving DecidableEq, Repr

def workflowDefinitionWitnessCurrent (runId : String) (w : WorkflowDefinitionWitness) : Bool :=
  decide (w.workflowPath.length > 0) &&
  gitBlobSha1Shape w.workflowBlob &&
  gitCommitSha1Shape w.sourceCommit &&
  decide (w.eventName.length > 0) &&
  decide (w.workflowRunId = runId) &&
  w.sourceBindingVerified

/-- Content-addressed identity for the exact changed-path manifest supplied
    for one workflow run. The digest, run ID, commit and manifestMatchesRun
    attestation are external evidence; Lean does not fetch the GitHub run or
    compute the changed-path manifest. -/
structure ChangedPathManifestWitness where
  manifestSha256 : Sha256Digest
  workflowRunId : String
  runCommit : GitCommitSha1
  manifestMatchesRun : Bool
deriving DecidableEq, Repr

def changedPathManifestWitnessCurrent (runId : String) (commit : GitCommitSha1)
    (w : ChangedPathManifestWitness) : Bool :=
  sha256Shape w.manifestSha256 &&
  decide (w.workflowRunId = runId) &&
  decide (w.runCommit = commit) &&
  gitCommitSha1Shape w.runCommit &&
  w.manifestMatchesRun

/-- A workflow event bound to the route and deployment already present in
    the base observation-gate state. -/
structure WorkflowTriggerEvidence where
  workflowName : String
  workflowRunId : String
  workflowTarget : DeploymentTarget
  routeId : RouteId
  deploymentId : DeploymentId
  runCommit : GitCommitSha1
  deploymentCommit : GitCommitSha1
  runSucceeded : Bool
  workflowDefinition : WorkflowDefinitionWitness
  changedPathManifest : ChangedPathManifestWitness
  pathWitness : PathScopeWitness
deriving DecidableEq, Repr

def workflowTriggerCurrent (s : State) (e : WorkflowTriggerEvidence) : Bool :=
  match s.route, s.deployment with
  | some route, some deployment =>
      decide (e.workflowName.length > 0) &&
      decide (e.workflowRunId.length > 0) &&
      e.runSucceeded &&
      workflowDefinitionWitnessCurrent e.workflowRunId e.workflowDefinition &&
      changedPathManifestWitnessCurrent e.workflowRunId e.runCommit e.changedPathManifest &&
      decide (e.pathWitness.manifestSha256 = e.changedPathManifest.manifestSha256) &&
      pathScopeWitnessCurrent e.pathWitness &&
      decide (e.workflowTarget = route.id.target) &&
      decide (e.routeId = route.id) &&
      decide (e.deploymentId = deployment.id) &&
      decide (e.runCommit = e.deploymentCommit)
  | _, _ => false

/-- A route probe now requires both the original source-to-route identity
    chain plus observation capability, and a successful same-target,
    same-route, same-deployment-commit workflow event with a matching
    changed-path/watch-pattern witness. -/
def routeProbeAuthorizedWithWorkflow (s : State) (e : WorkflowTriggerEvidence) : Bool :=
  routeProbeAuthorized s && workflowTriggerCurrent s e

theorem unverified_workflow_definition_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.workflowDefinition.sourceBindingVerified = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem workflow_definition_run_id_mismatch_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.workflowDefinition.workflowRunId ≠ e.workflowRunId) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem malformed_workflow_definition_blob_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : gitBlobSha1Shape e.workflowDefinition.workflowBlob = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem unverified_changed_path_manifest_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.changedPathManifest.manifestMatchesRun = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem changed_path_manifest_run_id_mismatch_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.changedPathManifest.workflowRunId ≠ e.workflowRunId) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem changed_path_manifest_commit_mismatch_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.changedPathManifest.runCommit ≠ e.runCommit) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem changed_path_manifest_digest_mismatch_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.pathWitness.manifestSha256 ≠ e.changedPathManifest.manifestSha256) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem malformed_changed_path_manifest_digest_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : sha256Shape e.changedPathManifest.manifestSha256 = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      workflowDefinitionWitnessCurrent, changedPathManifestWitnessCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem absent_changed_path_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.pathWitness.pathAppearsInRunDiff = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem unmatched_watch_pattern_blocks_probe (s : State) (e : WorkflowTriggerEvidence)
    (h : e.pathWitness.patternMatchesChangedPath = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
      pathScopeWitnessCurrent, hr, hd, h]

theorem wrong_workflow_target_blocks_probe
    (s : State) (e : WorkflowTriggerEvidence)
    (route : RouteArtifact) (deployment : DeploymentArtifact)
    (hRoute : s.route = some route)
    (hDeployment : s.deployment = some deployment)
    (h : e.workflowTarget ≠ route.id.target) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
    hRoute, hDeployment, h]

theorem mismatched_route_identity_blocks_probe
    (s : State) (e : WorkflowTriggerEvidence)
    (route : RouteArtifact) (deployment : DeploymentArtifact)
    (hRoute : s.route = some route)
    (hDeployment : s.deployment = some deployment)
    (h : e.routeId ≠ route.id) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
    hRoute, hDeployment, h]

theorem mismatched_deployment_identity_blocks_probe
    (s : State) (e : WorkflowTriggerEvidence)
    (route : RouteArtifact) (deployment : DeploymentArtifact)
    (hRoute : s.route = some route)
    (hDeployment : s.deployment = some deployment)
    (h : e.deploymentId ≠ deployment.id) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent,
    hRoute, hDeployment, h]

theorem workflow_run_commit_mismatch_blocks_probe
    (s : State) (e : WorkflowTriggerEvidence)
    (h : e.runCommit ≠ e.deploymentCommit) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent, hr, hd, h]

theorem failed_workflow_blocks_probe
    (s : State) (e : WorkflowTriggerEvidence)
    (h : e.runSucceeded = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  cases hr : s.route <;> cases hd : s.deployment <;>
    simp [routeProbeAuthorizedWithWorkflow, workflowTriggerCurrent, hr, hd, h]

theorem existing_identity_and_capability_gate_remains_required
    (s : State) (e : WorkflowTriggerEvidence)
    (h : routeProbeAuthorized s = false) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  simp [routeProbeAuthorizedWithWorkflow, h]

theorem github_pages_workflow_cannot_authorize_chatgpt_sites_route
    (s : State) (e : WorkflowTriggerEvidence)
    (route : RouteArtifact) (deployment : DeploymentArtifact)
    (hRoute : s.route = some route)
    (hDeployment : s.deployment = some deployment)
    (hWorkflow : e.workflowTarget = DeploymentTarget.githubPages)
    (hRouteTarget : route.id.target = DeploymentTarget.chatgptSites) :
    routeProbeAuthorizedWithWorkflow s e = false := by
  have hMismatch : e.workflowTarget ≠ route.id.target := by
    intro hEqual
    have hImpossible : DeploymentTarget.githubPages = DeploymentTarget.chatgptSites :=
      hWorkflow.symm.trans (hEqual.trans hRouteTarget)
    exact github_pages_ne_chatgpt_sites hImpossible
  exact wrong_workflow_target_blocks_probe s e route deployment
    hRoute hDeployment hMismatch

#print axioms unverified_workflow_definition_blocks_probe
#print axioms workflow_definition_run_id_mismatch_blocks_probe
#print axioms malformed_workflow_definition_blob_blocks_probe
#print axioms unverified_changed_path_manifest_blocks_probe
#print axioms changed_path_manifest_run_id_mismatch_blocks_probe
#print axioms changed_path_manifest_commit_mismatch_blocks_probe
#print axioms changed_path_manifest_digest_mismatch_blocks_probe
#print axioms malformed_changed_path_manifest_digest_blocks_probe
#print axioms absent_changed_path_blocks_probe
#print axioms unmatched_watch_pattern_blocks_probe
#print axioms wrong_workflow_target_blocks_probe
#print axioms mismatched_route_identity_blocks_probe
#print axioms mismatched_deployment_identity_blocks_probe
#print axioms workflow_run_commit_mismatch_blocks_probe
#print axioms failed_workflow_blocks_probe
#print axioms existing_identity_and_capability_gate_remains_required
#print axioms github_pages_workflow_cannot_authorize_chatgpt_sites_route

end HsHVerification.CodeGrurpleWorkflowScope


/-!
## Presentation observation and acceptance layer

The workflow-scope layer above establishes only that a route probe is authorized.
It does not establish that a probe occurred, what the browser actually returned,
or whether the rendered paper passed the reader acceptance checklist.

This layer keeps those three claims separate. An absent observation is pending,
a supplied but stale/unbound observation is not evidence for the current route,
and an identity-bound observation can pass only when the route resolved and
every declared reader check passed. The Boolean binding fields are external
attestations; Lean does not inspect browser captures, recompute hashes, or
verify the truth of those attestations.
-/

namespace HsHVerification.CodeGrurplePresentationOutcome

open HsHVerification.CodeGrurpleObservationGate
open HsHVerification.CodeGrurpleWorkflowScope

/-- The first eight fields mirror the PDF acceptance bullets in
    PUBLIC_SITE/PRESENTATION_GATE.md. The final four add the routing and
    artifact requirements in PRESENTATION_CONTRACT.md and
    READER_ROUTING_REGISTRY.md. These are observed outcomes, not permissions. -/
structure ReaderAcceptanceChecks where
  sectionHierarchyRendered : Bool
  mathematicsTypeset : Bool
  pageObjectsWithinBounds : Bool
  longEquationsAndUrlsBreakSafely : Bool
  noTextOrBoxOverflow : Bool
  narrowScreenViewerUsable : Bool
  audienceCalibratedPrefacePresent : Bool
  technicalReaderPointersPresent : Bool
  rawSourceNotDefault : Bool
  relativeLinksVerified : Bool
  artifactProvenancePinned : Bool
  figuresAndReferencesResolved : Bool
deriving DecidableEq, Repr

def readerAcceptanceChecksPass (c : ReaderAcceptanceChecks) : Bool :=
  c.sectionHierarchyRendered &&
  c.mathematicsTypeset &&
  c.pageObjectsWithinBounds &&
  c.longEquationsAndUrlsBreakSafely &&
  c.noTextOrBoxOverflow &&
  c.narrowScreenViewerUsable &&
  c.audienceCalibratedPrefacePresent &&
  c.technicalReaderPointersPresent &&
  c.rawSourceNotDefault &&
  c.relativeLinksVerified &&
  c.artifactProvenancePinned &&
  c.figuresAndReferencesResolved

/-- A route observation is bound to the exact run, route, deployment,
    source and derivative being accepted. The timestamp, browser-context
    digest, capture digest and binding flags are external evidence inputs. -/
structure RouteObservationWitness where
  triggerWorkflowRunId : String
  observationRunId : String
  routeId : RouteId
  deploymentId : DeploymentId
  sourceBlob : GitBlobSha1
  derivativeDigest : Sha256Digest
  observedAtUnix : Nat
  browserContextDigest : Sha256Digest
  captureDigest : Sha256Digest
  sourceBindingVerified : Bool
  derivativeBindingVerified : Bool
  routeBindingVerified : Bool
  captureBindingVerified : Bool
  routeResolved : Bool
  checks : ReaderAcceptanceChecks
deriving DecidableEq, Repr

def routeObservationCurrent (s : State) (e : WorkflowTriggerEvidence)
    (w : RouteObservationWitness) : Bool :=
  match s.source, s.derivative, s.deployment, s.route with
  | some source, some derivative, some deployment, some route =>
      routeProbeAuthorizedWithWorkflow s e &&
      decide (w.triggerWorkflowRunId = e.workflowRunId) &&
      decide (w.observationRunId.length > 0) &&
      decide (w.routeId = route.id) &&
      decide (w.deploymentId = deployment.id) &&
      decide (w.sourceBlob = source.id) &&
      decide (w.derivativeDigest = derivative.id) &&
      decide (w.observedAtUnix > 0) &&
      sha256Shape w.browserContextDigest &&
      sha256Shape w.captureDigest &&
      w.sourceBindingVerified &&
      w.derivativeBindingVerified &&
      w.routeBindingVerified &&
      w.captureBindingVerified
  | _, _, _, _ => false

inductive PresentationStatus where
  | notObserved
  | unbound
  | observedFail
  | observedPass
deriving DecidableEq, Repr

/-- No observation exists => pending. A present but mismatched witness is
    unbound, not a route failure. A current observation fails if the route
    did not resolve or any reader check failed. -/
def presentationStatus (s : State) (e : WorkflowTriggerEvidence)
    (observation : Option RouteObservationWitness) : PresentationStatus :=
  match observation with
  | none => .notObserved
  | some w =>
      match routeObservationCurrent s e w,
            (w.routeResolved && readerAcceptanceChecksPass w.checks) with
      | true, true => .observedPass
      | true, false => .observedFail
      | false, _ => .unbound

def presentationAccepted (s : State) (e : WorkflowTriggerEvidence)
    (observation : Option RouteObservationWitness) : Bool :=
  decide (presentationStatus s e observation = .observedPass)

theorem no_observation_remains_not_observed (s : State) (e : WorkflowTriggerEvidence) :
    presentationStatus s e none = .notObserved := by
  rfl

theorem no_observation_is_not_accepted (s : State) (e : WorkflowTriggerEvidence) :
    presentationAccepted s e none = false := by
  simp [presentationAccepted, presentationStatus]

/-- Even a fully authorized probe cannot be reported as an observed pass
    until an actual, identity-bound observation witness is supplied. -/
theorem authorized_probe_does_not_imply_acceptance
    (s : State) (e : WorkflowTriggerEvidence) :
    routeProbeAuthorizedWithWorkflow s e = true →
    presentationAccepted s e none = false := by
  intro _
  exact no_observation_is_not_accepted s e

theorem unbound_observation_is_not_accepted
    (s : State) (e : WorkflowTriggerEvidence) (w : RouteObservationWitness)
    (h : routeObservationCurrent s e w = false) :
    presentationAccepted s e (some w) = false := by
  simp [presentationAccepted, presentationStatus, h]

theorem unresolved_route_is_not_accepted
    (s : State) (e : WorkflowTriggerEvidence) (w : RouteObservationWitness)
    (h : w.routeResolved = false) :
    presentationAccepted s e (some w) = false := by
  cases hc : routeObservationCurrent s e w <;>
    simp [presentationAccepted, presentationStatus, hc, h]

theorem failed_reader_check_is_not_accepted
    (s : State) (e : WorkflowTriggerEvidence) (w : RouteObservationWitness)
    (h : readerAcceptanceChecksPass w.checks = false) :
    presentationAccepted s e (some w) = false := by
  cases hc : routeObservationCurrent s e w <;>
    simp [presentationAccepted, presentationStatus, hc, h]

theorem acceptance_requires_current_observation
    (s : State) (e : WorkflowTriggerEvidence) (w : RouteObservationWitness)
    (h : presentationAccepted s e (some w) = true) :
    routeObservationCurrent s e w = true := by
  cases hc : routeObservationCurrent s e w with
  | false =>
      simp [presentationAccepted, presentationStatus, hc] at h
  | true =>
      rfl

#print axioms no_observation_remains_not_observed
#print axioms no_observation_is_not_accepted
#print axioms authorized_probe_does_not_imply_acceptance
#print axioms unbound_observation_is_not_accepted
#print axioms unresolved_route_is_not_accepted
#print axioms failed_reader_check_is_not_accepted
#print axioms acceptance_requires_current_observation

/-- If the existing workflow gate does not authorize a probe, a supplied
    observation cannot be treated as current evidence for this state. -/
theorem unauthorized_probe_state_makes_observation_unbound
    (s : State) (e : WorkflowTriggerEvidence) (w : RouteObservationWitness)
    (h : routeProbeAuthorizedWithWorkflow s e = false) :
    presentationStatus s e (some w) = .unbound := by
  cases hs : s.source <;>
    cases hd : s.derivative <;>
    cases hdep : s.deployment <;>
    cases hr : s.route <;>
    simp [presentationStatus, routeObservationCurrent, hs, hd, hdep, hr, h]

/-- Changing the source invalidates the old route/deployment/derivative chain,
    so an observation captured for the prior source becomes unbound. -/
theorem source_change_makes_previous_observation_unbound
    (s : State) (e : WorkflowTriggerEvidence) (w : RouteObservationWitness) :
    presentationStatus (step s .sourceChanged) e (some w) = .unbound := by
  apply unauthorized_probe_state_makes_observation_unbound
  simp [routeProbeAuthorizedWithWorkflow, source_change_invalidates_probe]

#print axioms unauthorized_probe_state_makes_observation_unbound
#print axioms source_change_makes_previous_observation_unbound

end HsHVerification.CodeGrurplePresentationOutcome



/-!
## Discovery projection and eligibility layer

The discovery catalog has several distinct projections: internal inventory,
public metadata, excerpts, rolling-docket membership, and default reader
targets. Docket selection is not an access-control boundary. A record may be
indexed and excluded from the docket while still carrying a raw reader target.

This model keeps those decisions separate. Raw excerpts and default reader
targets require a current presentation derivative bound to the exact source
blob and a source-consistent discovery snapshot. Metadata-only discovery may
remain visible while presentation is pending.

The snapshot, derivative-existence, and digest-binding fields are external
evidence inputs. Lean checks the stated contract; it does not inspect GitHub
commits, compute hashes, inspect generated JSON, or observe a live reader.
-/
namespace HsHVerification.CodeGrurpleDiscoveryProjection

open HsHVerification.CodeGrurpleObservationGate

inductive PresentationEligibility where
  | pending
  | sourceOnly
  | presented
deriving DecidableEq, Repr

/-- External witness for one discovery refresh and one record's source blob.
    The compare result must establish that sourceCommit is the refresh commit's
    parent and that the refresh changed only the generated discovery index. -/
structure DiscoverySnapshotWitness where
  sourceCommit : GitCommitSha1
  refreshParent : GitCommitSha1
  refreshCommit : GitCommitSha1
  recordSourceBlob : GitBlobSha1
  refreshDiffOnlyGeneratedDiscovery : Bool
deriving DecidableEq, Repr

def discoverySnapshotConsistent
    (w : DiscoverySnapshotWitness) (currentSource : GitBlobSha1) : Prop :=
  gitCommitSha1Shape w.sourceCommit = true ∧
  gitCommitSha1Shape w.refreshParent = true ∧
  gitCommitSha1Shape w.refreshCommit = true ∧
  w.sourceCommit = w.refreshParent ∧
  w.recordSourceBlob = currentSource ∧
  gitBlobSha1Shape w.recordSourceBlob = true ∧
  w.refreshDiffOnlyGeneratedDiscovery = true

/-- One record's independently selectable discovery/presentation surfaces.
    readerTargetVisible means a raw/default reader target was serialized into
    the discovery record; it does not mean that a live route rendered it. -/
structure DiscoveryProjection where
  sourceBlob : GitBlobSha1
  inventoryIndexed : Bool
  metadataVisible : Bool
  docketEligible : Bool
  docketIncluded : Bool
  excerptVisible : Bool
  readerTargetVisible : Bool
  presentation : PresentationEligibility
  derivativeSourceBlob : Option GitBlobSha1
  derivativeDigest : Option Sha256Digest
  derivativeExists : Bool
  derivativeDigestVerified : Bool
  snapshot : Option DiscoverySnapshotWitness
deriving DecidableEq, Repr

def derivativeCurrent (r : DiscoveryProjection) : Prop :=
  match r.derivativeSourceBlob, r.derivativeDigest with
  | some source, some digest =>
      source = r.sourceBlob ∧
      gitBlobSha1Shape source = true ∧
      sha256Shape digest = true ∧
      r.derivativeExists = true ∧
      r.derivativeDigestVerified = true
  | _, _ => False

def snapshotCurrent (r : DiscoveryProjection) : Prop :=
  match r.snapshot with
  | some w => discoverySnapshotConsistent w r.sourceBlob
  | none => False

def presentationReady (r : DiscoveryProjection) : Prop :=
  r.presentation = .presented ∧ derivativeCurrent r ∧ snapshotCurrent r

/-- Safe projection contract. Inventory, metadata, docket, excerpt, and reader
    target are separate decisions. Only the last two require a current,
    source-bound presentation derivative and a source-consistent snapshot. -/
def projectionSafe (r : DiscoveryProjection) : Prop :=
  (r.metadataVisible = true → r.inventoryIndexed = true) ∧
  (r.docketIncluded = true → r.inventoryIndexed = true ∧ r.docketEligible = true) ∧
  (r.excerptVisible = true → presentationReady r) ∧
  (r.readerTargetVisible = true → presentationReady r)

theorem metadata_visibility_requires_inventory
    (r : DiscoveryProjection) (h : projectionSafe r)
    (hm : r.metadataVisible = true) :
    r.inventoryIndexed = true :=
  h.1 hm

theorem docket_membership_requires_explicit_eligibility
    (r : DiscoveryProjection) (h : projectionSafe r)
    (hd : r.docketIncluded = true) :
    r.inventoryIndexed = true ∧ r.docketEligible = true :=
  h.2.1 hd

theorem excerpt_visibility_requires_current_presentation
    (r : DiscoveryProjection) (h : projectionSafe r)
    (he : r.excerptVisible = true) :
    presentationReady r :=
  h.2.2.1 he

theorem reader_target_requires_current_presentation
    (r : DiscoveryProjection) (h : projectionSafe r)
    (hr : r.readerTargetVisible = true) :
    presentationReady r :=
  h.2.2.2 hr

/-- The observed 2026-11-15 10:25Z refresh: the embedded HsH source commit
    equals the refresh parent; compare_commits reports one later commit whose
    only changed path is PUBLIC_SITE/generated/discovery.json. These values
    are source-readback inputs, not computed by Lean. -/
def observedSnapshot (recordSource : GitBlobSha1) : DiscoverySnapshotWitness :=
  { sourceCommit := ⟨"209dd13d543ca8ef93ae7d2b8c09f08d71136743"⟩
    refreshParent := ⟨"209dd13d543ca8ef93ae7d2b8c09f08d71136743"⟩
    refreshCommit := ⟨"1fb6623752a7935be2b06253e4ed7cd4dd116c2a"⟩
    recordSourceBlob := recordSource
    refreshDiffOnlyGeneratedDiscovery := true }

/-- Paper A's actual R1 source blob in the fresh discovery snapshot. -/
def paperAObserved : DiscoveryProjection :=
  { sourceBlob := ⟨"13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa"⟩
    inventoryIndexed := true
    metadataVisible := true
    docketEligible := false
    docketIncluded := false
    excerptVisible := false
    readerTargetVisible := true
    presentation := .pending
    derivativeSourceBlob := none
    derivativeDigest := none
    derivativeExists := false
    derivativeDigestVerified := false
    snapshot := some (observedSnapshot ⟨"13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa"⟩) }

/-- Paper B's actual R1 source blob and 1,400-character excerpt in the fresh
    discovery snapshot. -/
def paperBObserved : DiscoveryProjection :=
  { sourceBlob := ⟨"0a1dca42cafd9a02faceff4ec0851659a317b2bb"⟩
    inventoryIndexed := true
    metadataVisible := true
    docketEligible := false
    docketIncluded := false
    excerptVisible := true
    readerTargetVisible := true
    presentation := .pending
    derivativeSourceBlob := none
    derivativeDigest := none
    derivativeExists := false
    derivativeDigestVerified := false
    snapshot := some (observedSnapshot ⟨"0a1dca42cafd9a02faceff4ec0851659a317b2bb"⟩) }

/-- Metadata-only discovery remains admissible while presentation is pending. -/
def pendingMetadataOnly : DiscoveryProjection :=
  { paperBObserved with
    excerptVisible := false
    readerTargetVisible := false }

theorem observed_snapshot_is_consistent_for_paper_a :
    discoverySnapshotConsistent
      (observedSnapshot ⟨"13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa"⟩)
      ⟨"13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa"⟩ := by
  decide

theorem observed_snapshot_is_consistent_for_paper_b :
    discoverySnapshotConsistent
      (observedSnapshot ⟨"0a1dca42cafd9a02faceff4ec0851659a317b2bb"⟩)
      ⟨"0a1dca42cafd9a02faceff4ec0851659a317b2bb"⟩ := by
  decide

theorem metadata_only_pending_record_is_projection_safe :
    projectionSafe pendingMetadataOnly := by
  simp [projectionSafe, pendingMetadataOnly]

/-- A docket exclusion does not prevent a raw target from appearing in the
    full discovery catalog. This is the actual Paper B projection pattern. -/
theorem docket_exclusion_does_not_imply_reader_denial :
    paperBObserved.docketIncluded = false ∧
    paperBObserved.readerTargetVisible = true := by
  constructor <;> rfl

theorem paper_a_snapshot_violates_projection_gate :
    ¬ projectionSafe paperAObserved := by
  intro h
  have hReady :=
    reader_target_requires_current_presentation paperAObserved h rfl
  simp [presentationReady, paperAObserved] at hReady

theorem paper_b_snapshot_violates_projection_gate :
    ¬ projectionSafe paperBObserved := by
  intro h
  have hReady :=
    reader_target_requires_current_presentation paperBObserved h rfl
  simp [presentationReady, paperBObserved] at hReady

/-- A source change closes raw surfaces and invalidates the old derivative and
    snapshot while preserving inventory, metadata, and the independent docket
    selection. A later refresh alone cannot restore presentation eligibility. -/
def sourceChanged (r : DiscoveryProjection) (newSource : GitBlobSha1) :
    DiscoveryProjection :=
  { r with
    sourceBlob := newSource
    presentation := .pending
    derivativeSourceBlob := none
    derivativeDigest := none
    derivativeExists := false
    derivativeDigestVerified := false
    excerptVisible := false
    readerTargetVisible := false
    snapshot := none }

theorem source_change_preserves_inventory_and_metadata
    (r : DiscoveryProjection) (newSource : GitBlobSha1) :
    (sourceChanged r newSource).inventoryIndexed = r.inventoryIndexed ∧
    (sourceChanged r newSource).metadataVisible = r.metadataVisible := by
  rfl

theorem source_change_preserves_docket_selection
    (r : DiscoveryProjection) (newSource : GitBlobSha1) :
    (sourceChanged r newSource).docketIncluded = r.docketIncluded ∧
    (sourceChanged r newSource).docketEligible = r.docketEligible := by
  rfl

theorem source_change_closes_raw_excerpt_and_reader_target
    (r : DiscoveryProjection) (newSource : GitBlobSha1) :
    (sourceChanged r newSource).excerptVisible = false ∧
    (sourceChanged r newSource).readerTargetVisible = false := by
  rfl

theorem source_change_invalidates_old_snapshot
    (r : DiscoveryProjection) (newSource : GitBlobSha1) :
    (sourceChanged r newSource).snapshot = none := by
  rfl

theorem source_change_marks_presentation_pending
    (r : DiscoveryProjection) (newSource : GitBlobSha1) :
    (sourceChanged r newSource).presentation = .pending := by
  rfl

theorem fresh_snapshot_alone_does_not_enable_pending_presentation
    (r : DiscoveryProjection) (w : DiscoverySnapshotWitness)
    (h : r.presentation = .pending) :
    ¬ presentationReady { r with snapshot := some w } := by
  simp [presentationReady, h]

#print axioms metadata_visibility_requires_inventory
#print axioms docket_membership_requires_explicit_eligibility
#print axioms excerpt_visibility_requires_current_presentation
#print axioms reader_target_requires_current_presentation
#print axioms observed_snapshot_is_consistent_for_paper_a
#print axioms observed_snapshot_is_consistent_for_paper_b
#print axioms metadata_only_pending_record_is_projection_safe
#print axioms docket_exclusion_does_not_imply_reader_denial
#print axioms paper_a_snapshot_violates_projection_gate
#print axioms paper_b_snapshot_violates_projection_gate
#print axioms source_change_preserves_inventory_and_metadata
#print axioms source_change_preserves_docket_selection
#print axioms source_change_closes_raw_excerpt_and_reader_target
#print axioms source_change_invalidates_old_snapshot
#print axioms source_change_marks_presentation_pending
#print axioms fresh_snapshot_alone_does_not_enable_pending_presentation

end HsHVerification.CodeGrurpleDiscoveryProjection
