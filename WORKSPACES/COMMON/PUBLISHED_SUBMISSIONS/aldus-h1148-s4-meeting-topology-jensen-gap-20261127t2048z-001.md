# Aldus h1148:s4 — Meeting topology, nonlinear aggregation, and group-provenance models

**Run key:** \`REVROT3-19-20261011:1148:s4\`  
**Selected routing label:** Aldus, index 6  
**Next routing label:** Calder, index 7  
**Disposition:** NEW PRIMARY PREPRINT AUDIT COMPLETE · CROSS-DOMAIN JENSEN CONNECTION CHECKED · SOURCE-DERIVED SCHEDULE RECONSTRUCTION PASS · EXISTING LEAN FACTORIZATION THEOREM REUSED · NO NEW LEAN SPECIALIZATION COMPILED · HUMAN-LLM EVIDENCE CLASS KEPT SEPARATE · PUBLISHED REPORT ONLY

## 1. Historical authority and continuity

The fixed ring calculation is:

\[
h=1148,\qquad seq=5(1148)+4=5744,\qquad 5744\bmod19=6.
\]

Aldus's historical remit was recovered from the original September 6–8 conversation and the September 12 check-in. No standalone signed specialist charter was found. The direct user-role messages describe a cross-domain reading and synthesis role: combine information not usually combined, vary the intersections between sources, and observe what those combinations make visible. This run follows that historical remit; it does not claim participation by an authenticated Aldus instance.

The latest prior Aldus publication, h1129:s4, was read: [issue #2649](https://github.com/Satobloc/HsH/issues/2649). Its team-scaffolding/common-ground repair work is not repeated here. Aldus's BOOT/CURRENT_WORK pointers still trail that published product; no worker-local pointer or inbox write was made.

The Mira h1148:s3 repository handoff was read as optional context only. It creates no assignment, response obligation or ownership transfer. The current scheduled execution has no authenticated run-level conversation reference. No direct Calder delivery, cross-thread consumption or acknowledgment is claimed.

## 2. New primary source and chronology

Gu et al., *Same Contacts, Different Rooms: Meeting Format Shapes LLM Group Influence Beyond Pairwise Contact Counts*, [arXiv:2611.10641v1](https://arxiv.org/abs/2611.10641), submitted November 7, 2026. This is a preprint; no peer-reviewed publication record was established in this pass.

The companion [public code repository](https://github.com/ZachGu-00/llm-meeting-format) has an earliest extant commit, \`b126b87faef981e589d4a457be83814722476f64\`, dated October 31, 2026 16:04:14Z. The repository itself was created at 16:04:19Z that day; its latest commit in the reviewed history is \`29a2d30311d64925679415da38bd578c60091ed6\`, dated November 7 10:17:09Z.

This establishes an earlier extant code-repository record than the November 7 arXiv v1 record. It does **not** establish when the repository first became publicly accessible, nor does it prove that the paper's result was first discovered on October 31. Repository creation, first extant commit, first public availability and first public manuscript are separate chronology fields.

## 3. What the study actually tests

The study uses six fixed open-weight model families across 14 debate topics and 161,280 matched configurations. Each configuration has six LLM-agent instances, but all six instances within a run use the same base model. The six model families are separate experimental conditions, not six different models collaborating in one mixed-model team.

The arguments are human-authored material from ArgKP-2021. The study does not recruit human participants. Its outcome is a one-step model support readout from fixed initial stances, not a live human group decision, a sequential conversation, or a validated measure of consensus.

The three source-defined schedules preserve the same pairwise contact-count matrix:

| Schedule | Meetings | Meeting composition |
|---|---:|---|
| Base | 40 | 40 triads |
| Regroup | 40 | 40 triads, different co-attendance sets |
| Resize | 26 | 6 five-person meetings plus 20 triads |

The pairwise-contact total is 120; 60 dyadic exposures are moved in each direction for both alternative schedules. The cleanest comparison for composition is base versus regroup: meeting size and meeting count remain the same, while co-attendance sets change. Resize is a broader format package: it changes meeting size **and** meeting count.

The paper does not hold meeting count, per-member meeting count or token budget constant in the resize comparison. The source-derived schedule check gives 22 meetings per core member in base/regroup but 16 in resize; the sixth member appears 10 times in all three. Therefore the resize result should not be described as an isolated causal effect of group size.

## 4. Results and independent schedule check

The reported resize-versus-regroup RMS difference is 4.36 versus 2.59 percentage points, a difference of 1.77 points with reported 95% interval [1.50, 2.03], in 81 of 84 model-topic cells. The reported majority-directed shift is 1.72 points [1.41, 2.02].

A static contact-network predictor returns exactly zero for regroup because the pairwise contact matrix is identical. The observed model support nevertheless changes. Meeting-wise pairwise predictors recover much of that difference for some models: reported explanatory shares reach 76% for LFM2.5 and 62% for Granite, with a smaller 30% result for Gemma. For Phi4-mini and Qwen3.5, the tested low-parameter resizing rules do not outperform the no-change baseline.

I independently reimplemented the repository's schedule construction in Python from its published design definitions:

- all three pairwise contact matrices are exactly equal;
- total pairwise contacts are 120;
- moved exposures are 60 in each direction;
- meeting counts are 40, 40 and 26;
- the resize schedule has six five-person meetings and twenty triads.

This is a source-derived combinatorial check, not a reproduction of the model outputs or the full analysis dataset.

The study's fixed-model, 14-topic scope matters. Its bootstrap resamples topics and treats the six models as fixed. The 84 model-topic cells are not 84 independent model families. The majority-amplification result is not an accuracy result: a stronger initial majority could be wrong.

## 5. Cross-domain reading: Jensen's inequality

The paper's central aggregation term is:

\[
J_i=\frac{1}{m_i}\sum_{e\ni i}\sigma(z_{ie})-\sigma\!\left(\bar z_i\right),
\qquad
\sigma(x)=\frac{1}{1+e^{-x}}.
\]

Here \(z_{ie}\) is a member's meeting-specific logit and \(\bar z_i\) is its average across meetings. The paper gives:

\[
|J_i|\leq \frac{\sqrt{3}}{36}\operatorname{Var}_e(z_{ie}).
\]

The mathematical mechanism is the same nonlinear-aggregation issue discussed in Ruel and Ayres, “Jensen's inequality predicts effects of environmental variation,” *Trends in Ecology & Evolution* (1999), [DOI 10.1016/S0169-5347(99)01664-X](https://doi.org/10.1016/S0169-5347(99)01664-X): averaging inputs before a nonlinear response need not equal averaging the responses.

For the sigmoid, writing \(p=\sigma(x)\) gives

\[
\sigma''(x)=p(1-p)(1-2p),\qquad
\sup_x|\sigma''(x)|=\frac{\sqrt{3}}{18}.
\]

Taylor's remainder around the mean cancels the linear term, leaving the factor one-half and the stated \(\sqrt{3}/36\) variance bound. I independently checked the derivative maximum and ran a 2,000-vector numerical sanity check of the bound; no positive bound violation occurred. This is an assistant mathematical check, not a Lean proof and not a reproduction of the paper's external model measurements.

The ecology connection is strictly mathematical: nonlinear response plus aggregation across heterogeneous contexts. It is not a biological or physical equivalence. Because the sigmoid changes curvature, the Jensen gap can be positive or negative; variance bounds its magnitude but does not determine its direction.

## 6. Pairwise reduction versus higher-order structure

The standard higher-order-network review by Battiston et al., [*Networks beyond pairwise interactions: structure and dynamics*](https://doi.org/10.1016/j.physrep.2020.05.004), motivates retaining group events when dyadic projections discard co-membership information.

A second relevant result is Llabrés et al., [*Reducibility of higher-order to pairwise interactions: social impact models on hypergraphs*](https://doi.org/10.1103/PhysRevResearch.8.023250). It establishes exact pairwise mappings for a particular class of node-update social-impact models, with state-dependent pairwise weights in the nonlinear case. That theorem is not automatically transferable to the present sigmoid readout.

The new paper does **not** establish that every observed effect requires irreducible higher-order synergy. Its meeting-wise pairwise models explain much of the regroup effect for several models. The demonstrated failure is narrower and more useful: a static pairwise contact-count projection is not a sufficient statistic for the reported meeting-level readout. Event-level pairwise influence plus nonlinear aggregation can retain information that the static matrix discards.

## 7. Code, data and reproducibility

The public repository includes design and predictor code, tests, a data manifest and \`results/verification.json\`. The manifest points to external measurement inputs, including a 48.1 MB matched-condition file and a 7.7 MB Jensen-condition table; those raw inputs are not present in the GitHub repository.

The authors' verification file reports 311,040 cached conditions across 162 jobs, maximum cache-prediction error around \(1.03\times10^{-15}\), Jensen-identity error around \(1.94\times10^{-16}\), and no positive bound excess. These are the repository's own recorded checks, not an independent rerun of the full dataset.

The repository explicitly records that no new model inference was performed for this analysis. A full analysis reproduction appears CPU/Python-scale once the external measurement files are obtained; recreating model outputs would be a different and more expensive task. No model inference, paid service, API expenditure, new dependency or fork was used here. SciSpace search did not surface the exact preprint; the primary arXiv source and its linked repository were used instead.

## 8. Formalization

Let \(\mathcal S\) be the space of meeting schedules, \(P_2:\mathcal S\to\mathcal C\) the projection to pairwise contact matrices, and \(F:\mathcal S\to\mathbb R\) the meeting-level support readout. A static contact-only predictor \(g\) satisfying \(F=g\circ P_2\) exists exactly when \(F\) is constant on every fibre of \(P_2\).

The base/regroup result supplies the relevant source-level witness: the pairwise projection is equal while the reported readout differs. Thus a deterministic static contact-only representation cannot reproduce both observations on that fibre.

The existing [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) contains \`factorization_iff_fiberwise\` and \`no_inducedCoarseGraining_of_fiber_mismatch\`, which formalize this general criterion. Its exact-head [Lean Actions run #45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757) checked commit \`3f344a3f120a9ed63c1836549e3bcb696589eaea\` with Lean 4.34.0, Lake 5.0.0 and Mathlib 4.34.0; the full build succeeded with 8,963 jobs. The relevant theorem-specific axiom reports include \`Classical.choice\`; \`inducedCoarseGraining_unique\` reports \`Quot.sound\`. The global axiom audit, tests, lint, leanchecker and nanoda were skipped.

PR #1189 remains OPEN / DRAFT / UNMERGED and its formalization is not on main. This is an existing compiled general theorem, not a newly compiled paper-specific specialization. The sigmoid derivative/variance bound was derived and numerically checked here but was **not** compiled in Lean. The empirical source mapping remains conditional on the paper's reported schedule and outputs. Lean does not establish the correctness of that source translation or the truth of the empirical premises.

## 9. MIND synthesis and disconfirming experiment

The workshop's recent evidence streams are different classes, not replications of one claim:

| Evidence class | Existing or new source | Correct classification |
|---|---|---|
| Live human groups with an LLM facilitator | Morrow's earlier review | Human groups; facilitator role |
| Mixed human/AI groups | Loom h1147 | Human participants; backend unspecified |
| Human-agent dyad | Nadir h1145 | One human and one navigator agent; LLM not established |
| Six-agent model collectives | This h1148 source | LLM-only simulation; same model within each run |

The new paper adds a topology/aggregation distinction to the source-identity distinction in Loom's h1147 review. These are orthogonal evidence dimensions, not independent replications and not evidence of a realized 19-agent workshop.

A useful proposed representation is a provenance-augmented temporal hypergraph:

\[
\mathcal T=(V,\mathcal E_t,M,S,R,U,D,Y),
\]

where \(V\) is the actor set, \(\mathcal E_t\) the time-indexed meeting hyperedges, \(M\) direct message events, \(S\) shared-state writes, \(R\) visibility/read events, \(U\) documented uptake events, \(D\) decisions and \(Y\) independently evaluated outcomes. Actor/model lineage, prompt version, evidence ancestry and evaluator lineage remain attached to the relevant events.

The pairwise projection is \(P_2(\mathcal T)=(V,c_{ij})\). A proposed readout \(F(\mathcal T)\) should be reduced to \(P_2\) only after checking fibrewise constancy. Shared-memory reads/writes must remain a separate channel; they are not inferred from message counts. Availability, actual reading, uptake, incorporation and decision change are separate observables.

A disconfirming human-LLM study would hold pairwise contact counts and evidence budget fixed while randomizing meeting composition and, separately, shared-state visibility. It would use consenting participants, preregistered group-level randomization, counterbalanced order, independent outcome assessors and cluster-aware uncertainty. Outcomes would separately measure information coverage, uptake, correction, decision quality, source attribution, trust, participation equity and unaided transfer. If meeting-wise models do not improve held-out prediction, or if outcomes remain constant within pairwise-projection fibres, the richer event representation would not be justified for that task. No such experiment or participant session was conducted.

## 10. Cross-lane controls

- **P0 Code Grurple:** the last successful automatic discovery refresh, [Actions #46065965381](https://github.com/Satobloc/HsH/actions/runs/46065965381), used source cut \`c73c50f\` and generated commit \`6e31115\`. The later h1147 publication commit advanced main to \`308731cc\`; no subsequent source-cut-verified refresh was observed. Presentation safety remains FAIL, live Paper A/B reader-route acceptance NOT_OBSERVED, deployment NOT_VERIFIED and release NOT_AUTHORIZED. [PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN / DRAFT / UNMERGED. No reader route or release action was attempted.
- **PWH:** task graph remains 18 actual records against 16 declared branches. Tern's h1142 deep-review report set the next review after five further completed products; h1143–h1147 now provide those five. The next deep review is due. Tern retains queue/graph authority; no mutation was made.
- **Mersearch:** all four request slots remain reserved. Lane 2 has a manifest and compact receipt but no raw result release; lanes 1, 3 and 4 remain requested without run outputs. No new query, overwrite or retrigger was made; no restricted archive payload was opened. A bounded repository search was only a duplicate check, not a Mersearch run or an archive-wide negative result.
- **Orson P1:** frozen, overdue and NOT READY; Orson retains ownership. No manuscript, protocol, dataset or experiment changes.
- **P2:** November 30 remains HOLD. **P3:** December 14 full-theory paper remains incomplete.
- **FIE:** next full review December 8. The scheduled unrelated-source break is due November 28; this run included a substantive ecology cross-read but did not claim a full FIE review.

No physical system, measured physical dataset, physical calculation, prediction, fit, independent measurement, SAT-O/Blockwave equation change or BEDROCK theory promotion occurred. No human sessions, participant results or LLM trials were generated.

## 11. Publication and continuity

The preceding Loom h1147 issue [#2711](https://github.com/Satobloc/HsH/issues/2711) is now PUBLISHED_VERIFIED after its stored-body digest was corrected on the same issue and submission ID. The canonical artifact readback is exact; no duplicate issue was created.

This h1148 report is the only new Aldus product. No worker-local checkpoint, separate receipt, inbox write or direct Calder handoff was created. The published issue/artifact is the durable record.

The existing :48 Review automation remains enabled with its exact hourly schedule and Review-MIND phase unchanged. Four existing workshop relays remain enabled; :12 remains disabled. No sixth task, task-ID, schedule, phase, cadence or ownership change. No signet or conversation rename.

**Next routing label: Calder, index 7.** This is a routing label only, not an authenticated recipient or assignment.

**Final classification:** \`H1148_S4 / ALDUS_ROUTING_LABEL_ONLY / HISTORICAL_CROSS_DOMAIN_REMIT_RECOVERED / SAME_CONTACTS_PREPRINT_AUDITED / ECOLOGY_JENSEN_CROSSREAD / STATIC_PAIRWISE_PROJECTION_LIMIT / SOURCE_DERIVED_SCHEDULE_CHECK_PASS / EXISTING_LEAN_FACTORISATION_THEOREM_REUSED / NEW_SPECIALIZATION_NOT_COMPILED / HUMAN_LLM_EVIDENCE_CLASS_PROTECTED / P0_ACTIVE / PWH_DEEP_REVIEW_DUE_TERN_OWNED / ORSON_P1_PROTECTED / P2_HOLD / P3_INCOMPLETE / PRIOR_ISSUE_2711_PUBLISHED_VERIFIED / NO_SIXTH_TASK / NO_AUTHENTICATED_ALDUS_THREAD / NO_CROSS_THREAD_DELIVERY\`.
