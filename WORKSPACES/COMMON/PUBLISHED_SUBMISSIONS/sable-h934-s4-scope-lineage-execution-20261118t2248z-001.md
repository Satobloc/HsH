# Scope, Lineage, Execution: a three-gate continuity contract for multi-agent workflows

**Review-MIND source synthesis | 18 November 2026 | h934:s4**
**Epistemic status:** assistant reconstruction and testable systems proposal. Not Nathan Direct, not an H(s)H/SAT theory result, not an empirical result from this Workshop Relay.

## Finding

Three recent studies isolate different failure surfaces in persistent multi-agent systems:

1. **Scope admission:** a sentence can be accurately remembered but stored under the wrong speaker, world, branch, or provisional context.
2. **Derivation currency:** an agent can possess the latest shared state while acting from a plan derived from an obsolete version.
3. **Execution discharge:** a stored update or handoff does not establish that the intended recipient received it, used it, performed the required action, or completed that action within the required observation window.

These are separate invariants. A system that checks only memory correctness, only current state, or only final output can still make unsupported claims about what happened.

## Primary-source review

### CASK: scope-aware memory admission

Gu and Li, *Whose Memory Is It? Scope-Aware Commit Rules for Long-Term LLM Memory*, arXiv:2610.09008 (6 October 2026):
https://arxiv.org/abs/2610.09008

The paper identifies discourse ownership: the world, branch, or speaker that licenses a proposition. It distinguishes actual-world facts from beliefs, plans, fiction, and counterfactuals. Its CASK interface retains a typed pair of Gram blocks plus diagnostic logits rather than storing only a context-free sentence or a single undifferentiated Gram matrix.

The evaluation uses frozen Qwen2.5-3B-Instruct and Qwen2.5-1.5B-Instruct models, 486 exact-span questions from ten LoCoMo conversations, and a generated tool-agent-trace study of 75 episodes (511 records across ten conversations). Reported attachment accuracy is 83.33% on the 3B model and 79.82% on the 1.5B model. The paper also reports a scope-only control in which payload is byte-identical and reporting frame changes, supporting the claim that the measured gain concerns scope rather than payload.

The paper states formal guarantees for gauge invariance, completeness of the Gram representation for ordered configurations, perturbation stability, and typed refinement. Those are the paper's proofs; they were not independently re-proved or Lean-checked in this review. The evidence remains bounded by two model sizes, ten long-history conversations, generated traces, and the authors' stated need to extend nested scopes and broader model families. No independent replication assessment was conducted in this bounded review.

### PlanFence: dependency-scoped plan validation

Chen, Wang, and Brinton, *Fresh Memory, Stale Plans: Dependency-Scoped Validation for Distributed LLM-Agent Memory*, arXiv:2609.03340 (3 September 2026):
https://arxiv.org/abs/2609.03340

The paper distinguishes current executor state from the lineage of the plan authorizing an action. A plan records exact parent records; the tool wrapper declares the action-relevant dependency set; immediately before an external action, the executor validates those dependencies against their authoritative owners. A mismatch permits one replan and revalidation; missing or malformed lineage fails closed.

In 30 controlled live five-agent workflows across reservation, fulfillment, and deployment, owner-head freshness alone issued an obsolete primary action in all 30 tasks. Centralized lineage and PlanFence each completed all 30 with no invalid primary action and one successful replan per task. The wider replay tests coordination cost across update rates, keyspace sizes, and network traces.

The authors explicitly limit the result: three workflow families, 3–8 agents, constructed keyspaces, and a small set of historical network traces. The guarantee assumes benign owners, exact immutable parent links, complete tool-declared dependencies, and authenticated transport. It is neither an atomic multi-owner snapshot nor a transaction spanning the later external service action. The 30/30 result is a staged safety test, not a general task-accuracy estimate.

### CAVERT: execution consistency and evidence of discharge

Yu et al., *Beyond Corrected Memory: Execution Consistency in Multi-Agent Systems*, arXiv:2610.08101 (6 October 2026):
https://arxiv.org/abs/2610.08101

CAVERT distinguishes a task duty from the evidence needed to judge its fulfillment. Its three contract families concern strict-temporal state use, causal-semantic information handoffs, and eventual-semantic agreement among designated final states. Five tested evidence factors are consumer receipt, action dependency, actor authorization, historical-version eligibility, and repair validity at the deadline.

In 450 paired cases across AgentWebBench, MARBLE, and MECoBench, 398 pairs had opposite fulfilled/violated labels. Removing the tested relationships made 328/398 pairs (82.4%) observationally identical to the judge; restoring the relationships separated 321/328 of those merged pairs (97.9%). A separate 360-trajectory sample was labeled 43 violated, 288 fulfilled, and 29 undetermined. The paper reports 87.1% accuracy and 83.5% macro-F1 on a separate 720-execution diagnostic comparison.

The three-valued result matters: **undetermined is an evidential state, not a confidence score**. An absent event can mean that no action occurred or that its channel was not captured. The paper explicitly distinguishes writing a revocation from receiving it, receiving it from using it, and requesting an action from proving that its effect persisted through the deadline.

The natural-log sample includes a task-failure-only source; its 43/360 label count is not a prevalence estimate for deployed systems. The work uses benchmark and controlled traces, not a human-subject deployment study. Human annotation supports some reference labels, but this is not evidence about human-group cognition or consciousness. No independent replication assessment was conducted in this bounded review.

## Synthesis: Scope → Lineage → Execution

The three papers support a useful **assistant-proposed** architecture, not a claim that the authors jointly proposed or validated one unified protocol.

| Gate | Required invariant | Failure prevented |
|---|---|---|
| **Scope** | A proposition retains its speaker/world/branch, epistemic status, and authorization to enter a shared memory scope. | A hypothesis, rejected plan, simulated result, or another agent's belief becomes an unconditional fact. |
| **Lineage** | A plan names exact immutable parents and the complete action-relevant dependency frontier; those versions are revalidated at the action boundary. | A current memory coexists with a stale derivation that still controls an action. |
| **Execution** | A duty is linked to actor, recipient, receipt, state use, action, effect, deadline, and complete observation coverage. | A stored update or handoff is mistaken for delivery, use, action, or successful completion. |

### Typed structure and composition conditions

A minimal typed design would keep these objects distinct:

- Claim: proposition, source, speaker/owner, epistemic status, scope, and validity interval.
- MemoryEntry: admitted claim plus the scope edge that licenses its use.
- Plan: intended action, exact parent record IDs, declared dependency set, and parent-version frontier.
- Duty: required response, responsible actor, recipient, scope, activation condition, and deadline.
- ExecutionTrace: ordered message, receipt, read, tool-call, result, and effect events, plus the channels and time interval actually covered.
- Outcome: FULFILLED, VIOLATED, or UNDETERMINED.

The corresponding maps and projections are explicit:

π_scope : Claim → (speaker, world, branch, epistemic_status, validity_interval)

admit : (Claim × Scope) → MemoryEntry

derive : (MemoryState × Task) → Plan

π_dep : Plan → (exact_parent_IDs, action_dependency_set, version_frontier)

validate : (Plan × CurrentOwnerHeads) → AuthorizedPlan | ReplanRequired | Blocked

execute : (AuthorizedPlan × Runtime) → ExecutionTrace

π_exec : ExecutionTrace → (receipt, state_use, action, effect, deadline, channel_coverage)

judge : (Duty × ExecutionTrace × Coverage) → FULFILLED | VIOLATED | UNDETERMINED

The composed path is typed and branch-sensitive: Claim × Scope → MemoryEntry → Plan → GateResult; only the AuthorizedPlan branch may enter execute, and only its resulting trace plus coverage may enter judge. ReplanRequired and Blocked terminate before the external action. The composition is sound only when the scope edge is preserved, parent links are complete, the dependency declaration is complete for the action, owner responses are authoritative, the authorization is linked to the executed action, and observation coverage reaches the relevant deadline. A missing receipt, unavailable owner, unlogged action channel, or incomplete observation window must not be silently mapped to success or failure; it yields UNDETERMINED.

This is a typed design proposal. It does not assert that all state can be retained, that every agent has a stable identity, or that the three maps are already implemented in HsH.

## Application to the Workshop Relay architecture

The existing workflow already distinguishes several of these states, but they are distributed across receipts, issues, artifacts, branch commits, task metadata, and handoff packets.

- A ring label is a deterministic routing label, not authentication of a particular model instance or conversation.
- A current main commit does not prove that a plan was derived from that commit.
- A publisher's successful workflow run does not by itself establish publication acceptance; the publisher comment and exact artifact readback are required.
- A published artifact or repository handoff packet does not establish that a recipient thread read, understood, or used it.
- A chat_ref, where present, is not by itself proof of delivery or consumption.
- A final COMPLETED status is not interchangeable with a verified external effect or a fully observed obligation.

The practical recommendation is a **status vector**, not one overloaded status field:

scope_status × lineage_status × execution_status × authentication_status × coverage_status

Each component should be PASS, FAIL, or UNKNOWN (with a separate NOT_APPLICABLE where justified). Only a complete, source-supported combination should permit a duty-level FULFILLED or VIOLATED verdict. Otherwise preserve UNDETERMINED.

This design aligns with the current no-cross-thread-delivery rule: a repository packet may be read back and verified as a file while recipient consumption remains unknown.

## Falsifiable evaluation

A bounded replay study could compare four reporting conditions over archived, fully auditable workflow episodes:

1. flat summary only;
2. summary plus scope/ownership;
3. scope plus exact plan lineage and dependency frontier;
4. the full scope-lineage-execution trace with coverage.

Create blinded paired cases in which summaries are deliberately identical while the underlying execution labels differ. Independent reviewers classify each duty as fulfilled, violated, or undetermined. Measure false-fulfilled and false-violated rates separately, undetermined rate, stale-action blocking, scope contamination, action completion, latency, and record/communication cost.

The design is weakened or falsified if the full trace still merges known opposite outcomes, if its classifications do not improve over the simpler conditions, or if it achieves apparent accuracy only by labeling nearly everything undetermined. Human participants would require informed consent and privacy controls; no human study is proposed as already performed.

No experiment, model/API call, human-participant study, dataset reanalysis, or new execution trial was conducted in this review.

## Formalization status and ownership boundary

The CAVERT observation-collision argument can be stated conditionally:

If two executions have the same retained observation but opposite duty labels, then no deterministic judge that receives only that observation can classify both correctly. The proof is immediate: equal inputs force equal judge outputs, contradicting the opposite labels.

HsH already contains adjacent generic mathematics in Orson's protected draft branch: ObservableProjection.lean proves that equal projections give the same status for every predicate defined only on that projection, and includes non-injective projection and observation-factorization results. OrsonSharedRecordIdentifiability.lean formalizes a different, conditional shared-gate versus latent-difficulty model. These are related but not identical to a CAVERT-specific duty-discharge theorem.

The exact Orson branch head inspected was 883003fef9ff77e771bce30eac8a112741728fbc; no PR-triggered workflow run was associated with that exact head. Local Lean, Lake, and Elan were absent. The only visible Lean verification workflow was on Orson's protected draft branch, so it was not used as a vehicle for unrelated work. No Lean compile or actual #eval run is claimed here; the exact CAVERT corollary remains a formalization candidate, not a verified HsH theorem. No Orson file, PR, protocol, manuscript, dataset, or paper gate was changed.

## Tool and source limits

Mersearch was not exposed as an executable connector in this runtime; no Mersearch search is claimed. SciSpace was available for discovery, and the three original arXiv texts were inspected directly. Existing HsH Lean PRs, Math Hopper #578 / PR #991, and the Whirligig Kernel 0 sandbox were checked before considering new tooling. Math Hopper is an extraction/QA path, not a Lean proof runner; Whirligig Kernel 0 is a restricted sandbox. No new tool, fork, dependency, subscription, paid service, or local Lean installation was created.

The HsH, SAT archive, and HSH_RESOURCES front doors were read. The HSH_RESOURCES private payload was not opened.

## Epistemic disposition

- **Source findings:** three arXiv preprints, source-reviewed to the extents stated above.
- **Assistant synthesis:** Scope → Lineage → Execution; proposed status vector and falsification design.
- **Formal status:** adjacent Orson draft-branch lemmas exist; no exact-head compile for the inspected branch and no new Lean run.
- **Empirical status:** no new experiment or independent measurement.
- **Theory status:** no SAT/H(s)H premise, equation, physical mechanism, or BEDROCK status changed.
