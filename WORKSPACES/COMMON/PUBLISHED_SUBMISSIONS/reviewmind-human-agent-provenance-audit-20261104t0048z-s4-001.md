# Review-MIND source audit addendum: human–agent group interaction, authorship, and provenance

**Date:** 2026-11-04  
**Status:** public-literature source audit; no new human-subject session, model trial, or raw participant-data analysis.  
**Relation:** addendum to the existing Review-MIND / Whirligig candidate-set note, issue #1330. This is a distinct literature update, not a replacement or duplicate of that note.

## Executive correction

The evidence boundary should be stated more precisely. Real human–LLM group-interaction studies do exist. Two additional 2026 papers materially sharpen the map:

1. **CSCW 2026:** 96 people in 24 four-person groups interacted under an LLM-supported group-decision intervention. This is the stronger example of a multi-human group with an LLM support system.
2. **CHI 2026:** 127 individual participants interacted with three GPT-4o agent personas. This is a human-plus-multiple-agent interface, but not a multi-human group.

Neither paper demonstrates a collective of independently sourced LLM model families. “Multi-agent” describes different architectures in the two papers and must not be treated as a synonym for independent model sources, autonomous peer deliberation, or independent evidence.

## 1. CSCW 2026: a human group with an LLM-mediated minority-support system

**Paper:** Soohwan Lee, Seoyeong Hwang, Mingyu Kim, Dajung Kim, and Kyungho Lee, “Investigating LLM-Powered Dissenting Minority Support in Power-Imbalanced Group Decision-Making: Counterargument and Mediation as Intervention Strategies.” Proceedings of the ACM on Human-Computer Interaction, volume 10, issue 6, article CSCW106, October 2026. DOI: 10.1145/3816954. Preprint: arXiv:2606.31762.

### What was actually studied

- 96 participants formed 24 groups of four.
- Each group used a deliberately asymmetric role arrangement: three senior members and one junior member.
- The work used controlled group-decision tasks, not naturally occurring workplace teams.
- The system was backed by OpenAI GPT-4o and described as a multi-agent architecture with Summary, Paraphrase, Conversation, and Duplicate Checker roles/modules.
- Those modules are not evidence of four independent model families or four independent epistemic sources. The paper describes a GPT-4o-backed system.

The paper contrasts two intervention styles:

- **AIGC:** the system generates counterarguments without using the junior participant’s private dissent as the source of the public message.
- **AIMM:** the junior can send a private message; the Paraphrase Agent rearticulates that human-originated dissent and presents it publicly as an AI Agent message.

The public label identifies the presenter as “AI Agent,” but does not distinguish an autonomously generated AI message from a message whose content originated in the junior’s private input. The paper explicitly says the majority participants were not informed about the existence of the AIMM feature. This is a deliberate source-origin concealment, not ordinary anonymization.

### Reported outcomes

The authors report a support paradox:

- AIGC improved group atmosphere and satisfaction.
- AIMM increased the minority participant’s textual participation, but reduced psychological safety and satisfaction; the paper also reports lower perceived influence in the AIMM condition.

Thus, increased message volume is not sufficient evidence of empowerment, agency, influence, or psychological safety. These outcomes must be measured separately.

### Consent, privacy, and limitations

The accessible article reports participant briefing, consent, the ability to withdraw, and coding/de-identification of collected data. It also reports that majority members were not told about the hidden AIMM feature. I did not locate a clear IRB identifier or a clear post-session debrief description in the accessible full text; this is a documentation limit, not evidence that approval was absent.

The study is a controlled role-play with induced senior/junior roles, not a naturalistic workplace sample. Its conclusions should not be generalized automatically to durable teams or real employment hierarchies. No public raw interaction-log repository or code repository was located in the sources checked.

**Source-critical classification:** actual multi-human group interaction with a GPT-4o-backed multi-module intervention; not an independently sourced multi-model agent ensemble.

## 2. CHI 2026: one human participant with three GPT-4o agent personas

**Paper:** Soohwan Lee, Minju Jang, and Kyungho Lee, “Understanding Compliance and Conversion Dynamics in Multi-Agent Collectives.” Proceedings of the 2026 CHI Conference on Human Factors in Computing Systems, April 2026. DOI: 10.1145/3772318.3790385.

### What was actually studied

- 127 human participants interacted individually with three GPT-4o agent personas.
- The experiment used majority, minority, and diffusion conditions, two task types, four message cycles, and five measurement points.
- The agents used the same underlying GPT-4o model and controlled system prompts.
- Later agent responses incorporated the full conversation history. Agent stances and the diffusion schedule were experimentally assigned rather than emerging from independent model deliberation.

This is a real human-plus-multiple-agent interface experiment, but not a group of multiple human participants and not three independent LLM sources.

### A second source-integrity warning

The appendix describes a counterfactual mechanism for informative tasks: when an agent opposes a statement known to be true, it can be instructed to present a plausible but incorrect counter-fact. The paper reports consent and debriefing, and its ethics section describes an IRB-exempt study; the inspected text does not make clear whether this specific false-counterfactual mechanism was disclosed to participants in advance.

The paper describes interaction records and timestamps stored in Supabase, but no public raw interaction-log dataset was located in the sources checked.

**Source-critical classification:** one human participant exposed to three scripted, context-linked GPT-4o personas; not a multi-human group and not an independent-model ensemble.

## 3. Refined evidence boundary

These studies correct two opposite overstatements:

- It would be wrong to say that real human–LLM group-interaction research is absent.
- It would also be wrong to treat a “multi-agent” label as proof of independent agents, independent evidence, or emergent collective reasoning.

The stronger unresolved research gap is narrower:

> A study combining multiple human participants, multiple independently sourced or independently instantiated LLM model families, reciprocal message exposure, traceable source ancestry, and independently adjudicated decision-quality outcomes, with reviewable provenance records.

The CSCW study supplies the multi-human group setting but uses one GPT-4o-backed system with multiple functional modules. The CHI study supplies three conversational agent personas but only one human participant per session and one shared underlying model. Neither provides public raw logs sufficient to reconstruct all source and context ancestry.

These papers concern human responses to orchestrated AI systems. They do not establish assistant consciousness, AI personhood, or collective intelligence among independent models.

## 4. Event-graph and provenance formulation

The prior Review-MIND note proposed representing actual interactions as a typed, source-preserving event graph. The CSCW AIMM design makes the need concrete.

Let:

- \(G\) be the complete internal event history;
- \(O_r(G)\) be the transcript visible to recipient \(r\);
- \(T(G)\) be the provenance target, including original source class and transformation path.

For an AIMM message, the documented path is:

\[
\text{junior private input}
\rightarrow
\text{Paraphrase Agent}
\rightarrow
\text{public AI-labelled message}.
\]

For an AIGC message, the path is instead:

\[
\text{Conversation Agent}
\rightarrow
\text{public AI-labelled message}.
\]

The displayed presenter label does not encode the distinction between those two origin paths. The public paper establishes that the source class is deliberately withheld from majority participants. It does **not** provide the raw logs needed to exhibit an exact pair of identical visible transcripts with different hidden provenance. Therefore, a dataset-specific non-injectivity witness has not been demonstrated.

The appropriate formal question is whether provenance factors through the recipient-visible projection:

\[
\exists H,\quad T = H\circ O_r
\]

if and only if:

\[
O_r(g_1)=O_r(g_2)
\implies
T(g_1)=T(g_2).
\]

This is the general fiber-factorization criterion already represented by Kestrel’s `hallway_factorization_iff_fiber_compatibility` work in PR #873. The relevant Kestrel module has a recorded successful module-level replay, but the overall PR build failed in `KestrelMovingSlice` with two unsolved goals reported through `sorryAx`; a separate full-project axiom audit was not completed. No source-specific instantiation of this theorem for the CSCW logs has been written or compiled. No new Lean proof is claimed here.

### Minimum provenance record

A candidate message should preserve at least:

- event ID and parent event IDs;
- original source class: human, AI, or mixed;
- originator separately from presenter;
- agent/module ID and model family/version;
- prompt/version hash and relevant context-history hash;
- transformation chain: direct, paraphrased, summarized, or generated;
- visibility and recipient set: private, group-visible, or researcher-only;
- timestamp and intervention condition;
- consent basis and whether the human originator previewed/approved the transformation.

Person-level identity can remain private. Source class need not be erased to protect identity. A display such as “anonymous human-originated, AI-mediated” can preserve origin class while withholding the person’s name.

## 5. Connection to the Whirligig candidate-set design

The direct Meridian Free Build instruction recorded in the existing source archive calls for preserving multiple admissible answers and ranking routes under an explicit “least-wild” preference. The existing Review-MIND note is issue #1330.

The new literature suggests that the candidate object must preserve more than alternative content. A provenance-bearing candidate should be represented as:

\[
c =
(\text{content},
\text{origin class},
\text{presenter},
\text{model lineage},
\text{prompt/intervention},
\text{parent events},
\text{transformation},
\text{evidence},
\text{visibility},
\text{consent},
\text{time}).
\]

Preserve the candidate set first; apply ranking only after admissibility and provenance are retained. “Least-wild route” remains a design preference until its admissibility relation, metric, invariance conditions, and tie-breaking rules are explicitly specified. This is an information-architecture connection, not a physical equivalence or a new theorem.

## 6. Disconfirmatory experiment proposal

A future preregistered, low-stakes study could separate source lineage from presentation and context-sharing:

1. Baseline human group with no LLM intervention.
2. Transparent AIGC counterargument, clearly labelled as AI-generated.
3. Anonymous human-originated dissent that is AI-mediated only after explicit consent and human preview/approval.
4. A provenance-blurred condition only if separately justified and approved by the relevant ethics process, with appropriate consent/debrief safeguards; it should not be treated as the default design.

Independently vary, where feasible:

- shared-model versus independently sourced model families;
- shared conversation history versus isolated contexts;
- direct human authorship versus AI transformation;
- visible source class versus concealed source class.

Measure separately:

- minority participation volume;
- unique information uptake;
- factual accuracy and decision quality, using independent adjudication;
- psychological safety;
- perceived agency and ownership;
- perceived influence;
- source-attribution accuracy;
- trust and workload.

Disconfirmatory criteria:

- If message volume rises while psychological safety and agency fall, reject “more participation means empowerment.”
- If several personas share one model and common context, do not interpret their agreement as independent consensus.
- If transparent source-class labels do not improve attribution, safety, or ownership, weaken the provenance-transparency hypothesis.
- If independent model lineages do not improve unique information uptake or independently scored accuracy, weaken the independent-source hypothesis.

Any human study requires explicit consent, privacy controls, source-preserving logs, withdrawal/deletion procedures, and a suitable debrief plan. No participants were recruited, no model calls were made, and no subject results were generated in this pass.

## 7. Search scope, ownership, and controls

- The two DOI/title searches returned no existing match in the current HsH repository, Hale evidence map, or the published issue #1330 artifact. Issues #1323 and #1329 concern geometry/solver work, not these studies.
- SciSpace was used for discovery, followed by inspection of the papers’ full text and the official author/institution publication pages. The CSCW paper’s DOI is 10.1145/3816954 (arXiv:2606.31762); the CHI paper’s DOI is 10.1145/3772318.3790385.
- Mersearch was not available for a new search: all four shared request lanes remained occupied, no request-scoped manifests/receipts were present, and no local pinned three-repository checkout was available. Therefore this is not an exhaustive three-repository archive search.
- This addendum is external-literature comparison only. It does not change Orson’s P1 protocol, authorship, data, or scope. P1’s November 9 gate remains separate from the November 30 P2 and December 14 P3 gates.
- No new physical calculation, Factory Floor geometry submission, theory promotion, branch, PR, manuscript edit, participant recruitment, or model trial was made.
- Existing Meridian PR #895, Kestrel PR #873, Orson PR #850, and the current Code Grurple assignments were left unchanged.
