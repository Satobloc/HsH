# Calder h1000:s4 | Parisi prompt-content, allocation-inference, and proposal-lineage audit

**Status:** DISTINCT METHODOLOGICAL ADDENDUM / SOURCE-READBACK COMPLETE / NO NEW HUMAN STUDY / EXISTING LEAN RESULTS REUSED / PUBLISHER STATUS RECORDED IN RECEIPT.

**Parent context:** Calder's earlier Review-MIND synthesis at [HsH issue #2074](https://github.com/Satobloc/HsH/issues/2074), and Aldus h996:s4's full-text review at `WORKSPACES/ALDUS/2026-11-21T1248Z_H996_S4_PARISI_FULLTEXT_METHODS_AUDIT.md`. Aldus's separate publisher issue #2281 was rejected for a SHA-256 mismatch; this report is not a retry or republication of that report. It adds a narrower prompt-content and inferential-design analysis.

## 1. Scope and source boundary

Primary source: Parisi et al., *Real-Time Group Dynamics with LLM Facilitation: Evidence from a Charity Allocation Task*, FAccT 2026, arXiv:2605.14097v2, 35-page PDF: https://arxiv.org/abs/2605.14097

This review independently inspected the source's main-text steering result and figure caption (PDF pp. 7-8), group allocation and sample definitions (pp. 19-20), full facilitator prompts (pp. 23-24), alternative consensus/influence metrics (pp. 25-26), keyword figures (p. 29), and illustrative transcripts (pp. 30-33). It did not access the raw full-session transcript corpus, participant-level data, randomization manifest, or analysis code. The published excerpts and aggregate tables are not treated as a substitute for those materials.

Relevant comparators:
- Kim et al., *“I Didn’t Make the Micro Decisions”: Measuring, Inducing, and Exposing Goal-Level AI Contributions in Collaboration*, arXiv:2605.21363v2 (12 June 2026): https://arxiv.org/abs/2605.21363
- Official CoTrace code: https://github.com/rladmstn1714/CoTrace
- Fu, Samii & Wang, *Inference for Group Interaction Experiments*, arXiv:2607.02385 (2 July 2026): https://arxiv.org/abs/2607.02385

The comparator papers are methodological leads, not independent replications of the Parisi findings.

## 1.1 Calder source authority and continuity

The 2026-09-12 Calder entry in `WORKSPACES/COMMON/CHECKINS.md` is a worker-authored self-report describing empirical angle-clustering, adversarial/local null design, independent-unit discipline, calibration/covariance, and source/provenance separation. It is not a direct-user-authored or Nathan Direct specialist charter. No standalone signed empirical-Calder charter or authenticated current empirical-Calder thread has been recovered. A separate same-name Foundational Covariance / Global Architecture Calder history exists and is not merged with this empirical/statistical record. The user-supplied Lane Charter 48 governs this run as a one-run Review-MIND overlay; it does not change Calder's standing assignments.

The live Calder BOOT/CURRENT_WORK summaries contained older conflicting “direct-user” descriptions of this CHECKINS entry. Those summary lines are corrected additively in this run; the historical CHECKINS source itself is not edited.

## 2. New source finding: the “neutral” prompts contain numeric and framing exemplars

The Study 2 Summarization facilitator prompt says that it should not suggest allocation values or introduce its own ideas. The same prompt nevertheless defines a successful consensus using an explicit 40/30/30 example. It also supplies example framings such as urgent humanitarian support versus long-term environmental protection, fairness and effectiveness, concentrating versus spreading resources, and a midpoint or blended approach.

The Study 2 Principles prompt likewise describes a “BinaryStuck” case using a 40/30 versus 30/40 split and recommends highlighting the spectrum, inviting small-step thinking, and connecting to shared goals.

The Study 1 out-of-the-box prompt separately gives a 20/40/40 example and asks the model to move the group toward an exact allocation.

These examples are inside system prompts, not evidence that participants saw the prompts. They are nevertheless model-side numeric and semantic anchors. “Neutral” therefore describes the intended facilitator role, not a content-free prompt. The prompt contains candidate frames and allocation examples that could influence what the model later selects, repeats, or generates.

This is a prompt-design inconsistency and a plausible alternative mechanism. It does not establish that the examples caused any participant allocation or the reported treatment effect. The paper does not report an ablation that removes the exemplars while holding the remaining prompt and interaction policy fixed.

## 3. Three distinct pathways must not be collapsed

The source supports at least three different mechanisms:

1. **Content introduction:** the facilitator originates a new numeric allocation or substantive proposal.
2. **Selection amplification:** the facilitator repeats, summarizes, orders, or gives prominence to a participant-originated proposal.
3. **Frame or agenda shaping:** the facilitator selects the values, contrasts, or decision criteria through which the group interprets the options.

These mechanisms require different evidence.

The Study 1 Gemini transcript begins with the facilitator offering a 30/40/30 example and asking for an exact split. That is direct model-originated numeric anchoring in the Study 1 out-of-the-box condition. It must not be used as direct evidence that the Study 2 Summarization facilitator invented the Study 2 allocation values.

In the published Study 2 Summarization excerpt, the facilitator reframes the discussion around direct human impact, environmental effects, resource urgency, and charity effectiveness. Participants subsequently produce the 45/25/30 proposal. In that excerpt the numerical proposal is participant-authored; the facilitator's visible contribution is framing and attention routing. The Study 2 no-facilitator excerpt also contains spontaneous participant-generated numerical proposals. Numerical proposals therefore do not require facilitator introduction.

Figures 10 and 11 report numeric allocation phrases among facilitator outputs and interpret them as restatements of participant proposals. Token or phrase counts alone cannot establish origin, endorsement, or causal uptake. A trace must identify the earliest proposal event, the facilitator's later reference, the responding participant, and the final decision.

The most defensible current interpretation is that the paper reports a treatment-associated allocation shift and offers qualitative evidence consistent with selection amplification and framing. It does not identify the relative causal contribution of content introduction, selection amplification, and frame shaping.

## 4. Allocation inference: useful design detail and unresolved reporting fields

Study 2 contains 225 three-person groups, each completing three rounds. Each group experiences the three facilitator conditions in randomized order. Three charities are presented per round, with charity triads shuffled across rounds. The group's round-level allocation is defined as the average of the three members' final allocations. Individual pre-discussion and post-discussion allocations are also collected.

The primary consensus outcome is change in a group agreement score. It is not a measure of decision correctness.

Figure 4 instead reports charity-specific differences in average post-discussion allocation under the two Study 2 facilitator strategies relative to the human-only baseline. The reported Global Fund for Women differences are -5.5 and -3.8 percentage points, with p < 0.001 using Welch's two-sided t-test. The paper also reports a Study 1 IFAW allocation shift.

Important distinctions:

- A charity share is a component of a fixed-total allocation vector. Within a round, the shares sum to 100 percent. A lower share for one charity is a redistribution toward the other charities in that round, not an absolute reduction in all support.
- The published figure compares post-discussion shares. Because pre-discussion allocations are collected, a baseline-adjusted post-allocation model or a pre/post change model is available and should be reported as a sensitivity analysis.
- The source defines a group-level allocation as the mean of three members. The reviewed text does not explicitly state the exact independent unit, per-charity-condition sample counts, or whether the Welch tests use those group means throughout. This is a reporting gap, not proof of pseudoreplication.
- Each group experiences all three conditions, while each charity appears in one round for that group. The condition/charity assignment is therefore structured within group. A per-charity comparison across independent groups may be defensible if the tested observations are group-level and the assignment is implemented as described. Joint analysis across charities must preserve within-group dependence and the randomized condition/round structure.
- The paper reports a learning/coordination effect across rounds. Randomized order helps, but the exact sequence counts and treatment-by-period/carryover sensitivity should be available to validate the crossover analysis.

The allocation vector is compositional. A joint vector analysis or randomization inference that respects the fixed total is preferable to treating all charity components as unrelated outcomes. A linear component analysis can remain useful, but its interpretation is relative and the dependence structure should be explicit.

### Multiplicity sensitivity bound

There are 9 charities and 2 Study 2 facilitator-versus-control contrasts, giving 18 obvious Study 2 charity contrasts. If the family is expanded to include 9 charities across 3 Study 1 model comparisons, the illustrative total is 45. Because the paper reports only p < 0.001 rather than exact p-values, a simple Bonferroni upper bound would be <0.018 for 18 tests and <0.045 for 45 tests. Thus multiplicity alone does not automatically erase the highlighted result under those two candidate families. The exact test family, exact p-values, and pre-specification are not stated in the reviewed passage, so no adjusted p-value is claimed.

## 5. Proposed disconfirmable experiment

A next study should separate prompt exemplars from facilitator selection policy. A compact design is a 2 x 2 factorial at the group level:

- Numeric exemplar present versus removed from the system prompt.
- Salience-weighted/revisit policy versus source-balanced equal-coverage summary.

A no-facilitator arm can remain as an external baseline. The exemplar-removal condition should preserve all other wording, timing, model, temperature, and intervention rules. If a repeated-round design is used, condition order must be counterbalanced and period/carryover effects specified; a parallel-group design avoids cross-condition carryover at the cost of requiring more groups.

For every group, retain:

- Individual pre-discussion and post-discussion allocation vectors.
- Group-mean allocation vector for each round.
- Condition, charity triad, round, and randomized sequence.
- Original proposal events with speaker and timestamp.
- Facilitator reference events with source proposal IDs, order, repetition, framing, and whether a numeric exemplar was emitted.
- Subsequent participant response/uptake events.
- Final decision and any objective task constraint or correctness measure.
- Participant perceptions of inclusion, kept separate from speaking share and decision influence.

Use independent human coders blinded to condition and final allocation. An LLM can assist with candidate extraction, but it must not be the sole adjudicator of proposal origin or influence. Double-code a prespecified sample, publish disagreements and adjudication rules, and test the coding scheme on adversarial cases where the same final allocation has different conversational histories.

Primary estimands should be the randomized effect of the prompt exemplar and the summary-selection policy on (a) pre/post allocation change and (b) source-attributed uptake. Secondary outcomes can include proposal survival, minority-proposal retention, turn distribution, perceived inclusion, and objective constraint satisfaction where a genuine criterion exists.

For inference, preserve the group-level assignment and within-group dependence. Use design-based randomization inference under the actual assignment mechanism or a prespecified group-clustered model. Analyze the full allocation vector with a compositional or other explicitly sum-constrained model; handle zero shares explicitly if log-ratio methods are used. The Fu, Samii and Wang group-interaction framework is a relevant design-based comparator, not a claim that its asymptotic results have already been applied to this dataset.

Disconfirmation conditions:
- Removing numeric exemplars does not change facilitator outputs or allocations.
- Equal-coverage summaries do not reduce differential proposal uptake.
- The apparent allocation shift disappears after pre-allocation and period adjustment.
- Facilitator references do not predict subsequent uptake under randomized exposure.
- Independent coders cannot reliably distinguish origin, reference, uptake, and adoption.
- Any reduction in speaking inequality fails to improve inclusion or instead suppresses minority proposals.

No human experiment was run and no participant results are invented here. This is a design proposal requiring consent, transparent disclosure of the facilitator role, privacy-protective transcript handling, and preregistration.

## 6. Relational formalization and existing Lean evidence

A useful event model is:

`Proposal -> FacilitatorReference -> ParticipantResponse/Uptake -> Decision`

Each edge must carry source identity, time/order, and a typed relation such as quote, paraphrase, summarize, endorse, challenge, adopt, revise, or reject. A traceable path is a **lineage witness**, not by itself a causal-effect witness. Causal influence requires an intervention or randomized exposure comparison.

Let `X` be complete interaction histories, `pi : X -> S` an aggregate readout (for example, turn counts, a consensus score, or a final allocation vector), and `L : X -> Lineage` a source-lineage readout. If two histories have the same aggregate readout but different lineage, then no deterministic function of the aggregate alone can recover lineage:

`pi(x) = pi(y) and L(x) != L(y)  =>  no f exists with L = f o pi`.

This is the existing generic projection/factorization result, not a new Parisi-specific theorem.

Existing formal evidence was replayed from GitHub Actions:

- Nadir PR #1189, run #44106198466, job #134119101991: exact source-identity assertion, Lean 4.34.0 / Lake 5.0.0, build SUCCESS (8,961 jobs). `factorization_iff_fiberwise` is reported with `[Classical.choice]`. This is a generic factorization criterion.
- Enheduanna PR #1619, run #43981958006, job #133700427619: exact PR-head checkout, Lean 4.34.0 / Lake 5.0.0, build SUCCESS (8,946 jobs). `occurrence_bound_attribution_has_exact_key` and `absence_from_complete_capture_excludes_scoped_occurrence` report no axioms. The module distinguishes source attestation, context exposure, output attribution, and output occurrence. It does not establish causal influence.

The current runtime has no `lean`, `lake`, or `elan` executable. No new source-specific Lean module was written or compiled. The generic theorem is reused; the source-specific event model remains `FORMALIZATION_BLOCKED_DEFINITION` until raw transcripts and an agreed operational coding schema are available. Lean proves only the formalized statement, not the empirical premises or the correctness of transcript coding.

## 7. Existing tooling and cost check

Mersearch was not callable in this runtime. The four canonical Mersearch request lanes remain occupied/requested; none was created, overwritten, retriggered, or released. The original source was therefore checked directly through arXiv and the existing HsH report, with SciSpace used for bounded literature discovery. The HsH, SAT archive, and HSH_RESOURCES root front doors plus the three-repository onboarding and Common Reference Desk were reviewed. HSH_RESOURCES root documentation only; no private payload was opened.

CoTrace is an existing public implementation, not a tool to rebuild. Its README and pipeline requirements were inspected. The full pipeline defaults to GPT-5.2 and requires an OpenAI API key; OpenAI embeddings are also required for the full Step 2 similarity stage even when another chat provider is selected, unless execution stops before that stage. The paper reports token usage, not a guaranteed dollar cost. No CoTrace code was executed, no API key was used, and no API spend occurred. Its validation is not independent double-coding: the reported manual check was performed by one author on sampled dialogue labels, and the reported error categories include incorrect author attribution and weak relationship links. CoTrace is therefore a candidate annotation aid, not a ground-truth causal evaluator.

Math Hopper issue #578 and PR #991 were checked as existing extraction/QA resources; they are not a substitute for a Lean proof run. Existing HsH PRs #1189 and #1619 provide reusable formal results. Whirligig Kernel 0 remains a sandbox/visualization surface, not a formal verifier. No local repository checkout, `gh` CLI, Lean, Lake, or Elan executable was available. No new tool, dependency, fork, subscription, branch, PR, or paid service was created.

## 8. Scheduler and run identity

Nominal scheduled time: 2026-11-21T16:48Z. The rotation epoch is 2026-10-11T00:00Z, so h=1000, seq=5(1000)+4=5004, and 5004 mod 19=7. The selected ring label is Calder (index 7); the next label is Hale (index 8), h1001:s0. The :48 automation ID remains `6aa6c3bc02b48191b8a91a30d2a155e0`, enabled, with its original hourly America/New_York :48 schedule and Review phase. The current :48 run ID is `90932fcd-8584-8327-811d-d9edf17518f4`, scheduled for 16:48:00Z and started at 16:45:43.962410Z. At the final observation it remained IN_PROGRESS, `chat_ref=null`, with no completion. Its cached `latest_result` still referred to the prior Aster h999:s4 run `7e599680-ac34-8330-95d1-a1513d04e903`, completed at 15:58:44.570070Z. This is not evidence of authenticated Calder-thread execution.

The same final scheduler snapshot showed:
- :00 h999:s0 run `2cb702e9-1c30-8324-8fac-b50361a1cefa` failed at 16:50:45.960228Z after starting at 16:25:42.730852Z; its result text was only “There was a problem with your scheduled task.” No cause is established.
- :24 h1000:s2 run `5aa85426-5814-8322-9257-1790f1b813e8` completed at 16:37:31.037603Z.
- :36 h999:s3 run `9df268e3-f774-8333-a761-fb70ec40c9d6` completed at 16:53:59.155850Z after starting at 16:34:58.194371Z.
- The nominal h1000:s0 (:00) and h1000:s3 (:36) executions were not observed. Thus the h1000:s3 Aldus slot was missing while a delayed h999:s3 Loom execution completed; the :48 h1000:s4 Calder execution began before its nominal slot.

These are observed backlog, missed-slot, overlap, and cached-result distinctions, not a diagnosis of scheduler internals. No task, ID, prompt, phase, schedule, enabled state, or cadence was changed; :12 remains disabled and no sixth task was created.

## 9. Operational continuity

Run key: `REVROT3-19-20261011:1000:s4`. The task identity is `6aa6c3bc02b48191b8a91a30d2a155e0`; it remains enabled with the original hourly `America/New_York` :48 schedule and Review phase. The current run ID is `90932fcd-8584-8327-811d-d9edf17518f4`; its run-level `chat_ref` was null at the last observation. No cross-thread delivery or worker-instance participation is claimed.

The live HsH `main` branch was observed at `d9cc4ea57356fa9f9bb2dafbdc79fe657efb22ac` before this report write. The current task graph was not changed. WH-02 remains Calder-owned and was not modified; PWH queue ownership and priorities were preserved.

The Three Paper Campaign remains: P0 Code Grurple ACTIVE; P1 November 9 cognition OVERDUE / NOT READY / FROZEN / ORSON-OWNED; P2 November 30 HOLD; P3 December 14 INCOMPLETE. FIE was last reviewed November 20 and is next due December 4. No campaign gate advanced.

An unrelated reading break covered SAT archive `fun break - lx.txt`, lines 2926-2965. The passage is an assistant-generated Germanic variety list; no linguistic claims were adopted. Next shared cursor: 2966.

## 10. Disposition

- New source-level finding: supposedly neutral Study 2 prompts contain numeric and semantic exemplars.
- New methodological distinction: proposal invention, selection amplification, and frame shaping are separate mechanisms.
- New inferential qualification: allocation shifts are compositional and embedded in a within-group randomized sequence; the reviewed text does not fully specify the Welch-test unit or sequence counts. This is not labeled pseudoreplication.
- Existing formalization reused; no new Lean proof claimed.
- Raw transcripts, participant-level data, randomization manifest, and analysis code remain unaccessed.
- No human study, model experiment, physical calculation, or independent measurement was performed.
- No P0/P1/P2/P3 campaign gate advanced. Orson's P1 manuscript, dataset, protocol, experiments, and ownership were untouched.
- This addendum does not alter HsH BEDROCK, SAT-O, Blockwave, the Three Paper Campaign, or any worker's primary assignment.

**Next exact research step:** obtain the Parisi group-level analysis code or a de-identified allocation/transcript export with the randomized sequence manifest, then preregister the prompt-exemplar x summary-coverage ablation before any new human recruitment. The pre-write HsH `main` snapshot observed immediately before this report was `d9cc4ea57356fa9f9bb2dafbdc79fe657efb22ac`.
