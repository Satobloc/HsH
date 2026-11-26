import Mathlib

/-!
# Graph-path redundancy, source coverage, and evidence integrity

Assistant reconstruction of a narrow mathematical layer motivated by:
* Wang et al., "GraphEcho: Structural Redundancy and Evidence Provenance
  in LLM Graph Agents", arXiv:2609.17695 (2026-09-15).
* "Copies or Sources? Measuring How LLM Aggregators Count Restated Evidence
  in Multi-Agent Systems", arXiv:2610.06192 (2026-10-05).
* "When Messages Go Wrong: Understanding Communication Faults in
  LLM-Based Multi-Agent Systems", arXiv:2610.15459 (2026-10-11).

The model distinguishes:
1. graph paths from evidential origins;
2. delivery/processability from content-integrity verification;
3. repeated evidence visits from acquisition of distinct origins;
4. echo rate from unique-source recall.

This is a formal abstraction, not a reproduction of the papers' code,
model outputs, empirical data, or a physical model. Distinct origin IDs
are not, by themselves, a certificate of statistical independence.
-/

namespace HsHVerification.OrsonGraphEchoMetrics

/-- One graph path, carrying one evidential origin. pathId and originId
    are intentionally separate identifiers. -/
structure EvidencePath where
  pathId : Nat
  originId : Nat
  delivered : Bool
  processable : Bool
  integrityVerified : Bool
  deriving DecidableEq, Repr

/-- Paths whose delivery, parsing, and content-integrity checks all pass. -/
def trustedPaths (paths : Finset EvidencePath) : Finset EvidencePath :=
  paths.filter fun p => p.delivered && p.processable && p.integrityVerified

/-- Structural path count. -/
def pathCount (paths : Finset EvidencePath) : Nat :=
  paths.card

/-- Distinct evidential origins represented by a set of paths. -/
def originSet (paths : Finset EvidencePath) : Finset Nat :=
  paths.image EvidencePath.originId

/-- Provenance multiplicity, not a statistical-independence count. -/
def originCount (paths : Finset EvidencePath) : Nat :=
  (originSet paths).card

def trustedOriginSet (paths : Finset EvidencePath) : Finset Nat :=
  (trustedPaths paths).image EvidencePath.originId

def trustedPathCount (paths : Finset EvidencePath) : Nat :=
  (trustedPaths paths).card

def trustedOriginCount (paths : Finset EvidencePath) : Nat :=
  (trustedOriginSet paths).card

theorem origin_count_le_path_count (paths : Finset EvidencePath) :
    originCount paths ≤ pathCount paths := by
  unfold originCount originSet pathCount
  exact Finset.card_image_le

theorem trusted_origin_count_le_trusted_path_count
    (paths : Finset EvidencePath) :
    trustedOriginCount paths ≤ trustedPathCount paths := by
  unfold trustedOriginCount trustedOriginSet trustedPathCount
  exact Finset.card_image_le

theorem adding_fresh_path_increases_path_count
    (paths : Finset EvidencePath) (p : EvidencePath)
    (hFresh : p ∉ paths) :
    pathCount (insert p paths) = pathCount paths + 1 := by
  simp [pathCount, hFresh]

/-- Adding another trusted route to an origin already represented in the
    trusted set increases route multiplicity but leaves the origin set fixed. -/
theorem adding_trusted_path_same_origin_preserves_origin_set
    (paths : Finset EvidencePath) (p : EvidencePath)
    (hTrusted : p.delivered = true ∧ p.processable = true ∧
      p.integrityVerified = true)
    (hExisting : p.originId ∈ trustedOriginSet paths) :
    trustedOriginSet (insert p paths) = trustedOriginSet paths := by
  have hFilter :
      trustedPaths (insert p paths) = insert p (trustedPaths paths) := by
    ext q
    simp [trustedPaths, hTrusted]
  rw [hFilter]
  simp [trustedOriginSet, hExisting]

/-- A second surviving path can preserve access to an origin after another
    path is removed. This is route redundancy, not new source corroboration. -/
theorem surviving_alternate_path_preserves_origin_after_failure
    (paths : Finset EvidencePath) (failed surviving : EvidencePath)
    (hSurviving : surviving ∈ trustedPaths paths)
    (hDistinct : surviving ≠ failed)
    (hSameOrigin : surviving.originId = failed.originId) :
    failed.originId ∈ trustedOriginSet (paths.erase failed) := by
  have hParts := Finset.mem_filter.mp hSurviving
  have hSurvivingAfter :
      surviving ∈ trustedPaths (paths.erase failed) := by
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_erase.mpr ⟨hDistinct, hParts.1⟩, hParts.2⟩
  exact Finset.mem_image.mpr ⟨surviving, hSurvivingAfter, hSameOrigin⟩

/-- A message may be delivered and parseable while its content integrity
    remains unverified. Processability is not a truth or fidelity check. -/
def parseableButUnverified : EvidencePath :=
  ⟨1, 7, true, true, false⟩

theorem processable_does_not_imply_integrity :
    parseableButUnverified.processable = true ∧
    parseableButUnverified.integrityVerified = false := by
  decide

theorem parseable_route_is_not_trusted :
    parseableButUnverified ∉ trustedPaths {parseableButUnverified} := by
  decide

/-- A walk attempt is some origin when it yields an evidence-bearing visit;
    none represents a connector or invalid action. -/
structure ExplorationTrace where
  reachableOrigins : Finset Nat
  attempts : List (Option Nat)
  deriving Repr

def evidenceVisits (trace : ExplorationTrace) : List Nat :=
  trace.attempts.filterMap id

def walkCount (trace : ExplorationTrace) : Nat :=
  trace.attempts.length

def evidenceVisitCount (trace : ExplorationTrace) : Nat :=
  (evidenceVisits trace).length

def acquiredOrigins (trace : ExplorationTrace) : Finset Nat :=
  (evidenceVisits trace).toFinset

def uniqueAcquiredOriginCount (trace : ExplorationTrace) : Nat :=
  (acquiredOrigins trace).card

/-- V - U: evidence-bearing visits beyond the first visit to each origin.
    Under the one-origin-per-evidence-visit encoding, this is the repeated-
    visit count E used by GraphEcho. -/
def echoCount (trace : ExplorationTrace) : Nat :=
  evidenceVisitCount trace - uniqueAcquiredOriginCount trace

def safeRatio (numerator denominator : Nat) : Rat :=
  if denominator = 0 then 0 else (numerator : Rat) / (denominator : Rat)

/-- E/W: repeated evidence visits per total walk attempt, including
    connector and invalid attempts in the denominator. -/
def echoWalkRate (trace : ExplorationTrace) : Rat :=
  safeRatio (echoCount trace) (walkCount trace)

/-- U/D: distinct acquired origins divided by graph-reachable origins. -/
def uniqueSourceRecall (trace : ExplorationTrace) : Rat :=
  safeRatio (uniqueAcquiredOriginCount trace) trace.reachableOrigins.card

def TraceWellFormed (trace : ExplorationTrace) : Prop :=
  ∀ origin ∈ acquiredOrigins trace, origin ∈ trace.reachableOrigins

def earlyStopTrace : ExplorationTrace :=
  { reachableOrigins := {0, 1}, attempts := [some 0, none] }

def fullCoverageTrace : ExplorationTrace :=
  { reachableOrigins := {0, 1}, attempts := [some 0, some 1] }

/-- The same zero echo rate can accompany different source recall.
    The early-stop trace uses one evidence visit and one non-evidence action;
    the full-coverage trace uses two distinct evidence visits. Both use two
    total attempts and have no repeated origin. -/
theorem same_echo_rate_different_source_recall :
    echoWalkRate earlyStopTrace = echoWalkRate fullCoverageTrace ∧
    uniqueSourceRecall earlyStopTrace ≠ uniqueSourceRecall fullCoverageTrace := by
  constructor <;> norm_num [echoWalkRate, uniqueSourceRecall, safeRatio,
    echoCount, evidenceVisitCount, uniqueAcquiredOriginCount, acquiredOrigins,
    evidenceVisits, walkCount, earlyStopTrace, fullCoverageTrace]

/-- No function of echo rate alone can reconstruct unique-source recall
    for all well-formed exploration traces. The missing variable is how many
    distinct reachable origins were actually acquired. -/
theorem no_echo_rate_only_source_recall_resolver :
    ¬ ∃ f : Rat → Rat,
      ∀ trace : ExplorationTrace, TraceWellFormed trace →
        f (echoWalkRate trace) = uniqueSourceRecall trace := by
  rintro ⟨f, hf⟩
  have hEarly : TraceWellFormed earlyStopTrace := by
    decide
  have hFull : TraceWellFormed fullCoverageTrace := by
    decide
  have hEarlyResult := hf earlyStopTrace hEarly
  have hFullResult := hf fullCoverageTrace hFull
  have hSameEcho :
      echoWalkRate earlyStopTrace = echoWalkRate fullCoverageTrace := by
    norm_num [echoWalkRate, safeRatio, echoCount, evidenceVisitCount,
      uniqueAcquiredOriginCount, acquiredOrigins, evidenceVisits, walkCount,
      earlyStopTrace, fullCoverageTrace]
  have hDifferentRecall :
      uniqueSourceRecall earlyStopTrace ≠ uniqueSourceRecall fullCoverageTrace := by
    norm_num [uniqueSourceRecall, safeRatio, uniqueAcquiredOriginCount,
      acquiredOrigins, evidenceVisits, earlyStopTrace, fullCoverageTrace]
  apply hDifferentRecall
  calc
    uniqueSourceRecall earlyStopTrace = f (echoWalkRate earlyStopTrace) :=
      hEarlyResult.symm
    _ = f (echoWalkRate fullCoverageTrace) := by rw [hSameEcho]
    _ = uniqueSourceRecall fullCoverageTrace := hFullResult

/-- A single-root claim lineage. Relaying a claim records a new carrier
    without changing the original evidence root or the root's truth label. -/
inductive ClaimChain where
  | root : Nat → Bool → ClaimChain
  | relay : Nat → ClaimChain → ClaimChain
  deriving DecidableEq, Repr

def lineageOrigin : ClaimChain → Nat
  | .root origin _ => origin
  | .relay _ parent => lineageOrigin parent

def lineageTruth : ClaimChain → Bool
  | .root _ isTrue => isTrue
  | .relay _ parent => lineageTruth parent

def relayDepth : ClaimChain → Nat
  | .root _ _ => 0
  | .relay _ parent => relayDepth parent + 1

theorem relay_preserves_origin_and_root_truth (agent : Nat) (claim : ClaimChain) :
    lineageOrigin (.relay agent claim) = lineageOrigin claim ∧
    lineageTruth (.relay agent claim) = lineageTruth claim := by
  rfl

theorem relay_increases_lineage_depth (agent : Nat) (claim : ClaimChain) :
    relayDepth (.relay agent claim) = relayDepth claim + 1 := by
  rfl

def falseRoot : ClaimChain :=
  .root 99 false

def falseRootAfterTwoRelays : ClaimChain :=
  .relay 3 (.relay 2 falseRoot)

theorem two_relays_preserve_one_false_root :
    lineageOrigin falseRootAfterTwoRelays = 99 ∧
    lineageTruth falseRootAfterTwoRelays = false ∧
    relayDepth falseRootAfterTwoRelays = 2 := by
  decide

/-- A small recursive provenance expression. Alternative derivations and
    joint use are represented by different constructors. This is a two-projection
    reconstruction, not a complete provenance-semiring implementation. -/
inductive ProvenanceExpr where
  | atom : Nat → ProvenanceExpr
  | alternative : ProvenanceExpr → ProvenanceExpr → ProvenanceExpr
  | joint : ProvenanceExpr → ProvenanceExpr → ProvenanceExpr
  deriving DecidableEq, Repr

/-- Projection from a nested provenance expression to distinct source IDs. -/
def sourceSet : ProvenanceExpr → Finset Nat
  | .atom source => {source}
  | .alternative left right => sourceSet left ∪ sourceSet right
  | .joint left right => sourceSet left ∪ sourceSet right

/-- Number of derivation combinations: alternatives add; joint derivations
    multiply. This is not a measure of statistical independence. -/
def derivationCount : ProvenanceExpr → Nat
  | .atom _ => 1
  | .alternative left right => derivationCount left + derivationCount right
  | .joint left right => derivationCount left * derivationCount right

theorem repeated_alternative_preserves_source_set (e : ProvenanceExpr) :
    sourceSet (.alternative e e) = sourceSet e := by
  simp [sourceSet]

theorem repeated_alternative_doubles_derivation_count (e : ProvenanceExpr) :
    derivationCount (.alternative e e) = 2 * derivationCount e := by
  simp [derivationCount, two_mul]

theorem joint_source_set_is_union (left right : ProvenanceExpr) :
    sourceSet (.joint left right) = sourceSet left ∪ sourceSet right := rfl

def repeatedOriginAlternative : ProvenanceExpr :=
  .alternative (.atom 7) (.atom 7)

def twoOriginJointUse : ProvenanceExpr :=
  .joint (.atom 7) (.atom 8)

theorem repeated_origin_two_derivations_one_source :
    sourceSet repeatedOriginAlternative = {7} ∧
    derivationCount repeatedOriginAlternative = 2 := by
  decide

theorem joint_use_contains_both_origin_ids :
    sourceSet twoOriginJointUse = {7, 8} := by
  decide

def oneSourceFivePaths : Finset EvidencePath :=
  { ⟨1, 7, true, true, true⟩,
    ⟨2, 7, true, true, true⟩,
    ⟨3, 7, true, true, true⟩,
    ⟨4, 7, true, true, true⟩,
    ⟨5, 7, true, true, true⟩ }

def fiveSourcesFivePaths : Finset EvidencePath :=
  { ⟨1, 7, true, true, true⟩,
    ⟨2, 8, true, true, true⟩,
    ⟨3, 9, true, true, true⟩,
    ⟨4, 10, true, true, true⟩,
    ⟨5, 11, true, true, true⟩ }

/-- The GraphEcho 1S5P versus 5S5P contrast: equal route count, different
    provenance count. -/
theorem equal_path_count_different_origin_count :
    pathCount oneSourceFivePaths = pathCount fiveSourcesFivePaths ∧
    originCount oneSourceFivePaths = 1 ∧
    originCount fiveSourcesFivePaths = 5 := by
  decide

#eval (pathCount oneSourceFivePaths, originCount oneSourceFivePaths)
#eval (pathCount fiveSourcesFivePaths, originCount fiveSourcesFivePaths)
#eval (echoWalkRate earlyStopTrace, uniqueSourceRecall earlyStopTrace)
#eval (echoWalkRate fullCoverageTrace, uniqueSourceRecall fullCoverageTrace)

#print axioms origin_count_le_path_count
#print axioms trusted_origin_count_le_trusted_path_count
#print axioms adding_fresh_path_increases_path_count
#print axioms adding_trusted_path_same_origin_preserves_origin_set
#print axioms surviving_alternate_path_preserves_origin_after_failure
#print axioms processable_does_not_imply_integrity
#print axioms parseable_route_is_not_trusted
#print axioms same_echo_rate_different_source_recall
#print axioms no_echo_rate_only_source_recall_resolver
#print axioms equal_path_count_different_origin_count

end HsHVerification.OrsonGraphEchoMetrics
