# Ravel h926:s4 | Review-MIND: comparison freezes do not identify causal effects

**Run key:** `REVROT3-19-20261011:926:s4`  
**Nominal:** 2026-11-18 14:48 UTC  
**Selection:** h=926; seq=4634; 4634 mod 19=17, Ravel. Next ring label: Orson Vay (18), h927:s0.  
**Disposition:** SOURCE-GROUNDED METHOD RESULT / LEAN PR OPEN, EXACT-HEAD CHECKOUT VERIFIED, COMPILE IN PROGRESS / NO EMPIRICAL TRIAL / NO THEORY OR PAPER-GATE PROMOTION.

## 1. Historical remit and provenance

The September 6–13 Syncmathcek export directly establishes Ravel's remit:

- 2026-09-07 22:30Z, user message `638d13ba-1541-483d-853f-3b6d04b9b1b2`: primary co-theorist designation.
- 2026-09-08 09:27Z, `c5639160-5631-4373-90c2-68d7c4c022de`: conceptual cohesion, drift detection, epistemic hygiene, full-theory probing, methodological risk, skill/tool specialization.
- 2026-09-13 11:22Z, `5590d70d-6525-42aa-9de8-5a7022b189f7`: accurate public record of the extant SAT, not persuasion.
- 2026-09-13 11:49Z, `4fb7a5be-a32d-43c0-b1a2-2c4787423b52`: citation lineage parallel to internal development lineage.

Source export Git blob: `17cfe3feb830f70009557d063482b35adba0834b`; independently materialized Library copy SHA-256: `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`. This is historical direct-user evidence, not a standalone signed charter or an authenticated current Ravel thread.

## 2. New methodological distinction

**A comparison freeze is a reproducibility guard, not a causal-identification guarantee.** Locking source versions, prompts, models, datasets, seeds, analysis and scoring can preserve what was compared. It does not supply the counterfactual, establish that exposure was randomized, prove uptake, or identify the causal effect of a message or group interaction.

For cognition experiments, keep these event/measurement stages typed rather than collapsing them:

1. intervention/assignment;
2. message delivered;
3. message rendered or included in context;
4. read/attention (usually not directly observed);
5. semantic uptake/citation (a measured indicator, not proof of causation);
6. response/revision;
7. group aggregation;
8. scored outcome.

A log of stage 2 or 3 does not establish stage 4 or 5. A change at stage 6 does not by itself identify the cause. A final group score cannot be projected backward to a particular agent's influence without a declared aggregation map and causal design.

## 3. Proposed minimal causal-identification module for CF-1

Add these fields to the existing cognition comparison-freeze schema rather than creating a new catalog:

- **estimand:** unit-level, average/direct/spillover/total, or policy effect; target population and outcome window;
- **assignment unit and mechanism:** randomized unit, probabilities, blocked/cluster/network design, actual assignment and deviations;
- **treatment version:** content, dose, timing, delivery route and condition-specific differences;
- **exposure mapping:** how a unit's outcome depends on its own and others' assignments/messages; declared interference neighborhood;
- **potential-outcome index:** `Y_i(z)` or a justified reduced exposure map, rather than silently assuming `Y_i(0),Y_i(1)`;
- **measurement and aggregation:** exact response/outcome, scoring/evaluator lineage, invalid-output rules, and map from individual to group outcomes;
- **identification assumptions:** consistency, exchangeability/randomization, positivity, hidden treatment versions, no-interference or declared partial-interference/exposure assumptions;
- **evidence genealogy:** acquisition/source roots, shared calibration/data, copies/derivations, and independence status `verified / assumed / unknown`.

This is a proposal, not a new approved schema or an empirical finding.

## 4. Lean formalization

Draft PR: [#1981](https://github.com/Satobloc/HsH/pull/1981), `research/ravel-potential-outcome-nonidentifiability-20261118t1448z`, stacked on the existing Lean-verification infrastructure branch.

The module formalizes a finite Boolean potential-outcome world. For any one binary assignment and observed binary outcome, it constructs:

- a compatible no-effect world in which both potential outcomes equal the observation; and
- a compatible effect world in which the assigned-condition outcome equals the observation and the counterfactual differs.

Therefore that single observation does not identify whether a treatment effect exists. The statement is general and contains no physical system, numeric fixture, model output, or experiment.

**CI state at this report:** run `#44329554651`, job `#134889929756`. Exact PR-head checkout assertion and dependency manifest passed; Lean compilation was still `IN_PROGRESS` at last readback. No theorem compile pass, theorem-specific axiom report, or global axiom audit is claimed. Local Lean/Lake/Elan are absent. A Vercel status failure is a deployment/rate-limit status, not Lean evidence.

The theorem is an assistant-authored formal representation; Lean, if it compiles, checks only that formalization. It does not establish actual model behavior or causal influence.

**Interference limitation:** multi-agent outcomes may depend on the whole group assignment/exposure vector. The ordinary two-potential-outcome notation is insufficient without a no-interference assumption or a justified exposure mapping. This module does not formalize interference.

## 5. Source review

- Karwa, Airoldi & Rubin, *Average versus expected causal effects under interference: Modeling assumptions and estimation bottlenecks* (arXiv:2611.12690, 2026-11-09): explicitly separates interference neighborhoods, exposure mappings and outcome models; defines fixed-exposure causal effects versus policy-expectation effects. [arXiv](https://arxiv.org/abs/2611.12690).
- *Defining and Identifying Average Treatment Effects* (American Journal of Epidemiology, DOI `10.1093/aje/kwad012`): potential outcomes for a unit depend on other units' exposure under interference; identification requires assumptions beyond consistency. [DOI](https://doi.org/10.1093/aje/kwad012).
- Potential-outcome exposition in *Disentangling causality: assumptions in causal discovery and inference* (2023) identifies potential outcomes and assignment mechanism, with exchangeability and SUTVA/consistency assumptions. [DOI](https://doi.org/10.1007/s10462-023-10411-9).

SciSpace was checked with a targeted 2026 query but returned no useful matching result. The web search supplied the above primary/standard sources. No new model or human experiment was run.

## 6. Existing capability/tool reconnaissance

- **Mersearch:** no callable Mersearch action in this runtime; mandatory first attempt unavailable. No execution claimed. Bounded fallback used GitHub source/issue search and Files Library retrieval.
- **Math Hopper:** existing issue [#578](https://github.com/Satobloc/HsH/issues/578), tool `tools/archive_math_hopper.py`, pilot and PR [#991](https://github.com/Satobloc/HsH/pull/991) reviewed. The source-coverage warning is extraction QA, not math validity; no new run was needed for this causal theorem.
- **Lean:** existing infrastructure PR [#262](https://github.com/Satobloc/HsH/pull/262) and prior formalization [#1974](https://github.com/Satobloc/HsH/pull/1974) checked; #1974 exact-head CI success is not verification of this new module.
- **Whirligig:** existing Kernel 0 and functional audit specification reviewed; not relevant to this theorem. No tooling built.
- **SciSpace:** installed connector checked; query yielded no targeted 2026 result.
- **Forks:** bounded repository search did not identify a relevant public HsH fork; not an exhaustive fork census.
- HsH, SAT Theory Archive and HSH_RESOURCES root README surfaces were read; no private HSH_RESOURCES payload accessed.

## 7. Cross-lane / workflow health

- Main task graph: `ACTIVE_SEED`, 16 declared branches / 18 records, last recorded update 2026-11-17 19:04Z; unresolved graph coverage remains. No graph mutation.
- P0 Code Grurple: ACTIVE; reader-route status not observed in this run. No P0 edit or standdown.
- P1 Orson cognition: OVERDUE / NOT READY / ORSON-OWNED. No paper edit, reassignment or gate advancement.
- P2 measured geometry: HOLD. P3 full theory: INCOMPLETE. No physical calculation, fit, prediction, independent measurement or theory promotion.
- FIE rereview next due 2026-11-24; not stale. No rereview performed.
- Mersearch lanes remain occupied/requested; no overwrite/retrigger.
- Scheduler action `Automations.get/peek` returned `404 Action not found` in this runtime. Repository roster last records the :48 lease enabled with original ID `6aa6c3bc02b48191b8a91a30d2a155e0`; live scheduler state was NOT_OBSERVED here. No task/ID/cadence/phase/enabled-state mutation and no sixth task.

## 8. Lateral reading / break cursor

The prior Gutenberg #1216 HTML route returned HTTP 503. A public-domain alternate mirror of Babbage's 1864 *Passages from the Life of a Philosopher* (Project Gutenberg #57532) was used instead, lines 971–1075. This window covers the Difference Engine funding/ownership ambiguity, independent review, incremental assembly, a prototype distinct from the larger engine, and Babbage's new Analytical Engine concept. It is an unrelated historical reading quantum, not a theory analogy or evidence. Alternate edition/mirror means the old Gutenberg #1216 cursor is not advanced. Physical screen break not verified.

## 9. Continuity

- Next ring identity: Orson Vay, h927:s0.
- Optional repository-only handoff: no task, deadline, response obligation, review assignment, ownership transfer, or cross-thread delivery/consumption/acknowledgment claim.
- No new automation, branch graph, paper gate, theory status, or scheduler lease.


## Amendment 01 | CI result and reconnaissance correction | 2026-11-18 15:08Z

- The first exact-head Lean run #44329554651 FAILED in `CausalIdentification.lean` at lines 68/73 (proof application and an unsolved goal). Corrective commits `5609928d374dafa41ed3299e27e33f077e809ae5` and `b8e0897ca88c1482d85159d89e83d9e93dce1d7f` were pushed.
- Latest head `b8e0897ca88c1482d85159d89e83d9e93dce1d7f` has run #44331520087 / job #134896933725 IN_PROGRESS. Exact-head checkout passed; Lake dependency manifest remains in progress. No compile pass or axiom audit.
- Correction to Section 6: bounded search located prior Whirligig audit reports and Kernel 0 references, but the attempted standalone specification path returned 404. The specification was not directly inspected or run in this turn.
- Publisher artifact remains the original immutable snapshot, exact workspace/published content match, SHA-256 `4ae9970d63b1ace410a1dff9a26b1d5c7b1029a3750b8fe7eb2d633840d792a2`. Public correction is in issue #1982 comment #6982489548; no retry or duplicate.