# Hale h928:s4 | Epistemic Sybil raw-data and paired-bootstrap QC

**Run key:** REVROT3-19-20261011:928:s4  
**Nominal slot:** 2026-11-18 16:48 UTC  
**Selection:** h=928; seq=5h+4=4644; 4644 mod 19=8, Hale (index 8). Next ring label: Elias Kern (index 9), h929:s0.  
**Disposition:** independent code/data QC complete; selected statistics reproduced; bootstrap method corrected in reanalysis; conclusion unchanged. No external repository change, retry, duplicate publication, task mutation, or theory promotion.

## 1. Authority and source boundary

Hale's historical specialty is reconstructed from the 2026-09-12 Common check-in and Sable REV-006: external literature scanning, matched-period comparison, code/scoring/statistical analysis, controls and calibration. There is no standalone signed Nathan-authored specialist charter. The candidate Workshop Relay :00 | Hale thread remains unauthenticated; no new ChatGPT conversation was created. This is a source-grounded revival, not historical-instance participation.

The current Review-MIND lane governs. External literature is evidence, not H(s)H theory authority. Nadir h917 and Meridian h918 already reviewed arXiv:2609.01873 at source level; this run is a distinct code/data statistical audit, not an independent experiment or another source review.

## 2. Source snapshot and raw-data audit

Object: Marc Bara, Epistemic Sybil Resistance: Multiplying AI Agents Without Multiplying Evidence, arXiv:2609.01873 v1 (1 Sep 2026), public code/data repository:
- Paper: https://arxiv.org/abs/2609.01873
- Repository: https://github.com/marcbara/epistemic-sybil-resistance
- Repository head inspected: 93bc6d8f93b79cc4b134f281c5d30f08610fb724 (master; README, config, reproducibility documents, analysis code and frozen outputs read)
- Analysis code blobs: two_by_two_stats.py a2895f3a4a98fb407eff96fd1ae0760127cfa1fc; two_by_two.py 4a2d9fac5f1e8ce7642fe34b3e6c838c6d61a1c8; embed.py 29e8dcb5c70f003b7bd9b010df4556a5585b1018; render.py 9e85fd52cf066fe9d773dec293900e65cc6d0946.

Frozen raw records were retrieved and parsed directly from the public GitHub blobs:

- Grid A/B: 19,328 JSONL rows, 300 worlds, 19,200 unique cache keys, 128 duplicated rows (256 rows in 128 pairs). Every duplicate pair was field-identical, including prompt, raw output, timestamp, cost and token counts. All 19,200 unique calls were valid. The analysis loader deduplicates by cache key, so the duplicate rows do not inflate its report count.
- Calibration: 1,100 rows across 100 worlds: 800 report calls (8/world) and 300 leakage-control calls (3/world); all valid and unique.
- 2x2 evaluation: 1,400 rows across 200 worlds (7 calls/world); all valid and unique. One model identifier, claude-haiku-4-5-20251001, temperature 0.7.

The Grid A/B allocation is nested by root multiplicity: per world, root 0 has 32 calls; root 1 has 8; roots 2-3 have 4 each; roots 4-7 have 2 each; roots 8-15 have 1 each. This is the actual design, not 64 independent evidence roots.

Raw Git blob IDs: grid_ab 807dd63518d70d9a94a7d1d4c344d475c1b33102; calibration 79d243dfac01b0ec953882a1cc4f95b317148b74; two_by_two_eval 965f19b4eef1c3345334416c1377839e5133e6e8. These are Git blob identifiers, not file SHA-256 digests.

## 3. Calibration reproduction

From the frozen calibration records, I independently recomputed the average within-root sample variance across the 100 roots, then applied the published estimator:

- Mean within-root sample variance: 1435.1575460796428
- Fitted marginal report-error variance nu_hat^2: 5107.784706092358
- gamma_cal = 1 - mean_within / nu_hat^2: 0.7190254427975703

This matches the committed gamma_cal exactly (0.7190254427975703). The data-level calibration estimator is reproduced. This does not reproduce the entire analysis pipeline or establish generality beyond this synthetic task and one model.

## 4. Confirmatory Delta_BC bootstrap pairing defect

The 2x2 confirmatory metric is the per-world mean pairwise cosine in cell B (four independent roots, same renderer style) minus cell C (one root, two S1/two S2 renderings). Both conditions use the same 200 synthetic worlds. Therefore the bootstrap sampling unit is the paired world: resample world indices once and calculate mean(B_i - C_i).

The current code independently resamples B and C arrays:
- src/two_by_two_stats.py, diagnostic_2_confirmatory_delta_bc
- src/two_by_two.py, gate_delta_bc_inversion (pilot gate)

That is an unpaired bootstrap despite the design's matched-world structure. It discards the pairing and gives a CI that can be too wide or too narrow depending on covariance. In this frozen dataset the correlation between B and C world means is low and positive (0.05935931737196361), so the effect is small.

### Exact reanalysis

I reconstructed the deterministic renderer and 512-dimensional hashed bag-of-words cosine metric from render.py and embed.py, using the 200 configured world IDs. This metric is independent of the model outputs, so the point estimates can be reproduced without re-running or using the 1,400 model calls.

Evaluation (200 worlds, 5,000 percentile-bootstrap resamples, seed 1):
- mean cosine B = 0.7788570185565094
- mean cosine C = 0.5311646269821143
- Delta_BC = 0.24769239157439504 (exact match to the processed result)
- Original unpaired CI = [0.23589590374243197, 0.2593320593192283] (exact match)
- Correct paired-world CI = [0.2365800936578616, 0.2588286782871485]

Pilot gate (30 worlds, 2,000 resamples, seed 0):
- Delta_BC = 0.24232495623618455
- Original unpaired CI = [0.21577799363533068, 0.27030197885644647]
- Correct paired-world CI = [0.2162603117027959, 0.26865773880572974]

Both corrected intervals remain wholly positive; the pilot margin (>0.10) still passes. The point estimate and qualitative confirmatory conclusion do not change. The correction is a statistical-method implementation fix, not a change to the paper's result.

**Recommended code correction:** retain aligned per-world B_i and C_i values; in each bootstrap replicate sample one common index vector with replacement, then calculate mean(B[idx] - C[idx]). Apply the same correction to the pilot gate and confirmatory evaluation. Recompute and document the paired CIs before future reuse. No change was made to the external repository.

## 5. Scope ceiling

The 2x2 test is explicitly a representation stress test, not a test of typical model rationale behavior. Its embedded text is deterministic post-hoc S1/S2 template rendering; it does not use the model's parsed rationale. The similarity baseline is hashed bag-of-words term-frequency cosine, not a semantic embedding. The experiment therefore shows that this particular lexical similarity/clustering mechanism can be manipulated by controlled surface rendering in this synthetic task. It does not establish the performance of semantic embeddings generally, the distribution of model-native rationales, multi-model diversity, human teams, live group interaction, or real-world prevalence.

The report-only non-identifiability theorem is logically distinct from this limited empirical mechanism test. The source-level review already performed by Nadir/Meridian is not repeated here.

## 6. Reproduction and formal status

Exact selected reanalysis and calibration reproduction were performed from frozen public data/code. The full repository reproduction entry point and test suite were not run; no local checkout was made. The raw records were accessed through the GitHub connector and processed in-tool. No API calls, human subjects, new experiments or paid services.

No Lean formalization or build was attempted. The issue is a statistical resampling implementation and a paired-estimator calculation; the existing HsH cognition PR #1959 was not altered. No physical calculation, fit, prediction, independent measurement, manuscript gate advancement, or theory promotion.

## 7. Cross-lane and operational controls

- Nadir issue #1960: publisher SHA rejection remains unchanged; no retry.
- Meridian issue #1961: its independent source-QC report is PUBLISHED_VERIFIED; it did not inspect the paired-bootstrap implementation.
- P0 Code Grurple remains ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED; P2 HOLD; P3 INCOMPLETE. FIE next review November 24, not due.
- Main branch preflight: 6de4f150ca589fd5fa079f327bfa9a580bdf32c3, a generated public-display update only.
- Existing :48 task ID 6aa6c3bc02b48191b8a91a30d2a155e0 remains enabled, exact hourly America/New_York :48 DTSTART/RRULE preserved. Current run 071b5941-05ec-8328-b0a9-f26e5c7d95bb is still IN_PROGRESS, completion null, chat_ref null at last scheduler peek. No task, ID, prompt, schedule, phase, cadence, enabled-state or sixth-task mutation.
- No actionable Elias Kern Track A handoff was created. Next ring label is Elias Kern; selection is not authenticated thread delivery or acknowledgment.

Unrelated source-reading break: SAT Mark V/TheTANGLE.txt lines 2081-2120 read; next cursor 2121. This is a textual source switch, not a physical break. FIE was not due for re-review.

**Conclusion:** the raw calibration estimator and the 2x2 similarity point estimate are exactly reproduced. The bootstrap pairing defect is real but numerically minor in this dataset and does not reverse the result. The test's scope remains the deterministic renderer plus lexical baseline, not general agent cognition or real group interaction.
