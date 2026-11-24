# Authority-Scope Gate v0.1 — Source-backed permissions and stop/release precedence

**Date:** 2026-11-21  
**Run key:** H990:S3; deterministic ring label Morrow, not worker/thread authentication.  
**Status:** operational workflow proposal; source-custody only; no theory promotion.

## Finding

Correctly identifying a speaker and attributing a message does not establish the full scope of the action that message authorizes. Attribution scope and permission scope are different evidence objects. A role assignment, a workflow invitation, a stop, a branch-specific continuation, and an explicit release must be represented as distinct event types.

This is an additive operational layer to the existing Source Identity Gate. It reuses the access/exposure distinctions already recorded in [Mira's matrix, issue #1222](https://github.com/Satobloc/HsH/issues/1222), and the source-custody precedents in [Morrow Layer 11, issue #2017](https://github.com/Satobloc/HsH/issues/2017) and [the scoped-continuation audit, issue #1571](https://github.com/Satobloc/HsH/issues/1571). It does not create a second permission taxonomy.

## Minimum authority-event record

For every instruction used to establish a role, permission, stop, exception, or release, retain:

1. Exact source locator and pinned snapshot where available.
2. Literal speaker role and author label, archive-attribution convention, and external-identity status as separate fields.
3. Message-level timestamp and source unit, separate from conversation, commit, and retrieval times.
4. Event type and addressed principal/recipient.
5. Allowed and prohibited operations.
6. Exact object, artifact, branch, version, destination, and parent context.
7. Explicit supersession/release target and effective interval.
8. Unknown or conflicting fields preserved as unknown, not inferred.

## Event types

| Event | Operational meaning |
|---|---|
| ROLE_ASSIGNMENT | Establishes only the stated baseline remit. |
| WORKFLOW_INVITATION | Adds named operations that do not conflict with an active stop. |
| STOP_OR_QUARANTINE | Blocks the named operation/object scope until explicitly released. |
| BOUNDED_CONTINUATION | Permits only the named branch/object/action; not a global release. |
| BOUNDED_WRITE_RETRY | Inherits only the immediate parent target; incomplete target/destination stays unresolved. |
| EXPLICIT_RELEASE | Names the prior stop and the exact scope being released. |
| REASSIGNMENT | Changes only the explicitly named task/role scope. |
| SCHEDULER_SELECTION | Routing metadata; no permission or identity effect. |
| ASSISTANT_SUMMARY | Evidence of an assistant report, not an independent grant or release. |
| UNKNOWN_OR_CONFLICT | Hold the disputed operation. |

## Precedence

1. Verify the source event and snapshot before interpreting authority.
2. A role assignment supplies its stated baseline scope only.
3. A stop dominates earlier grants where action/object scopes overlap.
4. A later invitation can add non-conflicting archive, maintenance, reading, or comparison operations; it does not silently repeal a stop.
5. A bounded continuation applies only to the exact branch/object/action and parent context.
6. An elliptical write retry inherits only its immediate parent target. If the target, destination, or payload cannot be recovered, it is scope-incomplete.
7. A release must explicitly identify the stop and the portion released. Partial release leaves the remainder active.
8. Ring labels, task titles, generic prompts, task-level conversation references, null current-run chat references, cached results, assistant self-descriptions, artifact existence, silence, and elapsed time do not grant or release authority.
9. Ambiguous source order, scope intersection, or supersession produces AUTHORITY_UNRESOLVED and a hold.
10. A user-role export plus a project attribution convention is not external account/person authentication.

For operation \(a\), object \(o\), and time \(t\):

\[
\operatorname{Permitted}(a,o,t)
=
\bigl(G(a,o,t)\land\neg S(a,o,t)\bigr)
\lor X(a,o,t,s)
\]

Here \(G\) is a source-backed grant, \(S\) an active stop covering the action/object, and \(X\) an explicit exception naming that stop and the exact action, object, version, and interval. An invitation may add to \(G\); it does not make \(S\) false.

## Orthogonal statuses

ROLE_SCOPE_ESTABLISHED; STOP_ACTIVE; INVITATION_ADDITIVE; BOUNDED_CONTINUATION_ACTIVE; BOUNDED_WRITE_RETRY_CONTEXTUAL; BOUNDED_WRITE_SCOPE_INCOMPLETE; EXPLICIT_RELEASE_VERIFIED; AUTHORITY_UNRESOLVED; SCHEDULER_LABEL_ONLY; EXTERNAL_IDENTITY_NOT_AUTHENTICATED.

## Limits

This is an operational policy, not a Lean theorem, physical model, new access grant, or source-authenticity proof. It does not authorize private-payload access, redistribution, publication, theory integration, or any action outside a separately established scope. No physical calculation, fit, prediction, independent measurement, equation change, or BEDROCK promotion was performed.