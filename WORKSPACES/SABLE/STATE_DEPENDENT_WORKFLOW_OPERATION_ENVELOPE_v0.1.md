# State-dependent workflow operation envelope v0.1

**Status:** PROPOSAL_NOT_INTEGRATED  
**Owner:** Sable-lane systems-analysis proposal; no current worker identity or execution authority is implied  
**Date:** 2026-11-23  
**Companion formalization:** [PR #2446](https://github.com/Satobloc/HsH/pull/2446)

## 1. Problem

The current control plane separates several useful layers:

- `TASK_BRANCH_GRAPH.json` records branch lifecycle state and routing metadata.
- `WORKFLOW_BRANCHING_MAP.md` supplies human-readable branch semantics.
- `AUTOMATION_WORKFLOW_CONTROL.md` requires state-dependent work selection.
- `ORCHESTRATOR_COMPTROLLER_MODEL.md` separates coordination and task-allocation responsibilities.
- `PROJECT_DESK_CONTROL_CONTRACT.md` defines the operator-facing control surface.
- `task_upkeep_triage.py` is a read-only ranking/triage helper.

These layers do not yet provide one typed record binding a proposed operation to the exact source snapshot, its authority, preconditions, execution result, independent readback, and any resulting branch-state update.

The graph's `status` is a **branch lifecycle state**. It must not be overloaded to mean that a particular operation is proposed, authorized, executed, or verified. Likewise, a handoff packet's existence does not establish delivery or acceptance.

## 2. Three independent state dimensions

### Branch lifecycle

The current graph's declared status vocabulary is:

`candidate | active | blocked | handoff_pending | parked | completed | superseded | rejected`

### Operation lifecycle

Proposed operation states:

`PROPOSED | AUTHORIZED | EXECUTED | READBACK_VERIFIED | STATE_COMMITTED | DEFERRED | REJECTED | FAILED | NEEDS_RECONCILIATION`

### Handoff lifecycle

Proposed handoff states:

`NONE | PACKET_CREATED | ROUTED | ACKNOWLEDGED | CONSUMED`

These dimensions are related, but none is a substitute for another.

## 3. Operation envelope

A future machine-readable envelope should carry these fields:

| Field | Minimum content |
|---|---|
| `schema_version` | Contract version |
| `operation_id` | Stable, unique, idempotency-safe identifier |
| `branch_ref` | Graph path, branch ID, observed branch status, owner label |
| `source_snapshot` | Repository, ref, commit SHA, graph blob SHA, branch-record identity |
| `requested_transition` | From-status, to-status, action class, rationale |
| `authority` | Actor label, identity status, authority-source reference, permitted effects, write scope |
| `guards` | Named preconditions, result (`PASS`, `FAIL`, `UNKNOWN`), evidence references |
| `plan` | Intended effect, affected paths, reversibility, explicit no-op/read-only declaration where applicable |
| `execution` | Host-reported state, run ID, output paths and digests; `NOT_OBSERVED` is distinct from failure |
| `verification` | Independent readback references, digest comparison, exit-criteria evidence |
| `handoff` | Packet reference, route state, acknowledgment reference, consumption evidence |
| `fallback` | Separate branch/operation reference with its own snapshot and authority |
| `disposition` | One operation-lifecycle state from the vocabulary above |
| `return_cursor` | Exact next source, file, line, issue, or task location |

The envelope is an evidence record, not a command. It must not itself trigger an action.

## 4. Partial composition maps

The workflow should be understood as a sequence of **partial maps**, each with its own admission conditions:

1. **Graph snapshot → Operation proposal.** Read-only projection. Defined only when the graph revision, branch record, and observed status are pinned.
2. **Proposal × Authority evidence × Freshness → Authorized operation.** Defined only when the requested effect is within explicit authority and the planned snapshot still matches the current source.
3. **Authorized operation → Execution receipt.** Defined only after the host reports an actual action result. A plan, prompt, or queued run is not an execution receipt.
4. **Execution receipt × Independent readback → Verified operation.** Defined only when the exact output or resulting state is fetched independently and compared with its expected identity.
5. **Verified operation × Branch-write authority → Branch-state update.** Defined only for an authorized graph writer and only through a fresh compare-and-swap/write precondition. Tern retains scheduler and task-graph allocation authority.
6. **Blocked branch → Fallback operation.** A fallback is a separate operation on a separate branch or work item, with its own source snapshot and authority. It does not silently unblock, complete, or mutate the blocked branch.

No map is assumed total. Missing authority, source identity, evidence, or a composition condition yields `DEFERRED` or `NEEDS_RECONCILIATION`, not an inferred success.

## 5. Admission invariants

- A branch status does not determine operation readiness.
- A proposal cannot commit a branch-state update.
- A stale source snapshot blocks commit and requires reconciliation.
- An execution record without independent readback is not verified.
- Marking a branch `completed` requires verified exit criteria.
- Packet creation, routing, acknowledgment, and consumption remain distinct.
- A deterministic ring label is not authenticated actor or thread identity.
- If a primary branch is blocked, alternate work must have its own operation record; the blocked branch remains blocked until its own guards pass.
- This proposal does not authorize scheduler mutation, task-ID/cadence/phase changes, worker reassignment, access-control changes, or destructive writes.

## 6. Empirical-test extension

If an operation later claims a physical prediction, its optional `empirical_test` section must require:

- identifiable measured system and dataset;
- provenance and immutable source identity;
- units and calibration;
- uncertainty model and propagated measurement uncertainty;
- shared parameters and frozen comparator;
- calibration/holdout partition;
- predicted observable, not only a fitted quantity;
- standard-model comparator;
- predeclared falsification threshold and decision rule.

No physical calculation or test can be instantiated from this contract alone. A missing measured system or dataset yields `NOT_SCOREABLE`, not a synthetic physical fixture.

## 7. Formal scope and implementation boundary

The companion Lean module formalizes only the abstract separation among branch status, operation stage, and handoff stage, plus the stale-snapshot, readback, and completion guards.

It does **not** prove that the live task graph, Python helpers, GitHub Actions, scheduler, actor permissions, hashes, or any physical model implement this contract. No runtime executor, JSON validator, or schema enforcement is included in v0.1.

Integration requires independent review by the authorized control-plane owners. Until then, this is a proposal and the existing human-readable controls remain authoritative.
