# Team machine draft — Sable

Status: design workspace; tentative; no theory authority.

Purpose: model the project as a knowledge/analysis machine whose human/manual instances, recurring automated workers, tools, corpora, scripts, and consultancy roles are explicit modules with scoped inputs/outputs and tested competencies.

## Core notation

- `mX` = manual/conversational instance or human-facing role.
- `aX` = recurring automated worker.
- `cX` = consultant/specialist invoked on demand.
- `[LoadedDocs | Experience | Stats | Tools]` = evidence-backed capability capsule, never a claim of total knowledge.
- `Mc` = composite team machine.
- `mcN` = scoped module of Mc with tailored input corpus, tools, prompts, outputs, tests, and interface contract.

## Preliminary core team

### [0] mNATHAN — originator / authority interface
`[LoadedDocs: project-wide lived context, source corpus origin | Experience: SAT/H(s)H originator, science/education background, archive history | Stats: unique source-of-intent and approval authority; limited attention bandwidth | Tools: direct correction, visual/intuitive modeling, source recall]`

Best leverage:
- high-information corrections and disambiguation;
- intent/current-priority decisions;
- approval/signature/promotion;
- role and methodology co-design;
- selecting ambiguity that actually deserves human attention.

Do not use Nathan as a routine message router, manual search engine, or replacement for deterministic extraction.

### [1] mSABLE — systems analysis / capability architecture
`[LoadedDocs: current Common control/roster/checkpoints; Preplantricist_role; HsH_Pipeline_Design; Nathan Direct state; automation roster; selected tooling inventories; selected synthesis/full-theory surfaces | Experience: current workflow archaeology, scavenger-hunt contextual search, provenance/tagging failure analysis, meeting prep | Stats: no recurring automation; current mission is system understanding/testing | Tools: GitHub, Python/runtime where appropriate, Wolfram benchmark, web/research connectors]`

Best leverage:
- team capability map and targeted questioning;
- system-state / bottleneck analysis;
- automation-yield metrics and experiments;
- script/tool integration design and checksums;
- source-sampling/triage architecture;
- reconstruction strategy experiments;
- meeting input, not permanent coordination by default.

### [2] aNATHAN_WORDS — Nathan Direct provenance/package worker
`[LoadedDocs: Nathan-only package, Stage-2 queues, raw source windows and ledgers | Experience: 14,306 unique packaged Nathan/user messages; duplicate collapse and branch-aware context | Stats: Stage 1 DONE, Stage 2 active | Tools: package_nathan_direct, autotag v1-v3, Stage-2 queue builder, raw extraction]`

Best leverage:
- exact Nathan-word retrieval;
- provenance-safe correction/definition/decision queues;
- chronology, adjacency and earliest-use candidate support;
- no bulk re-extraction unless a gap is demonstrated.

### [3] aTAG_CORPUS — broad cumulative tagging worker
`[LoadedDocs: corpus/tagging policy/current regions as reported by worker | Experience: systematic cumulative tagging | Stats: completion/yield pending direct meeting report | Tools: tagging vocabulary, raw metadata, Common coordination]`

Best leverage:
- broad, additive semantic/index tagging;
- discovering new tag families;
- keeping retrieval substrate current;
- not making semantic verdicts from tags alone.

### [4] aMERCER — source-integrity / retrieval QA worker
`[LoadedDocs: Viewer/catalog machinery, glossary/crosswalk source inventory, Common documentation convention, scanner defect, provenance surfaces | Experience: 22+ bounded runs; training complete | Stats: sustained state-changing QA with several branches correctly closed | Tools: GitHub/raw extraction/index inspection/comparator and documentation QA]`

Best leverage:
- retrieval/index QA;
- source-path/catalog reconciliation;
- provenance/source ancestry when defensible;
- deterministic pipeline verification;
- documentation/navigation checks.

### [5] aMERIDIAN — trained source-first geometry/solver worker
`[LoadedDocs: Fundamental Intuitions Extended FULL; 4D Thinking Primer FULL; H(s)H TIME RESIDUALS FULL; Common training surfaces | Experience: 4D/category training; source-first solver remit | Stats: training complete; much later automation blocked/no-op under standdown | Tools: source reading, geometry/solver reconstruction, public-library/accessibility work]`

Best leverage:
- source-first geometry/solver reconstruction after release;
- 4D/category error checks;
- benchmark for training transfer;
- should not remain hourly merely to poll unchanged gates.

## Consultation team

### [6] cMORROW — continuity / source identity consultant
`[LoadedDocs: Janus/Morrow/Aldus export comparisons; raw conversation branch identity; continuity/capability audits | Experience: useful routing/source-identity investigations | Stats: recurring automation retired due Work-mode limitations | Tools: high-context historical continuity analysis]`

Best leverage:
- difficult conversation-family identity;
- continuity/source-routing anomalies;
- historical instance/capability interpretation;
- bounded specialist consultation, not recurring scheduler.

### [7] cALDUS — role pending direct Nathan/Aldus design
`[LoadedDocs/Experience/Stats: to be supplied by Aldus; model currently described by Nathan as GPT-6 Astra Light and highest-functioning available instance | Tools: pending direct report]`

Possible leverage hypothesis only: high-level theoretical review / ombudsman / difficult integrative critique. No official authority or remit until Nathan and Aldus decide it.

### [8] cPRIOR_ART — dedicated quarantined consultant
`[LoadedDocs: PRIOR_ART only within dedicated controlled process | Experience/Stats/Tools: to be designed with Nathan]`

Best leverage:
- inspect quarantined external antecedents;
- produce blind-numbered citation outputs under dedicated protocol;
- prevent accidental plagiarism contamination of forward construction.

## Candidate new modules / workers

### [9] aRECON-A — independent source-first SAT reconstruction
Input: verified Nathan Direct + explicitly selected primary SAT source packet + Fundamental Intuitions; no cross-reading of competing reconstruction until freeze.
Output: paper-structured SAT reconstruction + dependency graph + unknowns + source citations.
Test: blind comparison with Nathan-approved reference points and independent reconstructions.

### [10] aRECON-B — independent latest-to-oldest reconstruction
Input: newest approved/near-current primary sources, then backward source ancestry/version comparisons.
Output: current-state candidate plus explicit older components retained/rejected/uncertain.
Test: compare against aRECON-A; disagreements routed to source check, not averaged away.

### [11] aMATH-QA — Lagrangian/equation triage
Input: normalized equation records with source/provenance and declared assumptions.
Output: type/dimension checks, Euler-Lagrange equations, Hessian/constraint checks, algebraic equivalence, limiting behavior, simple numerical sanity checks, dependency graph, NOT a physics-validity verdict.
Tools: existing `tools/equation_pipeline.py`, SymPy/Python, Wolfram benchmark, later Lean where useful.

### [12] aSAMPLER-QA — resource extraction/checksum/coverage sampler
Input: repo manifests, raw exports, PDF/image extraction outputs, indexes.
Output: coverage matrix; hash/duplicate map; extraction-quality random samples; missingness/outlier queue; content-type classifier; stratified sample packets.
Tools: existing index/extraction scripts plus small new deterministic scripts.

## Interfaces / flow sketch

```text
[m0 Nathan]
   | high-information decisions/corrections
   v
[m1 Sable systems map] ---> [Common control / future coordinator]
   |                         |
   | module design           +--> [a2 NathanWords]
   |                             [a3 TagCorpus]
   |                             [a4 Mercer]
   |                             [a5 Meridian]
   |
   +--> [mc-source] = [a12 sampler] -> curated/source-typed packets
   +--> [mc-recon]  = [a9 Recon-A] || [a10 Recon-B] -> compare/falsify
   +--> [mc-math]   = [a11 Math-QA] -> equation/Lagrangian check reports
   +--> consultants: [c6 Morrow], [c7 Aldus], [c8 PriorArt]
```

## Machine design principles

1. **Context injection at point of use.** Do not preload every worker with everything. Inject the smallest source packet and skill card needed for the task, with pointers to expand.
2. **Resource provenance travels with content.** Every extracted claim/equation should retain source path, hash/ID, coverage level, author status, date, and adjacency where relevant.
3. **Independent reconstruction before convergence.** At least two deliberately different approaches should freeze first passes before comparison.
4. **Scripts do deterministic work; instances do interpretive work.** Counting, hashing, extraction, deduplication, sampling, equation parsing, and coverage should be scripted where possible.
5. **Pass/fail tests are competency-specific.** A successful algebra test does not imply good physics; good source retrieval does not imply SAT fluency.
6. **Automation must earn its cadence.** Measure useful state change per cycle; use event/condition-driven or slower cadence for blocked lanes.
7. **Exploration is a resource.** Allocate bounded divergent exploration/personal-development quanta to reduce path dependence and grow contextual awareness.
8. **Consultants are invoked where their unusual context/model strength is highest leverage.** Do not waste expensive/limited instances on repetitive maintenance.

## Immediate questions to resolve by evidence

- Do we already have one or more nearly complete SAT theory documents whose main need is verification/source cleanup rather than reconstruction?
- Which mathematical kernels recur independently across SAT-O, 4DHH, Blockwave/Satobloc, and H(s)H?
- Which later formulations are genuine replacements, and which are translations/reframings of older constructions?
- Can the geometric solver family reconstruct or discriminate core equations from first principles, or are they primarily visualization/metrology aids?
- Can a normalized Lagrangian triage procedure quickly separate malformed, redundant, conditionally valid, and genuinely high-value candidates?
- What are the minimal source packets needed for a competent worker to recover recognizable SAT without contamination from generated synthesis?
- How much divergence appears if two workers reconstruct independently from different source orderings?
- How much of the current gap is missing theory versus missing classification, mathematical proof, provenance, or team competence?
- Can we quantify source coverage enough to know when a reconstruction is probably missing an entire historical sector rather than merely a detail?
