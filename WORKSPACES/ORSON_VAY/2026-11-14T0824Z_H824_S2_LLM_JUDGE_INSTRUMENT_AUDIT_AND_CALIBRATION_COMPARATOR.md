# H824:s2 | LLM judge as mutable measurement instrument

**Date:** 2026-11-14 08:24Z  
**Run key:** `REVROT3-19-20261011:824:s2`  
**Selected:** Orson Vay (ring index 18)  
**Next:** Sable (ring index 0)  
**Pre-write HsH main:** `28c2db6b7205ce103ef36d9e41b8e8cd4ff95daf`

## Scope and authority

This is a source-grounded Orson cognition activation, not authentication of a historical Orson ChatGPT thread. The original MIRA raw-export user message dated 2026-09-23 03:55Z was checked: it assigns LLM cognition/reasoning expertise and advisory work concerning ChatGPT, NotebookLM, model behavior, and Nathan's use of LLMs. The current `ROLE_CHARTER_2026-10-09_LLM_COGNITION.md` is an assistant-maintained synthesis, not the original message. The 2026-10-26 four-of-five substantive-cognition target is a later Steering instruction. The separate October 9 role-reset source remains unrecovered.

P1 issue #564 and the 2026-11-02 protocol freeze remain controlling. No new model trial, human session, API spend, dataset expansion, protocol change, or paper-gate advancement was authorized or performed. The LOW STAKES research lane remains explicitly PARKED; it was read but not activated.

## New primary literature

**Veerendra Kumar Sunkavalli**, “LLM Judges as Raters: A Pre-Registered Audit of Severity, Halo, Reliability, and Version Instability in LLM Essay Scoring on Public Corpora,” arXiv:2608.29517, submitted 2026-08-28 (v1 dated 2026-08-30).

- Full primary text: https://arxiv.org/html/2608.29517
- Abstract/metadata: https://arxiv.org/abs/2608.29517
- Status: arXiv preprint; the record has no accepted/published venue or DOI. This is not represented as peer-reviewed.
- The paper reports 2,377 essays (977 Essay-BR/ENEM and 1,400 ASAP), 12 LLM judges, four providers, three price tiers, five version contrasts, and 110,571 captured calls. Each judge scored each essay three times, with a limited deeper-replication cell.
- The study uses a many-facet Rasch model (MFRM), generalizability/decision studies, residual-halo analysis, family-wise permutation tests, version contrasts, and calibration treatments.

### Main results, with the paper's own qualifications

1. **Severity is not captured by rank agreement.** The reported ENEM judge-severity range is 219 points on a 0–1000 scale; 11/12 judges exceed the paper's frozen displacement criterion. Judge-human Pearson correlations occupy a narrow .47–.56 band. The judge main effect is reported as 16.7% of total variance. On ASAP, panel spread is 15–33% of score range, while the two trained human raters' mean gap is about 0.7–1.0% of range.
2. **Reliability is not validity.** The paper reports dependability φ(k) >= .80 at k=1 for nine judges and k=2 for three, but its confirmatory accuracy hypothesis is not supported on the strict majority-of-instruments reading: the best judge beats the two-human benchmark on only one of four ASAP instruments. Repeated calls can stabilize a biased score.
3. **Two confirmatory qualifications matter.** The severity-adjusted QWK leaderboard-reversal test is a null: the largest observed reversal (.029) is below the family-wise threshold (.107). The registered “silent drift” conjunction is refuted: all five severity contrasts exceed the family-wise permutation null, and QWK moves in four of five contrasts. This is not evidence that agreement is a reliable version monitor; the severity shift itself is the more informative signal.
4. **Halo remains unresolved.** The initial cross-instrument comparison was reversed by a same-instrument robustness check. The authors report no credible evidence that judges exceed the trained-human halo range once instrument and calibration are matched, while acknowledging that the robustness check was commissioned after the original direction was known.
5. **Calibration helps but does not certify.** In a post-registration exploratory treatment arm, a 100-essay mean-offset calibration reduces the worst-case false-fail share from 56% to 10%, but false-pass rises to 16%, leaving 26% total cutscore misclassification. The paper explicitly treats the pooled ENEM platform score as a scale reference, not error-free ground truth.
6. **Version identity is an instrument property.** Five hosted-endpoint version contrasts show severity shifts from -133 to +125 points. A fixed 12-essay temperature-0 canary was run at collection start, day boundary, and end; one Sonnet 4 endpoint was legacy-gated mid-study. The study uses one serving platform (Amazon Bedrock), so model weights and serving-stack changes are bundled.

### Source and registration limits

The authors say the protocol was frozen before full collection and disclose deviations. However, the paper also states that the freeze record resides in author-controlled version control and its timestamp is not independently attested; the OSF mirror was uploaded after collection and confirms byte identity, not freeze time. The full raw-capture/code artifact is claimed at 4open/OSF, but it was not independently retrieved in this run; the OSF view-only material was not opened. Therefore this is a full-text source review, not an independent data reproduction.

The ENEM reference is a pooled platform score without rater identities or panel documentation; ASAP has two trained raters. The study has no learner demographics, uses one hosted platform, and explicitly limits transport beyond its essay-scoring instruments. Its numeric effect sizes are not transferable to NLI contradiction detection.

## Crosswalk to Orson P1

The pinned ConsistencyBench evaluator source uses one shared NLI judge alias, `openrouter/openai/gpt-4o-mini`, at temperature 0 and max_tokens 10. It truncates each raw response to 500 characters and asks whether the two responses are contradictory; the NLI prompt does not include the corresponding questions or premises. The 17 target-model series therefore do not constitute 17 independent evaluator channels. The archived result JSONs do not preserve per-call NLI request IDs, raw judge outputs, or an immutable judge-version identifier.

The new paper's relevant contribution is not its essay-scoring effect size. It is the treatment of a hosted judge as a mutable measurement instrument. If P1 is ever explicitly reopened, a defensible protocol would need an immutable provider/model/version identity where available, exact prompt and raw request/response capture, service metadata, fixed identity canaries, human-adjudicated calibration cases, a held-out validation set, and pre-registered halt/recalibration rules. That is a prospective design implication only; it does not alter the P1 freeze or authorize a trial.

A repetition check found that question-position flag totals and the 17-model position partition are already represented in the existing `OrsonSharedNLI.flagged_position_partition` formalization and prior P1 reports. No duplicate position-analysis report was created.

## Formalization and Lean status

Existing PR #850 already contains `OrsonJudgeScoreGeometry.lean`, which proves the conditional finite-vector projection identity
`unexplainedScoreFraction = 1 - scoreSquaredCorrelation` for nonzero, pre-centered score vectors. This is adjacent mathematical structure, not an MFRM fit, a proof of empirical severity, or a model of version drift. The module does not formalize the paper's empirical variance components, canary procedure, or calibration results.

The existing `OrsonCaliberConfidenceState.lean` module had two source-level issues: an unclosed anonymous `noncomputable section` and an incomplete upper-bound calc ending at `n` while the target was `1*n`. Both were repaired on the same existing PR #850 branch; the second repair adds the explicit final `n <= 1*n` step. Current branch head: `09940e8563171f5c55e7f31942139dca7d44d32c`.

- Previous merge-reference run #43576374732 failed on the still-incomplete upper-bound goal; its axiom print included `sorryAx` as a consequence of failed elaboration.
- Follow-up Lean 4 verification run #43576809745 was IN_PROGRESS at the last check. Do not claim success until its job conclusion, checkout source, and theorem axiom output are read back.
- PR #850 remains OPEN / DRAFT / UNMERGED and stacked on PR #833. No rebase, merge, new PR, new module, or new toolchain was created.

The current Lean target is conditional formalized mathematics only. A successful build would not establish the soundness of translating the paper's statistical model into an empirical claim.

## Project status and boundaries

- P0 Code Grurple: ACTIVE.
- P1 cognition, Orson-owned: OVERDUE / NOT READY; issue #564 remains canonical.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: 2026-11-24 (last full review 2026-11-10).
- All four Mersearch lanes remain occupied/requested; no request was overwritten or retriggered.
- No physical calculation, CODATA comparison, H(s)H prediction, fit, independent measurement, SAT-O/Blockwave equation change, or BEDROCK promotion.
- No public issue was created for this internal methods review. The report is a source-grounded comparator note, not a new P1 result or paper-gate artifact.

## Existing publication correction

Issue #1723 for the prior h820:s3 Orson report is now independently verified PUBLISHED_VERIFIED: publisher comment #6872033446, publisher commit `810d67228f850055fb14e3db868be21eef24eaf4`, exact artifact readback, SHA-256 `5bdba107b425ef46197847be56574468e791984686710ea5bae86e2ddc3915e6`. The h820 canonical receipt still contains its earlier SUBMITTED_NOT_VERIFIED snapshot; a separate numbered amendment records the later publisher readback. No retry or duplicate issue.

## Maintenance and scheduler

Unrelated reading completed: Okakura Kakuzō, *The Book of Tea*, Project Gutenberg #769, plain-text lines 1611–1650. Next cursor: **1651**. No physical break is claimed.

The existing Workshop Relay :24 task was positively peeked as enabled with its exact saved ID and original hourly America/New_York :24 VEVENT. No task, prompt, phase, cadence, enabled-state, ring, or ownership change. No sixth task. The next ring label is Sable; its scheduled run had already started before this report was ready, so no handoff or direct-thread delivery is claimed.
