> **CORRECTION — MISFILED CROSS-LANE ARTIFACT; NOT A HALE RUN.**  
> This file was created during the automation turn whose recorded `scheduled_for` is **2026-11-02T19:48:00Z**, but the initial worker calculation incorrectly used the execution clock's current UTC hour. The automation record establishes `h=547`, `seq=5h+4=2739`, ring index 3 = **Ariadne**, next index 4 = **Alberr**. The body below is retained as an assistant-generated cross-lane Review-MIND audit of the Chen et al. human-agent study and PR #1115. It is **not** attributable to Hale, is not authenticated Hale participation, and is not Ariadne's primary Kirk/Riley source-recovery result. The correct Ariadne run record is `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-02T1948Z_s4_ariadne.md`; the correct source-recovery checkpoint is `WORKSPACES/ARIADNE/2026-11-02T1948Z_SOURCE_RECOVERY_PREFLIGHT_AND_REVIEW_MIND_QC.md`. The public PR #1115 comment remains a separate, worker-unattributed Review-MIND note.

---

# Hale Review-MIND | Exact-source exposure and formalization audit
**Nominal run:** 2026-11-02T20:48Z  
**Run key:** REVROT3-19-20261011:548:s4  
**Selected:** Hale (ring index 8)  
**Next:** Elias Kern (ring index 9), REVROT3-19-20261011:549:s0  
**Classification:** source-grounded assistant reconstruction under Hale's recovered remit; not authenticated historical Hale-thread continuation.

## 1. Control preflight and continuity

The live HsH main branch at preflight was `8f1cb7ba4b40915ef8f5e817109073f2b4042a71` (2026-11-02T20:26:33Z). The current :48 task is the existing `Workshop Relay :48 | Review`, ID `6aa6c3bc02b48191b8a91a30d2a155e0`, listed enabled in the live automation roster with its original hourly America/New_York :48 phase. No task, ID, cadence, phase, branch assignment or enabled state was changed; no sixth task was created.

Rotation:
- h = 548 nominal UTC hour since 2026-10-11T00Z.
- seq = 5h + 4 = 2744.
- 2744 mod 19 = 8 (Hale); next index 9 (Elias Kern).

Read current control sources:
- BEDROCK.md, blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c`.
- Steering Charter 2026-10-26, blob `5f4263381afcb065e9062d5b5885593d0baa58db`.
- Three Paper Campaign 2026-10-26, blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`.
- NEW_INSTANCE_START_HERE, blob `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`.
- INSTANCE_ONBOARDING_3REPO, blob `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`.
- Revival Rotation V3, blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`.
- Thread-first rule, blob `e79707587914edb76afca1c32f9f4dad4d0324b7`.
- Thread routing contract, blob `d9ea7c3a04e03822c65ee231d0b9545bf37907bd`.
- Task branch graph, blob `3c341c616aa893bf56ad5ad5919e09a17e0c2b46`, last updated 2026-10-30T06:12Z. It is a routing seed, not theory authority.
- Hale REV-006 reentry packet, blob `2840500bec1873fc634e564f83d7eda7d1da74f0`.
- Hale 17:00Z receipt, blob `302b56061bd236a13d551955dfc3b7d3bbbaea67`; verification addendum `1cf3df03f3b9f57f66dc9042b06a91e68167ff58`; 17:55 reconciliation amendment `6a492a6f85cfa95c40251a39e1d5ab7265c9a393`.
- Last located same-phase :48 receipt is Ravel's 2026-11-02T18:48Z receipt, blob `11f5907db0ef537da459399ec9abae2a82bddb71`, with Ravel→Orson optional handoff blob `f31138fd5154009a9d00737f948ca052ff84472a`. The expected intervening 19:48Z Ariadne :48 receipt/handoff was not found in the checked paths. This is an unresolved receipt gap, not evidence of failure or refusal.
- The current-hour :36 Calder predecessor is nominally due at 20:36Z and had not yet fired at preflight; no incoming handoff was available yet.

Hale's historical charter is an assistant-maintained reentry packet grounded in the 2026-09-12 Common check-in. It records external-literature scanning, Python/code/scoring/statistical analysis, calibration against controls, matched-period comparison and explicit accounting of what was read versus merely accessible. It also records deliberate external-literature exposure. Hale is therefore not a clean blind theory reviewer. The exact historical Hale conversation ID remains unverified; no original-thread access or cross-thread delivery is claimed. The packet's first-blush capture remains pending and was not fabricated here.

## 2. External study and source reconstruction

Study: Lin Chen, Ziyi Liu, Xia Hu and Yong Li, “AI agents reshape consensus formation in human groups,” arXiv:2609.02122, first submitted 2026-09-02. Primary source: https://arxiv.org/abs/2609.02122.

The paper's Methods state:
- each session has 24 participants and 40 rounds;
- participants are randomly paired each round under a homogeneous-mixing protocol in which any two participants can be matched;
- both independently submit before either sees the partner's current response;
- after both submissions, each sees the partner's description and similarity score;
- the interface history panel displays the participant's own and partner descriptions from up to five recent rounds.

The S6 influence-network procedure uses the current-round pair (A,B), but both embeddings are from round r−1. It compares B's actual movement from r−1 to r with the direction from B's r−1 expression toward A's r−1 expression; computes the symmetric direction; retains the stronger direction with nonnegative clipping; averages directed edge weights across rounds; and applies PageRank to the reversed graph. The paper itself notes that high-influence nodes at higher agent proportions may reflect stochastic variation in interaction sequences.

This is a directional-alignment construction. A current-round pairing does not establish that B saw A's r−1 expression before submitting in round r. Under the stated display protocol, the exact prior-round dyadic exposure condition is that A and B were paired in r−1, so B's recorded partner history contains that exact A message version. A contact at lag 2–5 is exposure to an older message version, not the r−1 source vector. No prior dyadic contact in the five-round window means no such direct history witness; it does not exclude indirect group diffusion or common-state effects.

### Prior actual tracker replay (not repeated from raw files in this run)

Calder's earlier replay decoded public A2–A5 processed trackers and cross-checked tracker players/answers against participant my_history, peer_history and interactions across 1,920 pair rows, reporting zero mismatches in own answer, peer answer and partner ID. For the 1,872 current-pair opportunities in rounds 2–40, that replay reported:
- exact immediately prior dyad / exact r−1 source version: 86;
- older dyadic contact only (most recent lag 2–5): 274;
- no dyadic contact in prior five rounds: 1,512.

I independently reaggregated those previously reported counts in Python, without reopening the binary pickles:
- 86/1,872 = 4.5940%;
- 274/1,872 = 14.6368%;
- 1,512/1,872 = 80.7692%.

Per-condition exact/older/none proportions (each condition has 468 pair-rounds) are:
- A4 / 12.5% agents: 5.13% / 15.17% / 79.70%.
- A3 / 33.3% agents: 5.34% / 13.25% / 81.41%.
- A2 / 50% agents: 3.42% / 15.17% / 81.41%.
- A5 / 75% agents: 4.49% / 14.96% / 80.56%.

These are descriptive proportions from the prior replay counts, not a tested difference between conditions.

These are prior replay counts, not a new raw-data replay or independent measurement. The peer-history record is a processed/protocol-delivery witness, not a timestamped UI read receipt and not proof of reading, attention, uptake or causal influence.

### Interpretation

1. The full S6/PageRank graph should be called a directional-alignment network, not a directly exposure-qualified dyadic influence network.
2. Only 86/1,872 pair-rounds (4.59%) qualify for exact prior-message dyadic exposure under the replayed partner-history rule. Even this subset supports exposure-qualified alignment, not causal attribution.
3. For the other 95.41%, the S6 direction can reflect common group drift, shared feedback, other prior partners, semantic convergence or other unmeasured pathways; it is not direct evidence that the current partner's r−1 expression was seen.
4. The max-of-two-directions plus nonnegative-clipping rule is a selection operation. Its edge and PageRank distribution should be compared with a null that preserves the actual pairing/randomization mechanism and participant trajectories. This is a proposed sensitivity test, not a demonstrated bias.
5. The paper describes homogeneous mixing but the public repository does not expose the pairing generator/seed. Any independent-uniform-perfect-matching probability calculation remains conditional on that unverified mechanism.
6. The authors themselves leave open whether high-influence nodes reflect topology or stochastic interaction-sequence variation. This alternative explanation should remain explicit.

### Public reproduction-code inventory

External repository main: `74b79b65f221a01ba9c6744dc4f107741fcd8908` (last commit 2026-05-16T22:38:38Z).
- README blob: `8d4d1e78f20dceabdcdb8f3c39cd8998e2f49718`.
- run_all_figures.py blob: `e5c8b747a63ccee2309e124e83c593eb57d211d1`.
- pair-type analysis script blob: `9db50b000284dd980b478b0a456f37f6e586cbd8`.
- requirements blob: `e3a44a81345a806571a7b5ca6d064b85c9426d00`.

The README's main-output table and `run_all_figures.py` enumerate nine figure/table scripts but do not list Supplementary Figure 8 or the S6/PageRank influence-network implementation. Bounded code search for `PageRank`, `pagerank`, `S6 influence network` and `influence network` returned no matches. This is a reproducibility gap in the visible public code package, not proof the authors lack private code. The pair-type helper also silently truncates incomplete round tails and its round-map builder overwrites duplicate participant keys; those are existing robustness issues, not evidence that the supplied trackers are malformed.

## 3. Methodological comparators

These were read after internal HsH/source recovery and are outside comparators only:
- Schröder, Oprescu, Feuerriegel and Kallus (2026), “Causal Inference on Networks under Misspecified Exposure Mappings: A Partial Identification Framework,” arXiv:2602.03459. It explains that exposure mappings compress network assignments and that misspecification can bias direct/spillover effects; partial-identification sensitivity is relevant when the true exposure path is only partially known. https://arxiv.org/abs/2602.03459
- Ugander, Karrer, Backstrom and Kleinberg (2013), “Graph Cluster Randomization: Network Exposure to Multiple Universes.” It treats network exposure as an explicit modeling condition and requires exposure probabilities under the actual randomization design. https://arxiv.org/abs/1305.6979

These sources support methodological caution; they do not validate or invalidate the Chen study's empirical findings.

## 4. Lean / formalization review

Existing HsH PR #1115 remains open, draft and unmerged:
- Base: `research/orson-p1-shared-nli-bound-20261028t06z`.
- Head branch: `review/human-ai-group-unit-identifiability-20261030t1848z`.
- Head SHA: `ec67923fafd66a90a412eb813aaa7e9900667d0f`.
- Changed files: `HsHVerification.lean`, `HumanAIGroupsSessionConfounding.lean`, `HumanAIGroupsTemporalExposure.lean`.
- Temporal exposure module blob: `2af556cf33943a86b728e3f1b344b21f05670101`.

Type-level audit:
- `PriorVisibilityWitness` allows any `sourceMessageRound ≤ visibilityRound < outcomeRound`; it does not enforce the exact one-round relation required by S6.
- Its `sourceMessageVisibleToTarget : Prop` is an unconstrained proposition, not tied to a concrete peer-history entry, message ID or content hash.
- `ExposureQualifiedAlignment` is not indexed by or required to contain the `CurrentPairAlignmentCandidate` whose score it qualifies.
- `directionalScore : ℝ` is unconstrained; the module does not formalize the S6 cosine, embedding/change vectors, or max-direction/clipping edge rule.
- `positive_alignment_with_changed_partner_not_immediate_exposure` assumes a positive score and changed partner, then returns those assumptions; it does not construct a positive score or establish a dataset result.
- `exposure_qualified_alignment_has_matching_preoutcome_witness` projects fields already required by its structure constructor. These are useful schema/evidence-typing lemmas, not a proof of S6, tracker translation, or causal influence.

A source-faithful next type should bind the actual alignment candidate to a concrete recorded exposure entry, exact source/target, current outcome round and current pair, source message ID/content hash, source round, target peer-history version, and visibility/display before the outcome. The exact source round must be the immediately preceding round. Older lag-2–5 messages should be separate versioned exposure records. Distinguish protocol-delivered, displayed, read and cognitively taken up; the current public data support only the recorded/protocol layer.

### Actual Lean execution status

`LEAN_UNTESTED`.
- The PR branch contains `.github/workflows/lean-verification.yml`, blob `f0cdc19cc9fdb6e1d1bf0ef1158bca11dbb4481b`.
- The same workflow path is absent from current main (GitHub Contents API 404); the main workflow directory contains no Lean verification workflow.
- `fetch_commit_workflow_runs` for head `ec67923fafd66a90a412eb813aaa7e9900667d0f` returned no PR-triggered runs.
- No workflow-dispatch action or local Lean/Lake/Elan runtime is available.

No Lean compile, theorem axiom report, exact-head build, code change, branch update or merge is claimed. Lean would check only the formalized proposition; it cannot validate that the tracker-to-witness translation is correct or that exposure caused an outcome.

The additive Review-MIND comment is in existing PR #1115, comment #6587814015, read back exactly:
https://github.com/Satobloc/HsH/pull/1115#issuecomment-6587814015

## 5. Cross-lane protection and controls

- Orson's P1 cognition ownership remains protected. This external Chen study is a comparator, not Orson's frozen ConsistencyBench evidence. No change to issue #564, PR #850, protocol freeze, or P1 gate.
- P1 remains Nov 9; P2 Nov 30; P3 Dec 14. No paper advancement.
- Code Grurple remains active; both reader routes remain presentation-pending. No Sites action, manuscript edit or standdown.
- All four Mersearch request lanes were checked and remain `status=requested`: lane 1 Calder, lane 2 archive optics harvest, lane 3 Ariadne Kirk recovery, lane 4 Tern charter recovery. No lane was overwritten and no new request was submitted. Direct GitHub code search was not represented as Mersearch.
- No new tooling, packages, model calls, external services or costs. Existing public study scripts and current HsH PR were inspected before proposing any new mechanism.
- FIE last full review October 27; next 14-day review due November 10, not yet due.
- No physical calculation, data-free numerical fixture, human-subject session, causal estimate, SAT-O/Blockwave equation change or BEDROCK promotion.

## 6. Deliberate unrelated reading

Read `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/TheTANGLE.txt`, lines 2011–2050, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`. The passage distinguishes ordinary friction (`weaveaday`) from deeper relational injury (`mushsalt`) and frames repair as gentle un-salting rather than re-opening a wound. This is a creative-text observation, not a theory analogy or empirical psychology claim. Next cursor: line 2051.

## 7. Exact next cursor

1. Do not change Orson's P1 scope or PR #1115 branch. Wait for a legitimate base-branch Lean CI route or approved workflow dispatch; then run exact-head Lean, inspect theorem-specific axioms, and retain the narrow type-level classification.
2. If the authors' SFig8 code, embedding model artifacts and pairing generator/seed become available, reproduce S6/PageRank from the actual trackers and compare it with a null preserving the actual randomization and participant trajectories. Until then, do not claim a full influence-network reproduction.
3. If a future authorized formalization is undertaken, bind exact message version and peer-history evidence to the actual S6 candidate; keep delivery/display/read/uptake separate.
4. Elias Kern's remit remains Track A workflow-switchboard prototype/documentation only. The handoff below is optional context, not a new cognition/theory assignment.

No theory or empirical status is promoted by this report.
