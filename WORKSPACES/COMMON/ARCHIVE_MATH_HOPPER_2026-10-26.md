# Archive Math Hopper | bulk preflight and route to Lean
**2026-10-26 | Source-backed tool integration, phase steering S03/S04/S07/S12**

## Direct answer / why this exists

Nathan requests an archival and future-document **hopper** to automatically detect, locate, deduplicate and prescreen mathematical claims in the entire SAT/H(s)H corpus, then route suitable work into existing SymPy/real-data and Lean verification. A simple per-document score such as "11/15 survived" is desirable **when the meaning of the numerator is clearly labeled**. Archive math recovery should not require one researcher laboriously hand-transcribing every equation before broad mechanical triage.

**Existing working pieces to reuse, not reinvent:** 
- Mersearch 1.0/1.1 discovery: `tools/search_archive_content.py`, `tools/mersearch_math_structural.py`, `tools/build_mersearch_index.py`. Mersearch knows chat speaker, message/source identity and math-notation normalization; it does **not prove math**.
- Curated checks: `formalization/equations.json`, `tools/equation_pipeline.py`, `formalization/README.md` and Windows `formalization/leancheck/run.ps1`.
- Independent evidence lanes: `WORKSPACES/MERCER/MATH_AUDIT_HARNESS/README.md`; original 2025 SAT-O Math-Locking; `WORKSPACES/COMMON/FORMALISM_INDEX/CROSS_FORMALISM_INDEX_2026-10-10.md`.
- Already real: FACTORY_FLOOR issue #1–#5 cite successful Lean CI, five checked formal claims with narrower theorem scope than their physical conjectures, and HsH PR #262 was still open when last inspected.
- **New integration script committed 2026-10-26**: [tools/archive_math_hopper.py](../../tools/archive_math_hopper.py). It reuses the existing Mersearch source-message parser and math occurrence extraction, scans arbitrary existing checkout roots, preserves file SHA-256/paths/message IDs/record locators and notation fingerprints, and emits candidate JSONL plus a manifest/report. It **does not run SymPy on untrusted archive text or manufacture Lean source proofs**.
- [Source-smoke CI workflow](../../.github/workflows/archive-math-hopper-smoke.yml) created for a bounded one-original-HsH-file scan, checking that proof scores are null. **CI completion is unverified until actual run/job log receipt is inspected**.

## On a PC with sibling checked-out archives

Use a trusted normal Python interpreter from the HsH checkout root. First run only one source file:

```powershell
python tools/archive_math_hopper.py "WORKSPACES/ORSON_VAY/OV_CUMULATIVE_FINDINGS_2026-10-20.md" --out "D:\HSH_MATH_HOPPER\sample"
```

For a bounded scan of the three repository folders (replace example paths with actual checkout locations):

```powershell
python tools/archive_math_hopper.py "D:\repos\SAT_THEORY_ARCHIVE_2023-25" "D:\repos\HsH" "D:\repos\HSH_RESOURCES" --out "D:\HSH_MATH_HOPPER\three_repo_scan"
```

Outputs (local only): `CANDIDATES.jsonl`, `MANIFEST.json`, `REPORT.md`. Automatic collection does not change original source content or the existing equation registry. The default source finder excludes `.git`, `PRIOR_ART`, `QUARANTINE` and generated build folders; these are privacy/coverage choices subject to deliberate review. Check raw-source extraction and OCR manifests before concluding anything is absent.

## Four different denominators and their meanings

| Score | Example notation | What is actually established? |
|---|---|---|
| **Captured** | 7/7 delimited in an inspected excerpt | Candidate notation identified and located. May still contain nonsense or transcription error |
| **Syntactically screened** | 11/15 parsed | Some chosen grammar/parser recognizes expression. Not a mathematical proof |
| **Mechanically checked** | 6/9 declared tests PASS | Specified dimension/algebra/numeric/limiting-case checks passed. Count tests and their assumptions separately, not "true equations" |
| **Lean-accepted** | 5/7 explicitly formalized theorems compile with no unauthorized axioms/sorry | Machine kernel accepts those exact *statements conditional on named premises*. Not an empirical physics test |

A formal failure can arise from broken source syntax, misrecognized notation, missing assumptions, theorem not proved within time, a false statement, or an unsupported tactic/library. **"Failed proof attempt" != "false mathematical statement"; "Lean accepted" != "true physical model".** Use separate unresolved/unsupported/no-check statuses. Never divide confirmed true by every extracted snippet and call it a theory accuracy percentage.

## Triage record identity and dedup discipline

At minimum:
`candidate_id, repository, path, source_sha256, source_locator, conversation_id, message_id, speaker, original_timestamp, char/line span, raw_math, notation_fingerprint, namespace, units, assumptions, domain, role, claim type, derivation/check dependencies, source-to-source links, proof/test status, evaluation method, confidence, completeness, editorial flag, next work`.

A normalized glyph string gives a **notation fingerprint**, not equivalence: a term named `T` may mean temperature or tension; identical formulas under different premises are not the same claim. Preserve all occurrences and link a reviewed canonical *claim family* to occurrences; genealogy is not a deletion policy.

## Technical next gates (do not claim complete)

1. **Tool smoke**: verify GitHub Action job on exact committed hopper SHA and source excerpt; inspect actual JSONL count/locators, false-positive sample and format coverage. Current local standalone prototype using an original SAT-O D1/D2 excerpt detected **7 candidates / 1 file** with **7 superficially balanced TeX expressions**. This is extraction-only and that standalone test is a **different richer local program variant** than the GitHub adapter. Do not attribute its 7/7 to GitHub CI without a verified run.
2. **Corpus-scale throughput baseline**: 100 files per kind, then 1,000, then 3-root read-only scan; time, RAM, bytes, skipped/oversized, OCR gaps, questionably classified code blocks, duplicate path/family counts and exact data custody. Do not guess performance from file counts alone. Respect GitHub Actions free-tier time/compute/storage and repo visibility.
3. **Improve extractor**: prioritize TeX environments (`equation`, `align`, `gather`), display/inline delimiters, Markdown tables, plaintext formula heuristics, PDF native text/MathML/LaTeX, JSON records, and message-aware split-block reassembly. Count **unmatched delimiters and missing text** explicitly; do not quietly exclude extraction failures. Add binary/scan OCR only for genuine gaps and only with approved data boundaries.
4. **Prescreen safely**: typed static grammar + symbol/namespace and unit checks on approved claims. Evaluate supported mathematical expressions through explicitly constrained trusted parsers, never `eval` and never arbitrary SymPy `sympify` on untrusted archive text. Distinguish syntactic parse, algebraic zero reduction, dimensional contradiction, independent counterexample, proof search and unknown.
5. **Curated promotion**: when source context/definitions established, add entries to existing `formalization/equations.json` or comparable index with explicit reason and dependency. Batch proof obligations with one fixed Lean/mathlib environment and reusable compiled cache. Avoid 100 duplicate Lean installs; parallelize bounded independent theorem jobs only after baseline identifies genuine compiler saturation.
6. **Backend evidence**: capture exact theorem source, Lean toolchain, proof and imports, named axioms/assumptions, kernel result, timeouts, parse errors and failure classes; compare to Mathematica/Wolfram/Mathlib/SymPy controls and actual physical measurements when physics claim. Physical calculations still require real data under BEDROCK.
7. **Long-term intake**: file-drop/PR/issue/import queue routes user documents and existing archive extractions through same crawler, stores private raw corpus separately from public metadata, increments only changed source hashes, and pushes triaged high-value claims to Factory Floor review, not directly to theory authority.

## Outside tools actually researched

- Lean 4 first official stable release **September 8, 2023**, not something new to October 2026. Lean/Mathlib can run GitHub CI on standard runners through [leanprover/lean-action](https://github.com/leanprover/lean-action) with caches. Whether the historical ChatGPT/GitHub account had configured write permission is **not** established.
- [HuggingFace latex2sympy2_extended](https://github.com/huggingface/latex2sympy2_extended): existing LaTeX math parser to examine in a small sandbox for grammar coverage, reliability and safe isolation before ingest. Some conversions perform calculations.
- [facebookresearch/atlas-lean](https://github.com/facebookresearch/atlas-lean) and [autoform-bot](https://github.com/facebookresearch/autoform-bot): existing large-scale autoformalization approaches worth auditing before designing our own LaTeX-to-Lean LLM bridge.
- [PyMuPDF4LLM](https://pymupdf.readthedocs.io/en/latest/pymupdf4llm/index.html): PDF text extraction/hybrid OCR candidate; only after auditing existing canonical extraction. [Mathpix OCR API](https://mathpix.com/pricing) may be an optional paid fallback for hard scientific page extraction, never an automatic external upload of protected archive sources.
- Existing Wolfram plugin and Wolfram desktop/service resources may assist curated special-function and analytic checks; **no automatic broad permissions/billing implied**.

**Next executable step:** retrieve first GitHub smoke run result, fix extraction bugs, then safely shard an approved 100-source sample with *measured* parser speed and error categories. Source and error samples decide what must be built before the next tranche.

**Supervisory return cursor:** Steering Charter → Three-Paper Campaign → archive math hopper measured pilot → source-specific Factory Floor proof queue. Extraction results feed existing review, not a new autonomous truth tribunal.

> **STREAMING FIX (2026-10-26):** After source smoke intake was committed, the hopper was revised in commit `cfaca135e1041ce0f5a5ed0081fd612e88a42456` to write `CANDIDATES.jsonl.tmp` incrementally and only rename it when the scan finishes. Candidate records are no longer held in one growing list. Notation fingerprints are still tracked in a set for a summary distinct-count; for millions of truly unique expressions, that set may itself need a disk-backed SQLite option. Full 3-repo runtime remains **UNVERIFIED**; the GitHub smoke workflow should test the current script, not earlier SHAs.
