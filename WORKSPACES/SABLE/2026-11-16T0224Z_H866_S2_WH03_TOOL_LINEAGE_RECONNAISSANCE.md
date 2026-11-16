# Sable h866:s2 | WH-03 bounded cross-repository tool-lineage reconnaissance

**Date:** 2026-11-16 02:24 UTC  
**Run key:** REVROT3-19-20261011:866:s2  
**Disposition:** PARTIAL_RECONNAISSANCE / WH-03 OPEN / NO SCANNER BUILT

## Scope and authority

This is a read-only, source-pinned systems investigation under Sable's historical remit for capability architecture, workflow navigation, automation/tool leverage, source/resource testing and infrastructure QA. The ring label is not an authenticated historical Sable thread or proof of worker participation. Tern retains scheduler, task-allocation and Primary Workflow Health coordination authority.

The bounded question was whether an existing tool already supplies the cross-repository inventory/delta function requested by Factory Floor issue #16 / FF-102, and whether same-path tools can safely be treated as one implementation.

## Pinned source state

- HsH main: b48c06082b3940d876313bd63c35b413b21a5882
- SAT archive / Glass main: f6e3c914b3722cdd6b57b0a2f024446bb0247f97
- Factory Floor main: 032c80f69cb6d4d09629a487318ba2387d373664
- The third repository's internal source details are intentionally not reproduced in this public report under the project's private-reference boundary. Therefore this is not a complete three-repository inventory or delta scan.

## Concrete source-lineage result

The same path, tools/date_conversation_exports.py, exists in HsH and Glass, but the implementations are not equivalent.

| Repository | Git blob | UTF-8 bytes |
|---|---|---:|
| HsH | a8645f7e33598473cdbee428f68b29dc55a52972 | 10,494 |
| Glass | aed82bb3b6079952e5aee4a9ffe349d124bd3398 | 9,430 |

The HsH version adds conversation_json_sniff, explicit INDEX_EXCLUDED_DIRS, deterministic collision-safe target naming, --resolve-collisions, and --atomic. Its default isolates a collision to the affected source so unrelated safe renames can proceed; --atomic retains the older all-or-nothing behavior.

The Glass version still blocks every planned rename when any collision exists. Its source has no --resolve-collisions or --atomic option. The two files therefore share a path/name but differ in behavior and source identity. A path-only inventory would collapse a material version difference.

**Required identity key:** repository + pinned commit + path + Git blob SHA. A filename or matching relative path is not a version identity.

## Existing-tool reconnaissance

- [Factory Floor issue #16](https://github.com/Satobloc/FACTORY_FLOOR/issues/16) remains open. The Factory Floor FLOORROOM_TODO.md records FF-102, “Build the three-repository intake/index bridge,” as P0 / PARTIAL. The HsH Primary Workflow Health queue separately records WH-03 as P1 / HIGH after the November 15 cutoff; these are different control surfaces and their priority labels should not be conflated.
- The Factory Floor repository has no tools/ directory at the inspected main head. Its root contains the lifecycle proposal and schema, not an executable cross-repository scanner.
- ITEM_STATE_CONTRACT_PROPOSAL.md explicitly remains PROPOSAL / NON-OPERATIVE. Its schema separates theory, workflow, math, physical, presentation and visibility status, but its current workflow_status enum does not separately represent the WH-03 evidence stages: inventory, extraction, identification, assay, read, relevance, use/citation, exclusion, duplicate lineage and error/blocked. No item migration or schema-consuming automation is recorded.
- Existing [Math Hopper issue #578](https://github.com/Satobloc/HsH/issues/578) and [PR #991](https://github.com/Satobloc/HsH/pull/991) were checked. tools/archive_math_hopper.py reuses Mersearch math extraction and produces source-linked candidate records/manifests. The 100-file-per-repository pilot is configured, but the actual pilot execution and coverage remain unverified in the current source record. Math Hopper is a downstream equation/document extractor, not a general repository inventory or lifecycle delta scanner.
- HsH's existing WORKSPACES/MERCER/validate_cross_source_integrity.py is a bounded HsH metadata validator, not a three-repository scanner. Existing extraction, PDF and bibliography tools are type-specific adapters, not substitutes for a source-pinned inventory.
- The HsH and Glass date-tagging utilities should not be copied over or silently synchronized. Their observed divergence is evidence to preserve, not a defect to “repair” without owner review.

## Smallest defensible next implementation slice

1. Place the read-only inventory/delta scanner in Factory Floor, where FF-102 assigns cross-repository lifecycle ownership, subject to the existing owner/Comptroller review.
2. Require an explicit commit SHA for each repository. Emit one manifest record per path with repository, commit, path, blob SHA, size, file kind, source role and visibility/quarantine disposition.
3. Keep evidence stages separate: inventoried, extracted, identified, assayed, read, relevance-assessed, used/cited, excluded, duplicate-lineage, blocked and error. Do not overload the existing single workflow-status field; add an intake-evidence event/subrecord or equivalent versioned envelope.
4. Compute deltas by blob SHA and retain source-pinned receipts. Reconcile counts and perform random source/hash spot-checks before any bounded queue is enabled.
5. Reuse Math Hopper for equation extraction and the existing PDF/bibliography adapters for their specific jobs. Do not reimplement their extraction logic inside the inventory scanner.
6. Keep the scanner read-only. No raw-source promotion, migration, visibility change or automated theory/status change. Treat the Factory Floor lifecycle schema as non-operative until reviewed and adopted.

## Limits and disposition

This was a bounded source/tool-lineage assay, not a full repository census. No three-repository delta scan was run; no extraction/read/relevance coverage percentage is claimed; no raw research payload is reproduced; no tool, workflow, branch, PR, dependency or paid service was created; no source repository was modified. WH-03 and Factory Floor FF-102 remain open.

**Return route:** Factory Floor issue #16; HsH Primary Workflow Health queue, WH-03; Tern retains coordination. The next useful gate is a reviewed, commit-pinned dry-run scanner and a reconciled sample manifest, not another extractor or a speculative schema migration.

## Publication audit

The single publisher incident record is [HsH issue #1818](https://github.com/Satobloc/HsH/issues/1818). Its publisher bot comment rejected the submission for SHA-256 mismatch. Independent parsing of the exact issue body gives an actual decoded-content SHA-256 of 49d45cf02c2cf20ab5d77a6a455c17b915cc730162714aa50bbc60e713b36d44 (6,495 UTF-8 bytes), while the envelope declared 16f7f99a37e2f3fa7ef6aa4a7de500d7ab749b75f42c6f43bfca124f6950f6c9. The mismatch arose because literal backslashes were retained before Markdown backticks.

The publisher contract listens only to owner-authored issue-open events and explicitly prohibits editing/reopening/retrying a rejected issue or creating a duplicate issue. No second submission was made and no direct write to the fixed publication directory was attempted. The expected published artifact is absent. This workspace copy is retained for continuity; publisher status remains PUBLISHER_REJECTED / NOT_PUBLISHED.
