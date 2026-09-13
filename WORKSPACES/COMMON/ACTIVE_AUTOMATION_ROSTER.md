# Active automation roster

**Program:** Prototype Tri(or Quin)ary Mover
**Snapshot:** 2026-09-13
**Purpose:** operational roster only; schedules and roles may be changed by newer Nathan directives or central workflow control.

Read `AUTOMATION_WORKFLOW_CONTROL.md` for policy and `NATHAN_DIRECT_WORKFLOW_STATE.md` for current Nathan Direct dependency state.

## Enabled recurring workers

| Approx. hourly phase (EDT) | Worker / task | Automation ID | Primary current lane |
|---|---|---|---|
| `:00` | Tag Conversation Corpus | `6aa61b3b2e4081918927a35b61007acc` | systematic cumulative Nathan-authored corpus tagging/enrichment, provenance relationships, coordination |
| `:17` | Nathan Words Excavator | `6aa5890bd0f081918f528b4f94990653` | corpus-first Nathan Direct extraction/packaging/provenance; secondary winnow/curation only after substrate is available |
| `:28` | Meridian Mover Trial | `6aa6c3bc02b48191b8a91a30d2a155e0` | current training/4D-thinking gate; later source-first geometry/solver reconstruction + library/vetting if released |
| `:40` | Morrow Continuity Trial | `6a9deb436bd0819196ab3ec694e294c2` | conversation-source identity, continuity, branch/context and provenance recovery supporting Nathan Direct |
| `:52` | Mercer Archive Mover | `6aa6c2792c9c8191ab2c128a80c437cf` | index/retrieval QA, Nathan Direct methodology/source reconstruction, documentation/navigation reconciliation |

This staggering reduces direct collision but does not guarantee non-overlap; large archive scans can run across multiple phases. Shared writes therefore still need source checks, fresh SHAs/rebases where appropriate, and central handoffs.

## Control relationship

- Nathan's newer explicit directives control all worker instructions.
- Workers should normally coordinate behavior through COMMON control/state/checkpoint surfaces rather than assuming they can edit another worker's scheduler definition.
- The two original Nathan Direct/tagging automations and the three Mover workers now all explicitly start from central COMMON workflow/coordination state.
- A blocked worker should record the blocker and choose a safe eligible alternate rather than waiting or resolving ambiguity by inference.
- `🔶` in a user-facing worker report means a genuinely unresolved item is being surfaced for Nathan's attention.

## Current division of labor

The roster is deliberately complementary rather than rigid. Primary ownership is a collision-avoidance default, not a prohibition on useful cross-checking.

- **Tag Corpus** owns broad cumulative tagging progress.
- **Nathan Words** owns durable Nathan-only substrate/package progress and provenance-safe secondary use of that substrate.
- **Morrow** owns conversation identity/continuity/branch-context recovery.
- **Mercer** owns retrieval/index selectivity QA and documentation/navigation reconciliation; the existing precision-v2 tagger is currently within this QA frontier.
- **Meridian** owns its training-first lane during standdown and later its source-first geometry/solver/library remit if released.

All may do bounded safe alternate/exploratory work under central control once primary goalposts are met or blocked.
