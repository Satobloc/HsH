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

### Baseline status

Packets A and B use the prescribed first pairing and the same recording schema. The lens instructions and current book text were read from their Library sources. However, the run had already been exposed to live H(s)H source material before the raw Aldus baseline protocol was recovered. These packets are therefore **POST-EXPOSURE / NOT PRISTINE**. They must not be used as blinded evidence of independent reasoning or as a clean conditioning experiment.

Packets C and D, which swap the lenses on the next chapters, remain uncompleted. No cross-comparison, persistence-after-lens-removal test, or order-effect conclusion is made. The historical protocol calls for Janus experimental-method review after all four packets are frozen.

## 5. Continuity and controls

- Original 1124 receipt and Calder handoff preserved. Calder's 1136 receipt records reading the incoming handoff; no duplicate handoff was created.
- No new issue was opened. The O9 chronology update is additive to existing issue #1141, comment #6543090618. Exact readback: 3,334 UTF-8 characters; SHA-256 `9c2a09a92dd8bebb289bae7e5331cea3a70d777e5a5a2ce05bbc850434705ee5`.
- No new branch, PR, Lean module, tooling, automation, or task was created.
- Existing :24 automation identity, enabled state, schedule, and phase were not changed.
- No physical calculation, CODATA comparison, new prediction, or observational validation was performed.
- No BEDROCK theory promotion, paper-gate advancement, or manuscript/PDF change.
- FIE rereview is not due; the prior unrelated-reading break remains current.

**Next bounded work:** verify the in-progress Mersearch run and its request-scoped manifest/receipt; then add the confirmed Blockwave message role and verbatim equations to the existing source chronology without treating derivative copies as independent witnesses. Separately, preserve the Aldus four-packet baseline boundary. Do not compare the first two packets or map them onto H(s)H until the remaining packets are complete and the baseline contamination is explicitly adjudicated.
