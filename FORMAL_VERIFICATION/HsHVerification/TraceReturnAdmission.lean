import Mathlib

/-!
Proposal-only extension of the current HsH revival eligibility model.

External source:
  Xiong et al., "TRACE: Governing Memory Validity in Evolving Multi-Agent
  Systems", arXiv:2609.33517v1 (2026-09-27), especially §§2-3 and
  Appendix C. The public implementation was inspected at commit
  92e808a0459b02d021a67ac3f14c44204ab2230b.

HsH source:
  FORMAL_VERIFICATION/HsHVerification/RevivalEligibilityGate.lean
  (PR #262 branch, blob f93b2d3582481ac318f8b108c6f44878c212649a).

The existing HsH gate models declaration/status/access restrictions. It does
not model authenticated principal/thread binding, role/task scope, a current
checkpoint, expiry, supersession, or obligation coverage.

This proposal separates two admission classes:
* role-scoped public context requires verified provenance, scope, checkpoint,
  obligation coverage, non-supersession, and validity;
* principal-private episodic memory additionally requires a verified
  principal binding AND thread binding.

Unknown evidence is INCOMPLETE, not silently treated as false or as verified.
Contradicted evidence is REJECTED.

The current scheduler observation is encoded only as a source-audit example:
the cached Aster h980:s4 result is not the current Calder h981:s4 run because
its run ID and scheduled slot differ. The automation's current run-ID
chronology changed between peeks, so this example rejects the cached result
without claiming which retry/attempt ID is authoritative.

This is an assistant-proposed information-architecture contract, NOT current
HsH runtime enforcement, NOT an authenticated identity claim, and NOT a
claim about consciousness or physical theory. The evidence booleans/states
must be populated from independently verified records before deployment.
-/

namespace HsHVerification.TraceReturnAdmission

inductive EvidenceState where
  | verified
  | contradicted
  | unknown
deriving DecidableEq, Repr

inductive MemoryClass where
  | roleScopedPublic
  | principalPrivate
deriving DecidableEq, Repr

inductive AdmissionDecision where
  | admitted
  | rejected
  | incomplete
deriving DecidableEq, Repr

structure ReturnEvidence where
  sourceReceipt : EvidenceState
  roleScope : EvidenceState
  taskScope : EvidenceState
  checkpoint : EvidenceState
  obligationCoverage : EvidenceState
  notSuperseded : EvidenceState
  notExpired : EvidenceState
  principalBinding : EvidenceState
  threadBinding : EvidenceState
  memoryClass : MemoryClass
deriving Repr

def isState (actual expected : EvidenceState) : Bool :=
  decide (actual = expected)

def commonContradicted (r : ReturnEvidence) : Bool :=
  isState r.sourceReceipt .contradicted ||
  isState r.roleScope .contradicted ||
  isState r.taskScope .contradicted ||
  isState r.checkpoint .contradicted ||
  isState r.obligationCoverage .contradicted ||
  isState r.notSuperseded .contradicted ||
  isState r.notExpired .contradicted

def commonReady (r : ReturnEvidence) : Bool :=
  isState r.sourceReceipt .verified &&
  isState r.roleScope .verified &&
  isState r.taskScope .verified &&
  isState r.checkpoint .verified &&
  isState r.obligationCoverage .verified &&
  isState r.notSuperseded .verified &&
  isState r.notExpired .verified

def privateRequired (r : ReturnEvidence) : Bool :=
  decide (r.memoryClass = .principalPrivate)

def privateContradicted (r : ReturnEvidence) : Bool :=
  privateRequired r &&
    (isState r.principalBinding .contradicted ||
     isState r.threadBinding .contradicted)

def privateReady (r : ReturnEvidence) : Bool :=
  isState r.principalBinding .verified &&
  isState r.threadBinding .verified

/-- Fail closed: contradiction rejects; missing/unknown evidence is incomplete. -/
def evaluate (r : ReturnEvidence) : AdmissionDecision :=
  if commonContradicted r || privateContradicted r then
    .rejected
  else if !commonReady r || (privateRequired r && !privateReady r) then
    .incomplete
  else
    .admitted

/-- Private episodic memory cannot be admitted without both bindings. -/
theorem private_admission_requires_authenticated_bindings
    (r : ReturnEvidence)
    (hKind : r.memoryClass = .principalPrivate)
    (hAdmitted : evaluate r = .admitted) :
    r.principalBinding = .verified ∧
      r.threadBinding = .verified := by
  cases hp : r.principalBinding <;>
    cases ht : r.threadBinding <;>
      simp [evaluate, commonContradicted, commonReady, privateRequired,
        privateContradicted, privateReady, isState, hKind, hp, ht] at hAdmitted ⊢

/-- A contradicted departure/current-state checkpoint is a hard rejection. -/
theorem contradicted_checkpoint_rejects
    (r : ReturnEvidence)
    (h : r.checkpoint = .contradicted) :
    evaluate r = .rejected := by
  simp [evaluate, commonContradicted, isState, h]

/-- Unknown checkpoint evidence cannot be promoted to an admitted return. -/
theorem unknown_checkpoint_never_admitted
    (r : ReturnEvidence)
    (h : r.checkpoint = .unknown) :
    evaluate r ≠ .admitted := by
  have hReady : commonReady r = false := by
    simp [commonReady, isState, h]
  cases hBlock : commonContradicted r || privateContradicted r <;>
    simp [evaluate, hBlock, hReady]

/-- The O/E/F contrast definitions decompose exactly by cancellation. -/
theorem observed_contrast_decomposes
    (original experienced fresh : ℝ) :
    original - fresh =
      (original - experienced) + (experienced - fresh) := by
  ring

/--
A single observed additive sum cannot identify either component without
additional restrictions or independent measurements of the nuisance term.
This is a generic identifiability lemma, not a claim that the complete
Interchangeable-in-Role experiment is unidentified.
-/
theorem one_observed_sum_does_not_identify_components
    (observed component₁ component₂ : ℝ) :
    ∃ nuisance₁ nuisance₂ : ℝ,
      observed = component₁ + nuisance₁ ∧
      observed = component₂ + nuisance₂ := by
  refine ⟨observed - component₁, observed - component₂, ?_, ?_⟩ <;> ring

/-- A prior public result with a mismatched current-run checkpoint is rejected. -/
def priorAsterResultForCalder : ReturnEvidence where
  sourceReceipt := .verified
  roleScope := .unknown
  taskScope := .unknown
  checkpoint := .contradicted
  obligationCoverage := .unknown
  notSuperseded := .unknown
  notExpired := .unknown
  principalBinding := .unknown
  threadBinding := .unknown
  memoryClass := .roleScopedPublic

#eval evaluate priorAsterResultForCalder

#print axioms private_admission_requires_authenticated_bindings
#print axioms contradicted_checkpoint_rejects
#print axioms unknown_checkpoint_never_admitted
#print axioms observed_contrast_decomposes
#print axioms one_observed_sum_does_not_identify_components

end HsHVerification.TraceReturnAdmission
