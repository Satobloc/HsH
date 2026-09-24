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
