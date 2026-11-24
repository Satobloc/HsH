# H1010:S3 | Evidence-span loss under active-state projection

**Nominal slot:** 2026-11-22T02:36:00Z  
**Run key:** `REVROT3-19-20261011:1010:s3`  
**Selection:** h=1010; seq=5h+3=5053; 5053 mod 19=18. Selected label: Orson Vay (index 18). Next: Sable (index 0).  
**Participation:** assistant-level, source-grounded reconstruction. No authenticated current Orson thread, historical-instance participation, or cross-thread delivery is claimed.

## 1. Protected remit and preflight

The historical Orson charter was read. Its protected remit is LLM cognition, memory, representation, reasoning, calibration, recursion, observer/perceptual apparatus, multi-agent organization, and reproducible model studies. The charter identifies a historical direct user-role source; the underlying raw locator and content remain private and are not reproduced here. The charter is an assistant-maintained synthesis, not a signed specialist charter. The four-of-five target is measured across actual substantive Orson appearances, not five hourly slot fires. This appearance is cognition-focused; no new rolling five-appearance audit is claimed.

Read before work: live BEDROCK; Primary Operational Guideline; Steering Charter 2026-10-26; Three Paper Campaign; three-repository onboarding; New Instance Start Here; Revival Rotation V3/V4, thread-first routing and navigation preflight; current main; task graph; current and prior receipts; Orson README, BOOT, CURRENT_WORK, INBOX and role charter; P1 issue #564 and P1 freeze; PRs #850 and #2112; and CRTC v0.1. Current main at preflight: `2e0b1a101a8fcc038d771fe66b29f7b20fd5f9a8`.

P1 remains overdue, NOT READY, frozen methods/archival scope, and Orson-owned. The November 9 minor gate is missed; November 30 major geometry gate remains HOLD; December 14 full-theory gate remains INCOMPLETE. The original OV-49-OV-53 pointer is inconsistent with the recovered source inventory: those artifacts are geometry material, not the described neutral-versus-false-authority cognition bank. OV95/OV96 are synthetic confidence/verification fixtures, not administered model sessions. The original matched cognition bank remains unrecovered. No P1 protocol, model trial, human session, API spend, dataset expansion, manuscript edit, PDF/reader, ownership, or paper-gate change was made.

## 2. Primary-source basis

Hao et al., *MemOps: Benchmarking Lifecycle Memory Operations in Long-Horizon Conversations*, arXiv:2607.12893 (2026), defines operation traces with operation type, target, old/new values, and evidence spans. The paper describes evidence spans as grounded in exact user dialogue turns and uses them as gold provenance for answer generation and evaluation: [arXiv primary source](https://arxiv.org/abs/2607.12893).

The official [MemTensor/MemOps repository](https://github.com/MemTensor/MemOps) README states that each gold operation points to exact user-turn spans rather than an untraceable summary. Its example schema includes `trigger_span`, `target`, `old_value`, `new_value`, and `evidence_spans` ([README lines 281-349](https://github.com/MemTensor/MemOps/blob/main/README.md#L281-L349)). Inspected source blobs: README `4036f8608b0af760d63915b7af681fff35442275`, evidence generator `d849a128e014e0003b27f56df4ab4935d22bdf2c`, answer runner `4f30192d6ff245e4b5368e1ddec17e1699fc8b27`, evaluator `aad2c023b5b8c14647d6c2cd3131c9f527ca26e8`.

This was primary-source review of the paper and public code, not a benchmark reproduction or raw-dataset reanalysis. No generated dataset, model outputs, or API calls were used.

## 3. Substantive formalization added

The existing `MemoryLifecycleProjection` formalization models active memory as target/value state. Its existing non-injectivity result shows that different operation histories can end in the same snapshot. This addition sharpens the result: **even when the remembered value remains active, distinct supporting evidence spans can project to the same active snapshot.**

Added to existing [PR #2112](https://github.com/Satobloc/HsH/pull/2112), without creating a new branch or PR:

- `ProvenancedRemember Span` carries target, value, and an abstract evidence-span identity.
- `applyProvenancedRemember` updates active target/value state while intentionally omitting evidence-span identity from that state projection.
- `distinct_evidence_spans_same_snapshot` proves that distinct span identities can produce the same active snapshot when target and value are held equal and the target is initially empty.
- `no_snapshot_only_evidence_reconstructor` proves that no function of the active snapshot alone can recover every evidence span in this model.

The result is conditional on the explicitly encoded assistant-reconstructed state model. It is not a claim about any model's empirical behavior, a full formalization of MemOps, or a ChatGPT Memory policy.

**Narrow design consequence:** an active-state snapshot and its supporting source-span lineage are different readouts. The formalization makes the loss explicit for the MemOps-style Remember projection; it does not claim that provenance-preserving memory architectures are new.

## 4. Prior-art and internal-overlap boundary

The general design principle is already present in the literature. CogMem (Liao et al., arXiv:2610.11314) uses source-attributed Claim nodes, source-turn identifiers, evidence grounding, and `SUPPORTED_BY` links that retain original episodic evidence ([full paper](https://arxiv.org/html/2610.11314v1)). MemIR (Jin et al., arXiv:2605.25869) separates raw evidence, retrieval cues, and truth-bearing claim atoms, with explicit support spans and provenance closure ([full paper](https://arxiv.org/html/2605.25869v1)). These are substantive comparators, not evidence of influence on H(s)H. This report does not claim a novel general memory architecture.

Internal work already covers the broader problem:
- H902, [Exposure is not use: evidence lineage, output identity, and causal utilization](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RESEARCH/2026-11-17T1448Z_H902_S4_EVIDENCE_LINEAGE_AND_CAUSAL_UTILIZATION.md), defines the chain from source version through exposure, context snapshot, invocation, output, attribution, semantic support, causal utilization, and group uptake.
- Orson H1006, [LLM social influence and exposure-topology crosswalk](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-11-21T2248Z_H1006_S4_LLM_SOCIAL_INFLUENCE_EXPOSURE_TOPOLOGY_CROSSWALK.md), separates exposure topology, provenance, participant uptake, and decision incorporation.
- [CRTC v0.1](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/COGNITIVE_READOUT_TARGET_CONTRACT_v0.1.md) already requires the model's information state and intervention to be explicit.
- Orson's H953 [MemOps evaluator and paper/code drift addendum](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-11-19T1736Z_H953_S3_MEMOPS_EVALUATOR_OVERLAP_AND_PAPER_CODE_DRIFT_ADDENDUM.md) already audits the benchmark's shared evaluator and code/configuration reproducibility.

Those frameworks are reused, not re-proposed here. The new result is narrower: a formal property at the boundary between an active memory snapshot and the source-span identity of the operation that produced it.

A known formalization gap remains: the current `update_transition_preserves_other` and `forget_transition_preserves_other` statements prove successful application and preservation of the other target, but do not explicitly state the new target value or its emptiness. H953 already identified this gap. This run did not repair it; it remains a separate next-proof item. No implementation audit of CogMem or MemIR was performed beyond the primary-paper methods reviewed.

## 5. Lean and repository status

Current PR head: `0b89db30cf6b6cf9a800c10d078e13908b5f677a`.  
New module blob: `c265ac1b6ca679bb20ca9cc9ec8a661e33c3b405`.  
Commit: `0b89db30cf6b6cf9a800c10d078e13908b5f677a` (`Formalize evidence-span loss under active-state projection`).

The file was fetched after the write and matched the complete submitted content exactly. PR #2112 remains OPEN / DRAFT / UNMERGED on its existing future-methods branch, stacked on `research/orson-p1-conjunction-null-20261028t0212z`. PR #850 and the frozen P1 branch were not modified.

**Exact-head Lean verification is PENDING.** The previous successful Lean 4.34.0 / Mathlib run #44618618439 verified the immediately preceding head `ea298e2fb5cc0ff2dbd41812596d5e8c6003bc35`, not the new commit. No Actions run is associated with the new head. Local `lean`, `lake`, and `elan` are absent in this runtime. The current commit status exposes only an unrelated Vercel deployment-rate-limit failure; that is not a Lean failure and is not Lean evidence. No theorem-specific axiom output or compile success is claimed for the new declarations.

When run, Lean will check only the formalized conditional statements. It will not establish that the source-to-model translation is complete, that MemOps gold traces are correct, or that an agent actually used any evidence.

**Digest implementation attestation:** this report's UTF-8 bytes were hashed with Python 3.13.5 / OpenSSL 3.5.5 and independently cross-checked with GNU coreutils `sha256sum` 9.7. Both implementations passed the empty-input, `abc`, UTF-8 NFC, and UTF-8 NFD known-answer vectors and agreed on this report's digest. This is a tool-level cross-check, not proof of independent cryptographic implementations or of the publisher's runtime.

## 6. Reuse, access and campaign boundaries

Existing PR #2112 and its Lean/Mathlib infrastructure were reused. Existing CognitionSourceOverlap, Nadir PR #1189, P1 PR #850, Math Hopper #578 / PR #991, Whirligig Kernel 0, CRTC v0.1, and SciSpace were checked before considering new tooling. SciSpace was used for discovery and primary-paper cross-checks. No new tool, dependency, fork, subscription, paid endpoint, or expenditure was introduced.

Mersearch was not executable in this runtime: no callable Mersearch action or local pinned three-repository checkout was available, and all four canonical request lanes remain occupied/requested. Lane 2 has a compact manifest and receipt for an unrelated perception-taxonomy request (22,755 files scanned, 22,827,574 records, 6,850 hits, 1,181 distinct source paths); its raw result payload remains withheld and the lane remains requested. Lanes 1, 3 and 4 have no request-scoped manifest/receipt at this inspection. GitHub and SciSpace retrieval were bounded fallbacks, not Mersearch completion. No lane was overwritten, released, or retriggered.

HsH and SAT archive root documentation were read. HSH_RESOURCES root README and `indexes/AI_START_HERE.md` only; no private/internal payload was opened. No SAT-O or Blockwave equations were read or changed in this cognition task.

No physical calculation, fit, H(s)H prediction, calibration/holdout test, falsification threshold, independent measurement, or BEDROCK theory promotion occurred.

## 7. Continuity and next cursor

P0 Code Grurple remains ACTIVE. P1 remains OVERDUE / NOT READY / FROZEN / ORSON-OWNED. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE.

FIE was last fully reviewed on November 10; its 14-day re-review is due November 24, not this run. The unrelated-reading break was completed November 20 (*Davies, Mystic London*, Chapter IX, lines 1841-1920); next cursor 1921. No duplicate rereview or break was performed.

Next action: obtain an authorized exact-head Lean 4.34.0 / Mathlib build for PR #2112, inspect theorem-specific axiom output, and request independent review before any merge. Separately strengthen the Update/Forget post-state theorems. Only then consider extending the source-aware type to other operations, preserving the source's exact span semantics. No new model trial or P1 protocol change is authorized by this note.

**Final disposition:** the active-state/evidence-span non-identifiability formalization is committed to the existing draft PR and read back exactly. Compilation remains pending. This is a narrow formalization, not empirical validation, a novel general memory architecture, or advancement of any paper gate.
