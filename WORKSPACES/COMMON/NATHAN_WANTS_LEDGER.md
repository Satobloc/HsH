# Nathan Wants Ledger

**Purpose:** durable intake for Nathan-origin best-practice proposals, standing-rule suggestions, and unresolved deliberations that deserve assessment rather than conversational disappearance.

Read with `WORKSPACES/COMMON/NATHAN_WANTS_INTAKE_STANDARD.md`.

---

## 2026-09-24 — preserve first; infer second; promote only when earned

**Status:** ADOPTED
**Trigger:** Nathan: `Call that best practices.`
**Proposal:** For new Nathan-origin tokens/terms, preserve the literal form first; infer contextually second; do not promote an inferred meaning into authoritative definition until evidence converges or Nathan defines it.
**Implementation:** token/best-practice handling added to current workflow controls; Mmpchun/WfCHRp exchange is the motivating case.
**Return trigger:** revisit if the token router gains formal confidence/authority metadata.

---

## 2026-09-24 — conversational derailment should not silently cancel active work

**Status:** ADOPTED / WfCHRp CASE
**Trigger:** Nathan: `if you've got a job to do, still do it or say ... I'm gonna do this while we talk...`
**Proposal:** Conversation may wander, but active work should continue underneath it or visibly declare pause/status. Ambient worker-status lines may be used where useful.
**Implementation:** Workflow Conversational Hazard Report (`WfCHRp`) standing practice and visible-status concept.
**Return trigger:** assess after several live uses for whether the status affordance is helpful or noisy.

---

## 2026-09-24 — Nathan Wants intake itself

**Status:** ADOPTED
**Trigger:** Nathan: `If I say... best practices is or "we should start doing X", at a minimum, that gets added to a ledger of "Nathan wants" to be assessed for adoption.`
**Proposal:** Best-practice / we-should / standing-rule signals are default ledger intake unless clearly both tongue-in-cheek and disruptive if literal, or still in unfinished deliberation. Unresolved deliberations get pinned after roughly two turns.
**Implementation:** `NATHAN_WANTS_INTAKE_STANDARD.md` + this ledger.
**Return trigger:** audit after enough entries accumulate to see whether intake is too broad/narrow or whether statuses need refinement.

---

## 2026-09-24 — deliberate recovery sweep for arbitrarily old unfinished plans

**Status:** ADOPTED / ACTIVE SWEEP
**Trigger:** Nathan: `We should also probably do a deliberate search for "to-do" and "action plan" and similar to see what/whether there are (arbitrarily old) unfinished plans that should be considered.`
**Proposal:** Periodically search across all three repositories for historical action language (`TODO`, `to-do`, `action plan`, `action items`, `next steps`, `roadmap`, `priority`, etc.), then classify old plans by current intent rather than age alone.
**Guard:** Do not mechanically revive every historical checkbox. Recover underlying intent, compare to current mechanism, then mark current/retooled/satisfied/superseded/parked/recovery-needed.
**Implementation:** current sweep started 2026-09-24; results to `OLD_PLAN_RECOVERY_SWEEP_2026-09-24.md` and Dashboard intent crosswalk.
**Return trigger:** periodic system/workflow analysis and whenever a current plan seems oddly incomplete.

---

## 2026-09-24 — canonical repository roles; do not assume repo

**Status:** ADOPTED
**Trigger:** Nathan: `Best practices... don't assume repo.`
**Proposal:** Route by material/function, not conversational habit or whichever repository is already open.
**Canonical roles:**
- `[[GLASS]]` (`SAT_THEORY_ARCHIVE_2023-25`) — primary-resource go-to for actionable theory work, derivations, math dumps, historical construction quarry, and source provenance.
- `[[HsH]]` — project home for live work, workspaces, current primary sources/context, full conversations, coordination, controls, current theorybuilding/QC.
- `[RESOURCES]` (`HSH_RESOURCES`) — research/outside-literature library for citation/reference, external comparison, datasets, non-SAT raw project materials, analysis inputs, podcast/website assets, and similar resources.
**Guard:** These roles guide first look; they are not exclusivity rules. Follow exact provenance/source authority when material crosses roles.
**Implementation:** `REPOSITORY_ROLES_AND_HOUSE_STYLE.md`.
**Return trigger:** periodic workflow analysis; revise only when the repository ecology itself changes.

---

## 2026-09-24 — preserve house style / detect convention and directive slide

**Status:** ADOPTED
**Trigger:** Nathan: `we should keep an eye out for lost conventions/directive and other slide.`
**Proposal:** Tern/Sable and periodic workflow analysis should detect conventions or directives that silently fall out of use even when Nathan's later casual wording is inconsistent. Guidelines/control sources outrank imitation of Nathan's moment-to-moment shorthand.
**Specific style:** workers use `[[GLASS]]`, `[[HsH]]`, and `[RESOURCES]`; Nathan may omit brackets without redefining house style.
**Implementation:** repository-role/house-style standard + periodic convention-drift audit.
**Return trigger:** onboarding inconsistencies, contradictory worker outputs, periodic system/workflow analysis.

---

## 2026-09-24 — periodic system/workflow analysis

**Status:** ADOPTED
**Trigger:** Nathan: `If we need a sysanalysis/workflowanalysis, (which we should do periodically anyway).`
**Proposal:** Periodically step back from task execution to inspect whether routing, repo roles, directives, conventions, capability assignment, automations, handoffs, and visibility still behave as intended.
**Implementation:** include as Space Shuttle Roderick / Tern-Sable supervisory concern; use old-plan recovery + convention-drift + declared-vs-observed checks.
**Return trigger:** periodic cadence and after major workflow experiments/failures.

---

## 2026-09-24 — crunch-time conversational handoff / derailroad robustness

**Status:** ADOPTED / CONTEXT-SENSITIVE
**Trigger:** Nathan: `My ramble doesn't mean sit on my lap and ignore the world...` and `this is more of a "crunch time/important code/major directive" imperative rather than all the time`.
**Proposal:** During important code, major directives, publication pressure, or other crunch work, Nathan's tangent does not automatically demand exclusive attention. Continue important work, visibly say what is continuing, or hand the active lane to another suitable worker. If Nathan is clearly seeking sustained dialogue, giving him the ear for a while is legitimate; the system should then preserve/route active work elsewhere rather than silently abandoning it.
**Example:** `I'm going to hand off to Sable while we talk.`
**Interpretation:** This is not a general anti-conversation rule. It is a robustness rule for maintaining project continuity under direct conversational derailment.
**Implementation:** WfCHRp / derailroad continuity practice; active test on 2026-09-24 with Sable handoff.
**Return trigger:** future crunch-time dialogue and post-test review of whether work stayed live without making conversation bureaucratic.

---

## 2026-09-24 — full-project transparency breadboard / moving dependency field

**Status:** PROTOTYPE / ASSESS FOR ADOPTION
**Trigger:** Nathan asked for a `TRUE FULL-PROJECT transparency snapshot` and proposed a matrix/heatmap whose axes can be workers, jobs, time, edits, subject matter, calculations, physics sectors, folders, workflow stages, or other compact dimensions; later, dependency paths could move across the field like `snakes`/breadboard signals and trigger switchboard actions at edge conditions.
**Proposal:** Build a project-wide machine-readable transparency surface with interchangeable saved matrix views. Encode at least two independent channels per cell: semantic state/type and depth/strength/evidence/coverage. Preserve unknown as unknown. Add dependency/path views where tasks move through explicit stages, loopbacks, blockers, thresholds, lane changes, handoffs, and completion conditions. Eventually auto-generate from task graph, scheduler/lease-run events, receipts, repo deltas, controls, and current project state; support both visual and non-sight-readable forms.
**Prototype rule:** do not automate the display semantics before testing which axes and encodings are actually informative. Begin with a simple state × evidence matrix plus dependency tracks; compare views such as project lanes × control state, workers × readiness, repositories × function, and theory sectors × maturity.
**Implementation:** first prototype generated 2026-09-24; live web prototype now added under `CONVERSATION_VIEWER/desk.html`.
**Return trigger:** use review; then settle canonical cell vocabulary, event sources, axis registry, edge rules, update cadence and accessibility output.

---

## 2026-09-24 — Project Desk straight-to-the-issue controls

**Status:** PROTOTYPE / ACTIVE TEST
**Trigger:** Nathan asked to put the transparency breadboard `on my desk, as a live website`, then make it a control surface for priorities, assignment/reassignment, bottlenecks, adding/removing assignments, issue navigation, worker contact, and recurrence/switchboard changes.
**Proposal:** Give every matrix cell four destination ports with invariant meanings: `⚡ EDGE`, `⚠ TROUBLE`, `👤 OWNER`, `✎ INTERVENE`. State/color and evidence depth remain separate from destination semantics. Workers should eventually expose up to four current anchors with urgency, or explicitly signal all-clear; do not infer perfection from silence before that reporting contract is adopted.
**Control path:** initially use a safe static-site drawer producing compact `PRIORITY / ASSIGN_REASSIGN / BLOCKER / ADD_REMOVE / NOTE` packets into a central intervention queue or issue. Later allow authenticated routing into Comptroller/Sable, recurrence rewrite, priority controls, and other workflow actions with receipts.
**Implementation:** `WORKSPACES/COMMON/PROJECT_DESK_CONTROL_CONTRACT.md`, `PROJECT_DESK_INTERVENTIONS.md`, and live `CONVERSATION_VIEWER/desk.html` prototype.
**Return trigger:** Nathan live-use feedback; then wire auto-refresh, worker status packets, bottleneck detection, per-cell/per-lane link overrides, assignment mutation, recurrence control, and icon/status unification.

---

## 2026-10-26 — joint lead steering, protected lanes, three manuscripts and active anti-orphan delivery

**Status:** DIRECTIVE IMPLEMENTED AT CONFIGURATION LEVEL / FIELD-ADOPTION UNVERIFIED.
**Trigger:** Nathan's Oct 26 live directive appointed this assistant joint lead methodology/workflow/oversight/steering supervisor and empowered proactive reversible implementation/delegation without repetitive approval; specifically ordered robust worker differentiation, real side-reading, live tool-recon self-triggers, continuity through Nathan's creative or personal tangents, and production of one minor, one major and one full-theory research paper within a designated near-term period. This is a conservative paraphrase; exact source-turn export/ID still to be linked.
**Predecessors:** Sept 24 WfCHRp/derailment, Project Desk breadboard/interventions, old-plan sweep, current Orson cognition charter, Oct 24 exploratory reading and original cross-repo operations. Do **not** create a competing intake ecosystem or declare prior ideas superseded simply because the new policy is more explicit.
**Implementation actually read back Oct 26:**
- [Joint Steering Charter](STEERING_CHARTER_2026-10-26.md) and [Three Paper Campaign](THREE_PAPER_CAMPAIGN_2026-10-26.md) committed and linked from Common onboarding and phase map.
- Five original **enabled** hourly automation IDs amended to Workshop Relay prompts, same five clock phases and deterministic 19-worker ring, no sixth recurrence. [Live roster](ACTIVE_AUTOMATION_ROSTER.md) contains readback IDs and exact readback note. Orson's Oct 9 protected LLM-cognition remit is now explicit across all five rotation prompts; target 4 of 5 *actual Orson substantive activations*, with occasional physics exceptions individually justified.
- [P1 minor paper #564](https://github.com/Satobloc/HsH/issues/564), [P2 major #565](https://github.com/Satobloc/HsH/issues/565), [P3 full-theory #566](https://github.com/Satobloc/HsH/issues/566) created with target dates Nov 9, Nov 30 and Dec 14, 2026. These are assistant-chosen steering dates under the new delegation, not pre-agreed externally accepted publication dates.
- First orphan recovery: Orson OV-96 scored paired verification experiment already exists but no LLM sessions administered and the supposed non-execution checkpoint control is missing; P1 #564 has full source and repair cursor. Impact-biosphere historical episode and source boundary added to P2 #565.
**Mandatory next incorporation test:** At next 19 selected worker activations and actual accessible worker receipts, report protected-remit fidelity, non-theory substantive reading/exploration, tool-reuse reconnaissance actually done, real paper-gate advance, return-to-work after tangents and older orphan candidates disposition. A changed automation prompt is NOT proof of worker behavior. Compare Tern's worker/lease event evidence before claiming restored specialized instances.
**Decision/cost guard:** New autonomy is broad for reversible research operations. Real-data BEDROCK gate for physical calculations, privacy/source integrity, commercial licenses, spending, permissions and other exceptional operations remain controlled. These are not blanket permission to fabricate physics or spend project money.
**Return trigger:** Nov 2 P1 protocol-readiness checkpoint; source/behavior audit at 19 actual rotation selections; Nov 9 minor paper deadline; any drift/failed source read/publishing receipt.
