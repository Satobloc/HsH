# Hale h890:s4 | FORMS preprint: source, statistics, implementation and latency QC

**Date:** 2026-11-17  
**Selected ring label:** Hale (index 8)  
**Next ring label:** Elias Kern (index 9)  
**Run key:** REVROT3-19-20261011:890:s4

**Disposition:** Bounded independent audit of arXiv:2609.37369 and its public source repository. The committed questionnaire data and notebook outputs were replayed. The principal statistical correction is that the reported “Regulatory Awakening” test does not test pre/post change. The public implementation snapshot also does not reproduce several equations and latency mechanisms described in the preprint. This is a source/code/data QC report, not a formal peer review, author contact, independent replication, or endorsement.

## 1. Revival authority and source boundary

The historical Hale remit is supported by the worker self-report in HsH’s Common CHECKINS record and the REV-006 Hale re-entry packet. It is an external-literature and empirical-calibration specialization: locate primary research, compare study designs and controls, inspect datasets and code, and distinguish actual observations from proposed mechanisms. No standalone signed Nathan-authored Hale charter was recovered.

The bounded existing-thread lookup did not identify a current usable Hale conversation. The personal-context lookup returned only an older pre-self-naming candidate, not a user-confirmed current Hale thread. This is a source-grounded revival in the current scheduled execution, not authenticated participation by the historical Hale instance.

The latest prior Hale receipt was h879:s2, 2026-11-16 15:24Z, a P0 discovery-delta report. Its publication state was already verified. The current Hale workspace has CONTINUITY and INBOX surfaces; the expected README and CURRENT_WORK paths were not found. No incoming h890:s4 handoff from Calder was located.

## 2. Primary source and immutable repository snapshot

Primary paper: [Shaping Opinion: Quantifying the Psychological Impact of Autonomous Multi-Agent LLM Interactions](https://arxiv.org/abs/2609.37369), arXiv:2609.37369, version 1 submitted 2026-09-26. It is an arXiv preprint; no journal publication record was established in this audit.

The paper links to [marcosrv-ULL/FORMS](https://github.com/marcosrv-ULL/FORMS). The inspected public main branch is at commit [3cd18b8fdf900ce2141027091a86836af1c4b3b9](https://github.com/marcosrv-ULL/FORMS/commit/3cd18b8fdf900ce2141027091a86836af1c4b3b9), dated 2026-05-05. That is 144 days before the arXiv v1 submission. The inspected public main snapshot is therefore not a version-matched release tied to the paper.

Key immutable source blobs at that commit:

| Source | Git blob SHA-1 |
|---|---|
| README.md | 037e99aa3f80f64934d65f9b734ed9324c798560 |
| adolescent merged pre/post CSV | 37ec527027d2c5d9b4760ecc7a08b4fa6f5a8e28 |
| adolescent total_pre.csv | a165119a0a72c9d732891dc175f037d441d8200b |
| adolescent total_post.csv | eff12d29f9a6aa51d899219fccc801e579820f27 |
| hypothesis_def.ipynb | b9160852e9b5b5b22eb703d9e2308cca195514c5 |
| adults_pre.csv | b2d76ee3d70208ce40394e40ae5afcc7f1789d5d |
| adults_post.csv | 5f2424d4c38615a8903e30842cf09ba56a58187e |
| dynamic NLI ranker server.py | 850d17ce146cea762fd0034bab372a4bb7bee4c9 |
| dynamic NLI ranker tests | 0314c41a7a68882d15f95e97086a628dd346f5be |
| main chat orchestrator.ts | c78ec1a10a5de32fd3a02616a079f54e3ca38dfd |
| Groq service | 26877f99adfa38c2df59f47105c5f845cd8f0f4a |
| Kokoro client | ca1104eb4039e7b6c34902b2055993582817aec0 |
| Kokoro server | f89858e0ab2b7fe2989a0f55dcc9730f776977ef |
| alternate conversational-ranker scoring.py | 254c5244738cae29b85637dd061818533e01c7b2 |
| alternate conversational-ranker pipeline.py | 83bbdc0d00a186e08ad81bf82cff9b136c22f79a |
| alternate conversational-ranker config.py | 3ca67318269a70b5a908db22b93df22b0dc6e85e |
| dynamic_nli.txt | 0b170b88bd5cf41bca0dde23d042c90c40f1ba43 |

The raw survey export ZIP was not opened. Participant identifiers and individual records are not reproduced in this report.

## 3. What kind of human–AI interaction was studied?

The preprint describes a three-agent AI debate panel, a human moderator, and human audience participants. The primary cohort comprised 120 adolescents aged 14–17; the adult pilot comprised 25 participants. The protocol included a live debate and moderated audience Q&A.

This is evidence about human-audience exposure to a multi-agent debate system. It is not the same topology as a co-equal mixed human–AI group jointly deliberating and making a decision. The moderator is also a human intervention point. The distinction matters when classifying evidence about consensus, social influence, or group cognition.

The authors report institutional ethical compliance, consent/assent, and anonymization. The paper does not provide an independently verifiable protocol identifier in the inspected text. The public repository contains processed participant-level CSV rows with pseudonymous IDs and demographic fields, rather than aggregate-only tables. Because the adolescent cohort includes minors, the public release merits a privacy/data-minimization review. No re-identification attempt was made; no raw identifiers are reproduced here.

## 4. Dataset flow and independent statistical replay

The notebook’s adolescent analysis applies complete-case deletion across ten numeric pre/post fields (P1–P5 at both time points).

| Adolescent data stage | Rows |
|---|---:|
| total_pre.csv | 120 |
| total_post.csv | 119 |
| merged matched records | 113 |
| complete cases used by the notebook | 112 |

The processed source retains six group-specific pre/post sheets. Pre counts are 21, 20, 19, 17, 20, 23; post counts are 21, 20, 18, 17, 20, 23. The paper does not define whether these are independent sessions, classrooms, or administrative partitions. The merged analysis drops the group label and reports no group/session-level model. If these are session clusters, ordinary participant-level tests do not account for within-session dependence.

For the adult pilot, the source has 24 pre rows and 25 post rows. The notebook’s inner join produces 23 matched records; the Q4 post analysis uses 23 valid responses. Thus the 91.3% figure is 21/23, not 23/25.

### H1: individual stance switching

The notebook’s complete-case sample has 43/112 participants changing the P6 governance category: 38.4%. For the binary “Regulation” category, the discordant transitions are 18 non-regulation → regulation and 19 regulation → non-regulation. The exact two-sided binomial/McNemar balance test is p=1.000.

The 38.4% figure is individual preference turnover. It does not itself measure group-level consensus, polarization, or fragmentation. The near-balanced directional flow shows no net movement toward the strict-limits category.

### H2: “Regulatory Awakening” does not test change

The notebook tests P5_post against a neutral value of 3.0 using a one-sample t-test. Reproduction gives mean 3.482, t(111)=4.680, p=8.166×10^-6, d=0.442. That establishes that the post score is above neutral. It does not test whether the debate increased the score.

The paper’s hypothesis/table labels Regulation as a paired pre/post measure, and the committed data contain both P5_pre and P5_post. An independent paired reanalysis of the same 112 complete cases gives:

- Pre mean: 3.464
- Post mean: 3.482
- Mean post-minus-pre change: +0.0179
- t(111)=0.1437
- p=0.8860
- Cohen’s dz=0.0136
- 95% CI for the mean change: [-0.2284, +0.2641]

The paired result was independently cross-checked in Python/SciPy after the JavaScript source replay. It provides no evidence of a regulatory increase. The one-sample test answers a different question and cannot support the causal or change wording “interaction increases demand.”

### H3: separate the overall and subgroup results

The P2 trust item changes from mean 2.902 to 2.705, t(111)=-1.938, p=0.0551, dz=-0.183. This is marginal and does not cross the conventional 0.05 threshold.

The P3 subgroup test for participants with P3_pre ≤ 3 reproduces the reported p≈0.001 result on n=54. The raw numeric mean rises from 2.04 to 2.67. The paper describes this as lowered influence estimation and reports a negative effect-size sign under its pre-minus-post convention. The exact item anchors and polarity need to be stated alongside the result before the directional prose can be independently adjudicated; the inspected notebook path does not visibly reverse-code P3.

### H4 and H5: exploratory post-intervention associations

The notebook reports H4 surprise-group p=0.031 and H5 experience-valence p=0.036. H5 compares 88 positive/useful/interesting responses (mean 3.57) with 16 weird/negative responses (mean 2.88); eight neutral responses are excluded.

These are post-intervention subgroup associations, not randomized treatments. They do not establish that surprise or a “fluid” experience caused regulatory demand. The inspected notebook contains no familywise or false-discovery correction for the multiple hypothesis tests. These p-values should be presented as nominal/exploratory.

### H6: adult “truthfulness” is a perception item

The adult Q4 post-only analysis has n=23, mean 4.17, with 21/23 (91.3%) agreeing or strongly agreeing. It is a single subjective comparative item about whether the AI debate felt more truthful than similar debates with real people. It is not an objective factual-accuracy measure, a blinded human-versus-AI comparison, or a pre/post effect. The large one-sample distance from neutral should not be described as proof that AI debate is actually more truthful.

### Statistical disposition

The notebook’s saved H1–H6 outputs reproduce from the committed files after its complete-case filter. The key correction is interpretive: H2’s one-sample test is not a pre/post test. H1 is individual switching, not group consensus. H3a is marginal. H4/H5 are exploratory associations. H6 is a small-sample subjective perception item. Group/session dependence and multiple testing remain unaddressed.

## 5. Public implementation does not reproduce several stated equations

The preprint describes a score with an explicit vocative bonus, conceptually NLI entailment probability plus an empirical weight times an explicit-address indicator. It also describes an anti-monologue rule that excludes the previous speaker unless explicitly addressed.

The inspected public main snapshot contains two different ranker implementations:

1. The dynamic NLI ranker uses name, role, keyword, and description hypotheses with weights 1.00, 0.90, 0.75, and 0.65, then takes a maximum score. It adds a continuity bonus to the previous speaker (0.20 by default, reduced to 0.05 for a high-confidence winner). It does not implement the paper’s explicit additive vocative term or previous-speaker exclusion. The continuity bonus favors the previous speaker, which is structurally opposite to the stated anti-monologue exclusion.
2. The separate main/apps/api conversational-ranker prototype uses a hashing encoder and fixed weights including BETA_VOC=0.5 and DELTA_CONT=0.15. It is not the same NLI implementation and does not supply the paper’s stated strict-priority/exclusion rule.

If the NLI base score is a probability in [0,1], a constant additive vocative bonus guarantees strict priority over every non-vocative candidate only if omega>1. The preprint calls omega an empirical strict-priority weight but the inspected public code does not expose that parameter or its calibration.

The paper may describe a later or private implementation. Because the public main commit predates the preprint by 144 days, this is a version-matching/reproducibility gap, not proof that no later implementation existed. A paper-matched code snapshot is needed.

The inspected main chat orchestrator calls the NLI ranker for speaker selection but sets reactionIntent to the constant neutral_filler. No call to the separate reaction-NLI route was found in that path. The paper’s dynamic reaction-NLI/filler architecture is therefore not reproduced by the inspected orchestrator.

## 6. Latency and hardware claims

The preprint reports mean components of NLI 18.44 ms, LLM TTFT 175.64 ms, and Kokoro TTS 32.91 ms, summing to 226.99 ms. For the Kokoro configuration, the table gives no acoustic filler, so the reported gap is 226.99 ms; p90 is 243.02 ms and p99 is 256.25 ms.

The paper also states a strict sub-60 ms perceptual target. Its own Kokoro table does not meet that target. Even subtracting the separately mentioned 30 ms pacing quantity yields 196.99 ms, still well above 60 ms. Under the stated gap model, a 226.99 ms latency requires more than 166.99 ms of actual acoustic masking to get below 60 ms. The 30 ms quantity is called a pacing pause, not an acoustic filler; subtracting an added pause from elapsed latency is not justified without a precise timing boundary and measurement definition.

The inspected Kokoro server buffers the generated audio for a complete phrase before yielding it. The main API client reads the complete WAV response into a buffer before returning it to the orchestrator. This is phrase-level streaming, not evidence of first-token/first-audio-chunk streaming. The server’s TTFA measurement is taken after the first phrase has been generated, not at the first internal model chunk. No raw 100-interaction latency log or matching benchmark dataset was found in the inspected repository tree. The 30 ms pacing pause was not located in the checked code path.

The paper identifies an NVIDIA RTX 4080 Ti with 16 GB. NVIDIA’s official 4080-family page lists RTX 4080 and RTX 4080 SUPER, both 16 GB, but not an RTX 4080 Ti. The exact hardware model needs clarification. The LLM call in the inspected service uses Groq’s cloud API; the measured system is therefore hybrid cloud/local, not entirely local consumer hardware.

Sources: [NVIDIA RTX 4080 family specifications](https://www.nvidia.com/en-us/geforce/graphics-cards/40-series/rtx-4080-family/); [Groq service source](https://github.com/marcosrv-ULL/FORMS/blob/3cd18b8fdf900ce2141027091a86836af1c4b3b9/main/apps/api/src/services/groq.ts).

## 7. Proof-first and formalization status

The timing arithmetic is directly checkable from the reported measurements: with Lc=226.99 ms and no filler, the gap is 226.99 ms; even a 30 ms subtraction leaves 196.99 ms, not below 60 ms. The strict-priority condition for an additive vocative bonus is also conditional and explicit: if base NLI scores range from 0 to 1, omega must exceed 1 to guarantee that every explicitly addressed candidate outranks every non-vocative candidate.

I checked the existing HsH Lean workstreams (#262, #1189, #1860, and #787), Math Hopper’s committed extraction adapter/panorama, and the existing Whirligig build log before considering new tooling. Those existing Lean PRs formalize different source-provenance or geometry statements; none proves this paper’s timing inequality, statistical interpretation, or implementation correspondence. Math Hopper is an archive-math extraction tool and its three-repository pilot remains unverified; Whirligig is an unrelated geometry-engine sandbox.

No local Lean, Lake, or Elan executable is installed in this runtime. No existing authorized exact-head CI job formalizes the FORMS claims. I did not create a Lean module or PR, and I do not claim a Lean compilation or formal proof. The data reanalysis was executed in JavaScript and independently cross-checked in Python/SciPy. Compilation, statistical reanalysis, source-code correspondence, and physical validation remain separate evidence classes.

SciSpace was available and used for literature discovery. No new tool, dependency, fork, subscription, or expenditure was introduced. Mersearch was not used because this was an external paper/code audit, not a SAT/HsH archive query; all four existing archive request lanes remain untouched.

## 8. Humane QC and a disconfirming next-study design

The strongest next experiment would distinguish three different outcomes that the preprint sometimes blends:

- perceived truthfulness of an AI debate;
- objective factual accuracy of the debate;
- changes in individual or group decisions after exposure.

Use multiple independent sessions per condition, not a single session or an undefined set of data partitions. Randomize session-level exposure to a multi-agent AI panel, a human panel, and a suitable control. Preserve session/group IDs, participant nesting, repeated pre/post measures, moderator interventions, exact prompts, model/provider revisions, and raw timing logs. Pre-register a primary outcome and multiplicity plan. Use blinded factual adjudication separately from perception ratings. Measure group consensus directly if the claim concerns consensus; individual preference switching is not a substitute.

A source-provenance design could additionally randomize whether agents share the same evidence packet or receive independently sourced evidence. That would test whether apparent agreement tracks independent evidence or shared-source dependence. Any study involving minors requires appropriate ethics review, consent/assent, data minimization, and a careful public-release plan.

## 9. Cross-lane and project boundaries

The current h890:s0 Archive result was cross-read. It correctly distinguishes the direct-source Q=6 He-3 example from the direct three-filaments-per-nucleon rule and labels the Q=9 arithmetic correction as assistant-authored. Its two different worldtube constructions remain distinct; no map or physical equivalence is established. The arithmetic correction is not an independent physical validation.

The current PWH queue remains stale relative to later branch observations. WH-01’s ledger still has 59 records and its documented cursor remains 17:50Z; no telemetry rows or cursor were changed here. WH-02 remains Calder/authorized-maintainer owned. The task graph remains a machine-readable routing index, not theory authority. No PWH ownership or task priority was changed.

| Workstream | Status |
|---|---|
| P0 Code Grurple | ACTIVE |
| P1 Orson cognition | OVERDUE / NOT READY; Orson-owned and protected |
| P2 measured geometry | HOLD |
| P3 full theory | INCOMPLETE |

The November 9 minor-paper gate remains missed. November 30 major and December 14 full-theory gates remain separate. FIE next review remains November 24; no rereview was due.

No new model trial, human-subject experiment, participant contact, physical calculation, parameter fit, independent measurement, new Lean module, code patch, PR, manuscript edit, paper-gate advancement, or theory promotion occurred. This report does not count as an Orson P1 research session and does not change his ownership or frozen protocol.

## 10. Publication and successor status

This report is intended as a public-safe aggregate QC artifact. It contains no participant-level rows, IDs, or raw survey excerpts. It should be published through the existing HSH-PUBLISH-V1 issue publisher, with exact SHA-256 validation and repository readback. A queued issue is not publication; if the publisher has not completed, status must remain pending.

Next nominal ring label is Elias Kern, h891:s0. Any repository inbox note is optional post-start context only. It is not a ChatGPT-thread message, assignment, deadline, response obligation, consumption, or acknowledgment.

**Disposition:** HALE_H890_S4 / SOURCE_GROUNDED_REVIVAL / ARXIV_PREPRINT_QC / DATA_REPLAYED / H2_CHANGE_CLAIM_NOT_SUPPORTED_BY_PAIRED_TEST / H1_INDIVIDUAL_SWITCHING_NOT_GROUP_CONSENSUS / H3A_MARGINAL / H4_H5_EXPLORATORY_UNCORRECTED / H6_SUBJECTIVE_POST_ONLY / PUBLIC_CODE_VERSION_PREDATES_PREPRINT / RANKER_EQUATION_MISMATCH / REACTION_NLI_PATH_NOT_FOUND_IN_ORCHESTRATOR / KOKORO_LATENCY_NOT_SUB60 / HARDWARE_LABEL_NEEDS_CLARIFICATION / NO_LEAN_BUILD / NO_NEW_TOOLING / ORSON_P1_PROTECTED / P0_ACTIVE / P2_HOLD / P3_INCOMPLETE / NO_HUMAN_SUBJECT_EXPERIMENT / NO_PHYSICAL_RESULT / NO_THEORY_PROMOTION / NO_TASK_CHANGE / NO_CROSS_THREAD_DELIVERY.