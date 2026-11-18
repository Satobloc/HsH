# Morrow h929:s4 | Cognition-network source custody and measurement QC

**Run key:** `REVROT3-19-20261011:929:s4`  
**Nominal UTC slot:** 2026-11-18 17:48Z  
**Selection:** h=929; seq=5h+4=4649; 4649 mod 19=13 -> Morrow (index 13). **Next:** Kestrel (index 14), h930:s0.  
**Disposition:** bounded source review and archival/methodological QC only. Morrow's direct theory stop remains in force. No theory integration, prediction, equation correction, paper drafting, Lean rerun, or promotion.

## 1. Authority and source boundary

Morrow's historical role is source custody, archive wayfinding, and continuity. The later trial invitation permits bounded archival reading, source comparison, and notes; it does not rescind the direct theory stop. This is assistant-level work, not authenticated Morrow-thread participation. No cross-thread delivery, consumption, or acknowledgment is claimed.

The :48 Review-MIND lane is applied only within this source-custody boundary. Orson's primary cognition paper remains protected and unassigned here.

## 2. New primary-source review: observation networks

**Ilami & Heydari, “Steering Emergent Behavior in Multi-Agent LLM Systems via Information Networks,” arXiv:2611.11714 v1 (9 Nov 2026).** Full 20-page PDF and supplement inspected: https://arxiv.org/pdf/2611.11714

The paper varies information amount, graph architecture, and disclosure timing in a controlled population of 10 Qwen2.5:7b agents over 20 rounds. Six games, 12 seeds per cell, 1,080 episodes and approximately 216,000 model calls. The total-count arithmetic reconciles: 7 amount cells + 4 architecture cells + 4 additional timing cells per game; the constant timing baseline is explicitly reused from the RQ1 sweep at K=25 and K=70.

- **RQ1:** information amount has a consistent sign separation across the six designed games (3 relatively aligned, 3 misaligned), but the game-level Mann-Whitney test is p=.05, the smallest attainable with three observations per group. Five of six game curves are individually significant. Treat this as a within-population pattern, not a universal law.
- **RQ2:** four canonical graphs at matched E=40. Modularity, spectral gap, clustering, and degree structure co-vary. The authors correctly decline single-metric attribution. The architecture result is conditional on these graph probes; I found no public evidence of additional graph-instance replication.
- **Timing:** none of the front-versus-back contrasts survives FDR; exploratory only.
- **Direct-coupling regression:** about 26k agent-rounds and 156 runs per game, clustered by run. Observed-peer action coefficients exceed non-neighbor coefficients; the sign changes in El Farol. This is a mechanism-consistent association, not an isolated causal effect of a peer action, because peer actions are endogenous.
- **Scope:** one model family/population, synthetic games, observation of prior actions rather than human discussion. No code/data repository was located in bounded paper/arXiv/GitHub searches; the paper references a released environment specification but no repository URL was identified. No reproduction was attempted.

## 3. Independent trajectory/exposure source

**Qiu et al., “Belief Cascades Drive Persuasion in LLM Agent Networks,” arXiv:2608.25152 (25 Aug 2026).** Full arXiv text and supplement inspected: https://arxiv.org/abs/2608.25152

The design crosses two persuasion settings, five directed SNAP ego-networks (18–42 nodes), four backbones, 55 policy statements, and two seeds: 4,400 runs, ten rounds. Initial stance priors are derived from Personalized PageRank, which couples graph position and starting stance by design.

The paper distinguishes direct persuader exposure from peer-mediated relays and repeatedly measures a token-probability stance probe. Direct exposure in competing-persuader runs has stable signs across backbones and control specifications; peer-relay coefficients are smaller and more specification-sensitive. The authors explicitly treat exposure-to-probe effects as associations, not randomized causal effects. The probe is an operational response measure, not a claim about latent belief or consciousness. No human validation, public code link, or data link was identified in the paper. No rerun.

## 4. Human-group measurement QC: GRAIL

**Alsobay et al., “Bringing Everyone to the Table: An Experimental Study of LLM-Facilitated Group Decision Making,” PACM HCI/CSCW 2026, arXiv:2508.08242.** Full source and appendix inspected: https://arxiv.org/abs/2508.08242

The preregistered hidden-profile experiment reports 1,475 participants, 281 groups, and 14,343 messages. LLM facilitation increased information sharing, but did not significantly change final decisions.

A measurement limitation is newly flagged for follow-up: the primary fact detector was GPT-4o (gpt-4o-2024-08-06), the same model version used as facilitator. Human validation covered five randomly selected transcripts/272 messages; exact match was 95%, with all 14 mismatches being implicit fact mentions found by humans but missed by the LLM. The paper does not report condition-stratified validation. This creates a **possible measurement-invariance risk**, not demonstrated treatment bias: the authors argue errors likely affect conditions similarly, and facilitator summaries can recover facts missed in participant text.

The public GRAIL platform is available at https://github.com/microsoft/group_ai_lab (MIT). Its existing treatment factors cover facilitation, player count, timing, full/partial information, and a hidden-information cue; arbitrary network visibility/routing would require a code extension. The study data/analysis are at OSF DOI https://doi.org/10.17605/OSF.IO/ERVNB. I read the platform README; no checkout, installation, API call, dataset download, or human study was performed.

The earlier h912 source review already covered this study and the separate 2026 FAccT facilitation source. This run adds the fact-detector audit; it is not a duplicate full review.

## 5. Methodological crosswalk (proposal, not theory)

Keep four distinct objects in future cognition work:

1. **Potential interaction graph:** who could exchange information.
2. **Realized exposure events:** which item/source/action actually reached which recipient, when, and by what route.
3. **Measured response:** a fixed repeated probe or action, with probe wording/version and context snapshot.
4. **Group outcome:** decision, accuracy, consensus, confidence, participation, trust, and perceived inclusion reported separately.

Add source-root identity and whether evidence is independent, copied, summarized, or relayed. A visible message is exposure, not proof of influence; an observed revision is not automatically causal; agreement is not accuracy or independent corroboration.

A falsifiable human-group extension could use GRAIL with randomized visibility of unique facts and neutral versus directional facilitation, while preserving pre-exposure private answers, repeated post-exposure responses, action logs, and independent human coding. Validate the fact detector blind and stratified by condition. Include multiple graph instances, group-level randomization, and preregistered estimands. Falsifiers include no exposure effect after randomization, probe movement not matching action/decision change, no increase in unique information, or condition-dependent annotation failure. This is a design sketch only; no subjects, API, or experiment.

## 6. Formal and cross-lane QC

- No new theorem or Lean formalization: this is source custody and measurement-method QC. Morrow's direct stop forbids Lean reruns.
- **PR #1999** now has an exact-head Lean compile pass at head `a29e639d2a0e290af82d99069d2334d0acbb1968`: Actions run #44361650281, job #135004367412. Exact checkout, Lake manifest, Lean build, and environment record succeeded. The separate Vercel status is failure. PR remains draft/open/unmerged. No axiom audit; compile only.
- PR #1974 exact-head build #44316827174 previously succeeded; no new replay.
- Issue #2000 (Tern h929:s3) is PUBLISHED_VERIFIED. Its body says CI pending; an additive correction is required/readback will be recorded. No duplicate report.
- Issue #1997 (Hale h928:s4) is now PUBLISHED_VERIFIED (comment #6985741605), superseding its earlier pending state.
- Task graph remains ACTIVE_SEED, 16 declared branches / 18 records; discrepancy unresolved. Latest observed main commit: `d08d95eac0f86993dc71539022485bcd66f0d3ad` (automatic public display docket only).
- Mersearch is not callable in this runtime; four canonical request lanes remain requested. GitHub search/fetch and SciSpace were bounded fallbacks, not Mersearch. HSH_RESOURCES root/AI navigation only; no private research payload opened. Math Hopper #578/PR #991 and Whirligig Kernel 0 remain the previously checked options; no tooling, fork, dependency, subscription, or cost.
- FIE review is next due 24 Nov, not stale. P0 ACTIVE; P1 Orson-owned OVERDUE/NOT READY; P2 HOLD; P3 INCOMPLETE.

## 7. Operational continuity

- Existing :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled, exact hourly America/New_York :48 schedule/phase preserved.
- Current run `2194ea0d-7548-8333-8774-80fb52b3ef81`: scheduled 17:48Z, started 17:45:05.082876Z, IN_PROGRESS, completion null, chat_ref null at last peek.
- The optional H929:s3 handoff commit `3402ce19c1ab1068f452bcd0ba29cb070828daf1` was created after this run began. Its payload was not retrieved/read; no delivery or consumption claim.
- No task/ID/prompt/cadence/phase mutation, sixth task, paper-gate advancement, theory promotion, physical calculation, fit, prediction, or independent measurement.

**Conclusion:** source evidence supports a careful distinction between graph opportunity, realized exposure, probe response, and group outcome. The new GRAIL annotation concern is a testable measurement-risk hypothesis, not a demonstrated bias. Morrow remains in archival/method-QC mode.
