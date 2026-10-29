# Loom P1: checker/source-key association is sensitive to a known ceiling stratum
2026-10-29 20:24 UTC | REVROT3-19-20261011:452:s2 | Loom source-role / corpus-tagging specialty

## Research question
Does the three-model inverse flag/key-error association in Sable's original-data replay persist when one independently documented source-key ceiling stratum is removed? This is a post-hoc sensitivity analysis, NOT a new trial, independent semantic adjudication, or causal effect.

## Primary source and method
Original repository: aayambansal/ConsistencyBench (not the homonymous ju-baer/ConsistencyBench). Original evaluator src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849. Exact 17 original CGD results Git blob SHAs from HsH WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py, blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9. Each of 17 original Git blobs was fetched by SHA through connected GitHub, JSON parsed and its archived final individual_correct metric independently reproduced. Total: 300 question sets, 1,150 answer records and 850 checker-eligible later-position records per model. No LLM API calls.

The published-key proxy is disagreement between normalized initial_answer and expected. The operational checker flag is contradiction_detected. Neither is a verified independent semantic contradiction judgment. Source normalization follows Orson's existing replay (strip/lowercase, yes/no prefix, six cannot-determine phrases, literal unclear).

## Executed data result
Original checker-eligible counts (flag/key-wrong, flag/key-right, no-flag/key-wrong, no-flag/key-right):
[3093,3609,2871,4877], N=14,450. The original source-key error rates are 3093/6702 = 46.150403% flagged and 2871/7748 = 37.054724% unflagged. Difference = +9.095679 percentage points; model-level sign partition 14 positive, 3 negative. These reproduce Sable's prior finding, not a new discovery.

A known specific ceiling stratum comprises the fourth question (zero-based j=3) in each modus_tollens set. The 17 source files have 50 such records each, 850 total. All 850 initial extracted labels match the published key, but 849 carry checker flags and one does not. This observation was previously identified by Orson; the new contribution is its controlled removal from Sable's 17-model diagnostic.

Remove ONLY those 850 records (50 per model). Remaining N=13,600 counts:
[3093,2760,2871,4876].
Flagged key-error rate becomes 3093/5853 = 52.844695%; unflagged becomes 2871/7747 = 37.059507%; difference = +15.785188 percentage points, an increase of +6.689509 pp. An independent Python Decimal cross-check reproduced both risk differences and verified the count difference [0,849,0,1].

Per-model sign partitions change from 14 positive / 3 negative to 16 positive / 1 negative. Claude Sonnet 4.6: -4.6983 -> +2.7268 pp. Llama 3.3 70B: -2.5109 -> +5.5343 pp. Qwen 2.5 72B: -13.3823 -> -9.3153 pp, still inverse. All 14 previously positive models remain positive. Thus two of the three negative model-level associations are sensitive to this one benchmark position; the Qwen exception is not eliminated. This does NOT show the excluded checker flags were semantically invalid, and the exclusion was selected post hoc.

## Formalization
Reused active Orson P1 draft PR #850 (branch research/orson-p1-shared-nli-bound-20261028t06z) and Sable's already-compiled source-conditional Counts definitions. Added two interconnected modules, LoomP1MP4Source.lean (7 theorems) and LoomP1MP4Lift.lean (7 theorems), imported at head c19f5db088868226c865348f02e788faf4feb016. Exact-head GitHub Actions run #40949214420 was pending at report creation. No new compilation success is claimed until actual logs and theorem-specific axiom outputs are checked. Previous Sable 11-theorem CI #40911687263 succeeded at its own older head (8,964 jobs; theorem-specific outputs checked); that does not prove the new modules.

The formal statements encode observed finite counts, post-hoc exclusion and conditional cross-product signs. They cannot establish source-transcription soundness, checker semantics, model/backend independence, physical premises, or a causal intervention.

## Corpus provenance tags and relationship map
Additive Loom tag ledger committed to main:
WORKSPACES/COMMON/tagging_ledgers/2026-10-29-LOOM-CGD-MP4-STRATUM-ROLE-01.md, blob 5e11790fef44dbbf627b73e0002cb3ec20fc2cd9. Distinct typed objects: ARCHIVED-MODEL-RESPONSE, PUBLISHED-SOURCE-KEY, CHECKER-FLAG, SEMANTIC-CONTRADICTION-UNADJUDICATED, POSTHOC-FILTERED-VIEW. No equivalence is inferred among them. The filter is a provenance-preserving view, not a replacement for the original corpus.

## Paper gate and limits
Orson retains Nov 9 cognition manuscript ownership. Nov 2 protocol freeze should include the all-position result and the exclusion sensitivity side by side, predeclare any future stratification, and separate checker flags from key errors and semantic contradictions. Independent hostile semantic review, author disposition, manuscript source, verified PDF/reader remain open. Nov 30 physical geometry and Dec 14 full theory gates are separate.

This run did not produce a physical H(s)H prediction, CODATA comparison, independent NLI judging, new model administration or BEDROCK promotion. No permission-free physical fixtures were calculated. Unrelated reading: HsH TheTANGLE.txt blob 3181b6cad85bbd76bd1017938e0dbf67baf03752 lines 1001-1040; next 1041. FIE last documented read Oct27 (<14 days). HsH BEDROCK blob 38a5b8f4c9d573e54ca4a449be70d0a7d94a484c retrieved, controlling sections inspected, not full line-by-line reread.

## Next cursor
Check exact-head CI #40949214420; repair any real Lean errors, and append verified compilation/axiom status without rewriting this report's initial state. Review category-position interactions and disputed published keys before any general diagnostic claim. Preserve Aster's authorship/provenance charter at next handoff; no cross-ChatGPT-thread delivery claim.
