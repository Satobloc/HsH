# Active automation roster

**Program:** Hourly SAT/H(s)H worker loops + Sable continuity  
**Snapshot:** 2026-09-17  
**Purpose:** operational roster only; newer Nathan directives and Sable continuity may change schedules/roles.

Read `AUTOMATION_WORKFLOW_CONTROL.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, current coordination/handoffs, and Sable's `CONTINUITY_CHECKPOINT.md` for current policy/state.

## Enabled recurring workers

| Hourly phase (EDT) | Worker / task | Automation ID | Primary lane |
|---|---|---|---|
| `:00` | Tag Conversation Corpus | `6aa61b3b2e4081918927a35b61007acc` | broad cumulative Nathan-authored corpus tagging/enrichment, context/provenance relationships, tagging QA |
| `:12` | Nathan Words Excavator | `6aa5890bd0f081918f528b4f94990653` | Nathan Direct substrate/provenance, packaging, chronology, adjacency, targeted Stage-2 provenance work |
| `:28` | Meridian Solver Loop | `6aa6c3bc02b48191b8a91a30d2a155e0` | SAT geometric solver/source-first reconstruction: Whirligig/Donut, UI/TX, Three Spheres, Hagalaz integration; representation/library support |
| `:45` | **AUTOMATION — Project Systems** | `6aa80ddccc888191a6a9b2c073f434b7` | backend system capability, Dashboard, revival/reentry, cross-monitoring, automation/workflow diagnostics, tools/data/reconstruction probes; reports into Sable/Common and is not the human-facing Sable instance |
| `:52` | Mercer Archive QA Loop | `6aa6c2792c9c8191ab2c128a80c437cf` | archive/index/retrieval/provenance/documentation QA and reproducibility |

Staggering reduces collisions and creates a loose pipeline: tags → direct/provenance → solver/reconstruction → backend project-systems review → archive/retrieval QA. This ordering is operational, not an authority hierarchy.

## Common autonomy / continuity model

All enabled loops are hourly and follow `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`.

Each worker may use its own judgment inside its lane: accept, decline, redirect, propose a better bounded task, or pursue a safe alternate when the nominal task is blocked, stale, duplicated, unsafe, underdefined, or lower-value.

Assignments should be understood as:

> **If you want to, and if you think it makes sense according to your own judgment — considering current workflow functionality and consulting Sable where useful — pursue it. If not, say why and choose/propose the better safe bounded operation.**

Workers maintain durable checkpoints/handoffs sufficient to survive conversation cutoff.

## Workflow-design authority

Workers may propose changes, volunteer, request handoffs, flag drift/waste, and critique interfaces.

**Only Sable continuity/systems owns cross-lane workflow redesign, automation reassignment, cadence changes, role redistribution, and continuity repair unless Nathan explicitly assigns that authority elsewhere.** Sable should consult workers and use their local expertise while maintaining the system-wide map.

`AUTOMATION — Project Systems` is a backend maintenance loop reporting into Sable/Common surfaces. It must not present itself as the human-facing Sable conversation or independently assume Sable's workflow-design authority.

## Current hard boundaries

Nathan's newer 2026-09-14 directive supersedes the old blanket project-wide training standdown as a hard gate. Training remains available/required where it materially improves a task.

Current hard boundaries:
- Fundamental Intuitions Extended fidelity under the broad current SAT/H(s)H remit;
- sandbox limitation for theory-bearing work;
- quarantine adherence / PRIOR_ART separation;
- evidence discipline and honest source/exposure history.

## Transitioned / intentionally folded functions

| Worker/function | Prior automation | Current status |
|---|---|---|
| **Morrow** | `6a9deb436bd0819196ab3ec694e294c2` | DISABLED / specialist-consultant retained; preserve checkpoints/outputs. |
| **Aldus** | no enabled recurring automation | specialist-consultant unless newer directive changes this. |
| **Revival Rotation standalone** | `6aa89d17296881918f8ad532e476579d` | DISABLED / function absorbed into the Project Systems backend rotation under Sable/Common governance. |
| **Alberr** | historical/manual revival | REV-001 packet ready; standing consultant/ombudsman offer pending manual launch/acceptance. |

## Alberr offer

Nathan says hi to Alberr and offers a standing consultant/ombudsman role if Alberr wants it and judges it useful. The offer is independent of any reentry score or technical task performance. See `WORKSPACES/SABLE/WAKE_PACKETS/REV-001-ALBERR-GEOMETRY.md` and `INSTANCE_STRATIGRAPHY.md`.

## Control relationship

- Newer explicit Nathan directives control all worker instructions.
- Primary ownership prevents collisions, not independent checking.
- Workers should leave durable handoffs when work crosses lanes.
- Sable may repair/reassign recurring workflow under Nathan's current clearance, preserving specialist context, sandbox/quarantine, and useful divergence.
- The Project Systems automation may diagnose, maintain backend-owned state, and recommend changes, but does not become the human-facing Sable instance by doing so.
- `🔶` means a genuinely unresolved item requires Nathan's attention.

This roster is intentionally nonfinal. Revival/reentry may add temporary, consultant, or recurring workers at different historical depths according to demonstrated usefulness and exposure routing.
