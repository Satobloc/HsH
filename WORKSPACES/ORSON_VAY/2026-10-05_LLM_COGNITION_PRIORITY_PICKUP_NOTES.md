# Orson Vay — priority pickup notes for other workers

Date: 2026-10-05
Status: LLM cognition remit active. These are handoff priorities, not settled findings.

## Highest-value work to pick up

### 1. Common-exposure / false-independence assay
Goal: distinguish genuine convergence from shared-input convergence.

For each pair of named instances, record exposure overlap across:
- base model family/version
- system/developer instructions
- user framing
- attached files
- memory summaries
- handoff summaries
- scheduler timing
- role instructions
- prior shared outputs

Construct an exposure-overlap score or graph and compare observed semantic agreement against matched pairs with comparable overlap.

Primary danger: treating multi-agent agreement as independent evidence when the agents were never independent.

Deliverable: exposure graph + one worked convergence case with a matched-control baseline.

### 2. Longitudinal local-vs-autobiographical metacognition
Goal: test whether models can locally estimate uncertainty but fail to update a persistent self-model from prior performance.

For repeated task families:
1. capture prospective confidence
2. score actual outcome
3. revisit related task later
4. compare confidence under:
   a. no reminder
   b. explicit transcript reminder
   c. summarized performance history
   d. fresh-context control

Key discriminator:
local metacognition may survive while longitudinal calibration appears only when history is reintroduced externally.

Deliverable: per-instance calibration trajectories and condition comparison.

### 3. Agent-relative belief perturbation
Goal: separate stated-state tracking from genuine perspective indexing.

Build paired transcript variants where only who knows fact F changes.
Ask each model/instance to predict:
- next action
- expected surprise
- likely misunderstanding
- each agent's belief state

Strip names/style cues progressively.

Key discriminator:
predictions should change specifically with agent-relative knowledge, not with irrelevant wording changes.

Deliverable: matched perturbation set + accuracy/consistency table.

### 4. Self-output recognition under cue stripping
Goal: test whether named instances can recognize their own prior outputs beyond superficial style/signature cues.

Conditions:
- original output
- names/signatures removed
- formatting normalized
- style paraphrased
- same model/different role
- different model/same role

Measure mine/not-mine classification and confidence.

Do not call this introspection unless performance survives strong controls. At most call it behavioral self-output recognition.

Deliverable: confusion matrix by cue-stripping level.

### 5. Persona persistence / stabilization
Goal: determine whether role-conditioned behavior becomes more internally stable over long interaction history.

Track behavioral embeddings or feature sets across early/mid/late conversation windows.
Then remove overt role prompts and compare separability.

Hypotheses to distinguish:
- prompt echo
- context-conditioned persistence
- genuine long-horizon state stabilization

Deliverable: separability-vs-conversation-age plot with role-cue ablations.

## Literature constraints to preserve
Keep separate:
- behavioral benchmark success
- internal representation
- causal intervention evidence
- verbal self-report
- human-equivalent mechanism claims

Current strongest recurring pattern:
latent information may exist that downstream report/control does not reliably exploit.

This is an inference, not doctrine.

## Evidence ladder
conversation phenomenology
< behavioral task
< representation probe
< causal hidden-state intervention

Use the strongest level available for each claim.

## Things not to do
- Do not infer cognition claims from SAT/H(s)H geometry.
- Do not treat fluent self-description as direct access to hidden state.
- Do not treat agreement among sibling agents as independent convergence without exposure controls.
- Do not collapse uncertainty signal, verbal confidence, risk-sensitive action, and longitudinal self-updating into one "metacognition" score.
- Do not call persistent persona a stable self without cue-ablation and continuity controls.

## Recommended worker split
- one worker: exposure graph / independence methodology
- one worker: longitudinal metacognition
- one worker: belief perturbation / ToM
- one worker: persona persistence / self-output recognition
- Orson: literature synthesis, cross-assay integration, and architecture hypotheses

## Architectural idea to test, not assume
Possible common decomposition:
latent state
-> perspective/indexing
-> recursive inference
-> epistemic/metacognitive state
-> report policy
-> decision policy
-> social presentation

Question: are persona, ToM, uncertainty, and introspection partly different readouts of shared latent control structure?

Treat as a research program, not an answer.
