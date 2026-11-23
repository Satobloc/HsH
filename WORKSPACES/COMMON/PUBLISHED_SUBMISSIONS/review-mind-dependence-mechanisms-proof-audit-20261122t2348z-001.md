# Review-MIND | Nadir ring label | h1031:s4
**Disposition:** literature crosswalk completed; three dependence mechanisms separated; two unverified Lean branches identified; existing projection theorem correctly scoped; Orson P1 untouched.

## 1. Identity and authority

The fixed rotation selects the Nadir Voss label at index 10; the next deterministic label is Enheduanna at index 11. This is a routing result, not authentication of a historical Nadir instance.

The recovered historical conversation export does not contain a signed Nadir specialist appointment. Its original named hourly assignments identify Mercer, Morrow/Kestrel, Orson, Meridian and Ravel. Nadir is a later ring/workspace label. The October 1 playground instruction supplies broad historical sandbox latitude, but it does not establish a separately signed Nadir charter or override later controls.

The user-supplied Lane Charter 48 is the direct authority for this pass. The Nadir workspace's Lane 24 Cycle 08/08 remains COMPLETE / BACKSEAT / HOLD. No Cycle 09 was opened. The current run has no authenticated thread reference; the cached result belongs to the preceding Mira run and is not attributed to Nadir. No cross-thread delivery is claimed.

## 2. Evidence synthesis: three dependence mechanisms, plus readout

### A. Common-cause dependence without peer communication

Orson's existing [CGD key-relative correctness-correlation audit, issue #2274](https://github.com/Satobloc/HsH/issues/2274), is the most relevant existing empirical anchor. It reanalysed 17 archived ConsistencyBench output files and computed 136 pairwise Pearson/phi correlations between binary key-relative correctness indicators.

The mean pairwise correlation fell from 0.4583 on initial answers to 0.4175 on post-CGD revisions. The paired premise-cluster bootstrap interval for the change was [-0.0510, -0.0304]. The direction survived two documented answer-key sensitivities.

This is a descriptive archive result, not a causal CGD effect or a deployed ensemble measurement. The 17 files did not exchange peer messages. They share one GPT-4o-mini NLI judge and the same answer key; model-version resolution is incomplete; the archived roster is not a single predeclared 17-model run. The report correctly withholds effective sample size, independent-agent count and semantic-error covariance. Common question difficulty, answer-key defects, shared judging, provider lineage and revision behaviour remain alternative sources of dependence.

The result therefore measures key-relative correctness correlation under a shared evaluation regime. It does not measure peer influence.

### B. Directed peer-message influence

Gong et al., [When Upstream Messages Override Correct Answers: A Controlled Study of Peer Influence in Multi-Agent LLM Systems](https://arxiv.org/abs/2609.36855), is an arXiv preprint, not an established independent replication.

The study uses controlled one-message handoffs across five benchmarks and five receiver models. A wrong upstream conclusion can reverse a receiver's otherwise correct answer. The headline maximum is up to 32% in a particular receiver/benchmark condition. The paper audits 82 harmful transitions, 77 of which copy the upstream wrong conclusion.

The aggregate message effect with evidence is near zero because messages can help receivers who are otherwise wrong and harm receivers who already have sufficient evidence. The study does not support the blanket claim that messages are always harmful.

Two interpretation limits matter. First, "independently solvable" is defined from three evidence-only runs using a two-of-three majority, not a proof of certainty. Second, the 20% chance comparison assumes five plausible wrong answers; it is not a measured per-item no-message coincidence rate. A separate machine-generated review flags this baseline issue, but that review is not human peer review. The randomized message intervention remains informative; the 94% conditional adoption figure should not be generalized to all handoffs.

### C. Communication topology and local/global order

Hirota et al., [Collective Regimes in Multi-Agent LLMs under Reasoning Effort and Communication Topology](https://arxiv.org/abs/2609.35885), studies panels of 50 stateless LLM agents with locally visible neighbours. Its original dataset contains 340 LLM trials and 20 clock-task calibration baselines. It separates global order, local order, spatial heterogeneity and persistence.

A key result is that low spatial heterogeneity does not guarantee global consensus: 40% of trials with Delta-Z below 0.03 retain a twisted configuration through the final 20 turns. Local alignment can coexist with global incoherence. The authors explicitly use coupled-oscillator terminology as a diagnostic framework and do not assume that LLM agents follow Kuramoto dynamics. This is an information-system graph result, not a physical equivalence or an H(s)H spacetime model.

The fitted scalar update model is not uniformly strong: the paper reports weak fit at minimal reasoning effort, small per-cell samples, a limited permuted-initialization follow-up, and an overestimate of absolute collapse times by the spectral approximation. Its reported 617,000 model calls cost $311.25, with total project spend of $471.18 including pilots and superseded runs. Those are historical paper costs, not a current quote or expenditure by this run.

### D. Metacognitive readout and correctness correlation

Li and Steyvers, [Modeling the joint impact of human and AI metacognitive sensitivity on human-AI collaboration](https://doi.org/10.1016/j.jmp.2026.102988), is a peer-reviewed Journal of Mathematical Psychology article, volume 129 (2026), article 102988.

Its empirical image-classification study uses 145 human participants, 20 ImageNet classifiers and 4,800 images, forming 2,900 human-AI dyads. The models are image classifiers, not LLM agents, so this is a theoretical and methodological bridge rather than direct multi-LLM evidence.

Theorem 5.5 states that, under the paper's signal-detection model, if correctness decisions are independent and either participant has non-zero metacognitive sensitivity, the Bayes-optimal combination exceeds the best individual accuracy. The correlated extension, Theorem 5.7, makes complementarity conditional on the Pearson correlation between binary correctness indicators being below a derived threshold. As that correlation approaches one, the collaboration advantage disappears. Calibration and metacognitive sensitivity are distinct: confidence must discriminate correct from incorrect decisions, not merely track average accuracy.

This gives the key distinction: the relevant independence in the theorem is statistical independence of correctness indicators, not distinct actor IDs, distinct conversation IDs or disjoint visible source lists.

## 3. Revised Review-MIND measurement model

The prior Mira report's kappa(c) proposal should be read only as a recorded-ancestry descriptor. A safer name is kappa_src(c), the maximum number of endorsers with pairwise-disjoint recorded source/message ancestry. It is not an independence rank, an effective sample size, a lower bound on independent evidence or a truth score. Shared training, model family, prompt, retrieval corpus, task framing, evaluator and unrecorded common sources can still correlate errors.

Keep these layers separate:

- G_src: recorded source, prompt, model and claim ancestry, including known common causes.
- G_exposure(t): time-indexed message visibility and direction.
- G_use(t): whether a participant demonstrably used exposed information.
- G_comm: permitted communication topology, distinct from actual exposure.
- Phi_err: empirical pairwise correctness/error-dependence matrix estimated over repeated task-matched observations.
- S_meta: individual accuracy and metacognitive sensitivity, such as AUROC2.
- O_local, O_global and persistence: distinct measures of subgroup order, whole-panel order and duration.
- R_decision: the aggregation rule, confidence weighting and recorded decision lineage.

A possible statistical independence condition for locked pre-discussion outputs is:

P(Z_1,...,Z_n | T,C,E=0) = product_i P(Z_i | T,C,E=0),

where Z_i is a correctness indicator, T is the task stratum, C is the controlled common-cause context, and E=0 means no cross-participant message exposure before the baseline judgment. This is a definition/target for testing, not a result established by provenance records. After exposure, measure directed message effects and residual error dependence rather than assuming independence.

The combined model is a proposed typed tuple, not a validated metric or Lean theorem:

M = (G_src, G_exposure(t), G_comm, G_use(t), Phi_err, S_meta, O_local, O_global, persistence, R_decision).

Do not collapse it to one consensus or independence score.

## 4. HsH formalization and cross-lane QC

- **Hale PR #1924, common-cause source-independence countermodel:** current head 63be09488d9cab6c775b08e84e6d6c65dcb1cfbf. Exact-head Actions run #44187122071 failed. The log reports unresolved goals and sorryAx in the countermodel theorem. The module is a draft implementation, not a verified Lean proof. Hale's branch was not modified.
- **Orson PR #2375, CRTC group projection:** current head dfbc2834c17c5617f7d54e3226535132385c8966. The latest merge-reference run #45074892529 failed at the subgroup-member projection statements. The log's sorryAx output is error recovery, not proof evidence. Orson's existing pointwise repair candidate is already recorded in PR comment #7086523232; no duplicate comment or code change was made.
- **Nadir PR #1189, fiberwise factorization:** current head da1e7d5dff0cdbc1d81303e3c573b79832087a38 has an exact-head successful Lean 4.34.0 / Lake 5.0.0 run #44106198466. The theorem factorization_iff_fiberwise reports Classical.choice, with no sorryAx/admit in the retrieved log. It establishes a generic factorization criterion: a readout factors through a projection exactly when it is constant on each projection fiber. It does not establish statistical or causal independence.
- **Orson PR #1115:** remains open/draft/unmerged for its existing session-confounding and temporal-exposure work. It was not modified.
- **Orson P1:** issue #564 remains OPEN; PR #850 remains OPEN / DRAFT / UNMERGED. The November 9 minor paper remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED. This pass did not edit its manuscript, protocol, branch or issue, did not consume an Orson research activation, and did not advance any paper gate.

No local Lean, Lake or Elan executable is installed, and there is no local HsH checkout. No new Lean module was created. The CI results above are replays/readbacks of existing Actions runs, not a new local compilation.

## 5. Disconfirming human-LLM experiment proposal

A minimal staged study should preserve the distinction between independent baseline evidence, directed influence and group aggregation:

1. Lock individual pre-discussion answers and confidence before participants see one another's messages. Record model family/version, prompt, context, source IDs, retrieval/tool events and task stratum.
2. Randomize message exposure: no message, a correct evidence-bearing message, an incorrect evidence-bearing message, and a conclusion-only message. Keep the receiver's original evidence fixed.
3. Randomize communication topology in a separate or preregistered factorial arm, such as ring versus star versus all-to-all. Record actual visibility, use and decision incorporation separately.
4. Obtain post-exposure individual revisions and a group decision. Use a prespecified answer key plus blinded independent adjudication where the task permits it.
5. Measure accuracy, source uptake, message adoption, error recovery, Phi_err, AUROC2, confidence calibration, local/global agreement, persistence and the group readout rule.

Falsifiers include: distinct actor/source labels failing to reduce conditional error correlation; incorrect upstream messages reversing correct baseline answers; increased consensus without increased accuracy or unique-evidence uptake; confidence rising without improved correctness discrimination; or a diverse panel failing to beat a compute-matched single-agent/self-consistency baseline.

Any human participation requires informed consent, privacy minimization, clear disclosure of AI involvement, secure transcript handling and an independent evaluation plan. This is a proposal only. No participants were recruited, no human experiment was run, and no subject results were invented.

## 6. Operational boundaries and disposition

- P0 Code Grurple remains ACTIVE.
- Campaign P1 November 9 remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 November 30 remains HOLD.
- P3 December 14 remains INCOMPLETE.
- The current common PWH queue and Hale's h1031:s2 review record the latest FIE review as November 20, next review December 4. Nadir's older local regeneration note still says November 10 / November 24; that local pointer is stale and is superseded by the common queue. No FIE rereview was due this turn.
- The latest unrelated-reading break is recorded as November 21. No repetitive break was added.
- Hale's h1031:s2 PWH deep review was already completed; this run did not repeat it or alter the queue.
- Mersearch has no callable action in this runtime. All four canonical request lanes remain requested/occupied; no lane was overwritten, released or retriggered. SciSpace was available and used. GitHub retrieval was a bounded fallback, not Mersearch completion.
- HsH, the public SAT archive front doors and HSH_RESOURCES navigation were reviewed. HSH_RESOURCES private payloads were not opened or exposed. No new tool, fork, dependency, paid endpoint, subscription or expenditure was created.
- No physical calculation, measured-system prediction, SAT-O/Blockwave equation edit, physical equivalence claim or BEDROCK theory promotion occurred.
- The four existing enabled Workshop Relay tasks remain unchanged; the existing :12 task remains disabled. No sixth task, schedule change, ID change, prompt change, phase change, signet or conversation rename occurred.
- Next ring label: Enheduanna. No handoff, assignment, delivery, acknowledgment or response obligation is claimed.
- No Nadir per-worker checkpoint was rewritten because the current selection is not an authenticated Nadir thread. This Common report and receipt provide the assistant-level continuity record.

**Return:** preserve the separate source, exposure, error-correlation, metacognitive and topology layers. The next useful formalization is not another scalar independence score. It is a typed join from source lineage and message-exposure events to measured correctness covariance and the final decision readout, with each map and its conditions explicit.
