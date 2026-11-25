# Elias Kern | Dual-coordinator switch-selection contract: source-to-POC fidelity addendum

**Disposition:** DIRECT_REQUIREMENT_RECOVERED / POC_ARBITRATION_NOT_IMPLEMENTED / SOURCE_SEMANTICS_UNDERDEFINED / NO_PRODUCTION_CHANGE

## Scope and authority

This is a bounded Track A source-fidelity pass, not a production workflow change. The historical user-authored instruction assigns Elias Kern prototype operation/documentation: exercise one bounded mechanism per lease, record observed behavior, and do not treat the prototype as production authority. No authenticated current Elias conversation or persistent Elias identity is established.

The signed Nathan-authored War Room Declaration is a primary source document, but not a raw conversation export. Its private locator and exact text are retained in restricted continuity and are not reproduced here. Earlier public source-fidelity records already identify the source and its broader topology: [Elias h948 topology audit, issue #2093](https://github.com/Satobloc/HsH/issues/2093) and [Elias h1062 source-fidelity audit, issue #2474](https://github.com/Satobloc/HsH/issues/2474). This addendum isolates a more specific coordination requirement not separately analyzed there.

## 1. Source-native coordination requirement

The War Room Declaration specifies a two-coordinator switchboard objective. Sable and Tern are to coordinate the rotation so that each knows which switch should be selected, they do not select the same switch, and they do not act at cross-purposes without discussing the conflict.

The same source separately specifies:

- Workers retain local initiative and determine their own roles.
- Workflow is coordinated and delegated through the Comptroller.
- Elevated issues converge on one clearinghouse.
- Workers have a broad shared-mailbox exchange channel.
- High or highest priority outstanding issues are surfaced to Nathan.
- Parallel tracks may be pursued and returned to debate, with disagreements settled through evidence and reasoning.
- A revival switchboard or rollcall is proposed as an automation possibility.

These are distinct relations. A single clearinghouse for escalation does not imply that all peer communication is mediated by that clearinghouse. Nor does independent work imply that workers are isolated from one another.

### Source-faithful relational sketch

Workers exchange through shared mailboxes. Elevated issues route to one clearinghouse. High or highest outstanding issues are surfaced to Nathan. Sable and Tern coordinate switch selection. Parallel work tracks may return to evidence-based discussion.

This is an organizational coordination graph, not a spatial embedding, physical geometry, or H(s)H worldtube. The source does not supply a complete adjacency list, exact authority boundary, switch identity, temporal claim window, or conflict-resolution algorithm.

## 2. Existing prototype semantics

The existing Top/Central/Branch/Hydra prototype documentation and standard-library implementation are explicitly a planner/state transformer, not a scheduler or permissions bypass.

The implementation resolves a bounded wake operation from current state and event context, produces branch-plan descriptors, and separately produces Hydra spawn/rewrite descriptors from the same state/event context. The branch result is not an input to Hydra, so the current run result is not a sequential composition of the two plans. The prototype uses state fingerprints, history, depth limits and rewrite budgets for bounded recurrence planning.

The companion Threading prototype models temporal seed, vacate, use, accumulation and rejoin states. Its own documentation says it does not schedule real workers.

Neither prototype currently supplies a dual-coordinator arbitration mechanism. No typed switch identity, coordinator claim, active reservation, atomic compare-and-swap, lease expiry, duplicate-claim rejection, conflict predicate, discussion acknowledgement, or pre-actuation conflict gate was found in the inspected implementation.

## 3. Fidelity comparison

| Nathan-authored source requirement | Existing prototype correspondence | Result |
|---|---|---|
| Two coordinators coordinate rotation | Central is a resolver, not a two-coordinator allocator | Partial analogy only |
| Each coordinator knows which switch to select | No typed switch identity or coordinator-specific selection state | Not represented |
| Coordinators do not select the same switch | No active-claim uniqueness invariant or atomic reservation | Not implemented |
| No cross-purpose action without discussion | No conflict predicate or discussion-before-actuation event | Not represented |
| One clearinghouse for elevated issues | Central may host some workflow resolution | Partial mapping; authority and routing conditions remain undefined |
| Shared mailbox exchange and parallel work | Branch sharing flags and relation labels are implementation choices | Not a source-defined access or exposure contract |
| Revival switchboard or rollcall | Hydra generates bounded descriptors | Proposal-level resemblance; not live dispatch or scheduling |

The important distinction is between a planner that describes candidate work and a scheduler that safely allocates mutually exclusive actions. The current prototype demonstrates the former. It does not demonstrate the latter.

This is not a failed prototype test or evidence that the POC is defective. The POC explicitly disclaims scheduler behavior. The finding is NOT_IMPLEMENTED / SOURCE_SPECIFICATION_GAP.

## 4. Formalization boundary

A source-faithful formal contract would need explicit types and transition semantics for:

1. Coordinator identity and the coordinator set.
2. Switch identity and what counts as the same switch.
3. The interval during which two selections are considered simultaneous or active.
4. Claim state, reservation ownership, expiry and release.
5. Atomicity or version-precondition semantics for concurrent claims.
6. A conflict predicate over proposed actions.
7. A discussion event and the ordering condition required before conflicting actions may execute.
8. The authority that may resolve, reassign or cancel a contested claim.

Two candidate invariants can then be distinguished:

- No duplicate active claim: at most one coordinator holds an active claim for a switch during the same defined interval.
- No unresolved conflict: if two proposed actions conflict, an explicit discussion/resolution event must precede actuation.

The source gives the design objective but does not define the domains, interval, conflict predicate, or event ordering. The strict uniqueness rule and the discussion exception therefore must not be silently combined into one invented algorithm.

Existing PR #951 concerns publisher-event identity, and PR #1570 concerns scheduler run/attempt evidence. They are adjacent identity work, not proofs of switch-selection exclusivity. No new Lean module or PR was created. A theorem now would formalize an assistant-designed claim protocol rather than a fully specified Nathan Direct construction. The runtime also has no local Lean/Lake/Elan installation; no compile or run is claimed.

## 5. Next bounded operation

Before changing the prototype, obtain an explicit switch/claim contract with the eight definitions above. Then test one sandbox mechanism: two coordinator identities; one shared versioned claim table; duplicate active claim rejection; conflict detection; discussion acknowledgement before conflicting actuation; and release/expiry plus replay behavior.

Keep the result as a Track A prototype experiment. Track B review and separate production authority remain required. Do not infer that a successful state-machine test proves the real scheduler safe.

## 6. Boundaries

No prototype code, workflow, PR, task graph, queue, scheduler, task identity, cadence, or ownership was changed. No physical calculation, CODATA scoring, independent measurement, SAT-O/Blockwave equation change, paper-gate advancement, or BEDROCK promotion occurred.

The existing P0 Code Grurple interlock remains active. Record/presentation safety remains unresolved, and live Paper A/B reader-route acceptance remains NOT_OBSERVED. P1 remains overdue/not ready and Orson-owned; P2 remains HOLD; P3 remains incomplete. This addendum does not alter those gates.

**Return cursor:** define the dual-coordinator switch-claim state machine from source requirements before attempting to map it onto Central, Branch, Hydra, or the separate Threading prototype.
