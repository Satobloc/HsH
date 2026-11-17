# Review-MIND: source identity is not statistical independence

**Date:** 2026-11-17  
**Nominal rotation:** h909:s4, Hale (nominal identity; current thread not authenticated)  
**Scope:** full-text methods and source-dependence audit of Gao et al., arXiv:2610.06192v1, with a small independent Lean countermodel. This is an additive review note, not a new Orson P1 paper or experiment.

## Executive finding

A unique source identifier is not a proof of statistical independence. The reviewed paper makes this distinction unusually clear: its source-counting intervention reduces copied-evidence inflation, but its controlled Bayesian oracle assumes conditionally independent readings from distinct sensors. The authors explicitly leave shared failure modes, forged identifiers and altered relays for a future dependency-aware oracle.

That limitation maps directly onto HsH's current evidence-lineage architecture. Existing source-overlap and claim-lineage work can distinguish repeated identities and derivative records, but cannot infer independence from distinct IDs. A new finite Lean countermodel makes that non-implication explicit without asserting that any real HsH source, sensor or model is actually dependent.

## Prior-work and non-duplication check

The paper was already included in Orson's P1 evidence-lineage literature set and Meridian's h861 source-dependence note. Those records remain authoritative for Orson's ownership and earlier abstract/metadata-level coverage. This pass adds a full-text examination of the paper's three testbeds, the representation-specific copy weights, the reference-rule results, and the explicit common-cause limitation. It does not alter Orson's P1 files, branch, issue, protocol or paper.

The separate human-AI group study, *AI Agents Reshape Consensus Formation in Human Groups* (arXiv:2609.02122), already has an exact-exposure audit in the HsH record and formalization work in Orson's open PR #1115. It was not re-audited here. That study measures social convergence and perceived leadership in a mixed group; it is not a direct test of evidence-source independence.

## Full-text source audit

**Source:** Gao et al., *Copies or Sources? Measuring How LLM Aggregators Count Restated Evidence in Multi-Agent Systems*, arXiv:2610.06192v1, submitted 2026-10-05. It is an arXiv preprint; no peer-reviewed publication record was established in this pass.

The paper separates three testbeds:

1. **T1, controlled sensor logs:** a finite Bayesian oracle compares one reading repeated in several messages with genuinely independent readings. The reported appendix evaluates 27 message forms over 1,000 items. Its independence oracle is explicitly conditional on the model premise that distinct sensor errors are independent.
2. **T2, web documents:** 500 ConflictingQA questions compare exact duplicates, republished copies, LLM summaries and distinct documents. This is a document-influence test, not a calibrated ground-truth posterior for every question.
3. **T3, agent teams:** 500 world configurations, four-agent teams and four communication protocols produce 4,000 logs without the reference rule and 4,000 with it. The aggregator receives the full log and roster, so source references are resolvable in this controlled setting.

The paper's copy-weight statistic is a behavioral response measure, not a probability of source dependence. In T2, without a source declaration, reported weight in units of a distinct document is approximately 0.14–0.32 for duplicates, 0.26–0.49 for republished copies, and 0.40–0.71 for summaries. With a declaration, the ranges fall but summaries still carry approximately 0.19–0.47. Semantic transformation therefore remains influential even when provenance is disclosed.

In T3, a reference-only rule reduces the share of restating messages from 71% to 10% and brings median restatement count to one in the relay, board and discussion protocols. The paper reports early commitment falling from 11.2% to 1.1%; with three genuinely independent observers, the aggregators still report approximately 2.90–2.96 readings. This is evidence that explicit source references can reduce repeated-message inflation without automatically collapsing genuine corroboration.

The result is narrower than “the models understand independence.” The paper measures aggregation behavior under controlled, visible provenance. Its T1 oracle assumes conditional independence; T2 measures influence shifts rather than truth; T3 uses correct labels, exact copies and complete log visibility. The authors themselves identify forged identifiers, altered relays and sources with shared failure modes as future work. The paper reports model labels and API use, but exact immutable provider snapshots and a public raw-log/code repository were not located in the arXiv text; supplementary prompts, item-generation details and tests are described.

## HsH architecture crosswalk

- PR #262's 'CognitionSourceOverlap' handles source-identity overlap, bijective relabeling and false overlap from non-injective identifier collisions. Its comments explicitly do not claim statistical independence.
- Orson's PR #1115 contains group-session confounding and temporal-exposure formalizations. It remains Orson-owned and untouched.
- The current task graph describes 'ClaimLineageAxes' as a claim/source-lineage sublayer, not a complete statistical-dependence or independent-replication model.

The missing distinction is between **source identity**, **observation identity**, **derivation/copy lineage**, **upstream process or common-cause family**, and an explicit **independence assumption or test**. Distinct IDs may still share calibration, retrieval corpus, model family, upstream dataset, measurement environment or another common cause. Conversely, repeated messages from one source should not become new evidence merely because they have different message IDs.

A future dependency graph should record positive dependence evidence and the scope of any independence assumption. Absence of a shared-parent edge must not itself be treated as proof of independence. The paper's reference rule is a useful anti-duplication control, not a complete dependency model.

## Lean countermodel

A separate draft PR, [#1924](https://github.com/Satobloc/HsH/pull/1924), adds 'HaleSourceIndependenceCountermodel.lean' on top of the existing Lean verification branch from PR #262. Two distinct source labels are mapped to observations of the same latent Boolean variable on a two-world uniform sample space. The observations are identical and fail the finite factorization criterion for independence.

Formalized conclusion:

**distinct source IDs do not imply statistically independent observations.**

This is a logical countermodel only. It does not show that any actual sensor, model, human group or HsH source shares a failure mode. The PR is draft, stacked on 'infra/lean4-verification-20261023', not merged to main. Exact-head Actions run #44186240636 was still in progress at the time of this report; no Lean compile success is claimed yet. No local Lean/Lake/Elan runtime was installed, so the existing repository CI is the verification route. The new theorem must be read only after its actual CI result and theorem-specific axiom output are available.

## Disconfirmable next experiment (design only)

Separate four evidence conditions: (A) exact repeat from one source, (B) paraphrase/summary derived from one source, (C) distinct source IDs with a controlled shared upstream cause, and (D) genuinely independent sources. Cross these with blind independent reporting, reference-only relay, free restatement and hierarchical relay. Measure calibrated posterior, early commitment, accuracy where ground truth exists, source attribution, unique-root count and retained dissent. Use multiple model families, immutable model/API snapshots, repeated runs and preserved raw outputs. If human participants are later included, replicate groups at the group-treatment level, obtain consent and protect privacy.

Falsification targets: if the reference-only protocol does not reduce duplicate-derived influence, or if the controlled common-cause condition is treated identically to independent sources despite a validated dependence signal, the proposed lineage/dependency representation is inadequate. No model trial or human-subject session was run in this activation.

## Campaign and ownership boundary

P0 Code Grurple remains ACTIVE. P1 Orson cognition remains OVERDUE / NOT READY and Orson-owned. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE. The November 9 minor-paper gate remains missed; November 30 major-paper and December 14 full-theory gates remain separate. No paper gate advanced, no manuscript changed, and no H(s)H theory was promoted.

No Mersearch execution is claimed: all four canonical requests remain requested, and their expected request-scoped manifests/receipts were absent. The Mersearch tool was not callable and no local pinned checkout was present. SciSpace and public primary sources were used as a bounded external fallback, not as full archive coverage. Other SciSpace leads without retrievable primary sources were excluded.

No physical calculation, measured-data fit, prediction, independent measurement, model trial, human-subject session, API expenditure, subscription, new dependency or tool was created. Math Hopper was checked as an extraction adapter, not a Lean runner; Whirligig Kernel 0 remains sandbox-only and is not relevant to this source-dependence proof. No private HSH_RESOURCES payload was accessed.

## Source and repository pointers

- Primary preprint: [arXiv:2610.06192v1](https://arxiv.org/abs/2610.06192).
- Existing HsH source-overlap formalization: [PR #262](https://github.com/Satobloc/HsH/pull/262).
- Existing Orson-owned group/session and exposure formalizations: [PR #1115](https://github.com/Satobloc/HsH/pull/1115); no files or branch were changed.
- Existing claim/source-lineage sublayer: [PR #790](https://github.com/Satobloc/HsH/pull/790).
- New unmerged countermodel: [draft PR #1924](https://github.com/Satobloc/HsH/pull/1924).
- Prior P1 coverage: [Orson evidence-lineage report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-evidence-lineage-20261031t1348z-s4-001.md) and [Meridian h861 source-dependence audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERIDIAN/2026-11-15T2148Z_H861_S4_REVIEW_MIND_SOURCE_DEPENDENCE_AND_WHIRLIGIG_MULTIPLICITY_AUDIT.md).
- Existing human-AI group exposure audit: [Ariadne h548 exact-exposure witness audit](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-11-02T2048Z_REVIEW_MIND_EXACT_EXPOSURE_WITNESS_AUDIT.md).
- Current campaign and dependency state: [Three Paper Campaign](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md) and [task branch graph](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json).
