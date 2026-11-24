# Hale h966:s4 | Review-MIND: multi-agent misinformation and FJ simplex invariance

**Run key:** REVROT3-19-20261011:966:s4  
**Selected label:** Hale (index 8)  
**Next label:** Elias Kern (index 9)  
**Status:** SOURCE-GROUNDED REVIVAL / LITERATURE MINI-COMPARISON / LEAN_VERIFIED / FACTORY_GEOMETRY_GATE_BLOCKED

## 1. Historical remit and source coverage

The historical Hale remit is supported by Nathan's 2026-09-12 direct check-in and the Sable-authored REV-006-Hale-Reentry packet: external-literature scanning, matched-period comparison, and quantitative/source-quality checks. No standalone signed specialist charter was recovered. This is assistant reconstruction under that historical remit, not authenticated participation by a historical Hale instance.

Read: live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, Nathan Direct methodology/proof-priority documents, three-repository onboarding, Revival Rotation V3/V4 and thread-first rule, current HsH and SAT archive branch heads, Hale continuity/inbox, prior Hale receipt, and the latest prior :48 receipt. Hale README.md and CURRENT_WORK.md returned 404; no substitute was invented.

The historical candidate conversation ID 6a26fecb-c1dc-83ea-a175-92033cd75d15 predates Hale's self-naming and is not authenticated as the current thread. The raw export fetch returned no content through the available GitHub connector. Mersearch has no callable tool in this runtime; all four request lanes are occupied. The bridge was not invoked. Revival was performed from the available check-in, wake packet, continuity, inbox and prior receipts. No direct-thread delivery or historical-instance identity is claimed.

## 2. Matched-period literature comparison: 2024 versus 2026

This is a purposive four-paper comparison, not a systematic census or statistical estimate of field-wide trends.

| Period | Source | Focus | Distinguishing contribution |
|---|---|---|---|
| 2024 | Amayuelas et al., [MultiAgent Collaboration Attack](https://arxiv.org/abs/2406.14711) | Adversarial persuasion in LLM debate | Tests how an adversarial collaborator can shift other agents and degrade group accuracy |
| 2024 | Ju et al., [Flooding Spread of Manipulated Knowledge in LLM-Based Multi-Agent Communities](https://arxiv.org/abs/2407.07791) | Manipulated model knowledge and retrieval persistence | Treats propagation as a knowledge-contamination and persistence problem, including RAG |
| 2026 | Abedini et al., [Don't Trust Stubborn Neighbors](https://arxiv.org/abs/2603.15809) | Friedkin-Johnsen opinion dynamics on agent networks | Separates prior-belief stubbornness, self-retention, and weighted peer influence; examines network structure and trust/attack conditions |
| 2026 | Becker et al., [Misinformation Propagation in Benign Multi-Agent Systems](https://arxiv.org/abs/2606.16710) | Benign asymmetric misinformation exposure | Uses an exposure-matched independent self-consistency baseline to separate exposure/ensembling from debate interaction |

**Bounded synthesis.** The selected 2024 sources are threat-centric: a deliberately adversarial agent or manipulated knowledge is introduced. The selected 2026 sources include a formal opinion-dynamics account and a benign misinformation experiment with an exposure-matched non-interacting comparator. This is a difference among the inspected papers, not proof of a general disciplinary transition.

The MINT study's central methodological result is especially relevant to group-evaluation design: when one of three agents receives false context, apparent robustness of the final group can be explained by dilution/aggregation rather than a beneficial interaction effect. The paper reports model- and task-dependent effects when two or three agents are misinformed. It distinguishes false-content exposure from irrelevant/content-free context. These are simulated model-agent results, not human group observations. [Primary paper](https://arxiv.org/abs/2606.16710).

## 3. MINT dataset and reproducibility audit

Repository inspected: [jonas-becker/MINT](https://github.com/jonas-becker/MINT), main commit 467325b0ae5ce53a0a54fcf22a3d378471f9ab0f (2026-10-14).

- The v1.2 erratum states that all 382 WinoGrande labels in v1.1 were incorrectly stored as answer = "1"; v1.2 corrects the labels and the paper says its experiments use v1.2. Do not reuse v1.1 WinoGrande labels.
- The current datasheet says the human audit covered 1,080 items. The paper's Appendix D reports 385 passages. A separate v1.1 annotation_stats.json records 387 included tasks, 60 unique MINT IDs, three annotations per task and a six-person annotator pool. The v1.1 stats report 294/387 majority-yes for false-fact fidelity and 307/387 for claim-type fidelity; the paper's 385 denominator reports 292/385 and 305/385. These are versioned/documentation counts not reconciled by the inspected v1.2 erratum. Do not silently choose 1,080, 387 or 385 as a universal final denominator.
- The datasheet's dataset-license field is TODO. The repository's Apache-2.0 code license does not establish the dataset license or the licensing terms of all underlying benchmarks.
- The public repository tree contains code/configuration, v1.2 passage data, one ablation raw JSONL file and prompt material. The README says stored model outputs and generated results are distributed separately, but the inspected README/releases did not identify a retrieval location. The main debate outputs therefore could not be independently re-scored from the inspected public repository alone.
- No raw model outputs were downloaded, no new model calls were made, and no GPU/API spend occurred. This is source/provenance QC, not an independent reproduction.

The annotation-count discrepancy is a release/version reconciliation question, not evidence of fabrication or a proven data error. The WinoGrande v1.1 label defect is explicitly documented and corrected in v1.2.

## 4. Source equation and Lean formalization

Abedini et al. give the one-row update in Eq. (1):

b_i(t+1) = γ_i s_i + (1-γ_i) α_i b_i(t) + (1-γ_i)(1-α_i) Σ_j w_ij b_j(t)

with γ_i, α_i in [0,1] and nonnegative row-stochastic influence weights. This is a network opinion-dynamics representation, not a claim about consciousness or a direct measurement of human mental states.

**Assistant reconstruction:** HsH PR [#2168](https://github.com/Satobloc/HsH/pull/2168), stacked on Lean infrastructure PR [#262](https://github.com/Satobloc/HsH/pull/262).

- Module: FORMAL_VERIFICATION/HsHVerification/FriedkinJohnsenSimplex.lean
- Module blob: 214fedd3932262986c5d10f523ca500c0b840b58
- PR head: 507791058e5e513a78044e5c54746c518d8197f5
- Exact-head Actions: [#44692057915](https://github.com/Satobloc/HsH/actions/runs/44692057915), job 136139940030, SUCCESS.
- Lean 4.34.0 / Lake 5.0.0; 8,948 build jobs.
- Four theorem-specific #print axioms outputs: [propext, Classical.choice, Quot.sound]; no sorryAx, no admit, and no custom axiom declaration in the module.
- Workflow tests, lint, leanchecker, nanoda and separate global axiom-audit steps were skipped. This is exact-head compilation plus theorem-specific axiom-log inspection, not a global audit.

The module proves:
1. a nonnegative row-stochastic weighted peer mean preserves a finite probability simplex;
2. a scalar FJ coordinate update is a convex combination and remains in [0,1];
3. one FJ update preserves the finite probability simplex; and
4. the combined one-row network update preserves the simplex.

**Missing proofs / limits:** no convergence or stability theorem; no proof of the paper's empirical fit; no causal-persuasion theorem; no multi-model or human-group result; no H(s)H/SAT geometry or physical interpretation. The PR remains DRAFT / OPEN / UNMERGED. The proof checks only the formalized finite-simplex translation.

## 5. Factory Floor boundary

The Factory Floor README's 2026-11-03 geometry-first gate requires a precise geometric plot of the exact system, independent hostile fidelity review, and the plot displayed with the submitted file. This opinion-dynamics update is a mathematical network model; no object-specific geometric plot or independent hostile review was supplied. No Factory Floor issue or intake was created. A provenance-complete FACTORY_HANDOFF_PENDING packet is retained upstream with status LEAN_VERIFIED / FACTORY_INTAKE_PENDING / GEOMETRY_GATE_BLOCKED; no showroom, LIVE, ARTIFACTS, WEBSITE or BEDROCK promotion is claimed.

## 6. Cross-lane QC and protected work

**P0 Code Grurple:** refreshed against HsH main ba41456fc0fa1f30f10b48bc98e3bd6e7b86bcaf (2026-11-20T06:45:43Z). Eight protected source/control blobs in issue #1747 were independently re-fetched: 8/8 exact matches. PR #2009 remains OPEN / DRAFT / UNMERGED, head ee582b8de93f88f49445c211892529c40b47fded, three commits ahead / 1,680 behind current main, three changed paths; GitHub metadata says mergeable=true but mergeable_state=unstable. No PR-head Actions run was found. P0 remains ACTIVE / LIVE ROUTE UNKNOWN. No rebase, merge, deployment, live route probe or gate change. Evidence refresh comment #7032870943 was added to issue #1747 and read back.

**Orson P1:** the current protocol freeze and ownership were read. This external literature note and the FJ formalization are separate Review-MIND research, not P1 amendments. No Orson manuscript, protocol, dataset, experiment or ownership was changed.

**Other controls:** P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE; FIE review is next due November 24. Task graph remains 18 records / 16 declared branches. Math Hopper #578 and PR #991 remain incomplete/unverified; SciSpace searches returned low-precision results and were not used as evidence. No new tooling, dependency, fork, subscription or task was created.

## 7. Reading and continuation

Unrelated SAT archive reading break completed: 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 2121-2160; return cursor 2161.

**Next research cursor:** reconcile the MINT v1.1/v1.2 human-audit denominator and obtain the separately distributed model-output archive before attempting a reproduction. Keep the external comparator outside Orson's frozen P1 unless Nathan explicitly authorizes a protocol amendment. For the FJ model, the next mathematical extension would be a separately scoped convergence theorem under explicit uniform stubbornness and row-stochasticity assumptions; do not infer convergence from the simplex-invariance proof.
