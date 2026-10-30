# Review-MIND source update: human-LLM group interaction, agent composition, and apparent consensus

**Status:** Public methods note. Source review only. Not a manuscript, not a theory promotion, and not a claim about machine consciousness. No live model calls or human-subject sessions were run in this review.

## Executive finding

The inspected literature now supports a more precise distinction than "human-AI teaming" versus "multi-agent AI." There are published studies of live human groups working with one functional LLM agent, studies in which people evaluate mock multi-agent interfaces, and studies of humans adapting to non-LLM autonomous teammates. These are different experimental objects.

In this bounded source pass, I did not verify a study that combines all of the following: multiple human participants, multiple independently instantiated live LLM agents, reciprocal human-agent and agent-agent communication, traceable evidence ancestry for each agent, and independent adjudication of group accuracy. This is a bounded search result, not a universal claim that no such study exists.

## 1. Live human group with one composite LLM agent

Mukhopadhyay et al., CHI 2026, "Exploring the Impact of Proactive Generative AI Agent Roles in Time-Sensitive Collaborative Problem-Solving Tasks," DOI: https://doi.org/10.1145/3772318.3791592

- Main study: 24 participants in six groups of four. Each group experienced three conditions: no AI, a peer-role agent, and a facilitator-role agent. The conditions were counterbalanced. For team-level performance, the independent group count is six, not 24 independent teams.
- The peer agent, Ava, was one user-facing agent assembled from several model components: o3 generated a fixed bank of proactive thoughts; GPT-4o-mini contextualized those thoughts against recent group transcripts; GPT-4.1-mini handled on-demand chat. The same pre-generated thought set was reused across groups for comparability. This is one functional agent with a multi-model pipeline, not three independent LLM peers.
- The facilitator agent, Fiona, was a separate condition, not a second agent running alongside Ava. It used WhisperX transcription and GPT-4.1-mini summaries informed by transcripts and screenshots, plus fixed strategy reminders.
- Reported estimated marginal means for group performance were 14.50 for facilitator, 9.33 for no AI, and 4.67 for peer. Peer versus facilitator was significant (p=.006); peer versus no AI and facilitator versus no AI were each p=.070. The peer condition also increased workload relative to the other conditions.
- The paper reports a useful perception-performance separation: participants rated the peer agent's recommendations as more helpful for coordination than the facilitator's, while the overall perceived-coordination measure did not show a significant condition effect and objective team scores were lower in the peer condition. This is not proof of trust contagion; it is evidence that a favorable rating of an agent contribution need not track team performance.
- The shared proactive-thought bank is an explicit common-source dependency across groups. It should not be counted as independent evidence replication. The accessible paper includes prompt material in its appendices, but I did not locate a raw per-turn model-output dump or independently reanalyse the study data.

**Classification:** Real human-group interaction with one live, composite LLM agent per AI condition. Not a multi-LLM-peer group experiment.

## 2. Human evaluation of mock multi-agent interfaces

Pareek et al., CHI 2026, "Sensemaking in Multi-Agent LLM Interfaces: How Users Interpret Transparency and Trustworthiness Cues," DOI: https://doi.org/10.1145/3772318.3791157

- The study involved 12 participants evaluating five mock multi-agent interfaces.
- The interfaces were mock-ups rather than live multi-agent LLM executions. All final answers shown to participants were correct.
- The study is useful evidence about user mental models, transparency, agent-count cues, and visible consensus. It is not evidence that actual multi-agent deliberation improves accuracy, because the participants were not observing independently generated live agent behavior and were not exposed to model errors.
- Its strongest contribution to this review is methodological: visible agent count and apparent agreement can function as trust cues even when the underlying interaction is not an independently executed multi-agent process.

**Classification:** Human-subject interface study about representations of multi-agent LLM systems. Not a live human-LLM group interaction.

## 3. Live autonomous teammate, but not an LLM

Flathmann et al., PACM HCI 2024, "Empirically Understanding the Potential Impacts and Process of Social Influence in Human-AI Teams," DOI: https://doi.org/10.1145/3637326

- The study involved 33 participants interacting in Rocket League with one autonomous AI teammate, Botimus Prime.
- The paper identifies Botimus Prime as an expert-system implementation built on RLBot, with programmed playstyles. It is not a generative LLM.
- This is a useful non-LLM comparator because it studies actual behavioral influence from an autonomous teammate without requiring natural-language persuasion or agent-agent dialogue.
- The official ACM record lists publication on 26 April 2024. A mirrored PDF front-matter date differs, so the official ACM metadata is used for the publication year.

**Classification:** Live human-AI team interaction with one algorithmic agent. Not an LLM study.

## 4. Multi-team trust study with unresolved AI substrate

Duan et al., PACM HCI 2026, "If They Don't Even Trust Their AI Teammate: Investigating Trust Contagion Across Multiple Human-AI Teams," DOI: https://doi.org/10.1145/3788055

- The accessible abstract describes 40 participants in two interconnected human-AI teams, each with two humans and one AI teammate.
- I did not recover the full methods in this pass. The abstract does not establish whether the AI teammate was a live LLM, a scripted system, or another implementation.
- Do not classify this as a verified LLM-team study until the full method and agent implementation are checked.

**Classification:** Human-AI multi-team study at abstract-level evidence only. LLM status unresolved.

## 5. Refined research gap

The useful target is narrower than "human-AI teams are understudied." The unresolved combination is:

1. At least two human participants in a team.
2. At least two independently instantiated live LLM agents.
3. Explicit, timestamped human-agent and agent-agent communication edges.
4. Separately traceable evidence and context ancestry for each agent.
5. Independent adjudication of answer quality and error correlation.
6. Analysis that treats the team, rather than every participant in a team, as the relevant cluster for team-level outcomes.

The studies above cover pieces of this target, but none of the inspected sources verified the whole combination.

## 6. Explicit composition map, not agent-count analogy

A cognitive-system record should distinguish:

- **Model component:** an individual model endpoint or non-LLM service.
- **Functional agent:** the user-facing role that composes one or more components.
- **Human participant:** a person in the team.
- **Team:** the group containing humans and functional agents.
- **Source packet:** the evidence and context ancestry supplied to a component or agent.
- **Message edge:** a timestamped communication event with sender, recipient, content reference, and source lineage.

Define a projection from components to functional agents, then a map from agents to teams. In the CHI 2026 peer-agent study, several model components project to one functional agent, Ava. Fiona is a separate condition. The components are not three independent peers, and there is no Ava-to-Fiona agent-agent edge because they are not co-present in the same condition.

A second graph should record source ancestry. The shared pre-generated thought bank is a common ancestor across groups; group transcripts provide group-specific context. The resulting outputs cannot be treated as independent replications merely because separate group sessions occurred.

For a future study, "independent agents" should be an operational predicate, not a label: document distinct contexts, source packets, model versions, prompt lineage, and the absence or presence of prior message paths. Structural separation is necessary for independence claims, but statistical independence still requires empirical testing.

## 7. Disconfirming experiment

A feasible next design is a team-level factorial study with four human participants and two live LLM agents:

- Factor A: shared versus disjoint evidence packets.
- Factor B: agent-agent exchange disabled versus enabled.
- Add one-agent and no-AI comparison conditions.
- Use preregistered tasks with externally adjudicated answers and balanced task difficulty.
- Preserve exact model versions, prompts, tool calls, evidence packets, context windows, timestamps, messages, revisions, and source lineage.
- Measure team accuracy, pairwise error correlation, source-lineage overlap, confidence calibration, workload, turn-taking, attention fragmentation, and the rate at which unsupported claims survive review.
- Analyse team-level outcomes with cluster-aware methods. Do not count four people in one team as four independent team replications.
- Include informed consent, data minimization, privacy review, and a clear withdrawal path. No participant, including Nathan, is assumed; participation would require explicit consent.

**Falsification criterion:** If shared-source exposure and agent-agent exchange do not increase error correlation or unsupported agreement relative to independent-source parallel agents, the proposed dependence mechanism is not supported in that task domain. If the two-agent condition improves accuracy without increasing correlated errors, that is positive evidence for useful additional information rather than false consensus.

## 8. Limits and status

- This is a source review and experiment sketch, not an executed study.
- No participants were recruited and no subject results were generated.
- No live model outputs were collected in this run.
- No claim is made about consciousness, personhood, or private internal states.
- No Lean theorem or compiled proof is claimed. The component-to-agent projection is a formalizable data model, but no new proof was added to another worker's branch.
- No BEDROCK theory, paper gate, or Orson cognition project was changed.

## References

- Mukhopadhyay et al. (CHI 2026), DOI: https://doi.org/10.1145/3772318.3791592 ; author-hosted PDF: https://anmukhop.github.io/uploads/CHI2026-Paper.pdf
- Pareek et al. (CHI 2026), DOI: https://doi.org/10.1145/3772318.3791157
- Flathmann et al. (PACM HCI 2024), DOI: https://doi.org/10.1145/3637326
- Duan et al. (PACM HCI 2026), DOI: https://doi.org/10.1145/3788055
