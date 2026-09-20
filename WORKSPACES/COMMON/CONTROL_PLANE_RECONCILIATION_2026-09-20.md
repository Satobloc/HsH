# Control-Plane Reconciliation — 2026-09-20

**Status:** ACTIVE RECONCILIATION / newer Nathan directives control  
**Branch:** `CTRL-2026-09-20-GENERALIST`  
**Latest completed operation:** `CTRL-02` — durable instance registry / execution-lease state established.

## Controlling newer direction

Nathan's current workflow intent is:

1. **Stable instances, fluid work.** Historical specialties are soft strengths and continuity assets, not jurisdictional silos.
2. **Scheduler slots are execution capacity, not worker identity.** The active five-slot scheduler is a temporary lease layer over a larger population of accessible, paused, historical, and revival-ready instances.
3. **Revival preserves instance identity and useful methodological diversity.** Paused/unscheduled does not mean retired or disposable.
4. **Conversation-title protection is narrow.** Do not alter or suggest altering the user-visible ChatGPT conversation title/name. This does not constrain task reassignment, branch changes, queue movement, workflow routing, recurrence repurposing, or scheduler rotation.
5. **Dashboard plans are strategic-intent/design-history evidence, not immutable implementation specifications.** Preserve underlying purpose and provenance; improve, merge, replace, reorder, or retire mechanisms when justified.
6. **New/newer/revived/reassigned instances review the central three-repository onboarding when triggered.** Do not ritualistically reread the full package every hour when already current.
7. **Carpe turnem.** When authority, context, and access already permit a safe bounded advance, make the advance in the current turn rather than merely agreeing to do it later.
8. **Hard boundaries remain hard:** quarantine/exposure controls, source/provenance discipline, sandbox routing for theory-bearing work, and Nathan's authorship/signet controls.

## Conflicts found in current Common control surfaces

### A. `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`

The file still says workers should consult Sable for workflow functionality and reserves cross-lane redesign/reassignment/cadence/role redistribution to Sable. Those statements reflect the earlier specialist-lane/Sable-authority architecture. Until coherently revised, interpret lane as a soft continuity/specialty anchor and route system-level decisions through the current authorized control plane rather than assuming permanent Sable exclusivity.

### B. `ACTIVE_AUTOMATION_ROSTER.md`

The roster remains a 2026-09-18 scheduler snapshot and still presents the five recurrences primarily as fixed lane assignments under Sable-exclusive workflow authority. Its automation IDs and historical soft strengths remain useful, but the architecture is stale.

Successor identity/lease representation now exists at `WORKSPACES/COMMON/INSTANCE_REGISTRY_EXECUTION_LEASES.md`.

### C. `CURRENT_WORKFLOW_ORIENTATION.md`

Two stale points remain:

- section 6 says cross-lane workflow redesign remains a Sable systems question;
- section 17 says "Do not rename, retitle, or otherwise alter any conversation/thread/chat," which is broader than Nathan's clarified narrow UX rule and could be misread as restricting workflow reassignment/routing.

It also lacks the now-explicit instance-population/execution-lease model and Carpe turnem as native orientation concepts.

### D. Durable instance-pool surface — RESOLVED IN `CTRL-02`

Created `WORKSPACES/COMMON/INSTANCE_REGISTRY_EXECUTION_LEASES.md`.

The new control surface:

- separates stable instance identity from scheduler leases;
- records the five current scheduled workers as lease holders rather than permanent jobs;
- begins a conservative unscheduled/historical/revival population with Sable, Morrow, Aldus, Alberr, Calder, and Hale where current Common evidence supports inclusion;
- distinguishes verified scheduled state from unverified historical accessibility;
- defines lease assignment/release packets and revival relationship;
- explicitly states that unscheduled is not retired and paused is not abandoned;
- records Mercer as currently carrying this control-plane branch while retaining archive/QA as a soft strength only.

No claim is made that the initial historical population is exhaustive.

## Disposition

Do **not** mechanically replace every occurrence of old lane/Sable language. Those documents contain other live controls, including quarantine, provenance, handoff, signet, attention-flag, and sandbox rules, that should survive reconciliation.

Instead:

- this file remains the temporary reconciliation overlay;
- `INSTANCE_REGISTRY_EXECUTION_LEASES.md` now controls the identity-versus-lease distinction;
- newer Nathan directives and the current onboarding package control conflicting older workflow-authority language;
- old files remain evidence of prior workflow state until carefully revised;
- future edits should preserve still-live hard boundaries while removing obsolete jurisdictional implications.

## Completed bounded cursors

### `CTRL-01` — conflict identification
Completed. Located and bounded stale specialist-lane/Sable-exclusive and overbroad conversation-identity language.

### `CTRL-02` — worker/lease registry
Completed 2026-09-20. Created `INSTANCE_REGISTRY_EXECUTION_LEASES.md` with stable identity, availability classes, current scheduled leases, conservative historical/revival population, lease packet requirements, and maintenance rules.

## Next bounded cursors

### `CTRL-03` — orientation reconciliation — NEXT
Carefully update `CURRENT_WORKFLOW_ORIENTATION.md` so the narrow UX-title rule, generalist worker model, execution-lease model, current onboarding trigger, and Carpe turnem are native rather than overlays. Preserve still-live source, provenance, sandbox, quarantine, check-in, and documentation guidance.

### `CTRL-04` — autonomy/roster reconciliation
Revise `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md` and `ACTIVE_AUTOMATION_ROSTER.md` to distinguish hard constraints from defaults/heuristics/current assignments, remove obsolete Sable-exclusive jurisdiction where superseded, and preserve valid provenance/quarantine/sandbox/handoff controls.

### `CTRL-05` — cold-start test
After CTRL-03 and CTRL-04, run the onboarding cold-start test against the actual three-repository front doors and tool paths.

## Return route / exit criterion

Next worker taking this branch should begin at `CTRL-03`, not rebuild the registry. Exit when the live Common control surfaces no longer contradict the current generalist/lease/revival model and a cold-start instance can discover the architecture without relying on automation-prompt-only knowledge.