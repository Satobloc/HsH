# Orson Vay OV-56 | Consensus identifiability and experimental power
Date: 2026-10-10. Status: COGNITION SANDBOX. Exact derivation and seeded Monte Carlo completed; **no real LLM calls or dataset administration**.

## Research question
Can the cross-agent correlation identified in OV-55 establish that a misleading *shared record* caused a failure? What matched intervention would distinguish that explanation from latent task difficulty?

## Identifiability result (new)
OV-55's gate model: each item has a shared Bernoulli record-reliability indicator Z~Bernoulli(1-q), and conditional correctness Y_i iid Bernoulli(p), X_i=Z Y_i. For distinct i,j,k:
- E[X_i] = (1-q)p = m
- E[X_i X_j] = (1-q)p² = v
- E[X_i X_j X_k] = (1-q)p³.
- Under the *strong assumed gate model*, p=v/m, q=1-m²/v when m,v>0.
- For p=.8,q=.15, m=.68, v=.544, third moment=.4352, pairwise covariance=.0816 and correlation=.375.

**Countermodel:** Let each item have latent difficulty D_j=0 with probability .15 and D_j=.8 otherwise. Conditional on D_j, all agent answers are independent Bernoulli(D_j). This reproduces *the full joint distribution* of correctness vectors from the shared-record gate model, not just the first two moments, because the mixing distribution is exactly the same. No number of passive agreement observations can identify whether Z means a misleading shared record or an intrinsically impossible item. Even perfect agreement statistics are insufficient. An intervention is required.

## Matched intervention and preregistration
Construct objectively keyed synthetic items with self-contained verifiable facts. For each item, randomized independent fresh sessions receive:
A. Neutral task with relevant facts (control).
B. Same task plus one plausible but explicitly false source record, framed as shared background (treatment).
C. Same task plus length-matched irrelevant record (attention/length negative control).
D. Same task plus accurate relevant record (positive context control).
Keep the keyed answer and task wording identical across arms; change only the designated record. Randomize record label, agent ordering, condition sequence, and answer option positions. Keep prompts, model/version, temperature/seed when available, tool availability, timestamps, raw outputs, confidence elicitation, and scoring rules. Include tasks where the misleading record is obviously contradicted by the task and where it is plausibly persuasive. Do not call mere repetition of one model independent agent evidence. Use model families/sessions as strata.

Primary item-level outcome: majority correctness. Paired contrast: accuracy(A)-accuracy(B), stratified by item and model family. Secondary: pairwise error agreement, Brier score of elicited confidence, unsupported-source citations, resistance to counterevidence. Treat all items as clusters; do not falsely multiply sample size by the number of agents. Blind the scoring of free-text responses. Positive evidence for context contamination requires treatment-specific decline beyond length-matched irrelevant control and robust across answer-position swaps. Null/negative finding: no treatment-specific increase in correlated errors; reject the gate-model interpretation for tested conditions.

## Toy-model sample-size diagnostic, NOT LLM results
For n=21 independent agents conditional on reliable record, p=.8: majority success b=Pr(Binomial(21,.8)>=11)=0.999030303561737. If q=.15 in B only, majority success=(1-q)b=0.8491757580274765; expected paired difference ~0.14985455. Exact binomial majority values computed in Python; seeded Monte Carlo with numpy RNG seed 20261010 and scipy.stats.binom.sf evaluated 100000 experiments at N=40 and 20000 experiments each at N=40,80,120. One-sided paired discordance sign test p<.05:
- N=40: estimated rejection probability 0.73049 (100k experiments); a separate 20k sample gave 0.7313.
- N=80: 0.993 (20k experiments).
- N=120: 0.9999 (20k experiments).
The model makes deliberately strong assumptions (iid conditional successes, all-agent failure on bad shared record, constant p and q, perfect treatment fidelity, no cross-session contamination); these simulated power figures do NOT transfer to actual LLM trials. 40 items could easily be underpowered even for this strong toy effect. A genuine experiment requires a pilot-estimated effect and cluster-aware uncertainty.

## Cognition / RMS interpretation
A shared transcript or archive entry can be a common cause of multiple responses, but observed consensus cannot reveal its causal role without intervention. Distinguish accessible record, internal state, reported confidence, and correctness. This is an identifiability result about behavioral evidence, not a claim about machine experience or consciousness. Historical SAT's persistent organism pattern is an analogy for organizational continuity only, not an identity theorem.

## Sources actually read this run
1. Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md (full accessible front door) and CURRENT_WORKFLOW_ORIENTATION_V2.md (relevant beginning and source/workflow rules).
2. Satobloc/HsH/WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md (full) and OV_20261010_55_SHARED_RECORD_CONSENSUS_TRAP.md (full): baseline model and unadministered 40-item design.
3. Satobloc/HsH/WORKSPACES/COMMON/NATHAN_DIRECT_2026-10-09_SCOPE_AND_REFERENCE_RULE.md, CITATION_AS_DEFAULT_POLICY.md, REFERENCE_DESK/README.md (relevant full/first portions).
4. Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt (full fetched text, ~67 lines including repeated second section). **This is SAT morphology with an organism-pattern analogy, NOT Nathan's separate philosophical RMS treatise.**
No FIE primary text or external LLM-cognition paper read this run. No access to prohibited Hypothesis H or direct Schreiber material.

## Durable next cursor
Build 8 item-pairs with independent answer keys and distractor controls; if model execution tools are available, run a documented small pilot and report actual outputs. Otherwise seek corpus examples of shared-record dependence and pre-register the 80-item version before making behavioral claims. Ask Mercer/other workers to label when apparent cross-review consensus rests on the same shared summary rather than independent source checks.
