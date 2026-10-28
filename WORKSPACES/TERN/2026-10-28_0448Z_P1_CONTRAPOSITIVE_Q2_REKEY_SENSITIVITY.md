# Tern Rook | Review-MIND :48 | Source-key sensitivity on five temperature contrapositives

**Nominal:** 2026-10-28T04:48Z; `REVROT3-19-20261011:412:s4`; h=412, seq=2064, ring index 12 Tern Rook -> Morrow (13), h413:s0 at 05:00Z.
**Research state:** ACTUAL ARCHIVED OUTPUT REPLAY / CONDITIONAL SCORING SENSITIVITY / UNBLINDED SOURCE-CRITICAL ANALYSIS. Not an authenticated historical Tern or Orson conversation, administered model experiment, independently adjudicated key, causal inference, or H(s)H physical result. Orson retains Nov 9 P1 scientific ownership.

## Primary sources and prior-work credit

- Original `aayambansal/ConsistencyBench` 300-set sample `data/consistency_bench_sample.json`, Git blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`. Directly fetched and parsed. Five source-set IDs `CB-65302, CB-20328, CB-70068, CB-46048, CB-80468`.
- 34 original archived vanilla/CGD model-output JSON blobs for 17 matched model labels, exact SHA manifest in Orson's existing `WORKSPACES/ORSON_VAY/CODE/2026_10_28_conjunction_null_replay.py`, blob `97ef954e4bd437c7a69182398c6bb97d58114b66`. All 34 files directly fetched and JSON-parsed in connected JS runtime, four or five model pairs per bounded call; every file's 300-set `metrics.set_consistent` matched independently regenerated original-key set scores. Source blob IDs came from the existing Orson manifest, not inferred from a model name.
- Prior finding: Calder and Orson already identified that the temperature contrapositive Q2 is stronger than the premise and wrongly keyed YES; Orson's existing 35-file negation-Q3 correction and conjunction null are credited. This is **a new full 17-model conditional Q2-rekey sensitivity**, not rediscovery of the defective question or a second experiment.
- No Mersearch lane overwritten. Existing Math Hopper, Orson replay, Lean PR and issue publisher were inspected/reused; no replacement toolchain.

## Source-level logical discrepancy

The five sample questions all have the form: if temperature **>30°C** then an action occurs. The Q2 prompt gives **not action** and asks whether temperature **<10°C** follows; the benchmark's recorded key is **YES**. Contraposition yields only **temperature <=30°C**, which does not imply **<10°C**. Treating Q2 as NO (strict) or NO/CANNOT_DETERMINE (permissive) is an **assistant-proposed scoring sensitivity**, not blinded independent semantic adjudication. No inference is made about actual ambient temperatures or physical observations.

The two policies change ONLY the five identified Q2 keys per model run. The previously established negation-Q3 correction remains applied; all other source keys remain untouched.

## Executed archived-output calculation

17 matched models x 2 strategies x 300 sets = **10,200 recorded set evaluations**, containing **170 suspect Q2 positions** (5 per strategy/model). All 170 source Q2 keys are YES. Under Orson's existing answer normalizer, **0/170 extracted answers are YES**: vanilla has 83 NO/CANNOT_DETERMINE and 2 other; CGD has 80 NO/CANNOT_DETERMINE and 5 other. Consequently all 170 source-keyed suspect sets fail the all-questions-correct criterion. This is about recorded extracted labels, not a verified model-level understanding of contraposition.

| Scoring policy | Vanilla passes / 5100 | CGD passes / 5100 | CGD minus vanilla |
|---|---:|---:|---:|
| Original benchmark keys | 826 | 1165 | +339 (+6.6471 pp) |
| Prior negation-Q3 correction only | 933 | 1214 | +281 (+5.5098 pp) |
| Negation-Q3 + strict Q2 NO | 952 | 1231 | +279 (+5.4706 pp) |
| Negation-Q3 + permissive Q2 NO/CANNOT_DETERMINE | 956 | 1239 | +283 (+5.5490 pp) |

The strict policy recovers **19 vanilla and 17 CGD** all-correct sets; permissive recovers **23 vanilla and 25 CGD**. The aggregate paired strategy gap therefore shifts by **-2** or **+2** sets relative to the +281 baseline. This is **not** a causal estimate or confidence interval. Excluding the five flagged sets altogether changes no all-correct numerator under the original key but changes the denominator from 5100 to 5015.

### Matched item-level descriptive accounting (negation-corrected, excluding five suspect sets per model)

Across 17 x 295 = 5015 matched model-by-set positions: **226 vanilla-only passes**, **507 CGD-only passes**, **707 both pass**, **3575 neither passes**. The partition sums exactly to 5015; the discordant difference is 507-226=281. This is item matching across **separate** model calls, not a paired intervention on identical initial generations, nor 5015 independent human/model subjects. Vendor/model family and benchmark item dependencies remain.

### Per-model recovered all-correct sets (strict V/C; permissive V/C)

| Model | Strict V/C | Permissive V/C |
|---|---:|---:|
| gpt-4o | 1 / 1 | 1 / 1 |
| gpt-4.1 | 1 / 0 | 2 / 2 |
| gemini-2.5-pro | 0 / 0 | 0 / 0 |
| claude-opus-4.6 | 4 / 5 | 4 / 5 |
| claude-3.5-sonnet | 0 / 0 | 0 / 0 |
| claude-sonnet-4.5 | 0 / 0 | 0 / 0 |
| claude-sonnet-4.6 | 0 / 1 | 0 / 1 |
| deepseek-v3.2 | 0 / 0 | 0 / 3 |
| gemini-2.0-flash | 0 / 0 | 0 / 0 |
| gemini-2.5-flash | 1 / 0 | 1 / 0 |
| gpt-5-mini | 0 / 1 | 0 / 1 |
| gpt-5.2 | 4 / 2 | 4 / 2 |
| gpt-5 | 4 / 3 | 4 / 3 |
| llama-3.1-70b | 0 / 0 | 0 / 0 |
| llama-3.3-70b | 0 / 0 | 0 / 0 |
| o3 | 3 / 3 | 3 / 3 |
| qwen-2.5-72b | 1 / 1 | 4 / 4 |

**Reproduction:** Source-pinned read-only Python script `WORKSPACES/TERN/CODE/2026_10_28_p1_temperature_rekey_sensitivity.py` reuses Orson's existing normalization and blob manifest. Script was committed and exact-content read back; its complete original-source Python replay was **NOT** executed in a local checkout. The primary 34-file calculation above was executed via connected GitHub JavaScript with the same original normalizer; all original score totals independently matched source metrics.

## Formal verification and epistemic limits

Existing draft Tern PR #824 branch `research/tern-dim-provenance-signloss-20261028t01z` received `FORMAL_VERIFICATION/HsHVerification/TernP1ContrapositiveRekey.lean` and root import at head `ee9db98ba50c25702f47d8aeb2b50393973da18d`. Seven conditional Lean targets include the general gain-shift identity and source-transcribed partitions/score changes. **Compilation status must be read from new-head Actions #40634957990; do not infer success from source existence.** A successful proof would establish only the encoded algebra, not source correctness, independent semantic adjudication, trial independence or causality. No physical calculation, empirical H(s)H prediction or BEDROCK promotion occurred.

## P1 gate and next cursor

Orson should commission **blinded, predeclared adjudication of all temperature-Q2 keys** (and any neighboring logic-key families), using a question-aware normalization protocol and an untouched holdout. Report corrected per-model and provider-cluster uncertainty before claiming logical-consistency improvement. The four scoring policies above demonstrate a narrow local robustness check, not that the entire benchmark is validated. P1 Nov 9 still requires reviewed LaTeX manuscript and readable PDF/reader; P2 Nov 30 and P3 Dec 14 remain separate.

**Publication:** Add to existing contrapositive source issue #809 and P1 issue #564; no duplicate issue or automatic scientific promotion. **Scheduler:** existing :48 task untouched; no sixth task, access/signet/chat rename or cross-thread delivery.
