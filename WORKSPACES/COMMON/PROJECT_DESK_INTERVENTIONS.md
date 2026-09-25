# Project Desk — Intervention Queue

**Status:** LIVE INTAKE / prototype

Use this as the durable intake behind the Project Desk `✎ INTERVENE` port until a more direct authenticated control path is proven reliable.

## Packet format

Append newest items at the top.

```text
### DESK CONTROL — <timestamp>
lane: <lane / worker / repo / theory sector>
action: PRIORITY | ASSIGN_REASSIGN | BLOCKER | ADD_REMOVE | NOTE
urgency: 0-4
request: <short request>
source: Project Desk
status: OPEN
```

Comptroller/Sable should assess OPEN packets during supervisory passes and route them to the current worker/inbox, subteam, recurrence rewrite, priority/control ledger, code/tool request, pause/park, or clarification only when materially necessary.

Disposition should be explicit: `ROUTED`, `ACTED`, `PARKED`, `DECLINED_BY_WORKER`, `SUPERSEDED`, or another clear state. Do not silently delete.

---
