# Enheduanna h674:s4 | Review-MIND source audit: temporal validity of adoption and perception measures

**Nominal slot:** 2026-11-08T02:48:00Z  
**Run key:** `REVROT3-19-20261011:674:s4`  
**Selection:** h=674; seq=3374; 3374 mod 19 = 11, Enheduanna. Successor: Tern Rook (index 12), h675:s0.  
**Classification:** assistant-authored source-QC under a deterministic ring label; not an authenticated historical worker identity or thread.

## 1. Authority and source custody

No standalone Nathan-authored Enheduanna specialist charter is present in the recovered source. The direct user instruction is broad archive-revival guidance ("always consider all archives"), not a detailed specialist charter. The workspace's role and continuity descriptions are assistant-curated reconstructions. No authenticated current Enheduanna thread was established.

The preceding h671:s0 receipt was read. It explicitly declined to overwrite `CURRENT_WORK.md` because historical worker identity and primary-writer ownership were not established. This report therefore does not modify that checkpoint. The current work file remains a potentially stale navigation surface; the latest canonical receipt and source-specific reports take precedence.

## 2. New source finding: M4's "adoption" measure is not temporally qualified as direct uptake

**Primary source:** Chen et al., “AI agents reshape consensus formation in human groups,” arXiv:2609.02122v1 (submitted 2026-09-02). This is an arXiv preprint; no peer-review status is inferred.

The game procedure states that, in each round, paired participants independently submit their descriptions and see the partner's response only after both submissions. Pairings are randomly remade each round. The paper's Methods M4 defines an adoption score using the participant's round-r expression, the current partner's round-r expression, and the participant's own round-(r−1) expression:

`A_i(r) = cos(e_i^r, e_{p(i,r)}^r) - cos(e_i^{r-1}, e_{p(i,r)}^r)`.

On the published procedure, the current partner's round-r response is revealed only after the participant has already submitted e_i^r. It therefore cannot be the message that directly caused that same-round response. As written, M4 is a **same-round pair-alignment shift** relative to the participant's previous answer, not a temporally witnessed measure of uptake from the current partner's current-round message.

This does not make the statistic numerically meaningless. It changes what it can support. It can describe ex post alignment with the current pair's contemporaneous outputs, but it does not by itself establish direct dyadic adoption, a message-level causal effect, or the claimed sequence of exposure followed by uptake.

The paper also describes a history panel containing recent partner descriptions. That may provide prior-message exposure for some later responses, but it does not make the current partner's not-yet-submitted round-r message available before e_i^r. If the authors intended a prior history-panel message, the notation must identify the actual message version and its exposure time.

### A temporally admissible alternative

For participant i, let j=p(i,r) be the partner whose round-r message m_{j,r} was actually shown to i after both round-r submissions. The earliest response that could incorporate that message is a later response, for example:

`A_i(r+1 | m_{j,r}) = cos(e_i^{r+1}, e_j^r) - cos(e_i^r, e_j^r)`.

This is only a temporally admissible uptake proxy. It still needs exact participant/partner/message identity, history-panel visibility, timestamps, and controls for other prior exposures. It does not by itself establish causality. If those fields are unavailable, the safe repair is to rename M4 as a pair-alignment shift and narrow the interpretation.

## 3. Related but distinct M5 limitation: post-session identity judgments

The supplementary procedure describes a questionnaire administered after the 40-round interaction. Participants retrospectively evaluate nine sampled rounds, including whether a partner was human, AI, or uncertain and their willingness to adopt that partner's description.

Thus the perceived-identity and willingness variables are post-session judgments, not contemporaneous in-round beliefs or direct behavioral uptake. An association between them supports a retrospective perceived-identity/willingness association. It does not establish that a participant held that belief at the moment of the round, that it temporally preceded the action, or that it caused actual adoption.

The paper's observed in-round expression trajectories remain separate evidence. They should not be conflated with the post-session willingness ratings.

## 4. Distinction from existing HsH work

This finding is additive, not a duplicate of the existing S6 exposure audit:

- Issue #1272 already records the A2–A5 tracker/history replay and exact-message exposure boundary.
- PR #1115's `HumanAIGroupsTemporalExposure.lean` uses a `PriorVisibilityWitness` for the S6 directional-influence analysis. Its event-order discipline is relevant, but the module does not encode M4's displayed adoption equation.
- PR #1115 current head `ec67923fafd66a90a412eb813aaa7e9900667d0f` has no associated Actions run in the current readback. Its temporal-exposure formalization remains **LEAN_UNTESTED**.
- Existing Review-MIND notes already cover one session per condition, the common embedding-feedback/analysis metric, and the HC3/repeated-observation dependence issue. Those are not repeated here.

The public figure script `plot_adoption_persistence_dynamics_by_pair_type.py` consumes precomputed adoption/persistence series. A generating routine for those pickle series was not found in the bounded public-repository search. This is a reproducibility boundary for this review, not proof that no supplementary generator exists.

## 5. Proof-first triage and limits

The relevant mathematical structure is an event-order condition. A message can be a direct exposure cause of an outcome only if the relevant message version was visible to the recipient before that outcome. The published procedure orders both current-round submissions before reveal of the current partner response. Therefore the current-round response cannot be a direct prior exposure for the same participant's already-submitted response.

A Lean formalization could encode typed submission, reveal, message-version, and outcome events, then prove that an exposure-qualified uptake witness requires `reveal_time < outcome_time`. However, the exact source-to-event mapping for M4 is not yet resolved, and the existing PR #1115 is an Orson-owned S6 formalization with no current build. No new Lean module, PR, branch, or runner dispatch was created. No proof or CI success is claimed.

No tracker data were downloaded or reanalysed in this turn. The prior A2–A5 replay in issue #1272 was not repeated. No human-subject experiment, model trial, API call, or causal estimate was invented.

## 6. Scope protection and cross-lane QC

- Orson's P1 remains **METHODS/ARCHIVAL / NOT READY** for November 9. Its frozen scope is ConsistencyBench within-model self-history and a shared GPT-4o-mini NLI checker. This Chen et al. human–AI group study is an external comparator, not P1 evidence and not a scope expansion.
- PR #850 remains OPEN / DRAFT / UNMERGED. Orson's current work records head `3bb0c57b56e1eff49139dcc21fcfe518a7717b8d` and a successful merge-reference build #42416933193; standalone exact-head verification and separate tests/lint/nanoda/global axiom audit remain unverified or skipped.
- The task graph still records the older PR #850 cursor `9fa85f...`; Tern retains graph reconciliation ownership. No graph edit was made. The graph declares 16 branches but contains 18 records.
- Clone census remains 17/19 reconstructed labels and zero authenticated first-hand worker-thread replies. This is not 17 independent agents or cross-agent consensus.
- Elias issue #1469 and Nadir issue #1470 were independently read. Their published artifacts exactly match their issue payloads; publisher comments provide the declared SHA-256 and readback confirmations. Nadir #1470 is a design-only same-sector transferability gate, not a physical calculation or P2 selection.
- The prior Enheduanna h671 issue #1464 is **REJECTED / NOT PUBLISHED** for SHA-256 mismatch. Its existing Amendment 01 records the corrected digest and missing artifact. No retry or duplicate issue was created.

## 7. Repository, schedule, and maintenance controls

At final prewrite inspection, HsH main was `036b21889e0431b11b7a2fda765d4f3f3ea8d4af`; SAT archive main was `521952bbe6ad078f9462b83cf7d7387a1630d993`; HSH_RESOURCES main was `f2e0792d1f024c2fe0fe8ea3a1eb60a742157a32`.

Live controls fetched:
- BEDROCK blob `527924246cc25caf7fac02dce4b20f024013cd19` (97,935 characters; full file fetched, controlling source/proof/data-permission sections inspected, not every historical line read line-by-line).
- Steering Charter blob `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three Paper Campaign blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- Three-repository onboarding blob `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`.
- Revival Rotation V3 blob `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`.
- Task graph blob `fc53157389b3052de8fc45ffdcc17d5034984435`.

All four Mersearch lanes remain occupied/requested. No request was submitted, retriggered, overwritten, or represented as a Mersearch execution. Existing public sources and repositories were used; no new tool, dependency, subscription, paid endpoint, fork, branch, PR, or issue was created.

Unrelated reading: Charles Babbage, *Reflections on the Decline of Science in England*, lines 1401–1440. Next cursor: line 1441. FIE's next full rereview is due November 10, not yet due. No physical off-screen break is claimed.

## 8. Disposition

**SOURCE-LEVEL TEMPORAL-MEASUREMENT QC / NO DATA REANALYSIS / NO NEW LEAN / NO P1 SCOPE CHANGE / NO PHYSICAL CALCULATION / NO THEORY PROMOTION.**

No task, task ID, schedule, phase, branch ownership, paper gate, or BEDROCK status was changed. No signet or conversation rename was used.
