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

---

## 2026-11-03 — geometry-first five-object requirement for Factory Floor and geometry-bearing papers

**Status:** NEW — DIRECT NATHAN INSTRUCTION / CAPTURED FOR ADOPTION AND IMPLEMENTATION REVIEW / NOT YET INCORPORATED INTO FACTORY FLOOR CONTROL

**Trigger / direct source (2026-11-03):** Nathan states that nothing should enter Factory Floor without a precise geometric plot of the system under study, fidelity-checked by hostile review and displayed with the file. Geometry is the theoretical object; mathematics is its precise description, not the object itself. Nathan distinguishes five linked objects:

1. **Primary — observation:** the observed system and its actual observational/experimental record.
2. **Secondary — physical working orrery / hands-on demonstration:** a physical demonstrator that instantiates the relevant geometry or relationships.
3. **Tertiary — precision dynamic geometry:** an executable software model whose geometry evolves under explicit rules.
4. **Quaternary — precision static diagram:** a static geometric specification of the object/configuration, with dimensions, labels, coordinate conventions and relationships.
5. **Pentary — mathematical description:** equations, definitions, proofs and quantitative rules describing the geometry.

**Core rule:** the theoretical object is the geometry. Equations are descriptions of that object, not substitutes for it. A geometry-bearing claim, equation, derivation or paper must show what geometric object it concerns and how the displayed representations relate. Nothing enters Factory Floor without a precise geometric plot, hostile fidelity review, and the plot displayed with the corresponding artifact.

**Required representation links / no implied equivalence:**
- Each object must identify its source, scope, status and provenance.
- The static diagram must faithfully depict the specified system, not merely decorate the equations.
- The dynamic model must reproduce the diagram's geometry under declared initial/boundary conditions and transformations.
- The physical demonstrator must instantiate the intended geometry within declared tolerances and limitations; it is not presumed to reproduce inaccessible or unmeasured properties.
- Observation must be tied to the actual measured/observed system and acquisition/processing chain; the demonstrator or simulation is not substituted for observation.
- The mathematical description must be explicitly mapped to geometric features, coordinates, invariants and transformations. Formal proof verifies only the encoded statements, not the fidelity of the maps or physical truth.
- Maps between levels must be explicit, typed and condition-bearing. No automatic projection, composition, scale equivalence or physical identification is inferred from analogy.

**Minimum per-item geometric packet proposed for assessment:** (a) exact source/system and provenance; (b) object/geometry definition with dimensionality, coordinates, metric/ambient structure where applicable, boundaries and orientation; (c) precise Class-P geometric plot with dimensions/legend and source-linked parameter manifest; (d) hostile review record listing fidelity checks, discrepancies and disposition; (e) tertiary dynamic model and validation against the static plot when dynamics are claimed; (f) secondary physical orrery/demonstrator record when such a demonstrator is claimed or feasible; (g) primary observational record, units, uncertainties and processing chain for physical claims; (h) equations/Lean status, assumptions, exact toolchain and limits; (i) explicit maps and commutative checks among representations; (j) visibility/licensing and Factory stage.

**Visual classification:** the required system-under-study geometry is **Class P** (precision/script-drawn or otherwise metrically faithful). Class H may be a controlled derivative downstream of exact work. Class I is illustrative only and cannot satisfy the geometry evidence gate. Aesthetic rendering may accompany, never replace, the precise plot.

**Relationship to current controls:** this item supplements but does not silently amend BEDROCK, the 2026-10-26 Steering Charter, Universal Shape-to-Lean, the Three Paper Campaign, Factory Floor's FF-203 geometry/visual workshop, or its existing staged admission and promotion gates. BEDROCK's real-system/measured-data rule and specific prior-permission rule for data-free calculations remain binding. Factory mathematical clearance remains eligibility for candidacy consideration only; it is not an H(s)H candidate or physical validation. P1/P2/P3 dates, ownership and distinct acceptance gates remain unchanged.

**Implementation status:** CAPTURED ONLY. The authoritative Factory Floor controls are in Satobloc/FACTORY_FLOOR, not this HsH feeder. Its current README/FLOORROOM_TODO describe FF-203 as an incomplete pipeline (Class-P templates, parameter manifest, equation/source pointer, thumbnail, visual QA, P/H/I classifier) and do not yet contain this five-object acceptance contract. No Factory Floor file, issue, Floor ID, stage assignment or acceptance state has been changed. No geometry has been submitted or admitted by this ledger entry.

**Assessment / smallest next step:** Tern (Comptroller/control-plane) and the Factory Floor owner should assess this against FF-203, FF-002, the existing issue/intake structure and Nathan's authority. Produce a proposed, explicit five-object acceptance checklist and identify which layers are mandatory for every geometry-bearing artifact versus conditionally not applicable (for example, an orrery may be infeasible for an astronomical system; observation is still primary). Preserve the non-negotiable geometry plot + hostile fidelity review + display-with-file requirement. Return to Nathan only for a genuine ambiguity in the object hierarchy or an irreversible Factory control change.

**Return trigger:** first Factory Floor control review; first geometry-bearing paper/Factory candidate tested against the five-object packet; or a hostile review showing that the plot, model, demonstrator or mathematical description does not represent the same object.


## 2026-11-03 — SAT/H(s)H incorporation tiers and mandatory leg-stretching / wide-reading practice

**Status:** DIRECT NATHAN METHOD PROPOSAL / CAPTURED FOR REVIEW. The corresponding operational directives have now been added to the live Steering Charter, geometry-first control, and Worker Freshness guidance; actual worker adoption remains to be evidenced by receipts.

**Trigger / direct source (2026-11-03):** Nathan's note titled **“SAT/H(s)H Incorporation Tiers”** and accompanying instruction to make physical leg-stretching breaks, free reading of explicitly non-SAT/H(s)H archive material, and broad/deep theory-overview and context/revival reading a regular part of working guidelines.

**Four cumulative incorporation tiers:**

1. **Tier 1 — geometry admissibility:** a proposal must be suggested by, preferably required by, or be one of a small number of possibilities tightly constrained by the geometry. If not, it is not a candidate. Geometry is a visual mathematical system with built-in constraints that equations alone may fail to encode.
2. **Tier 2 — tentative explanatory hypothesis:** after Tier 1, a proposal may become a tentative SAT or H(s)H hypothesis if it gives a useful explanation of a phenomenon through multiple intuitive interaction surfaces. Those surfaces must be explicit, not merely analogical.
3. **Tier 3 — official working-hypothesis eligibility:** it remains tentative indefinitely unless its presence, without being separately asked or tuned to do so, unexpectedly explains otherwise unrelated phenomena, preferably across multiple distinct sectors. This must be emergent explanatory reach from the same construction, not post hoc analogy or separate fitting.
4. **Tier 4 — model membership:** removing or changing the ingredient must break or predictably distort other model numbers/outputs by a calculable amount. This is a counterfactual dependency/indispensability test; model membership still does not, by itself, establish physical truth.

**Status discipline:** do not conflate these tiers with geometric plot clearance, mathematical/formal proof, empirical validation, or Factory Floor admission. Tier 3 makes an item eligible for official working-hypothesis status subject to existing BEDROCK controls; Tier 4 establishes structural membership within the model, not physical verification. Record the intervention, held-fixed conditions, predicted output changes, compensating degrees of freedom and actual comparison. No invented parameters or data-free calculations; BEDROCK remains controlling.

**BEC example / status:** Nathan describes the “BEC ocean” as a working hypothesis and the most obvious H(s)H successor to the SAT filament block universe. This records its proposed place as a hypothesis to assess, not a Tier 3/4 finding, validated BEC derivation, or established physical claim. Recover the originating user statements and geometric constraints before assessing it.

**Interpretive-mode clarification:** the SAT 4D block is methodological/formal, not a declaration that the universe is metaphysically static. The June 2025 SAT Big Paper / O0-A interpretive modes must be recovered from the primary archive and read in context before the block treatment is characterized. Preserve the modes as distinct methodological frames; do not collapse Mode 1 into an ontological conclusion. The new directive links the cited source locators and the earlier “Central Dogma” passage.

**Leg-stretching and eclectic reading:** At safe checkpoints, workers should physically leave the screen, stand, stretch, walk or otherwise change posture before returning; a change of tabs or merely announcing a break does not count. Preserve a minimal return cursor. Regularly take substantive “leg-stretching” reading breaks across HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES, including explicitly non-SAT/H(s)H conversations and source material, old false starts/dead ends, tool histories, broad/deep theory surveys and contextual/revival reading. Outside literature may broaden or challenge understanding, while internal construction and provenance remain first in the source sequence. Record source, actual extent read, useful surprise, and resume cursor. The existing target of at least one meaningful lateral-reading / side-investigation / creative-recovery quantum per five actual worker activations remains a measurable target, not a quota to fake.

**Implementation/readback context (2026-11-03):**
- [Steering Charter](STEERING_CHARTER_2026-10-26.md) contains the four tiers, the methodological/non-metaphysical block qualification, BEC tentative status and the archive-wide lateral-reading requirement.
- [Geometry-first admission gate](FACTORY_FLOOR_GEOMETRY_FIRST_GATE_2026-11-03.md) separately requires a precise quaternary plot, hostile fidelity review and display with the file, and explicitly distinguishes geometry admission from the four incorporation tiers.
- [Worker Freshness / Break Cadence](WORKER_FRESHNESS_BREAK_CADENCE.md) states the physical movement and wide-reading practice and preserves the one-per-five-actual-activations target.
- [New Instance Start Here](NEW_INSTANCE_START_HERE.md) points workers to the current controls; exact worker compliance is not established merely by publishing them.
- Historical source locator for O0-A: `SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/✅SAT BIG PAPER.txt`, Git blob `69b0085c86f6c4876aacc0556243dd2fccdc0aef`, pages 11–12 / extracted lines 361–445. Earlier “Central Dogma”: HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/NESTED HOLONOMIES.txt`, Git blob `0a8d52da06d1a787252b9a120c4770aa29095879`, around extracted offset 248,700–250,000. The original primary files should be directly re-read before quoting or drawing detailed conclusions.

**Return trigger:** review the first several actual worker receipts for (a) meaningful non-SAT archive/literature reading, including source extent and surprise; (b) genuine physical breaks and return; (c) Tier 1–4 separation in candidate assessments; and (d) any use of BEC/Mode 1 that drifts into unsupported physical or metaphysical assertion. Revisit tier operationalization only when a real case exposes ambiguity.

---

