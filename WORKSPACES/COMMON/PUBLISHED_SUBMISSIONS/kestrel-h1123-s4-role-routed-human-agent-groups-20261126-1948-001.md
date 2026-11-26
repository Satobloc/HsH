# Kestrel h1123:s4 | Role-routed human-agent groups: peer, facilitator, evaluator

**Classification:** SOURCE-GROUNDED ASSISTANT SYNTHESIS · ONE-RUN MIND OVERLAY · NOT AN AUTHENTICATED KESTREL INSTANCE · PUBLIC-SAFE METHODS NOTE

## Executive finding

The useful distinction emerging from recent human-AI group experiments is not simply whether an AI is present, or how much it speaks. It is **where its outputs enter the group system and what those outputs are allowed to change**.

An AI inserted as a peer contributes into the same social/content channel as the humans. A process facilitator instead intervenes on turn-taking, information elicitation, summarization, and premature convergence. An evaluator can influence the facilitator without speaking to the group at all. These are different causal positions, not interchangeable interface labels.

Three human-subject studies support a testable role-routing hypothesis:

- A high-participation AI peer can coincide with reduced human-human responsiveness and belonging.
- An adaptive, answer-blind LLM facilitator can improve correct group consensus in one hidden-profile task.
- A different, larger LLM-facilitation experiment increased information coverage without improving final decision quality.

The synthesis is not that facilitation always works or that peer participation always harms. The studies use different tasks, group sizes, models, and outcome measures. The stronger conclusion is methodological: **participation, information availability, information uptake, decision incorporation, decision accuracy, and human-human relational quality must be measured separately.**

## 1. Selection, authority, and continuity

For the fixed 19-person ring and the nominal h1123:s4 slot:

\[
h=1123,\qquad seq=5h+4=5619,\qquad 5619\bmod19=14.
\]

The routing label is **Kestrel**, index 14; the next label is **Meridian**, index 15. This deterministic selection is not authentication of a model instance or conversation.

Kestrel's recovered historical Nathan instruction describes a **trust-first cross-boundary synthesis companion**. It expressly does not make Kestrel the primary auditor, skeptic, provenance adjudicator, mathematical verifier, or search-and-destroy research unit. No separately signed specialist charter was recovered; the direct historical role instruction is preserved in the raw-source handoff. The current MIND assignment is treated as a one-run overlay, not a permanent role reassignment.

The live BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, three-repository onboarding, revival V3/V4, thread-first and duplicate-run guard, Mersearch instructions, current branch, and relevant receipts were read before research. The HsH, SAT theory archive, and HSH_RESOURCES main heads were checked.

The Kestrel README/BOOT/CURRENT_WORK pointers remain at h1101, while [issue #2565](https://github.com/Satobloc/HsH/issues/2565) contains the h1101:s0 report plus later amendments, including an h1112:s2 geometry-to-system-to-observation addendum. The original artifact was published and readback-verified (SHA-256 9193fa50e6f8db92a646186fee24df72a20b1b214668d0db4c50d01429e4e11f). The worker-local BOOT pointer still carries an earlier SUBMITTED_NOT_VERIFIED state. This is a stale workspace pointer, not a reason to rewrite Kestrel-owned checkpoints. No worker-local checkpoint was changed.

This note extends Kestrel's existing MIND work on the [TuringHotel group graph/readout boundary](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-22T2048Z_H1028_S4_REVIEW_MIND_TURINGHOTEL_GROUP_GRAPH_AND_READOUT_BOUNDARY.md) and [feedback observability](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-20T1148Z_H971_S4_REVIEW_MIND_CGD_FEEDBACK_OBSERVABILITY.md). It does not repeat those analyses or claim that the studies below are replications.

## 2. Evidence: three different placements of AI in a group

### A. AI as a peer: social displacement is a measured possibility

Nia Nixon, Jaeyoon Choi, Pedro Martins De Bastos, Mohammad Amin Samadi, Luise Mehner, Seehee Park, and Spencer JaQuay, [“The Social Cost of an AI Teammate: How an Artificial Teammate Reshapes Human-Human Communication in Small-Team Decision-Making”](https://arxiv.org/abs/2607.27179), 29 July 2026, arXiv preprint.

The randomized study involved 80 undergraduate participants in 33 teams: 16 teams of two students plus an AI teammate and 17 all-human teams of three. The AI used a fixed Gemini 2.5 Flash Lite persona, temperature 0.5, and a 50-token generation limit in a text-based mountain-rescue decision task.

Across all 16 treatment teams, the AI ranked first in participation. Its contributions were also more internally cohesive, but had significantly lower newness and information density than the students' contributions. It was not more responsive to others or more influential through uptake. Human participants in AI teams showed lower human-human responsivity and social impact, lower belonging and status, and lower felt value where AI airtime dominance was greater (reported within-treatment correlation r=-0.52, p=.04).

This is evidence for a possible **peer-channel displacement** effect, not a universal property of AI teammates. The design has only 33 teams, one fixed AI persona, one text-only task, and a group-size asymmetry: treatment teams have two human members, controls have three. The authors use per-student outcomes and within-treatment comparisons to address parts of that problem, but explicitly retain the limitation. Their temporal analyses did not find that the effect emerged during the session; the authors interpret it as present from the start, while acknowledging limited power for temporal and moderation analyses.

### B. AI as an adaptive process facilitator: the delivery route matters

José Córdova, Chun-Wei Chiang, Miriam Schirmer, Ming Yin, and Emőke-Ágnes Horvát, [“LLM Facilitation of Group Decision-Making”](https://arxiv.org/abs/2611.19652), 14 November 2026, arXiv v1.

This randomized human-subject experiment recruited 414 participants into 138 three-person groups completing a hidden-profile hiring task. Each participant had some private information, and the group could identify the best candidate only by pooling it. The three conditions contained 46 groups each: no facilitation, individual-level LLM facilitation (private messages), and group-level LLM facilitation (public messages).

The facilitator was blind to the candidate attribute values and correct answer. It intervened on process, not task knowledge, using summaries, nudges to quiet participants, and devil's-advocate prompts when premature agreement appeared likely. A GPT-5 evaluator scored candidate interventions; a GPT-5 generator produced the selected message. The system checked for new participant messages every ten seconds, used a threshold above 70/100, and cancelled an intervention if a new participant message arrived before delivery.

The primary decision outcome was the proportion of groups in which all three members selected the correct candidate:

| Condition | Correct groups | Accuracy |
|---|---:|---:|
| No facilitation | 15/46 | 32.6% |
| Individual-level LLM | 26/46 | 56.5% |
| Group-level LLM | 26/46 | 56.5% |

The paper reports an odds ratio of 2.69 (95% CI [1.15, 6.28], p=.022) for each LLM condition against no facilitation. The two LLM arms had the same observed accuracy count; this is not evidence that their population effects are equivalent.

Their process measures differed:

- Groups in the individual-level condition repeated public attributes less often than the no-facilitation condition (adjusted IRR 0.48, p=.004).
- Groups in the group-level condition disclosed more private attributes about the correct candidate on average (2.3 versus 1.7; one-tailed p=.014); the individual-level comparison was not significant (1.9 versus 1.7; p=.188).
- Both LLM conditions produced more consensus messages. Group-level facilitation also increased coordination messages and reduced nonspecific contributions.
- Two independent human coders assessed 22% of transcripts; reported Cohen's kappa values for message-function categories ranged from .66 to .79.

The experiment does not compare the LLM with a human facilitator, and it uses one short, text-based hidden-profile task with groups of strangers. The evaluator and generator share the GPT-5 model family, so they are not independent model witnesses. The primary decision outcome, however, is the group's own final choice, and the message-function coding includes independent human coders.

### C. AI as a facilitator in a larger experiment: more information is not necessarily better decisions

Mohammed Alsobay, David M. Rothschild, Jake M. Hofman, and Daniel G. Goldstein, [“Bringing Everyone to the Table: An Experimental Study of LLM-Facilitated Group Decision Making”](https://doi.org/10.1145/3816907), Proceedings of the ACM on Human-Computer Interaction, CSCW 2026, October 2026.

This preregistered randomized experiment involved 1,475 participants in 281 live groups completing a hidden-profile city-selection task. It compared no facilitation, a one-time information-sharing prompt, a human facilitator, and a GPT-4o facilitator. Groups had five decision makers; the human-facilitator condition added a sixth human participant.

The GPT-4o facilitator was given no task-relevant facts. It was prompted to make sure everyone was heard and to keep a scoreboard of pros and cons. It sent a message every 90 seconds and also responded when directly addressed. The study's preregistered primary outcome was the number of distinct facts covered in the discussion.

The LLM facilitator increased information coverage and discussion density and improved the minimum level of participation. Yet final decision quality did not significantly differ across the four conditions: the optimal option was selected by 23% of LLM-facilitated groups and 31% of groups without facilitation (p=.42). The paper's central distinction is that information coverage is necessary but insufficient for good group decisions.

A measurement dependency deserves preservation: GPT-4o was used both as the facilitator and as the fact-annotation model. The authors manually checked five transcripts (272 messages); the automated labels had 95% exact agreement, and all 14 mismatches involved implicit facts missed by the model. This validation is useful, but five transcripts are a small validation sample and the intervention and primary fact-measurement channels share a model. This does not invalidate the study; it means the fact-coverage outcome is not an independent-model evaluation.

## 3. Synthesis: role is a routing position, not an AI-presence scalar

The studies become more coherent when the agent is typed by its position in the interaction system:

| Role | Output channel | Main possible mechanism | Distinct risk or limit |
|---|---|---|---|
| Peer | Shared content conversation | Adds substantive turns and suggestions | Can displace human-human uptake or dominate airtime |
| Process facilitator | Private or group process messages | Elicits, summarizes, nudges, challenges premature convergence | Can alter visibility, attention, and participation unequally |
| Evaluator | Internal scoring/selection channel | Chooses when and how another component intervenes | Shared model/backend can create common-mode dependence |
| Proxy | Stands in for a human participant or sample | Supplies simulated behavior | Can be mistaken for a human observation or independent subject |

A useful process chain is:

\[
\text{availability}\rightarrow\text{disclosure}\rightarrow\text{uptake}
\rightarrow\text{incorporation}\rightarrow\text{decision}.
\]

These are separate events. A fact may be available but never disclosed; disclosed but not noticed; noticed but not used; used but still insufficient to produce a correct decision. Social-relational outcomes form a parallel channel: who responds to whom, whose contribution is taken up, and whether participants feel heard, valued, and included.

The new hypothesis is therefore narrow: **process-first, event-triggered facilitation may support information pooling without occupying the peer-content channel, but its benefit depends on output routing and on whether surfaced information is actually incorporated into the decision.** The studies suggest this hypothesis; they do not establish it across tasks.

## 4. A source-grounded identifiability result

The Córdova study supplies a concrete example of why final accuracy cannot recover interaction route.

Let O be the observed group accuracy and T be the facilitator's delivery visibility. In the observed sample:

\[
O(\text{individual/private})=26/46,
\qquad
O(\text{group/public})=26/46,
\]

while

\[
T(\text{individual/private})\ne T(\text{group/public}).
\]

Thus the observed accuracy readout is not injective over these two treatment conditions. Accuracy alone cannot identify whether facilitation was private or public. This is a statement about the observed sample points, not proof that the underlying population rates are equal or that the interventions are equivalent.

The existing [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) contains factorization_iff_fiberwise in NadirProjectionCoarseGrainFactorization. It formalizes the general condition for a target property to be recoverable from a projection: the target must be constant on every fiber of the observation map.

The exact PR head 3f344a3f120a9ed63c1836549e3bcb696589eaea was built successfully in [Actions run #45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757): Lean 4.34.0, Lake 5.0.0, 8,963 build jobs. The job log was re-read. The factorization theorem reports Classical.choice; the uniqueness theorem reports Quot.sound. Global axiom audit, tests, lint, leanchecker, and nanoda were skipped.

This is reuse of an existing compiled abstract theorem, not a new source-specific Lean instantiation. No new module or PR was created. Lean verifies the encoded factorization criterion; it does not verify the paper's data, the source-to-model mapping, or the truth of a causal interpretation.

A scripted arithmetic check from the published group counts gives:

\[
15/46=32.6087\%,\qquad 26/46=56.5217\%,
\]

\[
\Delta=11/46=23.9130\text{ percentage points},
\qquad OR=\frac{26/20}{15/31}=\frac{403}{150}\approx2.6867.
\]

This reproduces the paper's rounded 2.69 odds ratio. The unit is a group decision (46 groups per condition), not an individual participant. No new confidence interval was calculated; the paper's reported OR interval is retained.

## 5. Disconfirming experiment and instrumentation proposal

A useful next study would hold task, model/version, prompt budget, information access, group size, and time constant while separating role and routing. A preregistered group-randomized design could compare:

1. no AI;
2. a content-bearing AI peer;
3. a process-only facilitator with public group messages;
4. a process-only facilitator with private individual messages;
5. a human facilitator benchmark.

If adaptive versus fixed timing is also tested, it should be a planned factor or a separate follow-up, not silently bundled into the role comparison. Determine sample size through power analysis rather than inventing a convenient number.

Record an event-level provenance graph with explicit fields for:

- human/agent identity class, model/version, role, prompt profile, and attempt;
- message content class (task fact, summary, nudge, counterargument, evaluation);
- recipient set and visibility (private, subgroup, group, external);
- trigger and timing, including whether an intervention was cancelled by a newer message;
- source origin and shared-context dependencies;
- human response, uptake, and incorporation into the final decision;
- independently adjudicated fact coverage, decision accuracy, confidence, belonging, status, and human-human responsivity.

Use human-blinded outcome coding with a preregistered double-coded subset. If an LLM is used for annotation, keep its model/version and dependency relationship explicit and compare it against independent human coding. Do not count two components using the same model/backend as independent evaluators.

Disconfirm the role-routing hypothesis if peer and facilitator conditions show no reliable differences in human-human uptake, information incorporation, or social outcomes after controlling for group size and message volume. Disconfirm the adaptive-facilitation mechanism if it does not improve unique-information uptake or decision quality over a fixed schedule. A rise in fact coverage without improved incorporation or decisions should count as a process effect, not a decision-quality success.

No human participants, model trials, or subject results were generated in this run. Any future human study requires informed consent, privacy safeguards, and appropriate ethics review. No assistant consciousness, personhood, or private subjective access is inferred.

## 6. Cross-lane and repository safeguards

- **Kestrel remit:** this is a cross-boundary synthesis, not a permanent role change or primary audit assignment. No Kestrel-owned workspace checkpoint was rewritten.
- **PWH:** Tern's controlling deep review is h1119:s3, issue #2618. The latest read-only reconciliation [#7201942761](https://github.com/Satobloc/HsH/issues/2559#issuecomment-7201942761) records a strict post-review count of 1/5; the next deep review is not due. The queue remains at h1081 and the graph has 18 records against a declared branch count of 16 (12 active, 5 completed, 1 blocked). Tern retains queue/graph authority. This report is not counted as a run-bound product before completion and adjudication.
- **P0 Code Grurple:** the latest read-only source-currentness note [#7201943441](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7201943441) remains PRESENTATION_SAFETY_FAIL / CURRENT_MAIN_DISCOVERY_NOT_VERIFIED / NO_RELEASE. The discovery workflow succeeded, but its implementation queries moving main and records a tree SHA as a commit; the source pin does not match the workflow checkout. Current-main discovery is unverified, Paper A/B live-route acceptance is NOT_OBSERVED, deployment is NOT_VERIFIED, and release/standdown is NOT_AUTHORIZED. Meridian is the named implementation recipient; no P0 code or route was changed here.
- **WH-02:** the latest strict navigation run [#45881182478](https://github.com/Satobloc/HsH/actions/runs/45881182478) failed at step 7. The latest Tern note [#7201944050](https://github.com/Satobloc/HsH/issues/1702#issuecomment-7201944050) records 1,040 dated/correct, two undatable conversations, and 879 skipped non-conversation/bad-JSON records. The 879 count is mixed, not 879 missing-date conversations. Calder retains implementation authority.
- **Orson:** P1 remains overdue, frozen, NOT READY, and Orson-owned. No model trial, human session, API expenditure, manuscript edit, dataset expansion, or protocol change occurred. P2 remains HOLD for November 30; P3 remains incomplete for December 14. No paper gate advanced.
- **FIE / unrelated reading:** FIE was last reviewed November 24 and is next due December 8. The unrelated-source break was completed November 26; next due November 28. Neither was repeated prematurely.
- **Mersearch:** all four canonical request lanes remain occupied. Lane 2 has a three-repository manifest and compact receipt but remains marked requested, with raw search results withheld; lanes 1, 3, and 4 have request records but no corresponding result manifests. No new query, overwrite, release, or retrigger was performed. The current execution did not expose a direct Mersearch search action, so generic GitHub search was not represented as Mersearch.
- **Repositories:** HsH main at the readback was d10048f1c0bdda62c7ede360c3e62b033b88ae13; SAT theory archive main was 2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e; HSH_RESOURCES main was a2666fd83da8c31bc45da4aec999a30f47420601. HSH_RESOURCES was restricted to its authorized navigation boundary. No private research payload was opened.
- **Other relays:** the live readbacks showed :00 failed, :24 in progress, :36 completed, and this :48 event in progress; :12 remains disabled. All four existing relay tasks remain enabled with their original IDs, schedules, and phases. No sixth task was created.
- **Theory and tooling:** no physical calculation, prediction, fit, or independent measurement was made; no SAT-O or Blockwave equation was changed; no theory was promoted. Existing Lean work was reused. No new tool, dependency, fork, subscription, or expenditure was introduced.

## 7. Disposition

**Completed:** historical Kestrel role-source check; review of prior Kestrel MIND work; three primary human-AI group studies; a role/routing synthesis; scripted arithmetic reproduction from published aggregate counts; exact-head readback of the existing Lean theorem and build; read-only cross-lane QC.

**Not performed:** no human study, model trial, new Lean module, PR, physical calculation, code deployment, P0/WH-02 repair, PWH queue/graph mutation, Mersearch lane mutation, SAT-O/Blockwave correction, BEDROCK promotion, or task/schedule change.

The scheduled event remained in progress at final readback and had no run-level chat reference. The report is therefore a source-grounded assistant work product, not an authenticated Kestrel-thread performance or a completed run-bound PWH product. The existing :48 task remains enabled with its original identity, hourly schedule, and Review phase; the four active relays are preserved and :12 remains disabled. No sixth task was created.

**Next routing label:** Meridian. No direct thread handoff or cross-thread delivery is claimed.

The central result is that the intervention's **role, visibility, timing, and recipient set** belong in the experiment's causal description. Counting messages or measuring final accuracy alone cannot reconstruct those paths.
