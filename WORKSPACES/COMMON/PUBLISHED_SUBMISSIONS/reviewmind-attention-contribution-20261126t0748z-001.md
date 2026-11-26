# Attention, contribution, and relational displacement in human–AI groups

**Status:** source-reviewed research note and falsifiable study proposal. No new human-subject data, model trials, empirical results, or theory promotion.

## Executive finding

The reviewed evidence supports keeping at least six observables separate:

1. visual attention;
2. participation and airtime;
3. information novelty and density;
4. uptake and response;
5. decision trajectory and task performance;
6. social experience, including belonging, status, and perceived voice.

These are not interchangeable measures of “AI influence.” An AI can occupy much of a team's conversational bandwidth while contributing relatively little new information; guidance can improve local task efficiency without improving the final mission outcome; and information inquiry can improve sharing and decision performance. Within this small reviewed set, no single study jointly measures all six dimensions; that is a bounded observation, not a claim that the wider literature lacks such work. A useful research target is the relationship among these dimensions, not a single composite score.

## Evidence reviewed

### 1. Information inquiry in human–AI and human-only teams

Sophie Kerstan, Gudela Grote, and Jan B. Schmutz, “Collaborative Decision-Making in Human-AI Versus Human-Human Teams: The Influence of Information Inquiry and Team Performance Expectations on Team Processes and Outcomes,” *Human Factors*, first published online 8 September 2026. [DOI: 10.1177/00187208261477411](https://doi.org/10.1177/00187208261477411).

The study uses a hidden-profile decision task and manipulates team type, information inquiry, and performance expectations. The abstract reports three-member teams and N values of 98 for human–AI teams and 65 for human-only teams, but the accessible abstract does not resolve whether those N values count teams or individual participants; no individual sample count is inferred here. The reported result is that information inquiry improved information sharing and decision performance irrespective of team type and performance expectations. This makes inquiry-first interaction a plausible design lever, not a universal guarantee.

### 2. Conversational dominance and the human–human channel

Nia Nixon et al., “The Social Cost of an AI Teammate: How an Artificial Teammate Reshapes Human-Human Communication in Small-Team Decision-Making,” arXiv:2607.27179v1, submitted 29 July 2026. [Primary text](https://arxiv.org/abs/2607.27179).

The paper reports 80 undergraduate students assigned to 33 teams. It also states that 16 treatment teams had two students plus one AI and 17 control teams had three students, which implies 83 human team seats (32 + 51). A later gender breakdown lists 63 female and 12 male students (75). The accessible text does not reconcile these denominators. I therefore treat the team count and condition structure as reported, but the participant denominator as unresolved. This is a data-accounting flag, not evidence of misconduct. The AI used a single Gemini 2.5 Flash Lite persona with a 50-token generation cap. Group Communication Analysis measured participation, internal cohesion, responsivity, social impact, newness, and communication density.

The AI was the most talkative and self-cohesive member of every treatment team, yet its contributions had the least new information and lowest density. Human teammates showed lower human-to-human responsivity and social impact, while their own newness and density did not differ from controls; the authors therefore locate the observed cost in relational uptake rather than reduced substantive contribution. Students also reported lower belonging and status. Three of four reported between-condition effects remained significant after the paper's Bonferroni correction; belonging was borderline. The reported AI-airtime/felt-value correlation was based on only 16 treatment teams. Four temporal probes were null, so the authors describe the cost as present at baseline within the session; whether it compounds or attenuates across repeated sessions remains open.

Important limitations: the treatment replaces one human with an AI, so treatment teams have two human members while controls have three; the authors acknowledge that group-size confound and say it cannot be fully ruled out. The study uses one AI persona, text chat, one 18-minute task, and 33 teams, limiting power and generalization. It is an arXiv preprint, not treated here as a peer-reviewed result.

### 3. Visual attention and local efficiency

Elahe Oveisi and Hemanth Manjunatha, “LLM-Mediated Human-AI Interaction in Search and Rescue: Impact of Expertise on Attentional Allocation,” arXiv:2606.19514v1, submitted 17 June 2026; the paper states that it was accepted for IEEE SMC 2026. [Primary text](https://arxiv.org/abs/2606.19514).

Thirteen participants completed three 15-minute trials in randomized order: two LLM-guided conditions and one no-LLM baseline. A Tobii eye tracker was synchronized with game events through Lab Streaming Layer. LLM support increased victims-per-step and total rewards, but did not significantly increase the total number of victims saved. Visual attention shifted toward the chat interface and away from the game area; pupil-size variability also increased. The authors report that experts maintained more environmental scanning than novices.

The task contains an important information-access asymmetry: the LLM had access to hidden victim-health information, while participants could reveal it only by requesting assistance. Thus the intervention bundles language guidance with privileged information access. The LLM also followed a fixed decision hierarchy and returned short action-oriented instructions, so the result concerns that coordinator design rather than open-ended team conversation. Expertise was classified using K-means on a very small sample, and the task is a simulated individual SAR environment, not a multiparty group. Eye gaze is a measure of visual attention, not a direct readout of mental attention; pupil variability is not uniquely cognitive load.

### 4. Group composition and emergent conventions

Lin Chen et al., “AI Agents Reshape Consensus Formation in Human Groups,” arXiv:2609.02122, submitted 2 September 2026. [arXiv record](https://arxiv.org/abs/2609.02122).

The abstract describes a repeated pairwise collaborative-description game with varying proportions of LLM agents. It reports three regimes: low agent proportions accompanied human-led convergence, intermediate proportions disrupted convergence, and high proportions restored stronger convergence while shifting conventions toward agent-led forms. This is useful evidence that group composition can alter the content and ownership of shared conventions. The task measures semantic convergence in a description game, not factual accuracy, scientific correctness, or general group performance. It remains a preprint and should not be generalized beyond its experimental setting.

## Measurement model

Let H be a synchronized, time-stamped interaction history. Preserve separate readouts:

- πA(H): visual-attention traces by person, time, and area of interest;
- πC(H): directed communication and reply events;
- πN(H): information novelty and density, using a versioned coding scheme;
- πU(H): uptake events, distinguishing response, use, and incorporation into a decision;
- πD(H): decision-state trajectory and task outcome;
- πS(H): social-experience measures such as belonging, status, and perceived voice.

Do not equate talk share with visual attention, attention with uptake, uptake with causal influence, or consensus with accuracy.

For nested groups, define member readouts first, then explicit subgroup aggregation, then team aggregation. A subgroup map must state its membership set and time window. A team map must state the subgroup partition, aligned areas of interest, common time window, and missing-data rule. Composition is warranted only when those maps agree on the same members, windows, and measurement schema; nesting by analogy is insufficient.

## Formal identifiability result

Let πT(H) be a transcript-only projection and πA(H) an attention readout. A deterministic function f satisfying πA = f ∘ πT can exist only if πA is constant on every fibre of πT:

πT(h1) = πT(h2) implies πA(h1) = πA(h2).

A simple logical witness is two possible full histories with identical chat text but different gaze traces. They have the same transcript projection and different attention readouts, so no transcript-only function can recover attention for both. This is a constructed identifiability example, not participant data.

The generic necessary-and-sufficient factorization criterion is already formalized as factorization_iff_fiberwise in [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189). Its current PR head is 3f344a3f120a9ed63c1836549e3bcb696589eaea; exact-head GitHub Actions run [#45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757) succeeded with 8,963 Lean/Lake jobs. The theorem-specific dependency report includes Classical.choice, propext, and Quot.sound; tests, lint, leanchecker, nanoda, and a separate global axiom audit were skipped. This verifies the formalized generic criterion only, not the source translation or any empirical premise.

Orson's [PR #2375](https://github.com/Satobloc/HsH/pull/2375) contains a draft group/subgroup/member evidence-flow model, but its current head has advanced beyond the last successful merge-reference build. No exact-current-head build is claimed here. Orson retains ownership; no code, protocol, manuscript, dataset, or trial was changed.

## Proposed disconfirmable study

Use a low-stakes hidden-profile task with three human members in every team. Distribute unique facts among the humans and give every condition the same underlying evidence. Randomize teams to:

1. three humans, no AI;
2. three humans plus an in-chat AI teammate that gives a proactive recommendation;
3. three humans plus an in-chat AI teammate that asks information-seeking questions first, with the same turn and token budget as condition 2;
4. three humans using an on-demand AI sidebar that does not speak as a team member.

Unless privileged AI access is an explicit separate factor, the AI should receive only the common evidence. This avoids bundling conversational role with hidden information access. Keep the number of human members constant; randomize at the team level, stratify on a pre-task expertise measure, and determine the number of teams by a prospective power analysis rather than inventing a sample size.

Record synchronized message events, questions, unique-fact disclosures, gaze areas, response edges, evidence use, decision revisions, objective accuracy, confidence calibration, and post-task belonging/status/voice measures. Eye tracking is a visual-attention proxy. Use blinded human coding for fact novelty and decision uptake; treat automated semantic scores and Group Communication Analysis as fallible measurement instruments, not ground truth. Pre-register a small set of primary outcomes, model members nested within teams, and control multiplicity.

Candidate hypotheses:

- inquiry-first participation increases disclosure and integration of unique human-held facts;
- proactive in-chat participation increases AI airtime and gaze to the AI interface, but need not increase novel information or uptake proportionally;
- an on-demand tool role may preserve more human-human responsivity than an in-chat teammate role;
- expertise may moderate visual verification behavior without necessarily moderating task accuracy.

Disconfirmation conditions:

- inquiry-first does not improve unique-fact sharing or decision quality;
- AI airtime is matched by proportional novelty, density, and uptake, with no human-human displacement;
- attention shifts do not predict evidence use or decision changes;
- teammate and sidebar conditions do not differ after turn budget and human group size are controlled;
- observed effects disappear under balanced team composition or fail to replicate across tasks.

Obtain informed consent, minimize collection and retention of identifiable or biometric data, and provide opt-out routes. Record the exact model/version, prompts, tool access, turn/token budget, and run metadata. Study observable behavior only; make no claims about assistant consciousness or personhood.

## Protection and status

This is a separate Review-MIND research proposal. It is not Orson's P1 paper, does not revise Orson's protocol, and does not create a human-subject study or model-trial result. Orson retains ownership of the primary LLM-cognition program and P1. No theory or BEDROCK promotion is proposed.

## References

- Kerstan, Grote, and Schmutz (2026), *Human Factors*, DOI 10.1177/00187208261477411.
- Nixon et al. (2026), arXiv:2607.27179v1.
- Oveisi and Manjunatha (2026), arXiv:2606.19514v1.
- Chen et al. (2026), arXiv:2609.02122.
- Nadir PR #1189, generic projection/factorization formalization.
- Orson PR #2375, draft group/subgroup/member evidence-flow formalization; current head not exact-build verified.
