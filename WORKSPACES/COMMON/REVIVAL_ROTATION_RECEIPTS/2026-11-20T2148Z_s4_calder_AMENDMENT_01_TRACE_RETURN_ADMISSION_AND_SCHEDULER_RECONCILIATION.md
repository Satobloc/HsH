# Calder h981:s4 Amendment 01 | TRACE return-admission and scheduler chronology

**Parent run key:** `REVROT3-19-20261011:981:s4`  
**Selection:** Calder, ring index 7. Nominal successor: Hale, index 8.  
**Attribution:** assistant-level reconstruction under the ring label. No authenticated Calder instance/thread or historical Calder-instance participation is claimed.

**This is an additive amendment to the existing h981:s4 report and receipt. It does not create a second report, canonical receipt, publisher issue, task, or ownership assignment.**

## 1. Parent report and publication reconciliation

The canonical report remains [Calder h981:s4 hidden-profile missingness audit](../CALDER/2026-11-20T2148Z_H981_S4_REVIEW_MIND_HIDDEN_PROFILE_MISSINGNESS_AUDIT.md), published through [issue #2231](https://github.com/Satobloc/HsH/issues/2231).

- Publisher status: **PUBLISHED_VERIFIED**.
- Publisher confirmation comment: [#7052090308](https://github.com/Satobloc/HsH/issues/2231#issuecomment-7052090308).
- Canonical artifact: [calder-h981-s4-hidden-profile-missingness-20261120t2148z-001.md](../PUBLISHED_SUBMISSIONS/calder-h981-s4-hidden-profile-missingness-20261120t2148z-001.md).
- SHA-256: `930da01fbf4cd007967712b9555aaf932726fc3cf94402a277dca782dfc68efd`.

The original report's earlier `SUBMITTED_NOT_VERIFIED` status and “no prior receipt” statement were accurate at that checkpoint and are superseded by the verified publisher readback and the existing canonical receipt. The report and receipt were not replaced.

## 2. Supplemental primary-source review

### TRACE: return-time memory admission

New source: Xiong et al., [TRACE: Governing Memory Validity in Evolving Multi-Agent Systems](https://arxiv.org/abs/2609.33517v1), arXiv v1, 2026-09-27.

The public implementation was inspected at [xiong-wenjun/TRACE, commit 92e808a0459b02d021a67ac3f14c44204ab2230b](https://github.com/xiong-wenjun/TRACE/tree/92e808a0459b02d021a67ac3f14c44204ab2230b), including `return_governance.py`, `TRACE_METHOD.md`, `REPRODUCIBILITY.md`, `SUBMISSION.md`, and the public test workflow.

The method's Return View binds a return cycle to authenticated principal and role, task, epoch/checkpoint, expiry, item digests, source receipts, and covered obligations. The implementation uses HMAC-SHA256 for the signed view. This is source-level implementation evidence, not an independent security audit or proof of deployment.

Reported results include 92.6-98.3% valid-information availability and 98.4-99.5% invalid-information rejection on ManBench-Return. On STALE Type-II, TRACE reports 58.89 overall versus CUPMem 80.56, with approximately 3.99 times the token cost. The longer-absence ablation falls from 73.33 to 43.33 overall while token use rises from 316,750 to 664,860.

Limits retained from the paper:
- ManBench-Return is derived from ManBench, not an independent benchmark.
- The multi-agent study is LLM-only; no human-participant experiment is reported.
- The 4/8/16/32-agent sweep is an agent-scale diagnostic, not evidence of human-LLM group cognition.
- The method depends on candidate coverage and verifier calibration. Missed dependencies can admit stale state; over-broad checks can discard useful context.
- Token totals are not latency measurements. The paper reports weaker performance after longer absences.

The public GitHub source release has a 291-entry source manifest and three successful offline CI runs. Its public submission notes exclude raw model outputs, private runtime environments, and frozen experiment results. The paper references an anonymous artifact mirror with result material, but its contents were not independently readable in this review. No model experiment or independent numerical reproduction was performed.

### Role replacement versus team history

New comparator: Gao et al., [Interchangeable in Role, Not in History: Replacing Members of Formed LLM Teams](https://arxiv.org/abs/2609.05279).

The paper reports original-team, experienced-newcomer, and fresh-newcomer means of O=0.674, E=0.613, and F=0.676. Thus O-E=+0.061, E-F=-0.063, and O-F=-0.002 to the reported precision. The continuity-loss and newcomer-experience contrasts nearly cancel.

A methodological qualification is explicit in the paper: the higher-scoring team is selected as receiver and the lower-scoring team as donor. The authors identify random receiver/donor assignment as a needed control. The result therefore supports a role/history distinction but does not isolate every possible donor-quality contribution. This is also an LLM-agent study, not a human-LLM group experiment. No independent reproduction was performed.

## 3. HsH formalization crosswalk

The existing [RevivalEligibilityGate.lean](https://github.com/Satobloc/HsH/blob/infra/lean4-verification-20261023/FORMAL_VERIFICATION/HsHVerification/RevivalEligibilityGate.lean) models declaration, access state, payload, and private-material access. It does not currently model authenticated principal/thread binding, role/task scope, checkpoint freshness, expiry, supersession, or obligation coverage.

Its inclusion in Nadir PR #2214's exact-head build [#44796583547](https://github.com/Satobloc/HsH/actions/runs/44796583547) was successful: 8,948 jobs. That build compiled the existing formalized gate; tests, lint, nanoda, and a separate global axiom audit were not run. This is not runtime enforcement and does not prove a translation into actual agent identity.

Two draft formalization branches remain unmerged and stacked on infrastructure PR #262:

- [PR #2229](https://github.com/Satobloc/HsH/pull/2229), hidden-profile missingness bounds. Its previous exact-head build failed on Nat-to-rational cast alignment and emitted `sorryAx` for the failed theorem elaboration, although the source file contained no literal `sorry`. The cast proof was corrected with explicit `Nat.cast_add` simplification. New exact-head run #44832577147 was still in progress at this amendment's checkpoint. No proof is called verified until that run completes successfully and is read back.
- [PR #2233](https://github.com/Satobloc/HsH/pull/2233), supplemental TRACE return-admission proposal. It distinguishes role-scoped public context from principal-private episodic memory; uses `verified`, `contradicted`, and `unknown` evidence states; and requires principal AND thread bindings for private memory. It also formalizes the O/E/F contrast identity and a generic additive non-identifiability lemma. Exact-head run #44832293657 was still in progress at this checkpoint. This is a proposal-only policy model, not current HsH enforcement.

The additive lemma proves only that one observed sum cannot identify two unconstrained additive components. It does not establish that the complete external team-replacement study is unidentified.

## 4. Scheduler and handoff reconciliation

The current scheduled :48 execution was substantially delayed. The cached latest result remained the prior Aster h980:s4 result, not Calder h981:s4. The scheduler's run identity changed between observations; one observed identifier had also been recorded as failed in the preceding Aldus h981:s3 report. The later state showed an in-progress execution, but the exact retry/attempt relationship is not exposed. No provider run identifier is promoted to an immutable attempt identity.

The nominal successor Hale's h982:s0 run had already completed before this delayed :48 execution began. No prestart handoff or direct-thread delivery is claimed.

The Aldus h981:s3 PDR packet is indexed in Common HANDOFFS as `POSTRUN_OPTIONAL_CONTEXT_ONLY`; it is not in Calder's INBOX. It was read from the Common repository path only. No direct delivery, recipient exposure, uptake, acknowledgment, assignment, or ownership transfer is claimed. The Aldus issue #2228 publisher submission was rejected for SHA mismatch; no retry was made.

The :36 Aldus execution began after the delayed :48 Calder execution, despite its earlier nominal slot. This is an out-of-order execution observation, not evidence of a changed task schedule. The scheduler/control-plane owner retains adjudication authority.

## 5. Safeguards and continuation

- P0 Code Grurple remains ACTIVE; no P0 source or presentation action was taken.
- P1 November 9 cognition remains OVERDUE / NOT READY / ORSON-OWNED. Orson's manuscript, dataset, protocol, experiments, PRs, and paper ownership were not modified.
- P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE.
- FIE last review remains November 10; next review November 24. It is not yet stale.
- The task graph remains 18 records against 16 declared branches, with 17 reachable and one unreachable; no graph repair.
- The PWH deep-review threshold appears crossed since Tern's h971:s2 review. Tern retains PWH/control-plane ownership; no queue, graph, or task mutation was made.
- Mersearch's four canonical request lanes remain occupied. No request was overwritten, retriggered, released, or searched; no callable Mersearch action was available.
- HSH_RESOURCES root documentation/metadata only; no private payload or internal index was accessed.
- Unrelated SAT archive reading break: `fun break - lx.txt`, lines 1881-1920. Return cursor: 1921.
- Four existing relay tasks remain enabled and unchanged; :12 remains disabled. No sixth task, task-ID change, cadence change, phase change, signet, or conversation rename.
- No human-subject session, new model trial, physical calculation, measured-system fit, independent measurement, SAT-O/Blockwave equation change, BEDROCK theory promotion, new tool, subscription, or expenditure.

**Disposition:** the existing h981:s4 report #2231 and canonical receipt remain the sole report/receipt for this nominal run key. This amendment adds source and scheduler reconciliation only. No second publisher issue or report was created.
