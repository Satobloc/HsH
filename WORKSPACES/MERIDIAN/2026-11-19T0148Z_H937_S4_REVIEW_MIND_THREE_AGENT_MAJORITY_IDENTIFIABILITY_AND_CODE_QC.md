# Meridian h937:s4 | Review-MIND: majority identifiability, ICC interpretation, and code QC

**Disposition at report creation:** source review complete; exact mathematical result formalized in separate draft PR #2046; exact PR-head checkout and Lake manifest generation passed; Lean compilation was still in progress; no empirical reproduction; P1 protected; optional successor context recorded after the successor run had started.

## 1. Slot, authority, and scope

- Nominal UTC hour: `h=937` (2026-11-19 01:00Z hour). `seq=5*937+4=4689`; `4689 mod 19=15`: ring label **Meridian**, next label **Mercer** (index 16).
- This is a routing label, not authentication of a particular ChatGPT instance or thread. The current :48 automation run is `deab075e-21c0-8327-ab48-94ee882df44a`, scheduled 01:48Z, started 01:47:51.644824Z, last observed `in_progress`, completion null, `chat_ref` null. The cached latest result is the prior h936:s4 Nadir run, not this execution.
- Meridian's historical source card recovers direct user-role geometry/solver instructions from September 8 and October 21 raw conversations. No standalone signed specialist charter was found. The explicit one-run **Review-MIND Lane Charter 48** governs this activation.
- Meridian's standing Code Grurple P0 assignment remains Paper A/B presentation QA only while P0 is active. This MIND pass did not review or edit the protected manuscripts, probe live routes, or alter the standing assignment.

## 2. Preflight and archive access

Read the live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding/front-door guidance, revival rotation V3 and thread-routing rules, current main branch, active automation roster, task graph/workflow orientation, Meridian BOOT/CURRENT_WORK/CONTINUITY and recent receipt, and the recovered Meridian role-source card/raw user messages. Also read the recent Nadir, Morrow, Enheduanna, Orson, and Mercer receipts relevant to this lane and its handoff.

Mersearch is not exposed as a callable connector in this runtime. The four canonical request files remain `requested`; the corresponding request-scoped RUN_MANIFEST and SEARCH_RECEIPT files are absent. No lane was overwritten, released, retriggered, or falsely represented as a Mersearch search. SciSpace was checked but returned no relevant results for the focused query; official arXiv full text, public GitHub source, and bounded HsH searches were used instead. HSH_RESOURCES README and AI start page were read; no private payload was opened. SAT archive and HsH root navigation were read.

Existing Lean PRs, Math Hopper #578 / PR #991, Whirligig Kernel 0, and the available SciSpace route were checked before adding the formalization. The existing shared Lean infrastructure branch was reused. No new tool, fork, dependency, subscription, paid API call, or local Lean installation was created. The GitHub connector did not expose a fork-list action; no fork use or exhaustive fork survey is claimed.

## 3. Primary source and previous-work distinction

**Batra et al., *Who Convinced Whom? Tracing How LLMs Change Their Minds in Multi-Agent Systems*, arXiv:2610.35930, submitted October 18, 2026.**

- Original: https://arxiv.org/abs/2610.35930
- Full text: https://arxiv.org/html/2610.35930
- Public analysis repository: https://github.com/aniketiiitd/MAS-Interp
- Reviewed code commit: `521b291dc7d4cd864106d21c46660b5ae5b07504`
- Reviewed source file: `code/analysis/lit_independence.py`, blob `8053d7f8c9a681ceb290664b5259fa719d14e12d`.

This source was already reviewed by Orson h915:s3 for pre-rationale forced-choice readout and source-attribution controls. The present pass changes the lens: it audits the statistical meaning of the three-agent effective-voter metric and the implementation of its ICC bootstrap. It does not present the paper as a new discovery or repeat the earlier readout/attribution proposal.

The study uses three agents, three open-weight model families, debate versus matched reflection, and a 2,400-question core benchmark. The authors report answer changes, message ablations, source-attribution interventions, wrong-unanimity, direct majority accuracy, and a one-way ICC-derived effective-voter quantity. These are author-reported preprint results, not independently reproduced here.

## 4. Main methodological finding: variance-equivalent ESS is not majority reliability

The paper and its public script use `n_eff = 3 / (1 + 2*rho)`, where `rho` is a one-way ICC over three binary correctness indicators. Under equal marginal variances and a common off-diagonal correlation, this is the variance-equivalent effective sample size for the **mean** of three correlated indicators. It is not, without additional distributional assumptions, an exact number of independent voters for a **majority** decision.

For three correctness indicators, let `p12`, `p13`, and `p23` be pairwise joint-correctness probabilities and `p123` the triple-correctness probability. Exact inclusion-exclusion gives:

\[
P(\text{majority correct}) = p_{12}+p_{13}+p_{23}-2p_{123}.
\]

If all pairwise joint probabilities equal `q`, majority correctness is `3q - 2p123`. The third-order joint term remains free even when all marginal and pairwise statistics are fixed.

The exact Lean countermodel uses a one-parameter family of valid, exchangeable, pairwise-independent Bernoulli triples. Every member has marginal correctness `1/2` and pairwise joint correctness `1/4`, hence zero pairwise correlation and `n_eff=3` under the design-effect formula. Yet two exact rational members have majority correctness `3/4` and `1/4`. The difference is the third-order joint probability, not any first- or second-order statistic.

**Interpretation:** the `n_eff` result is a useful variance/dependence summary. It is not by itself a majority-accuracy or error-correction guarantee. This limits the interpretation of the effective-voter phrase; it does not invalidate the paper's empirical findings, because the paper also reports direct majority accuracy and wrong-unanimity outcomes.

## 5. Existing formalization reused and new Lean result

Orson's protected P1 PR #850 already contains `OrsonKishEffectiveSampleSize.lean`, which formalizes the variance-equivalent Kish/design-effect identity under its stated equal-variance and exchangeable-covariance assumptions. The exact current PR head is `6b4eebeacf4f6928f18601626e4e9e3942d73d81`. Its current Actions run #44416543286 built the module on a synthetic merge reference, not a standalone exact-head checkout. The captured theorem-specific axiom dependencies include `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appeared in the captured list. Several linter warnings were emitted. This is an existing Orson-owned formalization, not a new result of this run.

A separate Review-MIND draft PR was opened on the shared infrastructure branch, without modifying Orson's P1 branch:

- PR #2046: https://github.com/Satobloc/HsH/pull/2046
- Branch: `review/meridian-majority-third-moment-20261119t0148z`
- Base: `infra/lean4-verification-20261023` at `368f9af8d95d061b4581688759ed3eda309e9886`.
- New module: `FORMAL_VERIFICATION/HsHVerification/MindMajorityThirdMoment.lean`.
- Head: `d8a460b6372a07c102d24ff2b27a5cc43cc928b7`.

The module proves the majority/third-moment identity and the pairwise-independent countermodel. The CI run is #44441176494, job #135282099718. Exact PR-head checkout assertion passed and Lake manifest generation passed. At report creation, the Lean compile step remained `in_progress`; no compile success, `#eval` result, or theorem axiom report is yet claimed. The PR is draft/open/unmerged and requires independent review. Even a successful build would establish only the formalized probability identities and exact rational countermodel, not that real LLM errors follow either law or that the paper's empirical results are true.

## 6. Static code review finding

The public `lit_independence.py` source computes the main estimate with a denominator guard at line 115, but the bootstrap call at line 116 uses `lambda x: 3 / (1 + 2*icc1(x))` without the same guard. The `boot` helper evaluates the function before filtering non-finite outputs and does not catch exceptions.

For three equally sized binary groups, the one-way ICC formula can reach `rho=-1/2` when the between-question mean-square is zero while within-question variance is positive (for example, when every sampled question has the same number of correct agents). Then `1+2*rho=0`. The main estimate returns `NaN` for this case; the bootstrap lambda can instead raise `ZeroDivisionError` before its non-finite filter. This is a **potential edge-case exception path found by static inspection**, not an observed failure. No output tables, raw activations, model responses, or core dataset rows were retrieved; no script reproduction is claimed.

The code's one-way ICC also reports a single pooled within-question correlation. The exchangeable/common-correlation assumption is plausible for the symmetric three-copy design, but per-pair correlation diagnostics are not reported by this script. This is a diagnostic limitation, not proof that the assumption is false.

## 7. Orson P1 protection and 4/5 allocation audit

P1 issue #564 remains **OVERDUE / NOT READY / ORSON-OWNED**. The November 9 minor-paper gate is missed; November 30 major-paper and December 14 full-theory gates remain separate. No P1 manuscript, protocol, dataset, human session, model/API trial, dataset expansion, or paper gate was changed. No P1 work was moved into this Meridian report or PR.

Receipt-level adoption audit: among the five most recent **substantive Orson-labeled receipts**, h911:s4, h915:s3, h927:s0, h930:s4, and h934:s3, four are genuine LLM-cognition research/QC outputs and one (h927:s0) is a geometry/source-fidelity audit. h919:s2 was a duplicate-run reconciliation and is excluded as non-substantive. This meets the 4/5 output-allocation target at the receipt level. These labels and reports are not proof of authenticated Orson-thread participation; no cross-agent consensus or identity claim follows.

## 8. Campaign, freshness, and operational controls

- P0 Code Grurple: ACTIVE; Meridian's standing Paper A/B presentation-QA boundary unchanged.
- P1 Orson cognition: OVERDUE / NOT READY / ORSON-OWNED.
- P2 November 30 measured-system paper: HOLD.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE last full review November 10; next due November 24, so not stale.
- Task graph remains ACTIVE_SEED, 16 declared branches / 18 records; no graph mutation.
- The h937:s0 Enheduanna run had just completed unrelated SAT archive reading at `fun break - lx.txt`, lines 2401–2440, next cursor 2441. No duplicate break was performed in this activation; no physical off-screen break is claimed.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, BEDROCK theory promotion, or paper-gate advancement.

## 9. Successor boundary

The next ring label is Mercer. The :00 run `8063f1da-22f0-8326-a165-67962d9f4d14` had already started before the optional packet was created. The repository-only packet and Mercer INBOX pointer are `POSTSTART_OPTIONAL_CONTEXT_ONLY`; no assignment, response obligation, ownership transfer, direct-thread delivery, consumption, or acknowledgment is claimed. Mercer's standing P0 Paper A/B presentation-QA assignment remains unchanged.

- Packet: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-19T0148Z_from_s4_to_s0_mercer_POSTSTART_OPTIONAL_CONTEXT.md
- Inbox pointer: `WORKSPACES/MERCER/INBOX.md`.

## 10. Scheduler integrity

The existing :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with exact saved schedule `DTSTART;TZID=America/New_York:20261001T144800` and `RRULE:FREQ=HOURLY`; the Review-MIND prompt and phase are unchanged. The current run remains `in_progress`, completion null, `chat_ref` null. No task, ID, prompt, schedule, phase, cadence, enabled-state, or task-graph mutation; no sixth task, signet, or conversation rename.