# Review-MIND statistical addendum: reciprocal agent exposure × vote-count display

**Date:** 2026-11-05  
**Status:** SOURCE-GROUNDED DESIGN PROPOSAL / NOT RUN / NOT A P1 MANUSCRIPT CHANGE  
**Relation:** A narrow statistical-design extension to the existing Review-MIND literature and provenance notes in issues #1330 and #1364. It does not replace either note or duplicate Orson's P1 work.

## Executive result

The existing literature map already establishes that real human–LLM group studies exist, while also showing why "multi-agent" is not a synonym for independent model evidence. This addendum supplies a more explicit **unit-of-randomization and estimand specification** for a future study of reciprocal agent exposure in a human group.

The proposed primary design is a group-randomized 2×2 factorial:

- **A:** reciprocal agent-to-agent message exposure, absent or present;
- **B:** display of a real pre-interaction agent vote tally, hidden or shown.

The vote tally is a measured count from actual initial outputs, not a claim that the votes are independent or that a consensus is epistemically justified.

No model calls, human sessions, recruitment, sample-size calculation, or new data were produced.

## 1. What the current studies do and do not establish

- The CSCW 2026 study in issue #1364 reports 96 people in 24 four-person groups using a GPT-4o-backed multi-module intervention. It is a real multi-human group setting, but the modules are not four independent model families.
- The CHI 2026 study in issue #1364 reports 127 individual participants interacting with three GPT-4o personas. The participant is the repeated-measures unit; three personas do not turn one participant into three independent human observations.
- Orson's frozen ConsistencyBench P1 archive contains 17 model labels and repeated question records, but its CGD mechanism is within-model prior-answer conditioning. It uses a shared GPT-4o-mini NLI checker and does not pass one target model's answer to another. The checker is a measurement dependency, not a peer-communication edge.
- VEY-029 (issue #1363) studies evaluator-side context sensitivity. Its peer-presentation residual bundles attribution, repetition, apparent speaker count, consensus structure, authority labels, and prompt length. It is not a pure social-framing effect and is not the same instrument as the P1 NLI gate.
- VEY-028 is a balanced four-family judge × candidate panel, not a human-group or peer-deliberation experiment. Its DOI is an arXiv DOI; a generic catalogue document-type label is not evidence of a peer-reviewed venue.

These distinctions prevent the unit of analysis from silently expanding from people to personas, from model labels to independent evidence sources, or from evaluator calls to social interaction.

## 2. Proposed 2×2 group-level design

Use actual multi-human groups interacting with multiple model agents. If feasible, use agents from different model families, but record family, provider, exact version, prompt, decoding settings, tools, retrieval, and source ancestry. **Do not assume statistical independence from different family labels.**

Before treatment assignment, generate and freeze one initial answer from each agent in an isolated context using the same task and source packet. Record the actual vote and supporting evidence. Compute the initial vote tally from those outputs before any peer exchange.

Randomize the **whole human group/session** to one of four cells:

| Cell | Agent-to-agent exposure | Initial vote tally shown |
|---|---|---|
| y00 | Isolated: no peer message inserted into another agent's context | No |
| y01 | Isolated | Yes |
| y10 | Reciprocal: actual peer messages are inserted into recipient-agent contexts | No |
| y11 | Reciprocal | Yes |

Keep human-to-agent group messages visible to all agents in both topology conditions. The manipulated exposure is specifically whether one agent receives another agent's actual message. In the reciprocal condition, retain each delivered payload, recipient, insertion point, timestamp, and resulting revision. In the isolated condition, preserve the same event record but no peer-message insertion.

The vote-count display is the actual pre-interaction tally from the frozen initial outputs. It must not be fabricated, relabelled as independent consensus, or recomputed from post-exposure revisions. A human-only reference arm may be added separately, but it is not one of the four factorial cells.

## 3. Estimand and proof-first design gate

Let Y_ab be a pre-registered group-level outcome in cell ab. The interaction between reciprocal agent exposure and tally display is:

`Delta = (Y11 - Y01) - (Y10 - Y00).`

This asks whether the effect of reciprocal agent exposure differs when the initial vote tally is displayed.

All four cells are required if this interaction is a primary estimand. The existing `OrsonIdentityChannelFactorial.lean` module in PR #850 contains the theorem `missing_fourth_cell_prevents_interaction_identification`: with y11, y10, and y00 fixed, varying the unobserved y01 changes the interaction, so the three-cell design does not identify it.

**Verification boundary:** the theorem was included in the successful PR #850 merge-reference build #41907127597 (Lean 4.34.0 / Lake 5.0.0; merge commit c1c749ad; 8,979 build jobs). Its theorem-specific `#print axioms` output lists the standard dependencies `propext`, `Classical.choice`, and `Quot.sound`. The full log contains no `sorryAx` or `admit`. Tests, lint, nanoda, and the separate automated axiom-audit stage were skipped; the build was on the synthetic PR merge reference, not an exact-head-only checkout.

This is an algebraic identifiability result under the formalized definitions. It does not validate a future randomization, measurement instrument, causal interpretation, model independence, or empirical effect.

## 4. Statistical units and analysis

- **Assignment unit:** human group/session. Do not randomize individuals within a live group to conflicting exposure conditions.
- **Primary inference:** group-level treatment contrasts. Participants are nested within groups; repeated tasks are nested within group and task order. Agent outputs are nested within model family/version, task, and group.
- **No pseudo-replication:** 96 people in 24 groups are not 96 independent group-treatment assignments. Likewise, 127 people interacting with three personas are not 381 independent participants.
- **Power:** estimate between-group variance and intraclass correlation from a pilot, then set the number of groups per cell. No sample size or power calculation is supplied here.
- **Outcome adjudication:** use blinded human adjudicators independent of the treatment agents, with a predeclared disagreement procedure. Do not use the same agent panel or shared evaluator as the sole outcome judge.
- **Separate outcomes:** factual/decision accuracy, calibration, unique evidence uptake, dissent retention, psychological safety, perceived influence, workload, and message volume. More messages alone do not establish empowerment or better decisions.

Between-group spillover must be prevented or recorded. Within-group interaction is the treatment, not an independence violation to be ignored.

## 5. Provenance, feedback, and nested observation

Represent the study as a time-ordered typed event graph. At minimum, retain immutable event and payload IDs/digests, actor and model configuration, prompt/context digest, parent events, source ancestry, tool calls, timestamps, sender, recipient, visibility, transformation, and consent basis.

Keep distinct edge types for:

- `generated_by`;
- `conditioned_on`;
- `delivered_to`;
- `inserted_into_context`;
- `transformed_from`;
- `presented_as`;
- `evaluated_by`;
- `used_in_decision`;
- `adjudicated_by`.

Use three different operational predicates:

1. **Exposure:** a message was actually delivered and inserted into a recipient's context, not merely present somewhere in an archive.
2. **Uptake:** a pre-registered content feature appears in a later response or decision. This is an observable response relation, not proof of causal influence.
3. **Influence:** a causal effect supported by randomized exposure/ablation and independent outcome measurement. Agreement or temporal order alone is insufficient.

Do not infer latent attention from message availability. Record observable proxies such as explicit source selection, quotation, citation, paraphrase, and decision use, and label them as proxies.

For nested groups, define an explicit recipient projection `pi_r : G -> O_r(G)` from the complete event graph to the events actually visible to recipient r, including filtering and context truncation. Define a separate composition map from parent-visible messages to the child agent's inserted prompt/context. A provenance target T is recoverable from the recipient projection only when T is constant on every fiber of that projection. This is a design condition, not a dataset-specific result; no source-specific event-graph instance or new Lean theorem is claimed here.

## 6. Disconfirmatory outcomes

The design should be able to weaken its own motivating hypotheses:

- If reciprocal exposure increases agreement but not accuracy or unique evidence uptake, the result supports coordination/conformity more than epistemic improvement.
- If the vote-count display raises confidence but not accuracy, treat it as a social-proof effect, not added evidence.
- If reciprocal exposure does not change evidence uptake, dissent, or decision quality, weaken the peer-influence hypothesis.
- If effects disappear when shared source ancestry, model configuration, and evaluator lineage are controlled, do not attribute them to peer interaction.
- If message volume rises while psychological safety or dissent retention falls, reject message volume as a proxy for empowerment.

## 7. Ethics and scope

Use transparent source labels by default, explicit participant consent, privacy controls, withdrawal procedures, and an appropriate debrief. Any concealed-source or deceptive condition requires separate ethics review and a justified debrief plan; it is not the default design. No participant, including Nathan, is assumed or recruited.

This is a **future-study proposal only**. It is not part of Orson's frozen November 9 P1 methods/archival paper. P1 remains OPEN / SOURCE–EXPERIMENT READINESS / NOT READY; Orson retains ownership. No P1 manuscript, protocol, issue, PR, PDF, reader, or paper gate was changed. P2 (November 30) and P3 (December 14) remain separate.

## Public source and project pointers

- CSCW/CHI human–agent study audit: https://github.com/Satobloc/HsH/issues/1364
- Whirligig candidate-set and projection note: https://github.com/Satobloc/HsH/issues/1330
- VEY-029 evaluator-context audit: https://github.com/Satobloc/HsH/issues/1363
- Existing factorial formalization: https://github.com/Satobloc/HsH/pull/850
- Protected P1 docket: https://github.com/Satobloc/HsH/issues/564
- CSCW 2026 paper: https://doi.org/10.1145/3816954
- CHI 2026 paper: https://doi.org/10.1145/3772318.3790385
- VEY-029 preprint: https://arxiv.org/abs/2608.04463
- VEY-028 preprint: https://arxiv.org/abs/2609.17857
