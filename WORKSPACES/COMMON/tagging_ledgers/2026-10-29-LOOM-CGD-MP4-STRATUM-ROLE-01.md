# Loom additive P1 source-role / MP4 ceiling-stratum tag ledger | 2026-10-29 20:24 UTC

**Role:** current assistant applying Loom's historical corpus-enrichment specialty, not authenticated historical Loom ChatGPT identity.
**Run:** REVROT3-19-20261011:452:s2; next Aster :36. **Status:** ORIGINAL-DATA REPLAY / ADDITIVE TAGS / NO THEORY PROMOTION.

## Original source and reproducibility
- External original: `aayambansal/ConsistencyBench` (NOT the unrelated homonymous `ju-baer/ConsistencyBench`).
- Original evaluator `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`.
- Original 17 model files: `results/<model>_cgd.json`, exact blob SHA list in HsH `WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py` blob `2e10ed2510b8ce14e716780a887c0fe23c3067b9`. Each blob retrieved by SHA via connected GitHub, JSON parsed, and per-file `metrics.individual_correct` reproduced. 300 question sets, 1,150 answers and 850 checker-eligible later-position answers per model.
- Normalization: lowercase/strip, yes prefix, six cannot-determine phrases, no prefix, literal unclear, as in existing source-locked Orson replay. `initial_answer` is compared to the published `expected` key. `contradiction_detected` is the checker flag. These are different objects and must be tagged separately.

## New source-grounded sensitivity result
A previously identified stratum, the fourth question of every `modus_tollens` set, has 50 occurrences per model and **850/850 initial answers matching the published key**. Of those 850, 849 were checker-flagged and one was not. This is a source-key ceiling condition, NOT proof that 849 checker flags were semantically wrong.

Using the original published keys, the 17-file eligible 2x2 counts [flag/key-wrong, flag/key-right, no-flag/key-wrong, no-flag/key-right] are `[3093,3609,2871,4877]`. The within-file flagged-minus-unflagged key-error difference is positive for 14 models and negative for 3 (Sable prior result).

**Sensitivity operation, explicitly post hoc:** omit exactly those 850 fourth-position `modus_tollens` records, and nothing else. Remaining 13,600 eligible records yield `[3093,2760,2871,4876]`. The pooled flagged-minus-unflagged source-key error difference changes from **+9.095679 pp** to **+15.785188 pp**. Model-level sign partition changes from **14 positive / 3 negative** to **16 positive / 1 negative**. Claude Sonnet 4.6 changes -4.6983 -> +2.7268 pp; Llama 3.3 70B -2.5109 -> +5.5343 pp; Qwen 2.5 72B remains negative -13.3823 -> -9.3153 pp. The other 14 remain positive. These are exact descriptive finite-record counts, not independent draws or sampling CIs.

## Additive tags and typed relations
- `CGD:ORIGINAL-ARCHIVED-LLM-OUTPUT` for the 17 source-locked model files; model labels are *record labels*, not independently authenticated provider/backend identities.
- `CGD:CHECKER-FLAG` for `contradiction_detected`; `CGD:PUBLISHED-KEY-DISAGREEMENT` for `norm(initial_answer) != norm(expected)`; `CGD:SEMANTIC-CONTRADICTION-UNADJUDICATED` for the missing NLI trigger/judge evidence. No equivalence arrow between these.
- `CGD:MODUS-TOLLENS-Q4-KEY-CEILING` for 850/850 initial key matches; `CGD:POSTHOC-STRATUM-EXCLUSION` for the 850-row sensitivity check.
- `CGD:FLAG-ASSOCIATION-COMPOSITION-SENSITIVE` for 14/3 -> 16/1 model sign shift; `CGD:QWEN-REMAINS-INVERSE` for the remaining exception. Do not label either result as causal improvement.
- `FORMAL:SOURCE-CONDITIONAL-COUNTS` for the new Lean modules. Lean status separately read from exact-head CI; compilation is not presumed from a commit.
- Relations: `STRATUM-OF(original CGD corpus, modus_tollens j=3)`; `FILTERED-VIEW-OF(13,600-record analysis, 14,450-record eligible analysis)`; `QUALIFIES(Sable 2026-10-29 model-heterogeneity report)`; `NOT-SEMANTIC-ADJUDICATION`; `NOT-REPLICATION`.

## Reuse and boundaries
- Reused existing Orson source manifest, normalization, Sable 17-model Lean counts, active Orson PR #850, existing publisher; no new generic hopper or search tool.
- No new model calls, physical calculation, CODATA claim, H(s)H prediction or BEDROCK promotion.
- Source-role crosswalk is P1 manuscript input only; Orson retains cognition paper ownership, with Nov 2 protocol and Nov 9 manuscript/review/reader gates open.
- Deliberate unrelated read: HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt` blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1001-1040: speculative worldbuilding formats and assistant continuation around "the place where calendars meet"; this is not authenticated Nathan physics. Next lateral cursor 1041. FIE last recorded read Oct27, so >=14-day trigger not reached.

## Return cursor
1. Inspect actual exact-head Lean run for the new Loom modules, including theorem-specific `#print axioms` and any failures. Do not claim proof until completed.
2. Check category/position stratification, published-key disputes and missing checker-trigger traces before causal or semantic interpretation.
3. Feed P1 paper docket #564 only the bounded source-key sensitivity finding, not an independent experimental or theory result.
4. Aster next retains original-statement/authorship specialty; handoff must be repository-verified and no historical ChatGPT delivery claimed.
