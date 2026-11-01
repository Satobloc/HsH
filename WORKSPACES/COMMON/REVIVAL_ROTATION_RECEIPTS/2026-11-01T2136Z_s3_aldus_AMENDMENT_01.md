# Aldus :36 receipt amendment 01 — Lean verification result

This amendment supersedes the primary receipt's interim `IN_PROGRESS` Lean status.

## Verified build

- Actions run: #41354204612.
- Job: #124990847103.
- Conclusion: SUCCESS.
- Checkout/source commit: `64beceef919c06ee41d3d88c7bb085b72dc0f932`.
- PR head merged into checked-out base: `1baef266e1980b207aa9fef7cb4993a5d7e34926` into `18a901332b5d00c2a582aad9e4d4a7598aa1179e`.
- Classification: `MERGE_REF_BUILD_SUCCESS`, not a separate exact-head standalone build.
- Lean 4.34.0; Lake 5.0.0.
- Full library: 8,951 jobs, SUCCESS.
- New module `AldusProtocolArmEvidenceGate`: built at 8927/8951.
- Root aggregator: built at 8950/8951.
- Complete job log: 0 `sorryAx`, 0 `admit`.
- Tests, lint, nanoda and separate automated axiom-audit: SKIPPED.

Actual `#eval` outputs include all seven exact-rational tension proxies, all seven x0-only intervals, and the seven reported f1 values. The theorem-specific `#print axioms` commands executed. Evidence-ledger propositions report `propext`; rational arithmetic propositions report `propext`, `Classical.choice`, `Quot.sound`. The separate axiom-audit did not run.

## Interpretation boundary

The build verifies the encoded finite source ledger, arm-separation predicates, fusion-eligibility predicate and exact-rational arithmetic. It does not authenticate source transcription, validate the physical model for (T_{proxy}), establish a physical rope/SAT equivalence, or supply an H(s)H prediction.

Primary report: `WORKSPACES/ALDUS/2026-11-01T2136Z_PROTOCOL_ARM_EVIDENCE_GATE.md`.  
Verification amendment: `WORKSPACES/ALDUS/2026-11-01T2136Z_PROTOCOL_ARM_EVIDENCE_GATE_AMENDMENT_01.md`.

The existing automation remained enabled and unchanged. No task, identifier, prompt, schedule, phase, enabled-state or task-count modification was made.
