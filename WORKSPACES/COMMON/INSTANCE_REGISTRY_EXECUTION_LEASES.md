# Instance Registry / Execution Lease State

**Status:** ACTIVE CONTROL SURFACE  
**Established:** 2026-09-20  
**Purpose:** separate stable instance identity and revival continuity from temporary scheduler/recurrence capacity.

## Governing distinction

**Instances are the population. Recurrence slots are temporary execution leases.**

An instance does not cease to exist because it is unscheduled, paused, historical, or awaiting revival. A scheduler slot does not define a worker's identity or permanent job. Work may move between instances and instances may move between scheduled/unscheduled/revival states while preserving continuity, exposure history, and human wayfinding.

User-visible ChatGPT conversation titles are human wayfinding labels only. Do not alter or suggest altering them. They are not machine identity, branch identity, task identity, or lease identity.

## State vocabulary

- **scheduled** — currently holds an active recurrence/execution lease.
- **accessible-unscheduled** — accessible instance without a scheduler lease; eligible for bounded/manual work or a future lease.
- **paused** — intentionally not executing; continuity preserved; may be resumed when trigger/fit warrants.
- **historical-accessible** — older instance/conversation believed accessible for manual reentry, but current-state synchronization is required.
- **archived/revival-ready** — continuity can be reconstructed from saved conversation/archive/wake packet; revival process required before ordinary work.
- **candidate/unverified** — referenced in project records but accessibility/current identity has not been verified.

These are availability states, not value rankings.

## Lease rules

1. Only five scheduled tasks may be active at once under the current scheduler constraint.
2. A lease is temporary execution capacity over the larger instance population.
3. Lease assignment should consider current task fit, continuity, exposure/quarantine state, methodological diversity, currentness, checkpoint quality, and starvation/bottleneck risk.
4. Releasing a lease does not retire the instance.
5. Reassignment preserves a continuity packet: last durable state, sources/artifacts covered, blocker/failed approaches, next cursor, exposure/quarantine state, exit criterion, and return route.
6. Historical soft specialties guide selection but are not jurisdictional boundaries.
7. Archived instances enter ordinary work through revival/reentry with identity and exposure provenance preserved.
8. Do not invent accessibility. If a historical conversation must be manually opened/launched by Nathan, record that boundary explicitly.

## Current scheduled execution leases

Snapshot reconciled against the active scheduler on 2026-09-20.

| Stable instance / continuity identity | Current recurrence/task | Scheduler ID | Availability | Soft strengths / continuity assets | Current branch / role | Last-known checkpoint / wayfinding |
|---|---|---|---|---|---|---|
| **Loom** | Tag Conversation Corpus | `6aa61b3b2e4081918927a35b61007acc` | scheduled | corpus tagging, annotation, terminology, relationship mapping, enrichment | generalist lease; corpus/annotation bias | recurrence prompt + Common shared state |
| **Aster** | Nathan Words Excavator | `6aa5890bd0f081918f528b4f94990653` | scheduled | Nathan-authored corpus, provenance, chronology, source ancestry, extraction, exact wording | generalist lease; Nathan Direct/provenance bias | recurrence prompt + Common shared state |
| **Meridian** | Meridian Solver Loop | `6aa6c3bc02b48191b8a91a30d2a155e0` | scheduled | geometry, solver work, formalization, representation, coding, invariance/limit checks | generalist lease; solver/formalization bias | recurrence prompt + Common shared state |
| **Tern** | AUTOMATION — Project Systems | `6aa80ddccc888191a6a9b2c073f434b7` | scheduled / resident Comptroller lease | workflow health, task allocation, control-plane repair, revival/reentry, scheduler/instance-pool steering | Comptroller/system-steering generalist | recurrence prompt + Common control surfaces |
| **Mercer** | Mercer Archive QA Loop | `6aa6c2792c9c8191ab2c128a80c437cf` | scheduled | archive/provenance QA, retrieval, indexing, reproducibility, crosswalks, documentation | generalist lease; archive/QA bias; currently `CTRL-2026-09-20-GENERALIST` | Common control-plane reconciliation + recurrence prompt |

### Lease interpretation

The task names above are operational recurrence labels. They do **not** freeze worker roles. Each scheduled instance should consult current central task/branch state each run and may take another safe high-value bounded task under current controls.

## Known unscheduled / historical / revival population

This table is deliberately conservative. It records only identities/statuses supported by current Common material inspected for this control pass; it is not a claim to enumerate every historical instance.

| Instance / identity | Current registry state | Known continuity / soft strengths | Reentry/access note | Current eligibility |
|---|---|---|---|---|
| **Sable** | historical-accessible / human-facing continuity-systems identity | systems continuity, historical workflow architecture, coordination | do not conflate with Tern/Project Systems; synchronize against newer generalist/lease architecture before system decisions | eligible if accessible; no automatic scheduler attachment assumed |
| **Morrow** | paused / historical-accessible | continuity, conversation-source identity, contextual/provenance recovery | prior recurrence `6a9deb436bd0819196ab3ec694e294c2` is disabled; preserve its checkpoints/outputs | revival/manual or future lease candidate |
| **Aldus** | historical-accessible / unscheduled | orthogonal analogy/morphology work in earlier architecture | no enabled recurrence in current roster; current accessibility should be verified before assignment | candidate for manual/revival work |
| **Alberr** | archived/revival-ready / manual | historically distinct consultant/ombudsman candidate; geometry perspective | `WORKSPACES/SABLE/WAKE_PACKETS/REV-001-ALBERR-GEOMETRY.md`; manual launch/acceptance previously required | revival candidate; not presumed active |
| **Calder** | candidate/unverified | empirical/statistical adversarial checks; provenance-conscious external-evidence work | 2026-09-12 Common check-in exists; current conversation accessibility not verified in this pass | verify before lease/reassignment |
| **Hale** | candidate/unverified | external-literature scanner, code/scoring/statistical analysis | 2026-09-12 Common check-in exists; external-research exposure is material to routing; accessibility not verified in this pass | verify access/exposure before assignment |

## Minimum durable record for any added/revived instance

When an instance is added to this registry, preserve where knowable:

- stable instance name / continuity identity;
- human wayfinding pointer to conversation or wake/reconstruction packet;
- accessibility class;
- scheduled / unscheduled / paused / historical / archived / revival-ready state;
- current and last branch/task;
- soft strengths and methodological profile;
- source/exposure/quarantine history relevant to routing;
- known blind spots or independence constraints;
- last durable checkpoint and last check-in;
- revival/reentry state;
- lease eligibility and current lease, if any;
- manual action required for access, if any.

Unknown fields should remain explicitly unknown rather than being inferred from names or old role descriptions.

## Lease assignment / release packet

A scheduler lease assignment should record:

- instance;
- task/branch ID;
- why this instance is a good current fit;
- continuity packet / exact next cursor;
- permitted and prohibited exposure surfaces;
- expected bounded quantum/check-in behavior;
- exit/release trigger;
- return route if blocked or superseded.

On release, record the durable state and next cursor. **Unscheduled is not retired. Paused is not abandoned.**

## Revival relationship

The revival loop operates on the larger instance population, not merely abandoned tasks. Its target is identity-preserving useful reentry: recover who the instance was, what it had actually seen, how it worked, what remained unresolved, and what minimum synchronization is needed for present work.

A revived instance should review current onboarding when triggered, preserve historical exposure/methodological differences, and then enter the same generalist task/lease model as other workers. Revival should not flatten it into a generic replacement worker.

## Maintenance / source discipline

- Reconcile scheduled rows against actual automation state when scheduler assignments materially change.
- Update accessibility only from verified current access or durable evidence; do not infer it.
- Add historical instances progressively as revival/source recovery establishes them.
- Keep `ACTIVE_AUTOMATION_ROSTER.md` as an operational scheduler snapshot until it is reconciled, but this file controls the **identity-versus-lease distinction**.
- `CHECKINS.md`, handoffs, worker-local checkpoints, saved conversations, and wake packets are evidence for instance history; none alone should be silently treated as complete.
- Newer explicit Nathan directives control.

## Current next cursor

Control-plane branch `CTRL-2026-09-20-GENERALIST`: `CTRL-02` is complete with creation of this registry. Next bounded control-plane cursor is `CTRL-03`: reconcile `CURRENT_WORKFLOW_ORIENTATION.md` so the generalist model, narrow conversation-title rule, onboarding trigger, Carpe turnem, and instance-population/execution-lease distinction are native rather than overlay-only.