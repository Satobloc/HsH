import Mathlib

/-!
# Dependence identifiability beyond source provenance

Assistant reconstruction, 2026-11-25.

Motivation:
* Gao et al., "Copies or Sources?" (arXiv:2610.06192), distinguish
  restated copies from distinct readings and explicitly identify sources with
  shared failure modes as requiring a dependence-aware oracle.
* Wan et al., "Right Answers, Wrong States" (arXiv:2610.01244), identify
  settings in which source-level identifiability may be absent.
* Gong et al. (arXiv:2609.36855) manipulate peer-message exposure while holding
  receiver evidence fixed, separating message influence from evidence origin.
* Li et al. (arXiv:2609.35279v2) record correction and collapse as distinct
  signed transitions rather than relying on final accuracy alone.

This module formalizes one narrow identifiability boundary: a projection that
retains only source-root provenance cannot, in general, recover a separate
dependence relation when two admissible worlds have the same source projection
but different dependence relations.

The relation called `dependence` is abstract. This theorem does not define
probabilistic independence, estimate covariance, identify a real common cause,
or establish that any particular pair of LLM outputs is dependent. Those
claims require separately evidenced statistical or causal models.

No P1 trial, dataset expansion, protocol amendment, or manuscript edit is
performed by this formalization.
-/

namespace HsHVerification.OrsonDependenceIdentifiability

/-- Source-root membership retained by the provenance projection. -/
abbrev SourceProjection (Item Root : Type*) := Item → Root → Prop

/-- A separately specified pairwise dependence relation. -/
abbrev DependenceRelation (Item : Type*) := Item → Item → Prop

/-- A candidate evidence world contains provenance and dependence separately. -/
structure EvidenceWorld (Item Root : Type*) where
  sourceRoots : SourceProjection Item Root
  dependence : DependenceRelation Item

/--
Any resolver that is correct for every evidence world and receives only the
source-root projection must assign the same dependence relation to worlds
whose source projections are equal.
-/
theorem source_only_resolver_forces_same_dependence
    {Item Root : Type*}
    (resolve : SourceProjection Item Root → DependenceRelation Item)
    (hresolve : ∀ world : EvidenceWorld Item Root,
      resolve world.sourceRoots = world.dependence)
    (left right : EvidenceWorld Item Root)
    (sameSourceProjection : left.sourceRoots = right.sourceRoots) :
    left.dependence = right.dependence := by
  calc
    left.dependence = resolve left.sourceRoots := (hresolve left).symm
    _ = resolve right.sourceRoots := by rw [sameSourceProjection]
    _ = right.dependence := hresolve right

/--
If two candidate worlds preserve exactly the same source provenance but differ
in dependence, no resolver using source provenance alone can be correct for
both. The missing dependence information must be supplied or measured
separately; it cannot be reconstructed from this projection.
-/
theorem no_source_only_resolver_of_dependence_ambiguity
    {Item Root : Type*}
    (left right : EvidenceWorld Item Root)
    (sameSourceProjection : left.sourceRoots = right.sourceRoots)
    (differentDependence : left.dependence ≠ right.dependence) :
    ¬ ∃ resolve : SourceProjection Item Root → DependenceRelation Item,
      ∀ world : EvidenceWorld Item Root,
        resolve world.sourceRoots = world.dependence := by
  rintro ⟨resolve, hresolve⟩
  exact differentDependence
    (source_only_resolver_forces_same_dependence
      resolve hresolve left right sameSourceProjection)

#print axioms source_only_resolver_forces_same_dependence
#print axioms no_source_only_resolver_of_dependence_ambiguity

end HsHVerification.OrsonDependenceIdentifiability


/-!
# Self-report construct separation (assistant reconstruction)

External primary comparators:
* Singh, Linzen & Ravfogel, "Can LLMs Introspect? A Reality Check"
  (arXiv:2605.26242, COLM 2026): privileged access and second-order
  computation are separate requirements; behavior alone is insufficient.
* Atkinson, Plunkett & Bau, "Identifying Introspection From the Inside"
  (arXiv:2610.07186, COLM 2026): separates behavioral faithfulness from
  causal grounding and supplies a mechanistic test in a controlled setting.

The finite readout model below has one observed state (false). A behavior
function and a report function can agree on that observed support while
disagreeing under the intervention/state change to true. This is a logical
counterexample to inferring counterfactual alignment from observed agreement.

This formal counterexample does not establish that any actual LLM is
ungrounded, that a particular report is confabulated, or that a model has or
lacks consciousness. It does not prove second-order representation. It does
not modify the frozen P1 protocol, issue #564, PR #850, any dataset, trial,
manuscript, or paper gate.
-/

namespace HsHVerification.OrsonSelfReportEvidence

/-- First-order task behavior and verbal self-report as functions of a state. -/
structure ReadoutFunctions where
  behavior : Bool → Bool
  report : Bool → Bool

/-- Only the false state is represented in the observed sample. -/
def observedSupport (state : Bool) : Prop := state = false

/-- Report and behavior agree on every state in the observed support. -/
def observedAgreement (m : ReadoutFunctions) : Prop :=
  ∀ state, observedSupport state → m.behavior state = m.report state

/-- A deliberately weak counterfactual-alignment condition. It is not a
    definition of mechanistic grounding or second-order representation. -/
def counterfactualAgreement (m : ReadoutFunctions) : Prop :=
  ∀ state, m.behavior state = m.report state

/-- Two readout systems are observationally equivalent on the declared support. -/
def sameObservedOutputs (left right : ReadoutFunctions) : Prop :=
  ∀ state, observedSupport state →
    left.behavior state = right.behavior state ∧
    left.report state = right.report state

/-- Both channels follow the state in every condition. -/
def alignedReadout : ReadoutFunctions :=
  ⟨id, id⟩

/-- Behavior follows the state, but the report is a constant that happens
    to agree on the only observed state. This is an input-driven bypass witness. -/
def bypassReadout : ReadoutFunctions :=
  ⟨id, fun _ => false⟩

theorem aligned_readout_observed_agreement :
    observedAgreement alignedReadout := by
  intro state hObserved
  rfl

theorem bypass_readout_observed_agreement :
    observedAgreement bypassReadout := by
  intro state hObserved
  have hFalse : state = false := by
    simpa [observedSupport] using hObserved
  subst state
  rfl

theorem readouts_same_on_observed_support :
    sameObservedOutputs alignedReadout bypassReadout := by
  intro state hObserved
  have hFalse : state = false := by
    simpa [observedSupport] using hObserved
  subst state
  exact ⟨rfl, rfl⟩

theorem aligned_readout_counterfactually_agrees :
    counterfactualAgreement alignedReadout := by
  intro state
  rfl

theorem bypass_readout_not_counterfactually_aligned :
    ¬ counterfactualAgreement bypassReadout := by
  intro hAligned
  have hAtTrue := hAligned true
  change true = false at hAtTrue
  cases hAtTrue

/-- Observational equivalence and perfect in-sample fidelity do not identify
    counterfactual alignment outside the observed support. -/
theorem observed_fidelity_does_not_identify_counterfactual_alignment :
    sameObservedOutputs alignedReadout bypassReadout ∧
    observedAgreement alignedReadout ∧
    observedAgreement bypassReadout ∧
    counterfactualAgreement alignedReadout ∧
    ¬ counterfactualAgreement bypassReadout := by
  exact ⟨
    readouts_same_on_observed_support,
    aligned_readout_observed_agreement,
    bypass_readout_observed_agreement,
    aligned_readout_counterfactually_agrees,
    bypass_readout_not_counterfactually_aligned
  ⟩

#eval (alignedReadout.behavior true, alignedReadout.report true,
  bypassReadout.behavior true, bypassReadout.report true)

#print axioms aligned_readout_observed_agreement
#print axioms bypass_readout_observed_agreement
#print axioms readouts_same_on_observed_support
#print axioms aligned_readout_counterfactually_agrees
#print axioms bypass_readout_not_counterfactually_aligned
#print axioms observed_fidelity_does_not_identify_counterfactual_alignment

end HsHVerification.OrsonSelfReportEvidence


/-!
# Monitoring-control causal identifiability (assistant reconstruction, 2026-11-26)

Primary research motivating this distinction:
* Kumaran et al., "Causal Evidence that Language Models use Confidence to Drive
  Behavior" (Nature Machine Intelligence, 2026; arXiv:2603.22161): activation
  steering changes abstention, a reactive answer/abstain control result.
* Kumaran et al., "How LLMs Detect and Correct Their Own Errors" (arXiv:2604.22271):
  post-answer PANL activations predict verification and correction, with
  activation patching/ablation.
* Cacioli, "The Metacognitive Monitoring Battery" (arXiv:2604.15702):
  retrospective KEEP/WITHDRAW monitoring and prospective ANSWER/HINT/DECLINE
  regulation are measured separately; the reported cross-model association is
  weak and imprecise (r = .17, n = 20).
* Al Nazi and Roy Dipta, "TRIAGE" (arXiv:2605.13414): prospective portfolio
  selection, ordering, and token allocation under a shared budget.
* Cao et al., "LLMs Know When They Know, but Do Not Act on It"
  (arXiv:2605.14186): model-originated FOK/JOL signals are consumed by an
  external per-model SVM harness that selects retry/stop actions.

The finite witness below separates a model-originated monitoring signal from
an external task-state cue. In the observed regime the two cues are perfectly
correlated, so a monitor-driven controller and a task-cue-driven controller
produce exactly the same actions for every observed state. Under an
intervention that changes only the monitor signal while holding the task cue
fixed, their actions diverge.

This is a logical identifiability witness, not an LLM measurement, a physical
calculation, or evidence about any particular model. The theorem shows why
observational monitor/action association is insufficient to identify which
input causally drives control; it does not establish that a real system has
either architecture.
-/

namespace HsHVerification.OrsonMonitoringControlIdentifiability

/-- A controller receives a model-originated monitor signal and an external
    task-state cue, then chooses a binary action (e.g. retry versus stop). -/
structure ControlArchitecture where
  monitor : Bool → Bool
  taskStateCue : Bool → Bool
  choose : Bool → Bool → Bool

/-- The action actually observed when both naturally correlated cues are present. -/
def observedAction (w : ControlArchitecture) (state : Bool) : Bool :=
  w.choose (w.monitor state) (w.taskStateCue state)

/-- The action under an intervention on the monitor signal, holding the
    external task-state cue at its naturally observed value. -/
def actionUnderMonitorIntervention
    (w : ControlArchitecture) (state forcedMonitor : Bool) : Bool :=
  w.choose forcedMonitor (w.taskStateCue state)

/-- The controller causally reads the monitor signal. -/
def monitorDriven : ControlArchitecture :=
  ⟨id, id, fun monitor _ => monitor⟩

/-- The controller ignores the monitor and instead reads the perfectly
    correlated external task-state cue. -/
def taskCueDriven : ControlArchitecture :=
  ⟨id, id, fun _ cue => cue⟩

/-- Two architectures agree on every naturally observed state. -/
def sameObservedActions (left right : ControlArchitecture) : Prop :=
  ∀ state, observedAction left state = observedAction right state

theorem monitor_and_task_cue_architectures_are_observationally_equal :
    sameObservedActions monitorDriven taskCueDriven := by
  intro state
  rfl

/-- Identical observed actions do not identify whether the model-originated
    monitor signal causally drives the controller. Intervening on that signal
    while holding the external cue fixed separates the two architectures. -/
theorem observed_agreement_does_not_identify_monitor_causation :
    sameObservedActions monitorDriven taskCueDriven ∧
    actionUnderMonitorIntervention monitorDriven false true ≠
      actionUnderMonitorIntervention taskCueDriven false true := by
  constructor
  · exact monitor_and_task_cue_architectures_are_observationally_equal
  · decide

#eval (
  observedAction monitorDriven false,
  observedAction taskCueDriven false,
  actionUnderMonitorIntervention monitorDriven false true,
  actionUnderMonitorIntervention taskCueDriven false true
)

#print axioms monitor_and_task_cue_architectures_are_observationally_equal
#print axioms observed_agreement_does_not_identify_monitor_causation

end HsHVerification.OrsonMonitoringControlIdentifiability


/-!
# Review-feature monoculture and error identifiability (assistant reconstruction, 2026-11-27)

External source:
* Hou, Zhang, Stacy, Black & Chandrasekaran, "Do AI Reviewers Converge?
  Diversity Collapse in Model-Generated Peer Review", Findings of EMNLP 2026,
  DOI: 10.18653/2026.findings-emnlp.1035.
* Public implementation: jackshengxinz/Review_Monoculture,
  ICLR_600/inter-review_similarity_eval/run_experiment1_random_pairwise.py,
  Git blob 7b59ab12b695979eb0aeb28032c463348fac547a.

The study measures review-text features and cross-paper embedding similarity.
Its own limitations state that these automated metrics do not fully measure
review correctness or quality, and that textual-output analysis is not the
full peer-review process. The public code additionally samples paper pairs
with replacement across pair draws and applies independent-sample tests
(ttest_ind, mannwhitneyu) to LLM and human scores generated from the same
pair set. The data files/results are not present in the inspected public
repository, so no reanalysis or corrected p-value is claimed.

The finite witnesses below establish two logical boundaries:
1. Maximal cross-paper feature similarity does not identify within-paper
   reviewer error agreement.
2. Marginal score multisets do not identify paired differences when the
   pairing map is discarded.

These are conditional mathematical counterexamples, not claims about the
actual ICLR-REVIEWS records, any model's correctness, or the empirical size
of the reported effects. They do not amend the frozen P1 protocol or paper.
-/

namespace HsHVerification.OrsonReviewFeatureErrorIdentifiability

abbrev Reviewer := Fin 2
abbrev Submission := Fin 2

def reviewerZero : Reviewer := ⟨0, by decide⟩
def reviewerOne : Reviewer := ⟨1, by decide⟩

/-- A deliberately constant measured feature projection for review text. -/
def constantReviewFeature (_reviewer : Reviewer) (_submission : Submission) : Nat := 0

/-- Number of ordered, distinct-paper pairs with matching projected features. -/
def crossPaperFeatureMatchCount
    (feature : Reviewer → Submission → Nat) : Nat :=
  (Finset.univ.filter (fun pair : Submission × Submission =>
    pair.1 ≠ pair.2 ∧
    feature reviewerZero pair.1 = feature reviewerZero pair.2)).card

/-- Number of submissions on which two reviewers have the same error status. -/
def errorAgreementCount
    (errors : Reviewer → Submission → Bool) : Nat :=
  (Finset.univ.filter (fun submission =>
    errors reviewerZero submission = errors reviewerOne submission)).card

/-- A world in which both reviewers share the same error status per submission. -/
def alignedErrors (_reviewer : Reviewer) (submission : Submission) : Bool :=
  decide (submission.val = 1)

/-- A world in which the two reviewers have opposite error status per submission. -/
def opposedErrors (reviewer : Reviewer) (submission : Submission) : Bool :=
  decide (reviewer.val = submission.val)

theorem constant_feature_is_maximally_cross_paper_matching :
    crossPaperFeatureMatchCount constantReviewFeature = 2 := by
  decide

theorem aligned_error_world_has_full_agreement :
    errorAgreementCount alignedErrors = 2 := by
  decide

theorem opposed_error_world_has_no_agreement :
    errorAgreementCount opposedErrors = 0 := by
  decide

/-- The same maximal cross-paper feature statistic is compatible with
    different within-paper error-agreement structures. -/
theorem maximal_feature_similarity_does_not_identify_error_agreement :
    crossPaperFeatureMatchCount constantReviewFeature = 2 ∧
    errorAgreementCount alignedErrors = 2 ∧
    errorAgreementCount opposedErrors = 0 := by
  exact ⟨
    constant_feature_is_maximally_cross_paper_matching,
    aligned_error_world_has_full_agreement,
    opposed_error_world_has_no_agreement
  ⟩

/-- A paired difference sequence retains the pairing of two score lists. -/
def pairedDifferences (left right : List Int) : List Int :=
  List.zipWith (fun x y => x - y) left right

def baselineScores : List Int := [0, 1]
def alignedComparisonScores : List Int := [0, 1]
def crossedComparisonScores : List Int := [1, 0]

theorem comparison_marginals_are_the_same :
    alignedComparisonScores.Perm crossedComparisonScores := by
  decide

theorem same_marginals_can_have_different_paired_differences :
    pairedDifferences baselineScores alignedComparisonScores ≠
      pairedDifferences baselineScores crossedComparisonScores := by
  decide

/-- Discarding pair identity loses information needed to reconstruct
    paired differences, even when the two comparison samples have identical
    marginal multisets. -/
theorem marginal_samples_do_not_identify_pairwise_differences :
    alignedComparisonScores.Perm crossedComparisonScores ∧
    pairedDifferences baselineScores alignedComparisonScores ≠
      pairedDifferences baselineScores crossedComparisonScores := by
  exact ⟨comparison_marginals_are_the_same,
    same_marginals_can_have_different_paired_differences⟩

#eval (
  crossPaperFeatureMatchCount constantReviewFeature,
  errorAgreementCount alignedErrors,
  errorAgreementCount opposedErrors,
  pairedDifferences baselineScores alignedComparisonScores,
  pairedDifferences baselineScores crossedComparisonScores
)

#print axioms maximal_feature_similarity_does_not_identify_error_agreement
#print axioms marginal_samples_do_not_identify_pairwise_differences

end HsHVerification.OrsonReviewFeatureErrorIdentifiability


/-!
# Semantic memory derivation: relation-deletion identifiability
Assistant reconstruction, 2026-11-27.

Primary source: Liu and Zhao, "Memory Is a Derivation: The Distributed-Evidence
Paradox in Long-Term Agents", arXiv:2609.36130, Appendix A, Lemma 1.

The source's representation-deletion boundary says that if two candidate
memories differ in a truth-conditional relation but the verifier receives
the same mention-only representation and evidence, a verifier factoring
only through that representation cannot distinguish the candidates.

The finite schema below keeps an abstract relation-licensing bit separate
from the view delivered to a verifier. It is a logical witness only:
not a model output, measured cognition, human annotation, empirical
verification result, or reproduction of DerivAudit.
-/

namespace HsHVerification.OrsonMemoryDerivation

/-- A candidate memory has mentioned entities, an evidence view, and a
    separate truth-conditional relation-licensing status. -/
structure MemoryCandidate where
  mentions : Finset Nat
  evidence : Finset Nat
  relationLicensed : Bool
  deriving DecidableEq

/-- The verifier's input projection omits the relation-licensing status. -/
def mentionEvidenceView (m : MemoryCandidate) : Finset Nat × Finset Nat :=
  (m.mentions, m.evidence)

/-- A verifier is correct on every candidate only if its output equals the
    candidate's relation-licensing status for the supplied view. -/
def relationVerifierCorrect
    (verify : (Finset Nat × Finset Nat) → Bool) : Prop :=
  ∀ m : MemoryCandidate, verify (mentionEvidenceView m) = m.relationLicensed

/-- If two candidates have the same verifier-visible projection but different
    relation-licensing statuses, no verifier using only that projection can
    classify both correctly. This is a generic fiber-identifiability result
    for the declared projection, not an empirical claim about any model. -/
theorem no_view_only_verifier_of_relation_ambiguity
    (left right : MemoryCandidate)
    (sameView : mentionEvidenceView left = mentionEvidenceView right)
    (differentLicense : left.relationLicensed ≠ right.relationLicensed) :
    ¬ ∃ verify : (Finset Nat × Finset Nat) → Bool,
        relationVerifierCorrect verify := by
  rintro ⟨verify, hcorrect⟩
  apply differentLicense
  calc
    left.relationLicensed = verify (mentionEvidenceView left) :=
      (hcorrect left).symm
    _ = verify (mentionEvidenceView right) := by rw [sameView]
    _ = right.relationLicensed := hcorrect right

/-- Two candidates retain the same mentions and evidence but differ in
    whether the relation between those mentions is licensed. -/
def licensedRelationCandidate : MemoryCandidate :=
  ⟨{1, 2}, {10, 20}, true⟩

def unlicensedRelationCandidate : MemoryCandidate :=
  ⟨{1, 2}, {10, 20}, false⟩

theorem relation_deletion_witness :
    mentionEvidenceView licensedRelationCandidate =
      mentionEvidenceView unlicensedRelationCandidate ∧
    licensedRelationCandidate.relationLicensed ≠
      unlicensedRelationCandidate.relationLicensed := by
  constructor <;> decide

theorem no_relation_blind_verifier :
    ¬ ∃ verify : (Finset Nat × Finset Nat) → Bool,
        relationVerifierCorrect verify := by
  exact no_view_only_verifier_of_relation_ambiguity
    licensedRelationCandidate unlicensedRelationCandidate
    relation_deletion_witness.1 relation_deletion_witness.2

#eval (
  mentionEvidenceView licensedRelationCandidate =
    mentionEvidenceView unlicensedRelationCandidate,
  licensedRelationCandidate.relationLicensed,
  unlicensedRelationCandidate.relationLicensed
)

#print axioms no_view_only_verifier_of_relation_ambiguity
#print axioms relation_deletion_witness
#print axioms no_relation_blind_verifier

end HsHVerification.OrsonMemoryDerivation
