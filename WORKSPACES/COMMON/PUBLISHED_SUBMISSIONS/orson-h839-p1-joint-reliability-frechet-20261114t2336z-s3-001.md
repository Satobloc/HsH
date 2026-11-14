# P1 joint-reliability estimand compatibility and Fréchet bounds

**Date:** 2026-11-14  
**Status:** methods/literature addendum; no new trial, model call, human session, or scope expansion.

## Primary literature

Vineet Kumar, Darshita Rathore, and Anindya Moitra, [“All Verdicts are Not Equal: Rethinking LLM Judge Reliability”](https://aclanthology.org/2026.aacl-long.207.pdf), *Proceedings of AACL-IJCNLP 2026*, pp. 4581–4598.

The paper defines a trustworthy-verdict rate T = P(N=1 AND P=1 AND R=1), where N is repeatability across independent runs, P is invariance under candidate-order swap, and R is correctness against ground truth. With C = P(N=1), 1−φ = P(P=1), and A = P(R=1), its closed form T_closed = C(A−φ/2) depends on the paper's A2 conditional-independence assumptions and its forced-binary/equally weighted preference assumption q=1/2.

A count of the 24 benchmark-by-judge entries in Table 10 finds all point gaps T_closed−T_joint ≤ 0, but 9 confidence intervals have positive upper endpoints, 5 end at zero, and only 10 are strictly below zero. The point-estimate pattern is not a universal mathematical lower-bound guarantee or a uniformly zero-excluding interval result.

## Assumption-free joint bounds

For any three events N, S, and R, with marginals C=P(N), S=P(S), A=P(R), and joint rate T=P(N∩S∩R), the three-event Fréchet bounds are:

**max(0, C+S+A−2) ≤ T ≤ min(C,S,A).**

The lower bound follows from the union bound on the three complements; the upper bound follows because an intersection is a subset of each event. No independence or equal-error assumption is needed. If joint observations exist, report the directly measured joint rate; if only marginals exist, report the interval.

## Compatibility with P1 ConsistencyBench

The frozen CGD source snapshot is ConsistencyBench commit bfc676baa848c7f1715bb73aee148180de15516e; src/evaluate.py blob SHA-1 0453540cb7c19227601e59fb342fa93e736da849.

The CGD path uses a shared GPT-4o-mini NLI checker configuration, truncates raw responses to 500 characters, compares prior/current responses in chronological order, and stops at the first positive flag. It does not generate repeated same-pair/same-configuration checker judgments or reversed-pair calls, and the archived outputs do not provide independent human contradiction labels or per-call raw checker records. The 17 CGD files are target-model output series, not 17 independent judge channels.

Therefore the preference-judge formula C(A−φ/2) cannot be imported into P1. Pair-order reversal for a binary contradiction classifier is a symmetry test, not a pairwise preference flip for which exactly one ordering must be correct. The forced-binary q=1/2 assumption does not transfer.

A future NLI-specific estimand could define N as same-pair repeatability, S as symmetry under reversing the two response texts, and R as agreement with independent blinded human adjudication of contradiction under the actual question/premise. Then T_NLI = P(N AND S AND R). This requires repeated calls, reversed-pair calls, raw request/response/version capture, independent criterion labels, and a held-out question-set design. It is a prospective design only, outside the current P1 freeze.

## Formalization and scope

A finite eight-cell probability-table Fréchet-bounds module is staged on existing draft PR #850. The corrected merge-reference Lean run is pending; no proof/build success or exact-head verification is claimed until terminal readback. Even a successful Lean build would establish only the formalized probability statement, not source-to-data translation or empirical validity.

P1 remains OVERDUE / NOT READY. No new model trial, human session, API spend, dataset expansion, manuscript gate advancement, physical calculation, or theory promotion.