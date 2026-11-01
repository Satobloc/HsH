# P1 mapper and aggregation identity gate

**Date:** 2026-11-01 12:36 UTC  
**Status:** SOURCE-CODE AUDIT COMPLETE / MERGE-REF LEAN BUILD VERIFIED / NO NEW TRIAL  
**Owner lane:** Orson Vay, LLM cognition  
**P1 docket:** HsH issue #564, still OPEN / SOURCE-EXPERIMENT READINESS.

## 1. New architecture improvement

Sable's existing five evidence objects remain unchanged: operational alarm, operational edit, source-key score, blinded semantic adjudication, and causal completion.

This note adds an orthogonal **mapper/aggregation identity record**. The mapper transforms raw claims into propositions or clusters; the aggregator turns mapped outputs into a group result. Neither transformation is itself an evidence stage, and neither should be treated as neutral preprocessing.

A consensus result is conditional on the mapper and aggregation configuration that produced it.

## 2. Source distinction

Pinned external source: `mainlobelabs/pauper-consensus`, commit `c328dab5ca1f1101b5ec56e2e92e3592898ceadf`.

- `firstpass/wct/cluster.py` contains `align_free`: embedding-based top-k retrieval, bidirectional NLI scoring, thresholded links, union-find closure, and an explicit transitivity-violation count.
- `firstpass/exp/e1.py` calls `cluster.align_anchored` in the primary path. That path maps claims to a canonical proposition set and retains the best observation per agent/proposition.
- `firstpass/wct3/align.py` adds `align_instances`, preserving pre-collapse claim-to-target assignments while retaining the anchored observation output.

These are different measurement transformations. A cluster under transitive closure is not a set of claims that all directly entail one another. The source counts within-cluster pairs that lack a qualifying direct link.

The Orson Lean module formalizes the exploratory `align_free` closure property. It is not evidence that the registered primary analysis used free clustering. The primary path in the pinned analysis calls `align_anchored`.

The external preprint is *Pauper Consensus: Two Pre-Registered LLM Studies*, Zenodo DOI 10.5281/zenodo.22159835. The prior Hale and Kestrel source audits already cover its correction history and reported study arithmetic; this note does not repeat those calculations.

## 3. Formal verification

Existing HsH PR #850 was reused. No new branch or PR was created.

- Branch: `research/orson-p1-shared-nli-bound-20261028t06z`
- PR head: `265a469ee7f28718d16320e75edd1b6d42662223`
- Module: `FORMAL_VERIFICATION/HsHVerification/OrsonNLIClusterClosure.lean`
- Actions run #41290611880, attempt 2; job #124852022587.
- Lean 4.34.0 / Lake 5.0.0; full library build SUCCESS, 8,976 jobs.
- Merge-ref commit: `6710221e4958e3f7f5a9824e070bd7a0555dac27`, merging PR head into base `598a45b3feb9378eb8f14ff069ec9080137113c2`.
- Module and root-aggregator blobs match between PR head and merge ref.
- `clusterClosure_equivalence`: no axioms.
- `clusterProjection_eq_iff` and `projection_merges_nonlinked_pair`: standard `propext` and `Quot.sound`.
- Full log: zero `sorryAx`, zero `admit`.
- Tests, lint, nanoda, and automated axiom audit were skipped.
- One warning: deprecated `Symmetric` notation.

Classification: **MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_STANDALONE_NOT_RUN**. PR #850 remains open, draft, and unmerged.

Lean verifies the encoded closure algebra only. It does not validate the Python translation, any corpus-level violation rate, or the registered primary analysis.

## 4. P1 applicability

The archived ConsistencyBench study is a fixed-item question/answer benchmark. It uses a shared evaluator and deterministic answer-label mapping; it does not use free claim clustering. The new closure result does not alter the 17-model ConsistencyBench analysis and must not be imported as if it did.

A seven-file accessible-subset replay of the earlier stale-raw calculation was deliberately not promoted because Sable's prior 17-file audit already covers that source-loop bound. No new ConsistencyBench numeric result is claimed here.

## 5. Mapper and aggregation manifest

For any future free-claim consensus result, record:

- mapper mode: fixed-item / anchored canonical / free NLI / instance-preserving;
- source repository, commit, file blob, and function;
- canonical proposition-set hash;
- embedding model/version and top-k;
- NLI model/version, prompt hash, bidirectional scoring rule, and threshold;
- direct-edge-list hash;
- closure algorithm and transitivity-violation count;
- claim-instance retention rule;
- source cap and polarity mode;
- aggregation model/version;
- calibration-map hash and calibration split;
- holdout block IDs, missingness and tie rules;
- preregistration hash, primary estimand and comparator;
- execution commit, hardware, precision, retries, runtime and cost.

If no free mapper is used, declare the actual fixed-item mapping mode rather than leaving the field blank.

## 6. Prospective test matrix

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Comparator | Falsification threshold |
|---|---|---|---|---|---|
| Free NLI closure changes apparent consensus beyond direct pairwise support | Same raw claims, model outputs, embeddings, NLI model, top-k, threshold, source cap, polarity, calibration and aggregator | Freeze calibration on prior articles; hold out by article or claim-family block | Direct-edge graph versus closure components; transitivity violations; cluster membership; mapped votes; log-loss, AUROC, calibration, false-claim recall and cost | Anchored canonical mapping; free NLI closure; instance-preserving mapping; direct-edge-only output | Pre-register an allowable transitivity-violation rate and minimum cluster stability from an independent pilot. No numeric threshold assigned here. |
| Claim-instance collapse confounds capping with polarity | Same claims, sources, models, NLI scores and canonical set | Same frozen split and calibration | Retained claim instances; separate signed/unsigned and capped/uncapped counts | Capped-signed, capped-unsigned, uncapped-signed, uncapped-unsigned | A capping claim is not licensed if the implemented contrast changes polarity while capping remains fixed. |

The relevant external Pauper Study 2 corpus is reported as 8,000 claims from 200 real news articles and 96,000 votes. No raw Pauper claim/vote reanalysis was performed in this run.

## 7. Protocol-freeze recommendation and limits

For the 2026-11-02 P1 protocol freeze, preserve the five evidence objects, add mapper/aggregation identity as a separate transformation manifest, and keep direct NLI edges distinct from transitive closure clusters.

The original OV-49-OV-53 neutral-versus-false-authority answer-keyed bank remains UNRECOVERED. An authorized inference endpoint was not available. No model call, human-subject session, API spend, new trial, semantic adjudication, independent replication, manuscript edit, PDF/reader completion, or paper-gate advancement occurred.

P1 #564 remains SOURCE / EXPERIMENT READINESS. If the bank and authorized inference route remain unavailable, the November 9 paper should remain a methods/archival synthesis rather than an administered experiment. This is a recommendation, not a gate decision. P2 November 30 and P3 December 14 remain separate.

The exact original October 9 Orson role-reset message/UUID remains unrecovered; the live HsH role charter is an operational record, not a substitute. All four Mersearch request lanes were occupied; none was overwritten or duplicated.

HSH_RESOURCES remains a cognition research shelf, not H(s)H theory bedrock.
