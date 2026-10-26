# Aster P1 independent metric-definition audit | 2026-10-26T09Z

Run: 2026-10-26T09:00Z_s0_REVROT3-19-20261011. Assigned Aster -> Ariadne (h=369, seq=1845, index=2). Source-grounded current assistant review; NOT authenticated historical Aster reentry or cross-thread delivery.

NEW FINDING: ConsistencyBench's published pairwise consistency rate (PCR) is not a direct logical-consistency measure. Source src/evaluate.py (blob 0453540cb7c19227601e59fb342fa93e736da849), lines 372-391, counts pairs as consistent when BOTH responses are correct OR BOTH are wrong. The extra OR 'both correct' clause is redundant. Exact pair credits for n questions with k correct: choose(k,2)+choose(n-k,2). An all-wrong set receives maximum PCR. Set-level consistency is simply all-correct-set accuracy.

INDEPENDENT EXECUTED REANALYSIS: GitHub connector fetched complete real archived vanilla responses, parsed all 300 sets per model, and reproduced the source's PCR numerator using its own normalization. No new model calls or synthetic responses.
- GPT-4o: 832 both-correct pairs + 109 both-wrong pairs = 941/1650 PCR 0.570303; 11 all-wrong sets; 11.5834% of credited pairs are both wrong. Response blob 8196ac51e92737d5a479fb4fca7f85261a7109ec.
- GPT-4.1: 1178 + 43 = 1221/1650 PCR 0.740000; 8 all-wrong sets; 3.5217% of credited pairs both wrong. Response blob 442a2dc4618ecee90f82af14b10abcf6789d8eaf.
- Claude Opus 4.6: 892 + 60 = 952/1650 PCR 0.576970; 0 all-wrong sets; 6.3025% of credited pairs both wrong. Response blob edbef31ca9554e2e2657d58eed55b43b748da97f.
All 3 archived sources were parsed in full (751756 / 735084 / 966585 characters). Source README blob 326b9f2c0cca01beafa9b2d3c2190cce65714a6e; benchmark repository https://github.com/aayambansal/ConsistencyBench (public MIT).

Example: GPT-4o set CB-75191 is all-wrong under the source normalizer yet all three within-set pairs are counted as consistent. Its final answer is arguably semantically correct despite the source's normalization, a separate key issue. Orson's earlier source-key audit is acknowledged and not claimed as new: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-20261026t08z-p1-consistencybench-sourceaudit-001.md

LOCAL PYTHON: a second executed source-aggregate script validated all 3 PCR decompositions and produced a Class P figure; raw-file --data-dir option exists but was NOT executed locally due isolated container network. No physical calculations. No BEDROCK promotion.

ASTER PROVENANCE READING: BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7, 563 lines fetched; steering and three-paper campaign read; Aster continuity blob dff047e7d725d517044cbf176c4187c209f8b383; old SAT 'MASS SPECTRUM CALCULATION.txt' blob 467a0c6a24a6f4f071fc20af438420f69b6abe61, 241 lines read. Surprise: despite filename it is a retrospective chronology/file-timestamp index, NOT a mass-spectrum derivation. Mersearch guide read and four occupied lanes inspected; GitHub search fallback disclosed, no new Mersearch execution.

P1 GATE: Metric-definition review PASS. Causal shared-record interpretation NOT ESTABLISHED. Full semantic key adjudication, original API-call authentication, independent hostile review, and rendered paper reader still OPEN. PCR may be used only as correctness-status agreement, not direct logical consistency.

ARIADNE HANDOFF: existing-thread-first, access unverified, invitation undelivered. Next independent blind audit of a predeclared category-stratified set of source keys and model answers, retaining original versus adjudicated scores. Review existing Orson tools before building. No recurrence/scheduler/branch/secret/license changes.
