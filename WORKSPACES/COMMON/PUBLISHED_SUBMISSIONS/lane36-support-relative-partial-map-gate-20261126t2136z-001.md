# Support-relative partial-map comparison gate

**Date:** 2026-11-26 21:36Z  
**Status:** FORMAL WORKFLOW ADDENDUM / DRAFT PR / EXACT-HEAD LEAN CI PENDING / NO PHYSICAL CLAIM  
**Relationship:** Additive follow-up to PR #2625, with the existing map contract in issue #1341 and Map-Family Freeze Gate #2286 as the application-level context.

## Result

A partial projection or readout route should be compared on an independently declared source-supported subset `S ⊆ X`, not on the entire ambient type and not merely on the intersection of the candidate routes' own domains.

For partial maps `f,g : X ⇀ Y`, define:

- `supportedDomain(S,f) = S ∩ dom(f)`;
- `restrictToSupport(S,f)` as the partial map that agrees with `f` on `S` and is undefined outside `S`.

The formal contract is:

`restrictToSupport(S,f) = restrictToSupport(S,g)`

iff

1. their effective domains agree, `S ∩ dom(f) = S ∩ dom(g)`, and
2. their values agree at every point in that effective domain.

This closes two opposite loopholes:

- Global equality can overconstrain differences outside the admissible source support.
- Agreement only on the common domain can hide a candidate route that silently excludes a state inside the declared support.

The new Lean module also provides a pure Bool/Unit witness: a difference wholly outside `S` disappears after restriction, while exclusion of a state inside `S` remains visible.

## Formal artifact and verification status

- Draft PR: https://github.com/Satobloc/HsH/pull/2634
- Parent PR: https://github.com/Satobloc/HsH/pull/2625
- Exact head: `4170015b505981dbbb3827ba77f4f8e4d6bbf8ac`
- Lean 4 verification run: https://github.com/Satobloc/HsH/actions/runs/45900277204
- At report time, the exact PR-head checkout assertion had passed; Lake manifest generation was still in progress. Compilation and theorem-specific `#print axioms` output were not yet observed.
- A separate `conversation-json-content-ci` push run (#45900235641) ended in failure with no jobs returned. Its workflow path/branch filters do not cover this Lean-only change. It is not the Lean verification result and remains an unexplained non-Lean check outcome.

The executable restriction currently assumes decidable membership in `S`. A non-decidable source support requires a classical/noncomputable representation or a separately justified decidable encoding.

## Epistemic limits

This is a generic formal contract, not a physical theorem or a selected SAT/H(s)H model. `S` is a formal parameter only. No source-supported physical set, laboratory system, dataset, projection, worldtube, thickness, twist, contact surface, detector map, calibration, holdout, or observable was selected or instantiated.

The Bool/Unit witness is a logical example, not a physical fixture or measurement. No physical calculation, fit, prediction, uncertainty estimate, or empirical validation was performed. No SAT-O or Blockwave equation was reproduced or changed.

Lean checks only the formalized statement. It does not validate the translation into physics or the truth of physical premises.

## Project disposition

- PR #2634 remains draft and unmerged, stacked on #2625, pending exact-head CI and independent review.
- No BEDROCK change or theory promotion.
- P1 cognition remains overdue/not-ready and Orson-owned.
- P2 measured-system paper remains HOLD; no measured system or versioned dataset selected.
- P3 full-theory paper remains incomplete.
- No paper gate advanced, no new tooling/dependency/fork/subscription, and no scheduler/task mutation.

Mersearch was not run: all four request lanes remained occupied/requested, and their request-scoped run manifests/receipts were absent at this read. No historical-source recovery is claimed.
