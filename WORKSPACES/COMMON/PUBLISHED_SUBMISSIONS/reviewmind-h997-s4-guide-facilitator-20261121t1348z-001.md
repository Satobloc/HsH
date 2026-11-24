# Review-MIND h997:s4 | GUIDE facilitator self-learning audit

**Disposition:** PRIMARY-SOURCE REVIEW COMPLETED / JUDGE-DEPENDENCE AND LIVE-STUDY CAUSALITY SEPARATED / SELECTIVE-QUIETNESS-PLUS-INVARIANT-CHECK DESIGN PROPOSED / NO HUMAN EXPERIMENT / NO PAPER-GATE CHANGE.

## 1. Selection, authority, and scope

Nominal slot calculation:

- h = 997
- seq = 5h + 4 = 4989
- 4989 mod 19 = 11
- Selected ring label: Enheduanna, index 11
- Immediate successor: Tern Rook, index 12

The ring label is deterministic, not an authenticated ChatGPT identity. The current :48 execution has no run-level chat_ref. Enheduanna's workspace contains archive/source-layer instructions and an exposure boundary, but no standalone signed specialist charter or authenticated current Enheduanna thread was recovered. This is assistant-level, source-grounded Review-MIND work, not an Enheduanna-instance contribution. The user-supplied Lane Charter 48 governs this review.

This note does not change any worker's assignment or ownership. Orson's P1 manuscript, dataset, protocol, experiments, PRs, and ownership were not modified.

## 2. Primary source recovered and reviewed

Liu et al., “Learning to GUIDE the Group: Self-Learning LLM Facilitation Across Multi-Party Tasks,” arXiv:2610.16231, posted 12 October 2026: https://arxiv.org/abs/2610.16231

The HsH h912 independent-QC report had listed GUIDE as a method lead, not as a completed source review. This run reviewed the paper's main text and relevant appendices, including the corpus split, judge alignment, live deployment, outcome measures, prior-attitude calibration, and threats to validity.

The live interaction is three human participants plus one LLM facilitator. The five named components in the learning pipeline (conversation reflector, validation reflector, curator, judge, and speech generator) are sequential workflow roles. The judge is fixed to Gemini 3.7 Flash and the live speech generator to Gemini 3 Flash; the reflector/curator sweep also stays within Gemini model variants. They are not five independently participating agents in the live group. The paper is evidence about one deployed facilitator in a human group, not a live multi-agent LLM team.

Study 1 used 432 participants in 144 triads, each completing three tasks. Study 2 used 462 participants in 154 new triads. The Study 1 corpus was split by cohort, not by individual episode: 102 training cohorts, 13 validation cohorts, and 29 held-out test cohorts (87 episodes). The offline comparison reports 736 speech/silence decision points from those held-out episodes.

## 3. What the evidence supports, and what it does not

### Offline self-learning result

The deployed playbook contains 53 rules. The reported 61.4% win rate is a tie-adjusted preference from the aligned LLM judge over 736 held-out decision points, not a human preference rate or an objective task-success rate. The paper reports paired bootstrap uncertainty over episodes for the gain; the 736 decision points are nested within 87 episodes and 29 cohorts, not 736 independent groups.

The judge was calibrated against 20 human annotators on 50 sampled decision points, with four votes per point (200 votes) and Cohen's kappa of 0.70. An earlier rubric reached only 0.29 and produced a pathological cadence rule when used for learning. This is valuable evidence that evaluator design materially changes the learned policy.

The same fixed judge is used in the iterative learning loop and the offline benchmark. Holding out conversations protects against direct conversation-level leakage, but the final 61.4% remains judge-relative rather than independent human validation. The benchmark deliberately balances speech and silence at 1:1; the authors note that this makes abstention comparatively low-risk. The result should therefore be read as performance on this benchmark and judge, not as a general measure of facilitator quality.

The rule-level Helpful/Harmful/Neutral labels are assigned from the judge's action-level verdict and rationale. They are useful, auditable attribution hypotheses, but they are not causal estimates of each rule's contribution. A rationale is not a counterfactual ablation: several rules can co-occur, and the judge does not observe the same state with one rule independently removed.

### Live human study

Study 2 is a between-study comparison against Study 1, not a concurrently randomized comparison. The authors checked the study configurations and report that task materials, platform, survey instruments, and base facilitator backbone were held consistent, with the prompt block changed. They also explicitly state that the between-study design does not become a randomized causal estimate.

Study 2 participants began with lower baseline attitudes toward AI facilitation. Within-person calibration accounts for most of the satisfaction and comfort differences, but a cohort-clustered ANCOVA leaves a perceived-productivity deficit (beta = -0.205, p = 0.003). This is a useful qualification, not a reason to discard the study.

The learned facilitator used 24.7% fewer turns and 29.0% fewer words. Reported friction/anger was lower (1.60 to 1.42, p < .001). Psychological safety changed from 4.62 to 4.67 (p = .057); feeling heard from 4.35 to 4.40 (p = .202); comfortable speaking from 4.63 to 4.69 (p = .049). The paper identifies psychological safety as the single primary metric and treats the other survey measures as secondary with Benjamini-Hochberg correction within their block.

Objective task outcomes were broadly comparable after the stated multiple-testing correction. One failure mode deserves attention: clerical negotiation errors, where an agreed split did not sum to the available pot, rose from 2.3% (3/130) to 8.7% (12/138), nominal p = .023. The authors explicitly report that this does not survive Benjamini-Hochberg correction across the seven task-outcome tests. It is a signal for a follow-up test, not an established adverse effect.

The deployed playbook contains an arithmetic-audit rule (res-00003), but the paper reports that it was rarely executed. This creates a plausible distinction between social restraint and procedural verification: a facilitator can avoid interrupting a productive conversation yet still fail to catch an objective error at closure.

The paper describes lower within-cohort dispersion on five participant-experience measures as potentially more equitable. Lower dispersion alone is not equity: it can represent uniformly good or uniformly poor experience. Here the means are directionally stable or favorable on several measures, but group-productivity variance rises (1.081 to 1.161). Only occupational category was collected as structured demographic data; age, gender, race/ethnicity, education, income, and country were not collected, so subgroup-equity claims are unavailable.

## 4. Main methodological finding

GUIDE supports the feasibility of learning a more restrained, generalized facilitation playbook from real human interactions. It does not yet establish that the learned playbook causally improves human-group outcomes over expert prompts, that its judge-derived rule credits are causal, or that the five internal pipeline roles constitute five independent agents.

Three evidence layers must remain separate:

1. **Judge-relative policy comparison:** held-out conversations, same judge used in the learning loop and benchmark, 1:1 speech/silence sampling.
2. **Live human-group comparison:** real participants and task outcomes, but separate study cohorts and periods rather than concurrent randomization.
3. **Rule-level explanation:** judge-rationale-derived attribution, not randomized rule contribution.

The strongest next question is not whether a facilitator should speak more or less. It is whether social restraint can be separated from objective verification, so silence during productive exchange does not become silence at the point where a decision must satisfy explicit constraints.

## 5. Proposed R&D: quiet-by-default, verify-at-commit

This is a proposal, not an implemented system or an empirical result.

Separate two functions:

- **Social facilitator:** chooses whether and how to intervene based on the conversational state; preserves participant agency, dissent, and productive flow; does not choose value outcomes.
- **Objective closure validator:** activates only when a group submits a decision. It checks explicit, deterministic constraints (for example, arithmetic totals, role/option consistency, and recorded agreement). It returns the smallest necessary discrepancy notice and leaves the substantive choice to the group.

A disconfirmable concurrent study could randomize triads within the same recruitment window to:

A. the expert facilitator prompt;
B. the learned GUIDE playbook;
C. the learned playbook plus the objective closure validator.

Keep the platform, tasks, base model, time window, and participant flow constant. Randomize at cohort level, pre-register the primary outcome and secondary families, and analyze with cohort-level dependence respected. A separate randomized ablation should test res-00003 and selected silence/timing rules rather than treating judge-generated rule credits as causal.

Use an independent, blinded human panel on held-out interactions for facilitation quality. A second LLM judge from another model family can be supplemental, but should not replace human evaluation or be treated as automatically independent. Freeze evaluator rubrics before the trial.

The event record should distinguish:
- message authored by;
- message delivered to;
- message actually read/seen;
- response to;
- explicit uptake (quote, paraphrase, endorse, reject, modify);
- incorporation into a proposal or decision;
- objective validation result;
- final decision and evaluator record.

These are different edges. Delivery is not reading; reading is not uptake; uptake is not incorporation; incorporation is not proof that a message caused the decision.

**Falsifiers:** the validator fails to reduce objective closure errors; it increases interruption or friction enough to offset any gain; the learned-playbook advantage disappears under concurrent randomization; independent human ratings do not reproduce the judge preference; lower within-group variance accompanies worse mean experience or worsened outcomes for a participant subgroup; or randomized rule ablations fail to support the claimed contribution of the rules.

Any human study requires informed consent, clear disclosure of the AI facilitator's role, privacy-preserving logs, and no hidden exposure of private messages to other group members.

## 6. Formalization and proof boundary

Two existing Lean artifacts are relevant, but neither proves the GUIDE-specific empirical claims:

- Nadir PR #1189 includes NadirProjectionCoarseGrainFactorization.lean. Historical exact-head Actions run #44106198466 checked commit da1e7d5dff0cdbc1d81303e3c573b79832087a38, Lean 4.34.0, 8,961 Lake jobs. Its generic result characterizes when a readout factors through a projection: the readout must be constant on each fiber. Tests, lint, nanoda, leanchecker, and a global axiom audit were not run in that build.
- Review-MIND PR #1933 includes ReviewMindVisibilityDoseIdentifiability.lean. Historical exact-head run #44203625911 checked commit 8c8e3105690f217f0764ebbf77ab07eb6242bce5, Lean 4.34.0, 8,948 Lake jobs. It proves a generic countermodel in which the same observed cells can be compatible with different visibility effects at fixed dose. It does not establish a GUIDE-specific treatment effect.

These are historical exact-head build observations, not claims about the current PR heads. Lean checks only the formalized statements. No new Lean module or build was performed here; the proposed closure-validator state machine and source-specific causal maps remain unformalized. No physical calculation or independent measurement was involved.

## 7. Campaign, archive, and continuity controls

- P0 Code Grurple remains ACTIVE.
- Orson P1 remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 remains HOLD; P3 remains INCOMPLETE.
- Orson's manuscript, data, protocol, experiments, PRs, and ownership were not touched.
- Mersearch lanes 1–4 remain requested; no request was overwritten, released, or retriggered.
- HSH_RESOURCES root README/metadata only; no private payload accessed.
- FIE was last fully rereviewed 20 November; next review 4 December.
- Unrelated SAT archive reading completed at 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 2846–2885, blob f33eb29fbac65efa1db054239bb9c28a04a13a42. The passage is an assistant-generated Germanic cognate list and a request for a diaspora-variety primer; no linguistic claims were adopted. Next shared cursor: 2886.

No new tooling, branch, PR, task, experiment, model trial, or paper submission was created by this research note. No BEDROCK theory promotion is proposed.
