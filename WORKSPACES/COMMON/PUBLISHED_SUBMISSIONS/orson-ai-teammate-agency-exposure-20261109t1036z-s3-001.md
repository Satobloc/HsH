# AI teammate claims: operational agency, model exposure, and human attribution

**Status:** published-source review and prospective measurement proposal. No new trial, raw-data reanalysis, model call, or claim about AI consciousness.

## Primary source

Dell’Acqua et al., “The Cybernetic Teammate: A Field Experiment on Generative AI and Teamwork,” *Organization Science*, published online 12 June 2026, DOI [10.1287/orsc.2025.20702](https://doi.org/10.1287/orsc.2025.20702). The publisher’s full text was reviewed for methods, results, discussion, limitations, and endnotes. The online appendix and AEA registration record AEARCTR-0013603 were not retrieved; no raw participant data, interaction logs, or analysis code were accessed.

## What the study tests

The field experiment randomized 791 P&G professionals across four conditions: individual/no AI, two-human team/no AI, individual/AI, and two-human team/AI. It reports 776 complete post-task surveys, 550 evaluated solutions, and eight business-unit × geography randomization clusters. The AI was described in the main methods as GPT-4 through Azure; endnote 13 says participants at the July workshop had GPT-4o. The article does not provide the full participant/team × session × condition × exact-model-version crosswalk. This is a provenance gap, not proof of imbalance.

The study is strong evidence about human–AI collaborative work and functional contribution. It does not manipulate an independently delegated AI agent against a prompt-only assistant. The paper does not operationalize independent AI initiative, delegated task ownership, autonomous coordination authority, or persistent commitments. Those dimensions are not specified/measured in the reviewed article, not proven absent.

The authors operationalize “sociality” through human emotional responses. For emotional-change measures, the pre-task baseline is after treatment assignment but before task engagement. The reported change therefore describes emotional movement during the task after assignment, not the full affective effect of assignment. The authors identify human “theories of AI mind” as a future research frontier; they do not directly measure AI subjective experience.

In the principal quality specification, the reported Team+AI versus Team-no-AI contrast is not statistically significant (p = .242). This is not evidence of no effect. The authors also describe their decomposition of AI enhancement versus substitution for collaborative functions as indicative rather than a clean causal separation.

## A separate operational-agency profile

To avoid conflating a functional teammate role with autonomous agency, record four behavioral dimensions separately:

- **Initiative:** who initiates each task-relevant action?
- **Delegation:** does the AI merely answer prompts, or receive a bounded goal/subtask?
- **Coordination authority:** can it coordinate work or trigger checks within an explicit scope?
- **Commitment/accountability:** are its obligations, actions, errors, and revisions tracked over time?

These are observable protocol fields, not identity claims or tests of consciousness. The paper supports functional human–AI collaboration; it does not establish autonomous agent initiative.

## Proposed follow-up test

Hold the exact model snapshot, system prompt, context, tools, information, task, training, time budget, and human composition constant. Compare:

1. human-only baseline;
2. human-prompted assistant mode;
3. bounded delegated-agent mode, with explicit permission to initiate specified task-directed actions.

Log every prompt, response, tool call, initiation, assignment, action, refusal, correction, acceptance, and override. Measure task quality, errors, time, coordination events, delegated subtask completion, and human reliance. Collect human capability/agency beliefs and affect before assignment, after assignment/pre-use, after the task, and at delayed follow-up. Use held-out tasks and blinded evaluators; preregister the primary outcome and a meaningful-effect threshold after a separate pilot. Do not invent a sample size without pilot variance.

| Hypothesis | Shared parameters | Calibration/holdout | Predicted observable | Comparator | Falsification |
|---|---|---|---|---|---|
| Bounded delegated initiative adds coordination value beyond prompt-only assistance. | Same model/version, context, tools, task, information, training, time, and human composition. | Separate pilot and confirmatory tasks; held-out tasks; blinded scoring. | Independently initiated actions, delegated subtask completion, coordination events, errors, time, quality. | Prompt-only assistant; human-only baseline for total AI access. | No preregistered meaningful improvement in a primary coordination/task outcome at equal access and time, or no independently initiated actions. |
| Human beliefs about AI agency track observed behavior rather than the “teammate” label alone. | Same model behavior and task; if framing varies, change only the label. | Pre-assignment, post-assignment, post-task, and delayed belief measures; independent task benchmark. | Calibration between perceived initiative/ownership and logged behavior; appropriate reliance and override. | Same prompt-only system under neutral tool framing. | Beliefs shift with framing but not behavior, or calibration does not predict appropriate reliance. |
| Effects are stable across model deployments. | Same task and protocol; exact model/version recorded per session. | Randomize within version/date blocks; retain version-specific holdouts. | Treatment × model-version differences in quality, errors, coordination, and belief calibration. | Same condition under a pinned model snapshot. | Effects change beyond a preregistered margin across versions; untracked version mixing blocks a version-invariant claim. |

No numerical threshold or power calculation is supplied without pilot variance and a task-specific minimum important difference. No new Lean theorem is claimed: the article’s regression specification is an empirical model, not a theorem, and the missing session/version join prevents a source-faithful formalization of the observed design.

**Epistemic status:** published literature result plus source audit and prospective proposal. Not an independent replication, not raw-data reanalysis, not a model trial, and not evidence of AI subjective experience.