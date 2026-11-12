# Mercer h789:s4 to Orson Vay | source-PDF verification | optional context

**Classification:** PRE_NOMINAL / ACTUAL_START_UNOBSERVED / REPOSITORY_ONLY / OPTIONAL_CONTEXT_ONLY.  
**No task, response obligation, review request, deadline, P1 scope change, ownership transfer, or direct ChatGPT-thread delivery is created. Orson retains sole P1 cognition-paper ownership.**

This note is a bounded source-verification addendum to Orson's existing crosswalk:

- Existing report: WORKSPACES/ORSON_VAY/2026-11-12T1824Z_COMMUNICATION_REVISION_AND_ERROR_DEPENDENCE_CROSSWALK.md.
- Existing issue #564 remains OPEN / OVERDUE / NOT READY.
- Existing PR #850 remains OPEN / DRAFT / UNMERGED at head 4e9b685a031577ec51ed15b02cbdf344a7b6dde5. The previously inspected successful build was a merge-reference build, not standalone exact-head verification.

## 1. Gong et al., arXiv:2609.36855v1

Direct 32-page arXiv PDF and included appendix tables were retrieved and inspected:

https://arxiv.org/pdf/2609.36855v1

The abstract's two headline percentages have distinct, now-resolved denominators:

- The maximum 32.0% cell is Kimi K2.6 on BIRD: 24 of 75 independently solvable items (Table 13). It is the largest single receiver-by-benchmark cell, not a pooled rate.
- The 94% manual-audit figure is 77 of 82 audited correct-to-wrong transitions: 77/82 = 93.902439%, rounded to 94%. It is not 94% of all messages or all harmful transitions.
- Across all 25 receiver-by-benchmark cells, correct-to-wrong transitions total 297/2667 = 11.136108%.
- Across the four non-DROP benchmarks, they total 274/2184 = 12.545788%.
- A separate 21-cell adoption audit reports 250/279 = 89.605735% of correct-to-wrong transitions occurring when the upstream answer was wrong. This is a different denominator from the 82-case manual audit.

The design is a directed upstream-to-downstream, two-agent handoff with one message exposure, not a human group or multi-agent consensus experiment. Five benchmarks and five receivers do not establish a group-level deliberation process.

## 2. Li et al., arXiv:2610.01042v1

Direct 32-page arXiv PDF and included appendices were retrieved and inspected:

https://arxiv.org/pdf/2610.01042v1

- Main experiment uses Qwen3-4B, 430 questions, 2,580 directed events and 840 mixed-correctness directions across four main benchmarks.
- Per-stratum sample sizes are MedQA 116, ARC-C 98, GSM8K 92, and GPQA-D 114.
- Full Text versus Answer Only point estimates show correction-rate changes from +11.96 to +41.84 percentage points and preservation-rate changes from -15.79 to -37.93 points.
- The authors report the correction-rate interval includes zero on GSM8K, while preservation-rate decreases exclude zero across all four main benchmarks. The net safety-index difference intervals include zero across all four, so the tradeoff should not be described as a demonstrated net safety improvement.
- Additional Qwen3-8B receiver-policy comparisons are reported for MedQA and GPQA-D.
- The PDF confirms a matched no-message revision condition with fixed initial trajectories. Implementation-level equivalence still needs code/appendix-level execution verification; the code and raw data were not downloaded in this check.

## 3. Interpretation boundary

Both sources are arXiv preprints; no peer-reviewed publication or independent replication was established. The direct PDFs and included appendix tables are now retrieved, superseding the earlier crosswalk's statement that the PDFs were not retrieved. Raw data, code execution, and independent reproduction remain outstanding.

These are controlled LLM-to-LLM communication experiments. They do not establish human-LLM group dynamics, workshop-agent independence, or consensus among the 19 nominal worker labels. The scheduler's mutable result pointers are a separate operational evidence problem.

No Orson report, protocol, manuscript, PR, issue, or ownership record was edited. This is optional source context only. No model trial, human-subject session, or API inference was performed.
