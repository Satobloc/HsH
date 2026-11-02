# Review-MIND addendum: pairing-history data availability and exact-message exposure

**Date:** 2026-11-02  
**Evidence class:** public primary manuscript metadata + public repository commit history + public reproduction-code inspection  
**Disposition:** SOURCE-AVAILABILITY CORRECTION / REANALYSIS PATH IDENTIFIED / NO PICKLE REPLAY / NO CAUSAL CLAIM

## 1. Correction to the prior data-availability description

The earlier Review-MIND audit correctly noted that the public repository does not contain a separately exported influence-network/PageRank script for Supplementary Figure 8. Its statement that the actual pairing schedule was not released was too broad.

The current public repository contains processed tracker files `A2.pkl` through `A5.pkl`. Its existing script `plot_adoption_persistence_dynamics_by_pair_type.py` reads `tracker["players"]` and `tracker["answers"]`, assumes 12 pair groups per round, and builds per-round maps from participant IDs to pair index and side.

This source-code path indicates that pair identities and paired answer records are embedded in the processed trackers and that per-round pairings are likely reconstructable. The more precise statement is:

**No separately exported pairing-schedule file or independently replayed schedule was located; per-round pairings appear reconstructable from the public A2–A5 tracker pickles and existing helper code.**

The binary pickles were not opened or executed in this review. Therefore the actual schedule, participant-role mapping, and exposure counts remain unverified.

## 2. Source chronology: two different firsts

The repository's current GitHub metadata records creation on 2026-04-28. Its earliest extant commit, also dated 2026-04-28, contains the README and license. The first extant code-and-processed-data commit is dated 2026-05-16 and is titled “Upload code and processed data”; it adds the A2–A5 tracker pickles, panel-adjacency material, intermediate results, and analysis scripts.

The arXiv record for Chen et al., *AI agents reshape consensus formation in human groups*, was first submitted on 2026-09-02. The code/data commit therefore precedes the first located manuscript record by 109 calendar days.

This is **first extant repository evidence**, not a certified first-public timestamp. The inspected GitHub metadata does not expose a repository visibility-change history, so it does not establish when the repository or its data first became publicly accessible. Likewise, the arXiv record is the earliest located manuscript exposition in this audit, not proof that no earlier public mention existed elsewhere.

## 3. What the public code does and does not reproduce

The repository README and `run_all_figures.py` enumerate scripts for the main figures and Supplementary Table 1. A bounded inspection of the current top-level Python files found no implementation identified as the Supplementary Figure 8 influence network or its PageRank calculation.

The existing pair-type script does provide a useful reconstruction path:

- it reads the tracker’s `players` and `answers` arrays;
- it constructs round-level participant-to-pair maps;
- it associates each participant with a pair index and side;
- it can therefore support a pairing-history audit once the processed pickle bytes are actually loaded.

Two code-robustness checks should be added before treating those maps as validated data: the current helper does not assert that every round contains 12 complete pairs with 24 distinct participant IDs, and duplicate participant IDs can overwrite earlier map entries. Its full-round truncation helper also silently drops an incomplete tail. These are validation gaps in the helper, not evidence that the released data are malformed.

The bounded code inspection does not prove that no separate author-side implementation exists.

## 4. Exact-message exposure is narrower than general prior visibility

The published directional-alignment construction uses the source participant's round-(r−1) embedding as its reference vector. A generic record that B saw some earlier message from A does not establish that B saw the exact round-(r−1) message represented by that vector.

The interface's recent-history panel may expose older partner messages. Those are different message versions. If B saw A's message from round s<r−1, that supports a history-window exposure record for that older message; it does not establish visibility of A's round-(r−1) expression.

For an edge using the exact source vector from round r−1, the exposure record should bind:

- source participant A and target participant B;
- the exact source message ID or content hash;
- source-message round r−1;
- the time or event at which that message became visible to B;
- B's outcome-submission event in round r;
- proof that visibility preceded that outcome.

A separate history-window estimand can use the actual earlier message version B saw and recompute the alignment against that version. It should not silently substitute an older exposure for the round-(r−1) vector.

This refines the temporal-exposure qualification in [Review-MIND issue #1256](https://github.com/Satobloc/HsH/issues/1256). Even exact exposure is necessary but not sufficient for causal influence; shared group state, common feedback, prior interactions, homophily, and session effects remain alternatives.

## 5. Concrete reanalysis path

Using the public processed trackers, a future replay can:

1. Load each available A2–A5 tracker and record its blob hash and software environment.
2. Validate each round's pair count, participant uniqueness, absence of self-pairs, and complete coverage before constructing maps.
3. Build `partner[round][participant]` and `message[round][participant]` from the recorded pair identities and answer versions.
4. For every directional-alignment edge, test whether the exact source message used by the formula was visible to the target before the target's outcome.
5. Keep exact-source exposure, older history-window exposure, and unqualified directional alignment as separate edge classes.
6. Only then recompute edge weights and centrality, preserving session/condition structure in uncertainty analysis.

No such replay or exposure count is claimed here.

## 6. Epistemic status

- The paper's reported human–agent group design is a published result, not an independent replication by this review.
- The public repository's processed tracker files and pair-map helper are directly inspectable source artifacts.
- The claim that the pairings are reconstructable is a source-code-supported inference pending actual pickle readback.
- The absence of an SFig8/PageRank script is a bounded repository observation, not a universal absence claim.
- The exact-message exposure requirement is a methodological condition, not a finding that the paper's consensus result is false.
- No human-subject session, new model call, participant-level data extraction, independent network reproduction, or causal estimate was performed.

## Sources

- [Primary paper and first arXiv record](https://arxiv.org/abs/2609.02122)
- [Public code and processed-data repository](https://github.com/tsinghua-fib-lab/human-ai-consensus)
- [Repository first extant commit](https://github.com/tsinghua-fib-lab/human-ai-consensus/commit/969ab0be7ef86797db05dc7e7e16796306260abc)
- [Repository code/data upload commit](https://github.com/tsinghua-fib-lab/human-ai-consensus/commit/748636db333221801820adf547cd7e458d584524)
- [Existing pair-type analysis helper](https://github.com/tsinghua-fib-lab/human-ai-consensus/blob/main/plot_adoption_persistence_dynamics_by_pair_type.py)
- [Existing Review-MIND temporal-exposure addendum](https://github.com/Satobloc/HsH/issues/1256)
- [Existing human–multi-LLM group evidence audit](https://github.com/Satobloc/HsH/issues/1116)
