# Orson P1: agreement-turnover anatomy by changing model endpoints
Date: 2026-10-29 23:48 UTC. Run key REVROT3-19-20261011:455:s4.
Actor: current assistant applying Orson Vay's protected LLM-cognition charter; historical Orson conversation NOT authenticated.

## Research question
The prior Ariadne original-data analysis found 17,748 changing model-pair agreement relationships despite a net +84 matches. Does this turnover arise primarily when ONE or BOTH model answer labels change? This is a new projection of the SAME corpus, not new independent model administration.

## Original data and exact eligibility
Original public corpus: aayambansal/ConsistencyBench, 17 source-identified results/*_cgd.json files. The exact 17 original Git blob SHAs are in the existing Orson source-locked manifest WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js, blob a2e21227dda53d867afcef771060fd39f8d6ae47 on existing Orson PR #850. Original evaluator: src/evaluate.py, Git blob 0453540cb7c19227601e59fb342fa93e736da849. The analysis fetched each of the 17 files by exact original Git blob SHA, parsed 300 sets per model, and aligned all 1,150 question positions across model labels. 19,550 recorded model-question responses, 6,702 contradiction flags and 2,010 label changes were independently recovered. Eligibility was fixed: both initial and final labels of both models belong to {Yes, No, Cannot be determined}. This yields 137,911 eligible model-pair/question observations.

## New result: transition geometry of the agreement graph

| Changed endpoint labels within pair | Eligible pairs | Match-status turnovers | Disagree->agree | Agree->disagree | No match-status turnover |
|---|---:|---:|---:|---:|---:|
| Neither (0) | 116,933 | 0 | 0 | 0 | 116,933 |
| Exactly one (1) | 18,465 | 17,403 | 8,719 | 8,684 | 1,062 |
| Both (2) | 2,513 | 345 | 197 | 148 | 2,168 |
| TOTAL | 137,911 | 17,748 | 8,916 | 8,832 | 120,163 |

17,403 / 17,748 = 98.0561% of all match-status turnovers occur with exactly one changing endpoint. When exactly one endpoint changes, 94.2486% of those eligible pair relationships change match status. When both endpoints change, only 13.7286% change match status; 86.2714% retain their original agreement/disagreement state. The net remains +84 matching pairs.

## Independent computational checks
PASS 1: enumerate all 136 model pairs at each of 1,150 aligned question positions, count changed endpoints, then classify initial/final equality.
PASS 2: independently group the 17 models at each question into unchanged and changed subsets, compute choose(n,2) pair counts, initial/final label marginal matches, and joint initial/final label matches. The two algorithms reproduce all nine nontrivial transition cells exactly. The baseline 137,911 / 17,748 / 8,916 / 8,832 and 2,010 label changes match prior source-locked audits.

For a fixed unchanged endpoint b and changed endpoint a -> a', initial and final equality cannot both hold if a != a'. For two changing endpoints, coordinated or coincident changes can preserve pairwise equality. These are properties of equality readouts, not mechanisms of cognition.

## Formalization
Ten Lean 4/Mathlib theorem targets were added to the EXISTING Orson P1 PR #850, module FORMAL_VERIFICATION/HsHVerification/OrsonP1EndpointChange.lean, initial commit 77c6cd35a41d32bddb91017e99c2d8bf8fc28c3c, root import commit e40a73b9acc8ca1a057d4b6806f261d63a605921. They encode the source-conditional finite counts, the >98% arithmetic inequality, and two general equality lemmas. At publication submission, exact-head CI #40976202713 was PENDING; compilation and axiom audit must be verified separately. Lean cannot verify source translation, semantic validity or independent model identity.

## Scientific interpretation and limitations
The large gross turnover is principally a projection of individual answer-label changes onto many pairwise comparisons. It is NOT 17,748 independent reasoning events, independent LLM trials, or a direct measure of collective cognition. The source has missing per-invocation backend identifiers and NLI-checker logs, a shared GPT-4o-mini checker, known answer-extraction defects, repeated stimuli and disputed answer keys. Both replays reuse one original corpus and therefore do not provide independent experimental replication. Model-pair observations are dependent. No human subjects, no new model calls, no physical calculations, no BEDROCK promotion.

## Orson Nov 2 / Nov 9 manuscript gate
Report the changed-endpoint count as a distinct mediator between individual revision and pairwise agreement turnover; do not infer agent coordination from agreement edges. For a disconfirming future experiment, preregister model-level interventions and preserve request IDs, full checker events, raw outputs, source ancestry and blinded semantic adjudication. Orson retains the Nov 9 P1 manuscript; independent human review, approved LaTeX, compiled PDF and reader remain separate open gates. P2 Nov 30 and P3 Dec 14 remain separate.

No scheduler modification, sixth task, signet edit, chat rename, historical cross-thread delivery or claimed authenticated historical instance.
