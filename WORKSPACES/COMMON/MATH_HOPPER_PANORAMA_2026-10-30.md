# Archive Math Hopper: panorama and return checkpoint
**Date:** 2026-10-30  
**Status:** implementation committed; bounded three-repository Actions pilot configured; end-to-end pilot execution and output NOT VERIFIED.

## 1. What is actually saved
- `tools/archive_math_hopper.py`: committed bulk extraction adapter. It calls the existing `mersearch_math_structural.extract_math`, preserves repository/path/source SHA/locator/message identity/offsets/raw notation, emits JSONL plus manifest/report, and streams candidate records to disk.
- `.github/workflows/archive-math-hopper-three-repo-pilot.yml`: read-only bounded pilot workflow, nominally 100 files per source repository, records actual checkout commit SHAs and uploads aggregate manifests rather than raw extracted equation text.
- Issue #578 remains the control ledger and contains the historical local prototype result, worker notes, and explicit unverified statuses.

## 2. Evidence ledger
| Layer | Current evidence | Status |
|---|---|---|
| Discovery code | Source read back from default branch; imports existing Mersearch extractor | COMMITTED |
| Streaming | Current source writes JSONL incrementally; notation fingerprints remain an in-memory set | SOURCE-VERIFIED |
| Local smoke | A separate richer prototype found 7 candidates in one excerpt, 7/7 brace-balanced; no symbolic/Lean/empirical tests | LOCAL PROTOTYPE ONLY |
| GitHub smoke / three-repo pilot | Workflow source exists; no verified run receipt or artifact readback established here | CONFIGURED_NOT_VERIFIED |
| Symbolic / Lean | Not run by hopper; existing formalization path remains separate | NOT_RUN |
| Physical validity | No physical claims tested | NOT_RUN |

The 7/7 micro-test is not a result from the committed adapter and is not a mathematical-validity score. Do not extrapolate its 0.71 s startup-dominated timing to repository throughput.

## 3. Big picture: what problem this solves
The hopper is an intake and provenance layer, not a theorem prover and not a truth meter. Its value is to remove manual discovery/clerical work and create an inspectable inventory that can feed the existing pipeline:
1. Source documents and conversations.
2. Candidate extraction with exact source identity and offsets.
3. Notation normalization and duplicate/family grouping without deleting distinct occurrences.
4. Context recovery: definitions, symbols, domains, assumptions, units, derivation dependencies, and source-version integrity.
5. Typed proof-obligation classification.
6. Safe symbolic/numerical/dimensional checks where appropriate.
7. Curated Lean/Mathlib formalization and compilation.
8. Separate comparison with actual measured physical systems and uncertainties.

Maintain separate denominators for detected, source-faithful, parseable, typed, symbolically checked, Lean-proved, and empirically supported claims. NOT_RUN, BLOCKED, OUT_OF_SCOPE, COUNTEREXAMPLE, PARSE_ERROR, PROOF_FAILED, and PROVED_CONDITIONAL_ON_ASSUMPTIONS must not be conflated.

## 4. Most important warning: extraction fidelity precedes formal verification
The 2026-10-30 Ravel source-integrity report on the real CREMA muonic-helium equation found that a web-text representation omitted a third additive nuclear-structure term present in the original PDF. On the measured Lamb shift, the complete equation reproduced the reported radius; omitting the term shifted the result by about 0.0384 fm. The report and source-derived checks are recorded in issue #578 comments and WORKSPACES/RAVEL/2026-10-30_0324Z_MUONIC_HELIUM_ORIGINAL_EQUATION_GATE.md.

This is a critical design lesson, not yet a demonstrated defect in this hopper: a perfectly balanced, parsable, or Lean-provable incomplete transcription can still be wrong as a representation of its source. Before high-volume proof admission, add source-fidelity checks, real-document golden fixtures (including multiline/aligned additive terms and uncertainties), missing-term warnings, and source-location coverage. OCR and PDF layout recovery may matter more than raw parser speed.

## 5. Scaling and engineering judgment
- Do not launch 100 redundant Lean installations. Use one pinned Lean/Mathlib toolchain, compiled caches, bounded parallel jobs, and queue-based scheduling.
- Stream candidates; move deduplication/fingerprint indexing to SQLite or another disk-backed index only if measured corpus size makes the current in-memory key set material.
- Benchmark actual files by format, extraction yield, false-positive rate, missed-equation rate, memory, wall time, and cost before deciding whether a full scan is a weekend job.
- Treat scanned PDFs/OCR, tables, Word/Office formats, diagrams, source-code equations, and malformed TeX as separate coverage classes.
- Never execute arbitrary archived code or untrusted mathematical expressions. Parser/prover stages must be sandboxed and resource-limited.
- Keep protected conversations and raw snippets out of public artifacts unless explicitly cleared; public outputs should be aggregate statistics and provenance-safe references.

## 6. Priority order
**P0: verify the bounded pilot.** Obtain the actual Actions run, inspect logs/artifacts, confirm all three checkout SHAs and file counts, and diagnose any access/checkout failures. No full-corpus launch before this gate.

**P1: establish source-fidelity quality.** Build a small golden corpus of authentic equations from Markdown/TeX, PDFs, and conversation exports, including the CREMA missing-addend case; measure precision and recall against original source renderings.

**P2: improve candidate semantics.** Recover surrounding prose, symbol definitions, assumptions, units, and dependency links; group equivalent notation while preserving every original occurrence and correction history.

**P3: route to checks.** Generate typed proof obligations and safe parser checks, then admit only reviewed claims into the existing formalization/equations.json and Lean pipeline. Record conditional assumptions verbatim.

**P4: scale.** Measure per-format throughput and queue cost, then scan the full eligible archive in resumable shards with checkpointed manifests.

## 7. Scientific placement
This infrastructure is administrative/mathematical support for SAT/H(s)H, not a new physical result. It can recover and test internal mathematical claims, expose contradictions, locate reusable derivations, and accelerate paper preparation. It cannot by itself establish that a geometric interpretation corresponds to nature. For physical calculations, the standing BEDROCK rule remains: use genuine measured/observational systems and data, retain uncertainties, distinguish predictions from fitted parameters, and never invent fixtures or measurements.

## 8. Exact resume cursor
Start with issue #578. First verify the configured three-repository workflow and read its artifacts. Then add the original-source fidelity golden fixture before widening ingestion. Keep the existing equation registry and Factory Floor admission gates; do not create a competing registry or promote unreviewed extraction candidates.
