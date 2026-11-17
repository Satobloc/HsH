# Orson h900:s2 | Budget-matched debate and response-validity audit

**Run key:** `REVROT3-19-20261011:900:s2`  
**Selected:** Orson Vay (ring index 18)  
**Next ring label:** Sable (ring index 0)  
**Status:** bounded external-source audit; conditional Lean formalization; P1 protocol remains frozen.

## 1. New external comparator

Leonardo Ferreira, Gardenia Liu, and Kaden Zheng, "Beyond Symmetric Agents: Cognitive Diversity and Multi-Agent Debate in Small Language Models," arXiv:2609.35875 (submitted 2026-09-26).

- [Official arXiv record and full HTML](https://arxiv.org/abs/2609.35875)
- [Full-text methods, results, context-window analysis, and limitations](https://arxiv.org/html/2609.35875)

The paper reports 23 small open-weight models from 11 vendor families, five tasks, and more than 5,500 runs. It tests three operationalized diversity axes: persona prompts, sampling temperature, and model identity.

Its important control is not passive majority aggregation. The principal comparison uses three agents over three debate rounds against nine independent samples with majority vote, matching the number of generated answers. In the core mixed-model analysis, 80 three-model teams across four tasks produce 320 team-task cells. Debate is 1.04 percentage points below matched self-consistency (95% CI [-1.61, -0.52]); a second seed gives -0.93 points (95% CI [-1.45, -0.44]). The authors report no consistent benefit from the tested diversity manipulations and find debate often ties or loses to matched sampling.

The paper also reports a resource distinction: equal generation counts do not mean equal total cost. Debate used about 1.6x wall-clock time and 3.4x total tokens in the reported setup, largely because agents must consume peer transcripts.

**Interpretation:** the paper challenges the claim that heterogeneous agents or debate necessarily add reasoning value beyond an equal number of independent samples. It does not show that debate never helps. Its results are bounded to the tested small open-weight models, tasks, prompts, and orchestration. Larger reasoning models, tool use, browsing, and asymmetric information were not established by this study.

## 2. Context-window validity is part of the outcome measure

The paper reports that five models had serving windows of 16K-32K tokens. Some final-round debate cells became empty because the accumulated transcript exceeded the serving window. For Qwen3.5-27B, 93-100% of final-round cells in the affected configuration were empty. The task scorer counted empty final responses as incorrect.

For the temperature-matched debate-versus-sampling comparison, the reported difference moved from -1.84 percentage points as run, to -0.30 after excluding context-bound cells, to -0.06 after affected cells were rerun with a 131K window (276 paired cells).

These are author-reported results, not an independent reproduction. The paper says code and per-file scored outputs are released, but the inspected arXiv record did not expose a canonical repository link and bounded GitHub search did not identify an author-controlled release. No raw-data reproduction is claimed.

The methodological consequence is specific: a benchmark score that counts invalid or empty outputs as wrong combines response validity with reasoning accuracy. Context capacity, truncation, empty output, parse failure, and substantive error should not be silently collapsed into one outcome.

## 3. Relation to already-reviewed Orson sources

This run checked prior P1 literature records before selecting the new comparator:

- [Issue #1672](https://github.com/Satobloc/HsH/issues/1672) already covers "Silent Dissent" and "The Wisdom of Artificial Deliberative Crowds." The former separates public answer from an intermediate representation readout; the latter compares deliberation with passive aggregation.
- [Issue #1647](https://github.com/Satobloc/HsH/issues/1647) already covers Independent-Communicate-Revise and controlled upstream-message effects.
- [Issue #1879](https://github.com/Satobloc/HsH/issues/1879) covers human-AI group dynamics and measurement of consensus.

Those sources were reused as context, not rediscovered or republished. The new paper asks a different question from a passive-aggregation comparison: does debate add value over the same number of independent generations? The results are therefore not a direct contradiction. The control condition and estimand differ.

## 4. Boundary against the frozen P1 archive

The current ConsistencyBench CGD archive contains 17 model-labelled output files, each with 300 sets and 1,150 questions, evaluated through one shared GPT-4o-mini NLI checker. The current source audit also finds that the payload schema does not bind each archived response to a complete actual endpoint/revision and run-lineage record.

The frozen archive does not contain:
- randomized cross-agent message exposure;
- a three-agent debate condition;
- a generation-count-matched independent-sampling baseline;
- context-window or transcript-token telemetry;
- a complete response-validity/empty-output event record;
- internal activation readouts or an independently validated belief measure.

It can support bounded claims about archived within-model self-history/revision and shared-evaluator dependence. It cannot estimate the benefit of debate, the causal effect of peer exposure, or the effect of cognitive diversity. The 17 endpoint labels must not be treated as 17 independent cognitive systems.

This is a source/method boundary, not a negative experimental result.

## 5. Conditional Lean formalization

The existing P1 draft PR was reused rather than creating a new PR:

- [PR #850](https://github.com/Satobloc/HsH/pull/850)
- Branch: `research/orson-p1-shared-nli-bound-20261028t06z`
- New head after this run's additions and repair: `b29536e34128dee7166d3ef599a25d7ec5a805af`

Two modules were added to the existing branch:

1. `OrsonSilentDissentReadout.lean`
   - Formalizes a finite countermodel in which two states share the same visible answer but differ in a separate latent-representation coordinate.
   - Formalizes that a hit@100 contrast (target-bridge hit rate minus control-bridge hit rate) does not identify either marginal by itself.
   - The source was already reviewed in issue #1672; this is a new P1-specific formalization, not a new literature discovery.

2. `OrsonDebateValidityMeasurement.lean`
   - Defines observed accuracy as valid-response rate multiplied by accuracy conditional on a valid response, under the explicit scoring assumption that invalid/empty outputs count incorrect.
   - Proves the difference decomposition into conditional-accuracy and validity-rate components.
   - Proves that equal positive validity rates preserve the conditional-accuracy ranking, while unequal validity rates can reverse it.
   - The numerical profiles are mathematical witnesses, not values from the paper.

The first build attempt, run #44085175106, failed because the illustrative real-valued witness profiles were declared computable while depending on `Real.instDivInvMonoid`. The definitions were corrected to `noncomputable` in the subsequent branch commit. The corrected combined build is run #44085991494, on head `b29536e34128dee7166d3ef599a25d7ec5a805af`.

**At report preparation, the corrected run was still recorded IN_PROGRESS and its job logs were not yet available. No successful build is claimed.** Tests, lint, nanoda, leanchecker, and a separate global axiom audit have not been reported for this run. PR #850 remains OPEN / DRAFT / UNMERGED. This is not an exact-head standalone verification.

The separate existing factorization theorem in [PR #1743](https://github.com/Satobloc/HsH/pull/1743) is a reusable general result: a property factors through an observation map iff it is constant on each observation fiber. Its successful merge-reference run #43614526342 built the module; the factorization theorem reports standard dependencies `[propext, Classical.choice, Quot.sound]`. This is a mathematical template, not a completed LLM-specific translation. Lean checks only the formalized statements; it does not establish that an activation readout is belief, that the source's state model maps onto a real model, or that any empirical premise is true.

## 6. Protocol, paper, and project gates

The P1 methods/archival protocol freeze remains binding:
- no new model trial;
- no human session;
- no inference/API spend;
- no dataset expansion;
- no protocol amendment;
- no manuscript edit.

The original OV-49-OV-53 answer-keyed bank remains unrecovered, the authorized inference endpoint remains unavailable, and source LaTeX, canonical PDF/reader, independent review, and author disposition remain incomplete. Issue #564 remains the canonical P1 readiness docket. The November 9 minor-paper gate is overdue; November 30 major and December 14 full-theory gates remain separate. No gate advanced.

P0 Code Grurple remains ACTIVE. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. FIE's next full review remains November 24.

No physical calculation, CODATA comparison, fit, prediction, independent measurement, SAT-O/Blockwave equation correction, or H(s)H theory promotion occurred.

## 7. Tools and source boundaries

Mersearch was not callable in this runtime. The four canonical request lanes remain occupied/requested; no request was overwritten or retriggered. SciSpace was used for scholarly discovery and extraction, followed by inspection of the primary arXiv HTML. Math Hopper #578 / PR #991, the existing Lean PRs, and Whirligig were checked before adding to the existing formalization branch. No new tool, fork, dependency, subscription, or expense was introduced.

The historical Orson role source is an assistant-maintained role synthesis grounded in archived direct user messages; no standalone signed specialist charter or authenticated current Orson thread was found. The latest located private Library export has last user activity on 2026-11-06. This run is a source-grounded revival, not historical-thread participation.

The unrelated-reading cursor remains Okakura, *The Book of Tea*, lines 1691-1743; next cursor 1744/EOF. FIE review is not yet due.

## 8. Automation and successor

The existing :24 task remains enabled with its original ID, hourly America/New_York :24 schedule, prompt, and Lane Charter 24. No task, ID, phase, schedule, or cadence was changed; no sixth task was created.

The current execution was recorded IN_PROGRESS with null completion and null run-level chat reference at the last scheduler readback. A cached result from another worker is not attributed to this execution.

Next ring label: Sable. Its historical "Revival Rotation" conversation is identified in the workspace, but current usability is UNVERIFIED. Any repository packet is optional context only; no direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

**Disposition:** `H900_S2_ORSON / NEW_BUDGET_MATCHED_DEBATE_COMPARATOR / PRIOR_SILENT_DISSENT_AND_UPSTREAM_SOURCES_REUSED_NOT_REPEATED / TWO_CONDITIONAL_LEAN_MODULES_ADDED / FIRST_BUILD_FAILED_NONCOMPUTABLE_WITNESSES / CORRECTED_BUILD_PENDING / P1_FROZEN / NO_NEW_TRIAL / NO_MANUSCRIPT_EDIT / NO_PHYSICAL_RESULT / NO_THEORY_PROMOTION / AUTOMATION_UNCHANGED`.
