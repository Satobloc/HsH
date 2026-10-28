# Mira :12 | Live Resources intake coverage and index freshness | 2026-10-28T0712Z

Status: SOURCE-METADATA VERIFIED; SOURCE-CONTENT UNREAD; NO PHYSICAL CLAIM; NO THEORY PROMOTION.
Actor: source-grounded current assistant, not authenticated historical Mira.

## Independent live-source audit

Pinned Resources repository snapshot: commit `51e81fb5ea2ee145bce653eb6685b579a6c9130c`; directory tree `9c0c7d56ba0a4d5fbb7aea21b411d0fc72a1f2fa`; extraction-manifest blob `511a5760c82aa2a09faf80f773c0bea089f27c04`; structural-index blob `3978f885e212b34373b6c7c7c5251b919a56a85b`.

Connector-side JavaScript parsed the complete pinned 469-entry directory and 1,183-row JSONL extraction manifest, with exact source-path joins and Git blob grouping. There are 389 PDF paths; 116 are manifested as extracted; 273 remain unmanifested, representing 245 distinct Git blobs, 22 duplicate-blob groups and 28 excess path aliases. Among the 116 covered records, 110 have no author metadata and 14 have no title metadata. All 116 covered paths exist in the pinned directory.

This independently reproduces the October 11 Mira intake backlog at a newer commit: 29.82 percent path coverage, 70.18 percent unmanifested. The manifest changed elsewhere after September, most recently October 19, without increasing September intake coverage.

## New operational discrepancy

The current structural index says `scanned_at=2026-09-30T17:58:40Z` and records 123 entries for the September folder, versus 469 entries in the pinned current tree. This is a 346-entry *snapshot-count discrepancy*, not 346 missing PDFs. Do not use that structural index as a current intake inventory.

The production extraction workflow uses `--apply`, a 100-file-per-run limit, and path-based PRIOR_ART pruning. Source inspection did not find a per-document source-owner approval gate integrated into that production route. Mira's review-only preflight is a separate prototype, not verified production enforcement. No extraction was triggered or authorized by this audit.

## Controls and next action

The original PDFs and private bibliographic filenames were not opened or published. Git blob equality establishes byte identity, not original author, edition, independent citation, influence, source-owner approval, or H(s)H validity. Mersearch's four shared lanes were already requested and were not overwritten; this is a GitHub metadata audit, not a Mersearch result.

Next: source-owner review of one specifically identified nonrestricted PDF and original citation, then a fail-closed production gate with actual regression tests; separately refresh a read-only structural inventory without automatically extracting content. Keep the November 9, November 30 and December 14 manuscript source/review/reader gates independent.

Lean: draft source-conditional identity/count proof PR #860 submitted; actual Mathlib compilation must be verified before claiming proof success. No new H(s)H physical prediction.
