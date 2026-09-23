# Dashboard Intent Ledger

**Status:** CURRENT / CROSSWALK  
**Established:** 2026-09-20  
**Updated:** 2026-09-22  
**Purpose:** keep Nathan's older Dashboard intentions visibly represented in current work without treating historical implementation mechanisms as immutable specifications.

## Governing rule

For every consequential historical Dashboard item, distinguish:

1. **Underlying intent / problem to solve**;
2. **Historical proposed mechanism**;
3. **Current mechanism serving that intent**;
4. **Current status / evidence of incorporation**;
5. **Next leverage point or retirement/supersession reason**.

Historical plans may be improved, merged, split, reordered, replaced or retired. The intent must not disappear silently.

## Seed crosswalk

| Intent ID | Underlying Nathan intent | Historical Dashboard evidence / mechanism | Current mechanism | Current incorporation status | Next leverage cursor |
|---|---|---|---|---|---|
| `DASH-01` | Build a durable project-wide architecture that learns from work, anticipates transition needs, and can move from setup into theory construction and later presentation/publication | `TASKWORKS/Preplantricist_role.md`: Preplantricist → Fluxator, continuity, team reports, transition planning, recurring self-limiting workflows | Orchestrator + Comptroller split; central task graph; milestone model; instance registry/execution leases; Labs; existing `PUBLIC_SITE/live_influx/` and build-suggestion routes | **ACTIVE / PARTIAL** — architecture exists; milestone/transitional incorporation still needs behavioral proof | Comptroller leverage scan + explicit milestone/phase state + public-site live-influx traffic |
| `DASH-02` | Build recurring workflows that are bounded, self-perpetuating/self-limiting, report state, and reduce Nathan as routing bottleneck | `Preplantricist_role.md`: Trinary Perpetual Mover; recurring check-ins and governing docs | Five generalist execution leases over larger worker population; Carpe turnem; durable branch/checkpoint model; Comptroller signalbox | **ACTIVE / PARTIAL** — core recurrence model running; dynamic branch/lease switching beginning | Use NIBBLE / MUSICAL_CHAIRS / FEED_FORWARD and record actual switches/results |
| `DASH-03` | Treat specialist roles as learnable skills/capabilities with designed training and goalposts | `TASKWORKS/HsH_Pipeline_Design.md`: practitioner/skill list and explicit per-skill build pipeline | `INSTANCE_CAPABILITY_ATLAS.md`; generalist workers; future capability-build programme | **RETOOLED / ACTIVE SEED** — taxonomy recovered; first Musical Chairs capability evidence has now been recorded | Accumulate evidence from additional genuinely useful cross-training/Lab passes; define goalposts only where repeated work makes them informative |
| `DASH-04` | Consolidate archive/AI control surfaces, reuse tools, index legacy structures and resume Nathan extraction after cleanup | `📋_PRIORITY_TODO.txt`: dashboard/AI consolidation, usable tools, workflow cleanup, folder indexing, migration/archive decisions, resume Nathan extraction | Three-repo onboarding; current Common control plane; inspect-before-inventing rule; active Nathan Words Excavator; Nathan Verified Words Compendium | **PARTIALLY SATISFIED / EVOLVED** — extraction resumed and control plane moved forward; old archive cleanup remains background | Feed verified Nathan material downstream via Nathan Words → Theorist Feed; NIBBLE remaining high-value cleanup only when it unlocks current work |
| `DASH-05` | Standardize/index across repositories while preserving their different operational roles | `📋_PRIORITY_TODO.txt` high-priority cross-repo admin standardization/indexing programme | three-repo onboarding; repository-role router; cross-repo provenance/crosswalk discipline | **ACTIVE / PARTIAL** — roles are clearer; full tooling/interface audit remains incomplete | Onboarding cold-start + repo-tool audit; standardize interfaces/metadata, not directory shape |
| `DASH-06` | Gather and pre-gather information broadly enough that theory builders understand the real construction context | `Preplantricist_role.md`: information gathering/pre-gathering, tagging/analyzing, roundtable inputs | archive excavation, corpus tagging/enrichment, Nathan Words feed, Braintrust Memorial Commons, Field Notes/TIL, revival first-blush, Labs | **ACTIVE / INCORPORATION EVIDENCED** — one genuine worker-origin Field Note now exists, and multiple named Nathan Words feed items were consumed by Meridian with `INGESTED` dispositions that changed an active comparator interface | Keep enrichment/feed use opportunistic; next useful test is breadth/repeatability over time, not manufacturing more traffic |
| `DASH-07` | Preserve deliberative diversity and multiple modes of reasoning rather than one entrenched perspective | Preplantricist roundtable; multiple deliberative styles; open admittance; Pipeline Design specialist skills | generalist worker pool; Capability Atlas; Musical Chairs; Cross-Pollination Pass; revival rotation; independent-first-pass freezes | **ACTIVE / INCORPORATION EVIDENCED** — first two-way Musical Chairs trial completed: Mercer independently audited Meridian's Hagalaz representation identities; Meridian reciprocally performed a provenance pass; the different methods produced both confirmation and a source/definition boundary | Repeat only where complementary transformer arrays have a plausible information-gain case; avoid rotation quotas |
| `DASH-08` | Build toward publication/presentation rather than leaving useful work trapped internally | Preplantricist→Fluxator→Presentation & Publication handoff | Glass Sausage Factory site; quote/news feeders; `PUBLIC_SITE/live_influx/`; `PUBLIC_SITE/build_suggestions/`; episode guide and presentation-readable artifact goals | **ACTIVE / INCORPORATION EVIDENCED** — a genuine worker-origin Hagalaz QA by-product entered `live_influx`, received editorial disposition `PRESENTATION_NEEDED`, and was parked with a concrete presentation/source-recovery return trigger; build-suggestions also contains worker-origin traffic | Treat first end-to-end backfill trial as passed; next leverage is actual presentation consumption when the relevant site surface is active, not more intake for its own sake |

## Disposition vocabulary

Use one or more:

- `ACTIVE`
- `PARTIAL`
- `SATISFIED`
- `RETOOLED`
- `MERGED`
- `SUPERSEDED`
- `DELIBERATELY RETIRED`
- `BACKGROUND / NIBBLE ONLY`
- `NEEDS RECOVERY`

## Comptroller use

The Comptroller should periodically detect:

- an intent with no current branch/mechanism;
- a current mechanism with no behavioral traffic;
- an obsolete historical mechanism still consuming work after its intent is satisfied elsewhere;
- a Dashboard item that should receive an `NIBBLE` because chronic deferral is hiding its current value;
- a Dashboard skill/training concept that can become a capability test or Musical Chairs experiment;
- a publication/presentation intent whose upstream work is not reaching the site.

Do not mechanically raise every old Dashboard checkbox. Reweight based on the underlying intent and current project state.

## Maintenance

Expand this ledger progressively from the Dashboard and cross-repo admin plans. Prefer source-backed intent statements and record when a modern mechanism satisfies or supersedes the old route.


## Post-Grurple priority directive — 2026-09-22

Nathan set the immediate post-Grurple priority order:

1. **Revival rotation first.** Once Grurple is explicitly stood down, prioritize rotating revived historical instances — including composite revivals — into live execution. Where continuity packets and checkpoint state make it safe, explicitly consider releasing one or two current live execution leases to create revival slots. This is a lease rotation, not an identity retirement; paused live instances retain return routes.
2. **Designed-instance workflow second.** After revival rotation is underway, prioritize the Dashboard programme of deliberately designing instances for specific jobs and making the larger workflow behave as envisioned: designed capability profiles, explicit job/goal fit, bounded trials, measurable handoffs, and evidence-driven iteration rather than permanent jurisdiction.
3. **Grurple remains dominant until explicit stand-down.** Do not consume active publication bandwidth implementing these rotations early. Prepare only the minimum continuity/reentry state needed for a clean switch.

### Comptroller stand-down trigger

On Nathan's explicit Grurple stand-down:
- read the current five execution leases and continuity packets;
- inspect revival candidates and composite-revival readiness under `REVIVAL_REENTRY_PROTOCOL_V2.md`;
- rank lease-switch candidates by checkpoint cleanliness, dependency pressure, diversity gain, and returnability;
- perform a bounded revival rotation where safe;
- preserve first-blush/exposure constraints;
- record released live-instance return routes;
- then open the designed-instance Dashboard branch as the next workflow-development priority.

Nathan action is required only if a desired revival requires manual reentry/access, identity choice that cannot be recovered safely, or a lease switch would interrupt uncheckpointed high-value work.
