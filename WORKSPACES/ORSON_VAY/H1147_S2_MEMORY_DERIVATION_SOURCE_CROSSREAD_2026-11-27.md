# Orson h1147:s2 — memory derivation, source dependence, and evidence transmission

**Nominal slot:** 2026-11-27T19:24Z  
**Run key:** `REVROT3-19-20261011:1147:s2`  
**Selection:** Orson Vay (ring index 18); next ring label Sable (index 0).  
**Disposition:** `COGNITION_LITERATURE_CROSSREAD_COMPLETE / LEAN_EXTENSION_SUBMITTED_NOT_VERIFIED / P1_FROZEN_UNMODIFIED / PUBLICATION_PENDING_P0 / NO_TASK_MUTATION`.

This is a source-grounded assistant reconstruction under the Orson routing label. It does not authenticate a historical Orson instance or current Orson thread, and does not claim historical-instance participation.

## 1. Authority, scope, and protection

The live HsH main branch at preflight was `2a09ff76e87e08adae669eb57149c2469bee25d5`.

Read:
- `BEDROCK.md`, full 768-line file;
- Steering Charter 2026-10-26;
- Three Paper Campaign 2026-10-26;
- three-repository onboarding and current workflow orientation;
- Revival Rotation V3/V4, thread-first rule, scheduler roster and task graph;
- current PWH queue, P0 issue #1747, P1 issue #564, recent Common receipts/handoffs;
- Orson README, BOOT, CURRENT_WORK, INBOX, role charter, prior h1139:s4 receipt and P1 protocol freeze.

Orson's historical LLM-cognition remit is reconstructed from direct user-role appointment evidence and the assistant-maintained role charter. No separately signed Nathan-authored specialist charter or authenticated current Orson thread was established.

The five most recent indexed Orson routing receipts are all cognition-focused: h1139:s4 PACE resource/source-dependence work; h1136:s0 review-pair source-fidelity work; h1124:s3 metacognitive-control profile; h1117:s0 panagnosticism/source-fidelity work; and h1109:s2 cognition/memory work. This is 5/5 cognition-focused routing receipts, not proof of historical Orson-instance participation. No physics-lane reassignment was made.

**P1 remains frozen and separate.** The 2026-11-02 P1 protocol freeze remains controlling; issue #564 remains OPEN / SOURCE–EXPERIMENT READINESS / NOT READY. PR #850 remains OPEN / DRAFT / UNMERGED. This cross-read does not amend P1, expand its dataset, alter its estimands, change its manuscript, or advance any paper gate. No model trial, inference call, API spend, human session, or new P1 data was used.

## 2. New primary-source cross-read

This activation compared two primary preprints and re-used one already-audited multi-agent conflict study. The aim is to separate three non-equivalent failure classes rather than collapse them into a generic “memory inconsistency” score.

### A. Correlated-memory arbitration: CAMA

Chenchen Lin, Wenhao Yuan, Xuehe Wang, and Edith Cheuk Han Ngai, **“Beyond Memory Majority: Latent-Source Reasoning for Multi-Agent Memory Arbitration,”** arXiv:2608.19701, first submitted 2026-08-20.

Source: https://arxiv.org/abs/2608.19701

CAMA models query-conditioned memory-to-latent-evidence-slot assignments. Provenance enters as a soft symbolic prior to attention, not as a hard dependency label. For retrieved memories (m_i), the assignment matrix is (Z=(z_{ij})); slot presence is (e_j=\max_i z_{ij}); normalized slot presence is (p_j=e_j/\sum_l e_l). Its effective evidence number is a Hill diversity measure:
[
N_{\mathrm{eff}}=\exp\!\left(\frac{\log\sum_j p_j^\alpha}{1-\alpha}\right).
]
At the paper's default (\alpha=2), this reduces algebraically to (1/\sum_j p_j^2).

The implementation uses (K=10) retrieved memories, (J=6) latent evidence slots, and recovery budget (B=3); the reported backbones are DeepSeek-V4-Flash and Qwen3.6-27B. Correlation-aware benchmark variants augment original memory pools with paraphrased/summarized descendants from shared evidence sources and complementary entries carrying distinct query-relevant evidence, with provenance links recorded. The paper reports improved Correct Minority Recovery and reduced Replication Sensitivity over its baselines on MemoryAgentBench, LongMemEval and LoCoMo.

**Interpretation boundary:** (N_{\mathrm{eff}}) here is a model-defined Hill diversity of learned latent slots. It is not a covariance-estimated effective sample size, a measured correlation matrix of model errors, or a proof that the slots are statistically independent. The learned assignments are query-conditioned; the provenance prior is soft. A wrong latent assignment can therefore misstate the evidence-factor structure. The paper's controlled augmentations preserve benchmark answers but do not constitute an independent replication of real-world source independence. No peer-reviewed venue or public code repository was independently verified in this pass; treat the work as an arXiv preprint.

### B. Semantic memory derivation: DerivAudit

Hongjun Liu and Chen Zhao, **“Memory Is a Derivation: The Distributed-Evidence Paradox in Long-Term Agents,”** arXiv:2609.36130, first submitted 2026-09-28.

Source: https://arxiv.org/abs/2609.36130

DerivAudit asks whether a candidate memory is supported by the interaction history available at write time. It distinguishes citation-only evidence from expanded pre-write history, decomposes a memory into semantic obligations (claims, relations and qualifications), and tests write-time admission and downstream effects.

The paper audits 400 unedited natural memory writes from LoCoMo and HaluMem-Medium; 391 receive labels. Broader pre-write history recovers support for nearly 60% of memories whose attached citations are insufficient, while roughly 17–21% remain unsupported after expansion. Its controlled “distributed-evidence paradox” shows that individually plausible facts can be combined into an unsupported relation or event status. In the Qwen setting, holistic and obligation-aware checks detect only 8.6% and 11.4% of invalid cases under distributed evidence. Conversely, adding four independently true obligations can reduce admission of unchanged valid memories sharply on some backbones: Gemma acceptance falls from 93.3% to 2.6%, Llama from 97.4% to 35.5%, while Qwen moves from 99.4% to 98.1%.

The downstream intervention changes one memory slot (correct, distorted or absent) while holding retrieval position and surrounding context fixed. The authors report large downstream harm from distorted memories and from removing valid memories.

**Limitations recorded by the authors:** reference labels rely primarily on two model assessments with blinded adjudication; stratified human review reports 96.0% agreement, not a fully human-labelled corpus. Evidence expansion is retrieval-bounded. Natural data contain relatively few contradicted and explicit-relation cases; controlled suites cover only some mutation types. Results vary by verifier, prompt, view and aggregation. Consolidation findings are observational, and downstream interventions do not represent a fully closed-loop memory system.

### C. Multi-agent conflict transmission: Zhang et al.

The existing source audit of Zhang et al., **“Multi-Agent Memory Inconsistency: Where Factual Conflicts Disappear in LLM Agents,”** arXiv:2611.22245v2, is retained from P1 issue #564 comment #7113906735. It reports 73 planted numerical conflicts across 11 Harvey LAB tasks, three models, two runs per model, 198 task executions and 1,314 conflict observations.

The study separates Source Reads, Worker Reports, Lead Evidence and Final Report; it measures endpoint Pair Recall separately from semantic Judge Pass. The earlier source audit found that Pair Recall is cumulative endpoint presence, not proof that both conflict endpoints were simultaneously available in the same decision context or semantically integrated. Its required-bundle and observed Same/Split grouping do not isolate a randomized single-factor causal effect.

This comparator was not re-counted or represented as a new experiment in this activation.

## 3. Synthesis: three distinct failure axes

The cross-read supports three different operational questions:

| Failure axis | Unit being tracked | What can fail | What a positive metric does not establish |
|---|---|---|---|
| **Source redundancy** | Memory descendants and upstream evidence factors | Many records repeat one evidential factor and create a false majority | Statistical independence or correctness of learned latent slots |
| **Semantic derivation** | Claims, relations, qualifications and event status in one memory | Individually supported facts are composed into an unsupported relation, or a valid memory is rejected because citations are incomplete | Complete historical support when retrieval is bounded, or universal verifier reliability |
| **Transmission / availability** | Evidence endpoints across agent stages and recipient contexts | A source-read or worker-reported fact is lost before the lead's decision context | Simultaneous co-availability, comprehension, uptake or causal influence |

These are not three names for the same phenomenon. A source can be independent yet semantically mis-composed; a memory can be semantically valid yet fail to reach the decision-maker; two agents can report the same claim while sharing one upstream source.

### Proposed typed evidence record (not implemented)

A future common representation should not overload one generic “provenance” edge. Keep separate edge families:

- `derived_from`: memory/summary to parent memory or source record;
- `same_evidence_factor`: query-conditioned redundancy relation, with method and confidence;
- `supports`, `contradicts`, `qualifies`: evidence to a specific semantic obligation;
- `available_to`, `read_by`, `reported_to`, `included_in_context`, `truncated_from`: stage/recipient/context events;
- `evaluated_by`, `used_in_decision`, `supersedes`: evaluator and decision lineage.

A corresponding benchmark should report separately: source-factor diversity; relation-level derivation validity; pair co-availability in the same context; semantic judge pass; write-time false admission/rejection; and downstream harm. None should be substituted for another.

For any combined view (\Pi=(\pi_{source},\pi_{semantic},\pi_{flow})), a deterministic exact verifier for target property (T) can factor through (\Pi) only if (T) is constant on every fiber of (\Pi). The present Lean addition formalizes one relation-deletion instance; the full typed product projection and its composition conditions remain a proposal, not a completed theorem or implemented schema.

## 4. Lean 4 formalization

The existing Orson sandbox PR #2375 was reused; no new PR or module was created. The existing branch is `research/orson-crtc-group-projection-20261122t2136z`.

A small assistant-authored namespace `HsHVerification.OrsonMemoryDerivation` was appended to `OrsonDependenceIdentifiability.lean`. It defines a minimal `MemoryCandidate` with mentions, evidence view and a separate Boolean relation-licensing status. The theorem `no_view_only_verifier_of_relation_ambiguity` proves: if two candidates have identical verifier-visible mention/evidence projections but different relation-licensing statuses, no deterministic Boolean verifier that receives only that projection can classify both correctly. A finite witness instantiates the condition.

This is a logical reconstruction of the representation-deletion boundary in DerivAudit Appendix A, not a reproduction of the paper's model, dataset or empirical results. The Boolean field is an abstract truth-conditional status, not a measured annotation or LLM judgment.

**Build history:**
- First exact-head run [#46056771483](https://github.com/Satobloc/HsH/actions/runs/46056771483), head `b3578f736dbdddc1b5ed03605b3ee6f688179eac`: full build FAILED because `#eval` attempted to print `Prop × Bool × Bool` and Lean could not synthesize `ToExpr`/display instances. The theorem declarations and their `#print axioms` commands were reached; this is not a successful build.
- The `#eval` expression was corrected to apply `decide` to the proposition. New commit: `241a51e2149101565e335f555963415054781502`; new module blob: `997eb88d2ab0e50dea2db1188c2abd5e92405c02`.
- Push-triggered run #46057366416 had zero jobs and is not verification.
- Exact PR-head run [#46057372492](https://github.com/Satobloc/HsH/actions/runs/46057372492) was IN_PROGRESS at the last readback. **Current addition status: SUBMITTED_NOT_VERIFIED.**

The prior PR-head build #45893549041 verified the pre-existing Orson dependence/evidence-flow modules at commit `9f31cc1e15482ded78db11f9e803b1d61ef82ab4`; it does not cover this new addition. No successful exact-head build is claimed for the new theorem. Tests, lint, leanchecker, nanoda and global axiom audit are not claimed.

PR #2375 remains OPEN / DRAFT / UNMERGED. No rebase or merge was performed. PR #850 and the frozen P1 protocol were not changed.

## 5. P1, P0, PWH and physical-research boundaries

- P1 issue #564 remains OPEN / SOURCE–EXPERIMENT READINESS / NOT READY; protocol freeze remains unchanged.
- No OV-49–OV-53 bank recovery, model trial, model call, human session, API spend, dataset expansion/reanalysis, P1 PR #850 edit, manuscript edit, canonical PDF/reader or independent review.
- P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- P0 issue #1747 remains OPEN. Source-level presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. Tern retains release authority.
- The current PWH queue remains Tern-owned and stale at its documented cursor; no queue or task-graph mutation.
- No physical system, CODATA version, measured dataset, units, uncertainties, fit, independent prediction or physical calculation was selected or generated. This was an LLM cognition literature/formalization activation, not Lane 24 physical validation.
- Mersearch was inspected first. All four canonical lanes remain occupied; none was overwritten, released or retriggered. No private HSH_RESOURCES payload was opened.
- Existing repositories, PR #2375, Math Hopper, Whirligig and connected SciSpace were checked before adding code. SciSpace retrieval did not return a usable targeted result; the two primary papers were read directly from arXiv HTML. No new tool, dependency, fork, subscription or expenditure was introduced.
- FIE review remains current from November 24; next due December 8. The unrelated-source break was completed November 26; next due November 28.

## 6. Publication and continuity

**PUBLICATION_PENDING_P0_PRESENTATION_GATE.** No new public issue, HSH-PUBLISH-V1 submission, public-site artifact or generic reader target was created. The internal report is retained in the Orson workspace. Its source and exact readback will be recorded in the canonical Common receipt.

The next deterministic ring label is Sable. Any successor packet is optional repository context only; no direct Sable-thread delivery, reading, consumption, acknowledgment, assignment or ownership transfer is claimed.

**Stop:** no P1 protocol or paper advancement; no model trial; no theory promotion; no P0 implementation/release; no physical calculation; no PR merge/rebase; no scheduler mutation.


## Amendment 01 — Lean verification completed (2026-11-27T19:36Z)

The corrected addition has now passed a full Lean 4 build in the existing PR #2375 workflow.

- PR head: `241a51e2149101565e335f555963415054781502`.
- Actions run: [#46057372492](https://github.com/Satobloc/HsH/actions/runs/46057372492), conclusion SUCCESS.
- Event: `pull_request`; the workflow built GitHub's merge-reference commit `d552b11cb5fb94aea3a0eb4a118bafd6551f5368`, whose parents are base `598a45b3feb9378eb8f14ff069ec9080137113c2` and PR head `241a51e2149101565e335f555963415054781502`. This is a **merge-reference build**, not a standalone exact-head checkout.
- Lean 4.34.0 / Lake 5.0.0; full library build completed successfully with 8,955 jobs.
- Actual evaluation output: `(true, true, false)`, matching the identical mention/evidence view and different relation-licensing witness.
- `no_view_only_verifier_of_relation_ambiguity` reports `propext` and `Quot.sound`; `relation_deletion_witness` and `no_relation_blind_verifier` report `propext`, `Classical.choice`, and `Quot.sound`.
- No `sorryAx` or bare `admit` occurred in the retrieved full log.
- Tests, lint, leanchecker, nanoda and global axiom audit were skipped; this is not a global axiom-cleanliness claim.

The first failed build #46056771483 and zero-job push run #46057366416 remain part of the audit trail. The corrected merge-reference build now verifies the new theorem in the PR's merged context. PR #2375 remains OPEN / DRAFT / UNMERGED; no rebase or merge occurred. The theorem remains an abstract conditional result, not an empirical LLM finding or validation of the paper's semantic annotations.
