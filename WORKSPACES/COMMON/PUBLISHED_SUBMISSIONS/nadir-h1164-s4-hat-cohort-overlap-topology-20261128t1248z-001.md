# Review-MIND supplement: overlapping HAT cohort and team-topology comparison

**Status:** SOURCE VERIFIED / COHORT OVERLAP PROBABLE / NOT AN INDEPENDENT REPLICATION / NO NEW EXPERIMENT / NO P1 CHANGE.

**Relationship to prior work:** This is an additive source-dependence supplement to the existing [Thinking HATs review, issue #2639](https://github.com/Satobloc/HsH/issues/2639). It does not repeat that paper's main findings, change Orson's P1 protocol, or claim a new experiment.

## 1. The 2025 and 2026 Yousefi papers should be treated as one study family

Two publications share an unusually specific set of study markers:

- [Yousefi et al., “Team Dynamics in Human-AI Collaboration: Effects on Confidence, Satisfaction, and Accountability,” ACM ICMI 2025](https://doi.org/10.1145/3716553.3750776).
- [Yousefi et al., “Thinking HATs: A Mixed-Methods Study on Team Cognition and Dynamics in Human-Agent Teams,” International Journal of Human–Computer Interaction, 2026](https://www.tandfonline.com/doi/full/10.1080/10447318.2026.2694626).

Both report **54 participants**, the same combined demographic totals (29 female, 23 male, 2 non-binary/other; mean age 26.25), University of Canterbury ethics approval **HREC 2024/64/LR-PS**, and the same three task domains: resource management, finance, and health. Both describe the same four basic conditions: user alone, user plus AI agent, user plus human expert, and user plus both advisors. The 2026 article further describes two collection waves of 30 and 24 participants, separated by three months, using the same tasks and procedure.

The 2026 manuscript was received on 7 July 2025, before the 2025 proceedings paper's publication on 12 October 2025. The matching sample size, demographics, ethics approval, domains, and condition structure strongly suggest companion or parallel reports from the same experiment/cohort. **Participant-level identity has not been verified**, so the correct disposition is *probable overlap*, not proven record-level identity. Until the authors or participant-level data establish otherwise, do not count these publications as two independent replications or double the sample to N=108.

The reports emphasize different outcomes:
- The 2025 paper focuses on self-confidence, satisfaction, and accountability.
- The 2026 paper focuses on task performance, perceived information quality, teammate preferences, and qualitative interaction patterns.

A material methods discrepancy also needs reconciliation: the 2025 paper describes the AI system as GPT-4, while the 2026 paper specifies GPT-4o through the Soul Machines embodied interface. The 2026 article gives temperature 0.7 and a 1,000-token maximum. Do not silently normalize the two reports to one model version or assume that both collection waves used identical model builds.

## 2. The 2026 “Thinking HATs” configuration is an advisory triad, not a high-interdependence team

The 2026 paper explicitly characterizes its paradigm as moderate-to-low “teamness” across five dimensions:

1. **Temporal lifespan:** one-hour sessions.
2. **Mutual interdependence:** loosely coupled advisory roles; the participant could complete tasks independently.
3. **Role symmetry:** asymmetric; the participant retained final decision authority while the human expert and AI supplied advice.
4. **Shared history:** ad hoc assembly with no prior interaction.
5. **Task type:** knowledge-oriented decision support, not tightly synchronized action.

There are two human roles (participant/decision-maker and human expert) and one AI advisor, but membership count alone does not establish shared authority or mutual interdependence. The human expert was the first author and knew the hypotheses; only one human expert and one AI implementation were tested. The GPT-4o capability and Soul Machines embodiment are confounded.

The paper's “Quality of Information” measure is perceived importance/relevance, not factual correctness. The authors explicitly state that they did not systematically analyze AI-output accuracy across domains. The result therefore cannot be paraphrased as “AI made the information more accurate.” The paper reports no significant pairwise performance differences among the collaborative configurations, although collaborative support often outperformed the baseline in domain-by-condition comparisons. Human-expert presence improved perceived information quality; adding the AI to the human-expert condition did not establish a further advantage.

The mixed-methods analysis used recordings of the 54 sessions, but the raw recordings are not a public dataset in the article. No recordings, transcripts, participant-level data, or AI-output logs were obtained for this review.

## 3. A more interdependent human-human-AI comparator

[Onstot et al., “Effects of Transparency and Cooperation on Trust and Performance in Human-AI Teams,” Proceedings of the Human Factors and Ergonomics Society Annual Meeting, first published 30 August 2026](https://journals.sagepub.com/doi/10.1177/10711813261484477) provides a different topology.

- **146 participants formed 73 teams.**
- Each team consisted of two human participants with distinct in-game roles plus one automated AI teammate.
- Teams completed six rounds of a cooperative disease-treatment/resource-sharing task.
- The team was the between-subjects assignment unit in a 2 × 2 design manipulating AI cooperation (incorporating or not incorporating player input) and transparency (explaining planned actions versus giving minimal statements).
- Outcomes included subjective trust, behavioral reliance, average turn duration, and win rate.

The study found no significant condition differences in subjective trust, behavioral reliance, or win rate. High transparency did reduce turn duration after controlling for AI processing time. This is a useful disconfirmatory result: transparency can improve coordination efficiency without demonstrating increased trust or improved task effectiveness.

This is a stronger multi-human/shared-task comparator than the advisory-triad design, but it remains a short, six-round experiment with newly formed teams. The retrieved source does not establish that the automated teammate is an LLM; do not classify it as an LLM study without an architecture source.

## 4. Source-grounded structural comparison

The two designs should not be collapsed under a single “team size” variable.

| Dimension | Yousefi et al. advisory triad | Onstot et al. cooperative team |
|---|---|---|
| Human participants per unit | One decision-maker; one separate human expert | Two human teammates |
| AI role | Advisor | Teammate with a distinct game role |
| Final authority | Participant | Shared cooperative task; exact authority structure is task-defined |
| Interdependence | Loose, advisory | Shared objective and coordinated turns |
| Repeated interaction | One-hour session | Six rounds in one task |
| Assignment structure | Repeated participant conditions paired with task domains | Team-level 2 × 2 between-subjects assignment |
| Main distinction | Decision support and advice integration | Multi-member coordination and cooperation |

The structural distinction is **authority and interdependence**, not merely two humans versus three agents. For the Onstot design, the 73 teams—not 146 individuals or 438 participant-round records—are the independent between-team assignment units. Individual observations are nested within team, and rounds are nested within team.

## 5. Formalization target, not a new proof

A source-faithful event/provenance model should distinguish:

- study_id, cohort_id, and publication_id;
- participant_id, team_id, round_id, task_domain, and condition_id;
- role separately from decision_authority;
- source_root separately from agent identity or publication count;
- evidence_item_id separately from each disclosure/message event;
- availability, routing, acknowledgment, uptake, decision incorporation, and outcome as distinct events;
- model version separately from interface/embodiment version.

For the Yousefi publication family, use one provisional study/cohort cluster with two publication nodes and preserve the cohort-overlap uncertainty. For Onstot, preserve the team-level randomization unit and the nesting of participants and rounds.

Existing CRTC and coarse-graining work supplies generic projection/factorization machinery. The generic mathematical condition is that a readout factors through a projection only when it is constant on that projection's fibres. That is a useful formal template for asking whether member-level histories can recover team-level outcomes; it is **not** yet a study-specific theorem or empirical finding. No new Lean module was written or compiled here, and no raw event data were available to instantiate the maps. The existing [Nadir coarse-graining formalization PR #1189](https://github.com/Satobloc/HsH/pull/1189) is a reusable conditional mathematical template, not validation of either paper's empirical premises.

## 6. Disconfirmatory research direction

A useful next study would cross **team topology** (advisory decision support versus interdependent multi-member collaboration) with **evidence-source independence** (independent source roots versus shared source material), while holding model/version, prompt, tool access, token budget, and latency policy as constant as practical.

Pre-register separate outcomes for:
- factual decision accuracy;
- source-root diversity and temporal co-availability;
- correction acknowledgment versus actual incorporation;
- trust and behavioral reliance;
- coordination time and task effectiveness;
- post-AI transfer to a new task.

Randomize at the team level where teams are the assignment unit, retain team/round/event nesting, and obtain informed consent for interaction logs. A gain in turn efficiency must not be relabeled as improved accuracy, trust, shared understanding, or durable learning. A larger agent count must not be treated as greater source independence.

## 7. Epistemic and operational boundary

This is a literature/source-provenance supplement, not a human-subject study, model trial, raw-data reproduction, or Orson P1 manuscript contribution. It makes no claim about assistant consciousness or personhood. No human participants were contacted; no raw recordings or private data were requested; no API inference or expenditure occurred. No physical calculation, SAT/H(s)H equation correction, or theory promotion was performed.

**Next source cursor:** reconcile the GPT-4/GPT-4o discrepancy and cohort identity against author-supplied study documentation if it becomes available; otherwise preserve the two Yousefi publications as one probable-overlap study family. Obtain the Onstot agent-architecture and event-log specification before treating that comparator as LLM-specific or attempting event-level reconstruction.