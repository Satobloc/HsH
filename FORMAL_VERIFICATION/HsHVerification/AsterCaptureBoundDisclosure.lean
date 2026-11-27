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
sandbox label, review-state text, and an accessible, visible provenance link in the same captured tree. The link projection records accessibility-tree membership, semantic role, and the browser-computed accessible name.
It does not authenticate the browser, compute SHA-256, derive the accessibility tree, parse live DOM, or
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

/-- The semantic role recorded by the browser's computed accessibility tree.
    docBiblioref is included because it inherits the semantic link role. -/
inductive CapturedSemanticRole where
  | link
  | docBiblioref
  | other
deriving DecidableEq, Repr

def isInheritingLinkRole : CapturedSemanticRole → Bool
  | .link => true
  | .docBiblioref => true
  | .other => false

/-- One source-locatable element from the same browser capture.
    visible is the product's visible-affordance requirement.
    accessibilityTreeIncluded, semanticRole, and computedAccessibleName
    must come from the browser accessibility tree, not DOM inference.
    The adapter must include all these fields in the capture-digest projection. -/
structure CapturedElement where
  nodeId : String
  visible : Bool
  accessibilityTreeIncluded : Bool
  semanticRole : CapturedSemanticRole
  text : String
  computedAccessibleName : String
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
    element.accessibilityTreeIncluded &&
    isInheritingLinkRole element.semanticRole &&
    nonemptyString element.computedAccessibleName &&
    match element.href with
    | some target => nonemptyString target && decide (target = expectedTarget)
    | none => false

/-- Icon-only links are allowed only when their computed accessible name is
    nonempty and the link is actually included in the accessibility tree. -/
def accessibleIconLink : CapturedElement :=
  { nodeId := "source-link-1"
    visible := true
    accessibilityTreeIncluded := true
    semanticRole := .link
    text := ""
    computedAccessibleName := "Open accepted Paper A source"
    href := some "pinned-source" }

/-- A visible text link whose computed accessible name comes from its text. -/
def visibleTextLink : CapturedElement :=
  { nodeId := "source-link-2"
    visible := true
    accessibilityTreeIncluded := true
    semanticRole := .link
    text := "Open source"
    computedAccessibleName := "Open source"
    href := some "pinned-source" }

/-- DOM-visible but aria-hidden: excluded from the accessibility tree. -/
def ariaHiddenLink : CapturedElement :=
  { nodeId := "source-link-3"
    visible := true
    accessibilityTreeIncluded := false
    semanticRole := .link
    text := ""
    computedAccessibleName := ""
    href := some "pinned-source" }

def emptyNameLink : CapturedElement :=
  { nodeId := "source-link-4"
    visible := true
    accessibilityTreeIncluded := true
    semanticRole := .link
    text := ""
    computedAccessibleName := ""
    href := some "pinned-source" }

def wrongRoleLink : CapturedElement :=
  { nodeId := "source-link-5"
    visible := true
    accessibilityTreeIncluded := true
    semanticRole := .other
    text := "Open source"
    computedAccessibleName := "Open source"
    href := some "pinned-source" }

def hiddenLink : CapturedElement :=
  { nodeId := "source-link-6"
    visible := false
    accessibilityTreeIncluded := true
    semanticRole := .link
    text := "Open source"
    computedAccessibleName := "Open source"
    href := some "pinned-source" }

#eval visibleLinkTargetPresent [accessibleIconLink] "pinned-source"
#eval visibleLinkTargetPresent [visibleTextLink] "pinned-source"
#eval visibleLinkTargetPresent [ariaHiddenLink] "pinned-source"
#eval visibleLinkTargetPresent [emptyNameLink] "pinned-source"
#eval visibleLinkTargetPresent [wrongRoleLink] "pinned-source"
#eval visibleLinkTargetPresent [hiddenLink] "pinned-source"
#eval visibleLinkTargetPresent [accessibleIconLink] "different-source"

theorem accessibility_tree_regression_matrix :
    visibleLinkTargetPresent [accessibleIconLink] "pinned-source" = true ∧
    visibleLinkTargetPresent [visibleTextLink] "pinned-source" = true ∧
    visibleLinkTargetPresent [ariaHiddenLink] "pinned-source" = false ∧
    visibleLinkTargetPresent [emptyNameLink] "pinned-source" = false ∧
    visibleLinkTargetPresent [wrongRoleLink] "pinned-source" = false ∧
    visibleLinkTargetPresent [hiddenLink] "pinned-source" = false ∧
    visibleLinkTargetPresent [accessibleIconLink] "different-source" = false := by
  decide

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
#print axioms accessibility_tree_regression_matrix

end HsHVerification.AsterCaptureBoundDisclosure
