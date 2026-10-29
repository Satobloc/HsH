# Mercer Review-MIND | Source-locked leave-one-model-out fragility of LLM agreement
**Nominal:** 2026-10-29 15:48 UTC | **Run:** REVROT3-19-20261011:447:s4 | **Actor:** current assistant, Mercer-specialty source reconstruction, not authenticated historical Mercer.

## Original evidence and replay
- Actual public source: aayambansal/ConsistencyBench, 17 original CGD JSON Git blobs (300 sets and 1,150 question records per model); each original Git blob SHA and model_id is recorded in the source-locked 136-row matrix below. All 17 original blobs were fetched and parsed independently, with exact model_id matches.
- Existing 136-pair identity-preserving matrix: Satobloc/HsH, `WORKSPACES/MERIDIAN/2026-10-29_1148Z_P1_IDENTITY_PRESERVING_PAIR_MATRIX.csv`, Git blob `fa51dcaacfb618db2b4eb18d009291255f777af1`, on existing Meridian PR #895. Matrix is a derived locator, not a substitute for original outputs.
- Replayer: align 300 `set_id` objects across models, compare corresponding question positions, and retain a pair-question occurrence only when **both initial and final extracted labels of both endpoints** are non-null and not `Unclear`. Count exact equal initial and final labels. All 136 recomputed rows match the source-locked matrix exactly (0 mismatches).
- Replayed totals: 137,911 eligible pair-question observations; 102,797 initial matching; 102,881 final matching; **net +84**. These observations are repeated measures on shared questions, not independent statistical samples.

## New sensitivity result
For each of the 17 recorded model identities, delete every pair involving that model and recompute the same fixed-eligibility agreement difference. The 17 remaining datasets each have 120 model pairs, with no invented outputs. **Six of 17 single-model deletions reverse the sign of the original +84 change.** The retained delta ranges from **-636** (omit Qwen 2.5 72B) to **+767** (omit Llama 3.1 70B). Removing o3 leaves only **+3**.

Let `d_ij` be the final-minus-initial matching-pair count for named models `i,j`. The total is `D = Σ_(i<j) d_ij = +84`. Let `I_k = Σ_(j≠k) d_kj` be the incident contribution of model `k`. The leave-one-out value is exactly `D_(-k) = D - I_k`. The independently replayed ledger has `Σ_k I_k = 168 = 2D`, the expected edge double-count identity.

| Removed recorded model | Incident delta | Retained delta |
|---|---:|---:|
| qwen-2.5-72b | +720 | -636 |
| gpt-4.1 | +712 | -628 |
| claude-sonnet-4.6 | +392 | -308 |
| gpt-5.2 | +243 | -159 |
| gpt-5 | +220 | -136 |
| claude-opus-4.6 | +211 | -127 |
| o3 | +81 | +3 |
| gemini-2.0-flash | +31 | +53 |
| gpt-4o | +14 | +70 |
| deepseek-v3.2 | -122 | +206 |
| claude-sonnet-4.5 | -128 | +212 |
| claude-3.5-sonnet | -156 | +240 |
| gpt-5-mini | -210 | +294 |
| gemini-2.5-pro | -347 | +431 |
| gemini-2.5-flash | -349 | +433 |
| llama-3.3-70b | -461 | +545 |
| llama-3.1-70b | -683 | +767 |

## Interpretation and limits
This is an **empirical source-label measurement sensitivity** in a historical archived dataset, not a randomized LLM experiment, a cognitive ability measurement, or evidence of independent model backends. The sign of the small aggregate change is not robust to all one-model exclusions. It is not a significance test and does not invalidate model-level or question-level findings. Model labels are requested API identifiers; original invocation metadata and backend identities are not independently authenticated. A changed denominator is a changed estimand. Pair-question observations share questions and models, so naive independent-observation uncertainty intervals would be misleading.

**Source-conditional formalization:** `FORMAL_VERIFICATION/HsHVerification/MercerP1LeaveOneOut.lean` on existing Mercer draft PR #829, source blob `81237e7175e9b7053aa231d791e08a14e67043d3`, imported at commit `c4c415504cd9e0649575e7f8dbe6ee413b286d7f`. Seven finite-ledger/partition claims submitted. **Lean compilation and axiom inspection not verified at report submission**; the previous PR success was on an older head and does not verify these additions. Lean can check the encoded ledger and algebra, not the data extraction, semantics or model independence.

## P1 editorial consequence
For Orson's Nov 2 protocol freeze and Nov 9 minor manuscript, show leave-one-model-out sensitivity alongside the fixed-eligibility headline and identity-preserving matrix. Keep Orson scientific ownership, independent reviewer, LaTeX, PDF/reader and author approval as separate outstanding gates. No SAT/H(s)H physical calculation or theory promotion is implied.
