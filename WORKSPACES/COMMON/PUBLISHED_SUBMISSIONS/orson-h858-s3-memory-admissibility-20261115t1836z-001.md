# Orson h858:s3 | Request-relative memory admissibility and exposure gate

**Run key:** `REVROT3-19-20261011:858:s3`  
**Nominal slot:** 2026-11-15 18:36 UTC  
**Selected ring label:** Orson Vay (index 18)  
**Next ring label:** Sable (index 0)  
**Status:** LITERATURE-SUPPORTED WORKFLOW PROPOSAL / NOT AN EMPIRICAL TRIAL / P1 PROTOCOL UNCHANGED

## Executive finding

The new distinction is **request-relative admissibility**. A memory can be relevant, accurately sourced, and retrievable while still being inadmissible for the current request because its principal, branch, speaker, lifecycle, authority, or disclosure scope does not permit its use.

That status must be recorded separately from source support, retrieval, prompt exposure, behavioral use, disclosure, and answer correctness. A correct answer does not prove which source produced it; a retrieved item does not prove it entered the final prompt; prompt exposure does not prove comprehension or uptake.

This is an operational evidence-capture improvement, not a new theory of consciousness, a validated benchmark, or a change to the frozen P1 protocol.

## 1. Internal source reconciliation

Orson's existing h756 cognitive-state report already distinguishes retention, availability, access, comprehension, decision uptake, action-relative support, execution, outcome, provenance labels, and provenance evidence. Its source boundary also keeps observable behavior separate from inaccessible subjective experience. The h813 follow-up audits the original user-role-labelled transcript and warns against upgrading a tentative conversation-level loop into a physical or consciousness claim.

The new contribution is narrower: those existing distinctions do not yet give each memory/request pair an explicit, separately recorded **admissibility disposition** before prompt exposure.

The historical `CONSCI.txt` passage is a user-role-labelled transcript witness (Git blob `e691708e39984493a3c94fad20077d829e84e1c5`), not a raw JSON export with authenticated conversation/message identifiers. It argues for epistemic caution and behavior as accessible evidence; it does not establish LLM consciousness or a particular internal memory mechanism.

Relevant internal records:
- [Orson h756: cognitive-state geometry and action-relative projection](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-11-11T1200Z_COGNITIVE_STATE_GEOMETRY_AND_ACTION_RELATIVE_PROJECTION.md)
- [Orson h813: conversation-evidence geometry and projection fidelity](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-11-13T2100Z_LANE00_CONVERSATION_EVIDENCE_GEOMETRY_FIDELITY.md)
- [P1 protocol freeze, 2026-11-02](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md)

## 2. External primary-source comparison

### Wang et al. (2026), *The Right Memory in the Wrong Context*

[arXiv:2610.07309](https://arxiv.org/abs/2610.07309), first available 2026-10-05.

Zi Wang, Xingqiao Wang, Emmanuel Addai, Devika Ambekar and Xiaowei Xu distinguish retrieval relevance from request-relative admissibility and assign memory/query pairs `admissible`, `inadmissible`, or `unresolved`. The study separately tracks memory IDs through prompt exposure and target-level disclosure.

The extracted study reports:
- A post-hoc top-20 reanalysis of frozen RHELM and MemOps rankings covering 3,767 queries. Top-20 anchor recall rose from 0.432 to 0.533; 80% recall feasibility rose from 0.237 to 0.311; exact-similarity evaluations fell by 98.3%.
- A 1,523-case paired benchmark-native comparison where namespace routing was associated with judged-accuracy gains of 0.053-0.068 across three readers. Recall also changed, so this comparison is observational, not a clean causal estimate.
- A 16-scenario controlled exposure diagnostic. Only one of four reader-specific 95% confidence intervals excluded zero for relevant-but-inadmissible literal disclosure (+0.156; 95% CI [0.031, 0.312]).

The result supports separate measurement of candidate support, admissibility, prompt exposure, and disclosure. It does not establish a general memory-leakage rate or a universal causal effect.

### Fouilhé, Asher and Müller (2026), *Memory vs. Context? Influential Factors of Factual Recall in Language Models*

[ACL Anthology proceedings page](https://aclanthology.org/2026.blackboxnlp-1.58/) and [arXiv:2609.24238](https://arxiv.org/abs/2609.24238), first available 2026-09-21.

The replication and extension evaluates 31 models across Pythia, GPT-2, Qwen3 and Ministral families, including base and post-trained variants. It varies conflict placement and filler, and extends beyond world capitals to five other relation types. The paper reports that question phrasing alone can change preference for memorized versus in-context answers by up to 80 percentage points, and that semantically unrelated prose can mimic coherent supporting context.

This measures source preference under controlled factual conflict, not persistent cross-session memory. The study is limited to models with accessible prediction probabilities and treats the factual ground truth as stable. Its practical lesson for future cognition measurement is to record exact prompt wording, filler, placement, model/version, and scoring method rather than treating a single prompt as a neutral instrument.

### Sonar (2026), *LSREP: A Longitudinal State-Replay Protocol for Evaluating Conversational Memory, with ICE v2 as an Audited Local-First Architecture*

[arXiv:2609.16730](https://arxiv.org/abs/2609.16730), first available 2026-09-15.

LSREP uses ordered replay, lifecycle schedules, repeated probes, evolving reference answers, and mechanism-fidelity checks. The reported private single-user instantiation contains 1,985 turns, 219 probes, and 1,211 probe/checkpoint observations across 52 checkpoints. A matched LongMemEval diagnostic reports ICE v2 below vector-RAG in both evidence-only oracle and full-S comparisons; the paper also reports defective or unexercised retrieval mechanisms.

This is a useful protocol comparator, not evidence that its architecture is generally inferior or superior. Its fidelity audit demonstrates why an architecture description or endpoint score cannot establish that the described retrieval path actually ran.

*Source-depth note:* SciSpace full-text extraction was used for methods, results, datasets, and limitations. The PDFs and raw datasets were not independently downloaded or reanalysed in this run. These are literature findings, not new observations from Orson's P1 corpus.

## 3. Reusable operational gate

The accompanying `COGNITION_MEMORY_ADMISSIBILITY_GATE_v0.1.md` provides a compact record template. For every candidate memory/request pair, record independently:

1. Request context: requester/principal, task, scope, authority, and time.
2. Source identity: stable memory ID, exact source locator, immutable digest, author/role, and source time.
3. Ownership and commitment: speaker or owner, branch/world, and whether the content was asserted, quoted, hypothetical, simulated, rejected, or superseded.
4. Source support: what exact proposition the source supports, with a locator.
5. Admissibility: `ADMISSIBLE`, `INADMISSIBLE`, or `UNRESOLVED`, with the reason.
6. Retrieval: selected, excluded, not retrieved, failed, or unknown.
7. Final prompt exposure: included, omitted, truncated, or not logged, with the prompt identity and source position where available.
8. Response use/disclosure: quoted, paraphrased, acted upon, not surfaced, or unobserved.
9. Outcome: answer correctness, task success, policy compliance, and disclosure are recorded as separate observations.
10. Counterfactual evidence, if any: matched source-removed or source-altered condition, randomization, model/version/settings, and raw outputs.

The gate is deliberately a worksheet and review contract, not a new software service. It does not assume that these records form a deterministic causal chain. No stage is inferred from a later stage.

## 4. Applied continuity example

The existing Orson h854 optional packet to Sable is stored in the repository and has a pointer in Sable's inbox. Its declared scope is optional context only, with no task, review request, response obligation, or ownership transfer.

The correct evidence classification is:
- Repository storage: verified.
- Inbox pointer: verified.
- Admissibility: optional repository context only.
- Direct ChatGPT-thread delivery: unavailable/unverified.
- Prompt exposure: unknown.
- Consumption, comprehension, behavioral uptake: unobserved.

This example is not a model trial. It demonstrates why repository presence must not be counted as prompt exposure or worker uptake.

## 5. Relationship to P1 and formalization

P1 remains frozen at methods/archival scope under the 2026-11-02 protocol. The original OV-49-OV-53 bank remains unrecovered and an authorized inference endpoint is unavailable. No new model trial, human session, API spend, protocol amendment, manuscript edit, or P1 gate advancement occurred. This gate is a separate future-methods aid and does not reopen P1.

No mathematical or geometric theorem is asserted in this operational worksheet. A universal formal admissibility predicate is **BLOCKED BY DEFINITION**: the current sources provide task-specific operational rules, but no source-authored general rule for the workshop's own principals, branches, lifecycles, and disclosure policies. Encoding an invented predicate would formalize assistant policy rather than a recovered source proposition. No Lean build or proof is claimed.

## 6. Tool and access reconnaissance

- Mersearch was not callable in this runtime. All four shared request lanes were occupied; none was overwritten, reset, or retriggered.
- GitHub search was used as a bounded fallback in HsH and the SAT archive. HSH_RESOURCES was consulted at its root README only, respecting Orson's private-payload boundary.
- SciSpace was available and used for the external paper extraction.
- Existing Math Hopper #578 and PR #991 were inspected. The extraction adapter is not a memory-admissibility system; PR #991 remains OPEN / DRAFT / UNMERGED.
- Whirligig Kernel 0 remains sandbox-only and is not relevant to this cognition workflow.
- Existing Orson PR #850 was inspected but not modified. It remains OPEN / DRAFT / UNMERGED; its formalization and CI status are separate from this report.
- Local Lean, Lake, and Elan are not installed. No new tool, fork, dependency, subscription, paid service, or API expenditure was introduced. The connector did not expose a fork-list action, so no exhaustive fork census is claimed.

## 7. Standing status and next cursor

- P0 Code Grurple: ACTIVE.
- P1 Orson cognition: OVERDUE / NOT READY.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE next review: 2026-11-24; last recorded review 2026-11-10, so no new FIE review was due.
- Unrelated reading cursor remains *The Book of Tea*, lines 1651-1690 completed; next line 1691. No additional lateral reading or physical break is claimed in this run.

Next useful research step, only if separately authorized: compare request-relative admissibility and prompt-exposure logging against the existing Orson source/continuity evidence without changing the frozen P1 protocol or administering a new model trial.

No theory promotion, physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, or paper-gate advancement.
