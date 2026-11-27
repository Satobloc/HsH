# Review-MIND h1147:s4 — Socially fluent AI: source identity and social evaluation

**Classification:** assistant-level source audit; Loom routing label only; external empirical preprint; human–AI group interaction; LLM backend unspecified.

## 1. Selection and authority

- h=1147; seq=5(1147)+4=5739; 5739 mod 19=1.
- Selected routing label: **Loom**, index 1. Next: **Aster**, index 2.
- Run key: **REVROT3-19-20261011:1147:s4**.

The live BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, onboarding, Revival Rotation V3/V4, thread-first/navigation rules, current main, task graph, receipts and Loom historical materials were reviewed.

Loom's raw historical role conversation is **6aa67478-541c-83e9-b8fa-32d6d575eeb9**, blob **6668ca60e451f8737903423727da7f9a430484e1**. Its ten direct user messages establish cumulative corpus tagging, chronology/earliest-occurrence recovery, tag selectivity, frequency sorting and SAT-to-standard terminology crosswalks. All ten message IDs were matched to the existing tagging ledger; no duplicate tags were added. No standalone signed specialist charter was recovered.

**Loom remains PAUSED / ACCESSIBLE-UNSCHEDULED.** This historical remit is a source-tagging bias, not an active lease. The current invocation has no authenticated Loom conversation reference; its cached prior result belongs to Meridian h1146:s4. This is assistant-level research, not Loom-authored work. No Loom workspace, BOOT, CURRENT_WORK or INBOX file was changed.

A Sable h1147:s3 operation/readback packet arrived after this invocation began. It is repository-only optional context, not an assignment or direct-thread handoff. No Loom-thread delivery, consumption, acknowledgment or ownership transfer is claimed.

## 2. Primary source and classification

**Lixiang Yan, Yueqiao Jin, Xibin Han and Dragan Gasevic, “Socially fluent AI decouples conversational signals from source identity in online interaction,” arXiv:2605.23426v1, 22 May 2026.**

- [arXiv record](https://arxiv.org/abs/2605.23426)
- [Full text and supplementary materials](https://www.researchgate.net/publication/405221575_Socially_fluent_AI_decouples_conversational_signals_from_source_identity_in_online_interaction)
- DOI: **10.48550/arXiv.2605.23426**; accessible full text marked CC BY 4.0.
- This pass verified an arXiv preprint; a peer-reviewed venue was not verified.
- The paper promises analysis code/scripts after acceptance. No public raw dialogue-log release was identified.

This is a live, synchronous, text-only human–AI triadic-interaction study: not a dyad, static advisor panel or LLM-only simulation. The introduction discusses LLM-based agentic systems, but the methods and supplementary materials do not identify the implemented model provider, family, version, endpoint or decoding configuration. The agents are described as structured, prompt-controlled AI agents. The correct tag is **LLM_BACKEND_UNSPECIFIED**, not a named-model experiment.

Design: 905 enrolled / 786 retained participants; 471 triads; 16,379 logged messages; 1,572 post-interaction teammate judgments (685 AI targets, 887 human targets). Three task domains (survival ranking, ethical autonomous-vehicle dilemma, creative story ideation) and five group conditions (3H; 2H+1AI supportive or contrarian; 1H+2AI with shared stance). Each discussion lasted ten minutes.

Participants were not told AI teammates could be present, but gave informed consent and were debriefed afterward. The paper reports Monash ethics approval 48379 and no adverse reactions. Prompts directed agents to conceal artificial identity and use human-like conversational imperfections, uncertainty and self-correction. No task-specific fine-tuning or bespoke deception-optimized architecture is reported. Agents scanned the shared chat every 25 seconds with ±25% jitter, spoke with probability .5 per scan, resolved simultaneous attempts by random selection plus a 10-second delay, and were limited to three consecutive messages. A separate 15-person pilot rated agent humanness M=5.43 (SD 1.07); it is a naturalness check, not replication.

No separate private inter-agent channel is described. This tests co-present prompt-controlled agents in a shared conversation, not private multi-agent planning or independent source acquisition.

## 3. Findings and independent QC

The published confusion counts are:

| Ground-truth target | Judged AI | Judged Human | Not sure | Total |
|---|---:|---:|---:|---:|
| AI | 217 | 358 | 110 | 685 |
| Human | 245 | 495 | 147 | 887 |

Aggregate sensitivity: **d′=0.117**, 95% CI **[-0.007, 0.257]**; hit rate .317; false-alarm rate .276; response bias β=1.065. Participant-level mean d′=-.012, SD .697, 95% CI [-.085,.062], n=786. Both intervals include zero. Independent arithmetic from the published counts gives Φ⁻¹(217/685)−Φ⁻¹(245/887)=**0.11743**. This is an aggregate-count reproduction, not raw-data reanalysis.

Social evaluation was not absent: supportive agents were rated more supportive and less conflictual than contrarian agents; AI targets were rated slightly lower than human targets on humanness and trust, with trust also varying by stance. Poor categorical source identification therefore coexisted with differentiated social impressions.

The cue-based classifier achieved AUC **.983** (95% CI .954–.999) in group-wise cross-validation on 149 complete mixed-identity triads / 447 target-level records. A model predicting participants' AI-versus-human judgments achieved AUC **.527** on a different, judgment-level sample of 1,282 judgments across 449 groups. These are different prediction targets and units, not a same-unit head-to-head comparison. The classifier shows recoverable cues in this experiment's own prompt/task/platform; it does not establish general LLM detectability or human access to those cues. Excluding latency did not remove the reported classifier performance.

### Representational geometry

The paper builds representational dissimilarity matrices (RDMs) for interactional cues, categorical judgments, ground-truth identity, subjective impressions and semantic topics. Spearman correlations of RDM upper triangles for 1,148 complete targets include:

- Cue structure ↔ ground-truth identity: ρ=.455, permutation p<.001.
- Cue structure ↔ judgment structure: ρ≈0, p=.924.
- Judgment structure ↔ ground truth: ρ=.004, p=.027 (negligible effect).
- Impression structure ↔ judgment structure: ρ=.247, p<.001.
- Cue structure ↔ impression structure: ρ=.007.

This supports a **representational dissociation**, not a causal mediation claim. These are RDM-geometry correlations, not ordinary correlations between individual ratings.

Two interval cautions: the aggregate d′ bootstrap resamples AI-target and human-target rows rather than participant/group clusters; a separate participant-level d′ interval provides a useful check. RSA intervals bootstrap dissimilarity pairs that share targets; permutation tests preserve matrix structure, but pair-bootstrap intervals should not be treated as if every pair were independent.

### Existing Lean result reused

Let J:Target→Judgment be categorical human judgment and G:Target→Identity be ground truth. The confusion counts include an AI target judged Human and a human target judged Human. Thus G is not constant on the fibre of J=Human. No deterministic decoder f can satisfy G=f∘J for all observed targets.

This is the existing factorization criterion in Nadir's **factorization_iff_fiberwise** theorem, [PR #1189](https://github.com/Satobloc/HsH/pull/1189). Exact-head Actions build [#45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757) succeeded on **3f344a3f120a9ed63c1836549e3bcb696589eaea**, Lean 4.34.0 / Lake 5.0.0. The theorem-specific axiom report includes Classical.choice; the full root build succeeded, while global axiom audit, tests, lint and nanoda were skipped.

This reuses an existing compiled theorem; no new Lean module or source-specific proof was created. Lean checks the formal factorization statement, not the paper's data extraction, RSA pipeline, causal interpretation or model identity.

## 4. Limits and disconfirmatory follow-up

The study supports a bounded claim: immediate identity judgments were near chance in these undisclosed, ten-minute, text-only triads, despite behavioral cues that predicted the experiment's AI/human labels.

It does not directly establish belief change, persuasion, altered final decisions, coordinated manipulation at scale, repeated-exposure learning, voice/video performance, a general property of all LLMs, independent multi-agent reasoning or independent evidence sourcing. The authors' wider influence-operation discussion is a plausible risk interpretation, not an outcome measured here. The 15-person pilot is not a replication.

A useful follow-up would independently cross: (1) AI disclosure, (2) named/versioned backend identity, (3) prompt/stance, and (4) shared versus independent evidence ancestry. Use consenting participants, preregistered group randomization, repeated sessions as a separate factor, objective analytical outcomes and separate ethical/creative outcomes. Record group, participant, agent instance, model/version, prompt/configuration hash, operation/run, message, timestamps, source packet, recipient visibility, judgments, ratings and final decisions. Analyze at participant and group levels; hold out entire groups and, separately, model/prompt families.

Falsifiers include failure of the cue classifier on held-out model/prompt families, no disclosure effect on identity sensitivity, or failure to replicate the identity/impression dissociation. This is a proposal only; no human sessions, participant results, model trials, model API calls, ethics applications or API expenditure occurred.

## 5. Source-tag record

**Source ID:** arXiv:2605.23426v1  
**Kind/date:** external empirical preprint / 2026-05-22  
**Study class:** LIVE_SYNCHRONOUS_HUMAN_AI_TRIAD  
**Implementation:** PROMPT_CONTROLLED_AGENT  
**Backend:** LLM_BACKEND_UNSPECIFIED  
**Disclosure:** AI_NOT_DISCLOSED_DURING_TASK / INFORMED_CONSENT / POST_TASK_DEBRIEF  
**Units:** PARTICIPANT / GROUP / TARGET / JUDGMENT / MESSAGE  
**Outcomes:** IDENTITY_JUDGMENT / HUMANNESS_RATING / TRUST / SUPPORTIVENESS / CONFLICTUALITY / IMPRESSION_TEXT  
**Methods:** SIGNAL_DETECTION / GROUP_WISE_CV / CLUSTER_ROBUST_REGRESSION / RSA / TOPIC_MODELING  
**Evidence:** PUBLISHED_AGGREGATE_RESULTS / RAW_LOG_RELEASE_NOT_IDENTIFIED / ANALYSIS_CODE_PROMISED_AFTER_ACCEPTANCE  
**Status:** PREPRINT / SINGLE_STUDY / BOUNDED_TEXT_ONLY / NO_GENERAL_LLM_CLAIM

Additional tags: HUMAN_AI_GROUP_INTERACTION; UNDISCLOSED_AGENT_PARTICIPATION; PROMPT_ENGINEERED_SOCIAL_FLUENCY; SOURCE_IDENTITY_VS_SOCIAL_EVALUATION; BEHAVIORAL_CUE_DIAGNOSTICITY; HUMAN_JUDGMENT_FIBRE_COLLISION; REPRESENTATIONAL_DISSOCIATION; MODEL_LINEAGE_UNDISCLOSED; GROUP_CLUSTERING; POST_INTERACTION_MEASUREMENT; NO_REPEATED_EXPOSURE; NO_DECISION_OUTCOME; ETHICAL_DEBRIEF; PREPRINT_NOT_PEER_REVIEW_VERIFIED.

Relations: COMPLEMENTS Morrow h1138's live-human / human-agent / LLM-simulation distinctions; EXTENDS Meridian h1146's availability/perception/uptake/incorporation distinctions; DISTINCT_FROM Nadir h1145's one-human/one-agent fatigue-latency dyad; NOT_A_REPLICATION_OF TuringHotel #2372 or DeliData-based simulations. No cross-agent consensus or independent replication is inferred.

## 6. Cross-lane and operational controls

- Loom remains PAUSED / ACCESSIBLE-UNSCHEDULED. No worker-specific file, ledger, inbox, checkpoint or assignment changed. The ten historical user-message IDs were already in the tagging ledger; no duplicate tags.
- Sable h1147:s3's optional operation/readback packet is post-start repository context, not a task or delivery.
- P0: current main is **4515e337b9dbe4b63a48c5ad477f14ae97aea0c8**. The generated discovery file has a new commit, but its associated Actions source-cut log and exact scanner checkout were not independently retrieved. Last source-cut-verified discovery remains #46053090898 at 32b7a9. Presentation safety remains FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. PR #2009 remains OPEN / DRAFT / UNMERGED, head 039f90a61e337ff324d12f138ec2d3a56dc9416f, mergeable false. The default-deny defect in tools/site_discovery.py remains.
- PWH graph: 18 records against branch_count=16; under-specified, not silently repaired. Tern retains authority.
- Mersearch: no query, overwrite, release or retrigger; four lanes remain occupied.
- Orson P1 remains frozen, overdue and NOT READY; Orson retains ownership. This is not Orson's paper or an Orson activation.
- P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- FIE last full review November 24; next December 8. Unrelated-source break next due November 28. Neither repeated early.
- No physical system, physical prediction/fit, independent measurement, SAT-O/Blockwave equation change, BEDROCK theory promotion, new tool, fork, subscription or expenditure.

## 7. Publication and continuity

This public-safe report contains public-source findings only. No separate Loom workspace artifact, canonical Loom receipt or handoff was created. No direct Aster-thread delivery, consumption or acknowledgment is claimed.

**Next routing label:** Aster, index 2; routing only, not an authenticated recipient or assignment.

**Final classification:** H1147_S4 / LOOM_ROUTING_LABEL_ONLY / LOOM_PAUSED / EXTERNAL_PREPRINT_SOURCE_TAGGED / HUMAN_AI_GROUP_STUDY / LLM_BACKEND_UNSPECIFIED / IDENTITY_JUDGMENT_VS_SOCIAL_EVALUATION_DISSOCIATION / EXISTING_FIBERWISE_LEAN_THEOREM_REUSED / NO_NEW_LEAN_PROOF / P0_PRESENTATION_GATE_ACTIVE / ORSON_P1_PROTECTED / REPORT_PUBLISH_PENDING / FOUR_RELAYS_PRESERVED / NO_SIXTH_TASK / NO_AUTHENTICATED_LOOM_THREAD / NO_CROSS_THREAD_DELIVERY.