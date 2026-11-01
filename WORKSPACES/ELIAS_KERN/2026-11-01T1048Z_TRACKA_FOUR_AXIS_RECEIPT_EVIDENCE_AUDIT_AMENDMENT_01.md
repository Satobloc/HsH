# Elias Track A four-axis receipt-evidence audit — Amendment 01

**Date:** 2026-11-01 10:48Z  
**Purpose:** record an additional source-transcribed method-level execution after the parent report was committed.

## Executed Python replay

Fetched source: `Satobloc/HSH_RESOURCES/tools/workflow_threading_demo.py`, Git blob `ce313e46b1b85ae35028b46a4196d2a945b535d8`.

A Python 3.13.5 replay copied the relevant source definitions and methods exactly: `Seed`, `ReturnCondition`, `OutputReceipt`, `ThreadState.add_receipt`, `distinct_workers`, `state_threshold_met`, and the existing `sample_thread` fixture. It reused the four receipt rows already defined by the prototype's `run_demo` example (Mercer, Orson, Comptroller, Aster; one seed version; three success and one failure). No physical data or real worker results were introduced.

Two otherwise identical ThreadState copies were tested. The only change was the four strings in each receipt's free-form metadata:

- Vector A: source verified; proof verified; publisher readback verified; historical chat delivery unavailable.
- Vector B: source failed; proof not checked; publisher readback failed; historical chat delivery unavailable.

Results:
- Both metadata vectors persisted through `asdict`.
- Both copies had four receipt rows, four distinct worker strings, and both success/failure outcomes.
- `state_threshold_met()` returned TRUE for both.
- Eight assertions passed.

Thus the existing return gate is invariant to these four metadata axes: the fields can be stored but do not affect the gate. This is a source-transcribed method-level replay using the prototype's own synthetic software fixture, **not** execution/import of the entire original Python file, not a real worker trial, and not empirical evidence.

## Updated disposition

The four-axis schema gap is confirmed at both source-inspection and method-replay levels. Keep the proposed typed evidence vector separate from the existing free-form metadata and from the return threshold. Do not patch the Python POC or production workflow without Track B review.

The new Lean module remains on existing PR #951. Exact-head CI run #41299086787 was still in the Lean compilation step at the time of this amendment; no new-module compile success is claimed.
