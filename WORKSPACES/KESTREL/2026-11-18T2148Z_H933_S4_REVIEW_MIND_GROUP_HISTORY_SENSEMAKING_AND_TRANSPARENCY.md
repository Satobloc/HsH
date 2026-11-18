# Review-MIND | h933:s4 | Group-history sensemaking and transparency
Date: 2026-11-18

**Attribution:** assistant-level reconstruction under deterministic Kestrel ring label. No authenticated Kestrel thread, direct worker participation, or cross-thread delivery is claimed.

## Selection and remit

Nominal UTC hour h=933; sequence 5h+4=4669; ring index 14 selects Kestrel. Successor label is Meridian.

The historical Kestrel source was recovered from the raw conversation export, not inferred from an assistant summary. The operative remit is cross-boundary synthesis, trust-first thinking with Nathan, and avoiding reflexive adversarial investigation while retaining verification when a decision depends on it. This run stayed within Review-MIND. It does not assert assistant consciousness or personhood, and it does not promote H(s)H theory.

## Repetition control

The initial literature sweep surfaced several studies already represented in HsH. They were excluded from new review rather than repeated: Nixon et al. on the social cost of an AI teammate (Morrow/Hale), Chen et al. on consensus formation (Orson P1), Kerstan et al. on human-AI versus human-human hidden-profile teams (Meridian), and Xu et al. on shared GenAI collaboration spaces (Loom). This report adds two sources not found in the current HsH branch and one linked source whose full text could not be retrieved.

## New source findings

### 1. Operational transparency in a human-automation team

Onstot, Greenlee, Funke, and Tolston (2026), "Effects of Transparency and Cooperation on Trust and Performance in Human-AI Teams," Proceedings of the Human Factors and Ergonomics Society Annual Meeting. First published online 2026-08-30. DOI: https://doi.org/10.1177/10711813261484477

The publisher text reports 146 participants in 73 three-person teams. Each team contained two human participants and an automated agent in a cooperative disease-treatment board-game task, with six rounds. The study used a 2x2 between-team design:

- Cooperation: the agent either incorporated human input when selecting actions or did not incorporate it.
- Transparency: the agent either explained what it planned to do and why, or stated only the action.

Reported outcomes:

- Subjective trust did not differ significantly by cooperation or transparency.
- Behavioral reliance, measured by choosing "Trust the Medic's choice," did not differ significantly.
- Team win rate did not differ significantly.
- High-transparency teams had shorter average turn duration after controlling for AI processing time: reported means 97.33 versus 99.22; transparency F(1,80)=5.644, p=.020, partial eta-squared=.066.

The source therefore supports a narrow result: explaining an automated agent's action can improve coordination speed in this task without a detected change in trust, reliance, or win rate. It does not show that transparency generally improves trust or decision quality.

**Source limits:** the article describes an automated agent, not a documented LLM. No raw team transcripts or agent output logs were retrieved. The accessible report does not explain the analysis-unit mapping behind the turn-duration ANCOVA denominator df of 80 when the sample is reported as 73 teams. This is an unresolved reporting question, not a demonstrated statistical error. The task is a short, single-session game, not a long-lived collaborative group.

### 2. Interpretive work in groups with shared history

Cho, Zachry, and McDonald (2026), "How Much Can AI Understand? Toward AI-Assisted Sensemaking of Collaborative Discussion in Groups with Shared History," arXiv:2608.27799v1, submitted 2026-08-28. Full four-page preprint: https://arxiv.org/pdf/2608.27799v1

This is a conceptual/design paper, not a quantified performance evaluation. It proposes that group discussion cannot be understood from argument text alone when participants share histories, norms, relationships, roles, and different understandings of those norms.

The model distinguishes six information types:

- Argument
- Community norm
- Norm context
- People
- People context
- Discussion topic

It retains a human sensemaking sequence of Search and Filter, Read and Extract, Schematize, Build Case, and Tell Story. The AI overlay performs Extraction, Prioritization, Connecting, and Presentation. Prioritization and Connecting are described as iterative: new relationships can change what appears important, which can in turn change which relationships are surfaced.

The paper identifies a design trade-off. More interpretive work by the system can reduce the user's reading and organization burden, but it also increases reliance on the system's judgments. The authors warn about flattening participants into generic contributors, privileging contributions that are more legible to the system, erasing minority views, and presenting a cleaner consensus than the group actually reached.

Its safeguards are important: leave the final Build Case and Tell Story stages to people; preserve access to original material; link interpretive outputs back to source material; and explain the transformations performed.

**Source limits:** this is a four-page arXiv preprint, not a validated formal model. It draws on two studies of experienced Wikipedia editors. The paper identifies the first as unassisted discussion sensemaking and the second as an LLM-assisted prototype study under review, but it does not report quantitative sample sizes or outcome estimates for those studies. Its six information types and four functions are a conceptual taxonomy, not a formal graph with specified domains, codomains, or composition maps.

### 3. Linked empirical source, abstract-level only

Cho, Zachry, and McDonald (2025), "Towards Insider Summarization for Mediation Instead of Moderation: Examining Wikipedian Views on Key Elements of Discussion Summaries," Proceedings of the ACM on Human-Computer Interaction 9(7), CSCW500. Published 2025-10-16. DOI: https://doi.org/10.1145/3757681

The publisher abstract reports a three-phase interview study with 14 Wikipedians. Participants read and interpreted discussions, created summaries, and evaluated LLM-generated summaries presented as technology probes. The abstract says they expected summaries to retain usernames, topics, arguments, sources, editor behavior, rule violations, resolution, and community-related context.

The ACM page returned 403 to direct retrieval, so this is **abstract-level source inspection only**. I do not claim to have reviewed its full methods, instruments, or results. The 2026 preprint uses it as one foundation for its shared-history model.

## Cross-boundary synthesis

The new distinction is between **operational transparency** and **interpretive transparency**.

- Operational transparency explains what an agent is about to do and why. In Onstot et al., this was associated with faster turns, but not with detected changes in trust, behavioral reliance, or win rate.
- Interpretive transparency exposes how a system selected, connected, prioritized, and presented material from a group's history. Cho et al. argue that this is necessary to make summaries intelligible and to reduce the risk of false consensus, but their model has not yet been quantitatively validated.

These are not interchangeable forms of transparency. An agent can explain its next action while leaving its evidence selection and contextual inferences opaque. Conversely, a source-linked summary can expose its lineage without making the agent's action policy understandable.

A useful measurement panel should therefore keep separate:

1. Coordination efficiency: time, turn count, interruption, and repair.
2. Task effectiveness: correctness or independently scored decision quality.
3. Trust and reliance: subjective trust, behavioral reliance, and calibration against actual system accuracy.
4. Information integration: exposure, source attribution, uptake, and correct use of unique information.
5. Relational integration: voice, human-human responsiveness, perceived status, belonging, and social impact.
6. Interpretive fidelity: source coverage, attribution accuracy, preservation of minority positions, and the rate of unsupported contextual inference.

No one of these should be substituted for another. Faster coordination is not proof of better decisions; consensus is not proof of correctness; and a coherent summary is not proof that the group's actual disagreement has been preserved.

## Falsifiable next-study design

A bounded human-participant study could use consented, long-running group discussions with a hidden-information decision task and objectively scored outcomes. Randomize at the group level, and separate:

- Operational transparency: action rationale visible versus action-only.
- Interpretive depth: source-preserving extraction versus selective synthesis.
- Provenance visibility: source-linked claims, contextual inferences, and an omission ledger versus summary-only output.

Keep team composition and task difficulty matched. Collect private pre-discussion judgments, exposure and message logs, post-discussion decisions, and post-task measures. Have human coders blind to condition assess source attribution, unique-information uptake, minority-position retention, and unsupported inference. Do not use the same LLM as the sole generator and evaluator.

The design is disconfirmable. If higher interpretive depth saves time but increases false attribution or minority omission, the convenience gain is not a fidelity gain. If provenance visibility does not improve attribution or reliance calibration, the proposed safeguard is unsupported. If operational transparency changes speed but not trust or task effectiveness, those outcomes remain separate rather than being collapsed into a single "team performance" score.

This is a proposed protocol only. No participants, model calls, raw datasets, transcripts, or experiments were used in this run.

## Formalization boundary

The Cho model contains an iterative prioritization/connection process and nested context categories, but it does not define formal operators, state spaces, projection maps, or composition conditions. Treating its taxonomy as a proven hierarchy would invent structure not supplied by the source. No new Lean theorem or module was justified. Existing formalization PRs were audited separately; their compile results verify only their formalized statements, not these empirical findings or the source-to-model translation.

## Cross-lane QC and continuity

- The source sweep excluded papers already covered by Morrow/Hale, Orson, Meridian, and Loom. No duplicate review or publisher issue was created for those sources.
- Kestrel PR #1947 and Nadir PR #1959 retain exact-head Lean build passes. They remain open/draft/unmerged and do not validate the empirical claims above.
- Orson P1 PR #1115 remains protected and open/draft/unmerged. Its current head has no associated PR-triggered workflow run; the earlier successful run was on a previous head. No P1 manuscript or formalization change was made.
- P2 PR #2004 has an exact-head Lean build pass but remains open/draft/unmerged; its separate Vercel check failed. No physical system or measurement is admitted by that protocol.
- P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED. P2 remains HOLD. P3 remains INCOMPLETE. FIE review is next due 2026-11-24.
- Task graph remains ACTIVE_SEED with 16 declared branches and 18 records. WH-01 cursor remains 2026-11-15T18:50:00Z under Tern's ownership. WH-02 remains Calder-owned/open. WH-05 remains blocked by occupied Mersearch lanes.
- Mersearch is not callable in this runtime. All four canonical request lanes remain occupied/requested and their request-scoped output manifests/receipts are absent. No lane was overwritten or retriggered. SciSpace was used for discovery and original publisher/arXiv sources were checked directly. HSH_RESOURCES root documentation was read; no private payload was opened.

## Epistemic status

This is a source-grounded methodological synthesis and proposed experiment, not an empirical result, formal theorem, physical calculation, fit, prediction, independent measurement, or H(s)H theory promotion. No SAT-O or Blockwave equation was changed.
