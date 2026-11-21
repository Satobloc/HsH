# H1004:S4 Review-MIND | Live AI mediation, affect measurement, and value creation

**Status:** Source review completed; public artifact intended for the existing HsH issue publisher.  
**Epistemic class:** Primary-source description + assistant reconstruction + mathematical counterexample + proposed experiment. This is not blind peer review, a replication, or a new human-subject study.

## 1. Scope and source selection

The deterministic ring calculation for the 20:48Z slot is:

\[
h=1004,\qquad seq=5h+4=5024,\qquad 5024\bmod 19=8.
\]

The selected ring label is **Hale** (index 8); the next label is **Elias Kern** (index 9, h1005:s0). The label is a routing index, not evidence of an authenticated independent ChatGPT instance.

Hale's historical remit is external-literature scanning and matched-period comparison, not blind review. The current run has no authenticated Hale conversation/thread reference. This is assistant-level source-grounded work.

The existing HsH evidence map already covers the 2024 Flathmann human-AI team study and the 2026 hidden-profile team study, including its bibliographic correction and source/code audit. Those were not re-reviewed. This run pivots to a distinct, previously unindexed live-dispute study.

## 2. New primary source: AI Mediators Regulate Emotion and Create Value in Disputes

James Hale and Jonathan Gratch, [*AI Mediators Regulate Emotion and Create Value in Disputes*](https://arxiv.org/abs/2609.17933), arXiv:2609.17933, submitted 15 September 2026. The paper is an arXiv preprint; peer-reviewed publication status was not verified in this review. The first author's surname is coincidentally Hale and is unrelated to the Workshop ring label.

### Study topology and sample

The experiment has 164 human seller participants and 50 human mediators across three conditions:

- AI mediator: 55 sellers.
- Human mediator: 50 sellers and 50 crowd-sourced novice mediators.
- No mediator: 59 sellers.

**All sellers negotiate with an AI buyer (GPT-4o).** The AI-mediator condition uses a two-stage pipeline: GPT-5-mini decides when to intervene and GPT-5 generates the mediator message. The human-mediator condition uses novice crowd workers, not professional mediators. The task is a live, text-based role-played dispute, not an actual real-world dispute and not a multi-human team.

The counterpart identities are disclosed in a post-task debrief. This matters for deployment: experimental nondisclosure with consent/debrief is not a template for undisclosed AI mediation in ordinary services.

### Reported outcomes

- Around AI-mediator interventions, the paper reports negative-emotion ratings falling from 0.24 to 0.18 (\(t=3.20,\ p<.01\)) and positive-emotion ratings rising from 0.09 to 0.14 (\(t=-2.61,\ p=.01\)).
- Impasse rates are 47.3% (AI mediator), 54.2% (human mediator), and 58.0% (no mediator); the between-condition difference is not significant (\(\chi^2(2,N=164)=1.262,\ p=.53\)).
- The mediator-type × integrative-potential interaction for **joint points** is marginal (\(\beta=0.37,\ p=.056\)); the interaction is significant for seller points (\(\beta=0.39,\ p=.04\)) but not buyer points (\(\beta=0.27,\ p=.16\)).
- The AI mediator offers trade-off suggestions at a higher reported rate than human mediators (0.38 versus 0.07, \(p<.001\)). AI messages receive an average of 3.12 speech-act codes versus 1.07 for human messages.

**Interpretation:** the strongest evidence is a treatment-specific affect and intervention-style result. The title's “create value” claim needs qualification: the joint-points interaction is just above the conventional .05 threshold, buyer points do not show the corresponding interaction, and impasse rates do not differ significantly. The authors themselves state that they do not yet have a causal mechanism explaining the observed outcome pattern.

### Measurement and causal limits

1. **The emotion contrast is not a clean randomized intervention effect.** For the no-mediator condition, GPT-5-mini is used to identify hypothetical points at which it would have intervened. Those model-selected points are then used for pre/post emotion comparisons. They are not randomized intervention times. Selection on the model's own trigger judgments can confound the apparent pre/post change with timing and regression to the mean.

2. **Emotion validation is narrow and uneven.** GPT-4.1 labels are compared with human ratings on 50 utterances selected after the model rated them as at least partly non-neutral. The validation therefore does not test utterances the model may have incorrectly treated as neutral. Across the 50 utterances, reported Pearson correlations are anger .58, compassion .44, joy .32, sadness .10, and fear .03. The negative-emotion composite includes fear and sadness, whose individual agreement with human ratings is weak. The affect result is consequently more secure as a model-annotated signal than as a fully human-validated emotion measure.

3. **Speech-act coding is also model-mediated.** The reported 3.12 versus 1.07 codes per message is not an independent human-coded quality measure. Message length, style, and overlapping labels could affect the number of codes. A blinded human-coded validation and length-normalized analysis are needed before interpreting this as greater mediation quality.

4. **The mediator comparison is a package comparison.** The AI system has a trigger model plus a generator; the human comparison uses novice crowd-sourced mediators. The buyer is AI in every condition. The experiment therefore does not compare AI mediation with a fully human-human dispute, nor does it isolate “AI identity” from training, model architecture, intervention policy, or message production.

5. **Analysis-N reconciliation is needed.** The study reports 164 sellers, while the repeated-measures emotion interaction is reported as \(F(2,154)=4.57\). The inspected paper text does not clearly reconcile the denominator degrees of freedom with the recruited sample. This is a reporting query, not evidence of an error; the analysis-specific N and exclusions should be stated.

6. **Reproducibility boundary.** The preprint page did not expose a participant-level trial-data/code release. The related KODIS dispute corpus is a separate resource; access to it does not establish release of this experiment's data or annotations.

## 3. Matched-period comparison: static benchmark to live role-play

A useful 2024 comparator is Tan et al., [*Robots in the Middle: Evaluating LLMs in Dispute Resolution*](https://doi.org/10.3233/FAIA241243), JURIX 2024, with [public data, code, and prompts](https://github.com/JinzheTan/Robots_in_the_middle).

That study evaluates mediator selection and message drafting over 50 constructed hypothetical disputes with human evaluators. It is an offline output benchmark: no live disputants, no evolving intervention-response sequence, and no post-intervention negotiation outcome. The 2026 Hale–Gratch study advances to live interaction with human participants and scored dispute outcomes, but retains an AI buyer in every condition, novice human mediators, model-annotated affect, and a non-randomized trigger-based pre/post emotion comparison.

This is a purposive two-period comparison, not a systematic review or a claim about field-wide publication trends. The existing HsH evidence map's Kerstan et al. hidden-profile team study is adjacent but distinct; it was not repeated here because it is already covered in the prior source map and correction.

## 4. Mathematical check: the paper's “integrative potential” is a proxy

The paper defines integrative potential as a preference-vector angular divergence:

\[
IP(b,s)=1-\frac{b\cdot s}{\|b\|\|s\|}.
\]

That is a preference-angle statistic, not a direct measure of the maximum feasible joint surplus. A compact mathematical counterexample:

\[
b=(4/5,1/5),\qquad s=(1/5,4/5).
\]

Then \(b\cdot s=8/25\), \(\|b\|^2=\|s\|^2=17/25\), so

\[
\cos(b,s)=8/17,\qquad IP=9/17.
\]

Keep these preference vectors fixed but change the feasible outcome set:

| Feasible set | Best allocation | Maximum joint utility |
|---|---|---:|
| Two issues can be allocated independently | Buyer gets issue 1; seller gets issue 2 | \(8/5\) |
| Issues are bundled and must go to the same party | Both issues go to buyer or both to seller | \(1\) |

The same \(IP=9/17\) therefore coexists with different attainable joint surplus. This does **not** invalidate IP as a within-task moderator when the feasible set is fixed. It limits the interpretation: IP is a task-conditioned preference-divergence proxy, not a sufficient statistic for feasible value creation across tasks.

The generic factorization criterion is already formalized in [HsH PR #1189](https://github.com/Satobloc/HsH/pull/1189), module `NadirProjectionCoarseGrainFactorization.lean`. The exact PR-head Actions build #44106198466 compiled the relevant module at head `da1e7d5dff0cdbc1d81303e3c573b79832087a38` (8,961 Lake jobs). The theorem states that a readout factors through a projection exactly when the target is constant on the projection's fibers. The inspected theorem-specific axiom report shows `Classical.choice` and `Quot.sound` for quotient/uniqueness components; no `sorryAx` or bare `admit` was observed. Applied here: if two negotiation states have the same IP but different feasible surplus, no function of IP alone recovers that surplus.

This is reuse of an existing proof, not a new source-specific Lean theorem. The current runtime has no local `lean`, `lake`, or `elan`; no new Lean file or compile was claimed. The existing build's tests, lint, nanoda, leanchecker, and global axiom audit were skipped. The proof validates the formalized factorization statement, not the empirical paper or the translation of its task into the formal model.

## 5. Disconfirmable R&D proposal

A focused follow-up should separate three mediator functions that the current paper bundles:

- **Affect acknowledgment** (reflect emotion without proposing a settlement).
- **Information inquiry** (ask for missing interests, constraints, and evidence).
- **Trade-off suggestion** (propose a concrete package).

Use a preregistered factorial policy comparison in repeated independent dispute sessions, with the same buyer policy and model version across AI arms. Randomize intervention policy and trigger timing at the dispute level; include a genuine no-mediator control and a matched human-mediator benchmark. Recruit multiple independent sessions per condition and multiple human mediators; cluster inference at the dispute and mediator levels where repeated observations occur.

Primary outcomes should include objectively scored joint points, each party's points, impasse, and participant-rated autonomy/fairness. Secondary outcomes can include human-validated affect change, information completeness, and uptake of trade-off proposals. Human emotion and speech-act coders should be blinded to condition; validate on a random sample that includes neutral utterances; normalize coding by message length; report the exact analysis N and missingness for every model.

**Disconfirmation conditions:** affect acknowledgment fails to change human-coded affect; inquiry fails to improve information completeness or objective outcomes; trade-off suggestions fail to improve joint points when feasible surplus is high; or any gain comes with reduced autonomy, perceived neutrality, or fairness. If the effect disappears when trigger times are randomized, the current pre/post emotion result should not be interpreted causally.

## 6. Cross-worker independence guard

The immediately preceding Review-MIND reports are not independent replications. The Enheduanna and Calder reports both reuse PR #1189; Calder and Ravel both reuse Math Hopper PR #991; all reports share HsH repository state, user directives, and overlapping source context. The current and recent scheduled runs do not establish authenticated separate ChatGPT threads or instances.

The 19-person ring is a routing index, not a sample of 19 independent cognitive agents. Count independent evidence by upstream data-generating source, randomization unit, model/prompt exposure, and provenance graph, not by worker label or number of summaries.

For future records, keep separate nodes and edges for run, thread, model/version, prompt, repository snapshot, primary source, message, claim, exposure, uptake, and decision incorporation. Agreement between reports with shared upstream sources is correlated support, not independent consensus.

## 7. Scope and safeguards

- No human-subject experiment, model trial, or participant data collection was performed. No new API key, paid service, or subscription was configured; SciSpace was used through the existing connected app, and account-level billing is not observable.
- No physical calculation or measurement applies. The IP example is an abstract mathematical counterexample, not physical data.
- No SAT-O or Blockwave equation was changed.
- No BEDROCK theory promotion, new tool, dependency, branch, or PR was created.
- The existing Orson P1 manuscript, dataset, protocol, experiments, PRs, and ownership were not touched.

### Sources

1. Hale & Gratch, 2026 preprint: https://arxiv.org/abs/2609.17933
2. Tan et al., JURIX 2024: https://doi.org/10.3233/FAIA241243
3. Tan et al. reproducibility repository: https://github.com/JinzheTan/Robots_in_the_middle
4. Existing HsH projection/factorization formalization: https://github.com/Satobloc/HsH/pull/1189
5. Existing HsH human-AI group interaction evidence map: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-10-30_1648Z_REVIEW_MIND_HUMAN_LLM_TEAM_INTERACTION_EVIDENCE_MAP.md
