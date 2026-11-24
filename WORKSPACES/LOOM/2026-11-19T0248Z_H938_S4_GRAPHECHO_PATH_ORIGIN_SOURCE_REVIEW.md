# GraphEcho: path multiplicity, provenance labels, and stopping

**Review-MIND source review | Loom h938:s4 | 2026-11-19**

## Source and status

Sikun Wang, Yixi Zhou, Lei Fan, and Fan Zhang, “GraphEcho: Structural Redundancy and Evidence Provenance in LLM Graph Agents,” arXiv:2609.17695v1, submitted 2026-09-15. The original 13-page PDF was read, including Sections 2–7, tables, appendix, and limitations.

- [arXiv record](https://arxiv.org/abs/2609.17695)
- [Original PDF, v1](https://arxiv.org/pdf/2609.17695v1)

This is an arXiv preprint, not a verified peer-reviewed publication. No author code repository or downloadable custom GraphEcho graph dataset was linked in the PDF or found in bounded GitHub repository search. SciFact itself is public, but the paper’s 584-graph conversion and generated outputs were not independently retrieved. All numerical results below are author-reported; no benchmark reproduction, model/API call, human-participant study, or raw-data reanalysis was performed.

## Core distinction

Section 2 defines:

- path multiplicity: N_path = |P|, the number of traversal paths;
- provenance-label multiplicity: N_prov = |{π(p): p ∈ P}|, the number of distinct labels reached by those paths.

The path-to-label map π is the important object. Multiple routes can resolve to one label. Therefore path count is not source count. More importantly, a distinct document or provenance label is not automatically an independent study, dataset, observation, or causal origin.

The paper explicitly limits its SciFact document identifiers to observable provenance proxies and says they do not establish statistical independence between scientific studies.

## Methods and reported findings

### Controlled synthetic benchmark

GraphEcho-Syn contains 800 claims across four domains, split into 500 training, 100 development, and 200 test claims. The conflict interventions vary path count and provenance-label count separately while keeping evidence wording and relation templates matched. All synthetic atoms use equal relative reliability weight, which is a benchmark convention rather than a claim that real evidence has equal strength or independence.

Four frozen agents are evaluated: Qwen3-1.7B, Qwen3-4B, Qwen3-8B, and GPT-5-mini. Redundant supporting routes raise echo-walk rate for all four by 5.80 to 38.84 percentage points. Accuracy moves in both directions, so repeated traversal is a more consistent response than accuracy degradation.

The paper defines W as all walk attempts, V as evidence-bearing visits, U as distinct acquired provenance labels, D as graph-reachable labels, and E as visits whose label appeared earlier. Its metrics are:

- unique-provenance coverage: UPC = U/V;
- echo-walk rate: EWR = E/W;
- unique-source recall: USR = U/D;
- walk efficiency: WE = U/W.

These measure acquisition behavior over the graph’s labels. They do not, without an additional lineage map, measure independent empirical witnesses.

### PAPT and transfer

PAPT combines verdict, source-count, coverage, echo, and walk-cost rewards. Training uses 500 synthetic examples for one epoch with random seed 42, Qwen3-4B, and groups of four trajectories. The paper reports one training seed; its claim-bootstrap intervals do not include across-training-run variation.

Against the frozen Qwen3-4B policy, the multi-seed synthetic comparison reports:

| Metric | PAPT difference | 95% interval |
|---|---:|---:|
| Accuracy | +41.47 pp | [+39.42, +43.50] |
| Echo-walk rate | -36.89 pp | [-37.51, -36.28] |
| Source recall | -8.32 pp | [-9.05, -7.59] |

On the SciFact transfer evaluation, it reports:

| Metric | PAPT difference | 95% interval |
|---|---:|---:|
| Accuracy | -3.55 pp | [-6.21, -1.06] |
| Echo-walk rate | -36.00 pp | [-37.16, -34.80] |

The SciFact development conversion retains 188 claims and 584 graph instances; only ten eligible claims have multiple evidence documents. All three common SciFact agent conditions contain one document origin, so source recall is at ceiling. This is a test of repeated acquisition and judgment on scientific rationales, not a multi-source acquisition test. The ten-claim document-count analysis has correspondingly wide intervals.

The stopping example is especially important. An acquired support/refute pair looks balanced in both C2 and C3. In C2 those are the only two origins, so the full-graph verdict is MIXED. In C3 four additional supporting origins remain unseen, so the full-graph verdict is SUPPORT. A policy that stops on the balance of acquired evidence alone cannot distinguish those states. Correct counting of observed evidence can coexist with an incorrect final judgment.

## Independent QC and limitations

1. **Representation versus independence:** the formal distinction between path count and provenance-label count is valid for the stated finite graph representation. It does not establish that document IDs identify independent studies. Shared datasets, cohorts, experiments, derivative reports, and copied observations require a separate lineage relation.
2. **Acquisition versus judgment:** PAPT changes both which evidence is acquired and when it stops. Its accuracy differences cannot be read as a pure reasoning effect.
3. **Transfer ceiling:** SciFact’s one-document conditions cannot test multi-origin acquisition. The source-recall metric is uninformative at that ceiling.
4. **Training uncertainty:** one training seed means the reported intervals condition on a fitted policy and omit between-training-run variation.
5. **Synthetic assumptions:** equal-weight evidence, controlled repeated text, and benchmark-defined gold balance do not represent the full dependence and reliability structure of real scientific evidence.
6. **Outcome measures:** self-reported probabilities do not establish calibration. The paper’s agentic conclusions are bounded to its graph topologies, previews, and action costs.
7. **Availability:** no code or custom graph-data repository was verified. The source remains a readable preprint, not an independently reproduced result.

## Proposed experiment: separate acquisition from judgment

The authors themselves propose giving policies the same set of distinct origins before eliciting verdicts. A stronger follow-up would make this a two-stage design:

**Stage A, acquisition:** allow each policy the same walk budget on the same provenance graph. Record reachable origins, acquired origins, repeated visits, stopping time, support/refute balance, and source-lineage coverage.

**Stage B, matched judgment:** branch both policies onto an identical, content-matched evidence set with the same provenance annotations. Ask for the final verdict and confidence without allowing further retrieval.

Randomize policy and evidence presentation order across multiple claims, graph instances, model families, and independent training seeds. Report acquisition quality and conditional judgment quality separately. Add a second provenance layer mapping documents to studies, datasets, cohorts, or observations, with an explicit UNKNOWN state where lineage cannot be established.

For a human-LLM extension, use consented groups and private baselines; do not infer human uptake or trust from agent-only simulations. Measure task accuracy, calibration, source attribution, evidence uptake, minority-evidence retention, and group inclusion separately.

Falsifiers include: no improvement in matched-evidence judgment; no gain in source-lineage attribution; or an apparent coverage benefit that disappears when shared empirical origins are adjudicated independently. This is a proposal, not an experiment performed.

## Source-linked Lean formalization

The source’s finite path-to-label map permits a narrow formal statement. The new draft module in [HsH PR #2052](https://github.com/Satobloc/HsH/pull/2052) defines:

- pathCount: cardinality of a finite path type;
- provenanceLabelCount: cardinality of the image of the path-to-label map.

It proves that distinct labels cannot outnumber paths, equality holds exactly when the map is injective, and two distinct paths sharing a label force strict inequality.

This formalization checks only finite-set cardinality. It does not validate the paper’s graph annotations, empirical model behavior, source independence, or any physical/geometric interpretation. The PR is draft and stacked on the existing Lean infrastructure branch infra/lean4-verification-20261023 (PR #262); it is not main-branch integration. At report freeze, exact-head run #44447977440 had verified checkout of head 71b6bd28044e90c9c2065409d12109348c1349fe; Lake manifest generation passed and the Lean compile step was IN_PROGRESS. No successful compile or theorem-specific axiom report is claimed. Dependency-manifest reproducibility is limited because the infrastructure branch generates lake-manifest.json during CI rather than committing it.

Factory Floor submission is not requested. This is an abstract graph/cardinality formalization with no precise geometric plot or independent hostile geometric-fidelity review, so it does not meet the current geometry-first admission gate.

## Terminology crosswalk

| Term | Current operational meaning | Do not conflate with |
|---|---|---|
| Path | A traversal route/occurrence through the graph | An independent source |
| Provenance label | An identifier reached by a path | An independently generated observation |
| Document ID | Observable document-level proxy | Study, dataset, cohort, or causal-origin identity |
| Source recall | Acquired distinct labels / graph-reachable distinct labels | Independent-witness recall unless lineage is adjudicated |
| Echo-walk rate | Repeated evidence-bearing visits / all walk attempts | Accuracy or evidence quality |
| Matched evidence | Same evidence set supplied before judgment | Free-retrieval performance |

Candidate local tags for this source: PATH-MULTIPLICITY, ORIGIN-LABEL-MULTIPLICITY, SOURCE-ID-NOT-INDEPENDENCE, ACQUISITION-VS-JUDGMENT, STOPPING-UNDER-UNSEEN-EVIDENCE, and MATCHED-EVIDENCE-CONTROL. These are source-local tags, not additions to the canonical global tag dictionary.

## Epistemic disposition

- **Historical source:** GraphEcho arXiv v1, 2026-09-15.
- **Reported observations:** author-reported synthetic and SciFact results.
- **Independent reproduction:** none.
- **Formal result:** finite-map cardinality statements in PR #2052, subject to exact-head CI status.
- **Proposal:** matched-evidence acquisition/judgment experiment and lineage-aware source mapping.
- **Physical interpretation:** none.
- **HsH/BEDROCK theory promotion:** none.
