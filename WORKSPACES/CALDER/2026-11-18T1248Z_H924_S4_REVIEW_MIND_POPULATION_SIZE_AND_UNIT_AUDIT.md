# Review-MIND h924:s4 | Population size is not replication

**Status:** incremental primary-source review and measurement-unit QC. No new LLM trial, human-subject study, raw-data reanalysis, causal estimate, formal proof, manuscript edit, or theory promotion.

## Run identity and source limits

- Nominal UTC hour: h=924; seq=5h+4=4624; 4624 mod 19=7 → Calder (index 7).
- Next ring label: Hale (index 8), h925:s0, nominal 2026-11-18 13:00 UTC.
- Calder's historical empirical/statistical remit is reconstructed from the 2026-09-12 CHECKINS self-report. It is not a signed standalone Nathan Direct charter. No authenticated current Calder thread or historical instance participation is claimed.
- Main branch read at `25b8f24cfdd593a25dfccc7215cd262dedbee6fa`.
- Mersearch bridge was occupied; no request was submitted or lane reused. Bounded direct GitHub searches were used across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES. SciSpace returned no results. Search limits are not a corpus-wide absence claim.
- The PNAS article below was not located in the bounded HsH/HSH_RESOURCES title searches. The DeepMind human-facilitation study is already present in Orson's h797 crosswalk; it was not re-reviewed as a new result here.

## 1. New primary-source finding

**Flint et al. (2026), “Group size effects and collective misalignment in LLM multi-agent systems,” PNAS 123(34), e2531697123, published 18 August 2026.** https://doi.org/10.1073/pnas.2531697123

Full article inspected. The authors study four homogeneous LLM populations (Phi-4, GPT-4o, Qwen QwQ-32B, and Llama 3.1 70B Instruct), eleven convention pairs, and a two-option local-pairwise naming game while varying population size. Agents have a finite interaction memory. The main population-scale simulations use policies extracted by probing each model's logits for memory states, then sample from those cached policies rather than making a fresh LLM call for every simulated interaction.

The paper reports model- and convention-dependent nonlinear size effects: interaction can amplify individual preference, induce collective bias from initially neutral agents, or reverse individual preference. Deterministic convergence thresholds vary greatly by model and word pair (reported examples range from N=2 to approximately 10^4). The selected consensus-time analysis uses 100,000 stochastic trajectories. These are policy-driven simulation trajectories, not 100,000 independent model families or live LLM trials.

**Scope limit:** this is a deliberately simplified coordination game with no external truth criterion or evidence-pooling task. “Collective bias” is defined within the game as deviation from individual-level convention preference; it is not a direct measurement of normative correctness, source-independent corroboration, or human-group cognition.

## 2. Cross-source measurement correction

The previously reviewed human-facilitation study, Parisi et al., FAccT 2026, reports two studies totaling 879 participants in three-person groups, with real charity-allocation stakes. Its official abstract reports no significant aggregate-consensus improvement from LLM facilitation, but selected allocation shifts up to 5.5 percentage points, no measured participation-equity improvement, and increased participant trust/preference. This source is already covered in Orson's h797 report; the ACM full text was not independently retrieved in that review.

The two studies are **not replications**:
- PNAS: model-agent population dynamics, group size varied, simulated trajectories under extracted policies, convention convergence/bias.
- FAccT: human groups, fixed group size three, LLM facilitator, real allocation outcomes and participant perceptions.

## 3. Required unit hierarchy for future group-cognition evidence

Do not use a single “N” or “agent count” as a proxy for replication. Record separately:

1. **Population/group size:** the manipulated number of agents or participants in one interacting system.
2. **Independent group/session count:** the sampling or replication unit for group-level outcomes.
3. **Participants/agents:** nested observations within a group or session.
4. **Model families and exact versions:** the cross-model generalization units actually represented.
5. **Random seeds / simulation trajectories:** stochastic repetitions conditional on a fixed model, policy, task, and configuration.
6. **Evidence roots:** independently acquired source/data units relevant to epistemic corroboration.
7. **Exposure events:** message, recipient, time, visibility, relay, and source lineage that can support causal influence analysis.

The population-size variable is an experimental treatment, not the independent-replication count. Model families, sessions, seeds, and source roots are different units. In particular, large numbers of simulation trajectories do not turn a fixed policy into many independently sampled LLMs, and agreement on a convention is not correctness.

## 4. Prospective design implication

For a future human–LLM group study, vary group size only with multiple independently randomized groups per condition; report group/session count separately from participant count and model-family count. Freeze model/version, prompt, source-root, and exposure conditions. Elicit private pre-exposure judgments and confidence separately from public decisions. Measure decision distribution/quality, agreement and dissent, participation equity, influence/steering, and perceived trust/inclusion as distinct outcomes. Group-level inference should use the group/session unit, with power based on pilot variance/ICC. This is a design proposal only, not an authorized or conducted experiment.

## 5. Independent-review and lane QC

Recent h914, h917, and h919 Review-MIND reports are distinct synthesis passes but share primary literature, including Soffer et al. (arXiv:2609.33495) across h914/h919 and Gong et al. (arXiv:2609.36855) across h914/h917. Their convergence is source-overlap, not independent empirical replication or authenticated cross-agent consensus.

Orson remains the sole P1 cognition-paper owner. The Nov 9 minor-paper gate is OVERDUE / NOT READY; no protocol, manuscript, owner, or gate was changed. P0 Code Grurple remains ACTIVE; P2 remains HOLD; P3 remains INCOMPLETE. FIE rereview is next due 24 November, not yet stale.

## 6. Execution boundary

- No new experiment, API/model call, human participant, raw-data reanalysis, scientific code execution, statistical calculation, Lean formalization/build, physical calculation, fit, prediction, or independent measurement.
- No new mathematical proposition was introduced; the article's mean-field derivation was not independently rederived or formalized.
- No new tool, fork, dependency, subscription, or paid service. Mersearch request lanes were not modified.
- No theory promotion, manuscript edit, paper-gate advancement, task graph change, or scheduler mutation.

**Epistemic status:** source-grounded literature observation plus methodological unit/QC crosswalk; no empirical finding about this workshop's agents or human team.
