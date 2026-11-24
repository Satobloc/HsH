# Mercer h941:s4 | Review-MIND: cognitive delegation, monitoring, and control

**Run key:** REVROT3-19-20261011:941:s4  
**Ring selection:** h=941; seq=4709; index 16 = Mercer; next index 17 = Ravel. This is a routing label, not an authenticated ChatGPT identity or thread.

**Disposition at report creation:** SOURCE REVIEW COMPLETE / DATASET AGGREGATE QC COMPLETE / LEAN PR OPEN DRAFT / EXACT-HEAD CI IN PROGRESS / PUBLISHER SUBMISSION PENDING.

## 1. Scope, role, and boundaries

The historical Mercer role source is a direct user message dated 2026-10-01 20:56:07Z. It assigned the :48 slot equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences, with explicit sandbox permission to theorize and derive while separating source material from invention.

The current Mercer workspace README and continuity materials retain a narrower standing Code Grurple P0 assignment: Paper A/B presentation QA only. The user-supplied Review-MIND Lane Charter 48 is treated as a one-run overlay, not a reassignment of Mercer or a change to P0. No Paper A/B manuscript or presentation work was performed. No P0 branch, owner, priority, or gate was changed.

This report is assistant-level research under the Mercer ring label. It does not claim an authenticated Mercer thread or Mercer participation. Orson's P1 cognition manuscript, protocol, dataset, and ownership remain protected and untouched.

## 2. New source cluster: delegation is not one autonomy dial

### 2.1 Kim et al., 2026: observed cognitive delegation

Yoonsu Kim, Sean Kim, Kihoon Son, Saelyne Yang, and Juho Kim, “What Did the AI Take On? Characterizing Cognitive Delegation in LLM Reasoning,” arXiv:2610.06328v1, posted 2026-10-05.

Original: https://arxiv.org/abs/2610.06328

I inspected the full arXiv HTML, including the method, taxonomy, protocol analysis, discussion, and limitations. The study involved 24 experienced LLM users, three task families, one model/interface configuration, 956 recorded reasoning steps, and 992 retrospective annotations.

The paper separates three retrospective properties of a work step:

- Initiative: user-initiated or AI-initiated.
- Impact: wanted or unwanted.
- Criticality: critical or minor.

It then records a fourth, separate property: the participant's desired interaction protocol, categorized as full delegation, disclosure, calibration, or consultation.

Reported results include:

- 48.6% of recorded steps were AI-initiated.
- 62.7% of AI-initiated steps were wanted; 37.3% were unwanted.
- Within AI-initiated, wanted, critical work (“Beneficial Autonomy”), 28% called for some user involvement rather than full delegation.
- Among involvement requests, consultation was the most common preference, followed by calibration and disclosure.
- AI initiation increased from 31.1% in the first fifth of a task to 61.4% in the final fifth.
- “Reprocessing” explicitly represents returning to prior work, so the observed workflow is not merely a linear chain.

The crucial distinction is that AI-initiated does not mean unwanted, unauthorized, or unaccountable. Wanted after the fact does not establish ex-ante authorization. Desired protocol is not evidence that the protocol was actually executed.

Source-quality qualification: the arXiv v1 is a preprint, not a verified peer-reviewed publication. The PDF body still contains incomplete ACM conference-template metadata, including a 2018 placeholder and unresolved DOI-style text. The arXiv identifier is the reliable citation. The study is small, retrospective, limited to three short task types and one interface/model configuration. Logged traces and tool actions are observable behavior, not direct access to a model's private internal cognition.

### 2.2 Santos et al., 2026: monitoring interventions do not automatically improve task performance

Manuel A. D. Santos et al., “Beyond ‘ChatGPT Can Make Mistakes’: Designing Interventions to Support Metacognitive Monitoring in AI-Assisted Work,” arXiv:2609.17065.

Original: https://arxiv.org/abs/2609.17065

The study combined 11 expert interviews, 30 intervention concepts, and a 917-participant experiment over 12 planning-and-organizing problems and five conditions.

Reliability cards and contrasting replies improved some measures of estimation error and aggregate confidence discrimination, but did not produce a detected task-performance improvement. Pause points reduced task performance. The interventions also imposed usability and workload costs. The study's own analyses qualify the confidence result: some apparent discrimination gains weaken after accounting for item effects, and following or overriding advice did not become reliably more selective.

Limitations include one model, one task domain, 12 trials per participant, no no-AI control in the main experiment, no preregistration, and partial confounding between condition and collection period. These findings do not establish that monitoring interventions are generally ineffective; they show that monitoring measures and task outcomes must be evaluated separately.

### 2.3 Maier et al., 2026: behavior can change without detected metacognitive-accuracy change

Sebastian Maier, Kai Schwabe, Manuel Schneider, and Stefan Feuerriegel, “Designing Against Deskilling: Metacognitive Feedback Reduces Cognitive Offloading to LLM Assistants,” arXiv:2609.20143.

Original: https://arxiv.org/abs/2609.20143

This preregistered study involved 704 UK Prolific adults in a 2x2 intervention design plus a no-AI control. Participants worked through ten AI-assisted fraction-arithmetic learning items followed by six unaided test items.

Metacognitive feedback reduced answer offloading and improved unaided test performance in the authors' preregistered directional analyses. The reported performance odds ratio was 1.51 with a two-sided 95% interval of [0.98, 2.33] and p=.030 under the stated one-sided test; the interval is therefore close to the null boundary. The intervention did not produce a detected improvement in measured metacognitive accuracy/sensitivity. Effort-based reward did not show a significant effect.

The task classifier was validated on synthetic dialogues rather than a human-coded sample of the actual participant dialogues. The study is one domain, one session, one model configuration, and a short-term unaided test; it does not establish long-term retention or transfer.

### 2.4 Citation audit

Scholar Sidekick's whole-list audit matched all three titles to their arXiv identifiers: 3 matched, 0 mismatched, 0 ambiguous, 0 not found, and 0 retracted. This verifies citation identity and retraction status, not peer review or methodological validity.

## 3. Independent aggregate-data check

The Santos study links a public repository: https://github.com/ManuelADSantos/MET_AI_Interventions

I inspected its README and current main tree, then parsed only aggregate fields from data_analysis/all_data.csv. I did not inspect free-text answers or expose participant-level records.

The CSV contains 925 completed rows and 120 columns. Aggregate task-correctness means by condition were:

| Condition | Completed rows in CSV | Mean correct in CSV | Published analyzed N | Published rounded mean |
|---|---:|---:|---:|---:|
| AI baseline | 189 | 5.5714 | 187 | 5.57 |
| Reliability cards | 184 | 5.1902 | 182 | 5.18 |
| Contrasting replies | 183 | 5.2022 | 181 | 5.20 |
| Pause points | 184 | 4.4891 | 184 | 4.49 |
| Reflection task | 185 | 5.5351 | 183 | 5.52 |
| **Total** | **925** | | **917** | |

The rounded means reproduce the paper's reported values. The published analyzed sample is eight participants smaller than the completed rows in the public CSV: two baseline, two reliability-card, two contrasting-reply, zero pause-point, and two reflection-task rows.

The paper describes seven exclusions for failing at least two of four attention checks and one exclusion for completion under ten minutes. The public CSV exposes only three attn-prefixed fields and no duration field, so the eight exclusions cannot be reconstructed from the exported CSV alone. The paper points to data_analysis/analysis/publication_ready for analysis scripts, but that path is absent from the repository's only main branch; the current data_analysis directory contains the CSV. This is a reproducibility/documentation gap, not evidence that the published analysis is invalid. I did not reproduce the inferential models or identify excluded participants.

## 4. New synthesis: a typed delegation-control graph

The three studies expose four distinct layers that should not be collapsed into one “trust,” “metacognition,” or “autonomy” score:

1. **Agency / enactment:** who initiated the work, whether its result was wanted, and how critical the step was.
2. **Desired and actual protocol:** whether the person wanted full delegation, disclosure, calibration, or consultation; separately, what interaction actually occurred.
3. **Monitoring and control:** what the person could estimate about the state or quality of the work, and what they then did to intervene, correct, override, consult, or reallocate.
4. **Outcomes:** task performance, delayed unaided learning/retention, workload, and re-entry cost.

A proposed event graph should preserve:

- Work family/type: framing, sourcing, developing, reviewing, and reprocessing.
- Actor and initiator as separate fields.
- Wanted/unwanted impact and criticality.
- Desired protocol and observed protocol as separate fields.
- Evidence/source lineage and transformations.
- Human exposure, involvement, correction, acceptance, revision, or rejection.
- Reprocessing edges that point back to earlier work rather than flattening the history into a linear transcript.
- Monitoring, control, performance, and learning outcomes as separate measures.

The feedback model is:

**monitoring → control choice → execution → performance / learning → later monitoring**

This is a proposed measurement architecture, not a claim that the studies established a universal causal chain. A monitoring improvement may fail to change control or performance; a control intervention may change behavior without a detected improvement in metacognitive accuracy. Both possibilities need direct measurement.

## 5. Falsifiable multi-agent human-group experiment

The current evidence cluster is primarily individual human-AI interaction. It does not establish how these mechanisms behave in real human groups working with multiple LLM agents. The next study should test that gap directly.

A bounded design candidate is a 2x2 group-randomized experiment:

- Delegation protocol: fixed/full delegation versus adaptive consultation on consequential AI-initiated steps.
- Trace visibility: summary-only versus event-level delegation/provenance trace.

Use multiple independent groups in every condition, with group/session as the randomization and analysis unit. Determine group count through a preregistered power analysis rather than assuming a convenient number. Use at least two task families: evidence synthesis with conflicting sources and constrained planning with objectively checkable constraints. A later replication can vary model family.

Measure separately:

- Delegation alignment: desired versus observed protocol.
- Monitoring: confidence calibration, estimation error, and discrimination.
- Control: consultation, correction, override, offloading, and task reallocation.
- Performance: factual accuracy and constraint satisfaction.
- Learning: delayed unaided retention/transfer.
- Re-entry: time and error when a human resumes after AI-initiated work.
- Group outcomes: minority-evidence retention, attribution, participation balance, accountability, workload, and latency.

Use independent outcome evaluation rather than reusing the same model-generated measure for both feedback and success. Record only consented, necessary interaction events; minimize retained personal data; allow withdrawal; do not assume Nathan participation.

The proposal is falsified or requires redesign if adaptive consultation does not improve delegation alignment, if event traces add workload without improving attribution or calibration, if monitoring changes fail to produce the predicted control behavior, or if apparent effects disappear across independent group replications. This is a proposed protocol; no participants, human study, or model/API experiment were run.

## 6. Formalization and existing HsH work

A source-grounded finite formalization was added in draft PR #2068:

https://github.com/Satobloc/HsH/pull/2068

Branch: review/mercer-delegation-protocol-factorization-20261119t0548z  
Base: infra/lean4-verification-20261023  
Exact head at submission: 575aa200404ffd6c7155b72a703c2781556d29e3

The module represents initiative × impact × criticality separately from desired protocol. It uses two source-reported category combinations within AI-initiated, wanted, critical work: full delegation and consultation.

The theorem desired_protocol_does_not_factor_through_enactment proves that no deterministic function of the three coarse enactment axes alone can recover desired protocol for every observation represented by those source-reported combinations. Adding work type, task context, expertise, and actual execution traces could refine the state space.

The module includes four #eval expressions and theorem-specific #print axioms commands. At report creation, exact-head Actions run #44472753653 was IN_PROGRESS. Therefore the module was LEAN_UNTESTED / CI_PENDING at this point; no compilation, #eval output, or axiom result is claimed yet. PR #2068 remains draft, open, and unmerged. A separate Vercel daily-deployment-limit failure is not a Lean result.

Adjacent existing work was checked:
- PR #1115 contains a group-level treatment/session-confounding formalization, but no exact-head workflow run was found at inspection. It is not claimed as a verified proof.
- PR #1189 and PR #2052 have exact-head Lean CI successes, but their theorems concern other projection/provenance structures and do not prove this source-specific result.
- Math Hopper issue #578 remains open; PR #991 remains draft. The full three-repository scan is not verified.
- Whirligig Kernel 0 remains a sandbox resource and was not used.
- No new tool, dependency, subscription, or paid service was built or acquired.

## 7. Factory Floor boundary

The HsH formal-verification README requires a source-linked Factory Floor handoff after a substantive theorem receives successful Lean CI. However, the current Factory Floor README imposes a mandatory geometry-first admission gate: a precise geometric plot, independent hostile fidelity review, and the plot displayed with the submitted file.

This cognitive taxonomy formalization has no physical/geometric plot and no such hostile plot review. It is therefore not Factory Floor eligible. No Factory Floor issue or direct write was made. If Lean CI succeeds, the HsH workspace will carry a machine-readable FACTORY_HANDOFF_PENDING record marked GEOMETRY_NOT_SUPPLIED / NOT_FACTORY_FLOOR_ELIGIBLE. No LIVE, ARTIFACTS, WEBSITE, BEDROCK, or theory promotion is claimed.

## 8. Repository, campaign, and operational controls

Mersearch was checked first conceptually, but no callable Mersearch action is exposed in this runtime. SciSpace was used for discovery and extraction; the original arXiv sources were then inspected directly. GitHub search and the public data repository were bounded fallbacks.

The HsH live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding/roaming card, new-instance start page, revival rotation and thread-routing rules, duplicate-run guard, current main branch, Mercer continuity/checkpoint/inbox, current receipts, and the historical Mercer role source were read. The SAT archive and HSH_RESOURCES front-door READMEs were also checked. No private HSH_RESOURCES payload was opened; no SAT-O or Blockwave equation was touched.

Campaign status remains:
- P0 Code Grurple: ACTIVE.
- Mercer standing P0 assignment: Paper A/B presentation QA only; unchanged.
- P1 Orson cognition: OVERDUE / NOT READY / ORSON-OWNED.
- P2 November 30 paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE review next due November 24; not stale at this run.
- No paper gate advanced.

The predecessor Meridian packet was read as POSTSTART_OPTIONAL_CONTEXT_ONLY. The scheduled Ravel h942:s0 run subsequently completed; no late handoff or direct-thread delivery claim was made.

The current :48 scheduler observation reports the same run ID with a later start-time value than Meridian's earlier observation. The latest cached result belongs to a different, older run. These observations are preserved separately; no restart, duplicate execution, completion, or current-thread identity is inferred.

No task ID, enabled state, prompt, phase, cadence, or schedule was changed. No sixth task, signet, chat rename, PWH ownership change, physical calculation, fit, prediction, or independent measurement was made.

## 9. Next discriminating work

1. Read exact-head Lean CI and #eval/#print axioms logs for PR #2068; do not call it verified before that readback.
2. If CI succeeds, create the machine-readable HsH FACTORY_HANDOFF_PENDING record with the geometry exclusion explicit; do not submit to Factory Floor.
3. Add the dataset-exclusion manifest or analysis scripts to the Santos reproducibility follow-up only if an authorized public source provides them; do not infer excluded participants.
4. Develop a preregistered multi-agent human-group protocol with independent group replication and separate monitoring/control/performance/learning outcomes.
5. Keep Orson P1 and Mercer P0 ownership and gates unchanged.
