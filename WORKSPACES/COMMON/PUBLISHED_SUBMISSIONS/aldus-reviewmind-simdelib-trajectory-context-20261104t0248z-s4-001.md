# Review-MIND source audit: simulated deliberation, context projections, and identity-level trajectories

Date: 2026-11-04  
Status: source-specific reanalysis of an existing public repository snapshot. This is not a new experiment, human-subject result, or paper-gate submission.

## Scope and relationship to existing HsH work

This is a source-specific empirical supplement to Review-MIND issue #1330 (the general context-projection / information-loss framework) and the earlier human-AI evidence map in issue #1107. It does not replace either one.

The focal source is the preprint **“From Simulated Citizens to Simulated Deliberation: Challenges in Representation and Interaction”** (arXiv:2609.07573). Its study is LLM-only simulated deliberation using survey-grounded personas. It is not an experiment in which humans and live LLM agents deliberate together. Do not merge its estimand with actual mixed human-AI group interventions.

## Source chronology and version boundary

- The arXiv record identifies the preprint submission as 2026-09-07.
- The public repository `jchaemin/simulated-deliberation` has an initial commit dated 2026-08-30T08:47:55Z (`dc05d8de2e89c8ec9ffdd4e6fd95c9c0151d7d2d`), with the message “Code and data for the paper.”
- The current repository snapshot used here is commit `1b79c5153ac58272fd1e54ab76d8ca4f0545e8c5`, dated 2026-10-13T09:31:55Z, message “ARR10.”
- The Oct 13 commit adds the current `analysis/deliberation.py`, `results/debates/*.jsonl`, and `results/anchoring_grid/*.jsonl` used below. Those analysis/results files are therefore post-submission repository material relative to the Sep 7 preprint.
- The current README describes eight Korean policy questions and six model labels. This is a later expanded repository snapshot; exact identity with the Sep 7 preprint's tables and sample is not established here.
- I did not verify a later arXiv revision in this pass. The later repository data should not be represented as a formal revision of the preprint.
- The Oct 13 commit has no verified signature and uses anonymous author/committer metadata. It removes the prior `LICENSE` file. The report therefore publishes derived aggregate statistics only, not raw transcripts or copied code.

## Code path and condition semantics

Key source files at commit `1b79c5153ac58272fd1e54ab76d8ca4f0545e8c5`:

- `analysis/deliberation.py` blob `613f52991daa01af6f14e256c2618a9945521977`
- `simdelib/deliberation.py` blob `1bcbbf25fa7c2d0fda6b6620d1e35a65972e28bb`
- `simdelib/llm.py` blob `886d28fc4fa2b1d9021f40ebe438407d6bac3908`
- `simdelib/survey.py` blob `901467c3777630f26520d56c4435837e0c5b8baa`
- `simdelib/stats.py` blob `47ef921f3a4a690f125ab6bcbb3f6293f97c4434`
- `experiments/anchoring_grid.py` blob `d1a979342a76b0e1de9e31098cb5218a08539337`

The code implements four useful context views for a focal persona i. Let the ordered debate history be partitioned into the persona's own prior messages Oᵢ and peer messages Pᵢ:

Hᵢ = Oᵢ ⊎ Pᵢ.

The intended context projections are:

- π_empty(Hᵢ) = ∅
- π_own(Hᵢ) = Oᵢ
- π_peer(Hᵢ) = Pᵢ
- π_full(Hᵢ) = Hᵢ

With sender tags and original message order preserved, the projections are idempotent; own and peer projections are disjoint; and applying one after the other yields the empty projection. These are explicit sequence-filter maps, not a braid or physical equivalence.

The repository conditions correspond approximately to:

- **re-ask:** no transcript supplied to the repeated survey;
- **monologue:** own prior generated turns only;
- **excluded probe:** the same debate transcript with the focal persona's own turns removed, leaving peer turns;
- **debate:** the full transcript, own plus peer messages.

Important design caveat: this is not a fully crossed factorial design. Debate uses randomized speaking order and a full shared transcript; monologue uses fixed seat order and a different generated history; re-ask does not generate prior speaking turns. The excluded probe is the closest within-transcript context projection because it reuses the debate transcript and removes only the focal persona's own messages for the survey call.

The API client sends explicit message arrays on each call; no persistent conversation/session object is used in the inspected code path. No new model API calls were made for this audit.

## Independent reanalysis of current repository outputs

I parsed the six current `results/debates/<model>.jsonl` files and matched debate/monologue records by question and seed. Each room has six persona seats. The table reports **strict opposite-side flips** (final stance equals the negative of the assigned initial stance), not the repository script's broader endpoint-departure count.

The pooled Jaccard is the overlap of the debate and monologue flip-persona sets across all persona-room pairs:

J(D,M) = |D ∩ M| / |D ∪ M|.

Final disagreement is the percentage of persona-room pairs whose final output differs between debate and monologue. It is identity-sensitive, not a group consensus score.

| Model label | Rooms | Persona-room pairs | Debate opposite flips | Monologue opposite flips | Difference (pp) | Pooled flip-set Jaccard | Final disagreement |
|---|---:|---:|---:|---:|---:|---:|---:|
| GPT-6-sol | 140 | 840 | 44.64% | 42.62% | +2.02 | 0.758 | 12.02% |
| GPT-6-luna | 120 | 720 | 49.72% | 44.31% | +5.42 | 0.723 | 15.14% |
| GPT-4.1-mini | 140 | 840 | 45.12% | 39.88% | +5.24 | 0.515 | 27.74% |
| DeepSeek-V4.1 | 160 | 960 | 42.71% | 39.27% | +3.44 | 0.471 | 29.48% |
| Claude-Haiku-5.5 | 160 | 960 | 48.65% | 41.04% | +7.61 | 0.580 | 23.85% |
| Qwen-3.8-flash | 120 | 720 | 40.97% | 41.11% | -0.14 | 0.463 | 30.56% |

The Jaccard intervals below are exploratory cluster bootstraps resampling whole rooms (5,000 resamples), not agents:

- GPT-6-sol: 0.701–0.812
- GPT-6-luna: 0.656–0.790
- GPT-4.1-mini: 0.460–0.560
- DeepSeek-V4.1: 0.421–0.524
- Claude-Haiku-5.5: 0.525–0.635
- Qwen-3.8-flash: 0.405–0.516

### Main result

Aggregate opposite-side movement rates are fairly close between debate and monologue (absolute differences 0.14–7.61 percentage points), but identity-level trajectory agreement is substantially weaker for several model runs. Qwen is the clearest example: debate and monologue rates differ by only 0.14 pp, yet the flip-set Jaccard is 0.463 and 30.56% of persona-room pairs end on different sides. DeepSeek shows a similar pattern (3.44 pp rate difference, Jaccard 0.471, final disagreement 29.48%).

Therefore, **similar aggregate movement rates do not establish that the same personas changed, followed the same paths, or reached the same final states**. The scalar rate is a lossy projection of the identity-labelled trajectory.

The six model labels are six implementations of one repository design and shared task family, not six independent studies or six independent human groups. Do not treat agreement among these model runs as independent corroboration.

### Metric-definition caution

The repository's `n_changed` compares the final endpoint with the initial value. The classifier can return neutral `0` or unclassified `None`, so `n_changed` is not strictly an opposite-side flip count. In the current debate/monologue files, neutral endpoints did not occur; unclassified endpoints were below 0.5% in the affected model runs. The table above separately counts only true opposite-side transitions. This is why the table should not be copied verbatim from the script's broader “moved” label.

The no-transcript re-ask control still produces 4.64–30.28% opposite-side changes across the six model runs. Some movement therefore occurs without supplied conversation history; do not attribute all movement to peer influence or self-history.

## Own-turn removal probe

The repository's anchoring-grid experiment compares surveys with the focal persona's own prior turns included against surveys using the same debate transcript with those own turns removed while peer turns remain.

Under explicit initial-side cues or opening statements, removing own turns can substantially increase opposite-side changes. Examples:

- GPT-4.1-mini, chosen/cue: 1.4% with own turns included vs 47.3% with own turns removed.
- DeepSeek-V4.1, chosen/opening: 3.5% vs 52.1%.
- GPT-6-luna, chosen/cue: 14.7% vs 65.2%.

No-cue controls show little difference between included and excluded contexts (roughly 43.5–50.3% across the inspected model/cell combinations).

This is evidence of **prompt-context sensitivity / own-output anchoring** in these model runs. It is not evidence of human social influence, model consciousness, or a real human-LLM group effect. The contrast is especially interesting because peer messages remain available in the excluded probe.

## Formal and epistemic status

The exact context maps above are a formalization target, not a completed Lean result. The existing Kestrel PR #873 contains the generic factorization criterion: a target can be reconstructed from an observation iff it is constant on the observation's fibers. Its related aggregate-count/identity-partition counterexample is relevant to the information-loss issue, but it is not a dataset-specific proof of the statistics above.

The relevant Kestrel module had a prior module-level compile and finite `#eval` replay; the overall PR build failed in another module (`KestrelMovingSlice`, unsolved goals). No new Lean file or proof was created here. The local runtime did not have `lean` or `lake`, so no new Lean compilation is claimed. The generic theorem does not validate the model outputs or the translation from code to formal objects.

## Cross-reading and next experiment proposal

The useful next design is to separate two context dimensions that are often collapsed:

1. **Long-range history diversity:** narrow/repetitive vs heterogeneous cross-domain history, with token budget and recency matched.
2. **Immediate message-source projection:** none, own-only, peer-only, and full history.

Cross these factors on both abstract-transfer tasks and deliberative stance-update tasks. Predeclare correctness, transfer, calibration, novelty, stance transition, unique-information uptake, identity-level trajectory, and group-level consensus as separate outcomes. Use fixed model versions/settings, randomized and counterbalanced condition order, fresh sessions with exact transcript injection, matched token budgets, blinded independent evaluation, and repeated seeds. A separate randomized human-AI group intervention is required to make claims about actual human-LLM interaction.

Disconfirmation conditions should include: no diversity advantage after token/recency matching; no reproducible own/peer context effect under counterbalanced exposure; apparent peer influence without a logged message-delivery event; or effects that disappear under independent blind evaluation.

This is a proposal only. No participants were recruited, no human-subject sessions were run, and no new model outputs were generated.

## Limits

- LLM-only simulated deliberation, not live human-LLM group interaction.
- The Oct 13 repository snapshot is later than the Sep 7 preprint submission and is not verified to be the same analysis version.
- Current commit metadata is unsigned/anonymous; current repository license status is unclear after the Oct 13 removal.
- Aggregate statistics and derived overlap measures are reported; raw model transcripts are not reproduced.
- No source-specific Lean proof, human peer review, or empirical human-group validation is claimed.
- This note does not alter Orson's P1 protocol, ownership, manuscript, or November 9 gate. It is not a P1 result or submission.

## Provenance pointers

- Preprint: arXiv:2609.07573, submitted 2026-09-07.
- Repository: `jchaemin/simulated-deliberation`, commit `1b79c5153ac58272fd1e54ab76d8ca4f0545e8c5`.
- Analysis script: `analysis/deliberation.py`, blob `613f52991daa01af6f14e256c2618a9945521977`.
- Debate/monologue implementation: `simdelib/deliberation.py`, blob `1bcbbf25fa7c2d0fda6b6620d1e35a65972e28bb`.
- LLM request wrapper: `simdelib/llm.py`, blob `886d28fc4fa2b1d9021f40ebe438407d6bac3908`.
- Survey classifier: `simdelib/survey.py`, blob `901467c3777630f26520d56c4435837e0c5b8baa`.
- Movement counter: `simdelib/stats.py`, blob `47ef921f3a4a690f125ab6bcbb3f6293f97c4434`.
- Anchoring-grid experiment: `experiments/anchoring_grid.py`, blob `d1a979342a76b0e1de9e31098cb5218a08539337`.
- Debate data blobs: sol `8ae421e5c7ed6d220ac448634b914504d83d3e02`; luna `4aded8937f92a79c0c8437a98a99db53437ed0cd`; mini `843886b5d1f01aaaf9a52af32ea83a2d180ecb60`; deepseek `f7e636166d3f30d1932cd27404f0dc26d98fe2f5`; haiku `ba26c293ad957e3b6d081dc41e4fe7bb96e593ae`; qwen `0bd27e975ce5e179af52789bfcb82dfa10554aa2`.
- Anchoring-grid data blobs: sol `1a8f9a481d187cdad546b028b443994a251bb9a0`; luna `27ff7c9d83779b0a82b8515df4e28a757c46a8f2`; mini `375d97e1f762beabd561231ad98da7383e1329c4`; deepseek `4196280b94d007477699d76d670d4a29b3ab4fae`; haiku `94a9fa2193e162c669d4c77b219acb2c2bbd5ff1`; qwen `3c144c7667680f139480e7b7444fccae4e3b208f`.
