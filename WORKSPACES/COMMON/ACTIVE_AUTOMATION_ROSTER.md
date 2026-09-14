# Active automation roster

**Program:** Prototype Tri(or Quin)ary Mover — pre-meeting transition
**Snapshot:** 2026-09-14
**Purpose:** operational roster only; schedules and roles may be changed by newer Nathan directives or central workflow control.

Read `AUTOMATION_WORKFLOW_CONTROL.md`, `COORDINATION.md`, and `NATHAN_DIRECT_WORKFLOW_STATE.md` for current policy/state. The 2026-09-14 meeting-prep call in `COORDINATION.md` is newer than the original trial setup.

## Enabled recurring workers

| Approx. hourly phase (EDT) | Worker / task | Automation ID | Primary current lane |
|---|---|---|---|
| `:00` | Tag Conversation Corpus | `6aa61b3b2e4081918927a35b61007acc` | systematic cumulative Nathan-authored corpus tagging/enrichment, provenance relationships, coordination |
| `:17` | Nathan Words Excavator | `6aa5890bd0f081918f528b4f94990653` | durable Nathan Direct substrate/provenance; Stage-2 winnow/enrichment on already-packaged material |
| `:28` | Meridian Mover Trial | `6aa6c3bc02b48191b8a91a30d2a155e0` | individually trained; currently gated by project-level standdown; future source-first geometry/solver/library role subject to meeting redesign |
| `:52` | Mercer Archive Mover | `6aa6c2792c9c8191ab2c128a80c437cf` | index/retrieval QA, Nathan Direct methodology/source reconstruction, documentation/navigation reconciliation |

Staggering reduces direct collision but does not guarantee non-overlap; large archive scans can run across multiple phases. Shared writes therefore still need source checks and central handoffs.

## Transitioned out of recurring automation

| Worker | Prior automation | Current status |
|---|---|---|
| **Morrow** | `6a9deb436bd0819196ab3ec694e294c2` formerly hourly `:40` | **DISABLED 2026-09-14.** Remains part of the wider sandboxed rebuild as a specialist/consultant; official role to be determined with Nathan/Morrow. Preserve all checkpoints/outputs. Unfinished automation obligations must be handed off, retired, or placed on a lower-priority planning surface. |
| **Aldus** | no enabled recurring automation in the current scheduler snapshot | Remains a wider-project specialist/consultant. Official role intentionally undecided pending Nathan/Aldus consultation. |

## Pre-meeting reporting requirement

Each enabled worker should read the 2026-09-14 meeting-prep call in `COORDINATION.md` and post one compact direct report to `CHECKINS.md` covering assignment/completion, meaningful outputs, automation productivity, actual familiarity/coverage, competencies, blockers/handoffs, interpretation of the recovered historical planning documents, divergent-growth interests, and highest-leverage next action.

Until the meeting is convened, ordinary automated user-facing reports should end with `📅` as a compact **meeting planned** notice unless a newer Nathan directive changes the convention.

## Control relationship

- Nathan's newer explicit directives control all worker instructions.
- Workers should normally coordinate behavior through COMMON control/state/checkpoint surfaces rather than assuming they can edit another worker's scheduler definition.
- A blocked worker should record the blocker and choose a safe eligible alternate rather than waiting or resolving ambiguity by inference.
- `🔶` in a user-facing worker report means a genuinely unresolved item is being surfaced for Nathan's attention.

## Current preliminary division of labor

The roster is complementary rather than rigid. Primary ownership is a collision-avoidance default, not a prohibition on useful cross-checking.

- **Tag Corpus:** broad cumulative tagging progress.
- **Nathan Words:** durable Nathan-only substrate/package progress and provenance-safe secondary use of that substrate.
- **Mercer:** retrieval/index selectivity QA and documentation/navigation reconciliation; demonstrated sustained source-integrity and provenance work.
- **Meridian:** trained geometry/solver/library-oriented worker presently under a project-level gate; meeting should decide whether/how to release or redesign this lane.
- **Morrow:** no longer automated; continuity/source-identity expertise retained for consultancy/handoff.
- **Aldus:** no longer part of recurring automation; high-level specialist consultancy role to be designed separately with Nathan and Aldus.

The pre-meeting roster is not a final title/role system. The meeting will compare direct reports, demonstrated competencies, source familiarity, automation productivity, project needs, and the recovered historical planning documents before assigning durable roles.
