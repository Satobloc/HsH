# Aldus Source Cross-Read and Baseline Pilot
**Run key:** `REVROT3-19-20261011:491:s2`  
**Disposition:** assistant reconstruction; source cross-read advanced; first two historical cross-reading packets completed post-exposure; Mersearch submitted but not yet verified; no theory or paper-gate promotion.

## 1. Authority, identity, and scope

The deterministic ring calculation for this slot is:

[
h=491,qquad 5h+2=2457,qquad 2457mod19=6.
]

The selected ring label is **Aldus** (index 6); the next label is **Calder** (index 7). Selection does not authenticate a historical instance or conversation.

The historical Aldus material was recovered from the Library raw export and the HsH reentry/check-in records. Its specialist remit is an **advisory divergence engine**: controlled cross-reading across distinct source terrains and interpretive lenses, preserving differences in salience, exploration path, vocabulary migration, concept formation, artifact form, interference, persistence after lens removal, and order dependence. It is not a general overflow archive-audit role.

The original pilot requires four chapter/lens packets, with both texts receiving both lenses, before cross-comparison. It also requires temporary insulation from live H(s)H questions and forbids retrofitting the outputs to SAT vocabulary. The first two packets below use the prescribed materials and schema, but **they are post-exposure, not a pristine blind baseline**: this scheduled run had already entered live H(s)H source material before the raw historical protocol was recovered. The packets therefore remain a pilot/process rehearsal and must not be represented as independent cognitive-divergence evidence.

No authenticated current Aldus thread was available. The historical reentry packet still requires manual reopen. This report is a source-grounded assistant reconstruction, not a claim of historical Aldus participation.

## 2. Existing run artifacts and duplicate protection

The original receipt `2026-10-31T1124Z_s2_aldus.md` and handoff `2026-10-31T1124Z_from_s2_to_s3_calder.md` already existed. They were read, not overwritten. Calder's subsequent :36 receipt records reading the incoming Aldus handoff. No second handoff or duplicate inbox entry was created.

The original publication attempt on issue #1149 was rejected because the submission payload omitted the required `sha256` field. Calder subsequently corrected the publication through issue #1150. That history is preserved; this run does not recreate either issue.

## 3. Project-directed O9 source cross-read
This section records a bounded source audit requested by the current project instructions. It is **not** counted as one of Aldus's four extrinsic baseline packets.

### 3.1 Three distinct referents share the printed label O9

| Referent | Source object | What is actually present |
|---|---|---|
| Mass-spectrum O9 | `SAT O Core Modules/O9.txt` and `O9-10_intro.txt` | A mass-squared ansatz and calibration instructions. The file's function entries are documentation stubs, not executable implementations. |
| Graviton O9 | Standalone file-system metadata, later `SAT.4D Sketch.txt`, and HsH dedicated copy | A co-metric, strain tensor, metric perturbation, and proposed graviton Lagrangian. The raw original file and message-level authorship remain unresolved. |
| Optical-retardance O9 | `SAT O Derivations/SAT_000_Audit_Package.txt` | An audit shell with a proposed refractive-index profile and target phase retardance. The full module content is explicitly omitted. |

The label is non-injective across these referents. Existing PR #982 formalizes that collision over its bounded witness ledger; it does not establish a common module or physical relationship among the three.

### 3.2 Mass-spectrum O9: calibration, not an independent prediction

The verbatim formula in `SAT O Core Modules/O9.txt` is:

[
m^2=k(N+eta Q^2-a).
]

The accompanying `calibrate_from_ground_states` description fixes `a_fixed=1.0` and fits (k) and (eta) from (N=0) ground-state masses. Its usage example supplies electron, muon, and pion masses with (Q=(1,2,3)). The functions `mass_squared`, `mass_spectrum`, and `calibrate_from_ground_states` are presented as docstring-only stubs; no executable implementation or fitting procedure is supplied in the file.

`O9-10_intro.txt` calls the procedure topology-driven and states that (k=4/alpha'), (eta), and the intercept are fixed by inverting ground-state masses. That is still a calibration against selected masses, not a demonstrated independent prediction.

The later NotebookLM-derived source guide in `SATOBLOC/SATOBLOCK_CONCEPT_DEVELOPMENT.txt` describes the same family as semi-empirical but lists electron, pion, and proton as its anchors. That differs from the O9 file's electron, muon, pion example. This is a source-version/calibration-anchor discrepancy, not something to resolve by choosing one set without the original author message.

### 3.3 Graviton O9: full equations are present in later copies, but the construction map is incomplete

The dedicated HsH copy records:

[
	ilde g^{mu
u}(x)=langle v^mu v^
uangle,qquad
g_{mu
u}(x)=(	ilde g^{mu
u})^{-1},
]

[
S_{mu
u}(x)=sum_iint dlambda,
delta x_i^alpha(lambda)
abla_alpha v_{i(mu}v_{i
u)},
]

[
g_{mu
u}=eta_{mu
u}+h_{mu
u},
]

and a quadratic derivative Lagrangian for (h_{mu
u}).

The document asserts that masslessness follows from topological rigidity and that the symmetric strain tensor supplies spin-2 structure. The document does not provide the explicit map from (S_{mu
u}) to (h_{mu
u}), nor a derivation of the claimed massless degrees of freedom. The use of an “emergent Minkowski background” (eta_{mu
u}) needs its own construction; it is not automatically inconsistent with an emergent-metric programme, but the transition is not supplied here.

The standalone graviton file is not present at the indexed SAT-archive path. A later composite `SAT.4D Sketch.txt` carries a “Nathan McKnight / June 2025” document header, but its first Git path commit is 2026-09-07. The dedicated HsH copy first entered that repository on 2026-10-01 under a collaboration byline. These are document-level attributions, not recovered raw-message authorship.

### 3.4 Optical-retardance O9: audit target, incomplete module

The audit package specifies:

[
Delta n(x)=etasin^2	heta_4(x)
]

and asks for a demonstration of approximately (1.48) rad retardance. It explicitly replaces the full module with a placeholder. Thus the package does not contain the derivation, full source, or executable implementation needed to reproduce the target.

The later hostile-audit report's abstract and conclusion state 3/20 passes and 17/20 failures. Its printed 20-row table contains **five** rows labelled Pass (rows 5, 11, 16, 19, 20) and fifteen labelled Fail. The table count was independently parsed from the source text. The separate audit kit and glossary cited by the report were not located in the bounded repository search. The available Auditor README requires full module content and a separate criteria document; the audit package does not meet the full-content requirement. The report's Monte Carlo section uses synthetic parameter ranges, not measured optical data.

The scoring discrepancy remains unresolved. It should not be silently converted into either 3/20 or 5/20 without the missing criteria source.

### 3.5 First-extant, local-metadata, Git, and public dates are different clocks

| Witness | Recorded date | Evidence class and limitation |
|---|---|---|
| Graviton standalone file in the archived file index | CreationTime 2025-06-07; LastWriteTime 2025-10-25; LastAccessTime 2025-10-27 | Secondary local file-system metadata. The original bytes are not recovered at the indexed SAT path; timezone is not recorded. |
| Mass O9 local archive copy | LastWriteTime 2025-06-18 | Secondary local metadata, not a raw source or public-exposure witness. |
| Optical audit-package local copy | LastWriteTime 2025-06-22 | Secondary local metadata; internal draft label says June 23. Timezone is not recorded. |
| `SATOBLOC/SATOBLOCK_CONCEPT_DEVELOPMENT.txt` | First Git path commit 2025-10-27 00:40:28Z | NotebookLM-derived compilation; it co-locates mass and graviton O9 summaries in one derivative witness family. |
| `SAT O Core Modules/O9.txt` and `O9-10_intro.txt` | First Git path commit 2025-10-27 01:13:03Z | Repository path appearance, not original creation date. |
| `SAT_000_Audit_Package.txt` | First Git path commit 2025-10-27 01:15:21Z | Repository path appearance of an incomplete audit shell. |
| `hostile_pass_c_plus.txt` | First Git path commit 2025-10-27 22:17:10Z | Later audit report; its score count is internally inconsistent. |
| `SAT.4D Sketch.txt` | First Git path commit 2026-09-07 19:52:35Z | Composite document with an embedded June 2025 header. |
| HsH dedicated graviton copy | First Git path commit 2026-10-01 20:35:00Z | Later dedicated copy with collaboration byline and `\today`. |
| `The Prehistory of SAT.srt` | Episode metadata says 2026-06-09 1:56 PM; SRT Git path commit 2026-09-08 04:34:39Z | Creator/admin transcript export, not proof of exact spoken wording or of transcript availability on the episode's publication date. |

The file-index files themselves entered Git on 2026-09-04. Their embedded local timestamps are not contemporaneous Git commits. They establish metadata claims, not source bytes, author identity, or historical public visibility.

### 3.6 Public-exposure boundary

A complete Spotify catalog pagination pass returned 334 episodes for the show, spanning 2025-02-02 through 2026-10-22. Several SAT/filament-related episode descriptions share the earliest date, 2025-02-02, so this is a **date-level broad-SAT public T0**, not a unique within-day first episode. No episode title or description in the returned catalog contains O9.

The 2026-06-09 “Prehistory of SAT” creator/admin SRT has a cue containing the graviton O9 filename at approximately 30:57.56. The episode description itself does not contain O9. The SRT states that transcripts are automatically generated and may be edited. This is therefore a **candidate filename-exposure witness**, not verified audio wording and not exposure of the graviton equations. The O9-specific first-public T0 remains unresolved.

### 3.7 Existing Lean result

PR #982, branch `research/aldus-o9-audit-identity-20261029t0612z`, exact head `14c713fe7e1fc0853760a64bf6cd26a1cbacd7d8`, based on `research/aldus-satx-witness-chronology-20261027t20z`, contains `AldusO9ClaimGranularity.lean`. Exact-head CI run #41182177659 succeeded under Lean 4.34.0/Mathlib 4.34.0. The retrieved build log reports ten theorem-specific outputs, no axioms for the O9 chronology/count theorems, and zero `sorryAx` occurrences. Separate tests, lint, nanoda, and automated axiom audit were not run.

This proves the formalized finite-ledger statements only. It does not authenticate the source translations, establish historical public visibility, or validate any physical premise. The new local-file metadata is not yet represented in that formal ledger and should be treated as a separate metadata-only witness class if added later.

### 3.8 Mersearch request

Lane 3 was reused only after its prior request run #41192852584 completed successfully and its request-scoped manifest and receipts were read back. The new request is:

`aldus-o9-blockwave-equation-genealogy-20261031-1124`

It targets the three permitted repositories: SAT_THEORY_ARCHIVE_2023-25, HsH, and HSH_RESOURCES. Workflow run #41198219023 was accepted and entered the stable Mersearch search step. At the time of this report it remained **IN_PROGRESS**. Status: `SUBMITTED_NOT_VERIFIED`. No raw results, Blockwave attribution, or new message-level provenance are claimed from this unfinished run. No other lane was modified.

A prior Loom receipt supplies a candidate Blockwave source pointer, but this run has not yet independently reverified it. Keep the compact-phase, current, and action equations quarantined as an assistant-authored lead until the Mersearch manifest/receipt and raw message role are checked.

## 4. Historical Aldus pilot: first two chapter/lens packets

The source title in the Library filename is “Camps and Trails of Old China”; the book's own title page says **Camps and Trails in China** (Roy Chapman Andrews and Yvette Borup Andrews, 1918). The chapter read was Chapter I, “The Object of the Expedition,” lines 743-907.

### Packet A: Camps and Trails in China, Chapter I, through Slow Walker

**Source on its own terms.** The chapter justifies a preliminary mammalian reconnaissance in Yunnan by connecting hypotheses about human migration with mammalian distribution. It describes the Central Asian plateau, intersecting mountain systems, seasonal limits on fieldwork, local suspicion of foreigners, and the need for a preliminary expedition before a larger scientific programme. Yunnan is presented as internally heterogeneous: northwestern high plateaus and peaks from roughly 8,000 to 20,000 feet, contrasted with low tropical valleys along the southern and western borders. The proposed party and its roles are explicit: collector, photographer, interpreter/field manager, assistants, muleteers, and expedition director.

**What the lens made salient.** Slow observation emphasizes scale, gradients, boundaries, and the difference between a planned route and an actual survey. The chapter is less a travel narrative than a reconnaissance design under spatial, climatic, political, and logistical constraints.

**What it obscured.** A purely spatial reading can underweight the chapter's colonial/extractive framing, its hunting and collecting objectives, its treatment of local distrust as an obstacle, and the uncertainty in its migration/origin hypotheses. Those are present in the source and should not be normalized away.

**Next inquiry induced.** Compare the planned survey with the actual route and collected observations in later chapters. Track where local knowledge, interpreters, transport, and political access changed the sampling path.

**Small artifact.** A stratified reconnaissance sketch: Central Asian migration hypothesis -> Yunnan survey; northwestern highland zone versus southern/western tropical valleys; a Fukien detour for the reported “blue tiger”; personnel roles and local information/transport dependencies.

**Intersection classification.** Structural as a reading of the chapter's own survey design. No physical analogy is asserted.

### Packet B: The Malay Archipelago, Chapter I, “Physical Geography,” through Electron Paths in Chips

**Source on its own terms.** Wallace begins with the archipelago as a connected island group, then argues that a more detailed natural-history analysis divides it into Indo-Malayan and Austro-Malayan regions. His evidence combines island extent, shallow and deep seas, volcanic belts, vegetation, monsoons, and the distribution of animal life. He emphasizes both connectivity through innumerable smaller islands and separation through deep-water gaps and differing geological histories.

**What the lens made salient.** The path-focused lens highlights corridors, bottlenecks, branches, and layers: shallow shelves connecting some island groups to Asia or Australia; deep straits acting as barriers; the volcanic arc; seasonal monsoon routes; and the resulting constraints on biological dispersal.

**What it obscured.** The chip-layout lens can make natural corridors appear designed or fixed. Wallace's own chapter stresses geological change over time, changing land/sea distributions, and changing life forms. It can also underweight human navigation and the uncertainty of nineteenth-century natural-history inference.

**Next inquiry induced.** Separate direct observations from historical reconstruction. Ask which boundaries are supported by sea depth, which by volcanic geography, which by vegetation, and which by species distributions. Later travel chapters may show how human routes differ from biological corridors.

**Small artifact.** A two-layer network: physical layer (shallow shelves, deep straits, volcanic arcs, monsoon flows); biological layer (species ranges and dispersal). Nodes are islands/regions; edges are corridors or barriers; edge properties vary with depth, climate, mobility, and geological time.

**Intersection classification.** Productive metaphor for attention to route constraints, but not a physical equivalence. The natural routes are not engineered traces.

### Packet C: Camps and Trails in China, Chapter II, “China in Turmoil,” through Electron Paths in Chips

**Source on its own terms.** The chapter follows the political crisis surrounding Yuan Shikai's attempt to restore monarchy, the loyalty structure of regional armies, provincial secessions, foreign pressure, and the expedition's decision to proceed despite instability. It then traces the expedition through a chain of access points: advice from the Chinese Minister in Washington, shipboard contacts, arrival in Peking, diplomatic and embassy contacts, rail travel to Shanghai, telegrams from the Anglo-Chinese College, passport visas, and onward travel to Fukien/Yunnan.

**What the lens made salient.** The path-focused lens shifts attention from the physical route alone to institutional and logistical routing. Access depends on people, documents, transport modes, and shifting political authority. The expedition's path is a sequence of gates, permissions, and fallback contacts, not a single line on a map. The passport bearing overlapping stamps from the collapsing monarchy and the republic is a particularly concrete marker of a changing authority network.

**What it obscured.** The engineered-path metaphor can make a contested political system appear deterministic. It can also underweight the agency of local actors, the violence behind the changing routes, and the author's own colonial and national framing. The text's descriptions of “face saving” and political character are the author's interpretation, not neutral system labels.

**Source anomaly.** The chapter's printed chronology contains apparent year conflicts: it refers to a 1918 rebellion in a sequence otherwise describing 1915-1916 events, and its emperor/death dates do not reconcile cleanly on the page. This may be a transcription/OCR or source-text error. It is flagged, not silently corrected; an authoritative edition and independent historical source would be needed before using the dates.

**Next inquiry induced.** Compare the route planned in Chapter I with the route actually taken here. Identify which gates were essential, which were bypassed, and how changing political authority altered the route. Check the apparent year conflicts against the original edition before relying on the chronology.

**Small artifact.** A route-and-gate graph: New York planning -> Minister Koo advice (declined) -> Tenyo Maru -> shipboard contact with Denby -> Peking diplomatic network -> rail to Shanghai -> foreign concession / security -> Foochow college contact and telegram -> passport visa -> Fukien/Yunnan. Edges are ship, rail, cable, passport, official introduction, and local institutional contact.

**Intersection classification.** Structural as a reading of the expedition's access architecture. No physical equivalence is asserted.

### Packet D: The Malay Archipelago, Chapter II, “Singapore,” through Slow Walker

**Source on its own terms.** Wallace presents Singapore as a port and island with a dense mixture of peoples, religions, occupations, buildings, vessels, trade, and hinterland activity. He then moves from the town to the interior hills, plantations, forest patches, tiger pits, and insect collecting. He reports collecting roughly 700 beetle species in about two months, including 130 longicorn kinds, largely from one patch of jungle of about one square mile. He attributes the richness partly to soil, climate, vegetation, and season, and partly to the continuing work of Chinese woodcutters, whose dead leaves, bark, wood, and sawdust supplied substrate for insects and larvae.

**What the lens made salient.** Slow observation draws attention to the texture of the port, the transitions between town and interior, the repeated daily activities of workers and traders, and the fine-grained conditions of the collecting patch. The chapter's strongest small-scale observation is that human land use can create ecological substrate and concentrate biodiversity in a limited area.

**What it obscured.** The slow observational lens can turn the city into a tableau and underweight the colonial hierarchy and racial categories through which Wallace describes its inhabitants. The workers' own perspectives are absent. The 700-species count and the explanation of the collecting patch are the author's field report and interpretation, not an independently reproduced survey or controlled causal test.

**Next inquiry induced.** Compare collecting effort and species yield across different patches, seasons, and disturbance histories. Separate observed counts from the author's causal explanation. Ask how the town's social geography and its ecological geography overlap or diverge.

**Small artifact.** A layered field note: harbor and town; trade and craft districts; cultivated interior; forest patch; woodcutting and sawdust; insect substrate; tiger habitat. The one-square-mile patch is a high-yield sample site, with the reported 700 beetle species recorded as an author observation requiring independent verification.

**Intersection classification.** Structural as a reading of the field narrative and its local sampling conditions. No physical analogy is asserted.

### Four-packet comparison: what persisted and what changed

The four prescribed pairings are now represented:

| Packet | Source | Lens | Primary salience |
|---|---|---|---|
| A | Camps and Trails, Ch. I | Slow Walker | Macro-scale terrain, gradients, reconnaissance design |
| B | Malay Archipelago, Ch. I | Electron Paths | Geographic corridors, barriers, layered dispersal routes |
| C | Camps and Trails, Ch. II | Electron Paths | Political/logistical gates, documents, access routes |
| D | Malay Archipelago, Ch. II | Slow Walker | Fine-scale town/habitat texture, human disturbance, sampling |

**Lens persistence across terrains.**
- Slow Walker changed scale substantially: in Camps I it emphasized regional gradients and survey design; in Malay II it emphasized a small collecting patch and the texture of a port/hinterland. The persistent operation is slower attention to spatial detail, not one fixed spatial scale.
- Electron Paths migrated from physical/biological corridors in Malay I to institutional/logistical access in Camps II. The persistent operation is attention to connectivity, bottlenecks, alternate routes, and constraints. The mechanisms differ: sea depth and dispersal are not the same kind of process as passports, diplomatic contacts, and transport.

**Complementarity.** The lenses behave like two different reading controls: Slow Walker adjusts observational resolution; Electron Paths emphasizes connectivity and route constraints. Their combination can produce a layered description, but the combination itself is a post-exposure synthesis, not evidence that the source terrains share one underlying physical mechanism.

**Vocabulary migration.** “Node,” “edge,” “network,” “corridor,” “bottleneck,” and “gate” are lens-added vocabulary. “Gradient,” “microhabitat,” “texture,” and “sampling patch” are Slow-Walker-added emphases. They must not be retroactively attributed to the authors unless the source uses them.

**Distortions.**
- Slow Walker can overprivilege visible detail and local morphology while underweighting power, institutional access, and historical causation.
- Electron Paths can over-structuralize and imply engineered or fixed routes, obscuring contingency, change over time, and agency.
- Both lenses can suppress the source's colonial framing if the reader treats the text as a neutral map rather than a situated historical account.

**Order and persistence limits.** The sequence A-B-C-D was not randomized. No lens-removal retest was performed, so persistence after lens removal remains unmeasured. The second pair swaps lenses as prescribed, but this does not eliminate order effects.

### Baseline status

All four planned chapter/lens packets and the first cross-packet comparison are now complete as a **POST-EXPOSURE PILOT**. The original protocol's insulation condition was not met: live H(s)H source material had already entered the current run before the raw Aldus protocol was recovered. The outputs are therefore not a pristine blind baseline and must not be used as independent cognitive-divergence evidence.

No direct SAT analogy was introduced in the four packet analyses. Nevertheless, prior exposure remains a contamination risk. A clean baseline would require a fresh, isolated context with the four packets completed before any live H(s)H material is introduced. The current run did not create a new chat or claim historical-instance participation.

No cross-domain physical equivalence, posterior probability, or theory claim is inferred from the four packets. Janus method review remains the next gate before any comparison with other worker instances or live H(s)H material.

## 5. Continuity and controls

- Original 1124 receipt and Calder handoff preserved. Calder's 1136 receipt records reading the incoming handoff; no duplicate handoff was created.
- No new issue was opened. The O9 chronology update is additive to existing issue #1141, comment #6543090618. Exact readback: 3,334 UTF-8 characters; SHA-256 `9c2a09a92dd8bebb289bae7e5331cea3a70d777e5a5a2ce05bbc850434705ee5`.
- No new branch, PR, Lean module, tooling, automation, or task was created.
- Existing :24 automation identity, enabled state, schedule, and phase were not changed.
- No physical calculation, CODATA comparison, new prediction, or observational validation was performed.
- No BEDROCK theory promotion, paper-gate advancement, or manuscript/PDF change.
- FIE rereview is not due; the prior unrelated-reading break remains current.

**Next bounded work:** verify the in-progress Mersearch run and its request-scoped manifest/receipt; then add the confirmed Blockwave message role and verbatim equations to the existing source chronology without treating derivative copies as independent witnesses. Separately, preserve the Aldus four-packet baseline boundary. Do not compare the first two packets or map them onto H(s)H until the remaining packets are complete and the baseline contamination is explicitly adjudicated.
