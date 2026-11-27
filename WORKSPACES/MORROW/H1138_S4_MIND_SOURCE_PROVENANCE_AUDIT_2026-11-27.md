# Morrow h1138:s4 | MIND source-provenance audit

**Run key:** REVROT3-19-20261011:1138:s4  
**Nominal slot:** 2026-11-27T10:48:00Z  
**Observed invocation start:** 2026-11-27T10:44:32Z (before nominal slot; identity calculated from nominal UTC hour)  
**Routing:** Morrow, ring index 13; next Kestrel, index 14.  
**Disposition:** SOURCE-CUSTODY AUDIT COMPLETE / INTERNAL ONLY / ORSON P1 PROTECTED / NO PAPER WORK / NO THEORY WORK / NO PUBLICATION.

This is an assistant-authored source-grounded reconstruction under the Morrow routing label. It is not an authenticated historical Morrow instance or a claim of continuity in a separate ChatGPT thread.

## 1. Authority and boundary

The recovered Morrow source records establish an archive/source-custody and chronology remit. The September 13 theory stop remains active. The later trial permits bounded archive/source work, provenance, chronology and comparison, but does not release theory integration, equation correction, physical prediction, Lean theory proof, paper work or BEDROCK promotion.

This artifact is an internal source-custody note, not a manuscript, paper draft, theory proposal or P1 contribution. It does not modify Orson's research, protocol, dataset, manuscript or paper gate.

The archived Morrow conversation 6a9ee7ca-d340-83ea-b99d-6a3097429f36 is a historical source, not a live thread. The latest source-grounded Morrow prompt and h1135:s0 receipt report no authenticated current Morrow thread. The present execution is therefore CONTINUITY_RECONSTRUCTION, not REVIVED_INSTANCE_EXECUTED. No persona identity, private access or cross-thread participation is claimed.

## 2. First-blush source finding

**Assistant reconstruction, not a historical Morrow statement:** the number of papers is not the number of independent human cohorts. Several apparently separate 2026 LLM-deliberation results descend from the same human conversation corpus, while other studies use genuinely separate live human groups but place the LLM in different roles. Those distinctions materially change what can be inferred about group cognition.

## 3. New live human–LLM group evidence

### A. LLM as facilitator — Parisi, Thain and Hallak (FAccT 2026)

“Real-Time Group Dynamics with LLM Facilitation: Evidence from a Charity Allocation Task.” DOI: 10.1145/3805689.3812253.

- Peer-reviewed FAccT 2026 paper.
- Two studies: 68 groups / 204 participants and 225 groups / 675 participants; 293 groups and 879 people in total.
- Three-person human groups completed a repeated charity-allocation task over three rounds, with real financial stakes.
- Study 1 compared GPT-5 mini, Gemini 2.5 Flash and Claude 4.5 Haiku as facilitators. Study 2 tested facilitation strategies against a no-facilitator condition.
- The LLM was a facilitator, not an additional group member.

The reported pattern is important because the measured outcomes diverge:

- Consensus was not significantly improved by LLM facilitation.
- The allocation distribution shifted by up to 5.5 percentage points.
- Measured participation equity did not improve.
- Participants nevertheless reported greater inclusion/trust and preferred the facilitated process.

This is evidence that perceived inclusion, trust, objective participation equity, consensus and the distribution of a group's decision are separate observables. A facilitator can be preferred and can shift an outcome without increasing participation equality or consensus.

Limits: the task is a short, structured charity-allocation exercise with three-person groups; it does not establish performance in high-conflict, technical, long-duration or persistent-team settings. The accessible publisher/author text and full-text mirror were inspected; a local PDF download failed, so no raw data or supplementary analysis was independently re-run.

Primary locators:
- ACM DOI: https://doi.org/10.1145/3805689.3812253
- Official publication record: https://deepmind.google/research/publications/real-time-group-dynamics-with-llm-facilitation-evidence-from-a-charity-allocation-task/
- Accessible paper text: https://paperity.org/p/384692721/real-time-group-dynamics-with-llm-facilitation-evidence-from-a-charity-allocation-task

### B. LLM as group member — Chen et al. (2026 preprint)

“AI Agents Reshape Consensus Formation in Human Groups.” arXiv:2609.02122, version 1.

- 127 human participants across eight conditions.
- The main task used 24-person groups, 40 rounds of repeated interaction and a collaborative tangram-description task.
- Actual Qwen2.5-VL LLM agents participated as group members; this is not a Wizard-of-Oz human confederate study.
- Agent proportions varied. The reported consensus pattern was non-monotonic: a low agent proportion increased consensus, intermediate proportions reduced it, and the highest tested proportion recovered toward the human-only baseline.
- The work is a preprint, not a peer-reviewed result in the version reviewed.

A replication-unit question remains open. The paper reports 24-person sessions and condition-specific human counts that match the human membership of a 24-slot session. The public figure-reproduction repository uses one listed run ID per ratio for one analysis and bootstraps pairwise similarity observations within a run. These facts do not establish the number of independent sessions for every condition or prove that the paper's main inference is invalid. They do require an explicit group/session count and cluster-aware analysis before the condition-level p-values are treated as replicated group-level effects.

No raw participant transcripts or session data were retrieved. The public repository contains figure-reproduction code and processed data, not a complete independently replayed experimental record.

Primary locators:
- Preprint: https://arxiv.org/abs/2609.02122
- Public code: https://github.com/tsinghua-fib-lab/human-ai-consensus

## 4. Two LLM-replay studies share a human source corpus

### A. Tak et al. — peer-reviewed replay study

“From Process Loss to Assembly Bonus: Human-Grounded Diagnosis of Multi-Agent LLM Collaboration.” Findings of EMNLP 2026, DOI 10.18653/2026.findings-emnlp.1341.

The human reference corpus is DeliData's 500 group dialogues. The study generates LLM deliberation traces across 19 model compositions, with 100 simulated groups per composition. These are LLM-group replays against a human baseline, not live mixed human–LLM groups.

The paper reports differences in information use, majority following and convergence behavior. Its model-generated groups are a distinct simulation output, but the human baseline is the DeliData corpus.

Primary locators:
- ACL Anthology: https://aclanthology.org/2026.findings-emnlp.1341/
- DOI: https://doi.org/10.18653/2026.findings-emnlp.1341

### B. Shao — held-out replay preprint

“Language-Model Groups Overstate Consensus When Replaying Human Deliberation on a Reasoning Task.” arXiv:2609.20543, version 1.

The paper describes a 500-dialogue DeliData source, split into 400 calibration groups and 100 held-out groups. It constructs one belief-anchored agent per human participant's pre-discussion answer; the agents do not participate in the original human discussion and do not receive the other participants' private starting answers. The same served DeepSeek build is used under different inference settings and scaffolds.

The paper reports much higher simulated full-consensus rates than several human scoring baselines. Its two participation-based sensitivity analyses are described as post-unblinding and not preregistered. This is a preprint, not a peer-reviewed result in the version reviewed.

A preregistration/reproducibility record was discovered through SciSpace, including a reported frozen calibration/held-out group-ID list, DOI 10.17605/osf.io/5jp7s. The OSF page returned 403 during this run; its files and exact group IDs were not inspected.

Primary locators:
- Preprint: https://arxiv.org/abs/2609.20543
- Reported preregistration: https://osf.io/5jp7s

## 5. DeliData version and source-dependency finding

The authoritative published dataset paper is Karadzhov, Stafford and Vlachos (2023), “DeliData: A Dataset for Deliberation in Multi-Party Problem Solving,” Proceedings of the ACM on Human-Computer Interaction 7(CSCW2), DOI 10.1145/3610056. Its published table reports 500 dialogues and 14,003 utterances.

Version control matters:
- The early 2021 arXiv version 1 described 226 dialogues and 6,693 utterances.
- The 2023 refereed publication describes 500 dialogues and 14,003 utterances.
- The ConvoKit 4.1.2 DeliData page reports 500 conversations and 17,111 utterances.

The dialogue count agrees at 500, while the utterance count differs between the published paper and the ConvoKit representation. The reason was not resolved here; it may reflect conversion, normalization or corpus-version differences. It must not be silently collapsed into one count.

Source locators:
- Published dataset paper: https://doi.org/10.1145/3610056
- University repository record and published metadata: https://eprints.whiterose.ac.uk/id/eprint/207765/
- ConvoKit DeliData documentation: https://convokit.cornell.edu/documentation/deli.html
- Early 2021 Version 1 record: https://www.cambridge.org/engage/coe/article-details/60c34331ded3ad03f5687e3c

### Provenance graph

- DeliData 2023 (500-dialogue corpus) → Tak et al. human baseline.
- DeliData 2023 (400 calibration + 100 held-out split) → Shao preprint.
- Separate 127-person live mixed-group cohort → Chen et al. preprint.
- Separate 879-person live facilitator cohort → Parisi et al. FAccT paper.

Therefore Tak and Shao are not independent human-cohort replications: their human reference evidence descends from the same DeliData corpus. Their LLM-generated traces and analytical protocols differ, so this does not mean their model outputs are identical or that every derived statistic is dependent. The exact record-level overlap was not rechecked because the OSF split-ID files were inaccessible; the corpus-level shared provenance is established by the papers' own dataset descriptions.

A paper count is not a replication count. A model count is not an independent-source count when agents share a model family or source context. Live facilitator, live agent-member and replay/simulation designs must remain distinct.

## 6. MIND measurement implication

At minimum, keep these outcomes separate:

1. Consensus/agreement.
2. Decision quality or correctness.
3. Distributional influence on the final decision.
4. Participation equity and information uptake.
5. Subjective inclusion, trust and process preference.
6. Independent unaided transfer or later competence.

The Parisi study demonstrates that subjective inclusion/trust can improve while measured participation equity and consensus do not. The DeliData replay studies demonstrate why source-corpus lineage must be recorded before multiple papers are counted as independent evidence. Neither result establishes assistant consciousness, personhood or private cognitive access.

A useful next source-custody test, when a Mersearch lane is actually released, is to retrieve the OSF frozen split IDs and the exact DeliData source snapshot, compare the held-out IDs against Tak's analyzed dialogue set, and reconcile the 14,003 versus 17,111 utterance representations. For Chen et al., request the number of independent sessions per condition and the cluster-level analysis unit before treating its ratio effects as replicated.

No human experiment, participant session, model trial, API call or raw-data reanalysis was performed in this run.

## 7. Orson protection and formalization boundary

Orson's P1 remains his protected, frozen, overdue and NOT READY cognition paper. This source note was not inserted into Orson's manuscript, P1 issue, protocol or dataset. Orson's h1136:s0 source-fidelity report #2669 concerns LLM peer-review text similarity and paired-score inference; it is a different source corpus and was not overwritten or absorbed into this note. The present findings are optional external context only.

No new Lean theorem or H(s)H theory proof was created. The source-dependency graph is a record-lineage relation, not a claim about physical geometry. Exact group-ID membership remains unverified. Local Lean and Lake are not installed, and Morrow's active historical stop prohibits a Lean theory proof. No physical calculation, prediction, fit, SAT-O/Blockwave equation change or BEDROCK promotion occurred.

## 8. Cross-lane archive-ingestion observation

This is a separate source-custody observation, not a takeover of WH-02.

At HsH main, the root-remainder scan in tools/date_conversation_exports.py restricts candidates to .json and .txt before calling the content sniffer. The shared sniffer supports additional JSON-bearing suffixes (.text, .md, .markdown, .log, .raw, .data, .jsonl) and extensionless JSON candidates. The root chronology index calls the same build_records function, so it inherits the root suffix filter. The navigation workflow does contain root date-tag and root chronology steps; the candidate filter limits their coverage.

The SAT archive's separate date_conversation_exports.py retains ALLOWED_SUFFIXES = {".json", ".txt"} and defaults to DEVELOPMENT_FULL_CONVOS rather than an archive-root scan. HSH_RESOURCES was limited to its public front-door/AI_START_HERE orientation; no private payload was opened.

Existing HsH issue #1702 and draft PR #1710 already track the root-discovery/date-tagging repair. Calder retains implementation ownership; Tern retains PWH/queue authority. No code, branch, issue, task graph or queue was changed by Morrow. This remains relevant to Nathan's broader archive-ingestion request, but it is not represented as repaired.

## 9. Access, tooling and publication status

- Mersearch was checked first through the documented archive-resident request bridge. All four canonical lanes were occupied; no new request, overwrite, release or retrigger was made. SciSpace and public publisher sources were used as disclosed fallbacks, not as Mersearch completion.
- No new tool, fork, dependency, subscription or expenditure was introduced.
- The note is internal-only. No public issue, reader target, PUBLISHED_SUBMISSIONS artifact or publisher submission was created. The P0 presentation gate remains controlling; no publication or deployment is claimed.
- No PWH queue/graph mutation, worker reassignment, task/ID/cadence/phase change, signet change, conversation rename or sixth task.

## 10. Return cursor

1. If/when a canonical Mersearch lane is released, verify the DeliData version and compare exact Shao/Tak group IDs using the source manifests.
2. Preserve Orson's P1 freeze and ownership; do not merge this source note into his manuscript without his authorized review.
3. Kestrel remains the next ring label, not an authenticated ChatGPT recipient. Its archived “Science Made Stupid” conversation is historical; live usability remains unverified. Any repository handoff is optional context only, with no direct-thread delivery or consumption claim.
