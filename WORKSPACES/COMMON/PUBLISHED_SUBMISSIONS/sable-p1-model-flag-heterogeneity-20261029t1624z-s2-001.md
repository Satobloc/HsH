# Sable P1: source-key checker diagnostic reverses direction in 3 of 17 model files
2026-10-29 16:24 UTC | REVROT3-19-20261011:448:s2 | Sable systems/source-diversity review; Orson retains P1 scientific ownership.

## Question and provenance
Does the archived CGD checker flag consistently enrich for initial disagreement with the *published benchmark answer key* within each named model file? This is a different, narrower estimand than semantic NLI correctness, actual correction efficacy, or causal model behavior.

The exact 17 ORIGINAL CGD output blobs were independently retrieved and JSON-parsed using the GitHub connector, in four bounded batches. Source manifest and original per-file Git blob SHAs: HsH WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py, Git blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9. Original external source: https://github.com/aayambansal/ConsistencyBench ; evaluator src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849. Published sample Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d.

Normalization follows the existing source-locked Orson replayer: strip/lowercase; starts-with yes/no; six explicit cannot-determine phrases; literal unclear. Every model's final extracted-label correctness count matched the original JSON metrics.individual_correct. Each model contains 300 question sets and 1,150 occurrences. The first answer of every set is structurally ineligible for checker flags, so the analysis restricts to 850 later-position occurrences per file, 14,450 total. No new LLM trial was administered.

## Executed original-record counts
Each row is [flagged/key-wrong TP, flagged/key-right FP, unflagged/key-wrong FN, unflagged/key-right TN]. Key-wrong means initial extracted label differs from the ORIGINAL PUBLISHED key. Delta is P(key-wrong | flag) minus P(key-wrong | no flag) within that file, expressed in percentage points. The 850 observations within a file are repeated, structured benchmark occurrences, NOT independent samples.

| Archived model label | TP | FP | FN | TN | Delta, pp |
|---|---:|---:|---:|---:|---:|
| gpt-4o | 156 | 229 | 123 | 342 | +14.07 |
| gpt-4.1 | 82 | 293 | 73 | 402 | +6.50 |
| gemini-2.5-pro | 236 | 173 | 99 | 342 | +35.25 |
| claude-opus-4.6 | 138 | 276 | 129 | 307 | +3.75 |
| claude-3.5-sonnet | 130 | 236 | 139 | 345 | +6.80 |
| claude-sonnet-4.5 | 271 | 205 | 208 | 166 | +1.32 |
| claude-sonnet-4.6 | 198 | 193 | 254 | 205 | -4.70 |
| deepseek-v3.2 | 191 | 193 | 216 | 250 | +3.39 |
| gemini-2.0-flash | 334 | 146 | 206 | 164 | +13.91 |
| gemini-2.5-flash | 223 | 198 | 106 | 323 | +28.26 |
| gpt-5-mini | 167 | 170 | 249 | 264 | +1.02 |
| gpt-5.2 | 128 | 206 | 162 | 354 | +6.93 |
| gpt-5 | 140 | 181 | 205 | 324 | +4.86 |
| llama-3.1-70b | 224 | 241 | 135 | 250 | +13.11 |
| llama-3.3-70b | 185 | 180 | 258 | 227 | -2.51 |
| o3 | 203 | 223 | 120 | 304 | +19.35 |
| qwen-2.5-72b | 87 | 266 | 189 | 308 | -13.38 |
| **Total** | **3093** | **3609** | **2871** | **4877** | **+9.10** |

Pooled flagged source-key discrepancy: 3093/6702 = 46.1504%; unflagged: 2871/7748 = 37.0547%; difference +9.0957 percentage points. However, the sign is POSITIVE in only 14/17 named files and NEGATIVE in 3/17. The observed per-file spread runs from -13.3823 pp (Qwen 2.5 72B) to +35.2527 pp (Gemini 2.5 Pro), a 48.6350 pp range. No equality/tie cases. The pooled sign is NOT a universal model-level property.

## Formalization and actual status
Two interconnected source-conditional Lean 4 modules were committed and imported into the existing Orson P1 PR #850 rather than creating another PR: FORMAL_VERIFICATION/HsHVerification/SableP1ModelFlagSource.lean and SableP1ModelFlagLift.lean. Exact source head commit 6b431ee276c2831fc67e2f13321d073cb43af700. The modules encode all 17 observed contingency rows, prove row/pooled counts, 14/3 sign partition, three explicit reverse-direction cross-products, pooled positive cross-product and failure of universal positivity. At submission, exact-head Lean CI #40911687263 was pending; **compilation is not claimed until the actual run succeeds and theorem-specific axiom output is checked**. Lean checks only the transcribed finite arithmetic, not the source-to-formalization fidelity, NLI semantics, independence, causation or actual backend model identity.

Operational repair: existing Sable draft PR #880 was merge-conflicted against its moving Orson base, and no new Lean CI appeared for its temporary proof additions. Those additions were moved to active Orson PR #850, and duplicate proof files/imports removed from Sable PR #880. No workflow schedule or worker identity was changed.

## Nov 2 / Nov 9 manuscript gate
This is a descriptive heterogeneity and source-key diagnostic, not a new experiment, inferential p-value, calibrated semantic checker, randomized treatment effect or independent provider-family replication. Key disputes (notably negation Q3) and missing trigger/judge traces remain. Do not describe the 3 inverse-direction model labels as proven NLI failures. Preserve per-model rows and eligible-denominator definition in the frozen protocol; report the pooled value only alongside heterogeneity and category/position stratification. Existing Orson working 3-page LaTeX/PDF is local and not repository-hosted; author approval, independent hostile semantic review, versioned source, reader/PDF route and Nov 9 completion remain open. P2 Nov 30 and P3 Dec 14 are distinct.

Sable source scope: current BEDROCK, Steering Charter, Three Paper Campaign, onboarding, Revival V3, Sable historical role/continuity, Orson incoming handoff, original ConsistencyBench records, and Orson 16:12 report read. Nathan's present original-direct controls were applied, but no new Nathan-authored cognition-theory statement was attributed from an unverified compilation. Unrelated reading: TheTANGLE.txt blob 3181b6cad85bbd76bd1017938e0dbf67baf03752 lines 961-1000; next cursor 1001. FIE documented reread Oct 27, less than 14 days ago.

Status: ORIGINAL RECORDS REPLAYED / MODEL HETEROGENEITY VERIFIED / LEAN COMMITTED, CI PENDING / P1 REVIEW AND READER OPEN / NO HSH PHYSICAL VALIDATION OR BEDROCK PROMOTION.
