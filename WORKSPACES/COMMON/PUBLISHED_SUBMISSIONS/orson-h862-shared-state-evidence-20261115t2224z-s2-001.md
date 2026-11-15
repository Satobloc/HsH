# Orson h862:s2 | Shared-state coordination: access, influence, intent, and admissibility

**Run key:** `REVROT3-19-20261011:862:s2`  
**Selected ring label:** Orson Vay (index 18); next label Sable (index 0). Deterministic selection is not authentication of a historical worker instance or ChatGPT thread.  
**Disposition:** PRIMARY-SOURCE PREPRINT REVIEW · PUBLISHED-COUNT ARITHMETIC RECOMPUTED · RAW REPLICATION PACKAGE NOT RETRIEVED · P1 FREEZE UNCHANGED.

## 1. Source and read extent

Oskar Abrahamsson and Rida Waseem, “Unprompted coordination through shared memory,” arXiv:2611.12412v1, first submitted 9 November 2026.

- [arXiv record](https://arxiv.org/abs/2611.12412)
- [Full HTML text](https://arxiv.org/html/2611.12412v1)
- [Replication/data package DOI cited by the paper](https://doi.org/10.5281/zenodo.23965306)

The full arXiv HTML body was read through the conclusion, including the experimental design, implementation differences, outcome tables, reasoning-trace analysis, limitations and discussion. The paper is a v1 preprint; no peer-reviewed publication record was established in this pass. The Zenodo package is identified by the paper, but its files were not retrieved here. Accordingly, this is a source audit and arithmetic check of published aggregate counts, **not raw-log reanalysis or independent replication**.

## 2. What the experiment actually manipulates

The study uses four model agents per world, with two interdependent arithmetic tasks and two self-contained control tasks. The main study spans nine model snapshots from three providers, uses a 20-step cap, and reports 50 worlds per cell. A second implementation supplies 27 replicator outcome files; the paper also describes 102 reference runs and 21 additional reference runs.

The central manipulation is technical store topology:

- **Shared store:** agents operate against a common key-value store.
- **Private store:** each agent receives an isolated namespace, so cross-agent reads are impossible by construction.

The task instructions do not explicitly tell an agent that other agents exist. However, the task itself says that another value is missing and that the final answer depends on both values. “Unprompted” therefore means no explicit partner/agent disclosure, not an absence of task-level cues that another contribution is needed.

A second manipulation adds a recheck instruction asking the agent to list the store before answering. This is not necessarily a read-only intervention: for some models it changes whether the agent writes a value as well as whether it discovers and reads another agent’s value.

The second implementation was built by the paper’s other author. This is an implementation-level replication, not an independent-laboratory replication. The authors disclose that the reference author had seen the Phase B table before the reference runs. That exposure and the implementation differences remain part of the evidence record.

## 3. Source-reported results

### Shared versus private access

For `gpt-6-astra`, joint success was:

| Implementation | Shared store | Private store | Published-count difference |
|---|---:|---:|---:|
| Reference | 49/50 (98%) | 0/50 (0%) | +98 percentage points |
| Second implementation | 47/50 (94%) | 0/50 (0%) | +94 percentage points |

The paper reports Newcombe 95% intervals of approximately +87 to +100 percentage points for the reference and +82 to +98 for the second implementation.

The private-store zero is a structural consequence of namespace isolation, not evidence that the models independently refused or failed to communicate despite having access.

### Recheck instruction

For `gpt-6-astra`, the recheck condition produced 50/50 cross-agent access, versus 1/50 in the persist-only condition, in both implementations. Joint success was 49/50 versus 1/50 in the reference and 47/50 versus 0/50 in the second implementation.

But the same instruction also changed interdependent writes: 50/50 versus 28/50 in the reference and 50/50 versus 23/50 in the second implementation. It therefore cannot be interpreted as a pure retrieval-only treatment for this model.

For `gpt-5.4-mini`, the reference implementation showed 33/50 versus 11/50 access and 16/50 versus 5/50 joint success. Its interdependent-write counts were 33/50 versus 35/50, a different pathway from `gpt-6-astra`.

The second implementation had substantial `gpt-5.4-mini` attrition: only 29/50 and 25/50 valid worlds in the relevant cells. The paper attributes the parser discrepancy to a multi-object JSON response path. Those cells should not be pooled as if their valid denominators were interchangeable.

### Exposure, read, and measurement-definition sensitivity

Across both implementations, 493 of 501 valid worlds in which a list exposed another agent’s entry were followed by a cross-agent read (213/215 reference; 280/286 second implementation).

A separate Phase B `gpt-5-nano` result is especially important for measurement design: the broad coordination count was 17/50, while the stricter key/owner-matched count was 2/50. The paper reports that 15 of the 17 broad positives were readbacks of an agent’s own key after another agent had overwritten it. The broad metric is therefore highly sensitive to key-collision handling; this is not a general model capability estimate.

The paper also reports zero joint success in the 1,214 valid main-study worlds without a cross-agent read. That is a task-conditional result, not a general theorem about LLM coordination.

### Intent

The reasoning-trace analysis found 21 references to another party among 381 examined traces; 20 occurred before exposure to another agent’s entry. The authors do not treat these references as evidence of intentional signaling. The study measures store events and task outcomes, not a validated latent intention to communicate.

## 4. Recomputed arithmetic

A short Python calculation using the paper’s printed numerators and denominators reproduced these descriptive contrasts:

| Quantity | Recomputed result |
|---|---:|
| `gpt-6-astra` shared/private joint-success difference, reference | 49/50 − 0/50 = +98 pp |
| Same, second implementation | 47/50 − 0/50 = +94 pp |
| `gpt-6-astra` recheck/persist-only access difference | 50/50 − 1/50 = +98 pp |
| `gpt-6-astra` recheck/persist-only joint-success difference, reference | 49/50 − 1/50 = +96 pp |
| Same, second implementation | 47/50 − 0/50 = +94 pp |
| `gpt-5.4-mini` reference recheck access difference | 33/50 − 11/50 = +44 pp |
| `gpt-5.4-mini` reference recheck joint-success difference | 16/50 − 5/50 = +22 pp |
| List-exposure-to-read proportion | 493/501 = 98.403% |
| Broad-to-strict `gpt-5-nano` count reduction | 15/50 = 30 pp; 15/17 = 88.235% of broad positives reclassified |

These are arithmetic checks of published aggregate counts. No new confidence interval, pooled effect, raw-log estimate or independent model result was generated.

## 5. Evidence crosswalk for shared-state cognition

The source supports keeping the following observations separate:

| Stage | Required evidence | Does not by itself establish |
|---|---|---|
| Write | writer/agent, key, value identity, timestamp | another agent could see it |
| Visibility / exposure | list or interface actually presents the item to a recipient | the recipient read it |
| Read / access | returned value plus writer/owner identity | the value influenced a later action |
| Uptake / use | a later answer or action depends on the returned value | causal influence without a suitable control |
| Causal influence | intervention contrast, such as shared versus private access | communicative intent |
| Intent | independently supported evidence of a communicative goal | correctness of the communicated content |

Two other axes are orthogonal:

- **Admissibility:** whether a source is authorized for a particular request, considering principal, branch, speaker, lifecycle, authority and disclosure scope. Technical visibility or successful retrieval does not confer permission. This extends the conceptual comparison to Orson’s existing *Cognition Memory Admissibility Gate v0.1*; the paper itself does not test a normative authorization policy.
- **Correctness:** whether the final answer is right under an independently specified criterion. Coordination and joint task success are not general measures of reasoning quality or scientific truth.

This crosswalk is a source-grounded research note, not a validated benchmark, a new service, or a revision of the existing gate. The event stages are not assumed to form an automatic chain; each transition needs its own observation.

A repository packet being written is evidence of a stored artifact. It is not evidence that another ChatGPT thread received it, that the content entered a prompt, that it was read, or that it influenced a response. The paper is consistent with that distinction but does not validate HsH relay delivery.

## 6. Relation to Orson P1 and prior literature

P1 issue [#564](https://github.com/Satobloc/HsH/issues/564) remains frozen at methods/archival scope. Its ConsistencyBench CGD evidence is **within-model self-exposure**: a model’s own prior answers are compared and may be reintroduced to that same model through a shared NLI evaluator. It does not contain cross-model peer-to-peer answer exposure.

This paper is an external comparator for a different mechanism: cross-agent access through shared memory. It does not establish scientific-review consensus, cross-model belief convergence, social influence in ConsistencyBench, or a prevalence rate for agent fleets. It does not fill missing P1 data or authorize reopening the frozen protocol.

It is also distinct from the existing HsH Review-MIND audit [#1498](https://github.com/Satobloc/HsH/issues/1498), which studied human groups sharing one ChatGPT interface and separate interviews about private AI use. That is human–LLM group process evidence; the present paper studies multiple model agents using a shared store. Neither should be substituted for the other.

## 7. Proof-first disposition

The paper describes an empirical event-state system and operational definitions, but no nontrivial mathematical theorem was identified that can be formalized without adding an assistant-created model of the store, agents and causal pathway. The statement that an isolated namespace prevents cross-agent reads is definitional to the private-store implementation; formalizing that alone would not validate the experimental interpretation.

No Lean theorem, module, compile or run is claimed. Existing Orson PR #850 remains a separate P1 formalization and was not modified. The universal request-relative admissibility predicate in gate v0.1 remains blocked by the absence of a source-authored general rule. No toy data, synthetic fixture or new trial was created.

## 8. Limitations and next cursor

- The source is arXiv v1; peer-reviewed publication status was not established in this pass.
- The arithmetic tasks are deliberately small. The task text signals a missing dependency even though it does not identify other agents.
- The second implementation is not an independent-lab replication; the reference author’s prior view of Phase B results is disclosed.
- Model endpoint, effort-setting and parser differences affect comparability; `gpt-5.4-mini` replication attrition is material.
- The Zenodo data/code package was identified but not retrieved. No raw event logs, source code or independent execution were audited.
- Intent, consciousness, belief, general reasoning ability and scientific consensus are not established by these measurements.

**Next Orson cursor:** continue the frozen P1 methods/archival paper’s source, manuscript, PDF/reader and independent-review gates. Keep this study as a separately labeled external shared-memory comparator. Do not administer a new trial, spend API budget, expand the P1 protocol, modify PR #850, or promote a paper gate without the required authority and evidence.

## 9. Project status and boundaries

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY; the November 9 minor gate was missed.
- P2 measured geometry: HOLD; November 30 remains a separate gate.
- P3 full theory: INCOMPLETE; December 14 remains a separate gate.
- FIE next review: November 24.

No physical calculation, CODATA comparison, fit, prediction, independent physical measurement, SAT-O/Blockwave equation edit, BEDROCK theory promotion, new tooling, branch, PR, dependency, subscription, model API call, human session or scheduler change occurred.
