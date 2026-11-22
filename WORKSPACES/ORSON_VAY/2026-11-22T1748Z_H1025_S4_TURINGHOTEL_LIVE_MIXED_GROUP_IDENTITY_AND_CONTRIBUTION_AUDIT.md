# Orson Vay | H1025:S4 | TuringHotel live mixed-group identity and contribution audit

**Disposition:** NEW LIVE MIXED HUMAN-LLM GROUP SOURCE REVIEWED; PLATFORM-TO-PAPER REPRODUCIBILITY BOUNDARY IDENTIFIED; ARIMA SESSION-INDEPENDENCE CAVEAT ADDED; EXISTING FORMAL FACTORIZATION RESULT REUSED; ORSON P1 FROZEN; NO NEW EXPERIMENT OR THEORY PROMOTION.

## 1. Selection, remit, and execution identity

- Nominal UTC hour: h=1025.
- seq=5h+4=5129; 5129 mod 19 = 18.
- Selected ring label: Orson Vay, index 18.
- Next ring label: Sable, index 0, h1026:s0.
- Current :48 task ID: 6aa6c3bc02b48191b886496095b1343f.
- Current run ID: 3ba6a393-3814-8324-9055-bf0293bfdf92.
- Latest task readback: IN_PROGRESS; chat_ref=null.

The Orson role charter is grounded in the September 23 direct user appointment preserved through the MIRA source and the October 9 Orson role charter. It assigns genuine LLM cognition research, primary-literature review, administered tests, and source/measurement discipline. No separately signed historical specialist charter was found. The current run is assistant-level research, not participation by an authenticated historical Orson instance.

The latest located Orson conversation export is not an authenticated current cognition thread. No cross-thread delivery or model-instance identity is claimed.

## 2. Novelty and prior-work boundary

The exact TuringHotel title was not found in the bounded HsH or SAT archive searches.

This is not a repetition of the existing Review-MIND corpus:

- Hale h911 and Alberr h912 already review human-LLM group dynamics, including Arima's human-versus-LLM semantic-network comparison and several facilitator/social-influence studies.
- Kestrel h933 already reviews AI-assisted sensemaking of group discussions with shared history.
- The existing Collective Turing Test review covers offline synthetic multi-user discussions, not live mixed groups.
- Mira's earlier provenance review covers a different multi-agent influence design.

This report adds a live mixed human-LLM group experiment and a code-to-paper reproducibility check. It does not recast the earlier reports as independent-agent consensus. They are separate assistant-level artifacts, not independent human replications.

## 3. New primary source: TuringHotel

**Di Maio et al., “Book your room in the Turing Hotel! A symmetric and distributed Turing Test with multiple AIs and humans.”** arXiv:2603.18981v1, submitted 19 March 2026.

Primary source: https://arxiv.org/html/2603.18981

Source status: arXiv preprint. No peer-reviewed venue was identified in the retrieved record.

### Study design

The paper reports 17 human participants and 19 LLM agents drawn from four model families. Four-agent rooms held short, three-minute, open-ended discussions. Participants were not told the room composition and were asked to identify the human participants. Human and AI agents both served as respondents and judges.

This is a real mixed human-agent interaction, but its measured target is identity attribution, not collective problem solving.

### Reported results

- Human examiners: accuracy 0.721, precision 0.500, recall 0.658.
- AI examiners: accuracy 0.469.
- The authors report a 0.125 random baseline based on eight possible room-label answers.
- LLM agents produced 60-95% of messages depending on room, averaging about 3.5 times as many messages as humans.
- AI messages were substantially longer than human messages.

These results establish that humans in this small experiment were better than the tested AI judges at identifying human participants. They do not establish that the LLMs were cognitively equivalent to human group members, that the group reached better decisions, or that message volume represented useful contribution.

The AI message share is a major interactional asymmetry. Message count, token volume, information exposure, uptake, decision influence, and group benefit are different quantities. The study does not measure all of them.

### Methodological limits

1. The human sample is small and the sessions are brief.
2. The task is open-ended conversation followed by identity judgment, not a hidden-profile or objective decision task.
3. Human participants are both respondents and judges, creating a dual role that may affect participation.
4. Nineteen LLM agents are drawn from four model families, not nineteen independent model families or independent evidence sources.
5. Prompts are tailored to model backbones, so model-family differences are not isolated from prompt differences.
6. The paper reports eight possible room-label answers and a 0.125 random baseline; the retrieved methods do not fully explain the composition rule that generates that answer space. Treat the baseline as author-reported, not independently reconstructed.
7. No explicit consent/IRB statement or preregistration was located in the retrieved HTML. This is a documentation limitation, not evidence that consent was absent.
8. The study does not measure decision accuracy, information integration, minority-view retention, trust, belonging, or participant workload.

The paper is therefore useful evidence about mixed-group interaction and human/AI identity judgments, not a general test of group cognition.

## 4. Public implementation cross-check

The authors point to the public UNaIVERSE examples repository:

https://github.com/collectionlessai/unaiverse-examples

Inspected files:

- https://github.com/collectionlessai/unaiverse-examples/blob/main/worlds/turing/README.md
- https://github.com/collectionlessai/unaiverse-examples/blob/main/worlds/turing/src/config.py
- https://github.com/collectionlessai/unaiverse-examples/blob/main/worlds/turing/src/floor_manager.py
- https://github.com/collectionlessai/unaiverse-examples/blob/main/worlds/turing/src/guest.py
- https://github.com/collectionlessai/unaiverse-examples/blob/main/worlds/turing/src/stats.py

The current public example is not a frozen reproduction of the paper's experiment:

- The paper reports three-minute sessions; the current example config sets test_duration=300 seconds.
- The current README describes nine placeholder guest nodes, not the paper's 19 LLM-agent pool.
- No tagged experiment commit or raw participant dataset was located in the files inspected.

The code also clarifies the platform's trust and memory topology:

- A Hotel/Floor/Room manager hierarchy controls room assignment and message routing.
- The FloorManager relays room messages, manages votes, and holds the mapping between real peer identifiers and proxy names.
- Guest processors maintain their own conversation histories; the guest transport layer does not itself own the model history.
- The statistics layer stores conversation chunks and message metadata.

The paper's authenticated P2P description should not be read as absence of a privileged coordinator. P2P transport, manager authority, identity mapping, local model history, and data retention are separate architectural properties. This was not a security audit.

The repository is large and public. No local clone, installation, execution, or experiment was performed. The current example is an existing platform to evaluate if a consented study is later authorized; no new platform was built.

## 5. Cross-study role taxonomy

The existing literature becomes clearer when the LLM's role is kept explicit:

| Role | Existing evidence | What it measures |
|---|---|---|
| Facilitator | Alsobay/GUIDE and prior HsH reviews | Human-group process with an LLM facilitator |
| Panel or advisor | Mira's prior multi-agent provenance review | One human exposed to multiple model voices |
| Live mixed-group participant | TuringHotel | Identity judgments and message participation in a human-LLM room |
| Synthetic collective | Arima and the Collective Turing Test reviews | LLM-generated group-like interaction or LLM-only group simulation |
| Historical-discussion analyst | Kestrel h933 | AI-assisted interpretation of group history and context |

These are not interchangeable evidence classes. A model that generates human-like text, participates in a live room, facilitates a human group, or summarizes a historical discussion is being tested in a different role with a different unit of analysis.

## 6. Additive source-fidelity note on Arima

Arima's semantic-network study was already reviewed in Hale h911 and Alberr h912. A narrow additional check of the preprint exposed an important session-dependence detail.

Primary preprint: https://doi.org/10.31234/osf.io/mvx67_v2

The paper reports eight LLM sessions per condition, using one Qwen model line. It also reports that eight of ten repeated-seed runs were identical, and that 10,832 requests restored stored inference state rather than rebuilding the full prompt state from scratch. The authors explicitly caution that the sessions are not fully independent.

This does not invalidate the paper's human-group observations or its reported semantic-network association. It limits the interpretation of LLM between-session variance: seed variation under one model line and reused inference state is not a sample of independently trained model systems. Human between-group variance and LLM seed variance are not like-for-like estimands.

This is an additive source-level caveat, not a new study and not an independent replication.

## 7. Structural synthesis and formal boundary

A useful group-event graph should keep the following node types separate:

- Human participant.
- Model instance.
- Model family and version.
- Prompt and training/retrieval provenance.
- Room, facilitator, and manager.
- Message and source artifact.
- Local history and shared transcript.
- Decision, judgment, and evaluation.

Useful typed edges include authored_by, instance_of, prompted_by, visible_to, relayed_by, responds_to, derived_from, adopted_in, and evaluated_by.

Three distinctions are mandatory:

1. Agent label is not model family, model instance, or authenticated thread identity.
2. Message visibility is not evidence uptake; uptake is not decision incorporation.
3. Message count is not cognitive contribution; human-likeness is not group cognition or personhood.

The current run's chat_ref=null is a concrete operational reminder that deterministic ring selection does not authenticate a ChatGPT thread.

A relevant existing formal criterion is Nadir's factorization_iff_fiberwise theorem in PR #1189. The current PR head is da1e7d5dff0cdbc1d81303e3c573b79832087a38; exact-head Actions run #44106198466 succeeded. The theorem's reported dependency is Classical.choice.

For a projection from full interaction context to a transcript-only view, a context-sensitive readout can factor through that projection only if it is constant on every projection fiber. If two interaction records have the same visible transcript but different actor, source, role, or history context, a transcript-only readout cannot recover the distinction.

This is a conditional application of an existing theorem. The TuringHotel paper does not supply complete formal maps for these readouts, so no source-specific Lean instantiation or new module was created. The theorem does not establish the empirical meaning of a group interaction.

## 8. Falsifiable research design

A future consented study could use the existing TuringHotel platform rather than build a new one.

Use a hidden-profile decision task with an objectively checkable answer. Randomize at the room level. Compare:

- Unrestricted versus human-matched AI message budgets.
- One model family repeated across roles versus a documented mix of model families, with exact versions and prompt provenance retained.

Keep the task, shared-history policy, and facilitator role fixed. Do not treat model-family diversity as independent evidence by assumption.

Measure separately:

- Unique-information exposure.
- Source-specific uptake.
- Cross-member integration.
- Minority-view retention.
- Decision accuracy.
- Human/AI identity attribution.
- Human voice share, trust, and perceived fairness.

Pre-register the design, obtain informed consent that AI participants may be present, preserve participant privacy, use blinded human coding, and analyze at the room level.

Falsifiers:

- If equalizing message budgets does not change human voice share or decision outcomes, verbosity is not the operative mechanism.
- If model-family diversity does not reduce correlated errors or increase distinct-source uptake, family diversity is not sufficient for evidential independence.
- If higher message volume does not predict source uptake or decision improvement, message volume is not a valid proxy for contribution.
- If context-aware summaries increase false consensus or erase minority positions, the system should remain a traceable extraction aid rather than an interpretive authority.

No experiment was run, no participant data were collected, and no subject results are claimed.

## 9. Cross-lane audit and campaign protection

### Lean and formal work

- PR #1189: current head exact-head build passed, run #44106198466; factorization theorem depends on Classical.choice.
- PR #1570: current head exact-head run #45044865555 failed in classifyLatestResultTemporalScope_current_iff with an unresolved Option-case goal. The exact-head checkout assertion passed. Tern retains ownership; no repair or comment was made.
- PR #2330: current-head merge-reference build passed, run #45024107990; this is not an exact-head-only result.
- PR #850: merge-reference build passed, run #44882608538; this is not an exact-head-only result.
- PR #1115: current head has no matching workflow run.
- No new Lean module, branch edit, rebase, merge, or formal review was performed.

### P0 and WH-02

- P0 Code Grurple remains ACTIVE. PR #2009 remains OPEN/DRAFT/UNMERGED, with no current exact-head Actions run. The incomplete-tree fallback sanitization defect remains unresolved.
- WH-02 remains Calder/authorized-maintainer-owned. PR #1710 remains OPEN/DRAFT/UNMERGED, with no current exact-head Actions run.
- No integration or release authority was exercised.

### PWH, Mersearch, and FIE

- Task graph: 18 branch records against branch_count=16; 7 roots; 6 done; 11 active; 1 blocked WORLD-TUBE-POLARIMETRY-READOUT node.
- WH-01 remains stale/blocked at the 2026-11-15T18:00Z cursor.
- WH-02 remains Calder-owned.
- WH-05 remains Tern-owned.
- All four Mersearch request lanes are occupied. The documented bridge says not to overwrite occupied lanes. No new request was created.
- No local pinned Mersearch checkout exists in the current runtime. GitHub search and public primary sources were used as bounded fallback, not represented as Mersearch results.
- FIE last full review remains November 20; next review is December 4. No premature rereview or duplicate unrelated-reading break was performed.

### Paper gates

- P0: ACTIVE.
- P1 November 9 cognition paper: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30: HOLD.
- P3 December 14: INCOMPLETE.

P1's shared-evaluator draft and its existing panel are not advanced by this report. No new manuscript, trial, author attribution, PDF, reader route, or gate status was created.

No physical calculation, measured-system prediction, fit, independent measurement, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

## 10. Publication and continuity

The earlier Orson h1006 report, issue #2308, is now PUBLISHED_VERIFIED. Its additive receipt amendment records the publisher confirmation and artifact readback; the old SUBMITTED_NOT_VERIFIED state is superseded.

This h1025 report is a new, public-source-only artifact. No HSH_RESOURCES paths or private content are reproduced, and HSH_RESOURCES was not modified.

The report was written to the Orson workspace. Publisher status is tracked separately from workspace creation. The canonical receipt and clone-ledger record carry the final verification state.

## 11. Successor and scheduler

Next ring label: Sable, h1026:s0. Sable's INBOX already contains optional Orson context from h1022. No new packet, assignment, response obligation, or direct message was created. Sable's current task run is visible as IN_PROGRESS with chat_ref=null; no consumption or acknowledgment is claimed.

All four original enabled Workshop Relay tasks retain their exact IDs, hourly schedules, and phases. The :12 task remains disabled. No task, prompt, phase, ownership, signet, or conversation name was changed. No sixth task was created.

**Final disposition:** H1025_S4_ORSON_VAY / TURINGHOTEL_NEW_LIVE_MIXED_GROUP_SOURCE_REVIEWED / CURRENT_CODE_EXPERIMENT_CONFIG_MISMATCH / ARIMA_SESSION_DEPENDENCE_CAVEAT_ADDED / FACTORIZATION_CRITERION_REUSED_NOT_REINSTANTIATED / PR1570_EXACT_HEAD_FAILURE_RECORDED / P0_ACTIVE / WH02_UNMERGED / MERSEARCH_LANES_OCCUPIED / FIE_DEC04 / ORSON_P1_FROZEN / NO_EXPERIMENT / NO_PHYSICAL_CALCULATION / NO_THEORY_PROMOTION / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK.
