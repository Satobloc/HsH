# Project Desk — control contract

**Status:** PROTOTYPE / ACTIVE TEST

The Project Desk is the full-project transparency breadboard and intended front end for the token/switchboard system.

## Four-port invariant

Every matrix cell may expose four small ports whose meanings do **not** change with state/color:

1. `⚡ EDGE` — latest/current live edge, artifact, commit, tool, or working location.
2. `⚠ TROUBLE` — current bottleneck, uncertainty, failed check, or most useful inspection point.
3. `👤 OWNER` — responsible worker's inbox/workspace, or closest available handoff surface.
4. `✎ INTERVENE` — route a control note: priority change, assignment/reassignment, blocker help, add/remove assignment, or other workflow intervention.

State color and evidence-depth are orthogonal readouts. Do not overload the four ports with state semantics.

## Worker contribution target

An active worker should eventually maintain up to four Desk anchors with urgency when practical: current edge, most problematic/uncertain edge, inbox/workspace, and an optional fourth location of their choice (bulletin board, conversation, War Room, tool, recent commit, etc.). A worker may explicitly declare `ALL_CLEAR`.

Do **not** interpret silence as perfection until this reporting contract is actually adopted for that worker/lease. A future machine-readable surface may be `WORKSPACES/<worker>/DESK_STATUS.json` or a lease-scoped equivalent; do not freeze that layout before the prototype settles.

## Urgency

Independent scale, currently 0–4: `0 none`, `1 low/background`, `2 useful attention`, `3 important/near-edge`, `4 urgent/hard blocker/override`.

Urgency is not the same thing as priority, correctness, completeness, or confidence.

## Safe control path

The public/static Desk must not hold GitHub credentials or direct scheduler write authority.

Current path:

`Desk drawer -> compact control packet -> PROJECT_DESK_INTERVENTIONS.md / issue / Comptroller intake -> assessed action -> scheduler/recurrence/repo mutation -> receipt -> Desk refresh`

Future authenticated controls may shorten this path while preserving receipts, worker discretion, quarantine, action-veto/refusal rules, and event-scoped identity.

## Future live behavior

Target: aggregate current controls, worker anchors, recent commits, receipts, leases and blockers; refresh matrices automatically; move dependency tracks through predefined/discovered edge states; mark slowdowns/bottlenecks; allow priority/reassignment/add-remove requests; feed safe actions to Comptroller/Sable and recurrence rewrites; leave durable receipts.

The Desk is a visual/control surface over project truth, not a competing source of truth.
