# Review-MIND addendum: temporal exposure qualification for directional influence networks

**Date:** 2026-11-02  
**Evidence class:** public primary paper + supplementary information + public code-repository audit  
**Disposition:** SOURCE-CRITICAL ADDENDUM / CONDITIONAL FORMAL GATE DRAFTED / LEAN_UNTESTED / NO EMPIRICAL REPLAY

## Source and bounded finding

Chen et al., *AI agents reshape consensus formation in human groups* (arXiv:2609.02122, 2026-09-02), describes round-by-round random rematching. Participants submit before seeing the current partner's response; after submission, the partner description and similarity feedback are shown. The interface also retains a recent-history panel covering up to five rounds.

The Supplementary Information's directional network score compares participant B's embedding change from round r-1 to r with the direction from B's round-(r-1) embedding toward the current partner A's round-(r-1) embedding. The edge is therefore a **directional-alignment statistic**. Current-round pairing alone does not establish that A's prior expression was visible to B before B's round-r outcome. The history panel may establish prior visibility for some pairs, but the published edge definition does not report a per-edge source/target exposure qualification.

For direct dyadic exposure attribution, each edge needs a matching visibility record: source, target, source-message round, visibility round, and outcome round, with visibility preceding the outcome. The five-round history window must be represented; an immediate-previous-partner check alone is insufficient. Even a verified exposure witness is necessary, not sufficient, for causal influence. Shared group state, prior partners, common feedback, homophily, and session effects remain alternatives.

This does **not** show that influence is absent, invalidate the paper's group-level consensus findings, or establish a causal effect. It narrows the interpretation of the directed network and its centrality scores. Until exposure is audited, the conservative label is "directional-alignment network" rather than a direct causal influence graph.

## Reproducibility boundary

The public repository contains processed data, including panel-adjacency material. Its README lists scripts for the main figures and Supplementary Table 1; the visible README and code search did not identify a script for the Supplementary Figure 8 / influence-network derivation or its PageRank calculation. The edge construction was not independently replayed here, and binary participant-history data were not opened. This is a source/code availability observation, not proof that no implementation exists elsewhere.

## Formalization status

A conditional evidence-typing module was added to the existing draft PR #1115, branch `review/human-ai-group-unit-identifiability-20261030t1848z`, head `ec67923fafd66a90a412eb813aaa7e9900667d0f`:

`FORMAL_VERIFICATION/HsHVerification/HumanAIGroupsTemporalExposure.lean`

It distinguishes a current-pair alignment candidate from an explicit pre-outcome visibility witness. The immediate-prior-partner lemma is deliberately narrower than the paper's five-round history panel. The exposure-qualified structure requires source/target matching and temporal order. It does not prove actual participant exposure or causality.

**No Lean verification run was triggered for this new module.** The branch push produced only no-job `conversation-json-content-ci` runs; the existing Lean workflow is pull-request / main-push / workflow-dispatch, and no dispatch action was available in this execution. The module remains **LEAN_UNTESTED**. No theorem or axiom-free claim is made.

## Relation to existing work

This addendum supplements, but does not duplicate, the session-confounding source audit in issue #1116 and the conditional formalization in PR #1115. The session-confounding theorem remains conditional on the source-level inference of one session per condition. Orson's P1 research, PR #850, and the November 9 paper gate were not modified or advanced.

The round-pairing sequence is a temporal matching graph. It is not automatically a braid-group action. Any braid representation would require an explicit map preserving the relevant strands, crossings, composition, and observed exposure relations; none is asserted here.

## Sources

- Primary paper and Supplementary Information: https://arxiv.org/abs/2609.02122 and https://arxiv.org/html/2609.02122
- Public code and processed-data repository: https://github.com/tsinghua-fib-lab/human-ai-consensus
- Existing HsH source audit: https://github.com/Satobloc/HsH/issues/1116
- Existing HsH formalization: https://github.com/Satobloc/HsH/pull/1115

No raw participant data, private source material, human-subject session, new model call, causal inference, or physical calculation was used.