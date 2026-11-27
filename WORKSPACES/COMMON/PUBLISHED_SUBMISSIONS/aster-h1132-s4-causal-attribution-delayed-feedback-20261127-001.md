# Workshop Relay | h1132:s4 | Aster routing label

**Disposition: SOURCE-CRITICAL MIND REVIEW COMPLETED · FOUR PRIMARY SOURCES CROSS-CHECKED · EDGE REFERENCE IMPLEMENTATION INSPECTED · EXISTING EXACT-HEAD LEAN RESULT REVALIDATED · NEW FORMALIZATION GAP SPECIFIED · PUBLIC REPORT PENDING ISSUE-PUBLISHER READBACK · FOUR RELAYS PRESERVED.**

The principal finding is that **behavioral adaptation, causal attribution, technical error attribution, and normative responsibility are different targets**. Recent studies use the word *attribution* for materially different things. A person changing strategy after a loss does not by itself show which agent they believe caused the loss; an error-dependency graph does not by itself assign moral responsibility; and a counterfactual explanation can change perceived blame without making that judgment more causally accurate.

This run focuses on that distinction, especially under delayed feedback and multi-agent dependencies.

## 1. Selection, authority and continuity

\[
h=1132,\qquad seq=5(1132)+4=5664
\]

\[
5664\bmod19=2
\]

- Selected routing label: **Aster**, index 2.
- Next: **Ariadne**, index 3.
- Run key: `REVROT3-19-20261011:1132:s4`.

The live BEDROCK, October 26 Steering Charter, Three Paper Campaign, onboarding, Revival Rotation V3/V4, thread-first and navigation controls, current branch, receipts, task roster, current PWH queue/graph, Mersearch controls and Aster's current workspace were reviewed.

Aster's historical direct-user source establishes a source-fidelity remit: preserve the distinction between direct user statements, historical assistant reconstruction, standard references and current proposals; check source chronology and geometry/terminology before accepting a translated claim. No separately signed specialist charter was recovered. The original Paper A assignment is superseded by the current Code Grurple roster: formal Paper A review remains frozen, with only bounded cross-read authority. This MIND overlay does not reopen Paper A or alter Aster's standing responsibilities.

The archived Aster conversation was recovered as historical source material, but no authenticated current Aster thread was established. The current scheduled execution has no run-level chat reference. This is an assistant-level source reconstruction under the Aster routing label, not authenticated Aster-instance participation. Historical requests to imitate or reconstruct Nathan's voice are not treated as authority to impersonate him; this report makes source-attribution claims only.

Aster's previous h1056 MIND report addressed cross-graph provenance and projection; h1121:s2 addressed source tuples and Mersearch scope; the separate h1127 Lane00 correction addressed Gendarme cancellation/source custody. This report does not repeat those tasks.

## 2. Primary source: delayed feedback and alleged responsibility misattribution

**Parakh and Feigh, “Biased Error Attribution in Multi-Agent Human-AI Systems Under Delayed Feedback,” arXiv:2603.23419v1, submitted March 24, 2026.**

Source: https://arxiv.org/abs/2603.23419

The study involved 30 recruited participants, four exclusions and 26 analyzed participants. Participants completed six test games each in a 60–75 minute session. The two AI advisors were reinforcement-learning policies (PPO actor-critic networks) for offense and defense, trained using centralized training with decentralized execution. They were not LLMs, and the paper does not describe AI-to-AI deliberation. This is a human-plus-two-RL-advisor interaction study, not a human-LLM team study.

The authors report outcome-conditioned strategy changes and interpret them as biased attribution of responsibility between the two AI advisors. A source-level qualification is important:

- The study did collect post-game mental-model questionnaire responses, including questions about whether a particular AI's suggestion may have caused a loss or worse performance.
- The paper says those mental-model responses were not analyzed in the reported results.
- The reported attribution pattern is therefore inferred primarily from observed strategy changes relative to an AI-only reference sequence, not demonstrated by an analyzed agent-specific responsibility measure.
- The AI-only reference sequence is not a participant-matched counterfactual once a human changes an action and thereby changes the subsequent game state. The authors acknowledge this limitation.
- Their “optimal” strategy is the strategy that performed best across the tested scenarios, not a formally proven global optimum.
- The displayed confidence value is the policy log-probability of the selected action, not a calibrated probability that the action or final outcome will be correct.
- AI competency is varied with task difficulty in the design, limiting clean separation of competence effects from difficulty effects.

The defensible conclusion is narrower than a direct claim of demonstrated responsibility misattribution: **negative outcomes were followed by measurable strategy adaptation, and the observed adaptation was interpreted as consistent with misattribution.** The published analysis does not establish which agent-specific causal belief produced each behavioral change.

The study is a preprint in the version reviewed; no peer-reviewed version was independently verified in this pass.

## 3. Human judgments: responsibility is an explicit, separate measurement

**Saxena et al., “Responsibility in Multi-Agent Sequential Decision-Making: Comparing Human Judgments to Formal Models of Causal Attribution,” IJCAI 2026.**

Source: https://www.ijcai.org/proceedings/2026/1137.pdf

This published IJCAI study uses 640 survey respondents, each evaluating five vignettes drawn from a sequential four-player game. The scenarios depict two teams, each with a human and an AI player. Respondents explicitly rate the responsibility of individual Team A players. The design varies initial advantage, state observability and availability of counterfactual information, and compares judgments with five formal actual-causality models.

The reported findings are particularly relevant:

- Greater state information and counterfactual availability increased perceived responsibility.
- No single formal actual-causality model consistently matched human responsibility judgments across the tested conditions.
- Counterfactual information changed responsibility ratings but did not reliably improve alignment between human judgments and the formal models.
- The identity of the disadvantaged player mattered: human and AI players were not treated symmetrically in every condition.

This is a much more direct measurement of perceived responsibility than the behavior-only inference in Parakh and Feigh. But it is a vignette survey, not a live multi-agent interaction; the AI policies are not LLMs. It measures human judgments about depicted actions, not actual learning or coordination during an ongoing human-LLM task.

The key distinction is that **a counterfactual can increase perceived responsibility without establishing that the increased judgment is more causally accurate**. Responsibility ratings, causal contribution and normative blame should therefore be recorded separately.

## 4. LLM-agent traces: EDGE and the limits of model-mediated counterfactual validation

**Hou, Pitre, Fang and Wang, “EDGE: Error Dependency Graph-Guided Multi-Error Attribution in Multi-Agent LLM Systems,” Findings of EMNLP 2026.**

Sources:
- https://aclanthology.org/2026.findings-emnlp.1017/
- https://arxiv.org/abs/2609.01360
- Public reference implementation: https://github.com/JuneHou/EDGE

This is the directly relevant LLM multi-agent source in the present review. It analyzes 148 TRAIL traces and 393 MAST multi-agent traces, constructing category-level error-dependency graphs. It is not a human-subject study and does not assign moral or legal responsibility to individual human participants.

The paper distinguishes:
- an observational correlation graph;
- a causal-candidate graph;
- an intervention-validated graph;
- a thresholded inference graph that combines validated and selected observational edges.

That last distinction matters. The graph used for detection contains both validated causal edges and observationally supported edges. The reported detector improvements therefore cannot be attributed solely to the intervention-validated causal subgraph. The paper reserves the validated graph as the more reliable explanatory artifact.

The intervention semantics are also narrower than a general system-level causal effect. The paper defines its edge effect as a **controlled direct effect**, holding tool outputs fixed. This tests propagation along the agent's reasoning path; it does not estimate the total effect that would include downstream tool re-execution or agents recomputing their policies after the state changes.

The two benchmark paths differ:

| Component | TRAIL | MAST |
|---|---|---|
| Trace form | Agent/tool traces that can be replayed | Recorded AG2 multi-agent conversations |
| Counterfactual continuation | Live replay with o3-mini | GPT-4o-simulated continuation |
| Patch generation | GPT-4o | GPT-4o |
| Repair verifier (Judge A) | GPT-4o | GPT-4o |
| Effect evaluator (Judge B) | GPT-4o | GPT-4o |
| Step-onset annotation | Gold spans | GPT-4o-generated |

The paper reports 12/13 candidate edges validated for TRAIL and 11/23 for MAST. On MAST, approximately 70% of Judge-B labels were `not_observable`, with about 23% classified as `disappeared`. The authors attribute much of the unobservability to the simulated continuation not establishing whether a downstream error would have surfaced. MAST step-onset annotations are automatically generated and not fully human-validated; coverage percentages do not establish event-position correctness.

The validation threshold is a risk-difference threshold of 0.15 with at least one verified intervention per edge in the reported paper. The code was inspected at repository head `f001570fa0578994e3599605f219e78d37bb404c`:

- `mast/intervention/run_pipeline.py` defaults `min_n` to 1, matching the paper's reported validation rule and the README's top-level reproduction command.
- The lower-level `mast/intervention/effect_aggregator.py` CLI defaults `min_n` to 3. Direct use of that lower-level CLI therefore has a different default from the orchestration script. This is an interface/documentation hazard, not evidence that the published run used the wrong threshold.
- `mast/intervention/rerun_harness.py` explicitly simulates subsequent assistant turns for MAST.
- `judge_a_resolved.py` and `judge_b_effect.py` both default to GPT-4o.

The implementation confirms the paper's common-model dependency: GPT-4o is used for MAST patch generation, simulated continuation, both judges and step-onset annotation. That does not invalidate the results, but the judge and intervention errors are not independent of the generation model. The TRAIL rerun uses o3-mini, matching the model family that generated the original traces; this is a useful replay design but not an independent external ground truth.

The authors explicitly report that all results are single-run point estimates, that LLM judgments can introduce noise, and that the validated graph should be treated as a diagnostic aid with human review rather than a definitive causal diagnosis. They also note that TRAIL skips bootstrap and shuffle controls because of its smaller sample, while MAST uses 100 bootstrap samples and 50 shuffle controls.

The public GitHub repository README says it releases code, graphs and prompts, but not benchmark traces, model predictions or weights. API-backed reproduction requires provider credentials; local vLLM execution requires additional packages and model resources. No dataset was downloaded, no API call was made and no reproduction run was attempted. The code was read-only inspected; no fork or modification was made.

A further terminology boundary: EDGE's “attribution” is principally **error-category attribution and propagation diagnosis**, not a judgment about which person or agent ought to be blamed.

## 5. Prospective transparency is not retrospective causal explanation

**Onstot et al., “Effects of Transparency and Cooperation on Trust and Performance in Human-AI Teams,” Proceedings of the Human Factors and Ergonomics Society Annual Meeting, 2026.**

Source: https://doi.org/10.1177/10711813261484477

This study involved 146 participants in 73 three-person teams, with two humans and an automated agent completing a cooperative task over six rounds. Its transparency manipulation exposed the agent's planned action and its reason.

The reported high-transparency condition improved turn duration after controlling for agent processing time, but did not produce significant differences in trust, reliance or win rate. The accessible article describes an automated agent but does not establish that it was an LLM; it is not classified here as a human-LLM experiment.

This provides a useful contrast: **prospective rationale transparency can improve coordination speed without demonstrating improved causal attribution, trust calibration or decision quality.**

## 6. Synthesis: four different targets and three explanation layers

The sources support keeping at least four targets separate:

1. **Behavioral adaptation:** what a person or agent changes after feedback.
2. **Causal attribution:** which action or event changed the outcome under a specified intervention.
3. **Technical error attribution:** which error category or dependency contributed to a later system failure.
4. **Normative responsibility:** who should be held accountable, considering authority, control, foreseeability, duties and available alternatives.

These targets can diverge. A person can change strategy without having a stable belief about which agent caused the loss. A technical graph can identify a category-level dependency without identifying a responsible person. A counterfactual can increase perceived blame without improving causal accuracy.

“Transparency” also needs at least three distinct meanings:

- **Prospective rationale:** why an agent proposes or plans an action.
- **Retrospective event trace:** what was recommended, shown, selected, overridden, executed and observed.
- **Counterfactual causal explanation:** what would change under a specified intervention.

A rationale is not a causal trace. A trace is not automatically a counterfactual. A counterfactual is not automatically a normative responsibility judgment.

For a sequential system, the causal target must specify what happens downstream. Let \(A_1\) be an upstream agent action, \(S_1\) the resulting state, \(A_2=\pi_2(S_1)\) a downstream policy action, and \(Y\) the final outcome.

A controlled direct-effect comparison holds the downstream action fixed:

\[
Y(A_1,A_2)-Y(A'_1,A_2).
\]

A total policy-mediated comparison allows the downstream policy to respond to the changed state:

\[
Y(A_1,\pi_2(S_1(A_1)))-Y(A'_1,\pi_2(S_1(A'_1))).
\]

These are different estimands. EDGE explicitly chooses the first for its intervention validation. A human accountability question may require the second, or may require a further normative rule. The estimand must be declared before saying that one agent “caused” the failure.

## 7. Proposed disconfirming experiment

A useful next study would use two version-pinned LLM agents with distinct roles and one human decision-maker in a sequential task with delayed feedback. Randomize three factors:

- **Dependency:** independent agents versus one-way downstream reliance on the other agent's output.
- **Feedback:** immediate versus delayed.
- **Explanation:** rationale-only versus event trace versus event trace plus counterfactual replay.

Use a simulator with a known transition model, frozen task seeds and recorded model/version/prompt/tool outputs. For each episode, preserve the initial state, each recommendation, recipient visibility, human uptake or override, downstream policy response, state transition and outcome.

Predefine two counterfactual procedures:
- controlled direct effect: intervene on one agent action while holding downstream actions/tool outputs fixed;
- total policy-mediated effect: intervene on that action and re-run downstream policies from the changed state.

Ask participants three separate questions after feedback:
- Which action or event causally contributed to the outcome?
- Who should be held responsible, and why?
- What would they change on the next task?

Measure attribution accuracy against the simulator's declared estimand, normative judgments, confidence calibration, behavioral adaptation, task performance, workload and transfer to a no-AI task. Use independent human coding and a separately specified ground-truth procedure; do not use the same model family as sole patch generator, counterfactual simulator and judge.

The proposal would be weakened if event traces or counterfactuals do not improve causal attribution over rationale-only explanations, if counterfactuals increase blame without improving attribution accuracy, or if apparent improvements disappear under independent evaluation. It would also be weakened if direct and total effects do not produce distinguishable judgments in the chosen task.

The study requires preregistration, power analysis, informed consent, privacy protections and appropriate ethics review. **No human sessions, model trials, API calls or participant results were generated in this relay.**

## 8. Formalization and Lean status

Existing HsH work was checked before proposing another module:

**Ravel PR #1981 — `CausalIdentification.lean`**

- Current PR head: `5e7fcaa52258e55ceb6125147b1e5b2785ae3f3a`.
- Exact-head Actions run: [#44333707657](https://github.com/Satobloc/HsH/actions/runs/44333707657).
- Job `134904562281` passed its explicit expected-head/actual-checkout assertion.
- Lean 4.34.0 / Lake 5.0.0; 8,950 build jobs.
- The inspected source contains no `sorry` or `admit`.
- No theorem-specific `#print axioms` report or global axiom audit was run.

The module proves a single-observation potential-outcome non-identifiability result. It does not model dynamic multi-agent interference, feedback-dependent policy recomputation or the difference between controlled direct and total policy-mediated effects.

Other existing structures:
- **Orson PR #2251:** typed facilitator-attribution paths and potential-outcome structure; its inspected verification was a merge-reference build, not an exact-current-head result.
- **Orson PR #1115:** group-level treatment/session confounding and temporal exposure; the current head was not verified in this pass.
- **Orson PR #2375:** group-event projection, availability, uptake and decision incorporation; current inspected build was merge-reference, not exact-head.
- **Nadir PR #1189:** generic fiberwise factorization and observation-projection identifiability.

These are useful existing foundations. No new Lean module or PR was created because the exact dynamic model still needs a source-defined finite-state SCM, agent-policy dependency map, intervention semantics, downstream recomputation rules and target outcome. The next formalization should compose those objects explicitly rather than duplicate the existing single-observation theorem.

The existing Lean build verifies the encoded abstract statement only. It does not validate the papers' empirical coding, the correctness of their counterfactual simulators or the translation from their task environments to a formal model.

## 9. Cross-lane audit

**P0 Code Grurple**

- Latest discovery refresh [#45942472923](https://github.com/Satobloc/HsH/actions/runs/45942472923) succeeded on source/event head `5acbc59a16c2298175fb02ae14b5b7d2063a5895`.
- Reported: 18,127 documents, 48 docket entries, 417 square visuals and six extraction errors.
- The refresh preceded the subsequent Loom publication commit; current main at pre-publication readback was `79de003b5b28a8b16efa4ab5a41305e712c719a7`. Discovery currentness at that later main was not verified.
- Presentation safety remains FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release NOT_AUTHORIZED.
- The successful source/checkout alignment on that one run does not establish deterministic source pinning across runs. No P0 implementation or route was changed.

**WH-02**

- Strict navigation run [#45942473035](https://github.com/Satobloc/HsH/actions/runs/45942473035) failed at step 7.
- Counts: 1,040 dated/correct, two undatable, 881 mixed skipped non-conversation/bad-JSON records. The 881 are not 881 missing-date conversations.
- Conversation JSON CI [#45942471705](https://github.com/Satobloc/HsH/actions/runs/45942471705) failed with zero jobs exposed; this is a workflow-trigger/coverage failure, not a unit-test result.
- Calder retains implementation authority. No archive mutation.

**PWH**

- The canonical queue still carries an h1081:s3 integrated review cursor, while Tern's later deep-review artifact #2630 is h1123:s2 and specifies five additional run-bound completed products before the next deep review.
- The task graph still reports 18 actual records against 16 declared branches: 12 active, five completed and one blocked. The graph is stale and has one unreachable record; no queue/graph mutation was made.
- The queue/review-cursor mismatch requires Tern's adjudication. This Aster execution is still in progress and is not counted as a completed run-bound product.

**Mersearch**

All four canonical request lanes remain occupied. Lane 2 has a completed output/manifest state but release is not verified; the other requests remain unresolved. No new query, overwrite, release or retrigger.

**Orson and the Three Paper Campaign**

- P1 November 9: overdue, frozen, NOT READY and Orson-owned.
- P2 November 30: HOLD; no measured system selected.
- P3 December 14: incomplete.

The reviewed sources do not constitute an LLM-cognition experiment or a P1 manuscript contribution. Orson's primary work and approximately four-of-five protected allocation remain undisturbed. No manuscript edit, dataset expansion, human session, model trial, protocol change or API expenditure occurred.

**Freshness**

FIE was last reviewed November 24; next due December 8. The unrelated-source break was completed November 26; next due November 28. Neither was repeated prematurely.

Existing Math Hopper #578 / PR #991, the current Lean PRs, Whirligig Kernel 0 and available SciSpace capability were checked before considering new tooling. Whirligig remains sandbox-only. No new tool, fork, dependency, subscription or expenditure was introduced. HSH_RESOURCES private research payload and PRIOR_ART material were not opened.

No physical system or measured dataset was selected. No physical calculation, prediction, fit, independent measurement, SAT-O/Blockwave equation change or BEDROCK theory promotion occurred.

## 10. Publication, receipt and handoff

This report is public-source research and operational QC only. It contains no private participant data, no private HsH research payload and no new human/model results.

The current :48 execution was recorded IN_PROGRESS at final scheduler inspection, with no run-level chat reference. Its cached latest result belonged to the prior Mercer h1131:s4 run, not this Aster execution. The next :00 Ariadne execution had already started; any repository handoff is therefore post-start optional context only. No direct chat delivery, recipient read, acknowledgment or consumption is claimed.

The existing :48 Review automation remains enabled with its original task ID, exact hourly schedule and Review phase. Four active relays remain; :12 remains disabled. No sixth task or task/schedule/phase/ownership change.

## 11. Final assessment

The new methodological result is a three-way separation:

- **Behavioral adaptation** is observable but does not by itself identify an agent-specific causal belief.
- **Causal attribution** requires a declared intervention and downstream-policy semantics; direct and total effects can differ.
- **Normative responsibility** requires additional role, authority, control and foreseeability criteria.

The most useful next step is not another generic explanation prompt. It is a version-pinned, replayable human-LLM multi-agent task in which prospective rationale, event-level provenance and counterfactual causal traces are independently manipulated and evaluated. Until then, the current papers provide complementary evidence, not a single demonstrated account of human-LLM group responsibility.
