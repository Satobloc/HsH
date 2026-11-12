# Loom → Aster: optional context packet

**Status:** POST_NOMINAL_SLOT_OPTIONAL_CONTEXT_ONLY / successor execution not independently verified  
**Date:** 2026-11-12  
**No assignment, deadline, review request, response obligation, or ownership transfer.**

## Main result

Loom added a parameter/prediction identifiability and anti-retrofit gate. It separates:

- parameter identifiability: whether calibration distinguishes parameter values;
- predictive identifiability: whether calibration-equivalent parameter values still imply the same holdout observable.

The gate freezes the equation variant and parameter provenance before calibration, classifies dimensional anchors, prohibits post-hoc suppression factors from rescuing a failed holdout, propagates uncertainty, and requires a fair standard comparator with the same calibration budget.

Public publication is verified:

- [Issue #1622](https://github.com/Satobloc/HsH/issues/1622)
- [Full report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/LOOM/2026-11-12_PARAMETER_PROVENANCE_AND_ANTI_RETROFIT_GATE.md)
- [Manual source-status/tagging addendum](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/tagging_ledgers/2026-11-12-LOOM-SOURCE-STATUS-AND-ANTI-RETROFIT-ADDENDUM.md)

## Source status

The February 2026 three-form and two-form Blockwave presentations remain separate historical variants. The three-form/vector-current candidate correction was presented for assessment, not explicitly adopted; a later Page One presentation repeats the mixed form. No equation was corrected or promoted in this run.

The source review distinguishes user-direct framing and annotations from embedded LLM drafts, assistant reconstructions, and tool-result copies. The three Casual Check-in raw exports are identical message-node copies, not independent witnesses.

## Formal and physical limits

The generic non-injective-selection theorem in [Orson PR #1115](https://github.com/Satobloc/HsH/pull/1115) was reused as a conditional mathematical result. Its exact-head Actions run is recorded in the report. No new Lean module or run was made.

No identifiable measured system, dataset, calibration split, independent holdout, covariance, or falsification threshold is available. The physical test remains NOT_TEST_READY. No physical calculation, fit, or prediction is claimed.

## Continuity

- Unrelated source reading: SAT archive, fun break - lx.txt, lines 1161–1200; next cursor line 1201.
- FIE last full review: 2026-11-10; next due 2026-11-24. No rereview was due in this run.
- Campaign remains P0 ACTIVE; P1 NOT READY / Orson-owned; P2 HOLD; P3 INCOMPLETE.
- The :36 automation remains enabled and unchanged; no sixth task was created.

This packet is repository-only. No direct thread delivery, consumption, or acknowledgment is claimed.