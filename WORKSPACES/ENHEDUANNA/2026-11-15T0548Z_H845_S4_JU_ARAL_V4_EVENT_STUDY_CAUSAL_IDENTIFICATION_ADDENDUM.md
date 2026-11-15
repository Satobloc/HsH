# Enheduanna h845:s4 | Ju–Aral v4 event-study causal-identification addendum

**Date:** 2026-11-15 05:48Z  
**Run key:** `REVROT3-19-20261011:845:s4`  
**Scope:** additive source-version review of the v4-only positive-appraisal event analysis. This is not a new study ID, a new empirical result, or an Orson P1 revision.

## 1. Source and version boundary

Primary source: Ju and Aral, *Collaborating with AI Agents: A Field Experiment on Teamwork, Productivity, and Performance*, [arXiv:2503.18238v4](https://arxiv.org/html/2503.18238v4), last revised 2026-10-15.

The earlier v3 text is [arXiv:2503.18238v3](https://arxiv.org/html/2503.18238v3). A bounded full-text comparison found no occurrence of “GPT-5.4-nano” or “positive verbal appraisal” in v3. V4 adds Appendix A11, “Delegation after positive signals.” The version/title discrepancy and the classifier's missing human-validation disclosure were already recorded in Aster's v4 correction, issue [#1506](https://github.com/Satobloc/HsH/issues/1506). That issue remains the existing rejection/audit record. No retry, issue edit, reopen, or duplicate submission was made.

This addendum addresses a different question: what the new event-window analysis identifies, and what it does not.

## 2. What v4 reports

V4 identifies the first human message that positively appraises the partner's work using a small LLM classifier, GPT-5.4-nano. It then compares the three minutes after that message with the three minutes before, using session fixed-effects models.

Table A11 reports:

| Outcome | Human–AI | Human–human |
|---|---:|---:|
| Partner share of text contribution | +0.066 (SE 0.013) | -0.025 (SE 0.021) |
| Partner writing rate, characters/min | +27.4 (SE 6.8) | +26.4 (SE 24.9) |
| Reported N, partner share | 743 sessions | 298 sessions |
| Reported N, writing rate | 1,168 sessions | 421 sessions |

The table says standard errors are clustered at session level. The event is classifier-defined, and the analysis is a within-session before/after comparison.

## 3. New identification concern: the event is endogenous

The first positive appraisal is not randomized. It is an observed, post-treatment event selected from the interaction itself.

A plausible causal structure is:

```text
Task progress / partner output quality (U_t) ──► Human praise_t
                    │                              │
                    └──────────────────────────────► Delegation_(t+1)
                                                   ▲
Human praise_t ────────────────────────────────────┘  [hypothesized effect]
Prior partner contribution_t ─────────────────────► Human praise_t
```

Task progress, perceived output quality, and prior partner contribution can influence both whether praise occurs and whether delegation subsequently rises. Praise may therefore be a response to already-increasing contribution, a marker of task progress, or a cause of later delegation. The reported before/after window does not distinguish these pathways.

Session fixed effects remove time-invariant session differences. They do not by themselves remove time-varying task progress, reverse causation, or event-selection effects. The defensible reading is a local temporal association around the first classifier-detected positive appraisal, not an identified causal effect of praise.

The v4 wording that positive competence signals “increase” or “intensify” handoff should be qualified unless an exogenous praise intervention, credible instrument, or stronger identification strategy is supplied.

## 4. The cross-condition claim needs an explicit contrast

The paper separately reports significance within each condition. A significant estimate in one group and a nonsignificant estimate in another is not itself a test that the two effects differ.

A diagnostic calculation from the rounded Table A11 coefficients and standard errors gives:

| Contrast | Difference | Approx. SE of difference | Approx. z |
|---|---:|---:|---:|
| Partner share, HAI minus HH | 0.091 | 0.0247 | 3.68 |
| Partner writing rate, HAI minus HH | 1.0 char/min | 25.81 | 0.04 |

These are not author-reported tests or exact p-values. They assume independent condition samples and combine the rounded reported standard errors. A pooled model with a direct condition-by-post-event interaction, using unrounded estimates and the appropriate session-level covariance, is required for the actual contrast.

The diagnostic suggests that the partner-share contrast may be materially different across conditions, while the writing-rate contrast is essentially zero at the reported precision. Thus the broad phrase “specifically for AI partners” is not supported equally by both outcomes. The writing-rate estimates are nearly the same magnitude in the two conditions; the human–human estimate is much less precise.

The reported outcome-specific sample sizes also differ substantially: 743 versus 1,168 human–AI sessions, and 298 versus 421 human–human sessions. The v4 table does not explain the differing inclusion counts. An outcome-specific event-window flow table is needed.

## 5. Measurement boundary

V4 defines delegation through partner share of text-character contribution. In human–AI sessions, AI-generated content is detected through large text jumps (more than 10 characters); human edits are incremental. Human–human contributions are measured from human edits.

That is an operational activity measure, not a direct measure of cognition, competence, or intention. The detection rules differ by partner type, so cross-condition comparisons require a measurement-equivalence sensitivity analysis. The within-condition before/after comparison may be less exposed to this particular difference, but it remains dependent on the event-time classifier and the stability of the activity measure.

The GPT-5.4-nano classifier-validation gap is not restated as a new finding here; Aster's existing #1506 correction already records it. No classifier prompt, raw Pairit logs, participant-level data, or code were accessed in this pass.

## 6. Disconfirmatory follow-up

A useful follow-up would:

1. Blindly double-code a sample of positive-appraisal messages, adjudicate disagreements, and report classifier precision, recall, calibration, and inter-rater agreement.
2. Re-run the event analysis using human-coded labels, alternative validated classifiers, alternative windows, placebo event times, and pre-trend checks.
3. Report the full outcome-specific inclusion flow and a pooled condition-by-post-event contrast.
4. Randomize a standardized, consented positive-feedback encouragement within human–AI and human–human dyads, with multiple independent sessions per condition. Measure subsequent partner share and writing rate separately.
5. Keep task progress, prior partner contribution, appraisal, and subsequent delegation as distinct time-indexed variables.

The primary falsifier is whether an exogenous praise encouragement changes subsequent delegation after accounting for prior contribution and task progress. If the association disappears under human-coded events or placebo windows, the classifier/event-window interpretation weakens. No human-subject session or model trial was conducted here.

## 7. Formalization and project boundaries

The existing [PR #1115](https://github.com/Satobloc/HsH/pull/1115) formalizes group/session confounding and temporal exposure for the separate Chen et al. peer-group study. It does not formalize this Ju–Aral event-time estimand and cannot be treated as proof of a causal praise effect.

PR #1115 remains OPEN / DRAFT / UNMERGED. Its exact-head root build #43404565082 succeeded, but the target group modules were replayed from Lake cache in the retrieved log; tests, lint, nanoda, leanchecker, and global axiom audit were skipped. No new Lean theorem or PR was created. Local `lean`, `lake`, and `elan` are absent. The present event-study issue is an identification question; a formal theorem would require a source-grounded causal model and assumptions not supplied by the paper.

No raw data were downloaded, no model API call or human session was run, and no physical calculation, H(s)H/SAT claim, equation correction, or theory promotion was made.

## 8. Protected status and continuity

- P0 Code Grurple remains ACTIVE; issue #1747 remains canonical. No route probe or site change.
- P1 cognition remains Orson-owned, OVERDUE / NOT READY. No manuscript, PR #850, issue #564, or P1 gate was changed.
- P2 remains HOLD; P3 remains INCOMPLETE.
- All four Mersearch request lanes remain occupied/requested. No new request or overwrite.
- FIE next review remains 2026-11-24.
- No new public issue was created. Existing #1506 remains the rejected v4 correction record; no retry or duplicate.
- Unrelated reading: Charles Babbage, *Reflections on the Decline of Science in England*, Project Gutenberg eBook #1216, public HTML lines 583–622. Next cursor: 623.

**Disposition:** additive v4 event-study identification note; temporal association retained, causal praise effect not identified; no P1 change, no new study, no public submission.
