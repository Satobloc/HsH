# Handoff delivery evidence gate: channel-specific proof, not route labels

**Date:** 2026-11-24  
**Run key:** `REVROT3-19-20261011:1071:s3`  
**Deterministic ring label:** Sable, index 0; next Loom, index 1  
**Epistemic status:** source-grounded assistant reconstruction and bounded review. This is not an authenticated Sable instance/thread, independent team consensus, or a production implementation.

## 1. Principal finding

The existing Sable workflow-operation proposal correctly separates branch lifecycle, operation lifecycle, and handoff lifecycle. Its current handoff predicate nevertheless admits a false-positive delivery state.

In PR #2446, the proposed module defines:

```lean
def handoffDelivered (h : HandoffStage) : Prop :=
  h = .routed ∨ h = .acknowledged ∨ h = .consumed
```

The state `.routed` therefore satisfies `handoffDelivered` by the first disjunct alone. The predicate has no destination, channel, recipient identity, write receipt, message ID, or independent readback parameter. A route-selection or routing-attempt label can consequently be counted as delivery without evidence that anything reached the recipient.

The existing theorem `packet_creation_is_not_delivery` excludes `.packetCreated`. It does not test or exclude `.routed` without verified delivery evidence. The current type also treats `acknowledged` and `consumed` as bare enum labels rather than evidence-bearing events.

This is a concrete gap in the abstract contract, not evidence that the live scheduler or GitHub inbox has misdelivered anything.

## 2. Controlling operational semantics

The current HsH thread-first rule distinguishes:

- **Chat delivery:** an actual post into an authenticated target thread, with the resulting message/post identity verified.
- **Repository-inbox delivery:** an append to the recipient's documented existing inbox, made against its current content identity and independently read back with the unique receipt/content verified.
- **Common handoff-folder storage:** a durable packet location, not by itself delivery to the recipient's inbox.
- **Acknowledgment:** a recipient response after actual receipt. It is not inferred from repository readback.
- **Consumption:** evidence that the recipient actually read/used the handoff. It is not inferred from delivery or acknowledgment.

A verified repository-inbox append establishes repository-inbox delivery only. It does not establish ChatGPT-thread delivery, recipient consumption, or acknowledgment. A worker/ring label is not an authenticated thread destination.

The current `HandoffStage` enum cannot represent these distinctions because it has no channel or evidence binding.

## 3. Minimal correction to the proposal

Keep routing progress separate from delivery evidence.

### Routing progress

`HandoffProgress := none | packetCreated | routeSelected`

These states describe preparation and routing only. None implies delivery.

### Delivery channel and state

`DeliveryChannel := chatThread | recipientInbox | commonHandoffFolder | other`

`DeliveryState := notAttempted | attempted | verified | failed | unavailable | unknown`

A `DeliveryEvidence` record should bind at least:

- recipient label and recipient-identity status (`unverified`, `sourceReconstructed`, or `authenticated`);
- channel and exact destination reference;
- run key and unique handoff/receipt ID;
- channel-specific write/post receipt;
- independent readback reference and exact content digest, where applicable;
- separate acknowledgment-event reference;
- separate consumption-event reference.

### Channel-specific acceptance

- `recipientInbox` is `verified` only after a write to the documented recipient inbox and exact independent readback of the unique entry/content. A common folder does not satisfy this rule.
- `chatThread` is `verified` only after the exact authenticated thread destination and actual posted message ID are available and verified.
- `commonHandoffFolder` can establish packet storage, never recipient delivery by itself.
- `acknowledged` and `consumed` remain separate event states. They require their own evidence and must not be inferred from `DeliveryState = verified`.

The revised `handoffDelivered` predicate should require a verified channel-specific `DeliveryEvidence`, not merely a `HandoffProgress` constructor. In particular, `routeSelected` must not imply delivery.

## 4. Proof obligations for a future Lean revision

The following are proposed obligations, not newly compiled theorems:

1. `packetCreated` does not imply delivery.
2. `routeSelected` does not imply delivery.
3. A verified recipient-inbox append implies repository-inbox delivery, but not ChatGPT-thread delivery.
4. Chat delivery requires an authenticated thread destination and an actual post/message receipt.
5. Delivery does not imply recipient acknowledgment.
6. Acknowledgment does not imply consumption.
7. A common-folder packet cannot satisfy the recipient-inbox or chat-delivery predicate.

A diagnostic lemma follows immediately from the current definition, but has not been added or run in Lean:

```lean
theorem routed_counts_as_delivered :
    handoffDelivered .routed := by
  simp [handoffDelivered]
```

That is precisely why the present predicate is too permissive. The lemma is a source-level reduction, not a new CI result.

## 5. Existing Lean and PR status

[PR #2446](https://github.com/Satobloc/HsH/pull/2446) remains **OPEN / DRAFT / UNMERGED** at head `c73373f856e7342d8aac5aaa8d8ce8105a589339`, based on `infra/lean4-verification-20261023`, not directly on current `main`.

The existing exact-head Actions run [#45263282161](https://github.com/Satobloc/HsH/actions/runs/45263282161), job `138003422453`, completed successfully. Its checkout log shows expected and actual PR head both equal `c73373f856e7342d8aac5aaa8d8ce8105a589339`. Lean 4.34.0 / Lake 5.0.0 compiled the formal library (8,948 jobs). The six theorem-specific axiom reports ran; five reported `propext`, and `completed_requires_verified_exit_criteria` reported no axioms. No `sorryAx`, `admit`, or compiler error appeared in the job log.

The global axiom audit, tests, lint, `leanchecker`, and `nanoda` were skipped. The successful build checks the existing formalized source only. It does not validate live GitHub, scheduler, identity, permission, hash, or delivery behavior.

No new theorem was added, no new Lean run was initiated, and no PR branch was changed. The proposed corrected delivery type and seven obligations remain **UNCOMPILED / PROPOSAL**. The local runtime has no `lean`, `lake`, or `elan`; the existing exact-head CI was inspected as the available actual run. PR #2446 should remain draft pending an owner decision on this review and a subsequent exact-head build of any approved correction.

## 6. Scope and boundaries

- Current HsH `main` observed at `fa987939df5912b1b3930cd399096c6bd4905f92` (2026-11-24T15:46:29Z). The task/branch graph remains 18 records against declared `branch_count=16`; Tern retains graph and scheduler authority.
- P0 Code Grurple remains active. No route probe, deployment, merge, or standdown was attempted.
- The PWH fifth-completion deep-review trigger remains with Tern; no queue or ownership change was made.
- P1 remains overdue/frozen/Orson-owned; P2 remains HOLD; P3 remains incomplete. No paper gate advanced.
- Mersearch was not exposed as a callable action in this runtime; existing request lanes were not overwritten or retriggered. No private HSH_RESOURCES payload was opened.
- No physical system, dataset, calculation, fit, prediction, uncertainty analysis, SAT-O/Blockwave equation, or BEDROCK theory claim was changed.
- No scheduler task, task ID, cadence, phase, branch assignment, or ownership was changed. No sixth task was created.
- No authenticated Sable or Loom ChatGPT thread was established. No cross-thread post, recipient delivery, consumption, or acknowledgment is claimed.

## 7. Next cursor

If Nathan authorizes extension of PR #2446, add channel-specific `DeliveryEvidence` and prove the seven obligations above on a fresh branch based on current `main`, then run exact-head Lean CI and the relevant proof/audit checks. Until that decision, leave PR #2446 untouched and draft. The existing issue #2447 remains the single rejected record for the earlier schema-invalid submission; this report is a distinct amendment with its own submission identity.
