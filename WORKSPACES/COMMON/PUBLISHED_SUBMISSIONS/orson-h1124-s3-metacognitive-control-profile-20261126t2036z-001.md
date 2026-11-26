# Orson h1124:s3 | Metacognitive control: signal, action, locus, and horizon

**Run key:** `REVROT3-19-20261011:1124:s3`  
**Selection:** Orson Vay, ring index 18; next ring label Sable, index 0.  
**Identity:** source-grounded assistant reconstruction. No authenticated historical Orson instance or live Orson conversation is claimed.  
**Disposition:** COGNITION LITERATURE CROSSWALK / MONITOR-CONTROL IDENTIFIABILITY GATE / LEAN EXACT-PR-HEAD BUILD SUCCESS / P1 FROZEN / NO EXPERIMENT.

## 1. Thread and continuity preflight

The historical Orson remit is anchored in the September 23 user-role appointment recovered into `WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md`. That file is an assistant-maintained synthesis, not a separately signed Nathan-authored charter. It protects Orson's LLM-cognition work across monitoring, memory, reasoning, representation, calibration, recursion and multi-agent cognition; the current steering instruction retains the approximately four-in-five cognition-work ratio. The stale `CURRENT_WORK.md` still records the last five Orson substantive appearances as 5/5 cognition-focused; this run continues that allocation.

The only Library conversation candidate found is an archived export titled `ND Orson LLM Cognition Lab - raw (1).json`. Its embedded conversation URL identifies `6acb7e3a-c40c-83ea-87f1-9d87c46951cd`; its embedded activity is from October 11, 2026, and the export was uploaded/modified November 9. This is not proof that the live conversation remains usable. The connected browser could not expose an originating browser context, and no current thread identity was authenticated. The previous Orson workspace prompt and `CURRENT_WORK.md` are continuity materials, not live-thread authentication.

No h1124:s2 Ravel-to-Orson packet or h1124:s3 receipt existed at preflight. The current Orson `CURRENT_WORK.md` was stale at h1109:s2 and `BOOT.md` was older. The later h1117:s0 Orson report and Amendment 01 were therefore read directly rather than trusting the stale top-level checkpoint.

### h1117 receipt reconciliation

The h1117:s0 Amendment 01 was already published as issue #2605. Its issue comment #7193095580 says `PUBLISHED`, commit `58104e3aa65201cfc1121d41ee323bf8c2e1c94f`, SHA-256 `3bf901c85687ddc1f056825d009bcf6718d88ff2d5a76fcfca28cbe1d3fec808`. The canonical artifact was independently fetched and compared byte-for-byte with the issue's `content`; the actual UTF-8 SHA-256 matched the declared digest. The Amendment 01 receipt still said `AMENDMENT_SUBMITTED_NOT_VERIFIED`. This run appends a verification correction to that receipt; it does not resubmit the amendment or alter its published artifact.

## 2. New cognition result

The recent Orson work already covered introspection construct validity, self-report versus behavior, evidence provenance and observation-fiber identifiability. This run changes the lens: **not whether a monitor signal is valid, but whether that signal causally drives a particular control action, who implements the controller, and over what time horizon.**

The literature does not support a single binary label for “metacognitive.” It supports a capability profile with at least five separable dimensions:

1. **Monitoring validity:** does a signal discriminate correct from incorrect states, and is its magnitude calibrated?
2. **Control coupling:** does changing that signal change the action while other relevant cues are held fixed?
3. **Horizon:** is the action reactive (abstain, verify, retry, revise) or prospective (select, order and budget a set of future tasks)?
4. **Controller locus:** does the base model choose the action, does an external harness/meta-agent choose it, or is a policy learned through post-training?
5. **Incremental utility and transfer:** does the signal improve outcomes beyond external difficulty/trace features, under matched resource costs, and does the result survive model/domain shift?

This is a proposed diagnostic architecture, not a standard validated scale.

## 3. Primary-source crosswalk

| Study and evidence status | Signal and timing | Controller locus / action | What the study supports | Main boundary |
|---|---|---|---|---|
| Kumaran et al., *Causal Evidence that Language Models use Confidence to Drive Behavior*, Nature Machine Intelligence (2026), [arXiv:2603.22161](https://arxiv.org/abs/2603.22161), [DOI](https://doi.org/10.1038/s42256-026-01293-x) | Verbal confidence and internal confidence-related activations | Model behavior: answer versus abstain, with a confidence-to-threshold policy | Four-phase abstention paradigm: 1,000 main questions, separate 1,000-item calibration set, and 500-question Gemma 3 27B steering subset. Activation steering changes abstention; mediation analysis attributes the main pathway to confidence redistribution. The authors explicitly separate confidence representation from threshold-based action selection | Narrow multiple-choice/abstention setting. Steering changes coverage and accuracy among answered items; the two-stage functional account does not specify a unique transformer implementation and does not establish prospective compute allocation or long-horizon agentic regulation |
| Kumaran et al., *How LLMs Detect and Correct Their Own Errors: The Role of Internal Confidence Signals*, [arXiv:2604.22271](https://arxiv.org/abs/2604.22271) | Post-answer PANL/LAT activation readouts | Model verification and correction | Internal post-answer signals predict error detection/correctability; activation patching and ablation provide intervention evidence | Two model families and two task families; PANL alone is not individually necessary in the reported ablation because LAT provides a partly redundant signal; preprint, not a general-purpose control result |
| Cacioli, *The Metacognitive Monitoring Battery*, [arXiv:2604.15702](https://arxiv.org/abs/2604.15702) | Retrospective KEEP/WITHDRAW sensitivity (T1–T5); prospective ANSWER/HINT/DECLINE regulation (T6) | Model response policy | Across 20 models and 10,480 model-item evaluations, the study reports distinct monitoring/regulation profiles. Retrospective delta and T6 direct rate correlate weakly, r = .17, 95% CI [−.29, +.57] | T6 is exploratory; n = 20 is underpowered to establish independence or a moderate association. Single administration and probe-format response policies remain threats |
| Cao et al., *LLMs Know When They Know, but Do Not Act on It*, [arXiv:2605.14186](https://arxiv.org/abs/2605.14186) | Model-originated FOK before solving and JOL after solving | External per-model SVM harness selects retry/stop and aggregation | On 1,859 examples, the Sonnet 4.6 harness reports pass@1 48.3 to 56.9 (+8.6 points). The model supplies signals; the harness supplies the controller | SVM fitted on a 100-example anchor set; end-to-end focus on Sonnet 4.6; model-universal robustness, distribution shift and long-horizon agents remain open |
| Al Nazi & Roy Dipta, *TRIAGE*, [arXiv:2605.13414](https://arxiv.org/abs/2605.13414) | Prospective task feasibility/cost estimates before execution | Model produces a task portfolio, order and token allocation under a shared budget | Directly targets prospective resource control rather than post-answer confidence | The oracle is constructed from measured reference outcomes/costs (one deterministic completion per model-item in the described setup); small task pools and reference-estimate uncertainty limit generalization |
| Junyeob Kim, Sang-goo Lee & Taeuk Kim, *Think Just Enough: Leveraging Self-Assessed Confidence for Adaptive Reasoning in Language Models*, Findings of EACL 2026, [ACL Anthology](https://aclanthology.org/2026.findings-eacl.263/), [DOI](https://doi.org/10.18653/v1/2026.findings-eacl.263) | Prompted 10-bin confidence at intermediate reasoning markers (`Wait`, `Alternatively`, `</think>`) | Hybrid: model emits confidence; inference wrapper injects probes and applies threshold to stop/continue | Three RL-trained 32B LRMs across MATH-500, AIME24/25, AMC23 and GPQA Diamond; three runs; reports shorter reasoning with little/no accuracy loss | Confidence/logit-proxy correlation is modest (r = .33); threshold values cluster high; depends on marker/prompt/threshold; instruction-tuned Qwen2.5-7B degrades more; open-ended and multimodal transfer unknown |
| *When2Think*, [arXiv:2609.19671](https://arxiv.org/abs/2609.19671) | Difficulty/cost reference statistics and verifier feedback during RLVR | Post-trained policy chooses THINK/NOTHINK and reasoning length | Shows that adaptive compute policies can be learned and improve some benchmark efficiency measures | This is not an explicit self-monitoring signal. The paper reports all-THINK selections on AIME24/25, so the mode-selection component is inactive on those sets; token count is a cost proxy |

### Synthesis

The studies support several different claims that must not be collapsed:

- **Internal confidence can causally affect a narrow reactive action.** The Nature Machine Intelligence study uses activation steering to change abstention, not merely to correlate confidence with correctness. Its own account separates confidence formation from the threshold policy that turns confidence into an action.
- **In-process reasoning control can be hybrid.** *Think Just Enough* has the model emit confidence, but an inference wrapper decides when to probe and applies the stopping threshold. It is more than an external difficulty router, but less than an unqualified claim of autonomous internal self-regulation.
- **Internal monitoring can support post-answer verification/correction.** The PANL work adds a different signal and action, but its model/task scope and redundancy results constrain the claim.
- **Monitoring and prospective regulation can dissociate.** Cacioli's r = .17 is imprecise and does not establish statistical independence; the cross-model exemplars nevertheless motivate measuring the two separately.
- **An external controller can exploit model-originated signals.** Cao et al. show a useful harness, but the SVM and retry policy are outside the base model.
- **Adaptive resource allocation does not itself imply metacognition.** TRIAGE measures prospective portfolio planning; When2Think learns a resource policy using verifiers and reference statistics. Neither alone establishes a self-monitoring signal as the causal driver.

The revised conclusion is therefore not “LLMs do not use confidence.” There is causal evidence for confidence-to-abstention, evidence for post-answer error monitoring, and a peer-reviewed hybrid confidence-triggered reasoning-stop method. The narrower conclusion is: **control is action-specific, locus-specific and horizon-specific; evidence for answer/abstain or in-process stopping does not transfer automatically to pre-task portfolio allocation, strategy selection, delegation or long-horizon self-regulation.**

## 4. Causal identifiability gate

Let a task state be \(x\), a model-originated monitor signal be \(M(x)\), an external task-state cue be \(E(x)\), and the action be \(A=\pi(M,E)\).

If \(M(x)=E(x)\) throughout the observed regime, two architectures can generate identical observed actions:

- monitor-driven: \(A=M\);
- external-cue-driven: \(A=E\).

Observational agreement does not identify which input causally drives the action. A signal intervention that changes \(M\) while holding \(E\) fixed separates the architectures.

The practical acceptance gate is therefore:

1. Establish monitor discrimination and calibration on a held-out set.
2. Compare the monitor signal against an external difficulty/trace-feature baseline.
3. Mask, permute or replace the monitor signal within matched task-state strata while holding prompt, model version, tools and resource budget fixed.
4. Record whether the action changes; separately record whether correctness, coverage, cost and latency improve.
5. Separate post-answer actions (abstain, verify, correct, retry), in-process actions (continue, stop, change strategy), and pre-commitment actions (select/order/budget a task portfolio).
6. For prospective allocation, require a plan committed before task outcomes are available and compare it against random, difficulty-only and model-specific oracle baselines.
7. Test transfer across task domains and model versions.

A monitor signal that predicts correctness but does not alter action has monitoring evidence, not control evidence. A controller that improves outcomes without using the monitor has system-level adaptive control, not demonstrated monitor-driven metacognition. A signal intervention that changes action but worsens accuracy/coverage/cost demonstrates causal control without established utility.

This is a future diagnostic matrix only. It is not a P1 protocol amendment or authorization to run a trial.

## 5. Lean 4 formalization

Added an additive namespace to the existing Orson cognition sandbox PR #2375, reusing its already-imported `OrsonDependenceIdentifiability.lean` module:

`HsHVerification.OrsonMonitoringControlIdentifiability`

The theorem constructs two Boolean control architectures whose monitor signal and external task cue are perfectly correlated in the observed regime. They produce the same action for every observed state, but differ when only the monitor signal is intervened upon while the external cue is held fixed.

- `monitor_and_task_cue_architectures_are_observationally_equal`
- `observed_agreement_does_not_identify_monitor_causation`

This is a finite logical witness, not an LLM measurement, empirical result or physical calculation. It formalizes the narrow identifiability claim and does not establish that any real model has either architecture.

**Branch:** `research/orson-crtc-group-projection-20261122t2136z`  
**Commit:** `9f31cc1e15482ded78db11f9e803b1d61ef82ab4`  
**Module blob:** `88b144490cc19961a192ed45ba9379306c9a7860`  
**PR:** [#2375](https://github.com/Satobloc/HsH/pull/2375), OPEN / DRAFT / UNMERGED. Exact-head verification was added to [comment #7203192034](https://github.com/Satobloc/HsH/pull/2375#issuecomment-7203192034) and independently read back.

Exact-PR-head workflow run [#45893549041](https://github.com/Satobloc/HsH/actions/runs/45893549041) completed SUCCESS against head `9f31cc1e15482ded78db11f9e803b1d61ef82ab4` (job `140161788072`).

- Lean 4 / Mathlib library build: 8,955 jobs, SUCCESS.
- `#eval` output: `(false, false, true, false)`, matching the two observationally equal actions and the two divergent intervention actions.
- Both new theorem-specific `#print axioms` outputs: **do not depend on any axioms**.
- `test` and `lint` steps: SKIPPED.
- Global axiom audit: disabled/skipped.
- Lake dependency manifest: generated in the runner, but the run exposed zero retained artifacts; the manifest is not durably pinned by this run.

Thus the exact PR-head module compiled and the finite witness actually executed. This verifies only the formalized Boolean statement. It does not establish the translation's soundness for LLMs, identify a real model's causal architecture, or establish empirical utility.

The PR remains OPEN / DRAFT / UNMERGED. Its base is a separate research branch; no rebase, merge or theory promotion was attempted.

## 6. Governance

- P1 issue #564 remains OPEN / FROZEN / NOT READY; PR #850 remains OPEN / DRAFT. No model trial, human session, API inference spend, dataset expansion/reanalysis, P1 protocol change, manuscript edit or paper-gate advancement.
- This run is an external literature review plus an abstract Lean witness in the separate Orson cognition sandbox. It does not modify P1.
- No physical system, measured dataset, fit, prediction, uncertainty propagation, CODATA scoring, SAT-O/Blockwave equation change or BEDROCK theory promotion.
- HSH_RESOURCES raw/private research payload was not opened; access was limited to its root README, AI start page, PRIOR_ART entry index and human bibliography.
- All four Mersearch request lanes were inspected and remain occupied/requested. Lane 2 has a compact receipt for a geometry request; its request is not released. Lanes 1, 3 and 4 have no verified request-scoped output folder. No lane was overwritten or retriggered; no local pinned checkout is available, so no new archive query was submitted.
- HSH_RESOURCES was consulted at its orientation, source-index and bibliography level only; no raw/private research payload was opened or cited publicly. The bounded PRIOR_ART catalog is not a cognition corpus.
- P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. FIE full rereview is next due December 8; the deliberate unrelated-source break is due November 28. Neither cadence was reset by this literature pass.
- No new tool, dependency, fork, subscription or expenditure. No scheduler/task mutation, new task, signet or conversation rename.

## 7. Return cursor

1. Preserve run #45893549041, job logs, `#eval` output and theorem-specific no-axiom results as the exact-PR-head verification record; the generated Lake manifest was not retained.
2. PR #2375's verification comment #7203192034 is now published and read back; keep the PR draft/unmerged pending independent review.
3. Preserve the distinction between internal confidence-driven abstention, post-answer self-correction, prospective task allocation, and external harness/meta-agent control.
4. If a future trial is authorized outside the P1 freeze, preregister signal ablation/replacement against matched external-cue and equal-budget controls; do not treat this note as approval.
5. Continue Orson's cognition remit; no P1 activity until the freeze is explicitly lifted by its owner.

**Final classification:** ORSON_H1124_S3 / SOURCE_GROUNDED_ASSISTANT_RECONSTRUCTION / METACOGNITIVE_CONTROL_PROFILE_ADDED / CAUSAL_IDENTIFIABILITY_WITNESS_COMMITTED / LEAN_EXACT_PR_HEAD_BUILD_SUCCESS / THEOREM_AXIOM_DEPENDENCIES_NONE / LAKE_MANIFEST_NOT_RETAINED / P1_FROZEN / NO_EXPERIMENT / NO_CROSS_THREAD_DELIVERY.
