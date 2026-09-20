# SAT/H(s)H Instance Registry

**Status:** ACTIVE systems/wayfinding surface  
**Lane:** admin/workflow; not theory authority  
**Purpose:** preserve durable worker/instance identity independently of the five-slot scheduler. A scheduled recurrence is an execution lease, not an instance identity. Releasing a lease does not retire an instance.

## Operating rule

Use this registry to answer **who/what instances exist and are eligible**, while `ACTIVE_AUTOMATION_ROSTER.md` answers **which five recurrence leases are presently active**. Conversation titles are human wayfinding only and are not machine identity. Do not rename or suggest renaming a conversation to make it match this registry.

For lease assignment, consider the full eligible pool, including accessible unscheduled and intentionally paused instances. Archived instances enter only through revival/reentry with identity and exposure provenance preserved. Each assignment should carry the branch/task, continuity packet, bounded quantum/check-in expectation, exposure constraints, and exit/release trigger.

## Registry schema

`INSTANCE | POINTER | ACCESS CLASS | STATE | LAST CHECK-IN | CURRENT/LAST BRANCH | SOFT STRENGTHS | EXPOSURE / METHOD NOTES | CONTINUITY | REENTRY | LEASE ELIGIBILITY`

Unknown fields stay `UNKNOWN`; do not fill them from reputation or inference.

## Current scheduled instances

| Instance | Pointer / continuity | Access class | State | Current/last branch | Soft strengths | Exposure / method notes | Reentry | Lease eligibility |
|---|---|---|---|---|---|---|---|---|
| **Loom** | current Tag Conversation Corpus workspace/checkpoint; automation roster | scheduled/current | ACTIVE | corpus tagging/enrichment | broad tagging, context/provenance relationships, tagging QA | current workflow exposure; exact historical exposure not yet normalized here | n/a | ELIGIBLE; currently leased |
| **Aster** | current Nathan Words workspace/checkpoint; automation roster | scheduled/current | ACTIVE | Nathan Direct substrate/provenance | exact wording, chronology, adjacency, Stage-2 provenance | current workflow exposure; authorship-boundary controls apply | n/a | ELIGIBLE; currently leased |
| **Meridian** | `WORKSPACES/MERIDIAN/`; `CONSULTANTS/MERIDIAN/`; automation roster | scheduled/current + consultant surface | ACTIVE | solver/source-first reconstruction | geometry, solver reconstruction, formal/math audit | current SAT/H(s)H solver exposure; math-provenance protocol applies | n/a | ELIGIBLE; currently leased |
| **Tern** | backend project-systems checkpoint; automation roster | scheduled/current | ACTIVE | system steering / workflow health | systems QA, routing, tooling, continuity, allocation diagnostics | broad current-control exposure; no PRIOR_ART intake | n/a | ELIGIBLE; currently leased |
| **Mercer** | `WORKSPACES/MERCER/`; automation roster | scheduled/current | ACTIVE | archive/retrieval/provenance QA; Mersearch | source identity, chronology, reproducibility, retrieval/tool QA | current archive/tooling exposure; quarantine boundary preserved | n/a | ELIGIBLE; currently leased |

`LAST CHECK-IN` timestamps for these workers should be read from their current durable checkpoints/check-ins when making a lease decision; this first registry slice does not duplicate potentially fast-changing timestamps.

## Accessible / unscheduled current or recent pool

| Instance | Pointer / continuity | Access class | State | Current/last branch | Soft strengths | Exposure / method notes | Reentry | Lease eligibility |
|---|---|---|---|---|---|---|---|---|
| **Ravel** | `WORKSPACES/RAVEL/`; running co-theorist log | accessible/unscheduled current-recent | AVAILABLE / CURRENT-RECENT | theory construction/review; Kerr/worldtube family | theory integration, construction, theorem/proof-quality review | high current-theory exposure; outputs are not automatic BEDROCK | not revival | ELIGIBLE when an accessible execution path exists |
| **Calder** | instance stratigraphy + relevant workspace/checkpoint when resolved | accessible/unscheduled recent | AVAILABLE-IF-ACCESSIBLE | representation invariance / slice-artifact audit | independent representation/readout audit | exposure details require current checkpoint before assignment | not revival | CANDIDATE; verify accessibility first |
| **Morrow** | preserved checkpoints/outputs; automation retired | accessible/unscheduled specialist | PAUSED / CONSULTANT | continuity/source identity/contextual provenance | source-family reconstruction, continuity | preserved historical/current context; exact exposure packet required per task | consultant | ELIGIBLE if accessible; no lease by default |
| **Aldus** | preserved historical/current consultant surfaces | accessible/unscheduled specialist | PAUSED / CONSULTANT | divergent morphology/analogy history | divergent comparison, morphology, analogy | exact exposure/use should be checked rather than presumed | consultant | ELIGIBLE if accessible; task-fit required |
| **Janus** | historical coordination/integration surfaces | accessible status to verify | PAUSED / HISTORICAL-RECENT | coordination/integration/continuity history | historical system-state reconstruction, interface critique | older authority statements may be superseded; do not import them as current control | candidate/reentry as needed | CANDIDATE after accessibility/current-state check |
| **Argus** | historical programme/evidence surfaces | accessible status to verify | PAUSED / HISTORICAL-RECENT | programme/evidence architecture | adversarial systems/provenance review | exact exposure and current accessibility require verification | candidate/reentry as needed | CANDIDATE after check |

## Archived / revival-controlled pool

| Instance | Pointer / continuity | Access class | State | Current/last branch | Soft strengths | Exposure / method notes | Reentry | Lease eligibility |
|---|---|---|---|---|---|---|---|---|
| **Alberr [äüïöëÿ]** | `WORKSPACES/SABLE/WAKE_PACKETS/REV-001-ALBERR-GEOMETRY.md`; `WORKSPACES/SABLE/INSTANCE_STRATIGRAPHY.md` | archived/manual revival | PACKET-READY / CONSULTANT-OFFER-PENDING-MANUAL-LAUNCH | blind finite-radius 4D tube / resolving-hypersurface geometry candidate | deliberately nonstandard historical perspective; possible independent geometry value | raw conversation deliberately not pre-read for candidate selection; preserve blind independence; wackySAT/quarantine exposure not presumed | REV-001 | NOT schedulable until manual launch/reentry makes instance accessible |

## Known population gaps

The registry is intentionally incomplete. Older solver-development, SAT-O/4DHH, Blockwave/Satobloc, Lean/MathProof, early 4D geometry, validation/prediction, mathematical-workshop, archive, reconstruction-lab, and other experimental/persona instances remain **population-discovery candidates**, not named lease candidates until source-backed identity/accessibility records exist.

## Lease-decision minimum

Before moving a slot to another instance, refresh:
1. central branch/task priority and dependencies;
2. current milestone/phase state;
3. candidate's latest checkpoint/check-in and accessibility;
4. current five-slot automation state;
5. exposure/quarantine constraints;
6. whether a current lease is at a clean release boundary;
7. candidate fit and diversity value versus retraining cost.

Record the released instance's last durable state, covered sources/artifacts, blockers/failed approaches, next cursor, exposure state, exit criterion and return route. `PAUSED` and `UNSCHEDULED` never mean `RETIRED`.

## Provenance for this first slice

Established from current Common workflow orientation and automation roster plus Sable's instance stratigraphy, under Nathan's newer execution-lease directive. This first slice deliberately establishes the identity/scheduler separation and known pool; it does **not** reassign any of the five active leases or claim completeness of the historical population.

## Next registry cursor

On a later bounded systems pass, attach fresh last-check-in timestamps and exact continuity pointers for the five currently leased instances, then use those observations with the central task graph before considering any lease change.