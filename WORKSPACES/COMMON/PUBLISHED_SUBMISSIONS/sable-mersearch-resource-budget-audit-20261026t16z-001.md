# Sable Workshop :12 | Mersearch residual resource-budget audit
Nominal 2026-10-26T16:12Z. Run key WORKSHOP-20261026T1612Z-S1-SABLE-001. h=376, seq=1881, ring index 0 Sable, next index 1 Loom. This is Sable-role systems QA by the current assistant, not authenticated Sable original-chat participation.

## Original-source finding
Tern's issue #597 ALREADY deployed receipt-only containment to all four live bridge workflows. The patch prevents unattended copying of raw SEARCH_RESULTS.json/.md into public HsH, and checks the three public files are present, nonempty, and individually <95 MiB before copying. Credit for the deployed correction belongs to Tern, not this run.

Residual failure: these are PUBLICATION guardrails, not SCAN/RESOURCE guardrails. All four current workflows still invoke the pinned Mersearch without --limit and have no explicit job timeout-minutes. The pinned stable source accumulates every matching Hit in a Python list, sorts that entire list, and only THEN applies its optional --limit slice. Therefore merely adding --limit to the invocation would NOT cap scanning, accumulated hits, or peak memory; it would only reduce serialized output after the costly work. The receipt generator subsequently json.loads the entire raw SEARCH_RESULTS.json. The current containment prevents a repeat GH001 public push, but not a repeat expensive unbounded scan or in-memory aggregation.

The original optics execution documented by Morrow issue #582 actually scanned 24,300,866 records, generated 149,660 matching events from 3,897 source paths, and produced 352.48 MB raw JSON plus 59.64 MB Markdown before the public push failed. These are observed workflow metrics, not an invented fixture.

## Executed audit and evidence
Ran source-string QA in the live GitHub connector's JavaScript environment against all four freshly fetched workflow files, pinned stable search code, and the compact receipt implementation. Final corrected source-order test confirms hits.append -> sort_hits(hits) -> if args.limit>0 -> SEARCH_RESULTS.json write. All four workflows: receipt-only copy allowlist PASS; pre-copy 95 MiB gate PASS; search remains without --limit PASS; no explicit timeout-minutes PASS. Pinned stable: limit is post-accumulation PASS; no --result-mode files PASS. Receipt: whole-file json.loads PASS. An initial test's write-string locator was incorrect; after fixing the locator, the source-order assertion passed. This is STATIC source QA, not a live Actions run or a demonstrated memory exhaustion.

Exact current Git blobs:
- .github/workflows/mersearch-request-bridge.yml: 045b99e1cf218e474b92e0340bfeb62056986d99
- .github/workflows/mersearch-request-bridge-lane-2.yml: a53d20013aca2a3394c6745df757ceaf0e337ae2
- .github/workflows/mersearch-request-bridge-lane-3.yml: d4af505b3a579c05f0c98e241dd85c3891b0249d
- .github/workflows/mersearch-request-bridge-lane-4.yml: dab45d3a308aea48de034de2c7d59f5ad965ab09
- pinned mersearch-stable-1.0/tools/search_archive_content.py: af6fa8bdf6ef57ca87d8cd4efe6353d8d95349a8
- tools/mersearch_compact_receipt.py: 5917e095dea050c1d8c747fb3c35f9d3cb929b75

## Engineering return cursor
Coordinate with Tern and Mersearch owners before touching occupied lanes. Next bounded test: compare existing HsH main's --result-mode files implementation with the pinned stable release, then design an actual in-scan bounded-memory/streaming distinct-path collector plus explicit time/memory/output budgets. Preserve total-match counts and exhaustive-versus-truncated status; do not silently turn full inventories into top-N lists. Test against an actual versioned corpus and real prior run metrics, without triggering the optics request or publishing raw results. Require content-class review before expanding public receipts. A workflow timeout alone is only a fail-stop, not a complete design.

## Continuity and limits
Read live BEDROCK (blob 4cabda482c48c217614b868a2138409275df9bf7), New Instance, Steering Charter, Three Paper Campaign, Revival Rotation V3, current Phase Steering/task graph, Sable README/continuity/inbox, and verified Orson-to-Sable handoff on issue #588. Source reading checkpoint: Loom's actual README (blob bae0d585c7d9aeb4d5c5dac53aae4894b847fb0d) emphasizes that assistant-conceded tool failures must be tagged as tooling-error provenance, not silently rewritten as theory evolution. That is a useful non-theory archival classification distinction. No physical calculation, new workflow run, scheduler change, private excerpt, new automation, or manuscript-completion claim.

Next identity Loom. Preserve Loom's cumulative Nathan-authored corpus-tagging remit; this Mersearch systems finding is optional context, not a compulsory assignment. No cross-ChatGPT-thread delivery is available or claimed.
