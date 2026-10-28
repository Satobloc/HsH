# Orson Vay | 2026-10-28 17:24 UTC | P1 exact-prompt component graph

**Research classification:** CURRENT ASSISTANT SOURCE-GROUNDED RECONSTRUCTION of protected Orson LLM-cognition remit. Historical Orson ChatGPT conversation NOT authenticated. No new LLM calls, physical calculations, causal inference, or BEDROCK promotion.

## Actual original-source execution
- Public aayambansal/ConsistencyBench `data/consistency_bench_sample.json` Git blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`; full `data/consistency_bench.json` blob `3171d2899fd1eb4292794df5952514666b0e2f43`; evaluator `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`, actual lines 175-290 inspected.
- Complete source JSONs parsed through GitHub connector JavaScript. Union-find graph joins set IDs sharing an EXACT `questions[].question` string. Sample: 300 sets, 1150 occurrences, 977 unique question strings, 81 repeated groups, 229 connected components, 24 nontrivial, max 8 sets. Full: 493 sets, 1904 occurrences, 1538 unique strings, 122 repeated groups, 353 components, 29 nontrivial, max 12. Within-set exact repeats 0, conflicting verbatim expected-label groups 0; semantic correctness is a separate problem.
- Sample exact-question component size histogram `{1:205,2:3,3:10,4:3,5:4,6:2,7:1,8:1}`; full `{1:324,2:3,3:3,4:4,5:5,6:2,7:5,8:2,9:2,10:2,12:1}`. All nontrivial components are in negation or syllogistic categories.

## Exact finite split combinatorics, not an observed split
Uniform fixed-size set-ID holdout of 60/300 or 99/493 is a hypothetical **design comparator**, not a claim about benchmark authors' actual split. For connected component sizes `k_i`, exact probability of no cross-split identical question is `[x^H] product_i (1+x^(k_i))/C(N,H)`. Dynamic-programming BigInt in connector JavaScript, independently recomputed using Python `math.comb`.
- Sample P(no crossing)=`1.3650526831968849e-11`; expected crossing repeated-question groups `38.22382772010134`, crossing components `13.36374250168522`.
- Full P(no crossing)=`4.6283082475447325e-21`; expected crossing groups `66.10190089253582`, crossing components `19.746279911673017`.
- No independent-group assumption: groups overlap; exact zero-crossing count uses graph components. Exact formula for one k-set group crossing: `1-(C(N-k,H)+C(N-k,N-H))/C(N,H)`.

## Important context projection qualification
- **39/81 sample** and **65/122 full** repeated exact-question groups have different parent `premise` and `logical_form` metadata, all syllogistic. The negation repeated groups have the same premise.
- Evaluator `evaluate_vanilla` and CGD **initial** calls supply only exact question text; CGD **revision** prompts add parent `premise`, prior Q/A and context. Thus initial-prompt identity and revision-context identity are DIFFERENT keys.
- Recompute graph using compound key `(question,premise)`: sample **269** components, 14 nontrivial, max 5; full **428**, 19 nontrivial, max 7. Same hypothetical split P(no crossing) becomes `2.6028064216070648e-5` and `1.318037518038163e-9`; expected crossing compound-key groups `20.75147380` and `34.03618529`. Independent Python exact combinatorics checked probabilities.
- These are two projections of one real benchmark, NOT separate observed trials. No observed train/test leakage, inflated score, semantic equivalence, or causal CGD effect established.

## Formal proof and publication gates
- Existing Orson draft PR #850 branch `research/orson-p1-shared-nli-bound-20261028t06z`; added `OrsonPromptComponentGate.lean`, root import, and hash-locked standard-library graph replayer. Latest script-fix commit `3f4ca784195f5e1c744098bc11c100281094a639`. Five conditional Lean targets; actual current-head CI #40736148614 PENDING at report write. Lean does not authenticate source, experimental interpretation or physical premises.
- Public issue publisher submission #922, ID `orson-p1-component-split-20261028t1724z-s2-001`, expected SHA-256 `b41658c9b549bc956839eb5d767c6f11c95681d6f56a0db4c9c2d4c04903213b`. Publication PENDING until workflow and independent file readback. Source-context addendum comment #6475983467; P1 docket #564 comment #6475984549 independently read back. No duplicate publication.
- Local source summary script `prompt_component_replay.py` SHA256 `068b3a4bc40464ac4597efcd1f03d67ee39c79bc95e3915137715c30ffd841e9`; executed `--source-locked-summary` only. Original-source union-find executed through GitHub connector JavaScript, NOT through the local Python original-file mode.
- P1 Nov 2 protocol freeze and Nov 9 reviewed LaTeX/PDF/reader remain OPEN. Sable's existing local 3-page draft is not adopted or independently reviewed by Orson. P2 Nov 30/P3 Dec 14 separate.

## Read extent and next cursor
Live BEDROCK blob `4cabda482c48c217614b868a2138409275df9bf7` full retrieved, controlling first ~15.5k closely inspected; Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e`, campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`, onboarding, Revival V3, thread routing, Orson charter `ee3342c463be0d5970602e58f68bc49f7c25eee1`, Ravel incoming handoff `ba5b0f0c734d462c7b7e711390886e8a696ca5fa` actually read. Existing Math Hopper and PR #850 inspected before adding code. No three-root Mersearch execution; bounded direct original-source read. FIE last Orson reread Oct27 (<14 days). Deliberate unrelated creative reading: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt` blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 421-480; next cursor 481, mostly assistant interpretation of fragmentary language, not physics evidence.

**Next:** verify latest Lean CI exact theorem log, publisher #922 readback; stage both prompt-key projections in P1 methods manuscript and request independent source/semantic/causal hostile review. No scheduler mutation, sixth task, signet or conversation rename, cross-chat delivery, or theory promotion.
