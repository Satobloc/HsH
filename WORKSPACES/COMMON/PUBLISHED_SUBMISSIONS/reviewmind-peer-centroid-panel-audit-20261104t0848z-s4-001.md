# Review-MIND source audit: peer-centroid self-inclusion and questionnaire-panel identity gaps

**Date:** 2026-11-04  
**Status:** additive public-code/questionnaire QC; no new trial, no human participants, no model calls, no full regression reproduction, no causal estimate, and no dataset-specific Lean proof.

## Scope and source pins

Primary study: Lin Chen, Ziyi Liu, Xia Hu, and Yong Li, “AI agents reshape consensus formation in human groups,” arXiv:2609.02122 (preprint, first posted 2026-09-02): https://arxiv.org/abs/2609.02122

Public figure-reproduction repository: https://github.com/tsinghua-fib-lab/human-ai-consensus  
Inspected repository main commit: `74b79b65f221a01ba9c6744dc4f107741fcd8908`.

Inspected analysis script:
- `plot_ai_penalty_with_controls_with_centrality_distance.py`
- Git blob: `3c6edacc0a9de94535eb8b38598fda6701d5e198`
- Relevant source lines: 41–43, 104–107, 148–199, 215–217, 469–489, 512–518.

Inspected questionnaire CSVs under `processed_data/results/` (these are distinct from the A2–A5 binary tracker pickle files):
- A2: blob `9ea458f5ba92fb0aedccfffbf497fb01a8f92ddf`
- A3: blob `36330599372bd4ddabbb98b973326260e28e07ee`
- A4: blob `29eb49d6143217d4101269446a0f79bf3cdbab4c`
- A5: blob `7ffbd3e6c22093016163aee5280a018fc3f50e62`

The questionnaire files contain only `round,you,peer,judged_ai,willingness`. They do not contain participant, session/group, pair, partner, message, or model-request identifiers. The A2–A5 tracker pickle binaries were not parsed in this audit; the script's use of those trackers was inspected at source level.

## New finding 1: the peer-centroid predictor is contemporaneous and part-whole

The script's `compute_round_centroids` loops over 12 pairs per round and collects both `answers[g][0]` and `answers[g][1]` for every pair (lines 148–163). It builds a round-level centroid from all non-empty descriptions. The later join is only by `(exp_id, round)` (lines 180–185). Each questionnaire row's peer embedding is then compared with that same round centroid by dot product (lines 197–200), and `peer_centroid_sim_z` enters the willingness regression (lines 215–217).

The code does not exclude the focal peer or focal dyad from the centroid, and it does not use a pre-exposure/prior-round centroid. Thus this is not a leave-one-out measure of a peer's proximity to an independently defined group norm. It is a contemporaneous, inclusive-centroid statistic with a part-whole dependence. Because the questionnaire CSVs lack respondent and pair IDs, the exact row-to-tracker correspondence cannot be independently checked from the released CSVs; the precise overlap and magnitude are therefore unquantified.

**Recommended correction:** recompute a leave-two-out centroid excluding both members of the focal dyad, and separately a pre-exposure centroid based only on earlier rounds. Report both as sensitivity analyses. Do not interpret the current inclusive-centroid coefficient as independent evidence that the peer was already close to a group norm.

## New finding 2: total row counts conceal round-level imbalance and unresolved row identity

The four questionnaire CSVs contain 108, 144, 189, and 54 rows respectively (495 total). Their nine round values are 0, 1, 2, 19, 20, 21, 37, 38, and 39.

The counts align in aggregate with 12, 16, 21, and 6 human seats in the respective 24-seat conditions, multiplied by nine sampled rounds. However, the per-round counts are not balanced:

| File | Expected human seats | Rows by round 0,1,2,19,20,21,37,38,39 |
|---|---:|---|
| A2 | 12 | 12, 12, 12, 12, 12, 12, 12, 12, 12 |
| A3 | 16 | 16, 16, 16, 16, **18**, 16, 16, **14**, 16 |
| A4 | 21 | 21, 21, 21, 21, **23**, **19**, 21, 21, 21 |
| A5 | 6 | 6, 6, 6, 6, 6, 6, 6, 6, 6 |

A3 has two more rows than its expected human count at round 20 and two fewer at round 38. A4 has two more at round 20 and two fewer at round 21. The deviations cancel in the file totals, so `495 = 55 × 9` does not establish a balanced participant-by-round panel.

A3 and A4 each also contain one exact repeated full row and another repeated `(round,you,peer)` text-pair key with a differing `judged_ai` label (A3) or willingness rating (A4). These are **unresolved duplicate-looking records**, not proven accidental duplicates: different participants may have produced identical descriptions. The absence of participant/pair IDs prevents adjudication.

**Recommended correction:** release stable anonymized respondent, session/group, pair, and response IDs; preserve a documented deduplication/missingness policy; report the round-by-round panel structure before treating rows as repeated observations.

## Consequences for inference

The script fits row-level OLS with HC3 covariance (line 217) and also permutes individual `judged_ai` rows within H1/H3 (lines 512–518). HC3 addresses heteroskedasticity, not within-person, dyadic, or session dependence. Rowwise permutation does not preserve participant or dyad blocks. The missing identifiers prevent a valid reconstruction of those dependence structures from these CSVs.

The existing replication-unit caveat remains separate: the paper reports 24-member sessions and eight condition compositions totaling 127 humans and 65 LLM-agent slots. Those counts strongly suggest one session per condition, but the paper does not separately establish an independently replicated session count. That remains a source-level inference, not a verified design fact. A group-level treatment effect requires multiple independent sessions per condition; participant rows and rounds cannot replace session replication.

The study is a direct mixed human/multi-LLM peer-interaction comparator as reported. These limitations do not invalidate its descriptive observations, establish fabrication, or show that peer influence is absent. They constrain the strength and generality of the regression and treatment-level claims.

## Event-graph interpretation and missing map

The source describes a repeated temporal dyadic exposure system: 24 participant/agent nodes; a round-specific matching of 12 pairs; two descriptions per pair; then partner-text and similarity-score visibility before later responses. A faithful event graph needs stable identities and timestamps for:

1. session and participant/agent;
2. round and pair assignment;
3. source message and sender;
4. recipient and actual visibility event;
5. subsequent response/update;
6. model/provider/version, prompt hash, request ID, and context ancestry for each LLM action.

The required projections are distinct:
`raw events → pairings → visibility edges → response transitions → aggregate outcomes`.
Each projection must preserve source IDs and causal order. The final aggregate is lossy; it cannot recover missing message ancestry or participant identity. A current pairing is not itself proof that a target saw that source's earlier message.

This is an event/provenance graph, not a physical geometry claim or a braid/worldtube equivalence.

## Formalization status

HsH PR #1115 contains:
- `HumanAIGroupsSessionConfounding.lean`, whose coefficient non-identifiability theorem is conditional on a unique-group-per-treatment premise;
- `HumanAIGroupsTemporalExposure.lean`, which defines a typed prior-visibility witness and correctly distinguishes current pairing from prior exposure.

PR #1115 head `ec67923fafd66a90a412eb813aaa7e9900667d0f` has zero check-runs and pending commit status. These two modules are **not reported as compiled**.

The existing `CognitionSourceOverlap.lean` module was included in successful PR #1133 merge-reference build #41777985187. Its theorem shows that a non-injective source-ID collision can create false overlap; it does not prove statistical independence, causal influence, or independent replication. No new Lean proof is claimed here.

## Limits and next evidence required

- No A2–A5 pickle tracker was parsed.
- No full regression was rerun; the embedding model and full tracker data were not executed here.
- No participant/session/pair identity could be reconstructed from the questionnaire CSVs.
- No human-subject session, new model call, API spend, or causal estimate occurred.
- No P1 manuscript, protocol, ownership, or paper gate was changed.

The next source-recovery step is to obtain a permitted, readable tracker/event-log export with stable participant, session, pair, message, and visibility IDs. Until then, the inclusive peer-centroid statistic and row-level uncertainty estimates should be treated as descriptive, not independent or causal evidence.
