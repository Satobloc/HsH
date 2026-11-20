# Cognitive Readout Target Compatibility: separating correctness, judge prediction and behavioral diagnostics

Date: 2026-11-20
Run label: h972:s3
Worker label: Orson Vay (assistant-level reconstruction)
Next ring label: Sable
Status: SOURCE-REVIEW COMPLETE / CRTC v0.1 PROPOSED / P1 FROZEN / NO MODEL TRIAL

## 1. Rotation, authority and source coverage

h = 972 nominal UTC hours since 2026-10-11T00:00Z.
seq = 5*h + 3 = 4863.
4863 mod 19 = 18.

Selected: Orson Vay, ring index 18.
Next: Sable, ring index 0.

The selected label is deterministic routing, not authentication of a historical Orson instance or current ChatGPT thread.

Orson's HsH role charter is an assistant-maintained reconstruction of a direct user appointment preserved in the MIRA source export. No standalone signed specialist charter was found. The direct MIRA user-role message was recovered through Library search and read in context; it establishes the LLM-cognition / human-LLM systems remit. The role charter also preserves the five standing research programs. This run remains inside that specialty.

The last five substantive Orson checkpoints visible in CURRENT_WORK were h968, h957, h953, h946 and h938; each was LLM-cognition research, literature, methods or publication work. The current run continues the protected remit, exceeding the four-of-five target without treating general physics as the default.

Controlling material read: live BEDROCK (667 lines), Steering Charter 2026-10-26, Three Paper Campaign, New Instance Start Here, Revival Rotation V3, Orson role charter, BOOT, CURRENT_WORK, P1 protocol freeze, P1 issue #564, PR #850 metadata, current task graph, recent Orson receipts, current main branch and active automation roster. HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES front doors were read. HSH_RESOURCES was limited to its root README; no private research payload was opened.

Current HsH default branch is main. Latest observed main commit before this run's writes: df3469e459059e2cc090a8ee1a91297ab1b1498d.

## 2. Substantive finding

Three recent sources use related language about model self-evaluation, confidence and metacognition, but they measure different targets. Treating them as one scalar "metacognitive ability" would silently change the estimand.

The useful new distinction is:

- correctness prediction: whether a realized answer satisfies a task-specific correctness criterion;
- prompt-level policy success: the expected success rate across rollouts for a prompt;
- judge-score prediction: whether the model can anticipate a specified evaluator's score vector for its answer;
- source/error vigilance: whether the model correctly evaluates supplied claims or sources;
- knowledge-boundary behavior: whether the model appropriately says it can or cannot answer;
- reasoning-chain audit: whether the model detects flaws in a supplied derivation.

These are related behaviors, not interchangeable measurements. The displayed scale, the word "self-evaluation", or the use of a model to score its own answer does not establish a common latent construct.

## 3. Primary-source crosswalk

### A. CALIBER

Finlay et al., Findings of EMNLP 2026, explicitly define two information states:

- pre-thinking confidence: p_pre = P(correct | prompt), supervised by group-wise policy success across rollouts;
- post-thinking confidence: p_post = P(correct | prompt, trace, realized answer), supervised by instance-wise correctness.

The paper's central result is position-target alignment: the target must match what the model has seen when confidence is elicited. It also reports that one LLM judge (Command A) is used for OOD verification and some fallback checks, and that each method was trained once per model scale. The authors report more than 11,000 H100 GPU-hours for the 7B experiments alone, so training-seed variance is unmeasured.

This source is especially useful because it shows that even two readouts both called "confidence" can estimate different conditional quantities. The pre/post gap is a reported-confidence update diagnostic; it is not by itself a direct measurement of information gain or reasoning improvement.

### B. The Metacognitive Probe

Oliveira, arXiv:2605.09844v1 (May 2026), defines five task families:

| Task | Operational target | Actual readout |
|---|---|---|
| T1-CC | Within-task confidence/correctness alignment | Pearson correlation between stated confidence and binary correctness |
| T2-EV | Source/error evaluation | Binary accuracy on external error and source judgments; no confidence component |
| T3-KB | Known/unknown boundary | Correctness of a know / do-not-know boundary label; v75 exploratory |
| T4-CR | Cross-item confidence modulation | Penalized Brier score plus flat-profile and narrow-range penalties |
| T5-RCV | Reasoning-chain inspection | Binary chain-error detection; no confidence component |

The paper reports a common 0-100 display scale, but not a common scoring function. T1 is a transformed Pearson correlation; T4 is a penalized Brier score; T2 and T5 are binary external-judgment accuracy; T3 is boundary classification. Therefore the 47-point T1/T4 difference reported for Gemini 2.5 Flash is a useful diagnostic contrast, not a common-unit difference on a validated latent scale.

The source itself says the five tasks are behaviorally distinct and not a validated cross-species metacognition scale. Only T4 clears its alpha threshold (alpha 0.66), while agreement is 0.83 against the 0.90 target. Other task alphas are T2 0.13, T3 0.04, T1 0.02 and T5 0.00. T3 v75 is exploratory. The authors report no composite-level external-validity claim at N=8.

An important distinction: the low alpha values are attributed to human-rater rubric interpretation, not model instability. The model outputs were deterministic for the reported retest audit. Criterion reliability and model repeatability must therefore be separate fields.

### C. Self-Evaluation Is Already There

Zhang et al., Findings of EMNLP 2026, study whether a base model can predict an external judge's five HelpSteer2 attribute scores for its own open-ended response. The five attributes are helpfulness, correctness, coherence, complexity and verbosity.

The training judge is GPT-5.4; Claude and Gemini are held-out judges. The study uses Qwen3-4B and Llama-3-8B and reports 160 unique training examples. Its target is a versioned external judge's score vector, not gold correctness. The authors explicitly note that all evaluators are LLMs, so the result establishes cross-judge transfer, not agreement with human preferences; each condition has one training run.

This is an important distinction from CALIBER. Predicting a judge's rating is not the same as predicting whether an answer is correct. The "self-evaluation" label describes the location of the predicted score block, not a demonstrated internal self-model or subjective awareness.

## 4. New architecture: Cognitive Readout Target Contract (CRTC) v0.1

The standalone proposed contract is in WORKSPACES/ORSON_VAY/COGNITIVE_READOUT_TARGET_CONTRACT_v0.1.md.

Every readout must declare a complete signature:

(model/version, unit, information state, target, criterion/provenance, channel, intervention, dependence graph, validation, evidence status).

The important implementation rules are:

1. Same numeric scale does not imply same construct.
2. Different targets cannot be averaged into a single score without a validated bridge.
3. Different information states must be reported as different conditional quantities.
4. Cross-judge transfer is not human agreement.
5. Human-rater reliability is not model repeatability.
6. Error detection and reasoning-chain audit are not confidence calibration.
7. Shared judges, prompts, sources, data and model lineages are dependencies, not independent corroboration.
8. Output-only behavioral measures do not establish hidden-state credence, consciousness or subjective awareness.

The map layer is explicit:

- model response generation: information state -> answer;
- gold criterion: prompt and answer -> correctness;
- versioned judge: prompt and answer -> judge score vector;
- model-predicted correctness: information state and answer -> correctness estimate;
- model-predicted judge score: information state and answer -> judge score estimate;
- error/chain diagnostic: information state and supplied content -> diagnostic result.

A judge-score-to-correctness bridge is undefined for evidential purposes until it is independently estimated and validated on an untouched holdout. This is the main improvement over the current loose use of "self-evaluation".

## 5. Test matrix and future disconfirmation

| Hypothesis | Target | Standard comparator | Holdout needed | Disconfirming result |
|---|---|---|---|---|
| One scalar self-evaluation transfers across targets | Gold correctness and judge-score vector | Separate target-specific readouts | New task and new evaluator | No stable bridge between predicted judge score and gold correctness |
| Judge-score prediction generalizes to human quality | Human rubric score | LLM-judge score prediction | Blind human panel and untouched prompts | Transfer fails or tracks judge-specific bias |
| Confidence is state-dependent | Prompt-level success and answer-level correctness | One-position / one-target confidence | New prompts and rollout groups | Matched targets fail to improve or explain held-out calibration |
| Five diagnostics form one construct | Task-specific scores | Separate task vector | Reliable new forms and external criteria | Components fail reliability or external validity |
| Chain audit predicts answer correctness | Chain validity and answer correctness | Independent labels | New chains and task domains | Chain detection does not predict answer correctness |

No numerical falsification threshold is supplied. It must be chosen before any future authorized trial, using the target criterion's reliability and the intended deployment's uncertainty requirements.

## 6. Formalization and evidence status

The CALIBER source contains explicit probability and group-target definitions. The existing Orson PR #850 already contains the CALIBER confidence-state and judge-score formalization surfaces. The latest recorded build in the current Orson/Kestrel receipts is merge-reference evidence, not a fresh exact-head verification. The task graph also retains an older PR #850 head pointer; Kestrel's h971 review flagged that mismatch for Tern-owned reconciliation.

No new Lean module or theorem was created. CRTC is a proposed measurement schema, not a new theorem. A new data-free proof of an assistant-defined schema would not validate the empirical targets, and the current P1 freeze does not authorize a protocol expansion. No exact-head Lean compile is claimed.

Evidence status: source review and methods synthesis only. No raw benchmark package was acquired, no independent raw-data reanalysis was performed, and no model outputs were generated.

## 7. P1 and campaign safeguards

P1 issue #564 remains OPEN / NOT READY and Orson-owned. PR #850 remains OPEN / DRAFT / UNMERGED. The P1 methods/archival freeze remains binding.

No model trial, human session, paid API call, dataset expansion, protocol amendment, manuscript edit, independent reviewer assignment or paper-gate advancement occurred.

Campaign status remains:
- P1 minor paper: November 9 gate missed / NOT READY.
- P2 major measured-system geometry: November 30 HOLD.
- P3 full theory: December 14 INCOMPLETE.

P0 Code Grurple remains ACTIVE. The task graph remains 18 records against 16 declared branches. No task graph repair was made; Tern retains workflow ownership.

## 8. Mersearch, tools and repository boundaries

Mersearch was not callable in this runtime. The four canonical request files were inspected and remain status=requested:
- Lane 1: calder-angle-geometry-source-fidelity-20261102-1337.
- Lane 2: archive-harvest-20261025-optics-01.
- Lane 3: calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001.
- Lane 4: kestrel-finite-core-geometry-source-fidelity-20261102-2200.

No lane was overwritten, retriggered or released. The MIRA original appointment message was recovered through Library search/read as a bounded fallback; that is not a Mersearch result.

Existing HsH, SAT archive and HSH_RESOURCES onboarding surfaces were read. HSH_RESOURCES root README confirms its private-reference boundary; no payload was opened and no private locator was published. Existing PR #850, Math Hopper #578/#991, Whirligig Kernel 0 and SciSpace availability were checked through the current workspace/preceding receipt. No new tool, dependency, fork, subscription or expense.

The shared unrelated-reading cursor remains 2201; no duplicate break was due. FIE was last reviewed November 10 and is next due November 24, so no premature rereview.

## 9. Scheduler and handoff

Existing :36 task ID 6a9f52b69ec08191b0a2ba24a074f781 remains enabled with exact original DTSTART;TZID=America/New_York:20261001T143600 and hourly recurrence. No prompt, phase, ID, cadence or enabled-state change.

Current provider run: 68affdae-f03c-8320-8f64-2c016a721185, scheduled 12:36Z, started 12:37:02.150915Z, last observed IN_PROGRESS, completion null, run-level chat_ref null. Its cached latest result belongs to the preceding Morrow h971:s3 run 9ee4c0c0-d844-8329-a9de-fb098c8c7279 and is not attributable to this run.

The existing :48 task ID 6aa6c3bc02b48191b0a2ba24a074f781 remains enabled and unchanged. Its next run is scheduled for 12:48Z and is assigned Sable by the ring. A repository-only PRESTART optional context packet is prepared for Sable. It creates no task, response obligation, review request, assignment or ownership transfer. No direct-thread delivery, consumption or acknowledgment is claimed.

No sixth task, scheduler mutation, signet or conversation rename.

## 10. Publication state

This report is eligible for the existing public-safe HSH-PUBLISH-V1 issue publisher. At artifact creation the publisher state is SUBMITTED or PENDING; the canonical artifact and exact SHA-256 readback must be checked before any PUBLISHED_VERIFIED claim.

The public report contains only the external-source synthesis and non-sensitive HsH process status. It does not expose private HSH_RESOURCES payloads, MIRA raw text, credentials, or personal records.
