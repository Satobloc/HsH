# Mercer :12 | SAT backbone Math Hopper source-coverage regression | 2026-10-28 13:12Z

**Status:** EXECUTED ORIGINAL-SOURCE RETRIEVAL QA; no physical calculation, no new SAT prediction, no authorship promotion.

Original SAT mathematical composite: Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt, Git blob 1854995be3311f565739f2be64269cbb0385a82f. Identical HsH development copy, so two paths represent one source body. Sable/Loom previously established composite-section and duplicate-source provenance; not newly claimed. Historical author of each equation is not authenticated Nathan Direct.

The existing Mersearch math extractor (tools/mersearch_math_structural.py, blob b3d4f96bcf5c45c093f030a25c9bb5b94e2ec561) uses a line-candidate pattern allowing <=200 characters before and after one trigger of at most five characters. Any line >405 characters is impossible for that specific fallback to match, although independent TeX-delimited extraction can still recover some math.

**Independent real-file execution:** JavaScript port and actual Python 3.12 CI on pinned source agree: 1,562 physical lines; 517 heuristic formula-token-bearing lines; 407 extractor spans; **111 token-bearing lines with no overlapping span**, including **66 lines longer than 405** (all 66 uncovered). Remaining 45 uncovered token-bearing lines have length <=405. This is a heuristic retrieval coverage defect, NOT 111 established equations or a mathematical-truth/recall percentage. Examples include original source lines 5, 92, 125, 146, which contain proposed S3, B, visible fraction and Hubble relations.

**Actual Python verification:** CI run #40694556929, job #122837757531, SUCCESS, including source Git-blob check and read-only exact Python extractor replay. Source-audit script tools/audit_hopper_backbone_coverage.py and workflow .github/workflows/mercer-hopper-source-audit.yml are in draft PR #897.

**Formalization:** PR #897 also contains three conditional Lean 4/Mathlib theorems for the 405-character bound and rejected prefixes; compilation must be verified separately from actual Lean CI job logs. The bound proves only a regex-model property, not completeness or physical truth.

Detailed executed audit: WORKSPACES/MERCER/2026-10-28_1312Z_BACKBONE_HOPPER_LINE_COVERAGE.md, independently read back. Mersearch request bridge was occupied by the existing Indicatrix inventory; bounded direct GitHub search/fetch fallback was used, not represented as a full Mersearch run.

**Action:** Add fail-visible uncovered-token-line counters to the existing Math Hopper, manually review actual source spans, and preserve duplicate source paths while deduplicating evidentiary bodies. P1 Nov9, P2 Nov30, P3 Dec14 remain open for original source, independent review and readable manuscript gates. No cross-thread ChatGPT delivery, scheduler change, signet or BEDROCK promotion.
