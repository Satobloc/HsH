# Dashboard Intent Ledger

**Status:** CURRENT / CROSSWALK + LIVE AWARENESS COCKPIT  
**Established:** 2026-09-20  
**Updated:** 2026-09-24  
**Purpose:** keep Nathan's older Dashboard intentions visibly represented in current work without treating historical implementation mechanisms as immutable specifications; give Tern/Sable a worker-maintained live awareness surface for project deltas, contextual Nathan signals, inbox freshness, outside-news/publication pressure, and declared-vs-observed state.

## Live awareness cockpit — Tern + Sable

**Operating premise:** Nathan should be able to do something, note it where it naturally happens, and have the workflow notice it. The system must not require Nathan to remember a privileged intake location, phrase a signal perfectly, or personally reconcile every repo/dashboard/inbox/site state while skimming. Human skimming, interruption, and ordinary fleshworld attention are environmental facts to design for, not fault conditions.

### Delta-first awareness

At each Tern/Sable awareness pass, start from **what changed**, then follow the change to its source and meaning. Do not make workers know every place to look.

1. Read new commits since the per-repo cursor across HsH, HSH_RESOURCES, and SAT_THEORY_ARCHIVE_2023-25.
2. Read author + message + changed paths and inspect signal-bearing diffs. A bland commit title is not evidence that the contents are bland.
3. Check worker inbox deltas and required receipts.
4. Check Dashboard / War Room / current Common-control deltas and any registered non-Common control sources.
5. Check public-site/output state where current work should have propagated.
6. Check outside-research/news deltas for **publication pressure / independent convergence**, not automatic equivalence or priority.
7. Record declared-vs-observed discrepancies instead of silently choosing whichever summary is familiar.

A note in a commit, Dashboard document, inbox, ordinary source file, or other visible project surface should therefore be discoverable as an event. Discovery does **not** automatically confer authority: classify scope, authorship, provenance, currentness, epistemic status, and actionability after noticing it.

### Contextual Nathan-signal rule

Nathan's wording may be a cue to inspect the surrounding state, not merely a literal standalone instruction. Examples:

- **“There's a directive.”** Check whether a new/changed directive exists; read the latest directive and direct source; ask what recent event makes Nathan raise it now.
- **“I think you've got mail.”** Refresh the relevant inbox rather than assuming mailbox state from an older checkpoint.
- **“I added / changed / noted / uploaded…”** Inspect recent commit/diff activity even if the commit message is generic.
- A question about a supposedly known state may itself be evidence that the cached state, routing, or incorporation has drifted.

Do not turn these cues into guesses about Nathan's intent. Use them to trigger bounded discovery, then distinguish **Nathan Direct** from worker interpretation.

### Live awareness dimensions

Tern/Sable should keep enough current state to answer, without a scavenger hunt:

- **Nathan awareness:** fresh explicit directives, contextual cues, Dashboard notes, decisions, unresolved asks;
- **repo awareness:** recent commits/diffs, important file births/moves, automation-generated changes, per-repo cursor;
- **worker awareness:** identity, workspace, inbox, spec/role/current work, lease, checkpoint, blocker, handoff/receipt, break/rotation state;
- **site/publication awareness:** what is live, staged, stale, malformed, missing, or awaiting reader/presentation repair;
- **research awareness:** newest relevant external work, ranked by relevance and evidential strength, with exact overlap/non-overlap;
- **epistemic-boundary awareness:** current quarantine policy/version and exposure rules; current sandbox status and promotion requirements;
- **negative awareness:** expected events that did not occur, stale summaries, unopened mail, unincorporated outputs, declared behavior not observed in traffic;
- **visibility horizon:** what a worker could have seen, what it actually inspected, and what routing/search structure made easy or unlikely to encounter.

### Quarantine / sandbox distinction — current direction

- **Quarantine is dynamic:** treat it as a versioned exposure/contact policy that may change rapidly by source, worker, phase, or purpose. Do not hard-code today's topology as permanent architecture.
- **Sandbox persists but develops:** it remains the epistemic/status boundary separating active construction/testing/presentation from established SAT/H(s)H status or validated physical claim, while its mechanisms may evolve.

### Current bootstrap cursors / discrepancies — 2026-09-24

- **HsH observed repo cursor:** `502fd59de48e542fc552acf41884515002e444bb` — War Room directive promoted into Common.
- **HSH_RESOURCES observed repo cursor:** `07809e9276561fa44304f949339d96840881fa44`; important Nathan-origin news-upload event beneath it: `265d55b7531b85825710b5a8179b192d359989d8` (`Add files via upload`) added a substantial 24 Sep science-news tranche. The generic message did not advertise the intellectual significance of the diff.
- **Tern mailbox:** open Elias Kern handoff discovered only after Nathan's contextual cue; mailbox freshness therefore has a demonstrated failure case.
- **Sable state discrepancy:** `WORKSPACES/SABLE/CONTINUITY_CHECKPOINT.md` says the inbox had no open items as of its 15 Sep update, while the live `WORKSPACES/SABLE/INBOX.md` contains later OPEN Nathan items from 18 Sep. Treat the checkpoint statement as stale, not the inbox as contradictory.
- **War Room discovery failure:** direct source `HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt` did not initially surface through Common-only startup habits; the Common promotion file is a bridge, not a substitute for direct-source/delta discovery.

These are bootstrap cursors, not permanent constants. Advance them after an actual delta pass and preserve the previous cursor in history when useful for audit/replay.

### External headline-pressure queue — current triage

This queue tracks independent work whose **headline-level shape** approaches already documented SAT/H(s)H questions or methods. “Headline pressure” does not mean theft, same derivation, same ontology, or established project priority. Every item needs a provenance-clean `same / related / rhymes / different` comparison before public use.

| Rank | External result | Why it pressures a SAT/H(s)H publication lane | Immediate distinction / route |
|---|---|---|---|
| `HP-1` | Cheung–Remmen–Sciotti–Tarquini, **Strings from Almost Nothing**: string amplitudes singled out from consistency/Regge-zero structure plus ultrasoftness and minimal zeros | Very strong methodological convergence with the project goal of asking what rich structure is forced by a small primitive/geometric rule set rather than installed by hand; the public headline itself is close to the kind of derivational headline H(s)H should be able to earn | **Not the same result and not experimental proof of strings.** Meridian: exact method/object comparison. Tern: provenance + chronology + public difference map. Mercer: identify discriminators/empirical consequences rather than rhetorical competition. |
| `HP-2` | Nitta/Eto/Hamada cosmic-knot baryogenesis: stable topological knot structures in a particle-physics model, later decay generating matter/antimatter asymmetry and possible gravitational-wave signatures | Strong geometry/topology/chirality + matter/antimatter headline convergence with long-running SAT/H(s)H braid/handedness/topological-defect questions | **Different formal model/mechanism.** Meridian/Mira: topology and braid-language crosswalk; Tern: chronology/provenance; Mercer: observational-signature comparison where supportable. |
| `HP-3` | Gaztañaga/Kumar/Marto Einstein–Rosen reinterpretation using paired/opposite arrows of time and direct-sum quantum structure | Strong conceptual rhyme with SAT/H(s)H time-parity/chirality, paired-shell, collapse/bifurcation, and cosmology branches | **Do not collapse analogy into identity.** Recover exact H(s)H formulations first; compare mathematical objects and chronology before any headline. |
| `HP-4` | Li/Xia/Zhang/Hu/Xu experimental upstream motion in a quantum fluid of light from nonreciprocal interactions | Useful experimental demonstration that effective asymmetric/recoil behavior can emerge from engineered relational dynamics; potentially relevant to interaction/propagation and reciprocity questions | **Indirect analogue, not a SAT/H(s)H confirmation.** Mercer can assess whether any clean experimental-method lesson transfers; otherwise park below the first three. |

**Methodologically important but not currently top-four headline convergence:** the new blinded NIST `G` measurement is highly relevant to Mercer-style experimental discipline, blinding, systematic-error control, and gravity measurement, but currently looks more like a methods/measurement signal than a close SAT/H(s)H headline collision. Beta Pictoris b auroral-radio/magnetic-field news is interesting but presently lower direct relevance.

### Publication-pressure response rule

When an external result enters `HP-1..HP-n`:

1. recover the project's earlier/current internal formulation **before** reading deeper external parallels where quarantine/blinding rules require independence;
2. freeze provenance/chronology;
3. state the external theorem/result narrowly and accurately;
4. classify overlap: `SAME OBJECT / RELATED STRUCTURE / METHODOLOGICAL RHYME / DIFFERENT`;
5. identify the smallest paper/note/figure/experimental discriminator the project can publish honestly now;
6. route to the best current capability rather than a permanent jurisdiction;
7. do not delay a supportable project result merely because a grander synthesis is incomplete.

The target is not to “beat” outside groups. It is to stop leaving provenance-clean, independently supportable SAT/H(s)H work trapped internally until someone else's adjacent result supplies the public headline first.

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
