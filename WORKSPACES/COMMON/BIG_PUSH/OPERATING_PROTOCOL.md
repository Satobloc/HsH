# THE BIG PUSH — Operating Protocol

## 1. The working pyramid

Keep the active cognitive load small. Store detail behind links rather than repeating it in every prompt.

| Layer | Holds | Rule |
|---|---|---|
| Boot capsule | Mission, top priorities, pointers, restart trigger, current cursor | Read first; keep short |
| Active tray | One operation, current phase, exact cursor, 1–3 controlling constraints | Keep immediately available |
| Control shelf | Programme phases, decisions, status, gates, source ledger | Update when state changes |
| Reference library | Historical source files, old plans, capability evidence, literature dossiers, methods | Retrieve only when relevant |
| Parking drawer | Valuable but non-urgent ideas, deferred work, speculative options | Preserve without letting them hijack active work |

Do not duplicate long instructions across layers. A short pointer should say what to retrieve and when.

## 2. Priority and scope control

1. P0 continuity and provenance are never traded away for speed.
2. P1 is the single active programme operation. Do not run several major phases in parallel.
3. P2 work is permitted only when it unlocks or materially improves P1.
4. P3 items are recorded in the parking drawer with a reason for deferral and a retrieval trigger.

At the start of every operation, state internally: current phase, intended artifact/evidence, scope boundary, source(s), and stop condition. If a new discovery materially changes the plan, record it, but do not automatically abandon the current operation.

## 3. Unit of work

One operation is one bounded task with a checkable result, such as reading a defined source range, reconciling one archive partition, testing one tool path, or writing one comparison matrix.

Each operation must leave:
- operation ID and date/time;
- phase and question;
- exact source/repository/path/blob SHA or external citation;
- search method and search limits, where applicable;
- what was actually read or executed, including exact ranges;
- result and evidence;
- confidence, uncertainty, contradictions, and negative findings;
- artifact path/commit/blob SHA if written;
- next action and exact cursor.

A run may discover adjacent work, but it must put that work in the queue rather than silently expanding scope.

## 4. Source and inference discipline

Label findings as one of:
- Nathan Direct / user-authored primary statement;
- historical assistant output;
- repository-authored plan or artifact;
- external source or literature;
- current assistant reconstruction or inference;
- tested current capability;
- untested capability / hypothesis.

Preserve chronology, speaker attribution, branch ancestry, duplicate witnesses, and exact source wording where it matters. A mirrored transcript with the same source hash is one witness, not two independent sources. File timestamps are not message timestamps. Search results, titles, generated summaries, and indexes locate evidence but do not replace reading it.

Use scripts for bulk inventories, deduplication, timestamp conversion, set overlap, corpus statistics, and numerical work whenever they reduce manual error. Keep scripts and calculation inputs inspectable. Do not imply a calculation was run when it was not.

## 5. Research sequence

Follow the phase order in PROJECT_CONTROL.md unless evidence justifies a documented change:
1. Recover historical designs and source chronology.
2. Reconstruct workflows and adjacent plans.
3. Audit actual present-day resources across all three repositories and connected tools.
4. Survey external literature and current research.
5. Synthesize and orient SAT/H(s)H in the landscape.
6. Recover forgotten and orphaned goals.
7. Compare 2–3 genuinely different institutional architectures.
8. Select and charter only after comparison.
9. Implement in controlled increments.

Do not retrofit the past to fit current products or fashionable agent patterns. Preserve failed, abandoned, partial, and superseded designs.

## 6. Stop, park, prune, retrieve

- **Stop:** halt an operation when its defined evidence or stop condition is reached, or when source integrity/access is compromised.
- **Park:** move a worthwhile issue out of the active tray when it does not unlock the current milestone. Keep its origin, reason, and retrieval trigger.
- **Prune:** remove duplication, obsolete navigation, and repeated instructions only after checking whether they contain unique evidence.
- **Drawer check:** at each phase gate and scheduled review, inspect parked items for a trigger match. Do not reopen everything on every turn.
- **Rescope:** if repeated work yields no new evidence, change search method or analytical lens and record why.

## 7. Continuity and anti-drift

- The repository is the durable project state; the chat context is a temporary working surface.
- Refresh the project capsule and active cursor after each substantive operation, not only at the end of a long conversation.
- At session start, retrieve the active tray and the smallest necessary source set. At session end, leave a restart note and refresh the interactive heartbeat.
- Do not treat a worker label, recurring schedule, or new ChatGPT conversation as proof of identity continuity.
- A successor inherits the work record and must independently inspect the named primary sources before extending conclusions.
- Do not promise future or background work outside an enabled automation. The :00 task is a scheduled continuity check, not a guarantee of identical-instance persistence.

## 8. Review and improvement

At each five completed operations or phase gate, whichever comes first:
- compare intended work with actual progress;
- inspect whether key goals have fallen out of scope;
- check whether the active tray is too crowded or too thin;
- compare parked items to current triggers;
- identify repeated or wasteful procedure;
- verify citations, source ranges, and artifact readbacks;
- simplify instructions without deleting unique constraints.

At least weekly during active work, inspect the whole programme map and calendar. Every review should result in explicit KEEP / CHANGE / PARK / RETIRE decisions. Do not add process for its own sake.

## 9. Automation execution and scheduler caution

Only the existing :00 task is the Big Push continuity steward. It should read the heartbeat and state file, claim one operation, complete it, and commit its receipt. It must not count its own runs as a human heartbeat.

Before attributing a cached automation result to a current run, compare run IDs. Record scheduled_for, started_at, completed_at, recorded status, and chat_ref separately. A null chat_ref does not authenticate a thread. Repeated starts for one run ID or a cached result whose run_id differs from last_run.id must be recorded as scheduler uncertainty, not interpreted as proof of work or failure.

## 10. Governance boundaries

The Big Push does not authorize changes to HsH BEDROCK, theory status, protected campaigns, existing task identities/schedules/phases, occupied Mersearch request lanes, or external account permissions. Follow current repository governance and task-specific stop conditions. No institutional architecture is selected by this protocol.
