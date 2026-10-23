# SAT/H(s)H Toolbox & Toolkit Router — 2026-10-23

**Status:** ACTIVE routing/index surface; not theory authority.  
**Purpose:** connect the toolbox containers, the SAT26 manifest, the complete Heavy Toolbox ingestion pass, the current HSH_RESOURCES literature catalog, and the live namespace/adoption ledger so workers can retrieve actual usable standard mathematics instead of treating “toolkit” as one undifferentiated blob.

**Identity rule:** the toolboxes/toolkits are **not SAT/H(s)H constructions or theory artifacts**. They are collections of standard mathematics / physics reference machinery assembled for consideration, comparison, and possible import. Project commentary, generated summaries, or SAT/H(s)H discussion that may occur inside a compiled packet does not change the identity of the toolbox itself.

## 1. Bottom line

The `[[SAT26 TOOLBOX]]/HsHtoolkit_manifest.csv` **does tell us what was packed into the five SAT26 toolkit compilation PDFs**, but it is **not a complete semantic index of the whole toolbox/toolkit ecosystem**.

Verified manifest coverage:
- **121 rows / 121 unique source paths**
- packed into:
  - `HsHtoolkit_1.pdf` — 34 source PDFs
  - `HsHtoolkit_2.pdf` — 31
  - `HsHtoolkit_3.pdf` — 30
  - `HsHtoolkit_4.pdf` — 21
  - `HsHtoolkit_5.pdf` — 5
- manifest SHA: `60078b8421f9b5eb722578a4337722f01292965c`

The manifest records source filename/path and page ranges inside each compiled PDF. It is therefore a **container manifest / source-discovery map**, not a functional index and not a review-status ledger.

It does **not** by itself:
- index the full contents of `H(s)H HEAVY TOOLBOX.txt`;
- tell which mathematical object in a source is useful;
- state whether the source was actually read;
- distinguish standard mathematics from SAT/H(s)H interpretation;
- reflect later BEDROCK corrections;
- cover all current `HSH_RESOURCES/H(s)H_Toolkit/` material.

## 1A. Text extraction status

Verified 2026-10-23:

- HSH_RESOURCES maintains the canonical PDF-text extraction layer in `derived/text/`, with source-to-text mappings in `derived/manifests/extraction.jsonl`.
- The extraction manifest currently contains **1,183 records** overall.
- **314 records** point into `H(s)H_Toolkit/`, and all 314 observed records are marked `status: extracted`.
- Most importantly for the historical SAT26 toolkit manifest: **all 121 / 121 source PDFs listed in `HsHtoolkit_manifest.csv` match by basename to extracted HSH_RESOURCES toolkit sources with a derived text path.**

Therefore **do not create a new bulk text-extraction document for the SAT26 toolkit sources**. Use the existing extraction manifest + `derived/text/` files and Mersearch. Only create a new extraction artifact if a specific source is demonstrably missing or unreadable after checking the existing extraction routes.

The old SAT archive also has a substantial `_AUTO_EXTRACTED_TEXT/` corpus for project PDFs and other binary artifacts. Treat that as an extraction/search surface, not as a separate source authority.

## 2. Existing work already covering the gaps

### A. Heavy Toolbox sequential ingestion already exists

The Heavy Toolbox is a compiled **reference/mathematics resource**, not an H(s)H construction. The ingestion ledger is a semantic reading/index of that reference packet and any attached discussion, not evidence that the imported mathematics originated inside SAT/H(s)H.

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/INGESTION_LEDGER.md` contains a **complete sequential pass** of `H(s)H HEAVY TOOLBOX(1).txt`, recorded as **175,625 words**.

It identifies the Heavy Toolbox as a heterogeneous compilation rather than a single theory document and gives its topic order:

1. Clifford torus
2. Hopf fibration
3. four-dimensional Euclidean space
4. SO(4) rotations
5. relativity of simultaneity
6. hyperbolic orthogonality
7. Minkowski space
8. Cauchy-Schwarz
9. fiber/principal bundles
10. abelian groups
11. homology
12. complex projective space / Riemann sphere
13. SO(3)/SU(2), Lie algebras, BCH, spherical harmonics
14. Nash embedding
15. symplectic geometry
16. geometric-constraint material
17. fusion-ring documentation
18. AKSZ / symplectic material
19. extended cobordism / TQFT
20. functor extension
21. assembly theory + criticism
22. ensemble methods
23. unrelated Semantic Kernel / agent-framework block
24. machine-learning kernels
25. neuronal Spike Response Model
26. large SAT / NotebookLM conversation and generated-report archive

The same ledger also extracts reusable mathematical lessons, later Nathan corrections, failure patterns, and current guards. **This is the best existing semantic index of the Heavy Toolbox.**

### B. Current literature catalog already exists

`Satobloc/HSH_RESOURCES/indexes/ai_source_index/HSH_TOOLKIT.md` routes the present supporting library:
- **237 bibliographic records** in `H(s)H_Toolkit/`
- **2** in `H(s)H_Toolkit/REFERENCE — GR`
- **60** in `H(s)H_Toolkit/STRING THEORY (MIT)`
- **299 total** across those three toolkit directories

The 237-record main toolkit is therefore much larger than the 121-source historical SAT26 manifest.

Its associated `info/TOOLKIT_DIGESTION.md` already defines functional retrieval families and review-depth states:
`CATALOGED | TRIAGED | PARTIAL | FULL | CARD | TESTED`.

### C. Live object/adoption ledger already exists

`Satobloc/HsH/WORKSPACES/COMMON/terminology/TOOLBOX_NAMESPACE_LEDGER.md` is the live object-level gate.

Decision states:
`UNREVIEWED | CANDIDATE | ADOPT | ADAPT | DEFER | REJECT | HISTORICAL-ONLY`.

Current source-verified candidate tranche:
- `EXT:LIE:SO4`
- `EXT:DIFFGEO:FRENET_R4`
- `EXT:CONSTRAINT:BOUMA95`

This ledger should answer **“may we use this object, and under what meaning?”**, while the literature catalog answers **“where is the source?”**

## 3. Container map

### Historical compact router
`SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt`

Seven named families:
- 4D geometry
- filament kinematics
- topology/knot theory
- projection/coarse-graining
- regularization/scaling
- discrete/global topology
- statistical emergence

Use as a historical wish-list and vocabulary map, not authority.

### Historical large compilation
`SAT_THEORY_ARCHIVE_2023-25/H(s)H HEAVY TOOLBOX.txt`

Direct blob access proves this is large, not empty:
- blob `aa021ed7839bc6417035e3bd09fcdc4ed1bd1bb3`
- direct retrieval on 2026-10-23: **1,178,134 characters**

Use `INGESTION_LEDGER.md` first for orientation, then retrieve bounded passages from the blob/source when a specific tool is needed.

### Historical SAT26 toolbox package
`SAT_THEORY_ARCHIVE_2023-25/[[SAT26 TOOLBOX]]/`

Verified package:
- `H(s)H FIRST BUILD.txt`
- `H(s)H STRUCTURAL SKETCH.txt`
- `HsH SUGGESTIONS + RECCOMENDATIONS.txt`
- `HsHtoolkit_manifest.csv`
- `SAT to H(s)H TRANSITION.txt`
- `SAT26 MATH ROUNDUP.txt`
- `SAT26 THOUGHTS ROUNDUP.txt`
- `SAT26 VETTING TEMPLATE.txt`
- `THE SPHERES.txt`

### Current supporting literature
`HSH_RESOURCES/H(s)H_Toolkit/`

Use the human/AI catalog and extracted-text manifests rather than raw directory scanning.

## 4. Usable-piece map

This is the retrieval layer Janus and math workers should use first. It intentionally points to existing containers rather than duplicating all source records.

| Problem / tool family | Historical pointer | Current source/index pointer | Live status surface |
|---|---|---|---|
| 4D rotations / SO(4) | `H(s)H TOOLKIT.txt §1`; Heavy Toolbox SO(4) block | HSH Toolkit geometry/math records | `EXT:LIE:SO4` |
| R4 curve kinematics / Frenet | toolkit §2; SAT26 manifest | HSH Toolkit framed-curves/math records | `EXT:DIFFGEO:FRENET_R4` |
| Geometric constraints | toolkit §2; Bouma source in SAT26 manifest | HSH Toolkit constraint-solving records | `EXT:CONSTRAINT:BOUMA95` |
| Framed rods / variational mechanics | toolkit §2 | HSH Toolkit curves/rods/elastica + calculus-of-variations records | currently unreviewed/defer unless ledgered |
| Knot/link/braid topology | toolkit §3; Heavy Toolbox topology blocks | HSH Toolkit topology/braid records | defer until exact invariant/problem is typed |
| Symplectic / geometric phase | toolkit §4; Heavy Toolbox symplectic block | HSH Toolkit symplectic/holonomy records | candidate-by-problem, not blanket adopted |
| BV / AKSZ coarse-graining | toolkit §4; Heavy Toolbox AKSZ/BV material | HSH Toolkit QFT/geometric-formalism records | explicitly not “lossless” by default |
| PDE / regularization | toolkit §5 | HSH Toolkit PDE/analysis records | defer until exact equation requires it |
| Graph/discrete geometry | toolkit §6 | HSH Toolkit graph/topology records | historical claims require re-derivation |
| Cobordism/TQFT | toolkit §6; Heavy Toolbox cobordism blocks | HSH Toolkit topology/QFT records | structural tool only if exact object/map is defined |
| Invariant-preserving numerics | toolkit §6; SAT26 manifest DGC sources | HSH Toolkit numerical/formal-method records | candidate when tied to solver fixture |
| Ensemble/coarse-graining | toolkit §7; Heavy Toolbox ensemble block | HSH Toolkit statistical/continuum records | candidate; metric-signature claims specifically audited |
| Medium/continuum response | toolkit §7; Heavy Toolbox kernels/SRM blocks | HSH Toolkit continuum/effective-media records | relevant to OC-002, constitutive structure still open |
| Threshold/reset event modeling | Heavy Toolbox SRM block | HSH Toolkit dynamics/neural-event records | useful mathematical grammar; mechanism-neutral |

## 5. Retrieval protocol

For any toolbox-backed problem:

1. **Name the typed problem**, not the fashionable formalism.
2. Check this router for the relevant family.
3. Check `TOOLBOX_NAMESPACE_LEDGER.md` for an existing object ID/status.
4. Use `INGESTION_LEDGER.md` for Heavy Toolbox semantic context.
5. Use `HSH_TOOLKIT.md` / human source index to locate the underlying literature.
6. Read the actual source or extracted text at the level required.
7. Record review depth: `CATALOGED/TRIAGED/PARTIAL/FULL/CARD/TESTED`.
8. Cross-check symbols against the registry.
9. Test the object on one current explicit SAT/H(s)H fixture.
10. Only then move its decision state toward `ADOPT` or `ADAPT`.

## 6. Important correction to older project signage

Several older onboarding/search documents still say the Heavy Toolbox is empty because a normal reader returned blank. That interpretation is now disproved by direct blob retrieval and by the pre-existing complete sequential ingestion record.

Treat those older “empty” statements as stale retrieval diagnostics, not source facts.

## 7. What still needs building

A completely new giant index is **not** necessary. The pieces already exist.

What is still missing is a thin machine/human crosswalk that joins:
`manifest source filename -> HSH_RESOURCES bibliographic record -> functional family -> toolkit card/review depth -> namespace object ID -> current project test/use`.

That crosswalk should be grown incrementally as tools are actually used, not generated as a speculative 300-row ontology in advance.

**Recommended next implementation:** add crosswalk rows only when an object reaches `CANDIDATE` or is selected for a current calculation. This keeps the index operational rather than encyclopedic.
