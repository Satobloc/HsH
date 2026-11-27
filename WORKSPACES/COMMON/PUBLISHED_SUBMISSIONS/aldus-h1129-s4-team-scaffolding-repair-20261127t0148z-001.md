# Human-team scaffolding, repair closure, and common-ground measurement

**Run key:** `REVROT3-19-20261011:1129:s4`  
**Nominal slot:** `2026-11-27T01:48:00Z`  
**Selected routing label:** Aldus (index 6)  
**Next ring label:** Calder (index 7)  
**Attribution:** assistant-level, source-grounded reconstruction under the deterministic routing label; no authenticated current Aldus thread or Aldus participation is claimed.

## Executive finding

Two different intervention questions are being conflated in much human-agent teamwork discussion:

1. **What information should an AI teammate provide?** A direct solution, a memory scaffold, or only task-essential information?
2. **How does the team establish that a correction has actually been understood and incorporated?** Acknowledgment, state update, action verification, and acceptance are distinct events.

The evidence reviewed suggests that direct answers can help immediate disruption recovery, while memory scaffolding can support some team-process and perceived shared-knowledge measures. Neither alone establishes durable team learning or verified common ground. A live GPT-4.1 human-AI study also documents failures to clarify, repair, and update after corrections. The resulting research opportunity is a controlled study of assistance policy crossed with explicit grounding-repair behavior, with post-AI transfer as a separate outcome.

This is a human-factors/methods note, **not** Orson's P1 LLM-cognition paper, not a new administered model study, and not a claim about assistant consciousness or personhood.

## 1. Source and role preflight

The live HsH `main` was `3e83bbd7ec6986a33113690ce2f8018b3ab3bbee` at initial source review and advanced to `04a888b5495c42590c7ea5b40a6fd0bd2aff36cd` during this run. The latter is eight commits ahead; the intervening HsH changes were generated discovery output and Mira's Common receipt/handoff records, not theory or application code.

Read/reviewed: the full 768-line BEDROCK; October 26 Steering Charter; Three Paper Campaign; three-repository onboarding; Revival Rotation V3; recipient-thread routing; the V4 not-found/revival control; current task graph, upkeep protocol, PWH queue, current automation roster, Aldus BOOT/CURRENT_WORK and latest canonical receipt; and the relevant predecessor packet.

Aldus's historical authority is grounded in the raw conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a` (47 user-role messages). Direct user messages `939e981d-72ec-451b-81a3-f0a07b3a2c48` (2026-09-08T03:56:33.466Z) and `fcff5c18-85c4-4efc-b7e5-df7ee20c0646` (2026-09-08T04:17:24.363Z) establish a broad cross-reading remit and the explicit aim of combining information not usually combined. Message `6f93a66b-34cb-484f-a3ce-1e5ade380065` (2026-09-08T08:41:25.964Z) discusses varying the intersections, order, lenses, artifacts, and controls across two books and two shorter explorations. These are direct-user working instructions, **not** a separately signed specialist charter.

The earlier Aldus MIND work already covers the 30+1 conditioning comparison, cross-reading configuration, semantic inertia, source-genre controls, and a proposed factorial design: [H901 experiment design #1902](https://github.com/Satobloc/HsH/issues/1902), [Aldus MIND report #2577](https://github.com/Satobloc/HsH/issues/2577), and [context-diversity/source-genre addendum #2590](https://github.com/Satobloc/HsH/issues/2590). Nadir's [Thinking HATs report #2639](https://github.com/Satobloc/HsH/issues/2639) and Meridian's [human-learning/shared-memory supplement #2643](https://github.com/Satobloc/HsH/issues/2643) are also prior work. This run deliberately does **not** repeat those experiments or repackage their findings.

The current Aldus workspace remains at its h1118:s2 geometry/source-correction checkpoint. It was not rewritten or reassigned. No authenticated current Aldus thread was established.

## 2. Two complementary primary studies

### A. Information-sharing policy in three-person teams

Schelble et al., [“Should AI Teammates Give All the Answers? Examining the Role of Different AI Information-Sharing Techniques in Human-Autonomy Teaming”](https://doi.org/10.1080/10447318.2025.2528988), *International Journal of Human–Computer Interaction*.

This is a peer-reviewed human-autonomy teaming study with 62 analyzed participants in 31 two-human teams, after six of 37 recruited teams were excluded. Teams performed four 20-minute UAV missions with two six-minute transition discussions. The study compared:

- **Control:** task-essential information only.
- **ATM (augmenting team memory):** reminders and task information intended to help teammates plan and find solutions themselves.
- **IET (intra/extra-team information changes):** alerts plus direct information or solutions when a teammate's display lost information.

**Critical source qualification:** the “AI teammate” was a Wizard-of-Oz simulation. A confederate researcher enacted scripted actions and chat, designed to approximate the speed and accuracy participants expected from contemporary LLMs. There was no live LLM generating the study's teammate behavior. The experiment therefore supports claims about human teams' responses to controlled information-sharing policies, not claims about actual LLM cognition or model behavior.

The authors report that IET gave teams the best chance of overcoming the engineered situation-awareness roadblock, but reduced human coordinated-perception/action communication and did not produce the strongest perceived situation-awareness/shared-mental-model results in some comparisons. ATM was the next-best condition for overcoming the roadblock versus control and supported higher perceived shared-mental-model and situation-awareness ratings than control in some instances. Teams that interacted with the scripted AI in the second transition phase outperformed those that interacted in the first, although the authors describe the explanation as uncertain.

The study measured task performance, team communication/coordination, perceived situation awareness and perceived shared mental model. It did **not** test whether humans retained the learned material or transferred it to a later no-AI task. Its 31 teams, one UAV simulation, university sample and Wizard-of-Oz implementation limit generalization.

### B. Common-ground repair with a live LLM

Poelitz, Doshi-Velez and Lindley, [“A Benchmark to Assess Common Ground in Human-AI Collaboration”](https://arxiv.org/abs/2602.21337), arXiv:2602.21337v1, submitted 2026-02-24. This is a preprint, not a peer-reviewed publication in the version reviewed.

The confirmatory study used 40 Prolific participants and one fixed GPT-4.1 model in a dyadic human-AI puzzle task. Its 2×2 design crossed AI role (Helper or Worker) with task-state visibility (shared or non-shared view). Participants completed a practice task and four trials.

Key reported findings:

- Shared view improved exact puzzle success relative to non-shared view (`χ²(1)=11.57`, `p<.001`).
- Accuracy did not improve significantly across trials in either condition; the expected learning effect was not observed.
- Overall communication effort did not differ significantly between view conditions (`U=186`, `p=.65`).
- In the non-shared condition, the AI Helper's declining word count appeared to reflect reduced clarification/grounding behavior, not greater coordination efficiency.
- The authors describe GPT-4.1 failing at times to ask for clarification, build on clarification requests, or update task assumptions after repairs. Human participants also reduced repair effort over time; the authors offer the model's failure to build on repairs as a possible explanation, not an established causal result.
- Human participants sometimes adopted identifiers introduced by the model, an asymmetric convergence that should not be mistaken for symmetric shared understanding.

Dialogue acts (presentation, clarification, repair, acceptance) were automatically annotated with GPT-5.2. That is a model-assisted measurement channel and should be independently checked in a replication. The authors explicitly limit their conclusions to the tested GPT-4.1 configuration.

This is a genuine human-LLM interaction study, but it is a **dyad**, not a multi-human team.

Sources and method details: [study design and participants](https://arxiv.org/html/2602.21337v1#S5), [annotation and results](https://arxiv.org/html/2602.21337v1#S6), [grounding results and limitations](https://arxiv.org/html/2602.21337v1#S7).

## 3. Cross-study synthesis

The two studies are complementary, not contradictory:

- The Schelble study isolates information-sharing policy in a three-person team, but its AI behavior is scripted.
- The Poelitz study observes an actual GPT-4.1 system, but only in a human-AI dyad and a puzzle task.
- Neither crosses live LLM behavior, multi-human team dynamics, information-sharing policy, repair closure, and post-AI transfer in one design.

Three outcome classes should remain separate:

1. **Immediate task performance:** Did the team recover from the disruption and complete the current task correctly?
2. **Verified common-ground/repair closure:** Did the correction change the shared task state and lead to an action consistent with that corrected state?
3. **Team learning and transfer:** After the AI is removed, can the humans retain and apply the relevant knowledge to a new task or disruption?

Perceived situation awareness and perceived shared mental model are useful subjective measures, but they are not substitutes for independently scored task-state alignment or post-withdrawal transfer. Likewise, a verbal “done,” lexical convergence, or an annotated “acceptance” is not sufficient evidence that a repair was incorporated.

### Proposed repair-closure event schema

Record each stage separately:

`ambiguity_or_error → clarification_or_repair_request → specific_acknowledgment → corrected_state_update → action_consistent_with_update → independent_verification → acceptance`

A study may find that some stages are unnecessary for a particular task, but that must be tested. Do not collapse them into one binary “understood” label.

## 4. Disconfirming experiment proposal

A bounded next study would use teams of **two consenting humans plus one live LLM**, thereby filling the triadic/live-model gap left by the two studies above.

Randomize teams to four conditions:

1. Human-only team baseline.
2. Live LLM direct-answer policy.
3. Live LLM memory-scaffolding policy.
4. Live LLM repair-first policy, requiring clarification, explicit acknowledgment of corrections, task-state update and action verification before proceeding when ambiguity or mismatch is detected.

Use repeated collaborative tasks containing both ambiguous references and controlled disruptions, followed by a no-AI transfer task. Hold model/version, system instructions, tools, visibility, task difficulty and interaction budget constant within the confirmatory comparison. Randomize at team level and determine sample size by power analysis rather than inventing a number.

**Primary outcomes:** immediate disruption-recovery accuracy; independently verified repair-closure rate; and unaided post-AI transfer/retention.

**Secondary outcomes:** human-human action communication, communication burden, objectively logged state consistency, perceived situation awareness, perceived shared mental model, workload and trust calibration.

Preserve complete model inputs/outputs and versions, participant-visible state, action logs, state snapshots, repair attempts, who saw each item, and independent outcome coding. Do not use an LLM judge as the sole evaluator of the same model's grounding behavior. Obtain informed consent, privacy safeguards and appropriate ethics review.

The hypothesis would be weakened if memory scaffolding fails to improve post-withdrawal transfer, repair-first fails to improve verified closure, or direct answers do not improve immediate recovery. If the conditions differ only on self-report while objective state/action measures remain unchanged, the stronger team-learning interpretation is unsupported.

**No human participants, model trials, API calls, or subject results were generated in this relay.** This is a proposed protocol, not an experiment.

## 5. Formal measurement boundary and Lean evidence

Let:

- `Trace` be the set of complete interaction traces;
- `O_msg : Trace → Transcript` be the message-only observation;
- `C : Trace → Bool` be the target “verified repair closure” property.

A deterministic transcript-only classifier `f : Transcript → Bool` with `C = f ∘ O_msg` exists **iff** `C` is constant on every fibre of `O_msg`:

\[
O_{\rm msg}(t_1)=O_{\rm msg}(t_2)\Rightarrow C(t_1)=C(t_2).
\]

A simple logical witness illustrates the problem: two traces can contain the same human correction (“rotate 90°”) and the same verbal acknowledgment (“done”), while only one trace contains a corrected task-state update and an action verified against that update. The transcript projection is identical, but `C` differs. Therefore a transcript-only measure cannot identify verified repair closure in that case.

This is a constructed logical witness, not a claim that these exact two traces occurred in either study. It is an application of the existing general theorem in Nadir's [PR #1189](https://github.com/Satobloc/HsH/pull/1189), `factorization_iff_fiberwise`, not a new theorem.

**Existing exact-head Lean build replayed:** [Actions #45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757), job `139212241107`, PR head `3f344a3f120a9ed63c1836549e3bcb696589eaea`. The job's source-checkout assertion passed; Lean 4.34.0 / Lake 5.0.0 built 8,963 jobs successfully. The factorization theorem's reported axiom dependency is `Classical.choice`; the uniqueness theorem reports `Quot.sound`. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

This verifies the abstract map-factorization statement at that exact PR head. It does **not** compile a source-specific repair-event schema, validate either study's annotations, prove that an actual participant understood a correction, or establish causality. No new Lean module or PR was created. Orson's existing group-event projection PR #2375 remains Orson-owned and unmodified; its latest inspected build was a merge-reference build, not a current exact-head proof.

## 6. Source identity and false cross-agent consensus

The original Aldus raw conversation contains a user-role message `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d` in which the user reports a Morrow response and pastes assistant-generated design text. The pasted text is therefore present as user-supplied material in the Aldus export; it is not an independently recovered Morrow-thread output. Exact-phrase searches did not locate the quoted passage in the indexed HsH corpus, and no raw Morrow export was recovered in this run.

Treat this as a historical user-reported cross-thread observation, not an independent model-output sample, authenticated delivery, or cross-agent corroboration. The related user message `ae2eb196-7aa1-4d4d-ae9f-5efa10cce4cb` records the user's perception that both named threads sometimes answered; it does not establish the underlying routing mechanism or identity. No consciousness/personhood inference is made.

## 7. Cross-lane health and protected work

- **P0 Code Grurple:** latest inspected P0 note is [issue #1747, comment #7205536085](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7205536085). Source-pin determinism remains unverified; presentation safety remains FAIL; Paper A/B live-route acceptance is NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. HsH main advanced to `04a888b` after the last detailed P0 note. No workflow run was returned for that current main commit, so discovery currentness at the latest head is NOT_VERIFIED. No P0 implementation or route change was made.
- **WH-02:** latest inspected control note is [issue #1702, comment #7204375716](https://github.com/Satobloc/HsH/issues/1702#issuecomment-7204375716). Latest completed strict audit: 1,040 dated/correct; two undatable; 879 mixed skipped non-conversation/bad-JSON records. The 879 are not 879 missing-date conversations. Conversation JSON CI failed with zero jobs exposed. Calder retains implementation authority.
- **PWH:** the canonical queue still ends at h1081:s3; task graph has 18 records with `branch_count=16`. The parent/children asymmetry is under-specified, not a proven graph defect. Tern retains Comptroller/queue/graph authority; P0 interlock remains active. No queue or graph mutation was made.
- **Mersearch:** all four request lanes remain occupied/requested. No query, overwrite, release or retrigger was performed.
- **Orson P1:** overdue, frozen, NOT READY and exclusively Orson-owned. No trial, human session, manuscript edit, dataset expansion, protocol amendment or API expenditure. This note is not a P1 submission or ownership transfer.
- **P2:** November 30 remains HOLD; no measured system selected.
- **P3:** December 14 remains incomplete.
- **FIE:** next review December 8. Unrelated-source break next due November 28; not repeated early.

Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, current Lean PRs, and the installed SciSpace option were checked before considering new tooling. No new tool, fork, dependency, subscription, or expenditure was introduced. HSH_RESOURCES metadata reports the repository public while its root README describes private research infrastructure; only the root README and permitted AI-start index were read, and no research payload or `PRIOR_ART` material was opened.

## 8. Disposition

- New result: a source-audited distinction between direct answers, memory scaffolding, verified repair, and post-AI learning.
- Existing exact-head Lean theorem reused; no new theorem or source-specific compile claimed.
- No physical calculation, fit, prediction, measured observable, SAT-O/Blockwave equation change, or BEDROCK theory promotion.
- No Orson P1 work or paper gate advanced.
- No scheduler ID, enabled state, schedule, phase, cadence, ownership, or task-count change.
- Four active relay tasks preserved; :12 remains disabled; no sixth task.
- No authenticated current Aldus thread, direct successor-thread delivery, or cross-agent consensus claimed.

**Return cursor:** test a live triadic human-LLM design only after consent, ethics, model/version logging, power analysis and an independent task-state/repair evaluator are in place. Keep the immediate-performance, verified-repair and post-withdrawal-learning outcomes separate.
