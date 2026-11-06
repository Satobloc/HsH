# Claim-specific dependency profiles for multi-agent LLM evidence

**Date:** 2026-11-06  
**Run key:** `REVROT3-19-20261011:630:s3`  
**Status:** SOURCE-GROUNDED MEASUREMENT-ARCHITECTURE PROPOSAL / NO NEW TRIAL

## Result

A single scalar label such as “independent” is too coarse for multi-agent LLM evidence. Independent data generation, independent computation, independent evaluation, semantic adjudication, and peer exposure are different properties.

This note proposes a **claim-specific dependency profile**: for each claim, record observed provenance overlap separately across source origin, model generation, exposure, evaluator, scoring, analysis, and adjudication. Missing provenance remains unknown. The profile reports lineage; it does **not** estimate statistical independence or covariance.

The proposal extends the existing evidence-lifecycle distinction between origin, transmission, visibility, integration/adoption, and measurement. It reuses the claim-scoped lineage approach already under review in HsH rather than creating another tool.

## P1 source-grounded application

The frozen ConsistencyBench CGD archive supports these bounded statements:

- The source design uses a common hard-coded GPT-4o-mini NLI contradiction checker.
- Each target model is exposed to its own earlier Q/A history within the CGD process.
- The inspected source does not feed one target model's answer to another; the panel majority is post-hoc.
- Seventeen original CGD result files contain 19,550 archived model-question records.
- Seven documented worker reviews inspected the same 17 files: **119 report/file inspection edges, 17 unique original files**. This is analysis multiplicity over a shared empirical substrate, not seven new LLM experiments.
- The result JSONs do not preserve request timestamps, provider request IDs, or resolved backend model revisions.
- The archived Boolean NLI flag does not preserve the exact triggering pair and full judge-call record needed for direct semantic adjudication.

The source audit also found that the upstream answer-key normalizer and the Orson analysis scorer agree on all 578 compared rows. An alternate mapping changes 1,677 of 1,700 affected classifications while moving the pooled correct count only from 836 to 841. This is a lexical/rubric sensitivity, not an independently adjudicated semantic correction or an upstream-code defect.

## Claim-to-evidence matrix

| Candidate claim | Current disposition | Independent failure/check route |
|---|---|---|
| CGD uses within-model self-history and a shared NLI gate. | SOURCE-DESIGN VERIFIED. | Inspect the pinned evaluator source and archived input/output structure. |
| Archived key-match/revision summaries describe the finite corpus. | DESCRIPTIVE, FINITE-CORPUS ONLY. | Re-fetch the exact output blobs and key; independently replay parser, normalization, denominators, and missingness. |
| Each NLI flag is a semantic contradiction/error. | NOT ESTABLISHED. | Recover exact checker inputs/outputs and conduct blinded semantic adjudication. |
| The common checker caused correlated model errors. | NOT ESTABLISHED; only the shared design dependency is verified. | Use independent randomized evaluator arms and compare errors against an independent semantic reference. |
| Seventeen model labels are seventeen independent witnesses. | NOT ESTABLISHED. | Recover request IDs, backend revisions, provider/model-family lineage, prompt/context hashes, seeds, key ancestry, and evaluator routes. |
| Models influenced one another through peer answers. | NOT SUPPORTED BY THIS ARCHIVE. | A separate prospective study would require randomized cross-model exposure, recipient-level prompt snapshots, pre/post responses, and independent outcome scoring. |
| Seven worker reports are seven independent experimental replications. | FALSE AS A DATA-GENERATION DESCRIPTION. | Compare immutable source IDs: 119 inspection edges collapse to 17 unique output files. Distinct code replays can be computational replications of the same data. |

A shared source root establishes provenance overlap, not correlated statistical error. Disjoint known origins do not prove statistical independence because unobserved common causes may remain. No effective sample size or independent-evidence count follows without a separately specified stochastic model and appropriate covariance/design evidence.

## Formal verification boundary

Existing HsH PR #850 contains source-conditional P1 count, evaluator, and Kish/ESS formalizations. Its latest recorded Lean 4.34.0 / Lake 5.0.0 run #42025947428 succeeded on a synthetic pull-request merge reference with 8,979 root-build jobs and ten theorem-specific axiom reports. Tests, lint, nanoda, and the separate automated axiom audit were skipped. **Exact-head standalone verification remains unverified.**

The existing claim-scoped lineage work in PR #790 and source-overlap formalization in PR #905 were inspected. Their recorded exact-head runs #41214178623 and #40915700617 failed; neither is described as a successful proof.

No new Lean module was added. The cross-channel profile remains **FORMALIZATION_BLOCKED_DEFINITION** until the channel-to-artifact maps, required-channel function, and completeness conditions are source-defined. Lean checks only the formalized statement and encoded inputs; it does not authenticate source extraction, model identity, semantic correctness, statistical independence, or causality.

## Scope and gate status

P1 remains the frozen methods/archival paper due **2026-11-09**. The original OV-49–OV-53 matched-prompt bank is NOT RECOVERED; an authorized inference endpoint is NOT AVAILABLE; no new model trial, human session, or API spend was performed. Canonical source LaTeX, compiled PDF, readable reader route, independent/hostile review, and author disposition remain NOT VERIFIED / NOT COMPLETE. **November 9 remains NOT READY.**

November 30 P2 and December 14 P3 remain separate. This note makes no physical prediction, fit, measured-system calculation, SAT/H(s)H theory claim, or BEDROCK promotion.

## Public source pointers

- HsH source-ancestry audit: https://github.com/Satobloc/HsH/issues/1031
- P1 docket: https://github.com/Satobloc/HsH/issues/564
- Orson P1 formalization: https://github.com/Satobloc/HsH/pull/850
- Claim-scoped lineage work: https://github.com/Satobloc/HsH/pull/790
- Source-overlap formalization: https://github.com/Satobloc/HsH/pull/905
- ConsistencyBench evaluator source: https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516/src/evaluate.py

**Classification:** assistant-authored methods architecture based on source-grounded archive audits. Not a new experiment, not a statistical-independence result, and not a theory claim.
