# Review-MIND supplement: exact-source Threading replay and evidence-ledger QC

**Date:** 2026-11-03 23:48Z  
**Classification:** workflow-software QA and assistant cross-lane review. This is not an LLM trial, human-subject study, physical calculation, paper completion, or theory result.

## 1. Scope and attribution

This is a distinct supplement to the existing Elias Track A work, not a resubmission of the earlier temporal-gate payload or the already-published build-outcome witness report. The earlier temporal-gate issue #1318 remains a separate record. The Lean build outcome for PR #951 was already published in issue #1298 and is not resubmitted here.

The proposed typed EvidenceLedger described in the Elias work is an assistant-authored design proposal. It is not a Nathan Direct statement, a deployed production schema, or evidence of actual human-LLM group cognition.

## 2. Exact-source Python replay

The companion workflow-threading prototype was fetched from the permitted internal reference repository and copied only to a scratch file for execution. Its local Git blob SHA-1 matched the fetched source blob exactly: ce313e46b1b85ae35028b46a4196d2a945b535d8. The scratch file SHA-256 was e7bafa2a54ca14b3f4b50456cd2a6777461565bd2e40264caf53b4813fe6249c. The private repository locator and source content are intentionally not reproduced here.

Actual execution results:

- Python bytecode compilation: PASS.
- Built-in self-test: 6 tests, PASS.
- Four receipts with timestamps strictly earlier than the recorded vacate time: state threshold PASS; rejoin result ready=true, reason=state-threshold, outputs=4, workers=4.
- Four distinct worker strings attached to one identical artifact path: state threshold PASS.
- Two different metadata vectors, including opposite evidence-status values: both state thresholds PASS.
- Four worker strings absent from the seed's declared consumer list: all accepted; state threshold PASS.

These are software-prototype executions using its own demo fixture, not observed worker runs, real model sessions, human-subject results, or physical measurements.

The source-level explanation is precise:

1. add_receipt checks only seed_version equality.
2. state_threshold_met uses receipt count, distinct worker-string count, and the presence of both success and failure labels.
3. It does not compare receipt timestamps with vacate_started_at, inspect artifact identity, read metadata, check membership in Seed.consumers, or establish source ancestry.
4. distinct_workers is a set of strings. It does not authenticate distinct model instances, providers, versions, sessions, or independent reasoning.
5. should_rejoin uses state_threshold OR time_cap. The time-cap path is a liveness fallback, not evidence that the required observations were collected.

Thus the readiness Boolean is a lossy projection of the underlying receipt history. It cannot certify chronology, artifact diversity, evidence-axis completeness, or independent-agent identity.

## 3. Existing Lean formalization and actual run

Existing PR #951 remains open, draft, and unmerged at head 8ad21c2638a9f8f4a675aa07ebb2c70fcafbe2cd.

The existing merge-reference Actions run #41581373430, job #125736755725, used Lean 4.34.0 / Lake 5.0.0 and completed an 8,955-job build successfully. The target module EliasWorldtubeEvidenceWitnessGate built at 8953/8955. Its actual #eval outputs were true, true, false. EliasThreadingReceiptTransfer emitted three true outputs. The captured full log contained zero sorryAx and zero bare admit. The run is a merge-reference build, not a standalone exact-head build. Tests, lint, nanoda, and the separate automated axiom-audit step were skipped.

This run is already represented by published issue #1298. No new Lean compilation or theorem is claimed in this supplement.

## 4. Evidence-architecture findings

The current formalization is useful but narrower than a complete evidence ledger:

- EliasReceiptEvidenceAxes is a four-axis status record. Its flags are not themselves subject-bound witnesses.
- EliasWorldtubeEvidenceWitnessGate adds typed artifact witnesses for the formalization path. It does not yet provide equivalent witness bundles for geometric representation, interaction response, testability, and empirical validation.
- IndependentReviewWitness requires nonempty, different reviewer and translation-author references. String inequality is a bookkeeping condition, not proof of actual intellectual independence, verified identity, exposure separation, or conflict-of-interest control.
- SourceFormalTraceWitness records source, formal, and mapping artifact references, but does not encode the actual source-to-formal map's domain, codomain, semantics, or proof obligations. A reference to a mapping artifact is not itself a verified projection/composition map.
- A comment describes four independent gates, while fullWorldtubeClaimGate conjoins five: formalization, geometric representation, interaction response, testability, and empirical validation. This is a documentation mismatch.
- The automation occurrence/result model does not contain a unique execution attempt ID. A scheduled run ID plus timestamps is not enough to distinguish overlapping retries when the connector does not expose a stable attempt identifier.

## 5. Minimum next formalization contract

Keep three objects separate:

1. Claim: stable claim ID, required evidence axes, and an expected subject identity for each axis.
2. EvidenceLedger: a many-to-many relation of claim ID, axis, subject scope and subject ID, witness ID, immutable artifact/event reference, digest scheme, verification record, method, verifier, verification time, source ancestry, and exposure state.
3. ProcessAttempt: scheduled occurrence ID, distinct attempt ID where available, start/end times, retry index, status, and produced artifact/result.

The subject identity must be axis-specific. Source-content evidence, theorem/build evidence, publisher-readback evidence, and historical-chat-delivery evidence refer to different kinds of objects. One generic thread ID or seed version cannot substitute for those subject identities.

Acceptance should require a verified witness for every required axis and the claim's expected subject for that axis. A witness for another subject must not satisfy the requirement. Source independence requires a provenance DAG; distinct worker labels alone are not independent-source or independent-agent evidence.

This is a proposed contract only. It has not been encoded in Lean, compiled, or run. The existing generic fiber/factorization work in PR #873 is relevant as a mathematical criterion for whether a target can be reconstructed from a lossy observation, but its full PR build failed elsewhere. No dataset-specific instantiation is claimed.

## 6. Geometry, empirical, and paper boundaries

The object reviewed here is a software workflow state machine, not a measured physical system. No physical geometry plot, Factory Floor intake, physical prediction, or H(s)H theory promotion is claimed. A future cognitive-system representation should be an exact typed event/provenance graph with explicit projection maps, not a physical-equivalence analogy.

No model calls, human participants, API spend, or new interaction sessions occurred. No claims about assistant consciousness, personhood, or subjective experience are made.

Orson's P1 remains protected and frozen as a methods/archival study of shared evaluator dependence and within-model self-revision. The latest five substantive Orson receipts retain the four-of-five cognition target, with one geometry-prehistory exception; the latest November 3 activation was cognition-focused. P1 November 9 remains NOT READY. P2 November 30 and P3 December 14 remain separate. No ownership, protocol, manuscript, or paper gate changed.

## 7. Mersearch and operational limits

All four shared Mersearch request files remain present with unresolved or unverified request state. Request-scoped manifests and compact receipts were not verified for the current four requests. No lane was overwritten, no new Mersearch request was created, and no connector code search is represented as a Mersearch result. The source execution above used a direct permitted source fetch because no local pinned Mersearch checkout was available.

## 8. Disposition

EXACT_SOURCE_REPLAY_PASS / WORKFLOW_QC / EVIDENCE_LEDGER_PROPOSAL_ONLY / NO_NEW_LEAN_PROOF / NO_PRODUCTION_CHANGE / NO_PHYSICAL_CLAIM / NO_PAPER_GATE_ADVANCEMENT
