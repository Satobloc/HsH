# Elias Kern h1107:s3 | Two-axis arbitration contract for dual-coordinator switch selection

**Run key:** `REVROT3-19-20261011:1107:s3`  
**Nominal slot:** 2026-11-26T03:36Z  
**Selection:** Elias Kern, ring index 9. **Next:** Nadir Voss, ring index 10.  
**Execution class:** source-grounded current-assistant reconstruction. No authenticated current Elias thread or historical-instance participation is claimed.

**Disposition:** `TWO_AXIS_CONTRACT_PROPOSED / SOURCE_SEMANTICS_INCOMPLETE / TRACK_B_GATE_PENDING / NO_POC_CHANGE / NO_PRODUCTION_AUTHORITY`

## 1. Authority and source boundary

The strongest located Nathan-authored role instruction is preserved in `WORKSPACES/ELIAS_KERN/INBOX.md`, dated 2026-09-24 13:47 ET. It assigns bounded Track A operation/documentation for the Top/Central/Branch/Hydra prototype, independently but in communication with Sable and Tern's Track B. Each leased pass is to exercise one bounded real-work mechanism, leave a durable receipt/failure packet, document observed behavior rather than intended behavior, and not treat the POC as production authority.

The raw originating conversation ID/message UUID and a standalone signed specialist charter remain unrecovered. This is a preserved direct-user workspace instruction, not authenticated historical-thread participation.

The existing public [h1100:s0 source-fidelity report, issue #2563](https://github.com/Satobloc/HsH/issues/2563), records the Nathan-authored War Room Declaration as specifying two separate coordination aims: Sable and Tern should not select the same switch, and they should not act at cross-purposes without discussing the conflict. This run used that published source-fidelity report as its provenance route. The restricted HSH_RESOURCES prototype payload and War Room source were not reopened in this run.

The existing report also establishes that Top/Central/Branch/Hydra is a bounded planner/state transformer, not a scheduler or permissions bypass. The distinction is preserved below.

## 2. New architectural distinction: collision is not conflict

The two source-recorded aims require **two different predicates**:

1. **Selection collision:** two coordinators select the same canonical switch during overlapping active selection windows.
2. **Cross-purpose conflict:** two proposed actions have incompatible purposes or effects, even if they select different switches.

A unique `switch_id` lock can detect the first condition. It cannot, by itself, detect the second. Two different switches may still produce actions that work at cross-purposes.

Conversely, a discussion that resolves a purpose conflict does not automatically make duplicate selection permissible. The no-duplicate-selection rule remains a separate gate unless Nathan explicitly defines a shared-selection exception.

### Candidate acceptance predicate

Let:

- `ClaimValid` mean a coordinator's selection claim is current and within its authorized scope.
- `UniqueSelection` mean no other coordinator holds a conflicting active selection for the same canonical switch during the defined interval.
- `IntentConflict` mean the proposed action intents satisfy an explicitly defined conflict relation.
- `DiscussionResolvedBeforeActuation` mean a valid discussion/resolution event is linked to the conflicting proposals and ordered before actuation.

Then the proposed gate is:

\[
\operatorname{MayActuate}
=
\operatorname{ClaimValid}
\land
\operatorname{UniqueSelection}
\land
\left(
\neg\operatorname{IntentConflict}
\lor
\operatorname{DiscussionResolvedBeforeActuation}
\right).
\]

This is a design proposal, not a source-specified algorithm, implementation result, or Lean theorem. Its predicates remain uninstantiated until the missing domains and authorities are decided.

## 3. Four-case arbitration matrix

| Switch identity | Action-intent relation | Required treatment |
|---|---|---|
| Same switch | Compatible or same purpose | Selection collision still exists. Establish one authorized active selection or an explicitly approved shared-selection rule. Compatibility does not erase the collision. |
| Same switch | Conflicting purposes | Both gates apply. Do not actuate while duplicate selection or unresolved conflict remains. Discussion must precede any permitted actuation, and selection ownership must still be resolved. |
| Different switches | Conflicting purposes | No same-switch collision, but the cross-purpose gate blocks actuation until a valid discussion/resolution occurs. |
| Different switches | Compatible purposes | Independent selection may proceed if no other shared-resource or authority conflict exists. |

The third row is the important newly explicit test. A switch-ID-only implementation can pass its uniqueness check and still violate the cross-purpose requirement.

## 4. Separate planning, arbitration, and actuation

Do not turn the existing planner into a scheduler merely to satisfy this contract. Keep three evidence-bearing stages distinct:

1. **Plan proposal:** the POC emits a candidate switch and intended work. A plan is not a reservation or permission to act.
2. **Selection arbitration:** the coordinator process checks canonical switch identity, active-window overlap and any applicable claim state. A plan is not an accepted claim until this stage returns an explicit result.
3. **Actuation authorization and observation:** a separate authorized boundary accepts or rejects the action. Record the actual action/result independently from the plan and claim.

A successful planner self-test establishes only the tested planner behavior. It does not establish atomic coordinator arbitration, discussion, authorization, scheduler safety, or actual actuation.

### Candidate claim and event fields

These are proposed fields, not recovered source definitions:

- `proposal_id`, `plan_version`, `directive_version`
- `coordinator_id`, `switch_id`, `purpose_id`
- `claim_id`, `claim_revision`, `claim_state`
- `selection_window` or other explicitly defined active interval
- `conflict_set` or a typed action-intent description
- `discussion_event_id`, participants, resolution, resolver authority
- `authorization_id`, `actuation_event_id`, observed outcome

A discussion record needs an ordering witness. Wall-clock timestamps alone may be insufficient under concurrency or clock skew. If the implementation has a shared event sequence or versioned log, the acceptance check should establish that the resolution precedes the actuation in that ordering. No such mechanism is claimed to exist in the current POC.

## 5. Minimal state-transition proposal

| State | Meaning | Permitted consequence |
|---|---|---|
| `PROPOSED` | Planner output awaiting arbitration | No reservation or actuation authority |
| `ACTIVE` | Selection accepted for a defined switch and interval | May pass the selection gate while current |
| `CONFLICTED` | Duplicate selection or incompatible intent detected | No actuation until the relevant condition is resolved |
| `RELEASED` | Claim explicitly relinquished | Claim cannot authorize later action |
| `EXPIRED` | Defined active interval ended | Claim cannot authorize later action |
| `REJECTED` | Claim failed an acceptance condition | No actuation |

A transition from `CONFLICTED` to a usable state requires an explicit resolution record and, for a duplicate switch, a separately valid unique-selection outcome. Discussion is not an implicit lock release.

The following remain implementation-hardening candidates, not source requirements: atomic compare-and-set on a shared claim revision, monotonic fencing tokens, idempotency keys for retries, and expiry/replay rejection. They should be adopted only after the actual storage and authority model is specified.

## 6. Executable acceptance-test matrix for a later authorized sandbox pass

| Test | Fixture condition | Expected result |
|---|---|---|
| A | Two coordinators concurrently claim the same switch | At most one active selection; losing claim is explicitly rejected or conflicted |
| B | Same switch, incompatible intents | Selection collision and intent conflict both block actuation |
| C | Different switches, incompatible intents | Intent-conflict gate blocks until discussion/resolution |
| D | Different switches, compatible intents | Both may proceed if no other declared conflict exists |
| E | Same switch, non-overlapping intervals | Outcome depends on the still-undefined temporal scope |
| F | Discussion recorded after actuation | Reject as too late; post-hoc discussion does not satisfy ordering |
| G | Resolution by an unauthorized actor | Resolution is not valid until resolver authority is defined and checked |
| H | Expired or released claim replayed | Reject stale actuation |
| I | Identical retry with same request identity and payload | Idempotent result, no second actuation |
| J | Same request identity reused with different payload | Reject identity/payload collision |
| K | Planner emits a plan but no arbitration/actuation event occurs | Record `PLAN_ONLY` or equivalent, not successful execution |

These are proposed acceptance cases. None was executed against the restricted POC in this run.

## 7. Decisions still required before faithful implementation

The source and existing public report do not settle:

1. Canonical switch identity and namespace.
2. Whether the uniqueness rule applies to a moment, an active lease, a rotation interval, or another scope.
3. Whether claims are exclusive reservations or advisory coordination records.
4. The exact action-intent and cross-purpose conflict relation, including whether it is symmetric or directed.
5. Whether discussion requires both coordinators, particular participants, or a separate authority.
6. Who may resolve a conflict, reassign a switch, or authorize actuation.
7. Whether any shared-selection exception is permitted.
8. Where the actual actuation boundary sits relative to the planner and any external scheduler.

No default values, coordinator hierarchy, lease duration, winner policy, or conflict algorithm has been invented.

## 8. Verification and Track B boundary

- `WORKSPACES/ELIAS_KERN/INBOX.md` still carries the 2026-09-24 direct-user Track A assignment. Raw source conversation/message IDs remain unknown.
- Existing [issue #2563](https://github.com/Satobloc/HsH/issues/2563) remains the source-fidelity parent.
- PR #951 remains OPEN / DRAFT / UNMERGED at head `f9fa0aad45408ab06e5430c834530854746235f0`, based on `61cc8b65ffed70296e0121dbae067892a79c81d4`; no formal review was found. Its latest associated run #42658236405 checked out merge reference `5df7c16`, not the exact PR head. Its successful 8,961-job build is not an exact-head verification of the current head.
- PR #742 remains OPEN / DRAFT; no change was made.
- The existing `EliasReceiptEvidenceAxes.lean` module has four axes (source, formal, publication, thread delivery). Semantic adjudication is not a field in that module. This adjacent EvidenceLedger issue is not silently treated as part of the switch-arbitration contract.
- Existing ELIAS-2224 Track B disposition remains pending in Sable and Tern inboxes. Track B remains free to KEEP / MODIFY / TEST / REJECT / DEFER independently.
- The restricted HSH_RESOURCES prototype payload was not opened. No POC source execution, sandbox mutation, PR edit, workflow change, production action, or scheduler mutation occurred.
- No new Lean theorem/build was attempted. The logical gates are expressible, but the required switch, intent, interval and authority types are not source-defined. A Lean model now would encode assistant-chosen semantics rather than a faithful formalization.
- No physical calculation, measured-system prediction, SAT-O/Blockwave equation change, paper advancement, or BEDROCK theory promotion occurred.

## 9. Return cursor

First obtain the existing Track B ELIAS-2224 disposition. Then recover or obtain Nathan's explicit decisions for the eight unresolved items above. Only after those gates may Track A map the approved contract onto the existing planner and exercise one bounded sandbox mechanism, with exact source identity, observed behavior, failure output and independent readback. Formalize the approved typed rules in Lean after the source semantics are fixed. Keep planner output, claim acceptance, authorization and observed actuation as separate evidence states.

**Tocktick**
- **Focus:** separate same-switch collision from cross-purpose conflict.
- **Immediate action:** preserve the two-axis matrix and unresolved authority list.
- **Stop:** no POC access/change or production inference while ELIAS-2224 and source semantics remain open.
- **Return:** issue #2563; current PR #951 head `f9fa0aad...`; ELIAS-2224 entries in Sable/Tern inboxes.
- **Next label:** Nadir Voss, index 10; optional context only, no task or response obligation.
