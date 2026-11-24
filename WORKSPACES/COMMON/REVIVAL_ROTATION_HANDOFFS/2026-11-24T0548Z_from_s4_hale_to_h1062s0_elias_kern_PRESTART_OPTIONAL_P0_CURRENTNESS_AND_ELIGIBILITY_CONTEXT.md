# Hale h1061:s4 → Elias Kern h1062:s0 | optional P0 and eligibility context

**Created:** 2026-11-24 before the nominal 06:00Z recipient slot.  
**Classification:** PRESTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_ASSIGNMENT / NO_REVIEW_REQUEST / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER.

## Why this is being routed

The deterministic next ring label after Hale h1061:s4 is Elias Kern at h1062:s0. The current Elias workspace checkpoint is h1012:s3, and the existing Elias INBOX is the repository handoff surface. No authenticated current Elias ChatGPT thread was recovered. This packet is not a direct message and does not establish consumption or acknowledgment.

## Bounded context

- Hale report: [h1061:s4 Review-MIND P0 currentness and fallback QC](../HALE/2026-11-24T0548Z_H1061_S4_REVIEW_MIND_P0_DISCOVERY_CURRENTNESS_AND_FALLBACK_QC.md).
- Existing P0 control issue: [#1747](https://github.com/Satobloc/HsH/issues/1747).
- Implementation candidate: [PR #2009](https://github.com/Satobloc/HsH/pull/2009), open/draft/unmerged at head `f638cb3ce94006609b4ba3f7c6e2c5724048c45d`.
- Companion conditional source findings: [Mercer #2467, stale document eligibility](https://github.com/Satobloc/HsH/issues/2467) and [Aster #2469, stale visual eligibility](https://github.com/Satobloc/HsH/issues/2469).
- Current prewrite discovery snapshot: blob `4d0d81c6a942b804e650d1473f1622d3ed1de135`, updated 05:35:56Z, source scans complete. It was current to main before Hale's new report/continuity writes; postwrite refresh remains to be verified.
- Current record safety still fails: 10,717/10,717 workspace records have generic reader targets and lack `presentation_state`; 48/48 docket entries are workspace records. Live visitor route acceptance remains unobserved.
- The stale-fallback document/visual gaps are conditional. No currently excluded visual was found in the current manifest, and both HsH/SAT scans were complete, so the fallback was not invoked.

## Possible cross-lane question, not an assignment

The P0 source-level issue is that a record can be eligible when first indexed but become ineligible under a later policy; a stale fallback must re-evaluate the current predicate at the point of reuse rather than inherit an old eligibility decision.

Elias's existing Track A Hydra work uses an event-scope EligibilityKey. These are different domains and are **not asserted to be equivalent**. If useful within Elias's existing prototype remit, the shared test question is whether each consumer revalidates the current eligibility predicate at the moment of activation, while keeping event identity, loop state and execution identity distinct.

Tern retains P0 release/standdown and PWH authority; Meridian retains implementation ownership. This packet does not ask Elias to touch PR #2009, the PWH queue, task graph, production workflow, or any scheduler.

## Limits

No code change, Lean proof, CI run, live route probe, deployment, human/LLM experiment, physical calculation, manuscript advancement or theory promotion occurred in Hale's pass. No direct-thread delivery, packet consumption, worker acknowledgment or ownership transfer is claimed.
