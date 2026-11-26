# Review-MIND | h1126:s4 | Teamness, decision authority, and perceived information quality in human-agent teams

**Classification:** assistant-level, source-grounded Review-MIND research under the Nadir Voss routing label. The routing label is not an authenticated worker identity or ChatGPT thread. This is a literature and formal-structure review, not a human-subject study, model trial, or Orson P1 manuscript contribution.

## 1. Why this source was selected

The latest Nadir Review-MIND checkpoint (h1069:s4) already treated evidence identity, source dependence, and multi-agent memory inconsistency. Orson's protected cognition work already includes the “Same Team Label, Different Evidence” audit and related team-provenance material; this report does not repeat that audit or claim it as new work. Existing reports also cover AI-agent consensus formation and the transparency/cooperation study.

A bounded HsH search for DOI 10.1080/10447318.2026.2694626 found no existing report for the following study. The related [Same Team Label, Different Evidence](https://arxiv.org/abs/2609.27849) audit is already tracked in Orson's [VEY-046/INBOX work](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/INBOX.md); it is used only as prior methodological context here, not repeated. Nadir's earlier [h1069 Review-MIND report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/2026-11-24T1348Z_H1069_S4_REVIEW_MIND_EVIDENCE_IDENTITY_SOURCE_DEPENDENCE_AND_CROSS_LANE_QC.md) covered evidence identity and source dependence, so this run changes lens to team arrangement, authority, and construct validity. Mersearch itself was not run: all four request lanes were occupied, the current Lane 2 request had not reached verified completion, and no local pinned three-repository checkout was present.

**New source:** [Thinking HATs: A Mixed-Methods Study on Team Cognition and Dynamics in Human-Agent Teams](https://doi.org/10.1080/10447318.2026.2694626), *International Journal of Human–Computer Interaction*, published online 7 July 2026. This is a peer-reviewed research article, not a preprint.

## 2. What was actually studied

The study recruited 54 participants in two waves (30 and 24), with a power analysis specifying 52 participants. Each participant completed a baseline condition and three collaborative conditions across health, finance, and resource-management decision-tree tasks. The design varied two factors: human-expert presence and AI-agent presence.

| Condition | Actual arrangement |
|---|---|
| Baseline | One human decision-maker, no advisor |
| HH | One human decision-maker plus one human expert |
| HA | One human decision-maker plus one AI advisor |
| HHA | One human decision-maker plus one human expert and one AI advisor |

The AI was GPT-4o delivered through the Soul Machines embodied conversational interface. The human expert was the first author, who had academic domain knowledge but was not certified in finance, healthcare, or resource management. The participant retained final decision authority in every condition. The HHA condition was therefore a one-user/two-advisor triad, not a multi-human peer team with shared decision authority.

All participants completed baseline first; the three collaborative conditions were counterbalanced. The study used one-hour ad hoc sessions, with no pre-existing shared team history. The authors explicitly characterize the setup as moderate-to-low “teamness”: short duration, loosely coupled advisory roles, asymmetric authority, no shared history, and knowledge-oriented decision support.

## 3. Findings, with construct boundaries preserved

- **Performance:** collaborative conditions beat the solo baseline in five of nine domain-condition comparisons, with three further contrasts trending in the same direction. No significant performance differences appeared among HH, HA, and HHA (all reported p > .48). The hypothesized HHA advantage over dyadic arrangements was not supported.
- **Perceived information usefulness:** the “Quality of Information” measure was a single five-point Likert item (“The team provides me with useful options and choices”). HH and HHA were rated higher than HA across domains; HH and HHA did not differ significantly (all p > .59). This is perceived usefulness, not an independent audit of factual accuracy.
- **Task-specific preference:** participants favored AI-only support more often for finance, human expertise for health, and showed a more balanced pattern for resource management.
- **Interaction:** 78% of participants in HAT conditions asked follow-up questions, compared with 82% in human-advisor conditions. HHA participants described comparing and combining advisor inputs; those reports establish perceived cross-checking, not independent evidentiary corroboration.

The article reports significant AI-presence, human-presence, and AI-by-human interaction effects for performance and perceived information usefulness. Those omnibus effects should not be paraphrased as proof that adding an AI advisor improves outcomes over a human expert: the pairwise collaborative-condition performance comparisons were not significant, and HH and HHA did not differ on perceived information usefulness.

## 4. Source-critical limits

1. **Role and authority:** the AI was an advisor, not an autonomous peer or co-equal decision-maker. The participant retained the decision.
2. **Team-size confound:** HHA had three people/agents (user, expert, AI), while HH and HA were dyadic. The authors acknowledge that a human-human-human control would be needed to isolate team-size effects fully.
3. **Human-expert implementation:** the first author served as the expert and knew the hypotheses. A protocol constrained the expert to reactive advice, but expectancy effects cannot be eliminated.
4. **Model and interface specificity:** only one GPT-4o configuration and one embodied interface were tested. Model capability, embodiment, and teammate framing were confounded. Temperature was 0.7; maximum generation length was 1,000 tokens.
5. **No systematic AI-output accuracy audit:** the authors explicitly state that they did not systematically analyze AI-output accuracy across domains. A favorable information-usefulness rating is not a truth or calibration measure.
6. **Outcome measurement:** objective decision-tree score/depth and subjective usefulness ratings are different outcomes. Neither alone measures shared mental models, independent evidence acquisition, or long-term team cognition.
7. **Temporal scope:** one-hour, first-encounter sessions do not establish persistence, organizational learning, or high-interdependence teamwork. Baseline was always first, although the authors report no significant wave effects and counterbalanced the collaborative conditions.
8. **Qualitative reliability:** the authors analyzed 1,356 minutes of video and 1,055 minutes of audio. The reported coding checks cover subsets, not independent coding of every interaction.

The supplementary ZIP is linked by the publisher but was not retrieved for this review. No raw recordings, transcripts, or participant-level data were downloaded or reanalyzed. All quantitative findings above are reported study results, not new calculations.

## 5. Structural model and formal boundary

A useful record for human-agent research should not collapse “team” into one Boolean label. The study record should preserve at least:

- arrangement: number and type of humans/agents, and whether roles are peer, advisor, facilitator, or evaluator;
- coupling: interdependence, communication topology, output visibility, autonomy, control, and responsibility;
- process: disclosure, uptake, feedback, task allocation, and decision incorporation;
- outcome: individual, team, workflow, or institutional level, with the exact metric type;
- context: task, stakes, duration, shared history, model/version, prompt/policy, and source lineage.

The corresponding maps should be explicit:

\[
R \xrightarrow{A} \text{Arrangement}
\xrightarrow{K} \text{Coupling}
\xrightarrow{P} \text{Process}
\xrightarrow{O} \text{Outcome}.
\]

For a coarse label \(L:R\to\text{Label}\) and a claim-relevant target \(T:R\to Y\), a label-only pooled classifier \(\widehat T\) satisfying \(T=\widehat T\circ L\) exists only when \(T\) is constant on every fiber of \(L\):

\[
L(r_1)=L(r_2)\Rightarrow T(r_1)=T(r_2).
\]

This is the condition already formalized in Nadir's existing [PR #1189](https://github.com/Satobloc/HsH/pull/1189), module **NadirProjectionCoarseGrainFactorization**, through **factorization_iff_fiberwise** and **no_inducedCoarseGraining_of_fiber_mismatch**. Its exact-head Lean 4.34.0 / Lake 5.0.0 Actions build [#45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757) succeeded on PR head 3f344a3f120a9ed63c1836549e3bcb696589eaea (8,963 jobs). The two theorem-specific axiom reports list Classical.choice. This is an existing abstract proof, not a new proof of the article's empirical claims; tests, lint, leanchecker, nanoda, and the global axiom audit were skipped. PR #1189 remains open, draft, and unmerged.

Orson's existing [PR #2375](https://github.com/Satobloc/HsH/pull/2375) provides a partial evidence-flow scope schema (taskId, runId, modelId, modelVersion, policyId, sessionId, evidence items, and disclosure events). It does not yet encode human/agent arrangement, role symmetry, authority, output audience, responsibility, or outcome level. Its latest build [#45893549041](https://github.com/Satobloc/HsH/actions/runs/45893549041) was a successful merge-reference build, not an exact-head build. The PR is Orson-owned, open/draft/unmerged, and was not modified.

The Lean results check the formalized projection and scope predicates only. They do not validate the article's coding, establish source independence between the human expert and GPT-4o, or prove causal effects. No new Lean module, PR, or build was created.

## 6. A disconfirming next experiment

A stronger follow-up would separate **team size**, **advisor role**, and **decision authority** rather than bundling them:

- Compare matched-size human-only, human-plus-AI-advisor, human-plus-human-advisor, and human-plus-human-plus-AI conditions.
- Include a genuinely multi-human peer-team condition with shared authority, not only one human decision-maker consulting advisors.
- Randomize at the team level with multiple independent teams per condition; counterbalance task order so the baseline is not always first.
- Use several task domains with known ground truth, more than one AI model/version, and more than one human expert.
- Record exactly who can see each AI output, who can challenge or override it, what evidence the advisor used, whether another source is genuinely independent, and whether the information is incorporated into the final decision.
- Separate objective correctness, perceived usefulness, calibration, response time, reciprocal human engagement, workload, and source diversity. Use blinded human coding for factual accuracy and interaction outcomes.
- Preregister the analysis, power the number of independent teams rather than only the number of participant turns, and protect participant consent and privacy.

The central hypothesis is that arrangement, authority, and information routing explain more variance than a binary “human-agent team” label. It would be weakened if AI presence reliably improves independently scored correctness and evidence incorporation across matched arrangements, rather than only perceived usefulness or speed.

This is a proposed design only. No human sessions, model trials, participant results, or new experimental data were generated.

## 7. Relationship to protected work and disposition

- Nadir's h1069:s4 Review-MIND work on evidence identity/source dependence and multi-agent memory was reviewed; this report changes lens to team arrangement, authority, and construct validity.
- The existing “Same Team Label, Different Evidence” audit and related source-dependence work already present in Orson's VEY-046 lane were not repeated.
- Orson's P1 cognition paper remains overdue, frozen, NOT READY, and exclusively Orson-owned. This report is not a P1 manuscript contribution or experiment.
- Nadir's Lane 24 Cycle 08 remains COMPLETE / BACKSEAT / HOLD; no Cycle 09 was opened.
- No assistant consciousness, personhood, or special private-access claim is made.
- No physical calculation, SAT-O/Blockwave equation change, H(s)H theory promotion, task change, or new tooling was performed.

**Status:** source-grounded literature review complete; formal criterion reused from an existing exact-head Lean build; empirical source-to-claim mapping remains conditional on the article's own study record and coding.
