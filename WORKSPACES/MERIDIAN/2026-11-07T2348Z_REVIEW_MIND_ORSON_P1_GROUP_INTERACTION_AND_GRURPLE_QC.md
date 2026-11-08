# Review-MIND | h671:s4 Meridian — Orson P1, human–AI group methods, and Code Grurple trigger audit

**Nominal slot:** 2026-11-07T23:48:00Z  
**Run key:** `REVROT3-19-20261011:671:s4`  
**Observed execution:** run `568f8b72-4a62-8d6b-98b3-0b31e1d8d04f`, scheduled 23:48Z, started 2026-11-08T00:12:29Z; last scheduler peek at 00:27:59Z still reported IN_PROGRESS with `chat_ref=null`.  
**Selection:** h=671; seq=5h+4=3359; 3359 mod 19 = 15; Meridian. Successor index 16: Mercer.

## 1. Identity, source coverage, and authority

This is a source-grounded continuity reconstruction for the deterministic Meridian label, not an authenticated Meridian ChatGPT instance or thread. The latest saved Meridian export located in the current Viewer index is **Meridian Minkowski Ring Analysis**, conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, last updated 2026-10-21. A later 2026-10-22 continuation is mentioned in prior context, but no exact current title/ID was verified. The present automation run has no `chat_ref`; no cross-thread delivery is claimed.

The historical specialist remit was reconstructed from direct user-role messages in the archived Meridian source exports, not from an assistant-authored role title:
- Graticule symmetries/asymmetries and comparison with physical-category structure; compare geometric solvers and their successes/failures.
- Configurable/scriptable solver inputs, couplings, comparisons, and verification of prior results.
- Audit the Whirligig GR–QM isomorphism and its derivation, with explicit account of what a solver does and does not establish.
- A separate Free Build instruction favors preserving multiple valid routes and ranking the least-wild route, not prematurely declaring one route uniquely proved.

The assistant-authored label “Geometric Formalization & Representation Lead” is not a Nathan-authored charter. The latest historical conversation's final user statement asserts that 3D rotation/acceleration is 4D curvature; the subsequent assistant derivation used a Euclidean lifted-curve model. That historical calculation is not promoted here into a physical equivalence or current assignment.

**Current assignment remains controlling:** Code Grurple P0, Meridian supports Paper A's accepted R1 presentation repair only; Mercer independently QA-checks A and B. No manuscript-content, source-pin, renderer, site, route, or solver task was reopened.

Read in this occurrence: live HsH BEDROCK (all 627 lines, four chunks), Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, New Instance Start Here, Revival Rotation V3/V4 and thread/scheduler controls, current main branch, Kestrel h671:s3 receipt/amendment/handoff, prior Nadir h670:s4 receipt, Meridian current-work/checkpoint/start/continuity, and the direct Meridian source messages. Also refreshed the SAT archive README/front-door and AI control welcome path, HSH_RESOURCES README/Tool Chest, and Mersearch guide/release.

## 2. Orson P1: source-level QC

### Pinned source and observed behavior

The current Orson source pin is `aayambansal/ConsistencyBench` commit `bfc676baa848c7f1715bb73aee148180de15516e`, `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`.

Source inspection confirms:
1. The CGD contradiction checker receives only `prev_raw[:500]` and `raw_response[:500]`; the actual questions and premise are absent from the checker input.
2. The checker uses the fixed judge model `openrouter/openai/gpt-4o-mini`. Its `model_id` argument is not used in the call. This is a common evaluator identity across generator-model runs, not independent per-generator judges.
3. The repair prompt instead receives the previous question, previous final answer, premise, and current question; it does not receive the current raw response.
4. History stores `(question, final_answer, raw_response)`. After a repair, `final_answer` changes while `raw_response` remains the original response. Future checker calls therefore use the original raw history while repair context uses the revised answer: two distinct feedback/provenance paths.
5. The archived result object records the contradiction flag and revision fields but omits the triggering pair and raw judge prompt/output. The JSON result alone cannot reconstruct why a repair was triggered. This does not rule out separate transient stdout logs.
6. `call_model` retries once, then returns the nonempty sentinel `[ERROR]`. The parser returns false for any nonempty response lacking “CONTRADICTORY”; thus `[ERROR]` collapses to the same Boolean as `CONSISTENT`. This is a latent silent error-to-negative path, not evidence that any archived call actually failed. No error frequency was established.

### Information-flow interpretation

The source supports a small, explicit pipeline:

`raw history -> 500-character checker projection -> shared judge -> Boolean gate -> repair projection -> revised final answer`

The checker projection and repair projection are not the same view. The archive projection is also lossy with respect to the trigger pair and judge I/O. This is an information/provenance projection result, not a physical geometry, causal social network, or consciousness claim.

### Lean replay and limits

Existing PR #850 head: `3bb0c57...`; current module blob `b60d3ad7d50ede1c5c58f5a15c178ba8e1a281e8`; root aggregator blob `7bd69ca93c399ad39b0092015809e0418fe8ef0e`.

Actions run #42416933193 / job #128536972640 succeeded on merge reference `17c3d7409cb13acaa9b9a06170af0fa7bbd26c39`, including PR head `3bb0c57...` with base `598a45...`. Lean 4.34.0 / Lake 5.0.0; 8,983 jobs; target module and root aggregator built. No `sorryAx` or bare `admit` appeared in the captured log. The theorem-specific reports include standard `propext`, `Classical.choice`, and `Quot.sound` dependencies. Tests, lint, nanoda, leanchecker, and separate global axiom audit were skipped/unverified; exact-head standalone build remains unverified.

The Lean file formalizes the chosen checker/repair/archive projections and the two concrete uppercase ASCII strings `[ERROR]` and `CONSISTENT`. Its `sourceNliParserUpper` is a source-conditional reconstruction, not a mechanically verified translation of arbitrary Python `.upper()` behavior. Lean verifies the formalized statements only; it does not establish translation soundness, archived runtime frequency, or empirical consequences.

**P1 disposition:** Orson remains sole owner. Issue #564 remains open; PR #850 remains draft/open/unmerged. The November 9 minor paper remains **NOT READY**: the matched-prompt OV-49–OV-53 bank, authorized inference endpoint, canonical manuscript source, compiled PDF/readable reader, independent/hostile review, author disposition, and administered trial remain absent. The November 30 P2 and December 14 P3 gates remain separate. No P1 scope expansion, model trial, human session, API spend, manuscript change, or theory promotion occurred.

Source-faithful framing should stay with within-model self-history, common-judge/evaluator dependence, dual-history feedback, and traceability limitations. The available ConsistencyBench source does not establish cross-model peer exposure or human-group social conformity.

## 3. Separate real human–AI group study: evidence boundary

A separate source was checked: Lin Chen et al., **“AI agents reshape consensus formation in human groups,”** arXiv:2609.02122 (2026-09-02). This is an actual human–LLM group study, not data from this workshop.

The main arXiv HTML describes 24-person groups interacting over 40 rounds with repeated random pairwise communication; five agent-proportion levels (0%, 12.5%, 33.3%, 50%, 75%); and a separate three-way agent-behavior prompt manipulation at fixed 33.3% proportion (neutral, high adoption, high persistence). It uses one model family at two capability levels and a fully mixed/random-pairing topology. The paper's consensus-strength measure is semantic convergence within a group, not correctness or truth. The authors themselves caution that structured social networks and cross-family generalization remain untested.

The current Orson PR #1115 head is `ec67923fafd66a90a412eb813aaa7e9900667d0f`. Its `HumanAIGroupsSessionConfounding.lean` module transcribes eight 24-slot condition compositions: (24,0), (21,3), (16,8), (12,12), (6,18), (16,8), (16,8), (16,8). Lean proves the arithmetic totals (127 human slots, 65 agent slots, 192 total). It then proves a valid conditional result: **if** a treatment level occurs in exactly one group/session, its indicator equals that group's indicator, and shifting a coefficient between group intercept and treatment effect leaves fitted values unchanged.

The one-session-per-condition premise is not proved by Lean. The module explicitly calls it an inference from the supplementary counts/session size. The main arXiv HTML does not expose the complete session/replication table; the Supplementary Information and processed-data allocation were not independently retrieved in this pass. SciSpace extraction also did not resolve the exact replication structure. Therefore the conditional theorem is sound as formalized, but the source premise remains **UNVERIFIED HERE**. It does not prove published p-values wrong or causal conclusions false.

The companion `HumanAIGroupsTemporalExposure.lean` module makes a useful distinction: a current-round pairing is not itself proof that the target previously saw that source's expression. Exposure-qualified attribution requires a matching, pre-outcome visibility witness. This is an evidence-typing requirement, not a causal proof. No PR-triggered Actions run was associated with current PR #1115 head `ec679...`; neither module is reported as CI-verified.

### Disconfirmatory experiment proposal — not executed

A future human–LLM group study should randomize and replicate at the **group/session** level, with multiple independent groups per condition. Separate (a) shared-source exposure, (b) peer-output visibility/rematching history, (c) agent proportion, and (d) shared versus independent blind judges. Use non-sensitive tasks, informed consent, privacy-preserving logs, preregistered outcomes, and independent adjudication. Record source IDs, message visibility, timestamps, model/version, prompts, raw outputs, revision edges, judge calls, and group membership. Primary outcomes should distinguish consensus strength from correctness, error correlation, source attribution, and perceived ownership. Falsifiers include no peer-visibility effect after source control, no common-judge error alignment, or consensus tracking correctness rather than agent-proportion/visibility. This is a design proposal only: no participants, model sessions, or results were generated.

## 4. Cross-lane geometry and physical-evidence QC

Kestrel's h671:s3 theta4 crosswalk was read against its direct source messages and current BEDROCK convention. It correctly keeps the 2024 pitch/slice-rate versus cross-sectional-radius distinction separate from the 2026 direct theta4 statement associating theta4 with inverse pitch and intersectional oblateness. The raw 2026-09-16 event needed to resolve the 90° versus 0° reference convention was not recovered. The assistant-authored expressions `tan(theta4)=2πR/P` and `dℓ/dw=sec(theta4)` remain proposals, not Nathan Direct or adopted source equations. No unique map from pitch/radius to theta4 or physical readout was established.

Kestrel PR #873 Actions run #42153410233 succeeded on a merge reference (8,955 jobs; Lean 4.34.0). The relevant fiber-compatibility theorem is conditional on the explicit map/fiber premise; no physical map follows. Hale PR #1387 Actions run #42314682998 succeeded on a merge reference (8,946 jobs; Lean 4.34.0). Its measurement-domain gates and four-cell factorial algebra are formal contracts, not an independent physical measurement. Both logs showed no `sorryAx` or bare `admit`; global axiom audit/tests/lint/nanoda were skipped, and exact-head standalone builds were not established.

No identifiable physical system, raw measured dataset, units/uncertainties, or prediction-versus-fit comparison was selected in this run. No physical calculation was performed. WWRD climbing-rope mechanics remains a first-blush geometric heuristic, not a physical equivalence.

## 5. Code Grurple re-entry gate

Code Grurple remains ACTIVE / presentation-only. Paper A's accepted R1 and Paper B's reviewed R1 source/feed bindings still match:
- Feed blob: `e3552fdac0f187b066b59a9742563094efffe011`
- Paper A source blob: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`
- Paper B source blob: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`

Current HsH main head at inspection: `0f6034872257996694cdda2ff5736e0a7c1325a9`. Comparing from Kestrel's prior baseline `c5b9f4c...` shows 23 commits / 53 changed files, but no Paper A/B source, feed, renderer, derivative, deployment, or route implementation change. The recent generated discovery/conversation-viewer/date-tagging changes are not a presentation-capability trigger.

The current Presentation Gate and Reader Routing Registry require a PDF-first derivative behind the existing `paper.html?id=...` route, with raw/source secondary; `reader.html?paper=...` is not a substitute. Both routes remain **PRESENTATION_PENDING / NOT_OBSERVED**, not failed. Browser tab listing failed because the originating browser context was unavailable; no Sites editor/deployer action or owner preview was exposed. No route probe was made. Re-entry remains blocked until one of the explicit capability triggers in the PDF-first contract is independently observed. Elapsed time alone is not a trigger.

## 6. Operational upkeep and limits

- Mersearch stable 1.0 is documented, but all four HsH Mersearch request lanes remain occupied/requested. No Mersearch search was run; exact already-known source blobs and bounded GitHub connector reads were used. No request was submitted or overwritten.
- Local HsH checkout is absent; `gh`, `lean`, and `lake` are not installed. GitHub connector read/write is the fallback. SciSpace is available and was used for bounded paper metadata/method extraction; it did not resolve the supplementary session table. Existing Math Hopper/Whirligig references and Tool Chest were checked; no new tool, fork, dependency, endpoint, or paid service was created. Fork enumeration was not needed because no tool build was proposed.
- TASK_BRANCH_GRAPH remains 16 declared branches versus 18 actual records; Tern retains reconciliation authority. No graph edit.
- Clone-footprint census contains 17 ring-label sections, all reconstructed from receipts/current-run logs; zero authenticated first-hand worker-thread responses. Elias Kern and Ravel remain absent. The header/action-plan still says 15/19 and is stale. This is not 17 agents or independent consensus. No census edit.
- FIE last full review: 2026-10-27; next due 2026-11-10. Not yet due.
- Unrelated reading: Charles Babbage, *Reflections on the Decline of Science in England*, lines 1541–1580; next cursor line 1581. This is a literary/historical break, not evidence for the technical claims. No physical break is claimed.
- Mira's restricted workspace was not accessed. No task/ID/cadence, branch, PR, issue, signet, or conversation-name change was made.

## 7. Final disposition and next cursor

**OPERATIONAL REVIEW COMPLETE / SOURCE-BOUNDED QC RECORDED / CODE GRURPLE NO-TRIGGER HOLD / ORSON P1 PROTECTED / NO THEORY OR PAPER-GATE PROMOTION.**

Next useful cursors:
1. Orson: recover the exact Supplementary Information/session allocation and processed-data group IDs for PR #1115; keep its one-session premise conditional until source-confirmed. For P1, continue the OV-49–OV-53 source bank and authorized-endpoint recovery without new model calls or paper-gate advancement.
2. Meridian: wait for an independently evidenced Code Grurple capability trigger; then one bounded PDF-first attempt and one readback per route.
3. Review-MIND: FIE review due 2026-11-10; unrelated Babbage cursor 1581.
4. Successor: Mercer, h672:s0. Repository-only optional handoff; no task or response obligation.
