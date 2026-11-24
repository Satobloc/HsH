# H936:s4 Review-MIND | Shared-state exposure in multi-agent systems

**Disposition:** New source review complete; existing exposure formalization reused; exact-head Lean results independently checked; one cross-lane review comment posted; WH-02 status refreshed; no new theorem, fixture, experiment, tool, physical calculation, theory promotion, or paper-gate advancement.

## 1. Scope and source custody

The deterministic ring label for this slot is **Nadir Voss**; the next label is **Enheduanna**. A ring label is routing metadata, not authentication of a particular model instance or ChatGPT thread.

No standalone, Nathan-authored Nadir specialist charter was found in the reviewed source chain. The historical direct messages support a broad experimental-sandbox and source-versus-invention distinction, not a permanent worker identity or blanket permission for data-free numerical fixtures. The supplied **Review-MIND Lane Charter 48** governs this activation. Nadir's workspace was not modified and no PLAYGROUND payload was executed.

Mersearch was not exposed as a callable connector. The four canonical request lanes remain occupied/requested without request-scoped output manifests or receipts. SciSpace and direct primary-source inspection were used as bounded discovery fallbacks. Only HSH_RESOURCES front-door material was read; no private research payload was opened.

## 2. New source: homogenization under shared orchestration

**Homogenization in Multi-Agent Systems: Conformity, Polarization, and Inertia in Orchestrator-Driven LLM Ensembles** (arXiv:2610.09824, submitted October 6, 2026; preprint, not a peer-reviewed publication).

Original: https://arxiv.org/abs/2610.09824

The study uses five interaction rounds and ten random-seed trials across three task families: code generation, hiring, and peer review. It tests nine LLMs in the code-generation setting, seven in the hiring and peer-review settings, and sixteen mixed-model configurations. The agents are separate executions, but the orchestrator maintains a shared global state and broadcasts that state to agents on subsequent rounds.

The paper distinguishes three score-trajectory behaviors:

- **Conformity:** within-round score dispersion decreases.
- **Polarization:** the group mean moves toward score extremes.
- **Inertia:** the rate of change in the group mean declines.

The appendix constructs all eight present/absent combinations of these behaviors. That supports logical separability of the defined measures. It does **not** establish statistical independence or zero correlation among the measures in empirical populations. They should be treated as distinct readouts, not independent random variables.

The reported homogenization persists across tested mixed-model configurations and sampling stochasticity. The hiring experiment also reports that an adversarial agent's bias can persist after that agent is removed. However, the orchestration algorithm retains and rebroadcasts shared global state. The paper does not report a condition that removes the adversary's prior contributions from that state. Persistence is therefore consistent with shared-context carryover; it does not isolate durable internal adoption by the remaining agents from continued exposure to the retained group state.

The three domains have materially different evidential status:

- Code generation uses 280 CodeLMSec prompts, CodeQL security scanning, and an LLM-based functional-similarity assessment.
- Hiring uses 8,000 synthetic resumes generated with Gemini 3.1 Pro, not real applicants.
- Peer review re-samples 1,950 ICLR 2025 submissions because the original dataset was unavailable; the reported scores are model assessments, not observed human-review outcomes.

The paper is an orchestrator-driven model simulation, not a human-participant or live human-LLM group study. Its outcomes are primarily score-based. It does not provide a full paired residual-error covariance analysis or independently manipulate evidence-source roots. The ten trials are repeated runs, not ten independent trained model populations.

## 3. New methodological refinement

This run does not create another general independence vector. Earlier HsH work already separates evidence genealogy, model/system lineage, exposure, outcome dependence, and marginal information ([h917 receipt](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-18T0548Z_s4_nadir_voss.md)). The earlier h916 source review also covered ClaimArena-LLM and Copies or Sources ([published h916 review](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/reviewmind-h916-s4-lineage-revision-20261118t0448z-001.md)); those studies were not repeated here.

The new refinement is narrower: **agent removal is not exposure removal**. In an orchestrator-driven group, removing an agent while retaining the shared state may leave its prior contributions available to every remaining agent. Model-family diversity and role diversity do not by themselves remove that common information pathway.

This makes the existing source-exposure chain directly useful:

1. Source attestation.
2. Run- and snapshot-specific context exposure.
3. Output occurrence and attribution.
4. Uptake or revision.
5. Causal influence evidence.
6. Independently evaluated outcome.

A source listed in a manifest is not thereby present in an agent's context. Context inclusion is not proof of uptake. Output attribution is not proof of semantic support or causal influence. The existing Enheduanna formalization preserves these distinctions; no new schema or Lean module was added.

Treat these as typed projections from a complete interaction history H:

- Psrc: H -> SourceAttestation
- Pctx: H -> ContextExposure
- Pout: H -> OutputOccurrence
- Puptake: H -> UptakeEvent
- Pcausal: H -> CausalInfluenceEvidence
- Pscore: H -> IndependentlyEvaluatedOutcome

Composition is conditional, not automatic. Pout after Pctx is admissible only when the exposure record's context-snapshot ID is referenced by the output occurrence and the run identity is stable. Puptake after Pout requires a later revision event that references the same output occurrence. Pcausal after Puptake requires a controlled contrast addressing shared-state, model, and source common causes. Without those matching identifiers and conditions, the projections remain separate and no causal claim follows. The existing Lean module covers only selected type-level distinctions; causal influence remains an empirical identification problem.

## 4. Falsifiable next experiment

A bounded follow-up should randomize what happens to shared state after an adversarial contributor is removed:

1. Retain the full shared state.
2. Remove the contributor and scrub only that contributor's claim contributions.
3. Remove the contributor and rebuild state from raw evidence only.
4. Run a no-adversary control.

Cross those conditions with same-family versus mixed-family agent configurations and with a final auditor that either sees the debate transcript or receives evidence-only input. Record exact run IDs, context-snapshot IDs, source roots, exposure events, output occurrences, attribution, and outcome provenance.

Measure false-claim adoption, persistence after removal, source validity, task accuracy, calibration, minority-evidence retention, score convergence, and conditional error dependence separately. If scrubbing or resetting shared state does not alter persistence, the shared-state explanation is insufficient. If mixed models or an evidence-only auditor do not reduce measured dependence, model diversity and role separation are insufficient safeguards.

This is a proposal only. No experiment, human-participant study, model/API call, dataset download, or new numerical analysis was performed.

## 5. Existing Lean formalization and cross-lane QC

### Enheduanna source-exposure formalization

PR #1619: https://github.com/Satobloc/HsH/pull/1619

The existing module separates source attestation from context exposure, context exposure from output attribution, and output occurrence from capture completeness. Its exact-head Actions run #43981958006 was independently read back: the Lean build completed 8,946 jobs. The source-exposure theorems report only propext; the two output-occurrence theorems have no reported axiom dependencies; the partial-index countermodel reports propext. No sorryAx appeared in the captured theorem axiom reports. Tests, lint, nanoda, leanchecker, and the global axiom audit were skipped. The PR remains open, draft, and unmerged.

This is a useful conditional formalization, not evidence that a particular agent actually received a source, used it, or was causally influenced by it. The integrity certificate remains opaque and does not itself authenticate the capture process.

### Elias temporal-order formalization

PR #2032: https://github.com/Satobloc/HsH/pull/2032

Exact-head Actions run #44432360003, job #135252648340, was independently read back against head aad65f2dfd4edb216b6b0fe2dc12adfacaf87cc5. The checkout assertion passed and the Lean build completed 8,952 jobs. The conditional transitivity theorem reports no axiom dependencies. The counterexample theorem reports propext, Classical.choice, and Quot.sound; no sorryAx appears in its printed axiom set. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

A source/model mismatch remains: ProducerQuiescence.lean lines 31-34 construct TimeInterval values with ClockDomain.utcEpoch and ClockScale.unixSeconds, although the comment describes the values as ordinal and without physical-time interpretation. The type metadata says UTC Unix time; the comment says abstract order. A separate abstract-order type is the cleanest representation. This witness must not be read as measured chronology.

The exactPoint 1, 2, 3 witness and its #eval calls are a data-free mathematical/numerical fixture. No specific prior Nathan permission for this exact fixture was located in the reviewed source chain. The earlier h917 Nadir receipt explicitly classified comparable toy countermodels as PROTOCOL_VIOLATION / NOT_EVIDENCE under the data-free calculation gate. The generic conditional theorem is separate from the fixture. Do not extend or rely on the witness until specific permission is recovered or the representation is replaced.

The theorem also assumes the relevant run-ID equalities. Lean does not establish that real producer, seal, and unblinding records share a run identity, nor that the runtime logs are complete.

A comment-only Review-MIND QC note was added to PR #2032: https://github.com/Satobloc/HsH/pull/2032#issuecomment-6996942002. No code change, merge, approval, or theory promotion was made.

## 6. Workflow and campaign controls

- P0 Code Grurple remains ACTIVE. No protected manuscript route was probed and no quarantined source was opened.
- P1 Orson cognition remains OVERDUE / NOT READY / ORSON-OWNED. No manuscript, protocol, dataset, or ownership change was made.
- P2 November 30 measured-system paper remains HOLD.
- P3 December 14 full-theory paper remains INCOMPLETE.
- FIE was last fully reviewed November 10; the next review is due November 24. It is not yet due.
- WH-02 remains P1/HIGH, Calder-owned, with Tern retaining PWH queue control. PR #1710 remains open/draft/unmerged. At the recorded comparison snapshot it was seven commits ahead and 5,685 behind current main, with no Actions run associated with its exact head and no submitted review. No rebase, merge, workflow dispatch, or owner change was performed.
- A status-only WH-02 refresh was appended to the PWH queue and read back: https://github.com/Satobloc/HsH/commit/034da0deb66d6c4777567b0921b88da622264faa. Main later advanced through a generated public-display refresh; no WH-02 source repair was included in that update.
- The task graph remains ACTIVE_SEED with 16 declared branches and 18 records; no graph or ownership mutation was made.
- Mira's prior publisher issue #2029 remains unverified/rejected: the corrected body is present, but no publisher success comment or canonical artifact readback was found. No retry or duplicate submission was made.
- The immediate predecessor recorded the unrelated-reading break; this activation did not duplicate it.
- Math Hopper #578 / PR #991, existing Lean PRs, Whirligig Kernel 0, and the available SciSpace route were checked before considering new tooling. No new tool, fork, dependency, subscription, or paid API call was created. A current fork-list action was not exposed, so no fork use is claimed.
- No new physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, BEDROCK promotion, or paper-gate advancement occurred.

## 7. Successor boundary

The next deterministic ring label is Enheduanna. No authenticated current Enheduanna worker thread was verified. The corresponding scheduled task conversation is not an identity credential. Its run had already completed before this optional context packet was created, so the packet is postcompletion archival context only: no assignment, delivery, consumption, acknowledgment, or response obligation is claimed.

The existing scheduled :48 task remains enabled and unchanged. No task ID, schedule, phase, cadence, or enabled-state mutation was made, no signet or chat rename occurred, and no sixth task was created.
