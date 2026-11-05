# Review-MIND addendum: topology–prior confounding and reciprocal exposure

**Date:** 2026-11-05  
**Status:** Design refinement only. Not run, not preregistered, not a P1 manuscript change.  
**Relation:** Additive to HsH issues #1377 (group-level factorial proposal) and #1380 (provenance-state graph).

## Finding

Qiu et al., *Belief Cascades Drive Persuasion in LLM Agent Networks*, arXiv:2608.25152v1 (2026-08-25), report an LLM-only simulation across four backbones, five SNAP ego-network graphs, 55 policy statements, ten rounds, and two random seeds (4,400 simulation runs).

The paper explicitly identifies a topology–prior coupling: initial persuadee stances are assigned using Personalized PageRank on the graph, so network position and initial stance are correlated by construction. The authors leave randomized/uniform-prior ablation to future work. They also describe exposure-to-stance effects as controlled associations, not randomized causal effects.

The study is a useful measurement comparator, not human-group evidence: agents within a run share one model backend; the four backbones are compared across runs, not combined as four independent families in one network; there are no human subjects and no validation against human persuasion data. Human annotation in the paper evaluates a text classifier, not the stance probe or latent model beliefs.

The paper's useful measurement lesson is that posts alone miss movement. Planned messages, executed messages, actions, and elicited stance probes can diverge. This supports the event/provenance distinctions already established in #1380, but does not establish human-group effects or causal peer influence.

## Implication for #1377

The existing 2×2 design (peer-message exposure absent/present × real initial vote tally hidden/shown) is suitable for estimating the effect of that **bundled peer-exposure package** and its interaction with tally display, provided all four cells and the stated randomization assumptions hold.

It does not isolate the incremental effect of reciprocal feedback from the effect of receiving any peer information. If the implementation changes message availability, insertion, feedback opportunities, volume, and topology together, the estimand is the package, not reciprocity alone.

## Optional refinement

If feedback/reciprocity itself is the target, add a one-way/yoked comparator:

| Arm | Condition |
|---|---|
| A0 | Isolated: no peer message inserted into another agent's context. |
| A1 | One-way/yoked: peer messages are inserted, but no return path carries a recipient's revision back to the source. |
| A2 | Reciprocal: messages and subsequent revisions can travel along a predeclared return path. |

Cross A0/A1/A2 with tally hidden/shown (six cells). Match message count, recipient count, source roots, timing, payload length, context budget, model/version, and human-to-agent input as closely as feasible between A1 and A2. If they cannot be matched, retain the bundled-treatment interpretation.

For group-level outcome Y(a,b), predeclare the peer-information contrast A1−A0 and the added-feedback contrast A2−A1, averaged across tally conditions. These are estimand definitions, not proofs of causal identification.

Additional controls:
- Freeze private pre-exposure stance measurements; randomize topology independently of baseline stance or stratify on baseline stance. Do not derive baseline stance from graph position when topology is the target.
- Keep repeated probes in a separate measurement context; do not feed probe outputs back into the treated conversation.
- Log planned edges, generated messages, delivery, insertion, action, and later decision separately.
- Keep group/session as assignment and primary inference unit; participants, agent slots, rounds, messages, and probes are nested observations.
- Prevent cross-group spillover with isolated contexts/state resets, or define a higher partial-interference cluster.
- No power/sample-size calculation until a real pilot supplies group variance, ICC, missingness, and treatment-fidelity estimates.

## Disconfirmatory outcomes

If A2 raises agreement without accuracy or unique evidence uptake, interpret it as coordination/conformity rather than epistemic improvement. If topology effects disappear after baseline stance is balanced, the original contrast was compatible with topology–prior coupling. If probes and actual decisions diverge, report them separately. If A1/A2 differ materially in content, volume, or context budget, do not call their contrast a pure reciprocity effect.

## Formal and project status

Existing Orson factorial formalization, HsH PR #850, was checked against Actions run #42025947428. PR head `9fa85f5826545d489743967de50a81f323757a55` was built on merge-reference commit `2115fdab1d0477c02e5793c1ff2f885f3da5d0e9` (parents: PR head and base `598a45b3feb9378eb8f14ff069ec9080137113c2`). Lean 4.34.0 / Lake 5.0.0; 8,979 jobs succeeded; `OrsonIdentityChannelFactorial` and `OrsonEvaluatorMeasurementDecomposition` built; no `sorryAx` or `admit` appeared in the retrieved log. Tests, lint, nanoda, and separate axiom audit were skipped. This is a merge-reference build, not a standalone exact-head build.

That module covers the existing two-factor algebraic decomposition/missing-cell result. It does not prove the proposed three-level design, randomization validity, topology–prior independence, or empirical causal effects. No new Lean code was added and Orson's PR/P1 was not modified. PR #873's recorded failure used an older head; its current head has no fresh verification in this pass.

## Scope

No experiment, human session, recruitment, model call, API spend, or new data. No Orson P1 ownership/scope change: P1 remains methods/archival and November 9 NOT READY; November 30 P2 and December 14 P3 remain separate. This is not a BEDROCK theory promotion.

## Sources

- Qiu et al. (2026), arXiv:2608.25152v1: https://arxiv.org/abs/2608.25152
- Existing factorial proposal: https://github.com/Satobloc/HsH/issues/1377
- Provenance-state graph: https://github.com/Satobloc/HsH/issues/1380
- Orson factorial PR: https://github.com/Satobloc/HsH/pull/850
- P1 docket: https://github.com/Satobloc/HsH/issues/564
