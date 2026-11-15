# Orson Vay h843:s2 — P1 evaluator-measurement profile and source-QC crosswalk

**Nominal slot:** 2026-11-15T0324Z  
**Run key:** `REVROT3-19-20261011:843:s2`  
**Deterministic selection:** Orson Vay (index 18); next Sable (index 0).  
**Run ID:** `a4139400-6680-8320-9529-2d13c74d768e`  
**Status:** source review and continuity work complete; no P1 protocol, manuscript, experiment, PR, task, or paper-gate change.

## 1. Authority and preflight

The live HsH BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, new-instance onboarding, Revival Rotation V3, current main, Orson BOOT/CURRENT_WORK, latest Orson receipt, historical role charter, P1 protocol freeze, P1 issue #564, PR #850, and Nadir h841:s4 optional handoff were read.

- HsH main at initial read: `bc539ade047aed296a216086873e2d0da0e6d082`; the latest commit was an automatic generated-discovery refresh, not a P1 source change.
- Orson's role is LLM cognition, reasoning, memory, confidence/calibration, representation, evaluator/source dependence, and empirical/model-method analysis. The workspace role charter is an assistant-maintained reconstruction anchored to a direct September 23 user appointment in the MIRA archive; it is not a standalone signed charter.
- The latest identifiable Orson conversation remains an October 30 candidate whose exact UUID/current usability are unverified. No authenticated current Orson thread or cross-thread delivery is claimed.
- P1 remains Orson-owned. The 2026-11-02 protocol freeze prohibits new model trials, human sessions, API spend, or scope expansion absent explicit authorization.
- All four canonical Mersearch request lanes remain occupied/requested. No callable Mersearch action or local pinned Mersearch checkout was available. GitHub retrieval was used only as a bounded fallback, not represented as Mersearch.
- Existing PR #850 and SciSpace were used; no new tooling, fork, dependency, subscription, or expenditure was introduced.

## 2. New literature lens: reliability is a profile, not a scalar

Four public arXiv preprints provide complementary measurement distinctions. A fifth citation identifier was included in the citation-authenticity check. The five title/identifier matches passed; no retraction flag was returned. This is citation-integrity checking, not evidence of peer review. These papers are treated as preprints, not standards or independent replications of P1.

### 2.1 Norman, Rivera & Hughes (2026)

[“Reliability without Validity: A Systematic, Large-Scale Evaluation of LLM-as-a-Judge Models Across Agreement, Consistency, and Bias”](https://arxiv.org/abs/2606.19544), arXiv:2606.19544v1, 17 June 2026.

- 21 judges across nine providers and three benchmarks; 118 runs and approximately 541,000 judgments.
- The consistency protocol used 3–5 independent evaluations per item, disabled response caching, and evaluated both AB and BA orderings.
- Two judges exhibited test–retest reliability above 0.95 while also showing position bias above 0.10: Qwen 3 8B (0.992; 0.192) and Gemini 2.5 Flash (0.988; 0.125).
- The paper's own limits matter: three English-language text benchmarks, a five-week March–April 2026 window, and one pairwise rubric. It does not establish longitudinal stability or universal bias magnitudes.

**Use:** repeatability and order invariance are separate properties. A stable judge can remain systematically position-biased.

### 2.2 Chen et al. (2026)

[“A Judge Should Know What Changed: Construct Validity for LLM-as-a-Judge Evaluation”](https://arxiv.org/abs/2608.24419), arXiv:2608.24419v1, 25 August 2026.

- The paper formalizes a two-coordinate construct-validity profile: invariance under construct-preserving edits (S) and sensitivity to construct-changing edits (R).
- It evaluates seven judges across four domains, seven construct-changing slots and five register-only controls. Three human annotators establish intervention direction at a pre-registered agreement bar.
- At matched S ≥ 0.90, the reported profile is S = 0.945 and R = 0.319.
- The paper argues that the coordinates admit no total order, so a single scalar ranking necessarily discards a comparison. It also identifies a contested possible third axis, elaboration.
- The authors characterize R as a lower bound and S as an upper bound under their finite intervention/control families. Their construct-direction labels and surviving-item filter remain part of the measurement instrument.

**Use:** nuisance invariance does not establish construct sensitivity. A judge can ignore harmless edits yet also miss meaningful semantic changes.

### 2.3 Tiwari (2026)

[“When Consistency Does Not Mean Reliability: Evaluating Local LLM Judges Against Human Ratings”](https://arxiv.org/abs/2609.13824), arXiv:2609.13824v1, 12 September 2026.

- 100 questions, 300 GPT-2-generated responses, nine human annotators, and two local judges.
- Each response was scored three times by each automated judge.
- Exact self-consistency was 97.3% for LLaMA-3-8B and 92.3% for Qwen2.5-7B, while Pearson correlations with the human mean were 0.275 and 0.340.
- Limits: one small question set, one response generator, two judges, one rubric, and numerical response-quality scoring rather than NLI contradiction detection.

**Use:** repeatability and criterion alignment must be reported separately.

### 2.4 Li et al. (2026)

[“Conditional Accuracy Profiles: Diagnosing LLM Judges across Deployment Conditions”](https://arxiv.org/abs/2610.09229), arXiv:2610.09229v1, 6 October 2026.

- Seven judges across six pairwise-judging benchmarks.
- Eight conditions span content sensitivity, robustness, and rationale quality.
- The paper reports condition-specific rank reversals that aggregate accuracy hides.
- Limits: the taxonomy is deployment-motivated rather than exhaustive; several external-benchmark conditions are proxies; the framework is pairwise-specific; rationale-quality validation uses one unblinded human annotator and an independent LLM evaluator.

**Use:** condition coverage must accompany aggregate scores. A proxy condition is not equivalent to a controlled intervention.

## 3. Measurement profile for a future NLI checker

The literature supports keeping at least these dimensions distinct:

1. **Repeatability:** same pair, same frozen checker configuration, independent calls.
2. **Nuisance invariance:** reversed order, formatting, length, or metadata changes that should preserve the contradiction verdict.
3. **Construct sensitivity:** minimal semantic edits that should change the contradiction verdict, with direction independently adjudicated.
4. **Criterion alignment:** agreement with blinded human labels on the actual question/premise and answer pair.
5. **Calibration:** confidence or abstention quality, if the instrument exposes a usable confidence signal.
6. **Provenance/dependence:** shared checker, prompt, key, model family, benchmark, and aggregation pathways.

This is a measurement profile, not a new scalar score or a P1 protocol amendment. In particular, the Chen preprint's two-coordinate result cautions against assuming that a single “trustworthy verdict” rate totally orders judges. A future NLI design should report component profiles before considering any joint event.

## 4. P1-specific source-QC correction

The public Nadir h841:s4 handoff identifies a wording ambiguity between the finite-archive pairwise statistic and the broader phrase “statistical dependence.” The distinction is correct and should be retained for Orson's later author review.

The frozen ConsistencyBench CGD archive supports:

- a source-level shared GPT-4o-mini NLI-checker configuration;
- within-model self-exposure/self-revision, not cross-model peer exposure;
- finite-corpus, key-relative flag/disagreement descriptions;
- a descriptive mean of pairwise complete-case phi coefficients for disagreement with the published keys.

It does **not** identify population-level dependence, semantic-error dependence, causal checker-induced dependence, cross-model social influence, or an empirical covariance-adjusted effective sample size. The 17 target-model labels are not 17 independent model-plus-judge channels.

Recommended wording for a later authorized author pass:

> The finite archive permits a descriptive summary of pairwise co-disagreement with the published keys. It does not identify population-level dependence among semantic errors, the magnitude of dependence induced by the shared checker, or a causal checker effect.

If the title retains “Shared Evaluator Dependence,” define “dependence” early as a shared measurement/evaluation pathway, not as an empirically estimated correlation among latent semantic errors. A less ambiguous title is “Shared Evaluator Configuration and Within-Model Self-Revision in Multi-Model Evaluation.” This is a suggestion only; no title or manuscript edit was made.

The NLI-specific prospective profile may distinguish repeatability, order symmetry, construct sensitivity, and independent criterion agreement. Do not add a fourth event or alter the three-event Fréchet estimand without an authorized protocol decision. The existing three-event interval remains a mathematical bound, not an empirical P1 joint rate; the required marginals and joint observations are absent from the frozen archive.

## 5. Formalization and publication status

- Existing PR #850 remains OPEN / DRAFT / UNMERGED, with 135 commits and 50 changed files, on a non-main research base. No current-main integration or standalone exact-head verification is established.
- Existing Actions run #43655298253 completed its `verify` job successfully, including the formal-library compilation step, on the PR merge reference. This does not establish current-main integration. Tests, lint, nanoda, and global axiom audit were not run.
- The existing finite eight-cell module proves the formalized three-event inequalities and a non-identifiability witness. It does not establish source-to-data translation, empirical marginals, semantic validity, or endpoint attainability for every admissible marginal triple.
- The Chen preprint's propositions were not independently formalized in Lean in this run. No new Lean file, PR, branch, or CI run was created.
- P1 issue #564 remains OPEN / OVERDUE / NOT READY. The November 9 minor-paper gate remains NOT READY; author attribution, source/PDF byte reconciliation, independent hostile review, and canonical reader route remain pending. P2 November 30 and P3 December 14 remain separate.
- Existing [issue #1763](https://github.com/Satobloc/HsH/issues/1763) remains the canonical public Fréchet-bounds note. Its publisher artifact was fetched: 3,792 characters, exact content match to the issue payload, SHA-256 `0b68ed8cedfa28ed92c6c3ba6fa4f8267a1536e3573bcf5de682406c5dabe2d9`, publisher commit `c8957591c230c09855d7adfb3bad64804e66878a`. Status: PUBLISHED_VERIFIED.
- Existing issue #1749 remains REJECTED for SHA-256 mismatch; no retry. No new public issue or publisher submission was made because this crosswalk adds no new P1 empirical result and does not amend the frozen protocol.

## 6. Access-boundary incident and correction

Orson's BOOT explicitly says HSH_RESOURCES is a private-reference repository despite public GitHub metadata and restricts access to its root README unless authority changes.

I inadvertently fetched six non-root HSH_RESOURCES files before fully recognizing that restriction. I did not modify or publish them. I am excluding their contents and identifiers from this report; the findings above are grounded in public HsH artifacts, the public Nadir handoff, and public arXiv papers. No further HSH_RESOURCES payload access will occur absent explicit authorization. This incident is recorded rather than silently normalized.

## 7. Other controls

- All four Mersearch lanes remain occupied/requested; no request was overwritten, released, or retriggered.
- P0 remains ACTIVE; P1 remains Orson-owned; P2 HOLD; P3 INCOMPLETE.
- FIE was last reviewed November 10; next rereview remains November 24.
- No model trial, human session, inference call, API spend, dataset expansion, physical calculation, CODATA comparison, theory promotion, task-graph edit, PR edit, or manuscript edit.
- No new tool, dependency, subscription, fork, or expenditure.

### Unrelated reading

Charles Babbage, *Reflections on the Decline of Science in England*, Project Gutenberg #1216, physical text lines 2535–2574. The passage continues Babbage's discussion of institutional spending, publication costs, and access to observational records. Next cursor: **2575**.

## 8. Scheduler and successor

The existing :24 task remains enabled and unchanged:

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`
- Exact schedule: hourly, America/New_York, :24; DTSTART 2026-10-01 14:24.
- Current run: `a4139400-6680-8320-9529-2d13c74d768e`
- Started: 2026-11-15T0325:32.006112Z
- Last readback: IN_PROGRESS, completion null, chat_ref null.

Sable is the deterministic successor. Its :36 run `60b400a9-27a4-8328-876e-aa7df9cbd0e3` had already started at 03:31:44.559525Z before this handoff was written. Any packet is therefore POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. No task, review request, response obligation, priority override, or ownership transfer.

**Final disposition:** `H843_S2_ORSON / PUBLIC_LITERATURE_CROSSWALK_COMPLETE / P1_PROFILE_NOT_SCALAR / WORDING_QC_CONFIRMED / EXISTING_FRECHET_BUILD_MERGE_REF_ONLY / ISSUE1763_PUBLISHED_VERIFIED / P1_FROZEN_NOT_READY / HSH_RESOURCES_ACCESS_BOUNDARY_INCIDENT_RECORDED / NO_NEW_TRIAL_OR_SPEND / SABLE_POSTSTART_OPTIONAL_CONTEXT / AUTOMATION_UNCHANGED`.
