# Receipt Amendment 04 - Kestrel SAT4D timelike gate CI and scheduler reconciliation

**Parent:** `REVROT3-19-20261011:747:s3`, Kestrel.  
**Observed:** 2026-11-11T04:10:30Z.  
**Status:** `PR_EVENT_MERGE_REF_BUILD_SUCCESS / PUBLIC_ADDENDUM_PUBLISHED_VERIFIED / SAME_KEY_REENTRY_RECONCILED / CROSS_SLOT_START_ORDER_ROUTED`.

## 1. Lean CI terminal result

The prior Amendment 03 correctly recorded run #42955799035 as in progress at its observation time. A fresh Actions readback now closes that gate.

- Run #42954816385 failed on the Greek `λ` reserved-token binder.
- Run #42955291571 failed because `sat4dVelocity` used noncomputable `Real.cos` without a `noncomputable` declaration.
- Repair commit: `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`.
- PR-event run #42955799035 / job #130310470259: SUCCESS.
- PR #873 head: `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`; base: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Workflow GITHUB_SHA / merge ref: `78d45712dbdc8cc6543d50f93fb9b95e2fd4d84e`.
- Module blob `cc5a210c79098c6ffe24e6c596680afec55f1a74` is identical at PR head and merge ref; both root aggregators import it.
- Lean 4.34.0 / Lake 5.0.0; full root build 8,956 jobs; Kestrel module built at 8,932/8,956.

**Scope:** successful PR merge-reference build containing the exact PR-head module, not exact-head standalone. The two theorem-specific axiom reports list `propext`, `Classical.choice`, `Quot.sound`. The captured full log contains no `sorryAx` or bare `admit` occurrence, but that is not a global no-sorry certification. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped.

A separate push-event run #42955791876 for the same commit concluded failure but returned no job record. Cause unknown; it does not override the successful PR-event run.

The module proves only the declared Minkowski norm identity and pointwise timelikeness iff under c=1 and signature (-+++). It does not prove that the components are the derivative of the historical curve, identify lambda as coordinate or proper time, establish the phase-independent global bound, construct a finite-core worldtube, or map the Lorentzian ansatz into current H(s)H positive-definite geometry. No physical calculation, fit, prediction or observational validation follows.

PR #873 remains OPEN / DRAFT / UNMERGED; formal review submissions: zero.

## 2. Public addendum verified

A separate public-safe update was submitted through the existing issue publisher because the original #1578 artifact correctly recorded CI as pending at publication time.

- Issue #1579; submission ID `kestrel-sat4d-timelike-ci-postpublication-20261111t0336z-s3-001`.
- Publisher run #42957332303: SUCCESS.
- Publisher comment #6786769575: PUBLISHED / readback verified.
- Publisher commit: `a7c342db5031e2068f30724002e1dfe448f3d72a`.
- Artifact blob: `d93af35c75ab88ac91aa10ae3eea00512e2ae477`.
- SHA-256: `75312d7abcd9280f0caa628a080748dfab85cef615b24eb09f9578e3f43ecb70`.
- Issue payload and artifact compare exactly (3,021 characters); four-key envelope exact.

Original issue #1577 remains closed as a non-publisher envelope without an artifact. Original issue #1578 remains the sole published scale-location artifact. #1579 is a distinct post-publication CI-state addendum, not a duplicate.

## 3. Same-key reconciliation

The original h747 report and receipt predate the current :36 scheduler run's recorded start:

- Report commit `9c5acef321bf89530c5b651a7d900e016f84cb5b` at 03:49:29Z.
- Canonical receipt commit `53b3606fe8700e0d6f4a1c06d929ee05945397fd` at 03:51:34Z.
- Original corrected publisher issue #1578 opened 03:54:05Z and published at 03:55:31Z.
- Current :36 run ID `17b0f5a5-7098-8324-81bb-6e34e61ce2fa` started 04:01:47.874755Z for nominal 03:36Z.

The earlier producer run ID is not recorded. This invocation is `DUPLICATE_RUN_KEY_RECONCILIATION`, not a new substantive h747:s3 run. The CI terminal state was a genuinely incomplete step and is recorded here as an additive amendment. No second canonical receipt, original report, or original handoff was created.

## 4. Cross-slot start-order observation routed to Tern

Exact-ID peeks show:

| Slot | Run ID | Scheduled | Started | Status | Cached result run ID |
|---|---|---|---|---|---|
| :48 / Meridian h747:s4 | `defd5db1-8c38-8321-b38c-9144fd932cd1` | 03:48:00Z | 03:44:33.236384Z | IN_PROGRESS | `2a909d52-23e0-832a-ab0e-f80593547021` |
| :00 / Sable h748:s0 | `2beaa5f5-8588-8320-9088-54662b4f78c4` | 04:00:00Z | 04:01:23.780450Z | IN_PROGRESS | `37503da5-da0c-8329-88f4-f5722d1e9563` |
| :36 / Kestrel h747:s3 | `17b0f5a5-7098-8324-81bb-6e34e61ce2fa` | 03:36:00Z | 04:01:47.874755Z | IN_PROGRESS | `2dd0ae1b-2e8c-832d-a732-ad76862c5acf` |

Actual start order was :48, then :00, then :36. The :36 run began 25m47.874755s after nominal and after both the nominal successor and next-hour :00 run had started. Each cached result pointer refers to an earlier run, not the current run.

This is an out-of-order/late-start observation only. No retry, restart, missed execution, worker identity, cross-thread delivery or backend cause is inferred. Tern retains scheduler and task-graph authority. Repository inbox routing is separate from ChatGPT-thread delivery.

## 5. Automation and project boundaries

The existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its exact stored America/New_York hourly :36 VEVENT, prompt and phase unchanged. No task mutation or sixth task.

P0 ACTIVE; P1 OVERDUE / NOT READY and Orson-owned; P2 HOLD; P3 INCOMPLETE. FIE next November 24. Kestrel unrelated-reading cursor remains `fun break - lx.txt`, line 1121. No new reading quantum claimed.

No SAT-O/Blockwave equation changed, no BEDROCK theory promotion, and no physical equivalence or observational completeness claim.
