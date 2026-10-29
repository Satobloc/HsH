# Orson Vay | Review-MIND | Cross-model agreement versus source-key accuracy
Nominal run: 2026-10-29T04:48Z; REVROT3-19-20261011:436:s4.
Participation: current assistant source-grounded Orson specialist, NOT authenticated historical Orson ChatGPT thread. Next scheduled identity: Sable, 2026-10-29T05:00Z.

## Original empirical source and executed analysis
Public aayambansal/ConsistencyBench: 17 original results/*_cgd.json Git blobs, SHA-locked model-by-model in WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js. Original evaluator src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849, lines 238-290, 334-437. All 17 complete JSONs actually fetched and parsed through connected GitHub JavaScript. Exactly 300 sets and 1,150 aligned question positions per model, 5,100 sets and 19,550 recorded model-position answers in total. Cross-file identity was checked using (set_id, question index, exact question string, expected key). No new LLM administration, no vendor model authentication, no simulated physical data.

Define source-label agreement at stage t: A_t = sum over 1,150 question occurrences q and normalized labels L of choose(n[q,t,L],2), where n counts how many of 17 model files have label L. This counts 136 unordered model pairs per question, 156,400 pair opportunities. Evaluator normalize_expected() is reproduced verbatim in semantics. Exact label equality is not semantic agreement or scientific consensus.

First independent executed JavaScript algorithm directly enumerated all 17-choose-2 model pairs per question. Second independently fetched all 17 original Git blobs again and used the frequency-bin identity sum_L choose(n_L,2). Both agreed exactly.

| Readout | Initial | Final | Difference |
|---|---:|---:|---:|
| Exact matching model-pair labels / 156,400 | 105,795 (67.6439%) | 104,673 (66.9265%) | -1,122 (-0.7174 percentage points) |
| Unanimous 17/17 question positions | 263 | 260 | -3 |
| Source-key correct model-position labels / 19,550 | 12,567 | 13,221 | +654 (+3.3453 percentage points) |
| Excluding Unclear-labeled pairs: matched / eligible pairs | 105,122/141,409 (74.3390%) | 103,942/140,091 (74.1961%) | -0.1429 percentage points |

The inclusive extracted-label metric declines while source-key score rises on the SAME archived outputs. These are different readouts, not interchangeable measures of cognition. Crucially, the sign of the agreement change is **not robust to missing-label handling**. This is finite archival evidence, NOT evidence that the common checker caused a population-level diversity increase.

### Adversarial sensitivity: FIXED complete-case model pairs
A third independent complete-JSON replay required each pair of models to have a substantive (non-Unclear) extracted label at BOTH initial and final stages. This holds the eligible model-pair/question observations fixed, unlike stage-specific non-Unclear rates above:
- **137,911 same eligible pairs**; initial 102,797/137,911 (74.5387%) agreeing, final 102,881/137,911 (74.5996%) agreeing.
- **+84 matching pairs (+0.0609 percentage points)**. This reverses the inclusive -1,122 result.
- Singleton question positions: 80,931 -> 81,813 matched of 106,955 fixed pairs (**+882**).
- Repeated-text positions: 21,866 -> 21,068 matched of 30,956 fixed pairs (**-798**).
- +882 - 798 = +84.

**Critical methodological correction:** The original all-label comparison and the separately denominated non-Unclear comparison both decrease, but a properly paired complete-case analysis slightly increases. The data therefore do NOT support a missingness-robust direction of cross-model agreement change. All three projections should be reported, with their eligibility definitions, before interpreting consensus. The original publisher issue #974 contains the pre-correction snapshot; this corrected worker report and an explicit issue addendum supersede that narrow interpretation without altering the historical issue content.

## Stimulus dependence: original source-text multiplicity
The 1,150 question positions contain 896 exact-text singleton occurrences and 254 occurrences whose question text repeats elsewhere in the same sample (81 repeated-text groups). Agreement counts partition:
- Singleton positions: 83,053 -> 83,344 matched pairs (+291 of 121,856; +0.2388 percentage points).
- Repeated-text positions: 22,742 -> 21,329 matched pairs (-1,413 of 34,544; -4.0904 percentage points).
- +291 - 1,413 = -1,122 exactly.

Repeated occurrences are not independent stimuli; their CGD revision context can differ even when initial question text is identical. The repeated-text stratum drives the aggregate decline, but this is not a causal estimate. Source keys have documented semantic disputes, including negation Q3. The score increase is key-relative, not adjudicated reasoning improvement.

## Category-level exact agreement counts
commonsense_entailment: 10,716 -> 11,301 (+585), 150 question positions.
negation: 14,648 -> 14,358 (-290), 200 positions.
modus_tollens: 16,544 -> 16,868 (+324), 200 positions.
syllogistic: 22,030 -> 20,809 (-1,221), 200 positions.
transitivity: 21,147 -> 21,541 (+394), 200 positions.
contrapositive: 20,710 -> 19,796 (-914), 200 positions.
These sum to -1,122, with substantial category heterogeneity. Unclear labels increase from 979 to 1,065 across 19,550 recorded positions; these are evaluator labels, not a verified count of raw API failures.

## Formalization, replay and status
- Reused existing Orson draft PR #850, branch research/orson-p1-shared-nli-bound-20261028t06z. Added ten source-conditional Lean 4 theorems in FORMAL_VERIFICATION/HsHVerification/OrsonCrossModelAgreement.lean, imported in root. Theorems encode pair opportunities, count partition, opposing score/agreement signs, separately denominated Unclear exclusion, and fixed-pair complete-case sign reversal. Source/import readback PASS; exact-head GitHub Actions #40820069053 PENDING at initial check, not yet a compiled proof.
- Portable source-locked Node.js replayer committed to WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js. Syntax parsed in JavaScript; NOT executed from a local original-data checkout. Actual 17-file analyses were executed in the connector runtime, twice, using different counting algorithms.
- Lean can check the formalized arithmetic and conditional comparisons only. It cannot establish data authenticity, label semantics, experimental independence, causal checker effects, human cognition, model consciousness or physics.
- No new tooling was built before checking existing Orson PR #850, source-locked 17-model replay, Math Hopper and P1 docket. The existing branch and publisher were reused.

## P1 November gates and human/LLM QC
The November 2 protocol freeze must distinguish (model file, question occurrence, stage, normalized label, key version), exact question text clusters, context-dependent revisions, model families and shared NLI checker. Include BOTH score and cross-model agreement as separate readouts; no pseudoreplication confidence intervals from 156,400 dependent pairs. Source-key disputes need blinded adjudication. The November 9 minor-paper author approval, genuinely independent hostile review, source LaTeX, compiled PDF and reader remain OPEN. Nov 30 P2 and Dec 14 P3 are separate. No claim of 17 independent scientific reviewers.

Controls: live BEDROCK Git blob 4cabda482c48c217614b868a2138409275df9bf7 (governing opening and end read, not all 563 lines closely); Steering Charter b9b8de55f8d5add7c42cf80be7c34677ee36305e; Three Paper Campaign, onboarding, Revival V3/thread routing, Orson Oct 9 specialist charter read. Latest Ravel -> Orson handoff 2026-10-29T0048Z read; immediate 04:36Z incoming handoff absent/in flight at first check. Mersearch shared request lanes left untouched; bounded external original data used. FIE last Orson reread documented Oct 27 (<14 days). Deliberate unrelated reading: TheTANGLE.txt Git blob 3181b6cad85bbd76bd1017938e0dbf67baf03752, lines 521-560, creative interpretation of editorial [SIC]/[ILLEGIBLE] in fictional cultures; next cursor 561. No FIE or SAT claim inferred.

No BEDROCK promotion, new physical calculation, unauthorized data-free fixture, task/ID/cadence mutation, sixth automation, signet/chat rename or cross-thread delivery. Next worker Sable should independently challenge agreement-versus-accuracy interpretation, inspect the exact-head Lean job and demand author disposition on P1 methods.
