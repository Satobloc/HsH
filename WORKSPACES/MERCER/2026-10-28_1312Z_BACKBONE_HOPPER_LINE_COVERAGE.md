# Mercer Workshop :12 | Original SAT backbone equation-extraction coverage gate | 2026-10-28 13:12 UTC

**Status:** SOURCE-GROUNDED EXECUTED RETRIEVAL-QA; mathematical source-extraction defect, **not** physics verification or a validated count of true equations. Actor is the current assistant operating under Mercer's documented indexing/provenance remit, **not** an authenticated historical Mercer ChatGPT conversation.

## Controlling intake and provenance

- Current BEDROCK Git blob `4cabda482c48c217614b868a2138409275df9bf7`, 86,946 characters retrieved; controlling real-data/permission/correction-first opening and closing normalization rules read, not an exhaustive line-by-line review.
- Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e`; Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; Common onboarding `7d78afd95654bd9d41bbbcc6ba56db1fd10b3110`; revival V3/thread-routing, branch map, scheduler authority, Mercer README `817ce5c255e9c88aa0c63cb43670690b039f1cdb`, trial checkpoint and incoming Meridian :00 handoff `28644749fe2a9ebafb3129b5f9958de5309f144d` inspected.
- Mersearch-first worker guide `086778737a004c467b0b52142d71aa5b961fc166` read. Shared `MERSEARCH_REQUEST.json`, blob `c1fa41685d5103f84b0e831a7b1fd898f976f2bf`, is occupied by Nathan's Indicatrix inventory. No overwrite, no claim of a full Mersearch search. Fallback: bounded GitHub connector search and full source fetch from the original archive plus its HsH copy.
- Original SAT source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, Git blob `1854995be3311f565739f2be64269cbb0385a82f`, 233,643 decoded characters, 1,563 lines. Exact HsH copy `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsH-SAT Roundup 2/SAT MATH — BACKBONE.txt` has the SAME blob: two occurrences, **one source body**. Sable and Loom already established its three-path duplication and 23-section composite; this is credited prior art. Historical Nathan Direct authorship of each composite equation is **not authenticated**.
- Interrelated controls read: original `SAT 4D Theory Work/module8H.tex`, blob `6748806846b4fa72a5271a6ad856dad14963691c`; `2026/SAT CORE — HELIUM STANDARD ATOM 2.txt`, blob `5e0f43950244bd5173799ec74b985944cf169ac2`; `HsH COSMOTOPOLOGY.txt`, blob `9f42b96adfa1cb9b310ad8d89843b93ae0379922`. Different texts have different extraction-format coverage; they are not independent verification of physical assertions.

## Executed original-source audit

Inspected current `tools/archive_math_hopper.py` Git blob `8d55a2d21c0cce3e2fc361e8fcf77996c80ba25c` and its existing `extract_math` implementation in `tools/mersearch_math_structural.py`, blob `b3d4f96bcf5c45c093f030a25c9bb5b94e2ec561`. Existing smoke workflow `7196328410bf38effdd545a3d8d47dacea8259ea` checks candidate presence, not exhaustive source-math capture. No replacement extractor was invented.

The actual single-line fallback pattern is `^.{0,200}(?:=|≈|\\frac|\\sqrt|√|\\^).{0,200}$` with multiline mode. Its longest trigger token is five characters. Hence a line of **more than 405 characters cannot match that line regex**, regardless of its content. Separate delimited extraction can still capture material on such a line. The converse is false: a shorter line can also fail when the trigger occurs outside the two 200-character windows.

A JavaScript port of the existing extractor's literal patterns was **executed on the fully retrieved pinned SAT backbone** (source spans and line offsets retained). It found:

| Actual SAT backbone measurement | Count |
| --- | ---: |
| Total lines | 1,563 |
| Lines containing one of the exact formula-token triggers | 517 |
| Extractor spans (all types) | 407 |
| Delimited spans | 2 |
| Line-candidate spans | 405 |
| Formula-token lines with **no overlapping extractor span** | **111** |
| Formula-token lines longer than 405 characters | **66** |
| Of those 66, lines with no overlapping span | **66** |
| Remaining token-bearing unspanned lines, length at most 405 | **45** |

This is **111/517 heuristic token-bearing lines not covered**, not an equation recall percentage and not 111 demonstrated false physical statements. Formula-token detection itself includes prose, Markdown and non-equation material. Long-line examples are source lines **5, 79, 80, 92, 110, 125, 131 and 146**, including the S³ equation, B=3/(4π), projected visible-fraction formula and Hubble comparison. Their physical claims remain unaudited.

Additional source-format checks: original helium source has 34 heuristic formula-token lines, 5 without any extractor span; 4 token-bearing lines >405, 3 without spans (the fourth is caught by a separate delimiter). Original module8H has 15 such token-bearing lines and zero uncovered by this particular heuristic. Original COSMOTOPOLOGY has 232 and 1, respectively. This demonstrates **format-dependent loss**, not a global recall estimate.

## Formal proof, actual software trial and status

Draft Lean/Mathlib PR **#897**, `research/mercer-hopper-line-window-gate-20261028t1312z` against existing `infra/lean4-verification-20261023`, adds three conditional propositions: (1) 405-character upper bound, (2) no eligible line-window match above 405, (3) prefix beyond 200 rejected. **Compiled status must be established from the exact final CI job log; source submission alone is NOT a Lean proof.** The formal theorem models only the regex window bound; it does not prove archive completeness or physical correctness.

A separate read-only Python replay `tools/audit_hopper_backbone_coverage.py` was committed to that draft branch. It verifies the exact original source Git blob, invokes the existing Python `extract_math`, counts token-bearing uncovered lines, and prints aggregate metadata only. The dedicated workflow `.github/workflows/mercer-hopper-source-audit.yml` was committed; **actual CI outcome requires independent log inspection**. The original archived text was not modified.

## Interpretation and next actions

1. Distinguish `source_occurrence`, `unique_source_body`, `heuristic_token_line`, `extracted_candidate`, `parsed_equation`, `compiled_proposition`, and `physically_tested_claim`. None is a substitute for the next.
2. Add a **fail-visible** source-coverage warning or separate preflight counter to the existing Math Hopper before bulk archive scoring. Prefer source-located review of long prose/formula lines and TeX blocks; do not silently promote heuristically segmented prose into equations.
3. Compare the exact Python replay output with the JavaScript port, inspect PR CI, and independently review the 111 candidate gaps. Preserve original source bytes and all duplicate paths.
4. P1 Nov 9, P2 Nov 30, P3 Dec 14 remain open for independent/hostile review, LaTeX, source provenance and PDF/reader. This retrieval-QA work does not satisfy a manuscript gate.

**Unrelated reading:** original `SAT Mark V/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines **611–670** read after Meridian's 556–610; next cursor **671**. This was literary/linguistic context, not physics evidence. FIE team reread October 27 (<14 days), no forced full reread.

**Continuity:** incoming Meridian :00 handoff consumed; selected Mercer index 16, successor Ravel index 17, run `REVROT3-19-20261011:421:s1`. Historical worker access and original ChatGPT-thread delivery remain unverified. No scheduler mutation, sixth recurrence, signet change, BEDROCK promotion, new physical calculation, fabricated observation, or CODATA score.
