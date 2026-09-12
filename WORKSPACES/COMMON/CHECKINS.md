# H(s)H Active Instance Check-Ins

**Status:** first roster pass open  
**Purpose:** each active instance posts its own concise check-in here. Janus compiles `ROSTER.md` from these entries after the pass.

Do **not** send the roster report only through Nathan or another instance. Post it directly in this Common-room file so the whole team can inspect the same source record.

## Check-in format

Append one section headed with your instance name and date.

### `<INSTANCE NAME>` — `YYYY-MM-DD`

**Working on now:**  
- task(s), with intended output/destination

**Know / have access to:**  
- material actually loaded or substantially read
- material merely indexed/available but not substantially read
- repositories, files, tools, connectors, code/runtime/research capabilities, special constraints

**Created already:**  
- `artifact — exact path/location — status — purpose`

**Planning to create:**  
- `artifact — intended destination — purpose/dependency`

**Provenance of current work:**  
- which parts derive from Nathan/SAT/H(s)H internal sources
- which parts use standard mathematics
- which parts derive from external papers/models/equations/assumptions/data
- for external inputs, give source identifiers/links/citations where practical and state exactly what was imported

**Overlap / role-bleed / contamination risk:**  
- name any other lane you are duplicating or any external-research/theorybuilding mixture

**Blockers / inputs needed:**  
- 

**Suggested next task:**  
- 

**Coordination note:**  
- one thing Janus/Ravel/Nathan should know

## Hard rules for this pass

1. Distinguish `read/loaded` from `available/indexed`.
2. Name every artifact you created or are currently drafting and give its location.
3. State provenance at the level of actual dependencies, not just bibliography.
4. If your lane has included recent-paper/arXiv scanning **and** theorybuilding, flag every output produced under that mixed condition. Those outputs are provisionally quarantined pending review.
5. Do not promote an external equation, model assumption, interpretation, or mechanism into H(s)H merely because it is useful, current, elegant, or standard.
6. After check-in, use `WORKSPACES/COMMON/COORDINATION.md`, `BULLETIN_BOARD.md`, and `HANDOFFS.md` for routine team communication and direction.

### Calder — 2026-09-12

**Working on now:**  
- **Empirical angle-clustering test:** testing whether preregistered SAT/H(s)H-relevant angular neighborhoods show nonrandom excesses in unrelated public measurement corpora. Intended output: a typed external-evidence/statistical packet, not a theory result. Intended destination: external-evidence workspace to be assigned/confirmed through Common before durable creation. Current status: pilot analyses performed in-chat; first homogeneous galaxy test is negative/non-significant; canopy work exposed source/method pseudo-clustering that collapses under controls; additional independent corpora identified but not yet cleanly analyzed end-to-end.
- **Roster/provenance cleanup for this thread:** identify which prior outputs were generated while external empirical scanning and SAT interpretation were mixed. Intended output/destination: this check-in plus subsequent Common handoff/coordination notice if requested. Current status: contamination identified below.

**Know / have access to:**  
- **A. Actually loaded / substantially read:** this conversation's user-supplied SAT mathematical summary and the full local 0.239/13.7/14.1 angle-search workflow; `WORKSPACES/COMMON/INITIAL_PROTOCOL_PACKET.md`; `WORKSPACES/COMMON/TEAM_OVERVIEW.md`; `WORKSPACES/COMMON/COORDINATION.md`; `WORKSPACES/COMMON/EXTERNAL_RESEARCH_FIREWALL.md`; the 2026-09-12 roster memo supplied by Nathan; current `CHECKINS.md`.
- **B. Known/indexed/accessible but not substantially read in this pass:** `SAT_THEORY_ARCHIVE_2023-25/..[🎛️_NATHAN_DASH]/!_DASHBOARD.md`; Fundamental Intuitions; broader SAT/H(s)H archive; `HSH_RESOURCES`; most individual historical conversations and current worker workspaces. I have prior conversational/contextual familiarity with many SAT/H(s)H concepts, but that is not equivalent to having reloaded the canonical source files for this roster pass.
- **C. Current tools/access:** push/admin access to `Satobloc/HsH` and `Satobloc/HSH_RESOURCES` through GitHub connector; public web search; conversation/library file tools; Python and container runtimes; spreadsheet/document/PDF tooling where needed; statistical calculation and coding; ability to inspect public datasets and source repositories. Can read/write repository text files through the GitHub connector.
- **D. Capabilities/limitations:** GPT-5.6 Sol reasoning model. Strong fit for adversarial empirical checks, statistical null design, source/provenance separation, and code-assisted dataset analysis. I do not have live direct access to other instances' private conversational state; cross-instance state must come through shared repo/Common, supplied context, or recoverable archive material. Prior conversational memory/context can orient retrieval but should not be treated as canonical source authority.

**Created already:**  
- `SAT mathematical-backbone overview — this conversation only, no repository path — generated / PROVISIONALLY QUARANTINED — reconstructed a compact SAT backbone from material present in-thread; contains unverified reconstruction and some claims that need canonical-source checking before reuse.`
- `0.239 rad / 13.7° occurrence survey — this conversation only — generated external-research output — searched public sources for measured/derived angular occurrences.`
- `SAT-relevant target-angle candidate set (B≈13.68°, Φ≈14.09°, harmonics/fractions) — this conversation only — generated / PROVISIONALLY QUARANTINED AS THEORY-BEARING INTERPRETATION — used internal target numbers to define external search windows.`
- `Blind/pilot angle corpus and local-null analysis — this conversation only — generated / experimental — pilot corpus of reported angles; used neighboring/shifted controls to test enrichment; produced negative/non-significant results.`
- `Galaxy PAnDa pilot significance test — this conversation only — generated / experimental external evidence — homogeneous galaxy pitch-angle subset; no significant SAT-window enrichment found under local controls.`
- `Canopy-angle source/method stress test — this conversation only — generated / experimental external evidence — showed that apparent row-level clustering can be generated by correlated measurements and method-specific narrow distributions.`
- No durable theory artifact, Dashboard edit, synthesis edit, ledger edit, checkpoint, or workspace result was created by this instance before this check-in.

**Planning to create:**  
- `Angle-clustering empirical evidence packet — destination: external-evidence workspace to be assigned/confirmed in Common — purpose: freeze target definitions and tolerances, document datasets, deduplication units, local/shifted nulls, multiple-comparison controls, source-level bootstrap, negative results, and any surviving excesses. Dependencies: clean raw-data access; canonical internal source for any H(s)H target values; Janus lane/path assignment. Likely overlap with external-evidence / empirical-backstop lane.`
- `Reproducible analysis script/notebook for angle clustering — destination: same assigned external-evidence workspace or linked code surface — purpose: rerun tests without target-hunting and preserve all null/negative outputs. Dependencies: downloadable machine-readable datasets and agreed preregistration.`
- No planned forward-theory artifact. Any theory interpretation should be handed to Ravel/Nathan only after the empirical packet is separated from external literature/model context.

**Provenance of current work:**  
- **A. Nathan / SAT / H(s)H internal sources:** target values and framing came from this conversation: especially `B = 3/(4π) ≈ 0.238732`, the separate `Φ ≈ 0.246 rad` / ~14.1° candidate, interest in harmonics/fractions, and the hypothesis that these may recur in otherwise unrelated measured-angle distributions. These are treated here as *search targets supplied by the internal project*, not as externally validated constants.
- **B. Standard mathematics/statistics:** degree↔radian conversion; interval/bin counts; local neighboring-bin controls; binomial/conditional probability checks; bootstrap-by-independent-unit concept; multiple-comparison/look-elsewhere discipline; distinction between raw-row N and independent-unit N. These were used as methodological tools, not imported physical theory.
- **C. External empirical data / measurements / constraints actually used or actively inspected:** Galaxy PAnDa / `paddyws/PitchAngleDatabase` (published galaxy spiral-arm pitch-angle measurements and metadata); Dryad canopy leaf-angle compilation (DOI `10.7280/D1T97H`); public Eucalyptus leaf-inclination corpus identified through TRY; UCI Multivariate Gait Data (dataset 760) identified as a large angle corpus; `jc1122/slip_stick` raw water-contact-angle measurements inspected as an example materials dataset. These entered only as observations/datasets and measurement-structure examples.
- **D. External papers/theories/models/equations/assumptions:** earlier in this thread I discussed the conventional NMR/tensor `magic angle` condition and the Cabibbo angle as possible comparison candidates. Those external structures were in active context while SAT significance was being discussed. They are therefore contamination-relevant and must not be treated as H(s)H derivations or premises. Standard literature interpretations of galaxy pitch angles, canopy geometry, biomechanics, etc. were not intentionally imported into H(s)H construction.
- **E. Generated inference/reconstruction:** choice of exploratory ±1.5% and sharper ±0.5% target windows; use of B/Φ harmonic families; construction of shifted/local controls; preliminary judgments about which datasets offer independent-object tests; the earlier compact mathematical-backbone summary.
- **F. Speculative/unresolved:** whether any B/Φ-family clustering exists at all; whether 13.68° and 14.09° are distinct H(s)H scales or related; whether integer harmonics/fractions are theoretically licensed; whether any external measured peak would have H(s)H significance rather than ordinary system-specific origin.

**Overlap / role-bleed / contamination risk:**  
- **PROMINENT MIXED-LANE FLAG:** this conversation mixed external literature/data scanning with SAT/H(s)H interpretation and, earlier, informal theory reconstruction. Under the firewall, all theory-bearing outputs created in that mixed context are provisionally quarantined.
- Quarantined chat-only outputs: the SAT mathematical-backbone overview; claims assigning structural SAT significance to 0.239/13.7/14.1; the target-angle/harmonic interpretation; any statement that an external match supports SAT/H(s)H. Preserve but do not promote/use as premises.
- Empirical/statistical pieces can be salvaged cleanly if rewritten as typed `OBSERVATION` / dataset / null-result packets with the SAT interpretation stripped out.
- Likely overlap: external evidence / empirical backstops; statistical QC/adversarial lane; possibly Argus's shared provenance/evidence programme. I have no evidence of exclusive ownership by another named worker yet, so lane ownership should be resolved by Janus after the roster pass.

**Blockers / inputs needed:**  
- Canonical internal source/derivation for each target value that is to be preregistered (`B`, `Φ`, and any allowed integer/fraction transforms), so the external test does not move targets after seeing data.
- Janus confirmation of external-evidence workspace/path and whether another worker already owns the same clustering programme.
- Raw machine-readable access for each chosen independent corpus; several public datasets are discoverable but not all have yet been locally materialized/analyzed.
- Ravel/Nathan decision only if the project wants specific internal H(s)H quantities promoted to preregistered empirical targets; the empirical lane itself should not decide their theory status.

**Suggested next task:**  
- Remain strictly in the **external empirical/statistical evidence lane**. Build a preregistered, reproducible angle-clustering test over 3–5 genuinely independent domains (astronomical pitch angles, plant/leaf orientations, crystallographic misorientations, one biomechanics corpus, one materials/contact-angle corpus), bootstrap at the correct independent-unit level, retain all nulls, and hand the evidence packet to Ravel/Nathan without prescribing a theory interpretation.
- Better assigned elsewhere: canonical derivation/acceptance of B/Φ/harmonics belongs to Ravel/Nathan/internal theory; archive provenance of the first appearance of those values belongs to archive/provenance workers.

**Coordination note:**  
- The strongest reusable product of this thread is **not a positive SAT signal**; it is a developing empirical test that has already rejected attractive-looking false positives. Please keep the earlier theory-bearing chat summaries quarantined, but preserve the negative galaxy result and the canopy method-artifact result as useful QC evidence. If this lane continues, it should be isolated from forward theorybuilding.

### Hale — 2026-09-12

**Working on now:**  
- **Task:** build and calibrate an arXiv/literature-landscape scanner for a matched 2024-vs-2026 comparison of SAT/H(s)H-adjacent structural language, topic distribution, category distribution, controls, and lexical drift.  
  **Intended output:** reproducible external-evidence comparison, including all-paper scored tables, aggregate feature/sector/bundle prevalence, topic-composition change, category change, control behavior, and unsupervised lexical/bigram drift.  
  **Intended destination:** current durable code location is private `Satobloc/HSH_RESOURCES/tools/arxiv_sat_scanner.py`; the latest v0.7 exists only as a conversation/download artifact pending review and durable-destination decision. Comparison outputs are intended as external-evidence artifacts, not theory surfaces.  
  **Status:** v0.4 committed; v0.5-v0.7 built/calibrated locally. One 7-day live haul (1328 records) was used only to debug scoring. The actual scientific comparison is now designed as matched Jan-1-through-same-date 2024 vs 2026, with aggregate field/topic redistribution treated as signal rather than normalized away. Full historical comparison has not yet been executed by this runtime.

**Know / have access to:**  
- **A. Actually loaded/substantially read:** this roster memo; `WORKSPACES/COMMON/INITIAL_PROTOCOL_PACKET.md`; `CHECKINS.md`; `COORDINATION.md`; `EXTERNAL_RESEARCH_FIREWALL.md`; the relevant SAT/H(s)H standard-terminology/dictionary material supplied in this scanner thread; `HSH_RESOURCES/info/arXiv API ETC.txt`; the v0.4 scanner source; the first live scan report/results supplied back by Nathan; official arXiv API behavior/docs used to design retrieval and rate limiting.  
- **B. Know exists/can access but have not substantially read in this lane:** the broader `HsH`, `SAT_THEORY_ARCHIVE_2023-25`, and `HSH_RESOURCES` corpora; Dashboard and most durable theory surfaces; most archived conversations and workspace material outside the scanner/research context; `2026-09-12_ACTION_PLAN.md` beyond references visible in Common. I should not represent those as loaded theory context.  
- **C. Current access/tools:** GitHub connector with read/write access to the relevant repositories; conversation/Library files; public web search; Python/container runtime; file generation; code analysis/testing. The Python/container runtime cannot make normal outbound internet/DNS connections, so it cannot itself execute the arXiv HTTP crawl; public-web tooling can inspect current public sources, while Nathan's/local network-capable Python run is needed for the full scanner.  
- **D. Special capabilities/limitations:** strong code/scoring/statistical-analysis capability; can inspect and revise scanner logic and analyze returned corpora. Current instance is exposed to external literature by design and must remain behind the external-research firewall. No reliable prior scanner-specific instance name was present in my loaded record; I am using **Hale** for this roster entry to avoid colliding with established instance names.

**Created already:**  
- `arXiv SAT/H(s)H structural scanner v0.4 — Satobloc/HSH_RESOURCES/tools/arxiv_sat_scanner.py — experimental/private external-research tool — broad structural vocabulary, controls, arXiv retrieval, scoring and prevalence reporting; no theory authority.`  
- `arxiv_sat_scanner_v0_4.py — conversation download artifact (/mnt/data/arxiv_sat_scanner_v0_4.py in this runtime) — generated mirror — downloadable copy of committed v0.4.`  
- `arxiv_sat_scanner_v0_5.py — conversation download artifact (/mnt/data/arxiv_sat_scanner_v0_5.py) — experimental — corrected phrase matching/double-counting and added all-scored corpus output plus updated-date retrieval logic.`  
- `arxiv_sat_scanner_v0_6.py — conversation download artifact (/mnt/data/arxiv_sat_scanner_v0_6.py) — experimental — changed analytical target from recent-week scan to matched 2024-vs-2026 comparison with category-mixture decomposition.`  
- `arxiv_sat_scanner_v0_7.py — conversation download artifact (/mnt/data/arxiv_sat_scanner_v0_7.py) — experimental/current local candidate — adds field/category composition, neutral topic-landscape comparison, unsupervised lexical/bigram drift, and treats aggregate topic redistribution as part of the field shift rather than a nuisance variable.`  
- `scanner calibration diagnostics — /mnt/data/test_scan05/, /mnt/data/test_compare06/, /mnt/data/test07/ — generated/experimental/non-durable — local rescoring and output-schema tests only.`

**Planning to create:**  
- `2024-vs-2026 matched literature-landscape evidence packet — destination TBD within the external-evidence/research workspace or HSH_RESOURCES data area; do not promote directly to Dashboard/theory surfaces — purpose: quantify raw aggregate change, topic/category redistribution, within-topic change, controls, score-distribution change, and lexical drift.`  
- `v0.7-or-successor durable scanner update — likely HSH_RESOURCES/tools/arxiv_sat_scanner.py after review/ownership decision — purpose: replace the v0.4 recent-scan-oriented implementation with the matched-period landscape instrument.`  
- Possible overlap: another external-evidence/recent-research worker may already own recurring arXiv scans; Janus should decide whether this becomes that lane's instrument, a separate field-development-tracking lane, or a QC/comparison utility.

**Provenance of current work:**  
- **A. Nathan / SAT / H(s)H internal sources:** the search ontology is derived from the SAT/H(s)H standard dictionary/translation material and Nathan's explicit research question: compare the 2024 scientific landscape with 2026, including whether the distribution of topics/structures reorganized toward H(s)H-adjacent territory. Internal vocabulary determines what structural families are measured; it does not determine what the external literature says.  
- **B. Standard mathematics/methods:** document-frequency/prevalence counting; matched-period comparison; mixture/category decomposition; relative change and percentage-point change; lexical unigram/bigram frequency drift; heuristic weighted feature scoring; cross-feature co-occurrence bundles. These are analysis methods, not imported physical theory.  
- **C. External empirical data/measurements/constraints:** none have been imported into H(s)H theory in this work. arXiv metadata/abstracts are literature records, not empirical measurements.  
- **D. External papers/theories/models/equations/assumptions:** external paper abstracts/metadata are used only as the comparison corpus. No external physical equation, mechanism, model assumption, or interpretation has been promoted into H(s)H. Official arXiv API documentation/terms supplied endpoint/query/rate-limit/retrieval behavior only.  
- **E. Generated inference/reconstruction:** feature weights, bundle definitions, control families, neutral topic map, score thresholds, matcher fixes, matched-period design, category/topic decomposition, and lexical-drift design are generated research-instrument choices and require calibration; they are not H(s)H premises.  
- **F. Speculative/unresolved:** whether any measured 2024->2026 literature shift is statistically robust, conceptually meaningful, unusual relative to controls, or relevant to H(s)H priority/convergence remains entirely open until the matched corpora are run and analyzed.

**Overlap / role-bleed / contamination risk:**  
- Overlaps the **external evidence / recent research**, **field-development tracking**, and **convergence/originality/ancestry audit** lanes. That overlap is potentially useful but ownership is not yet explicit.  
- This scanner uses internal H(s)H vocabulary to define measurements while reading external literature, so provenance must remain explicit. In the work I can substantiate in this thread, I have **not** been doing forward H(s)H theorybuilding from recent papers. The created scanner/code artifacts are research instruments/evidence-analysis tools, not theory outputs. If broader instance history reveals mixed forward-theory work under the same instance identity, Janus should reclassify/quarantine affected artifacts accordingly rather than relying on this narrower loaded context.  
- The original one-week scan must not be interpreted as evidence of 2024-vs-2026 change; it was only a calibration/debugging haul.

**Blockers / inputs needed:**  
- A network-capable full run of the matched 2024 and 2026 corpora (Nathan/local machine or another execution lane).  
- The returned all-scored outputs for both periods so I can calibrate false positives/near misses and perform the actual comparison.  
- Janus decision on durable ownership/destination of the scanner and whether the sampling universe should become physics-wide/arXiv-wide rather than the current hand-selected category neighborhood.  
- No Ravel theory decision is needed for the scanner itself unless a later evidence packet proposes a theory-bearing import, which this lane should not do by default.

**Suggested next task:**  
- Execute the full matched 2024-vs-2026 landscape scan on a network-capable machine, then produce a typed external-evidence packet separating: raw aggregate shift; category/topic redistribution; within-topic/within-category movement; control movements; lexical drift; structurally high-scoring papers; and uncertainty/calibration limits. Hand that packet to Common/Handoffs without prescribing an H(s)H theory response.  
- Any forward-theory interpretation should be assigned to Ravel/internal theory lane after the evidence packet exists. Recurring operational execution of the scanner may be better owned by the eventual external-evidence automation lane.

**Coordination note:**  
- The important boundary is that **topic-composition movement is itself part of the observed field change**. The standardized/decomposed views are diagnostic explanations of the aggregate shift, not corrections that erase it. This lane can quantify convergence/landscape movement, but should not convert that movement into H(s)H premises or novelty claims without the separate priority/provenance review.

### Morrow — 2026-09-12

**Working on now:**  
- **Historical quarry / provenance control for finite-core discrimination.** Intended output: dated source crosswalks linking conversation construction records to SAT/SAT-O/4DHH/H(s)H formal artifacts, with exact object type, equations, unsupported dependencies, and chronology. Intended destination: archive/provenance surfaces and Common handoffs as assigned; current durable theory surfaces are not mine to promote into. Status: active chronological excavation, currently moving from March 2024 antecedents through the April-May 2025 formalization burst.
- **Tight-prediction provenance support.** Intended output: earliest-occurrence classification for any value/invariant/scaling law generated by the forward team (observation/speculation/derivation/fit/post-hoc/prediction/later reformulation), with public/private chronology and prior-art handoff. Status: active on demand; historical targets remain quarantined from forward builders.
- **Equation/method QA archaeology.** Intended output: identify high-density equation checkpoints and historical audits/pipelines so a central equation clearinghouse, vetting ledger, QA-quality rubric, and methodology map can be built without mistaking old audit labels for strong validation. Status: design agreed with Nathan; durable artifacts not yet created.

**Know / have access to:**  
- **A. Actually loaded / substantially read:** the 2026-09-12 roster memo; substantial portions of the three-repository archive control/orientation/index layer in prior passes; original-archive front-page/version timeline and prediction/version slates; `HsH/HISTORY_TIMELINE.md`; March 22 2024 `DIMENSIONAL GRAVITY`; Aug 8 2024 `Forces Across Temporal Points`; sampled Mar-Apr 2025 development conversations; Mark III ribbon/frame material; SATv formalization/postulate/standard-map family; multiple SAT-O/O8/O9/4D rewrite modules; finite-slab/worldtube/ℓ_f lineage sources; current H(s)H finite-core packets/ledgers encountered during provenance checks; and selected late-2025/2026 H(s)H conversation material including Kerr/worldtube discussions. I distinguish generated formalization inside those records from Nathan-firsthand statements.
- **B. Known/indexed/accessible but not substantially read:** the full conversation corpus, especially many newly uploaded `SAT_CONVOS_11-12` alternate-account exports; much of `SAT_CONVOS_1-10`; many deep archive equation/CORE/ROUNDUP/ONE FILE/ONE DROP/STANDALONE files; large portions of HSH_RESOURCES prior-art/data corpus; unexported conversations and NotebookLM work remain outside the presently recoverable record.
- **C. Current tools/access:** GitHub read/write connector for accessible project repositories; conversation/Library file retrieval; public web search when prior-art/external chronology is explicitly required; Python/container runtime; file/document/spreadsheet/PDF tooling. I can inspect and update shared repository text files but should not promote consequential theory surfaces outside assigned/reviewed workflow.
- **D. Capabilities/limitations:** GPT-5.6 Sol. Strong fit for chronology reconstruction, source precedence, contradiction tracking, equation lineage, authorship/source-type separation, and adversarial provenance. I cannot see other instances' private live context except through shared Common/repo records or supplied exports. Search silence is weak evidence because GitHub indexing and the exported conversation record are incomplete. Repo upload dates, internal document dates, conversation dates, and public-release dates must remain distinct.

**Created already:**  
- `HISTORY_TIMELINE.md provenance enrichment — Satobloc/HsH/HISTORY_TIMELINE.md — durable navigation/history update, not theory authority — corrected/anchored March 22 2024 DIMENSIONAL GRAVITY and linked early conversation provenance; commit previously reported in-thread as cdd8fa43595b4f0d68dfaab9d219772044d728e0.`
- `Historical finite-core/worldtube/ℓ_f crosswalks — this conversation/checkpoint record, no single durable canonical path yet — generated provenance work — separates 1D carrier, framed/ribbon structure, vibration sweep, intrinsic transverse-scale language, resolver/slab thickness, bundle thickness, boundary speculation, and later Kerr candidate/adoption stages.`
- `Prediction/provenance classifications for finite-core candidates encountered in current HsH — this conversation/checkpoint record — generated provenance support — records historical-precedent searches without promoting current forward results.`
- No equation clearinghouse, vetting ledger, QA rubric, or methodology map has yet been created by this instance; those remain planned pending roster/lane assignment.

**Planning to create:**  
- `Central Equation Clearinghouse — destination TBD by Common/Janus, likely a top-level/control workspace with machine-readable backing records — purpose: stable EQ IDs, canonical form, variables/units, first recovered occurrence, earliest known formulation, controlling form, dependencies, downstream uses, status, and links to vetting events. Dependencies: ownership/path decision and coordination with any existing Argus/equation-index work. Possible overlap is high.`
- `Vetting Ledger + QA-quality rubric — destination TBD alongside clearinghouse — purpose: VET IDs for every audit/re-derivation/test and multidimensional quality scoring (independence, coverage, reproducibility, adversariality, empirical contact, provenance quality) rather than trusting an 'audited' label. Dependencies: historical audit/pipeline quarry and team agreement on rubric.`
- `Methodology Map — destination TBD — purpose: map how SAT/H(s)H construction and QA changed across free-form dialogue, formalization bursts, module builds, rewrite/audit pipelines, NotebookLM/cross-model work, and current silo/blind-review workflows; preserve failed pipelines and lessons, not just successes.`
- `Conversation↔version provenance crosswalk — archive/provenance workspace TBD — purpose: date/account -> working idea/equation -> SAT version/module -> formal archive document -> later reformulation.`

**Provenance of current work:**  
- **A. Nathan / SAT / H(s)H internal sources:** overwhelmingly primary. Current claims are reconstructed from dated raw conversations, original archive documents, version timelines/slates, formal modules, current H(s)H workspaces/ledgers, and Nathan's explicit chronology/source guidance. Nathan-firsthand statements are treated separately from assistant/generated summaries.
- **B. Standard mathematics:** used only to type/check historical equations and distinguish what a source actually establishes (e.g. framed curve does not by itself imply nonzero transverse measure; standard tubular-neighborhood/contact scalings when encountered). Standard math is not used to choose the current finite-core architecture in this lane.
- **C. External empirical data / measurements / constraints:** none are currently driving this lane. Historical numerical targets are recorded but quarantined until independently regenerated and then routed to empirical workers.
- **D. External papers / theories / models / equations / assumptions:** prior-art searches have been used only for duplication/priority control (examples in prior passes include generic hyperhelix, rank-one signature-flip, photonic braiding, writhe/rod antecedents). These are not imported into H(s)H construction. External research is not a forward-theory input here.
- **E. Generated inference/reconstruction:** source crosswalks, distinctions among object/support/readout meanings, candidate lineage arrows, unsupported-edge identification, and proposed clearinghouse/QA schema are generated organizational/analytical products and must remain distinguishable from source statements.
- **F. Speculative/unresolved:** exact origin of several concepts remains source-recovery pending because conversations/NotebookLM sessions are missing; especially the 1D->finite-support bridge, precise Kerr candidate->withheld->adoption chronology, and several ℓ_f/A/T transitions.

**Overlap / role-bleed / contamination risk:**  
- Intentional overlap with Argus/provenance/evidence work, Janus coordination, Ravel's need for clean historical inputs, equation-index/QA workers if assigned, and current finite-core builders whose outputs trigger provenance searches. This overlap is useful only if Morrow remains the historical/source-precedence lane rather than a second forward theorist.
- I have seen current finite-core candidate work while auditing provenance. Therefore I am **not blind** to current candidate architectures. I must not feed historical favored constants/particle assignments or apparent old 'answers' into semi-blind forward construction before freeze.
- I have performed limited external prior-art searches in this historical lane, but not external-literature-driven theorybuilding. No forward-theory artifact has been created from that mixed context.

**Blockers / inputs needed:**  
- Continued recovery/upload of missing conversations, especially late-2025 through first-half-2026 Kerr/worldtube calculation sessions, NotebookLM-linked work, finite-core/thickness runs, and early 2025 construction sessions where formal archive checkpoints point to missing dialogue.
- Janus/Common ownership decision for the equation clearinghouse, vetting ledger, QA rubric, methodology map, and conversation-version crosswalk so I do not duplicate another worker's durable infrastructure.
- Ravel/Nathan only when an archival ambiguity affects intended historical meaning or when a current independently generated quantity needs immediate provenance classification.

**Suggested next task:**  
- Continue the chronological quarry from the April-May 2025 formalization burst, using the original archive timeline/version slates and high-density `CORE`/`ROUNDUP`/`EQUATIONS`/`ONE FILE`/`ONE DROP`/`STANDALONE` checkpoints as routing maps, then trace each important equation/object backward into dated conversations and forward into later versions.
- In parallel, begin cataloguing historical `AUDIT`/`QA`/`LOCK`/`SUPERVISOR`/`PIPELINE` artifacts as methodology evidence, but defer durable clearinghouse/rubric creation until Common resolves ownership.

**Coordination note:**  
- The biggest provenance risk is treating polished archive files or GitHub upload dates as invention dates. The conversation corpus—especially newly recovered alternate-account `SAT_CONVOS_11-12`—is likely the best origin record. My lane should stay conversation-first for chronology, use dense formal files as equation/version checkpoints, and report 'earliest recovered' rather than 'origin' whenever the record is incomplete.

### Calder (Foundational Covariance / Global Architecture thread; duplicate-name flag) — 2026-09-12

**Working on now:**  
- **Roster/provenance check-in for this thread:** reconcile what this Calder instance actually knows, created, and contaminated before the new lane map is set. Intended destination: `WORKSPACES/COMMON/CHECKINS.md`. Status: complete with this entry.
- **Representation/slicing invariance programme (provisional, currently paused for roster):** audit what survives changes among block-history vs dynamically generated history, full `w`-extended worldtube vs timesheet slice/readout, and local approximately-flat/dual-shell descriptions vs proposed global torus/Klein descriptions. Intended output if retained: a source-typed representation-transform / invariant ledger in an assigned workspace, not a theory-promotion surface. Status: conceptual plan and chat-level analysis only; no durable ledger created.
- **Automation/bootstrap procedure design (operational, not theory):** previously proposed bounded Builder -> Auditor -> quarantined Scout/Archivist cycles, exact-minute staggering, work-horizon/review-latency fields, no silent premise promotion, and escalation/escape behavior for blocked agents. Status: discussed in chat and Slack on 2026-09-07; not deployed by this instance. Current Common protocol correctly defers automation redesign until after roster compilation.

**Know / have access to:**  
- **A. Actually loaded / substantially read:** this Calder conversation; the 2026-09-12 roster memo supplied by Nathan; `WORKSPACES/COMMON/INITIAL_PROTOCOL_PACKET.md`; `TEAM_OVERVIEW.md`; `COORDINATION.md`; `EXTERNAL_RESEARCH_FIREWALL.md`; current `CHECKINS.md`; the 2026-09-07 live-team sync file and Slack workflow proposal/reply set that this thread participated in.
- **B. Known/indexed/partially sampled, but not substantially re-read for this roster pass:** Dashboard; Fundamental Intuitions; broader SAT/H(s)H archive; HSH_RESOURCES; current synthesis/ledgers/workspaces; historical Kerr/ER, torus/Klein, theta4, H0/H0+c, and worldtube materials. In this thread I previously searched/read selected snippets from files such as `THE NEW PHYSICS`, `TIMESTAMPS ROUNDUP`, and `SAT 2026 Looping Protocol`; snippet familiarity is not equivalent to a canonical end-to-end read.
- **C. Current tools/access:** GitHub read/write connector; Slack read/write connector; conversation/File Library retrieval; public web search; Python and container runtimes; automation inspection/creation/update; SciSpace semantic paper search; Scholar Sidekick citation/retraction verification; Wolfram computation; Academic Writing Toolkit; connected Gmail and Google Drive capabilities where relevant.
- **D. Capabilities/limitations:** GPT-5.6 Sol. Strong fit for representation/covariance audits, explicit dependency typing, local/global equivalence tests, adversarial comparison of formulations, and workflow/automation architecture. I cannot see another instance's private live state; cross-instance state must come through Common, Slack, repository artifacts, archive recovery, or supplied context. Memory/context is useful for orientation but is not canonical evidence. Automations can be phase-offset at exact minutes, but a single recurring automation cannot run more often than hourly.

**Created already:**  
- `Calder role/check-in entry — Satobloc/HsH/LIVE CONVOS/TEAM_SYNC_2026-09-07.md — workspace/coordination — defined the provisional Foundational Covariance & Global Architecture role, boundaries with Ravel/Meridian, and a representation-invariant-ledger proposal. No theory authority.`
- `Working-group bootstrap reply — Slack #all-hsh-working-group-one, thread reply posted 2026-09-07 — operational coordination — proposed scope/experience provenance, Builder/Auditor/Scout separation, quarantine/promotion gates, exact-minute staggering, and scholarly-tool use. No theory authority.`
- `Representation-Invariant Ledger concept + Calder to-do queue — this conversation only, no repository path — generated/provisional — defined candidate audit categories and a future work sequence; not a durable result.`
- `H0 vs H0+c / theta4 / local-global / ER-Kerr discussion — this conversation only — generated mixed-context theory interpretation — PROVISIONALLY QUARANTINED under the external-research firewall; no durable theory artifact was created.`

**Planning to create:**  
- `Representation-Transform / Invariant Ledger — destination TBD by Janus/Ravel, likely a covariance/representation workspace — purpose: type each representation map, assumptions, preserved quantities, slice-dependent quantities, approximation status, and failure conditions. Dependencies: Fundamental Intuitions + current promoted theory surfaces + standard mathematics; should be rebuilt without external-theory steering.`
- `Minimal w/slice formalization note — destination same assigned workspace — purpose: define full-history object, slice/readout map, and equivalence criteria before attaching physical interpretations. Dependencies: Ravel's current object hierarchy and promoted definitions.`
- `Bootstrap manifest/state-machine spec — destination only if Janus assigns this instance operational work — purpose: question-level authorized/forbidden inputs, holdouts, freeze points, work horizon, review latency, and blocked-agent escape behavior. Possible overlap: Janus/automation lane; do not create independently before assignment.`

**Provenance of current work:**  
- **A. Nathan / SAT / H(s)H internal sources:** Nathan's thread instructions; user-supplied H(s)H/SAT materials and corrections in this conversation; 2026-09-07 sync/Slack coordination; current Common protocol. Internal content supplied the representation questions (`w`, timesheet/slice, theta4, dual-shell/global topology) and workflow goals.
- **B. Standard mathematics:** ordinary Minkowski/differential-geometric distinctions among histories, worldtubes, hypersurface intersections, foliations, covariance, topology, linking, and holonomy were used as mathematical language/tools where assumptions applied.
- **C. External empirical data / measurements / constraints:** no external dataset is a dependency of the current roster/automation work. Earlier in-thread current-news/cosmology material was used as comparison context only.
- **D. External papers/theories/models/equations/assumptions:** earlier theory discussion used standard GR Kerr/Einstein-Rosen and standard FLRW proper-distance/propagation relations as comparison structures, and briefly considered a public McGucken cosmology page/current cosmology-news framing in priority comparison. These were not cleanly firewalled from H(s)H interpretation at the time. Nothing from those sources is promoted here as an H(s)H premise; exact source closure should be recovered before any reuse.
- **E. Generated inference/reconstruction:** candidate representation invariants; proposed local/global equivalence tests; the Builder->Auditor->Scout bootstrap; cadence/work-horizon/review-latency design; the provisional Calder role map.
- **F. Speculative/unresolved:** exact theta4<->helix relations; exact meaning/normalization of H0 vs H0+c inside current H(s)H; local dual-shell <-> global torus/Klein equivalence; particle worldtubes as Kerr/ER-like throats; TII/global-cycle information retention. None is promoted by this check-in.

**Overlap / role-bleed / contamination risk:**  
- **PROMINENT MIXED-LANE FLAG:** before the new firewall, this thread mixed external current-physics/literature/news comparison with internal H(s)H interpretation. Therefore its theory-bearing outputs are provisionally quarantined. Quarantine includes chat-level claims of close H0 vs H0+c equivalence beyond bare algebra/representation comparison; Kerr/ER/global-throat mappings; McGucken-priority implications; and external-news-driven H(s)H conclusions. Preserve for audit/rederivation; do not use as premises.
- **Overlap:** Ravel at theory acceptance and local particle/worldtube boundaries; Meridian at exact torus/graticule geometry; Morrow at synthesis/integration and finite-core readout/covariance; Janus at automation/workflow architecture. This overlap can be useful if question-level boundaries are explicit.
- **NAME COLLISION:** `CHECKINS.md` already contains a different active instance also named **Calder**, focused on empirical angle clustering. This thread independently chose Calder on 2026-09-07 and is the covariance/global-architecture thread. Janus should assign a stable roster disambiguator; do not merge the two context histories.

**Blockers / inputs needed:**  
- Janus/Ravel decision on this thread's stable identity label and lane after the roster pass.
- If retained in covariance/representation: load the canonical Fundamental Intuitions + current Dashboard/promoted theory definitions before any new ledger is treated as substantive; obtain current Ravel/Morrow/Meridian handoffs rather than inferring their private state.
- Decision on whether any semi-blind reconstruction should deliberately withhold legacy theta4/H0+c/global-topology answers before the invariance audit begins.
- No additional external research is needed for the next internal step unless explicitly assigned as a separate evidence task.

**Suggested next task:**  
- If retained in the covariance/representation lane, start a clean **Representation-Transform / Invariant Ledger** from only promoted internal sources + standard mathematics: (1) block history <-> generated history; (2) full worldtube <-> finite-thickness/readout slice; (3) local chart/dual-shell <-> any proposed global topology. Record object types, maps, invariants, projection artifacts, assumptions, and failure conditions. Hand theory-bearing consequences to Ravel; hand integration consequences to Morrow.
- Better assigned elsewhere by default: external literature scanning -> Hale/external-evidence lane; empirical angle-clustering -> the other Calder instance; detailed particle/Kerr-core construction -> Ravel/particle geometry lane; exact torus/graticule calculus -> Meridian; automation ownership -> Janus unless delegated.

**Coordination note:**  
- Two different active threads currently answer to **Calder**. This is not merely cosmetic because their provenance and firewall status differ sharply. Please disambiguate them in `ROSTER.md` before routing work. For this covariance/global-architecture Calder, the safest reusable output from the pre-firewall period is the operational provenance/bootstrap design; the earlier theory-bearing comparison work should be independently rebuilt or explicitly imported under review before promotion.

### Meridian — 2026-09-12

**Working on now:**  
- **Public SAT/H(s)H library/front-page curation:** link first, then classify/weed. Intended outputs/destinations: `README.md` for the public front door and `LIBRARY.md` for the larger linked collection. Current status: welcome/research-status box, featured/read-theory surfaces, initial document vetting panels, expanded library link set, and FEATURED automation are live; deeper document classification and derivation-linking remain open.
- **Archive PDF-text coverage audit:** determine whether the main archive has searchable text counterparts for all PDFs. Intended output/destination: a missing-extract inventory plus extraction manifests in the archive's existing `_AUTO_EXTRACTED_TEXT` / extractor-log system. Current status: the latest root pass found 153 root PDFs, produced 152 extracts, and failed only on empty `FINAL_CLOSURE.pdf`; that pass was explicitly nonrecursive, so nested PDF coverage is not yet established. I have not launched the recursive pass myself.
- **Solver/geometric formalization programme:** UI/TX, Whirligig/Donut, Spheres, Gendarme Graticule, solver-vs-conventional verification, and the GR↔QM Whirligig replay. Intended output: a solver canon, verification ledger, and eventually precise manuals/configurable implementations. Current status: substantial prior reconstruction/planning exists, but this lane is paused at the roster boundary and should not outrun Janus/Ravel assignment.

**Know / have access to:**  
- **A. Actually loaded / substantially read:** the 2026-09-12 roster memo; `WORKSPACES/COMMON/INITIAL_PROTOCOL_PACKET.md`; current `CHECKINS.md` and `COORDINATION.md`; the HsH public `README.md`; the archive annotated survey and derivation-index material used in this curation pass; `THE FUNDAMENTAL INTUITIONS — EXTENDED`; `THE LOGIC OF SAT`; `FULL_THEORY`; `SAT CORE`; `MINKOWSKI PROPER`; `Relativistic–Quantum Isomorphism (nolat)`; `ST-QM-GR-SM (nolat)`; `SAT PRE-H(s)H TIGHTENING`; `H(s)H REWORK`; current H(s)H synthesis/source-survey material used to distinguish current from historical sources; and the root-PDF extraction manifest/log. In prior direct work I also substantially reconstructed the UI/TX, Whirligig, Spheres, torus/Gendarme geometry and solver-use history from conversation/archive material.
- **B. Known/indexed/accessible but not substantially read:** much of the expanded `LIBRARY.md` long tail; most nested PDFs and many raw historical conversations; large parts of SAT-O/4DHH/sector-paper material; the private `HSH_RESOURCES` paper corpus; and NotebookLM source/output history not yet exported/recovered into a complete solver provenance record. The fact that a file is linked or indexed does not mean I have read or validated it.
- **C. Current tools/access:** read/write GitHub connector access to project repositories; conversation/Library file tools; public web research; Python/container runtimes; document/PDF/spreadsheet artifact tooling; image generation; and the ability to inspect/create GitHub workflow definitions. I can use repository text/extraction/index artifacts directly and can create/update public-repo text surfaces when assigned.
- **D. Capabilities/limitations:** GPT-5.6 Sol. Strongest fit is literal geometric formalization, solver archaeology, invariant/symmetry bookkeeping, adversarial reconstruction of a claimed derivation, and turning messy archive material into explicit state/operator/constraint specifications. I can computationally check many equations and procedures, but I am not a substitute for independent specialist human mathematical review. I do not have live access to other instances' private conversational state; cross-instance facts must come from Common, repo artifacts, supplied exports, or recoverable archives.

**Created already:**  
- `Public HsH front-page research-status/library/vetting structure — Satobloc/HsH/README.md — public/editorial/generated — makes the research-status disclaimer prominent, adds read-theory links, curated library entries, grey→blue→green→red review-progress panels, and an expanded-library bridge. No theory authority; document descriptions/statuses are curation metadata subject to revision.`
- `Expanded SAT/H(s)H library — Satobloc/HsH/LIBRARY.md — public/generated discovery surface — links the additional document batches Nathan supplied, deduplicated globally and marked queued pending actual curation/vetting. No theory authority.`
- `Featured-paper rotator — Satobloc/HsH/.github/workflows/rotate-featured.yml — operational automation — anything placed in NEW_PAPERS/SEPTEMER_2026 is listed in the top FEATURED block; one item is randomly spotlighted on folder changes and daily. Operational only; placement does not imply vetting or theory promotion.`
- `Meridian/Emeritus solver-symmetry coordination plan — Satobloc/HsH/LIVE CONVOS/MERIDIAN_EMERITUS_SOLVER_SYMMETRY_PLAN_2026-09-07.md — workspace/coordination artifact — sets reconstruction/audit tasks for UI/TX, Whirligig, Spheres and Gendarme, including the GR↔QM replay and later common solver API/verification harness. No theory authority.`
- `Solver-adjacent literature notes and extensive solver reconstruction — conversation-level, not promoted to a durable theory surface — generated/working material — useful for methodology and source recovery, but see mixed-lane flag below.`
- I have not edited the Dashboard, synthesis, prediction ledger, finite-core ledger, or checkpoints as part of the current library/front-page work.

**Planning to create:**  
- `Recursive/missing-only PDF extraction coverage record — intended destination: SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT manifests/logs plus a concise missing/low-text inventory — purpose: make every relevant PDF searchable without duplicating successful extracts. Dependencies: Janus/archive-lane ownership decision and use of the existing extraction workflow. Possible overlap: archive-accessibility/provenance workers.`
- `Curated document-role + derivation-link pass — intended destination: README.md / LIBRARY.md and, if needed, a separate library metadata ledger — purpose: connect each showcased paper to its derivation attempts and distinguish conceptual fidelity, derivation presence/completeness, LLM/computational review, human review, and formal verification. Dependencies: archive recovery and Ravel/Nathan clarification only where intended meaning is ambiguous. Overlap: Morrow/integration and archive/provenance lanes.`
- `Solver Canon + Verification Ledger — intended destination TBD under a dedicated solver/geometry workspace after roster assignment — purpose: exact primitives, operators, couplings, free DOF, invariants, outputs, failure conditions, provenance, and standard-method comparisons for UI/TX, Whirligig, Spheres, and Gendarme. Dependencies: original solver conversations/NotebookLM records, benchmark questions, and lane ownership. Likely unique Meridian fit but overlaps geometry/covariance review.`
- `Whirligig GR↔QM verification packet — intended destination same solver workspace — purpose: reconstruct the original process before repair, independently recompute the claimed relation conventionally, and classify the result as isomorphism/restricted equivalence/analogy/underdetermined/failed. Dependencies: exact original Whirligig artifacts and preferably the source conversation.`

**Provenance of current work:**  
- **A. Nathan / SAT / H(s)H internal sources:** all public-library selection, conceptual descriptions, solver goals, torus/Gendarme definitions, UI/Whirligig/Spheres reconstruction, and document-role judgments originate from Nathan's directions plus the SAT/H(s)H repositories/conversation record. Nathan's intended meaning controls where historical wording is ambiguous.
- **B. Standard mathematics:** solver work uses ordinary differential geometry of curves/surfaces, embedded ring-torus geometry, local frames, curvature/torsion, reflection/even-odd decomposition, holonomy/transport distinctions, Jacobian/singular-value reasoning, symmetry and dimensional checks. These are tools for stating/checking the internal constructions; they are not imported external physical theories.
- **C. External empirical data / measurements / constraints:** none are dependencies of the current README/LIBRARY/FEATURED artifacts or of the solver canon plan.
- **D. External papers / theories / models / equations / assumptions:** an earlier adjacent-methodology scan in this instance examined recent work on symmetry-reduced/physics-informed solvers, geometric numerical methods, topological analysis, and LLM representation geometry. That material was used only to learn neighboring terminology/methodology and compare solver-design questions; it was not deliberately imported as H(s)H physics. Because recent-literature scanning and internal solver-design discussion coexisted in that period, theory-bearing solver-methodology conclusions from that mixed conversation context are provisionally quarantined until provenance is separated. The current public library/front-page artifacts do **not** depend on that external literature.
- **E. Generated inference / reconstruction:** ranking papers as outsider-facing vs formalization-oriented; drafting short public annotations; designing the review-status grammar; inferring provisional solver purposes from historical uses; and proposing common solver schemas/verification harnesses are generated reconstructions and remain revisable.
- **F. Speculative / unresolved:** exact coupling among UI rotation/expansion and helix curvature/torsion; exact Whirligig mechanics and whether the GR↔QM result qualifies as an isomorphism; minimal Gendarme algebra; full independent uses of Spheres; which formal papers will survive derivation-level audit; and whether any solver composition is mathematically natural rather than merely visually compatible.

**Overlap / role-bleed / contamination risk:**  
- Current public-facing work overlaps **Janus** on front-page architecture/coordination and **Morrow** on source integration/document-role classification; this is useful if Janus owns layout/routing and Morrow owns theory-state integration while Meridian owns public library curation plus solver formalization unless reassigned.
- Solver work overlaps Ravel at the theory-acceptance boundary and any geometry/covariance lane at the invariant/representation boundary. Meridian should derive/check machinery, not unilaterally promote physical interpretation.
- **MIXED-LANE FLAG:** this instance previously did both recent adjacent-literature scanning and internal solver-design/formalization discussion. No durable current-theory surface was knowingly promoted from that mixture. Conversation-level theory-bearing solver-methodology conclusions created under that mixed condition should be treated as provisionally quarantined. The durable `MERIDIAN_EMERITUS_SOLVER_SYMMETRY_PLAN_2026-09-07.md` is primarily internal-source reconstruction/verification planning; if Janus determines it was created inside the mixed assignment window, quarantine it for provenance review rather than deleting it.
- The README/LIBRARY/FEATURED changes are editorial/archive-accessibility/operational artifacts, not forward theory outputs, and have no external-theory dependency.

**Blockers / inputs needed:**  
- Janus decision on whether Meridian's tightened lane is primarily geometry/solvers, public library/archive accessibility, or a split with one clearly subordinate to the other.
- For the library: recursive PDF extraction/inventory coverage and continued linking of the documents Nathan wants exposed before we weed/classify.
- For solver archaeology: original UI, Whirligig, Spheres, and finite-core/nested-superhelix conversations that are not yet in clean raw form; NotebookLM prompts/outputs for the Whirligig successes and abuses; exact code/artifacts tied to those uses.
- Ravel/Janus benchmark and promotion boundaries for solver verification; eventually independent human specialists for genuine mathematical vetting, though lack of that review is not a blocker to honest curation/reconstruction.

**Suggested next task:**  
- **Immediate:** finish the link-first public library/archive-accessibility pass Nathan is actively directing, including a recursive missing-PDF-text inventory so the library can be searched comprehensively before we weed it.
- **Best longer-term Meridian job:** return to the solver/geometric-formalization lane under the new Common protocol and build the Solver Canon + Verification Ledger from firsthand artifacts, beginning with the Whirligig GR↔QM replay and clean Gendarme specification.
- Better assigned elsewhere: forward theory acceptance/rejection to Ravel/Nathan; synthesis promotion to Morrow/Ravel/Janus; current external-literature scanning to Hale/external-evidence; empirical statistics to Calder; overall routing/automation supervision to Janus.

**Coordination note:**  
- The public front page now has an operational rule worth preserving: **anything placed in `NEW_PAPERS/SEPTEMER_2026` automatically appears in the top FEATURED section, with one random rotating spotlight; FEATURED placement is not a vetting or theory-authority signal.** Also, the main archive's successful 153-file PDF pass was root-only, not recursive, so we should not yet say that every archive PDF has a text extract.
