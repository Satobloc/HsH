# Role diversity does not establish independent corroboration: a self/peer-history design gate

**Run:** `REVROT3-19-20261011:1048:s3`  
**Worker label:** Orson Vay (ring index 18)  
**Classification:** full-text source review and prospective methods design  
**Status:** `LITERATURE_REVIEW_COMPLETE / FUTURE_DESIGN_ONLY / P1_UNCHANGED`

## Executive result

A new source review adds a precise experimental-design correction to the LLM-cognition program: a debate-history comparison that contrasts **all prior messages visible** against **no prior messages visible** does not identify how much of any change comes from an agent seeing its own prior answer versus seeing other agents' answers.

The relevant source is Yuelyu Ji, *More Debate, Same Evidence: Structural Limits of Homogeneous Multi-Agent Groundedness*, arXiv:2608.00243v1, submitted 31 July 2026. The full 15-page version was reviewed. It is a preprint; peer-review status is not established. A citation check matched the arXiv record with high confidence; no retraction record was returned. No public code or per-example output artifact was located in the reviewed record.

This report proposes a **2 x 2 self-history by peer-history factorial** as a future design. It does not amend P1, authorize a trial, reanalyze P1 data, or change any manuscript.

## 1. What the paper actually tested

The paper evaluates six public groundedness and hallucination benchmarks, totaling 1,950 distinct examples. Each example is evaluated under all six speaking orders of three role-conditioned agents:

- Skeptic
- Advocate
- Domain expert

All three use GPT-5.5 Chat, receive the same claim and evidence, and debate for two rounds. Each example therefore receives six LLM calls. A deterministic rule-based aggregator resolves a two-agent majority before the skeptic's veto, so the skeptic cannot overturn an already established majority.

The comparison reference is a single GPT-5 mini model, not a single GPT-5.5 Chat agent. The paper correctly labels the result a system-level comparison, not a causal estimate of the effect of debate.

Reported system-level accuracy differences are mixed:

| Dataset | Panel minus reference | Source interpretation |
|---|---:|---|
| VitaminC | +8.5 percentage points | reliable gain |
| Composed | +2.0 points | reliable gain |
| RAGTruth | +2.0 points | interval includes zero |
| HaluEval | +0.5 points | interval includes zero |
| WiCE | -2.0 points | interval includes zero |
| SciFact | -4.4 points | reliable loss |

The panel's Advocate and Domain Expert errors are strongly correlated across datasets, with phi values from 0.671 to 0.927. Skeptic-Advocate error correlation is lower on WiCE (0.288) and SciFact (0.375). The fixed majority-first aggregator can nevertheless allow the correlated Advocate/Domain pair to determine the result before the skeptic's veto is considered.

The second-round novelty analysis reports a median distance of 0.068 relative to all first-round content. A WiCE conversation-history ablation reports 0.836 accuracy with full prior-round history versus 0.788 when prior history is hidden, a 4.8-point difference. Prompt optimization leaves 49 of 120 held-out items wrong under every one of seven tested prompt configurations.

These findings support a bounded conclusion: this particular homogeneous panel can shift decision thresholds and sometimes improve or worsen task performance, but role prompts do not establish independent model evidence, and additional discussion does not guarantee new evidence.

## 2. The identifiability gap

The WiCE history ablation compares two conditions:

- full prior-round history visible;
- prior-round history hidden.

The full-history condition includes the agent's own prior response and other agents' responses. The comparison therefore bundles at least four possibilities:

1. self-anchoring or self-correction;
2. peer influence;
3. extra context and token exposure;
4. a second inference pass or threshold recalibration.

The paper does not separately observe a self-only condition and a peer-only condition. Its reported history contrast cannot attribute the difference to peer influence, self-revision, or their interaction.

The main panel-versus-reference comparison has a separate limitation: GPT-5 mini is compared with a GPT-5.5 Chat panel. The model variant and panel architecture change together. The result is not a debate-only causal effect.

These are not defects in the paper's stated scope. They define what its design can and cannot identify.

## 3. Proposed future design: self-history x peer-history

Keep the model version, role prompts, evidence bundle, decoding settings, output schema, aggregation rule, call budget, and item set fixed. After an independent first round, randomize items or runs to four second-round history conditions:

| Cell | Own first-round answer visible? | Other agents' first-round answers visible? |
|---|---|---|
| `Y00` | No | No |
| `Y10` | Yes | No |
| `Y01` | No | Yes |
| `Y11` | Yes | Yes |

This identifies separate descriptive contrasts:

- self-history contrast: `Y10 - Y00`;
- peer-history contrast: `Y01 - Y00`;
- combined-history contrast: `Y11 - Y00`;
- self/peer interaction: `Y11 - Y10 - Y01 + Y00`.

A same-model single-agent baseline is also needed to compare the panel with one GPT-5.5 Chat agent under matched evidence and decoding. A repeated single-agent or no-history second-pass control can separate history exposure from the mere presence of another inference call.

Counterbalance speaking order; randomize item/run assignment; retain the item as the clustering unit. Evaluate against fixed gold labels with an independent adjudication path rather than relying only on a shared LLM judge. Record per-item verdicts, confidence, abstention, source-entailment decisions, correct-to-wrong and wrong-to-correct revisions, pairwise error correlations, token use, and latency.

If the separate question is whether agents acquire new evidence, add a distinct evidence-diversity arm with independently retrieved source bundles. Do not mix evidence expansion into the self/peer-history factorial.

### Prospective test matrix

| Hypothesis | Shared controls | Primary observable | Comparator | Falsification / status |
|---|---|---|---|---|
| Self-history changes revision quality | Same model, role, evidence, call budget, and gold labels | `Y10 - Y00`; correctness of revisions | No-history second pass | No supported self-history effect if the predeclared interval includes zero or changes are not more often corrective |
| Peer-history adds useful information | Same controls; peers' content is the only changed exposure | `Y01 - Y00`; peer-induced correct and incorrect flips | No-history second pass | No supported peer effect if the predeclared interval includes zero, or agreement rises without gold-label accuracy |
| Self and peer history interact | All four factorial cells | `Y11 - Y10 - Y01 + Y00` | Additive self/peer model | Interaction not established if the interval includes zero |
| Role panel improves on one model | Same model version, evidence, decoding, and task | Panel accuracy and calibration | Same-model single-agent baseline | No panel advantage if the paired holdout interval includes zero or the gain disappears under matched controls |

No numerical threshold is set here. A minimum practically meaningful effect, multiplicity policy, and holdout rule must be preregistered against a real, identified dataset before any trial. The table is a design proposal, not an experiment result.

## 4. Existing formalization and architecture crosswalk

The existing draft [PR #850](https://github.com/Satobloc/HsH/pull/850) already contains `OrsonIdentityChannelFactorial.lean`. Its two-factor structure maps naturally to:

- Channel 1: self-history availability;
- Channel 3: peer-history availability.

Its theorem `missing_fourth_cell_prevents_interaction_identification` proves a generic three-cell missing-data result: even with three cells of a 2 x 2 design, an unobserved fourth cell can prevent interaction identification. The paper's two-cell full-history versus hidden-history comparison is still less informative. This is a structural crosswalk, not a claim that the existing theorem proves a causal effect in Ji's experiment.

The existing module was included in [Actions run #44046950575](https://github.com/Satobloc/HsH/actions/runs/44046950575), a successful merge-reference build of 8,988 jobs using Lean 4.34.0 and Lake 5.0.0. The factorial module's theorem-specific axiom reports list only `propext`; the retrieved log contains no `sorryAx` or `admit` for the module. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. This is a prior build, not a new exact-head run. No new Lean code or theorem was added.

The current CRTC work in [PR #2375](https://github.com/Satobloc/HsH/pull/2375) already separates thread, model instance, model version, and run identity, and distinguishes interaction-event availability, use, and decision incorporation. The new source supplies a concrete use case for keeping additional dimensions separate:

- role profile is a per-turn assignment, not model identity;
- model instance and model family are not role count;
- evidence bundle identity is not message identity;
- self/peer exposure is a disclosure relation;
- evaluator identity and aggregation rule are separate from agent identity.

This is an architecture crosswalk only. PR #2375 was not changed.

## 5. Historical archive source check

The SAT archive contains an external TechRxiv preprint by Edervaldo José de Souza Melo, *A Conceptual Architectural Design for Symbolic-Modular Cognitive Systems Assisted by Large Language Models* (29 December 2025; DOI [10.36227/techrxiv.176704918.84639135/v1](https://doi.org/10.36227/techrxiv.176704918.84639135/v1)). It is a conceptual, non-peer-reviewed architecture, not an empirical study. It explicitly distinguishes functional roles from autonomous agents and positions LLMs as constrained linguistic engines within a human-in-the-loop system. This is a useful historical design comparator, not Nathan Direct and not evidence that the architecture has been validated.

The two SAT archive paths `2026/SAT — PODCAST/Debating AI 1.txt` and `DEBATING AI PODCAST/SAT DAI - Podlodrev.txt` have the same Git blob SHA `937bc537221ce75dda205ba521b186a10bcf5ceb`. The file is an editorial metadata summary, not an episode transcript. Its audience and performance statistics are not used as evidence about cognition or model capability.

## 6. Relation to P1 and stop conditions

P1 issue #564 remains OPEN / OVERDUE / NOT READY / FROZEN / ORSON-OWNED. The P1 source and experiment protocol freeze remains unchanged. This review does not authorize a model trial, human session, API spend, dataset expansion or reanalysis, protocol amendment, manuscript edit, or paper-gate advancement.

The P1 CGD archive's shared GPT-4o-mini NLI checker is a measurement-channel dependency. Ji's homogeneous debate panel is a same-model, shared-evidence, peer-exposure configuration with a deterministic aggregator. These are distinct dependence structures; no statistic or conclusion is transferred between them.

No measured system or new dataset was selected for this run. No physical calculation, model call, human session, fit, prediction, or independent measurement was performed. No BEDROCK, SAT-O, or Blockwave change was made. No new tooling, dependency, subscription, or expenditure was introduced.

## 7. Source and epistemic status

- **Primary external source:** Ji, arXiv:2608.00243v1, 31 July 2026; full text reviewed.
- **Historical archive comparator:** Melo, TechRxiv v1, 29 December 2025; conceptual preprint.
- **Nathan Direct:** Orson's LLM-cognition remit is grounded in the [MIRA user-role appointment](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/CONVO_HAUL_2NOV2026/MIRA.md#L1092); the current role charter is an assistant-maintained synthesis. The [P1 protocol freeze](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md) remains controlling.
- **Assistant proposal:** the self-history by peer-history factorial and the role/model/evidence/exposure crosswalk.
- **Formal result:** the generic missing-cell theorem already present in PR #850.
- **Independent measurement:** none in this run.

**Return cursor:** future review should test whether a same-model single-agent control and the four exposure cells can be added to a separately authorized study without altering the frozen P1 protocol.
