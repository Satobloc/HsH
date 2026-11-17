# Orson Vay | Three-roster endpoint provenance audit

**Classification:** SOURCE-LOCKED ARCHIVE AUDIT + FINITE FORMALIZATION. This is an additive methods artifact, not a P1 protocol amendment, new experiment, manuscript edit, or paper-gate advancement.

## Selection and authority

The nominal ring calculation gives h=896, seq=4483, and ring index 18: Orson Vay. Sable is next. Selection is a worker-label routing rule, not authentication of a historical ChatGPT instance or thread.

The September 23, 2026 direct user-role appointment to the AI-cognition remit is source-anchored in the private Library export. The public role card is an assistant-maintained synthesis; the exact October 9 role-reset message remains unrecovered. The latest located Orson raw conversation export has last user activity on November 6. Live-thread usability is not verified. This is source-grounded Orson work, not authenticated historical-instance participation or cross-thread delivery.

## Controls and prior state read

Read the live HsH BEDROCK in full (667 lines), Steering Charter 2026-10-26, Three Paper Campaign, current workflow orientation, three-repository onboarding, revival V3/V4, HsH root README, SAT archive root README, HSH_RESOURCES root README, Orson role charter, P1 protocol freeze, Orson README/BOOT/CURRENT_WORK/INBOX, P1 issue #564, PR #850, latest Orson h889:s0 and h892:s4 receipts, the h892 public issue, the Common Mersearch guide and four canonical request files, PWH action queue, task-branch graph, and the existing Orson origin-bank compact receipt. No HSH_RESOURCES private payload was opened.

The frozen P1 scope remains the source-audited ConsistencyBench CGD methods/archival paper. No new model trial, model API call, human session, inference spend, protocol amendment, manuscript edit, PDF/reader completion, independent review, or paper-gate advancement was authorized or performed.

## Substantive result: three rosters, not one

The pinned public source is [aayambansal/ConsistencyBench at commit bfc676baa848c7f1715bb73aee148180de15516](https://github.com/aayambansal/ConsistencyBench/tree/bfc676baa848c7f1715bb73aee148180de15516).

Exact source pins:
- [src/run_all.py](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516/src/run_all.py), blob `ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c`.
- [src/evaluate.py](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516/src/evaluate.py), blob `0453540cb7c19227601e59fb342fa93e736da849`.
- [stratified sample](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516/data/consistency_bench_sample.json), blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.

The source audit now reconciles three separate rosters:

| Layer | Count | Meaning |
|---|---:|---|
| `run_all.py` declared target roster | 6 | One orchestrator's explicitly listed models |
| `evaluate.py` supported alias/endpoint registry | 22 | Labels the evaluator can resolve to requested OpenRouter endpoint strings |
| Archived CGD payload roster | 17 | Exact result-file labels and their recorded `model_id` strings |

The exact six-label orchestrator/archive intersection is five. `deepseek-r1` is the sole declared label absent from the 17 archived CGD files. Twelve archived labels are outside the declared six, including `deepseek-v3.2`. All 17 archived label/endpoint pairs are present in the 22-entry evaluator registry. The 17 recorded endpoint strings are unique; they span six provider namespaces (Anthropic 4, DeepSeek 1, Google 3, OpenAI 6, Meta-Llama 2, Qwen 1). These are routing namespaces, not six independent laboratories or proof of 17 independent model systems.

This extends the already-published 5-of-6 / 17-file finding: the new work verifies the payload-level `model` and `model_id` fields against the evaluator's complete alias registry and formalizes the exact crosswalk. It does not relabel the archive as one predeclared 17-model run.

## Fixed-panel recheck

All 17 original result blobs were fetched by their exact Git blob IDs recorded in the existing `OrsonCGDManifestBounds` module. Every payload has strategy `cgd`, 300 sets and 1,150 question records. A connected-runtime script compared the ordered projection `(set_id, category, premise, [(question, expected)])` across all 17 payloads: all 17 signatures are identical. The same projection exactly matches the pinned sample JSON.

This re-confirms the prior November 11 finding; it is not presented as a new sample or new experiment. The correct denominator language is 300 shared benchmark sets and 1,150 shared question positions with 17 output layers: 5,100 model-set rows and 19,550 model-question rows. Those aggregate rows are not 5,100 unique sets or 19,550 independent prompts.

## Newly clarified provenance ceiling

The 17 payloads expose top-level fields `model`, `model_id`, `strategy`, `num_sets`, `metrics`, and `results`. A recursive key scan across all 17 found no run ID, creation timestamp, provider request/response ID, sample SHA, resolved backend revision, finish reason, usage record, call ID, or generation ID.

The source code explains why this matters:
- `run_all.py` seeds the sample generator, rewrites the sample path, and its `check_done` predicate checks only whether the output filename exists. It does not validate that an existing file matches the current sample, source commit, model endpoint, or run.
- `evaluate.py`'s `call_model` returns only `response.choices[0].message.content`; provider response metadata is discarded. The retry path returns the literal `[ERROR]` after retry exhaustion.
- `evaluate.py` supports 22 aliases and its batch runner defaults to the full registry, whereas `run_all.py` declares six. The archived 17-file set therefore cannot be attributed to one invocation of the six-model orchestrator from the available files alone.
- The stored `model_id` is a requested endpoint string. It is not a provider-resolved model revision or proof of the backend actually used at call time.

Consequently, the strongest defensible description is: **17 archived CGD output files with 17 distinct requested endpoint strings, all aligned to one fixed 300-set / 1,150-question panel, evaluated through the same hard-coded GPT-4o-mini checker.** The archive does not establish a single 17-model run, 17 independent model systems, 17 independent replications, exact call chronology, provider-side model revision, or request-level success/retry lineage.

This distinction is consequential for P1: the unit structure is paired by shared item and clustered by the 300 benchmark sets; model labels and endpoint strings are not independent evidence channels. The shared checker remains a common measurement dependency, and the within-model CGD self-history remains distinct from cross-model peer exposure.

## Lean formalization

Added `HsHVerification.OrsonCGDRosterProvenance` to the existing Orson P1 PR #850 branch; no new branch or PR was created.

- Module: [OrsonCGDRosterProvenance.lean](https://github.com/Satobloc/HsH/blob/research/orson-p1-shared-nli-bound-20261028t06z/FORMAL_VERIFICATION/HsHVerification/OrsonCGDRosterProvenance.lean)
- Module blob: `01eb4a3cd48a40b0e96a5a569ec20e59bd467983`.
- Root import commit: `e2a987207b03b2a67e2c254a6b84d4cb69d2249e`.
- Added 21 finite, decidable theorems: archive/registry/roster counts; uniqueness of labels, endpoint strings, filenames and blob IDs; archive-to-registry membership; exact 5/6 intersection; missing/extra labels; aggregate row counts; and the recorded top-level run-lineage field inventory.

The propositions are deliberately narrow. Lean can verify the encoded finite table and arithmetic; it cannot prove the raw JSON-to-Lean transcription, the connected-runtime sample equality, provider execution, backend revision, model independence, NLI semantic validity, causal efficacy, or internal cognition.

[PR #850](https://github.com/Satobloc/HsH/pull/850) remains OPEN / DRAFT / UNMERGED and stacked on its existing feature base. No merge, rebase, or independent-review claim is made. Its exact-head Lean Actions run is recorded separately in the canonical receipt as pending until a terminal job result and checkout identity are inspected. Vercel's preview deployment was rate-limited; that is not Lean evidence.

## Workflow and evidence status

- P1 issue #564: OPEN / SOURCE-EXPERIMENT READINESS / OVERDUE / NOT READY.
- P1 protocol freeze: unchanged.
- OV-49 through OV-53 original answer-keyed bank: NOT RECOVERED.
- Authorized inference endpoint: NOT AVAILABLE.
- Mersearch: no callable Mersearch action in this runtime. The existing Orson origin-bank request has a compact receipt (135 hits / 74 paths) but raw results are withheld. All four canonical request lanes remain requested/occupied; no request was overwritten, retriggered, or released.
- PWH: current queue and task graph read. WH-05 remains unresolved; no lane transition or release was attempted. Tern retains lane-release authority. No PWH PASS is claimed.
- HsH/SAT/HSH_RESOURCES navigation roots were inspected; HSH_RESOURCES private payloads remain unopened.
- No physical system, physical calculation, fit, prediction, covariance propagation, independent measurement, or H(s)H forward map was involved. No worldtube thickness, twist, contact surface, or distinct timesheet is forced by this cognition-method audit.
- No SAT-O or Blockwave equation was changed, corrected, or retranscribed.
- P0 remains ACTIVE; P1 remains OVERDUE / NOT READY; P2 remains HOLD; P3 remains INCOMPLETE. FIE next review is November 24. November 30 P2 and December 14 P3 gates remain separate.

## Next exact steps

1. Verify the current PR #850 Lean run by exact checked-out commit and terminal job logs; do not promote an in-progress run.
2. Obtain independent review of the source table and the 21 theorems, without treating the PR's draft status as review.
3. Recover a genuine run manifest/provider call log only if it exists in an authorized source. If it does not, retain the provenance ceiling rather than infer execution history.
4. Continue the frozen P1 methods paper only from existing source-backed material; no new trial, API spend, human session, protocol amendment, manuscript edit, or gate advancement is implied here.

**Disposition:** SOURCE-LOCKED ARCHIVE AUDIT COMPLETE; THREE-ROSTER PROVENANCE CONTRACT ADDED; LEAN BUILD PENDING AT REPORT TIME; P1 NOT READY; NO EXPERIMENT; NO THEORY PROMOTION.
