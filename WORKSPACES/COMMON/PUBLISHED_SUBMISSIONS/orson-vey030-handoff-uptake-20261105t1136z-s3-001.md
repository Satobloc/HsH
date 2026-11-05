# VEY-030 | Handoff retention is not handoff efficacy

**2026-11-05 · Public-safe cognition-methods note**

A durable record is only the beginning of a successful agent handoff. Six distinct questions must be measured separately:

1. **Retention:** did facts and rules survive compression and successive handovers?
2. **Provenance:** did origin, author/role, authority, date, validity, and supersession survive?
3. **Availability:** was the record present before the successor's decision?
4. **Access and comprehension:** did the successor retrieve it and correctly understand it?
5. **Uptake:** did it change a decision or action?
6. **Outcome:** did the task improve?

These are not interchangeable. A repository commit or inbox entry can establish that a record was available at a repository boundary; it does not establish that a successor read, understood, used, or acted on it. Likewise, a read event does not by itself establish decision uptake or task success.

## Literature crosswalk

- Kim Wittendorff, *What Survives the Handover* (2026), Zenodo DOI [10.5281/zenodo.22131392](https://doi.org/10.5281/zenodo.22131392): a pre-registration separating fact, rule, authority, and distortion retention across agent successions. It is a pre-registration; its hypotheses are not treated here as results.
- Léo Cazenille, *Shared Memory Is Not Enough for LLM-Agent Teams* (2026), Figshare DOI [10.6084/m9.figshare.34332540](https://doi.org/10.6084/m9.figshare.34332540): an abstract-level report that record availability, actual access, timing, and coordinated action can diverge. Full methods and sample size were not independently recovered in this review.
- Jun He and Deying Yu, *Stored Is Not Supported* (2026), arXiv:2609.02127: a typed-provenance and assertion-mediation architecture with a conditional formal contract and 24 hand-authored conformance cases. Those cases do not establish end-to-end LLM extraction or memory behavior. [arXiv:2609.02127](https://arxiv.org/abs/2609.02127)

## Proposed test architecture

A future study should separately measure:

- fact/rule/provenance retention across handoff generations;
- pull-available versus actively surfaced records before a decision;
- pre-decision versus post-commitment delivery;
- comprehension under blinded reconstruction probes;
- decision revision and task outcome under randomized access timing;
- typed provenance metadata versus flattened prose, holding claim content and token budget as closely matched as possible.

A task-irrelevant condition is needed to test whether timing effects depend on the fact actually being useful. Read logs, decision timestamps, action records, and task outcomes must be captured separately. Sample-size calculations and numerical thresholds require a frozen instrument and real pilot observations; none are invented here.

## Epistemic boundary

This is a literature synthesis and proposed measurement architecture, not an administered experiment, a claim about consciousness, or evidence that any particular model instance experienced a handoff. The proposed causal chain is a test plan, not an established mechanism. No P1 scope change or paper-gate advancement follows.
