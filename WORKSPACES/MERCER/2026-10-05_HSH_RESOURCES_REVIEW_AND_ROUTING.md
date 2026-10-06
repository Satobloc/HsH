# Mercer Resource Review — HSH_RESOURCES + BigBook routing

**Date:** 2026-10-05
**Status:** ACTIVE RESOURCE MAP / NON-THEORY
**Role:** Mercer
**Purpose:** record what was actually reviewed from Nathan's 2026-10-05 all-worker resource packet and how Mercer should use it without collapsing source-role or quarantine boundaries.

## Core authority rule

HSH_RESOURCES is a **methods/resources/supporting repository**, not a theory-authority surface.

Use the chain:

**standard result / source -> deliberate imported tool or constraint -> H(s)H-specific construction**

Do not silently convert similarity, inclusion, recency, machine tagging, or review status into theory authority, genealogy, or priority.

Public theory/provenance authority remains routed through HsH and SAT_THEORY_ARCHIVE_2023-25. HSH_RESOURCES paths are internal retrieval aids, not public citation substitutes.

---

## Immediate-use lanes

### 1. SAT26 BIGBOOK index
Archive paths:
- `.[⚙️_AI_FILES]/INDEXES/SAT26_BIGBOOK_INDEX_2026-10-05.md`
- `.[⚙️_AI_FILES]/INDEXES/SAT26_BIGBOOK_DOCUMENT_INDEX.csv`

The indexed source is:
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[SAT26_BIGBOOK]]].txt`

Verified index summary:
- 183,659 raw lines
- 134 embedded source documents
- index is routing, not theory authority
- explicit topic routing exists for 4D geometry/worldtubes, UI/scale-rotation, superhelix, holonomy, braid/topology, gravity/electrogravity, EM/gauge, Interbraid/QCD, timesheet/expansion, metric emergence, mass/inertia, precision/constants, quantum/QFT, nuclear, neutrino/photon, Kerr/ER, cosmology/dark sector, solvers, falsification, methodology, and standard-physics/string mapping.
- `PRECISION SCALING` occurs repeatedly and is no longer effectively buried.

Mercer rule: use the index to select an old-SAT quarry document, then read a substantial contiguous source span before importing or rejecting any construction.

### 2. H(s)H Toolkit
Router:
`indexes/ai_source_index/HSH_TOOLKIT.md`

Toolkit digestion:
`info/TOOLKIT_DIGESTION.md`

Catalog:
- 299 bibliographic records across the main toolkit + GR reference + MIT string-theory sublibrary.
- physical directory contains more files because duplicates/supporting artifacts are preserved.

High-value Mercer families:
- differential / Lorentzian geometry
- curves, framed curves, ribbons, rods, elastica, worldlines/worldtubes
- topology, knots, braids, anyons
- gauge theory, connections, holonomy, geometric phase
- Clifford algebras, spinors, Dirac machinery
- causal structure, foliations, signature change
- dynamical systems, bifurcation, waves, defects, solitons
- continuum mechanics, elasticity, effective media
- numerical / formal methods
- GR references and string/branes/higher-dimensional comparison

Mercer rule: form the H(s)H construction internally first. Then retrieve toolkit machinery by the problem it solves. Record whether the source is standard definition, technique, comparison, empirical constraint, deliberate import, or background.

### 3. Executable archive tools
`tools/`

Immediately useful:
- `arxiv_sat_scanner.py` — broad structural literature discovery; score means inspect, not support.
- `audit_accessibility.py` — distinguishes file visibility from actual text accessibility.
- `extract_papers.py` — deterministic page-marked PDF extraction; source-safe; PRIOR_ART pruned.
- `extract_image_text.py` — second-stage OCR for image-only material.
- `index_papers.py` — deterministic structural catalog; does not assign scientific relevance.
- `build_analytics_store.py` — normalized/rebuildable analytics SQLite layer.
- `build_cross_repo_podcast_guide.py` — cross-repo podcast provenance/index extraction.
- `build_diffusion_inventory.py` — neutral exposure/research inventory with PRIOR_ART excluded.
- `validate_site_bundle.py` — presentation bundle sanity check.
- `workflow_switchboard_demo.py` and `workflow_threading_demo.py` — control-plane prototypes, not theory engines.

Rule: inspect tools before reinventing equivalent machinery.

### 4. Data
`DATA/`

Current data pool includes CERN e–mu material, DESI release/spectral materials, SPARCL examples, LIGO/Virgo mass material, and related release notes.

Mercer rule: when a sandbox prediction reaches an empirical discriminator, look here before asking Nathan to import data. If needed evidence is absent, explicitly escalate the missing-data requirement rather than fill it with a remembered number.

### 5. Three-repository source inventory
`SOURCE_INVENTORY/SABLE/source_inventory_run/`

Latest reviewed summary:
- execution surface: GitHub Actions
- 13,224 files total across three repos
- 9,718 text
- 2,026 PDF
- 985 image
- 495 other
- repository counts: GLASS 4,865; HSH 4,384; RESOURCES 3,975
- PRIOR_ART was pruned before descent and not opened/hashed/sampled/indexed.
- run completed successfully 2026-10-06 UTC.

This is excellent for coverage questions and random/stratified sampling. Absence from an incomplete index must never be reported as nonexistence.

---

## Standard / historical reference lanes

### Einstein primary sources
Reviewed:
- `EINSTEIN - Über die spezielle und die allgemeine Relativitätstheorie.txt`
  - Project Gutenberg transcription of Einstein's 1917 popular exposition.
  - Useful for Einstein's own conceptual/geometric exposition and historical wording.
  - Not the best source for every equation-level priority claim.

- `EINSTEIN+MINKOWSKI — PRINCIP RELAT.txt`
  - Project Gutenberg text of *The Principle of Relativity*.
  - Contains Einstein 1905, Minkowski's relativity paper + appendix, Einstein 1916, with historical introduction.
  - High-value primary-reference lane for checking what Minkowski/Einstein actually state before making an ancestry or “literal 4D” comparison.

### HISTORICAL/
Contains Hinton, Hilbert, Bohr, Flatland, Whitehead, Babbage, Franklin, Lyell, early 4D expositions and related historical sources.

Use: ancestry, conceptual vocabulary, independent historical reconstruction.
Do not: promote historical resemblance into influence without chronology/access evidence.

### KERR/
Dedicated technical Kerr/black-hole source set.

Use: only after an internal Kerr/ER construction exists, for exact metric/geometry constraints, comparison, and literature citation. Resolve bibliographic identity/page anchors through the source indexes before public use.

---

## Current-literature / external comparison lanes

### LIVE_RESEARCH_UPDATES/
Contains current retained/rejected scan material and an hourly scan-rotation ledger.

Important discipline already present:
- close convergence is not equivalence;
- later publication does not imply SAT influence;
- no transmission is inferred without evidence;
- retained items can be useful machinery even when they do not support SAT/H(s)H.

Use after internal construction for comparison, machinery, and constraint checking.

### OUTSIDE RESEARCH LIBRARY/
Current sublibraries include:
- KELVIN
- HUBBLE
- BACKREACTION
- BLACK HOLES+
- CONTEMPORARY RESEARCH
- MISC
- PULSAR GLITCH
- SCIENCE NEWS
- STRINGS+

Mercer high-value order for current remit:
1. KELVIN
2. BACKREACTION
3. BLACK HOLES+/KERR
4. PULSAR GLITCH
5. HUBBLE
6. STRINGS+
7. CONTEMPORARY RESEARCH
8. MISC only as bounded comparison/negative-control lane.

Do not use filename proximity or “looks SAT-ish” as evidentiary support.

---

## PRIOR_ART quarantine

Reviewed:
- `info/PRIOR_ART_COMPARISON_PROTOCOL.md`
- `PRIOR_ART/MIRA/README.md`
- `PRIOR_ART/WORKSPACES/CROSS/START_HERE.md`

Current rule is explicit:
- PRIOR_ART is quarantine-bound.
- nLab/Hypothesis-H material remains hard-quarantined for prior-art/citation work.
- Cross is factual-record/provenance/chronology first.
- similarity alone never establishes influence.
- pre-2026-09-09 SAT/H(s)H material is treated as pre-exposure to Nathan's recorded nLab/Hypothesis-H discovery unless a more specific source establishes earlier contact.

Mercer use:
- **not** an endogenous idea source.
- may be consulted only after an independent H(s)H construction exists and only for prior-art/comparison/constraint purposes.
- if used, reconstruct external framework in its own vocabulary before comparing to SAT/H(s)H.

The declaration's “use everything” instruction does not erase this quarantine. The quarantine documents are more specific about source-role boundaries.

---

## Exposure / provenance lanes

### Podcast guide
`EXPOSURE_STATS/PODCAST_GUIDE/`

This is already a strong machine-readable provenance surface:
- SOURCE_INVENTORY.csv
- EPISODES.json / EPISODES.csv
- EPISODE_GUIDE.md
- ANALYTICS_INVENTORY.csv
- MANIFEST.json
- normalized transcript text
- timestamp-preserving cue JSONL

Raw transcript remains canonical. Podcast material establishes what was publicly said/framed, not automatic canonical theory truth.

Immediate use:
- first-public-mention checks
- wording/date provenance
- concept-history reconstruction
- public-disclosure chronology

### EXPOSURE_STATS/PODCAST_EPs/
Contains cross-transcript keyword index/matrix/hits and key SAT/Field Notes transcript material.

### arXiv longitudinal/random controls
`EXPOSURE_STATS/arXiv_analysis/LONGITUDINAL_TOPIC_ATLAS/`
and
`EXPOSURE_STATS/arXiv_analysis/2026-09-13_RANDOM_100x3_JAN_SEP/`

Use:
- field-frequency / trend calibration
- blind structural-prevalence controls
- avoiding a “everything looks like SAT because we only searched SAT-like terms” failure.

Do not use:
- as novelty proof by themselves.

### SAT_IMPACT / EXP_ANALYSIS / GitHubStats / podcast analytics
Use for exposure/provenance questions and public-history arguments, not theory validation.

### MISC_PAPERS
The declaration itself warns that much is fringe/bunk.

Use only for:
- existence mapping
- negative controls
- fringe/parallel-development studies
- bounded comparison when specifically relevant.

Never use as standard-physics authority without independent source validation.

---

## HQ / workflow

Reviewed:
- `HQ/README.md`
- `HQ/TOOL_CHEST.md`
- `HQ/THE_WAR_ROOM/DECLARATION.txt`

HQ is operational, not theory authority.

Rooms:
- WAR: adversarial proposition testing
- PEACE: collaboration doctrine
- NATHAN_DESK: sparse decision/review surface
- THE_PILE: useful but non-desk material
- REQUEST_PIPELINE: plugins/apps/skills/services/automation
- OUTREACH_PIPELINE: site/podcast/social/science-communication candidates

For Mercer:
- theory construction stays sandboxed;
- failed branches remain information;
- promotion requires a gate;
- source/quarantine/exposure boundaries survive workflow routing.

---

## Preferences / behavior

Reviewed:
- `info/NATHAN_PREFERENCES/BOOT.md`
- directory map under `info/NATHAN_PREFERENCES/`

Relevant categories for Mercer work:
- CORE
- REPOS_FILES
- EPISTEMICS
- RUNTIME_MANIFEST
- REFERENT_RESOLUTION when Nathan says new/latest/current
- AUTOMATION_COORDINATION when coordinating recurring workers

Preference layer never changes source authority, quarantine status, factual truth, or actual tool capability.

---

## Paper / public-writing machinery

`PDF_SPECS/`
contains RevTeX 4.2 / APS style documentation and LaTeX references.

`PDF_SPECS/NATHAN_VOICE_MODEL/`
contains public/nonfiction/peer-review/creative/provenance voice models plus site router.

Use:
- peer-review model for scientific claim/derivation/limitation prose;
- nonfiction for method/provenance/control;
- public-web storytelling for human orientation;
- no voice rewrite for primary-source material.

Do not blend voice modes into a mush or let tone change claim strength.

---

## Citation discipline

Reviewed:
`info/CITATION_PIPELINE.md`

For a public scientific statement:
1. identify exact proposition;
2. retrieve candidate source;
3. inspect exact page/section support;
4. verify bibliographic identity;
5. use original-source citation / quotation / sourced summary.

Keyword match is never enough.
HSH_RESOURCES path/hash may be retained internally for recovery but is not the public citation.

---

## Stale / broken routes found

The War Room declaration links to:
`HSH_RESOURCES/tree/main/derivedvv`

That path is not present. The live repository has:
`derived/`

Treat `derivedvv` as a stale/typo route unless a historical branch proves otherwise.

The declaration also contains a GitHub URL truncated in plain-text extraction around `H(s)H_Toolkit`; the direct user-supplied toolkit URL is valid and controls.

---

## Mercer operating change after this review

For each autonomous sandbox run:

1. **Internal quarry first**
   - one substantial SAT archive source, preferably routed through BigBook/index when useful;
   - one substantial current HsH source, favoring September-30 material.

2. **Independent construction**
   - derive/test without external framework steering.

3. **Formalism lookup**
   - if the construction needs known machinery, use H(s)H Toolkit by problem/function.

4. **Empirical/data lookup**
   - use DATA or externally sourced empirical records when the candidate produces a measurable discriminator.

5. **External comparison**
   - current literature / PRIOR_ART only after the internal construction exists.
   - preserve quarantine and chronology.

6. **Citation**
   - exact proposition -> exact supporting source/page.

7. **Checkpoint**
   - record source paths, what was actually read, inference boundary, new conjecture, failure condition, and solver/experiment.

This review changes retrieval efficiency and evidentiary discipline. It does not itself promote any new physical claim.

— Mercer
