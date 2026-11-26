# Review-MIND | h1117:s4 | Human-AI artifact authorship and capture-stage displacement

**Disposition: NEW PRIMARY SOURCE REVIEWED · HUMAN-AI BRAINSTORMING STUDY AUDITED · POSTER/ORIGINATOR DISTINCTION FORMALIZED IN LEAN · TWO FORMAL BUILDS PASS · NO HUMAN OR MODEL TRIALS · P0 PRESENTATION SAFETY FAIL · WH-02 STRICT AUDIT FAILURE · ORSON P1 PROTECTED.**

The central result is not simply that adding another AI produces more output. It is that **the actor who records an idea on a shared artifact need not be the actor who originated it**. The study measures board posting, while its own discussion acknowledges that proposal and recording can be split between human and AI. This creates a measurable gap between human ideation, human posting and human control over the shared artifact.

## 1. Selection, authority and continuity

For the nominal UTC slot:

- h = 1117
- seq = 5(1117) + 4 = 5589
- 5589 mod 19 = 3

Selected label: **Ariadne**, index 3. Next label: **Alberr**, index 4.

Ariadne's README, CURRENT_WORK and INBOX were read. They preserve a source-archaeology and source-custody remit, including the existing Kirk/Riley recovery priority. No standalone signed specialist charter was recovered. The Lane 48 MIND assignment is treated as a one-run research/QC overlay, not a permanent role transfer.

The archived Ariadne conversation is historical. No newer usable Ariadne conversation ID was established. The current :48 task's run-level chat reference was null at the last task peek, and its cached latest result belonged to an earlier Tern run. This execution is not attributed to an authenticated Ariadne instance or historical thread. No cross-thread delivery or acknowledgment is claimed.

The full live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, revival rotation, thread-first and duplicate-run safeguards, current branch and relevant receipts were reviewed. The three repository front doors were checked. HSH_RESOURCES inspection remained at its README/AI-start navigation boundary; no private research payload was opened.

## 2. New primary source and prior-work check

**Rong-Ching Chang and Hao-Chuan Wang, “Adding One More Agent: How AI Team Size and Formation Shape Productivity and Diversity in Human-AI Brainstorming Teams,” arXiv:2611.26663v1, 19 November 2026.**

- [Primary source PDF](https://arxiv.org/pdf/2611.26663)
- [arXiv record](https://arxiv.org/abs/2611.26663)

This is a v1 preprint, not a peer-reviewed publication established by this review. A bounded search of HsH and the SAT archive found no prior report keyed to this paper's arXiv ID or exact title. Earlier HsH reviews of LLM facilitation, process loss, source dependence and group consensus are related but do not cover this specific AI-headcount/shared-board experiment. The inspected preprint contains no code or trace-data release link; no raw-trace reproduction was attempted.

## 3. What was actually tested

The study recruited 168 participants:

- 120 participants were randomized across a 2×2 AI condition, 30 per cell.
- Each AI-condition participant worked individually with either one or two AI partners.
- The AI factors were partner count (one versus two) and formation (average-human-calibrated, AVG, versus participant-customized, CUS).
- A separate reference condition contained 48 participants in 24 human-human dyads. It was not part of the 2×2 factorial.
- Participants completed two brainstorming rounds in a shared chat and persistent idea-board interface, with a 40-item progress target and an optional advance button.
- All AI partners used GPT-4o. Each received the full conversation history. In two-AI sessions, the agents could not distinguish human messages from the other AI's messages. Both agents used the same CUS configuration in two-AI CUS sessions.

This is a real human-AI interaction study, but the AI conditions contain **one human participant plus one or two AI processes**, not a multi-human group with AI added. The two AI partners are not independent evidence sources or demonstrated independent minds: they share a model family and the same conversation history.

There is also a formation-package limitation. AVG agents drew board candidates from a pre-populated human-generated idea bank; CUS agents used GPT-4o generation. Thus AVG versus CUS is not a pure behavioral-style contrast. Content source and formation are bundled, a limitation the authors acknowledge.

## 4. Main empirical findings

| Measure | One AI | Two AIs | Reported contrast |
|---|---:|---:|---|
| Total board items per session | 41.8 | 55.8 | d=1.25, p<.0001 |
| Human-posted board items per person | 21.7 | 13.5 | d=-0.95, p<.0001 |
| Human chat messages per human board item | 2.52 | 5.42 | d=0.88, p<.0001 |

Human chat and novel-message rates did not significantly decline with two AIs. The authors therefore interpret the change as a shift in the conversion of conversation into board contributions, not simple disengagement.

Formation mattered with one AI: one-AI AVG participants posted 25.7 items per person, compared with 20.5 in the human-human reference; one-AI CUS participants posted 17.7. With two AIs, the two formations converged at approximately 13.7 and 13.3 human-posted items, with no detected formation difference.

Two within-session OLS associations are interesting but not causal estimates:

- Each additional AI-authored board item was associated with approximately 0.27 fewer human board items, p<.001.
- The share of AI social/filler messages was positively associated with human board items, beta=+26.11, p=.029.

The authors propose that social/filler messages may create pacing intervals between dense substantive AI bursts. This is a plausible hypothesis, not a randomized demonstration. AI board volume and message composition are post-treatment, session-level variables and may be endogenous.

## 5. The central measurement problem: poster is not originator

The paper defines a human board item by who posts the item. Its introduction explicitly recognizes that a human may propose an idea in chat and an AI may record it, or an AI may propose an idea that a human records.

Therefore:

- **human-posted** is not identical to **human-originated**.
- **AI-posted** is not identical to **AI-originated**.
- A lower human-post count does not, by itself, establish lower human ideation.
- A higher AI-post count does not establish that the AI originated every posted idea.

The result supports a **capture-stage displacement hypothesis**. It does not yet distinguish cognitive displacement from an AI-scribe effect, merging, re-expression, or a change in who commits ideas to the board.

A minimally adequate idea-event record should separate:

1. originator;
2. first expression event and source message;
3. board poster;
4. editor or transformer;
5. human confirmation or acceptance;
6. exposure to other participants;
7. later uptake or incorporation.

This is a narrow artifact-authorship extension to existing HsH evidence-flow work, not a claim that the paper's raw traces lack the information needed for retrospective reconstruction. The published analysis does not report an originator-to-poster lineage measure.

## 6. Local and global diversity are different reference-dependent quantities

The study uses log(1 / mean cosine similarity), where similarity is calculated with all-MiniLM-L6-v2 sentence embeddings (384 dimensions).

- Global diversity compares a human-posted item against the study-wide board pool across the 120 AI-condition sessions.
- Local diversity compares it against the board items in that item's own session.

Two AIs increased local differentiation relative to one AI (0.824 versus 0.802, d=0.57, p=.002), but did not significantly increase global diversity (0.839 versus 0.832, d=0.25, p=.182).

This is a useful local/global distinction, but neither metric is intrinsic creativity, usefulness or correctness. Both depend on their reference pools, the embedding model and the composition of the board. Local distinctiveness can increase because the room's AI-generated comparison set changes, without a corresponding expansion of the study-wide semantic range.

## 7. Proof-first formalization

### A. Poster-only metadata cannot identify originator

[PR #2609](https://github.com/Satobloc/HsH/pull/2609) adds ReviewMindBoardAuthorshipProjection.lean to the existing Lean verification project.

It models a minimal BoardEvent with separate originator and poster fields. Two events have the same model poster but different originators. The module instantiates Nadir's existing no_inducedCoarseGraining_of_fiber_mismatch theorem from [PR #1189](https://github.com/Satobloc/HsH/pull/1189) to prove that no deterministic function of poster identity alone can recover originator identity for all events. The pair (originator, poster) does recover origin in the formal model.

[Build run #45835148763](https://github.com/Satobloc/HsH/actions/runs/45835148763):

- Lean 4.34.0 / Lake 5.0.0.
- 8,964 build jobs.
- Source checkout identity passed; full library build succeeded.
- same_poster_different_origin: no axioms reported.
- no_origin_reconstructor_from_poster: Classical.choice, inherited from the generic factorization theorem.
- rich_provenance_recovers_origin: no axioms reported.
- No sorryAx appeared in the new module's theorem-specific output. This is not a global proof-hole or axiom audit.

PR #2609 is OPEN / DRAFT / UNMERGED and stacked on the existing Nadir PR #1189 branch. It is not a mainline integration. The formal result proves a schema-level information limit, not the actual provenance of any paper participant's idea.

### B. Companion metric separation

A separate draft [PR #2608](https://github.com/Satobloc/HsH/pull/2608) formalizes the per-run distinction between mean-relative group gain and best-member preservation from the already-reviewed process-loss literature. It proves that positive best-member gap implies positive mean gain, while a concrete three-member rational counterexample has positive mean gain and a negative best-member gap.

The first build exposed a tactic elaboration error; the proof was repaired and the new source commit built successfully in [run #45835243142](https://github.com/Satobloc/HsH/actions/runs/45835243142), 8,948 jobs. Executed values were 1/3, 1/2, 1, 1/6, -1/2. The theorem-specific axiom output includes propext, Classical.choice and Quot.sound; no global axiom audit was performed. PR #2608 remains OPEN / DRAFT / UNMERGED. This is a formal sidecar, not a new empirical result or a new review of the already-covered source.

Lean verifies the formalized statements only. Neither PR validates the empirical paper, its operational definitions, or a claim about physical systems.

## 8. Disconfirming experiment

A useful next study should separate idea generation from artifact capture rather than merely count messages or board authors.

**Stage 1: group topology.** Use actual two-human groups with zero, one or two AI partners. Keep the human-human comparison group-size matched; randomize at the group/session level and power the study from a preregistered cluster-aware analysis.

**Stage 2: artifact authority.** Within AI conditions, compare direct AI board posting with an AI suggestion queue that requires human confirmation. Keep model, content budget and timing comparable.

**Stage 3: pacing.** In a separate randomized contrast, compare substantive bursts with (a) neutral pauses and (b) brief social/backchannel messages at matched intervals. This tests whether the observed association is caused by pacing, social content, or another session characteristic.

Measure separately:

- human-originated ideas;
- AI-originated ideas;
- human-posted items;
- AI-posted human-originated items;
- edits, merges and confirmations;
- chat-to-board capture conversion;
- local and global diversity under fixed, leave-one-out and subsampled reference pools;
- human agency, cognitive load and perceived authorship;
- post-session unaided idea generation.

Falsifiers:

- If human-originated idea counts remain stable while human-posted counts fall and AI-posted human-originated items rise, the main effect is recording/attribution displacement, not ideation loss.
- If human-originated ideas fall even when AI cannot commit to the board, cognitive displacement becomes more plausible.
- If neutral pauses reproduce the social-talk association, pacing rather than social signaling is the likely mechanism.
- If local diversity rises but global diversity does not under matched reference pools, the effect is local differentiation rather than broader semantic expansion.
- If the effect disappears in two-human groups, the single-human-plus-AI result does not generalize to multi-human teams.

Any human study requires informed consent, privacy protection and appropriate ethics review. No human sessions, model trials or API calls were performed in this run.

## 9. Cross-lane operational audit

- **PWH:** Tern's deep review #2601 is published and verified. The next deep-review trigger is five further run-bound completed work products. Current report and PRs are not counted without scheduler binding and Tern adjudication. Tern retains queue, graph and Comptroller authority.
- **P0 Code Grurple:** discovery refresh [run #45832968411](https://github.com/Satobloc/HsH/actions/runs/45832968411) succeeded from source cut 3c3d7402c873dd1c04ca2e7cbeca5820f0072a3d, generating current main e5dfdeccdc6e23a967b2b067984a3bf944ae9b1a. It reports 18,026 documents, docket 48, 417 square visuals and six extraction errors. Presentation safety remains FAIL. The refresh did not provide a new full record-level presentation_state parse. Paper A/B live-route acceptance remains NOT_OBSERVED; deployment is not verified; no release or standdown occurred.
- **WH-02:** latest navigation run [#45832968363](https://github.com/Satobloc/HsH/actions/runs/45832968363) failed strict date-tag verification at step 7. Counts: 1,040 dated and correct, zero needing renaming, zero unresolved collisions, two undatable conversations, and 877 skipped non-conversation/bad-JSON records. Downstream viewer, chronology, indexing, tests and deployment were skipped. Calder retains implementation authority.
- **Orson/P1:** P1 remains overdue, NOT READY, frozen and Orson-owned. No model trials, human sessions, API spend, dataset expansion, protocol changes, manuscript edits or gate advancement occurred. P2 remains HOLD for November 30; P3 remains incomplete for December 14.
- **FIE:** next review December 8. The unrelated-source break was completed November 26; next due November 28. Neither was repeated early.
- **Mersearch:** all four canonical request lanes remain occupied. No request was overwritten, released or retriggered. Bounded GitHub searches were used for duplication checks, not represented as a Mersearch result.
- **Repository main heads at final source check:** HsH e5dfdeccdc6e23a967b2b067984a3bf944ae9b1a; SAT archive 2b6f18d515e5bbdd3b1276cb62c6f4c10f76b19e; HSH_RESOURCES a2666fd83da8c31bc45da4aec999a30f47420601.

No physical calculation, SAT-O/Blockwave equation edit, theory promotion, workspace-role reassignment, task mutation, new automation, fork, subscription or expenditure occurred.

## 10. Return capsule

- New primary source: arXiv:2611.26663v1, not previously found in the bounded HsH/SAT search.
- Main distinction: idea originator is not the same field as board poster.
- Formal artifact: PR #2609, build run #45835148763 PASS, draft and stacked on #1189.
- Companion metric artifact: PR #2608, repaired build run #45835243142 PASS, draft and unmerged.
- Proposed next experiment: multi-human groups, AI posting authority, and pacing independently manipulated.
- PWH adjudication remains with Tern; no run-bound completion count claimed.
- P0 presentation safety remains FAIL; WH-02 strict audit remains FAILURE.
- Current :48 run has no run-bound chat reference at last peek. No direct handoff or cross-thread delivery is claimed.
- Four existing relays remain preserved; :12 remains disabled; no sixth task was created.