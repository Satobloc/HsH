import HsHVerification.CodeGrurpleObservationGate

/-!
# Capture-bound reader disclosures

This is a proof-only child of the Code Grurple observation-gate draft.
It refines the visible-disclosure gap identified in issue #2414.

The captured element list is a structured projection of one browser capture.
The parser/capture adapter must externally bind that projection to the exact
capture digest and route context. The source/feed bindings and their external
verification flags are inputs, not facts established by Lean.

Lean proves only that, if those typed inputs and binding attestations are
correct, an accepted disclosure predicate contains the required visible
sandbox label, review-state text, and source link in the same captured tree.
It does not authenticate the browser, compute SHA-256, parse live DOM, or
establish a live reader route.
-/

namespace HsHVerification.AsterCaptureBoundDisclosure

open HsHVerification.CodeGrurpleObservationGate
open HsHVerification.CodeGrurpleWorkflowScope
open HsHVerification.CodeGrurplePresentationOutcome

def nonemptyString (s : String) : Bool :=
  decide (s.length > 0)

theorem bool_and_true_parts {a b : Bool} (h : a && b = true) : a = true ∧ b = true := by
  cases a <;> cases b <;> simp_all

/-- One flattened, source-locatable element from a captured accessibility/DOM tree.
    Visibility is the result of the external browser-capture adapter. -/
structure CapturedElement where
  nodeId : String
  visible : Bool
  text : String
  href : Option String
deriving DecidableEq, Repr

def visibleTextPresent (elements : List CapturedElement) (expected : String) : Bool :=
  elements.any fun element =>
    nonemptyString element.nodeId &&
    element.visible &&
    decide (element.text = expected)

def visibleLinkTargetPresent (elements : List CapturedElement) (expectedTarget : String) : Bool :=
  elements.any fun element =>
    nonemptyString element.nodeId &&
    element.visible &&
    match element.href with
    | some target => nonemptyString target && decide (target = expectedTarget)
    | none => false

/-- The expected public review/sandbox labels are bound to one exact feed blob.
    feedValuesSourceVerified is an external source-review attestation. -/
structure ReviewStateBinding where
  feedBlob : GitBlobSha1
  sandboxClassificationText : String
  reviewStateText : String
  feedValuesSourceVerified : Bool
deriving DecidableEq, Repr

/-- The displayed provenance target is bound to one exact source blob.
    resolutionVerified is external evidence that canonicalTarget resolves to
    the declared source blob; Lean does not fetch or resolve the URL. -/
structure SourceTargetBinding where
  sourceBlob : GitBlobSha1
  canonicalTarget : String
  resolvedBlob : GitBlobSha1
  resolutionVerified : Bool
deriving DecidableEq, Repr

/-- Structured capture projection for the exact reader observation.
    parserBindingVerified is an external attestation that elements were
    extracted from the bytes identified by captureDigest. -/
structure CapturedReaderTree where
  captureDigest : Sha256Digest
  routeId : RouteId
  deploymentId : DeploymentId
  sourceBlob : GitBlobSha1
  feedBlob : GitBlobSha1
  elements : List CapturedElement
  parserBindingVerified : Bool
deriving DecidableEq, Repr

def disclosureTreePasses (tree : CapturedReaderTree)
    (review : ReviewStateBinding) (source : SourceTargetBinding) : Bool :=
  sha256Shape tree.captureDigest &&
  tree.parserBindingVerified &&
  visibleTextPresent tree.elements review.sandboxClassificationText &&
  visibleTextPresent tree.elements review.reviewStateText &&
  visibleLinkTargetPresent tree.elements source.canonicalTarget

/-- The disclosure tree must be the same capture, route, deployment, source,
    and feed as the existing route observation and state. -/
def captureBoundDisclosurePasses (s : State) (observation : RouteObservationWitness)
    (tree : CapturedReaderTree) (review : ReviewStateBinding)
    (sourceBinding : SourceTargetBinding) : Bool :=
  match s.source, s.feed with
  | some sourceArtifact, some feedArtifact =>
      decide (tree.captureDigest = observation.captureDigest) &&
      decide (tree.routeId = observation.routeId) &&
      decide (tree.deploymentId = observation.deploymentId) &&
      decide (tree.sourceBlob = observation.sourceBlob) &&
      decide (observation.sourceBlob = sourceArtifact.id) &&
      decide (tree.feedBlob = feedArtifact.id) &&
      decide (review.feedBlob = feedArtifact.id) &&
      decide (sourceBinding.sourceBlob = sourceArtifact.id) &&
      decide (sourceBinding.resolvedBlob = sourceArtifact.id) &&
      nonemptyString sourceBinding.canonicalTarget &&
      review.feedValuesSourceVerified &&
      sourceBinding.resolutionVerified &&
      disclosureTreePasses tree review sourceBinding
  | _, _ => false

/-- Stronger acceptance requires the existing route observation plus
    capture-bound disclosure evidence. -/
def presentationAcceptedWithDisclosure (s : State) (e : WorkflowTriggerEvidence)
    (observation : Option RouteObservationWitness) (tree : CapturedReaderTree)
    (review : ReviewStateBinding) (sourceBinding : SourceTargetBinding) : Bool :=
  presentationAccepted s e observation &&
    match observation with
    | none => false
    | some witness =>
        captureBoundDisclosurePasses s witness tree review sourceBinding

/-- The legacy twelve-check predicate can pass while no visible disclosure
    nodes exist. This is a formal counterexample to its expressive scope,
    not evidence about an actual live route. -/
def allLegacyChecksTrue : ReaderAcceptanceChecks :=
  { sectionHierarchyRendered := true
    mathematicsTypeset := true
    pageObjectsWithinBounds := true
    longEquationsAndUrlsBreakSafely := true
    noTextOrBoxOverflow := true
    narrowScreenViewerUsable := true
    audienceCalibratedPrefacePresent := true
    technicalReaderPointersPresent := true
    rawSourceNotDefault := true
    relativeLinksVerified := true
    artifactProvenancePinned := true
    figuresAndReferencesResolved := true }

theorem legacy_checks_can_pass_without_visible_disclosures :
    readerAcceptanceChecksPass allLegacyChecksTrue = true ∧
    visibleTextPresent [] "SANDBOX" = false ∧
    visibleTextPresent [] "ACCEPTED R1" = false ∧
    visibleLinkTargetPresent [] "pinned-source" = false := by
  decide

theorem disclosure_tree_pass_requires_visible_sandbox_classification
    (tree : CapturedReaderTree) (review : ReviewStateBinding)
    (sourceBinding : SourceTargetBinding)
    (h : disclosureTreePasses tree review sourceBinding = true) :
    visibleTextPresent tree.elements review.sandboxClassificationText = true := by
  unfold disclosureTreePasses at h
  cases h1 : sha256Shape tree.captureDigest <;>
    cases h2 : tree.parserBindingVerified <;>
    cases h3 : visibleTextPresent tree.elements review.sandboxClassificationText <;>
    cases h4 : visibleTextPresent tree.elements review.reviewStateText <;>
    cases h5 : visibleLinkTargetPresent tree.elements sourceBinding.canonicalTarget <;>
    simp_all

theorem disclosure_tree_pass_requires_visible_review_state
    (tree : CapturedReaderTree) (review : ReviewStateBinding)
    (sourceBinding : SourceTargetBinding)
    (h : disclosureTreePasses tree review sourceBinding = true) :
    visibleTextPresent tree.elements review.reviewStateText = true := by
  unfold disclosureTreePasses at h
  cases h1 : sha256Shape tree.captureDigest <;>
    cases h2 : tree.parserBindingVerified <;>
    cases h3 : visibleTextPresent tree.elements review.sandboxClassificationText <;>
    cases h4 : visibleTextPresent tree.elements review.reviewStateText <;>
    cases h5 : visibleLinkTargetPresent tree.elements sourceBinding.canonicalTarget <;>
    simp_all

theorem disclosure_tree_pass_requires_visible_pinned_source_target
    (tree : CapturedReaderTree) (review : ReviewStateBinding)
    (sourceBinding : SourceTargetBinding)
    (h : disclosureTreePasses tree review sourceBinding = true) :
    visibleLinkTargetPresent tree.elements sourceBinding.canonicalTarget = true := by
  unfold disclosureTreePasses at h
  cases h1 : sha256Shape tree.captureDigest <;>
    cases h2 : tree.parserBindingVerified <;>
    cases h3 : visibleTextPresent tree.elements review.sandboxClassificationText <;>
    cases h4 : visibleTextPresent tree.elements review.reviewStateText <;>
    cases h5 : visibleLinkTargetPresent tree.elements sourceBinding.canonicalTarget <;>
    simp_all

theorem accepted_with_disclosure_requires_capture_binding
    (s : State) (e : WorkflowTriggerEvidence)
    (observation : Option RouteObservationWitness) (tree : CapturedReaderTree)
    (review : ReviewStateBinding) (sourceBinding : SourceTargetBinding)
    (h : presentationAcceptedWithDisclosure s e observation tree review sourceBinding = true) :
    ∃ witness, observation = some witness ∧
      captureBoundDisclosurePasses s witness tree review sourceBinding = true := by
  unfold presentationAcceptedWithDisclosure at h
  cases observation with
  | none =>
      have hfalse : False := by simpa using h
      exact False.elim hfalse
  | some witness =>
      change (presentationAccepted s e (some witness) &&
        captureBoundDisclosurePasses s witness tree review sourceBinding) = true at h
      cases hp : presentationAccepted s e (some witness) with
      | false =>
          have hfalse : False := by simpa [hp] using h
          exact False.elim hfalse
      | true =>
          cases hc : captureBoundDisclosurePasses s witness tree review sourceBinding with
          | false =>
              have hfalse : False := by simpa [hp, hc] using h
              exact False.elim hfalse
          | true =>
              exact ⟨witness, rfl, hc⟩

#print axioms legacy_checks_can_pass_without_visible_disclosures
#print axioms disclosure_tree_pass_requires_visible_sandbox_classification
#print axioms disclosure_tree_pass_requires_visible_review_state
#print axioms disclosure_tree_pass_requires_visible_pinned_source_target
#print axioms accepted_with_disclosure_requires_capture_binding

end HsHVerification.AsterCaptureBoundDisclosure
