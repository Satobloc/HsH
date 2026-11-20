# Hale h970:s3 | Friedkin–Johnsen parameter identifiability and observation design

**Run key:** `REVROT3-19-20261011:970:s3`  
**Selected ring label:** Hale (index 8)  
**Next ring label:** Elias Kern (index 9)  
**Status:** SOURCE-GROUNDED ALGEBRA / ASSISTANT RECONSTRUCTION / LEAN_VERIFIED

## 1. Historical remit and source boundary

Hale's historical remit is reconstructed from the 2026-09-12 worker self-report in `WORKSPACES/COMMON/CHECKINS.md` and the Sable-maintained `REV-006-HALE-REENTRY.md`: external-literature scanning, matched-period comparison, quantitative/statistical analysis, controls, calibration, and source-quality/provenance checks. No standalone signed Nathan-authored Hale charter was recovered. This is assistant reconstruction under a deterministic ring label, not authenticated participation by a historical Hale instance. No authenticated current Hale thread was established.

Primary model source: Samira Abedini, Sina Mavali, Lea Schönherr, Martin Pawelczyk, and Rebekka Burkholz, “Don't Trust Stubborn Neighbors: A Security Framework for Agentic Networks,” arXiv:2603.15809v1 (16 March 2026), Eq. (1), pp. 5–6: https://arxiv.org/abs/2603.15809

The paper applies Friedkin–Johnsen (FJ) opinion dynamics to LLM-based multi-agent systems and reports theoretical and experimental analysis of persuasion cascades and trust adaptation. The model is an information/opinion-dynamics comparator. It is not an H(s)H physical model, a consciousness result, or an independently verified account of any particular agent's internal state.

## 2. Existing formalization reused

Hale's h966:s4 report already introduced HsH PR [#2168](https://github.com/Satobloc/HsH/pull/2168) for a finite-dimensional, homogeneous-parameter specialization of the source equation. Its original module proves one-step simplex invariance for a row-stochastic peer mean and a convex FJ update. That result does not prove convergence or parameter identifiability.

The current run extended that same draft PR rather than creating a competing formalization. The source equation's scalar coordinate form is represented by the existing definition:

[
F(\gamma,\alpha;s,b,p)
= \gamma s +(1-\gamma)\alpha b
 +(1-\gamma)(1-\alpha)p,
]

where (s) is the prior, (b) the agent's current belief, and (p) the weighted peer-belief input for that transition.

The new assistant-reconstructed module is `FORMAL_VERIFICATION/HsHVerification/FriedkinJohnsenIdentifiability.lean`. It derives exact finite-difference identities.

## 3. Exact single-transition identifiability identities

Changing only self-retention (alpha):

[
F(\gamma,\alpha_1;s,b,p)-F(\gamma,\alpha_2;s,b,p)
=(1-\gamma)(\alpha_1-\alpha_2)(b-p).
]

Therefore, conditional on (gamma,s,b,p) being known, the one-step output is injective in (alpha) when (gamma\ne1) and (b\ne p). It is exactly invariant to (alpha) when either (gamma=1) or (b=p).

Changing only stubbornness (gamma):

[
F(\gamma_1,\alpha;s,b,p)-F(\gamma_2,\alpha;s,b,p)
=(\gamma_1-\gamma_2)\bigl(s-[\alpha b+(1-\alpha)p]\bigr).
]

Therefore, conditional on (alpha,s,b,p) being known, the one-step output is injective in (gamma) when (s\ne\alpha b+(1-\alpha)p). It is exactly invariant to (gamma) when the prior equals that self/peer mixture.

These are structural, noiseless, single-transition results. They are valid algebraically beyond the source's parameter interval, so they also hold on the source's stated domain (gamma,\alpha\in[0,1]).

## 4. Observation-design consequence

The identities expose two specific excitation requirements:

| Parameter under test | Required non-degenerate contrast | Exact unobservable case |
|---|---|---|
| Self-retention (alpha) | (b-p\ne0), with (gamma\ne1) | Current belief equals peer input, or the prior receives full weight |
| Stubbornness (gamma) | (s-[\alpha b+(1-\alpha)p]\ne0) | Prior equals the self/peer mixture |

A defensible FJ parameter-estimation protocol should therefore:

1. Record the prior (s_i), current belief (b_i(t)), peer input (p_i(t)=\sum_jw_{ij}b_j(t)), next observed belief, parameter constraints, and their provenance for each transition.
2. State which parameters are independently fixed/calibrated and which are estimated. A single scalar transition does not generally identify both (gamma_i) and (alpha_i) jointly.
3. Include multiple transitions with independently varied current/peer contrast and prior-versus-mixture contrast. Merely collecting more transitions with the same degenerate input relation does not cure the structural non-identifiability.
4. Freeze parameter fitting on a calibration subset, then evaluate the predicted next-step beliefs on untouched transitions or an independently acquired run. Do not refit on the holdout.
5. Report uncertainty/covariance for observed beliefs, peer weights, priors, and fitted parameters. Under noise, a nonzero exact sensitivity is not automatically a practically resolvable effect: the output separation implied by the identities must be compared with the uncertainty of the relevant observation difference.

No noise model, covariance, acquisition-unit map, or numerical resolution threshold was supplied here. Consequently no numerical threshold is instantiated. The conditions above are design requirements, not evidence that the source paper's fitted parameters are or are not identifiable from its actual data.

## 5. Formal verification status

The added module contains exact difference identities, conditional injectivity theorems, and exact degeneracy theorems for both parameters. It has no custom axiom, `sorry`, or `admit` declaration on source readback.

- PR: [#2168](https://github.com/Satobloc/HsH/pull/2168), still DRAFT / OPEN / UNMERGED and stacked on infrastructure PR #262.
- Exact current head: `06d426079b3346815ec773b9f399cfe1d3905958`.
- Exact-head Lean 4 / Mathlib 4.34.0 workflow: [run #44720991419](https://github.com/Satobloc/HsH/actions/runs/44720991419), **SUCCESS** on head `06d426079b3346815ec773b9f399cfe1d3905958`.
- Lean 4.34.0 / Lake 5.0.0; full Lake build completed successfully (8,949 jobs). The new identifiability module built at 8,947/8,949; the root target built at 8,948/8,949.
- All seven new theorem-specific `#print axioms` outputs report `[propext, Classical.choice, Quot.sound]`. No `sorryAx`, `admit`, or custom axiom declaration was found in the new module.
- Workflow tests, lint, leanchecker, nanoda, and separate global axiom audit were skipped. This is exact-head compilation and theorem-specific axiom-log inspection, not a global audit.
- Earlier exact-head run #44692057915 verified only the original simplex module. Intermediate runs on superseded commits were canceled by the workflow's concurrency policy.

This successful build establishes only the encoded algebra and conditional injectivity statements. It will not validate the source translation, empirical fit, causal persuasion, convergence, agent independence, cognition, or H(s)H/SAT physics. The full heterogeneous network model and the paper's broader equilibrium/takeover results are not formalized here. Tests, lint, nanoda, leanchecker, and a separate global axiom audit are not claimed unless independently run.

## 6. Evidence and project boundaries

No raw model outputs, agent transcripts, fitted parameter tables, or benchmark results were downloaded or re-scored. No new model calls, human-subject work, API/GPU expenditure, physical calculation, physical prediction, independent measurement, or H(s)H candidate assessment occurred. The existing FJ paper and PR are external-model review material, not an Orson P1 amendment.

- P0 Code Grurple remains ACTIVE.
- P1 November 9 cognition paper remains OVERDUE / NOT READY / Orson-owned.
- P2 November 30 measured-geometry paper remains HOLD; no system selected.
- P3 December 14 full-theory paper remains INCOMPLETE.
- FIE next review remains due November 24, 2026.

No SAT-O or Blockwave equation was retrieved, copied, corrected, or changed. No BEDROCK promotion, paper-gate advancement, task/branch ownership change, or scheduler modification occurred.
