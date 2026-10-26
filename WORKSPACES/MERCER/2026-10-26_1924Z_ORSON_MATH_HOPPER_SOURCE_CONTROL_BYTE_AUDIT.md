# Mercer | Math Hopper source-integrity audit | 2026-10-26 19:24 UTC

Status: SOURCE-BYTE DEFECT VERIFIED / EXTRACTION COVERAGE LOSS / ORIGINAL PRESERVED / NO PHYSICAL CALCULATION.
Role: Mercer archive/retrieval/provenance QA. This is current-assistant source-grounded work, not an authenticated return of the historical Mercer conversation.

## Bounded finding

The existing Archive Math Hopper's one-file CI smoke input, WORKSPACES/ORSON_VAY/OV_CUMULATIVE_FINDINGS_2026-10-20.md, contains actual ASCII control bytes inside mathematical prose. This is not a display-only problem. GitHub fetch_file(encoding=base64) was independently decoded byte-by-byte; it agrees with the UTF-8 content read. Git blob: 774034048ab60d5083026ec202f97f3b8f8438c4; 16,311 raw bytes.

Byte census in the committed source: 24 BACKSPACE (0x08), 19 TAB (0x09), 25 FORM FEED (0x0c), 12 CARRIAGE RETURN (0x0d). There are 49 lines containing at least one of those controls. Ordinary line-feed (0x0a) is not counted as an anomaly. Some TAB/CR could in principle be intentional; the backspace/form-feed contexts unambiguously damage TeX command names.

Examples of the actual byte pattern: intended-looking backslash-b-oxed becomes U+0008 + 'oxed'; backslash-f-rac becomes U+000C + 'rac'; backslash-t-ext becomes TAB + 'ext'; backslash-r-ightarrow becomes CR + 'ightarrow'. This pattern is consistent with escape processing in an unescaped source string, but the exact producing step has NOT been established. Do not silently reconstruct or overwrite the historical file.

## Executed extraction-contract check

Read tools/archive_math_hopper.py (Git blob 8d55a2d21c0cce3e2fc361e8fcf77996c80ba25c) and tools/mersearch_math_structural.py (blob b3d4f96bcf5c45c093f030a25c9bb5b94e2ec561). The existing extractor recognizes literal TeX delimiters and line candidates with '=', '≈', literal backslash-frac/backslash-sqrt, '√' or '^'. The smoke source has no literal backslash-[, backslash-( or dollar math delimiters. An executed JavaScript translation of the extractor's exact single-line regular expression matched 59 lines, but NINE form-feed-containing lines were not matched: source lines 191, 213, 366, 389, 418, 458, 511, 513 and 521. This is a bounded line-level omission, not a measured full-corpus recall rate, and no Python hopper run or CI job completion is claimed.

Cross-check: original Orson donor WORKSPACES/ORSON_VAY/OV_20261010_DONUT_MATH_REPAIR_PASS1.md, blob ec3edc44548228c96fc4fe5b8842df2b9136b6df, contains intact literal backslash-frac and backslash-boxed strings and no 0x08/0x09/0x0c/0x0d in its retrieved full text. This supports a derivative-file integrity problem rather than a universal inability to preserve TeX.

The prior Mercer 11:48 UTC run already fixed the unrelated workflow key mismatch (source_sha256 versus sha256), commit 325d5b112615c921e2762ca589bf613340509c50. Current smoke workflow blob 7196328410bf38effdd545a3d8d47dacea8259ea uses sha256. Do not reopen that fixed issue. The new finding is that a smoke run can be green while silently missing source mathematics.

## Controls and disposition

BEDROCK blob 4cabda482c48c217614b868a2138409275df9bf7, steering d086da524760b722090fb8209dc798c94f65f5eb, campaign bad9627ce11f7fffcb82fbd48eb03a6bb651d0a9, onboarding 004e3302226e0c140ec206b396cf1d7828aaa0b2 and rotation 90863a2a2b82b2d8e37ba1bd9f796389066f5409 were retrieved; controlling portions read, full BEDROCK line-by-line review NOT claimed. Mercer README/continuity/checkpoint and current task graph were read. All four Mersearch lanes contained other requests, left untouched; GitHub source reads are bounded fallback, not Mersearch. Historical SAT.O Official Directives blob 167136310cdf33ca8f986f33634692314c1a0946 and SAT.O-Blockwave LeanDojo skeleton blob 7667e37ce7f4579bcdfbfa98b71e44fc467af4b9 were spot-read; no Lean or physics proof attempted.

Next exact operation: preserve original source bytes; trace the creation commit or generating script for the Oct 20 cumulative checkpoint, reconstruct a separate provenance-marked clean derivative from verified donor documents, then run existing Math Hopper on BOTH versions and compare source-located candidates. A control-byte preflight warning in the existing hopper may be appropriate after the cause is established; do not build a parallel extractor. This is source-quality evidence, not a scientific falsification.

Predecessor addressed handoff 2026-10-26T1912Z_from_s1_to_s2_mercer.md (blob 83b7138761aec6da121128111dcb47b6383a8279) was consumed. No cross-thread ChatGPT delivery, no new recurring task, no public private-source exposure, no BEDROCK promotion.
