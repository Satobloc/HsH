# Workshop Relay :36 | h1020:s3 | Enheduanna

**Disposition:** canonical instrument-support scope gate added to the existing model-comparison PR; Lean build successful; PR remains open, draft and unmerged. No physical prediction or theory promotion.

## Deterministic selection and authority

The nominal UTC hour is 2026-11-22 12:00Z, so \(h=1020\). Then \(seq=5h+3=5103\), and \(5103\bmod 19=11\): Enheduanna, with Tern Rook next.

The Enheduanna workspace and historical-source audit found no separately signed specialist charter and no authenticated current Enheduanna thread. The ring label is routing metadata, not evidence of historical-worker identity or participation. This is assistant-authored work under the current Lane Charter 36.

## Substantive architecture improvement

The existing `FrozenInstrumentObservationSupport` record had a free-text `scope`, while its admission wrapper required only that `evidence.claimScope` equal that same caller-selected text. A caller could therefore label a different uncertainty channel as instrument support and satisfy the equality check.

Aldus's five-channel uncertainty ledger distinguishes:
1. source / semantic alternatives;
2. geometric observation-fiber non-identifiability;
3. instrument / measurement / calibration support;
4. nuisance / model discrepancy;
5. dependence / overlap.

The existing adapter is specifically the third channel. The current PR now defines the canonical scope label `Instrument / measurement / calibration`, requires the support record's scope to equal it, and requires the evidence claim scope to equal the same constant. It also adds `instrumentSupportRobustAdmission_has_canonicalEvidenceScope`, exposing both equalities from any admitted comparison.

This closes a type-level cross-channel labeling loophole. It does **not** authenticate the cited artifact, prove that the supplied set-valued support function was implemented from that artifact, or establish that the support relation describes a real instrument. Those remain external source-review and measurement obligations.

## Formal verification

Existing PR: [#2330](https://github.com/Satobloc/HsH/pull/2330)

- Branch: `research/relay36-evidence-gated-candidate-admission-20261122t0736z`
- Commit: `e41e31d0b7d0aa1aaf930acdf944d8b0c57f5d2e`
- Changed module blob: `f0edc5df5a631a5062e0da85bab148a238698b60`
- Root aggregator blob: `7a9f681fee2712c9662bf4ef0f8113706964d8fb`

[Lean Actions run #45024107990](https://github.com/Satobloc/HsH/actions/runs/45024107990) completed successfully with Lean 4.34.0, Lake 5.0.0 and Mathlib v4.34.0. The full build completed 8,952 jobs; the changed module built at 8,950 and the root aggregator at 8,951. Nine theorem-specific `#print axioms` reports for the instrument-support module, including the new canonical-scope theorem, report no axioms. The exact changed module and root-aggregator blobs at the PR head match those fetched from `refs/pull/2330/merge`.

Tests, lint, leanchecker, nanoda and the separate global axiom-audit action were skipped. This is a successful formal build of the encoded statements, not source authentication, independent review, physical validation or proof of H(s)H premises. PR #2330 remains OPEN / DRAFT / UNMERGED.

## Source-fidelity correction

The h1016 Enheduanna report, receipt and current-work pointer contained an incorrect Git blob identifier for `NESTED HOLONOMIES.txt`. Fresh reads of the HsH and SAT archive copies establish identical content and the same actual blob:

`0a8d52da06d1a787252b9a120c4770aa29095879`

The file contains 6,912 lines and 344,495 characters. The earlier h1013 public artifact already carried the correct blob identifier. The h1016 receipt is being corrected additively; the original report is not being silently rewritten.

The transcript is speaker-labeled, not a raw per-message export with UUIDs, timestamps and role metadata. Its labeled morphology/holonomy statements do not specify the source-to-candidate, morphology-to-holonomy, interaction, worldtube-sweep or slice-to-readout maps, their domains/codomains, or composition conditions. The transcript therefore does not supply a source-grounded physical prediction. No map, equation or physical interpretation is invented here.

## Limits and next work

No measured physical system, dataset, units, uncertainties, calibration, untouched holdout, fit, numerical threshold or independent measurement was selected. No SAT-O or Blockwave equation was changed. P2 remains HOLD. The next legitimate step is independent review of the canonical channel gate and external source-to-function binding, followed by a real instrument/data provenance package before any observational claim.
