# Toolbox Namespace / Adoption Ledger

**Status:** LIVE  
**Established:** 2026-09-21  
**Control:** `../TOOLBOX_INGESTION_NAMESPACE_PRIORITY.md`  
**Citation policy:** `../CITATION_AS_DEFAULT_POLICY.md`  
**Symbol control:** `../NONNEGOTIABLE_SYMBOL_MANAGEMENT.md` + `SYMBOL_REGISTRY.md`

This is an **object ledger**, not a list of things SAT/H(s)H endorses. Imported mathematics remains external mathematics unless and until an explicit project mapping is established.

Decision states:

`UNREVIEWED | CANDIDATE | ADOPT | ADAPT | DEFER | REJECT | HISTORICAL-ONLY`

Source status:

`VERIFIED | PARTIAL | SOURCE-UNRESOLVED | MISSING-HISTORICAL-ARTIFACT`

---

# Container records

## PROV:HSH-TKT — `H(s)H TOOLKIT.txt`

- **repo:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- **path:** `H(s)H TOOLKIT.txt`
- **observed_blob_sha:** `384b40a595d41daa4c573218022a0b802ad3deee`
- **source_status:** `VERIFIED` as project-provenance artifact
- **role:** historical project list pairing external mathematical machinery with proposed SAT/H(s)H jobs
- **warning:** the proposed job is project interpretation, not an external-source claim
- **microcite:** `⟦PROV:HSH-TKT·<section>⟧`

## PROV:HSH-HEAVY — `H(s)H HEAVY TOOLBOX.txt`

- **repo:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- **path:** `H(s)H HEAVY TOOLBOX.txt`
- **observed_blob_sha:** `aa021ed7839bc6417035e3bd09fcdc4ed1bd1bb3`
- **observed_content:** empty
- **source_status:** `MISSING-HISTORICAL-ARTIFACT`
- **decision:** do not infer or substitute content; recover genealogy/content if another source identifies it
- **microcite:** `⟦PROV:HSH-HEAVY⟧`

## PROV:SAT26-TBOX — `[[SAT26 TOOLBOX]]/`

- **repo:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- **path:** `[[SAT26 TOOLBOX]]/`
- **source_status:** `VERIFIED` as a multi-file project-provenance package
- **observed contents include:**
  - `H(s)H FIRST BUILD.txt`
  - `H(s)H STRUCTURAL SKETCH.txt`
  - `HsH SUGGESTIONS + RECCOMENDATIONS.txt`
  - `HsHtoolkit_manifest.csv`
  - `SAT to H(s)H TRANSITION.txt`
  - `SAT26 MATH ROUNDUP.txt`
  - `SAT26 THOUGHTS ROUNDUP.txt`
  - `SAT26 VETTING TEMPLATE.txt`
  - `THE SPHERES.txt`
- **manifest_role:** source-discovery map containing many original PDF filenames, including arXiv-numbered and named papers
- **warning:** manifest presence does not equal source inspection
- **microcite:** `⟦PROV:SAT26-TBOX·<file/locator>⟧`

---

# Source records — first verified tranche

## SRC:GLUCK1966

- **author:** Herman Gluck
- **title:** “Higher Curvatures of Curves in Euclidean Space”
- **venue:** *The American Mathematical Monthly* 73(7)
- **year:** 1966
- **pages:** 699–704
- **DOI:** `10.1080/00029890.1966.11970818`
- **alternate DOI/JSTOR resolver observed:** `10.2307/2313974`
- **source_status:** `VERIFIED`
- **use here:** authoritative historical source for higher curvatures/Frenet-type machinery in Euclidean n-space; a natural source anchor for the R4 specialization
- **microcite:** `⟦SRC:GLUCK1966·699–704⟧`

## SRC:BOUMA1995

- **authors:** William Bouma; Ioannis Fudos; Christoph M. Hoffmann; Jiazhen Cai; Robert Paige
- **title:** “Geometric Constraint Solver”
- **venue:** *Computer-Aided Design* 27(6)
- **year:** 1995
- **pages:** 487–501
- **DOI:** `10.1016/0010-4485(94)00013-4`
- **source_status:** `VERIFIED`
- **scope_note:** the reported solver is a **2D CAD geometric constraint solver** using a graph-reduction/directed-algebraic approach; it is not itself a 4D Hagalaz solver
- **historical-toolkit match:** `HsHtoolkit_manifest.csv` contains `Bouman-Computer_aided_Design-1995-Geometric_Constraint_Solver.pdf`
- **microcite:** `⟦SRC:BOUMA1995·487–501⟧`

## SRC:OSU-SO4

- **institutional_source:** Oregon State University course/book material, “The Geometry of SO(4)”
- **source_status:** `VERIFIED` for immediate standard-fact check; upgrade/augment with a standard Lie-group monograph when the implementation requires theorem-level citation
- **supported fact used here:** in n dimensions there are `n choose 2 = n(n−1)/2` coordinate rotation planes/generators; hence SO(4) has six coordinate-plane generators
- **microcite:** `⟦SRC:OSU-SO4·Ch6⟧`

---

# Object records — first active tranche

## EXT:LIE:SO4

- **canonical_name:** special orthogonal group SO(4)
- **namespace:** `EXT:LIE`
- **object_type:** Lie group / 4D Euclidean rotation group
- **standard_definition:** real `4×4` matrices `R` with `RᵀR=I`, `det R=1`
- **degrees_of_freedom:** 6
- **coordinate_plane_generators:** 6 (`4 choose 2`)
- **underlying_source:** `⟦SRC:OSU-SO4·Ch6⟧`
- **project_provenance:** toolbox section “Foundational 4D Geometry” `⟦PROV:HSH-TKT·§1⟧`
- **historical_project_claim:** toolbox says it is needed to manage six independent rotation planes in a 4D Euclidean manifold
- **current proposed job:** candidate common language for exact 4D rotation-plane transformations in Hagalaz/UI/Whirligig/related geometric solvers
- **critical distinction:** SO(4) is appropriate only to Euclidean 4D rotation structure; do not silently identify it with Lorentz-group / effective-Lorentzian transformations
- **symbol_collision_notes:** generator/angle symbols must be registered locally; do not inherit arbitrary `α,β,γ` labels
- **decision_state:** `CANDIDATE`
- **decision_rationale:** directly relevant to current 4D transformation unification, standard structure now source-identified, but exact Hagalaz interface/operator remains to be recovered/typed before adoption
- **next_test:** express each live solver's rotation operation in an explicit plane/generator representation and determine whether one SO(4) parameterization can serve as shared Euclidean transformation data without erasing solver-specific semantics

## EXT:DIFFGEO:FRENET_N / EXT:DIFFGEO:FRENET_R4

- **canonical_name:** higher-dimensional Frenet frame / higher curvatures of curves in Euclidean space; R4 specialization
- **namespace:** `EXT:DIFFGEO`
- **object_type:** moving frame + curvature invariants for sufficiently regular nondegenerate curves
- **R4_frame_names:** commonly tangent + principal normal + two further normal/binormal directions; naming varies by source
- **underlying_source:** `⟦SRC:GLUCK1966·699–704⟧`
- **project_provenance:** toolbox section “nth-Order Filament Kinematics” `⟦PROV:HSH-TKT·§2⟧`
- **historical_project_claim:** toolbox proposes the R4 frame/invariants as machinery for “hyper-torsion”
- **current proposed job:** candidate differential-geometric readout for curvature/twist/torsion information along exact solver-generated curves/worldtube centerlines
- **critical distinction:** Frenet data describe a curve under regularity/nondegeneracy assumptions; a finite worldtube/framed material cross-section may require a different or additional material frame (e.g. Bishop/Cosserat-type framing). Do not identify Frenet-frame torsion with material/worldtube twist by fiat.
- **symbol_collision_notes:** `κ`, `τ`, higher-curvature symbols and frame-vector names require namespace/ordering conventions before shared use
- **decision_state:** `CANDIDATE`
- **decision_rationale:** mathematically natural and likely useful as a solver-independent diagnostic, but may not be the correct primitive frame for finite-thickness H(s)H geometry
- **next_test:** compute R4 Frenet/higher-curvature diagnostics on one canonical Class-P Hagalaz/solver curve and compare with whatever material/director frame the solver actually evolves

## EXT:CONSTRAINT:BOUMA95

- **canonical_name:** Bouma–Fudos–Hoffmann–Cai–Paige geometric constraint solver approach
- **namespace:** `EXT:CONSTRAINT`
- **object_type:** graph-reduction / directed-algebraic geometric constraint-solving method
- **underlying_source:** `⟦SRC:BOUMA1995·487–501⟧`
- **project_provenance:** toolbox item “Geometric Constraint Solvers” `⟦PROV:HSH-TKT·§2⟧`; SAT26 manifest contains the paper filename `⟦PROV:SAT26-TBOX·manifest⟧`
- **source_scope:** 2D CAD constraints, not native 4D worldtube dynamics
- **historical_project_claim:** toolbox characterizes geometric constraint solving as “analog gear” mathematics for mandatory structural responses within UI
- **current proposed job:** candidate algorithmic inspiration/reference for explicit constraint graphs, solvability, under/over-constraint detection, and auditable geometric solution selection across Hagalaz solvers
- **critical distinction:** the **problem class** (constraint satisfaction over geometric objects) may transfer more readily than the 1995 solver's specific 2D algorithm
- **decision_state:** `CANDIDATE`
- **decision_rationale:** directly relevant at the architectural level, but implementation must be adapted or replaced for 4D/nonlinear/current solver geometry
- **next_test:** represent one current Hagalaz transformation case as a typed constraint graph and determine which parts are solved analytically, numerically, redundantly, or remain underdetermined

---

# Unreviewed queue from `H(s)H TOOLKIT.txt`

These names are recorded only to prevent loss and begin namespacing. They are **not source-verified/adopted yet**:

- `EXT:GEOMETRY:S3`
- `EXT:GEOMETRY:CLIFFORD_TORUS`
- `EXT:VARIATIONAL:FRAMED_CURVES`
- `EXT:TOPOLOGY:AMBIENT_ISOTOPY`
- `EXT:KNOT:LINK_INVARIANTS`
- `EXT:KNOT:LINKS_GOULD`
- `EXT:FUSION:Z3` — historical project meaning/source particularly needs disambiguation
- `EXT:SYMPLECTIC:BASE`
- `EXT:BV:PUSHFORWARD`
- `EXT:AKSZ:1D_SIGMA`
- `EXT:PDE:YAMABE_T_DEFORMED` — exact source/formulation unresolved
- `EXT:PDE:SIGMAK_HESSIAN`
- `EXT:ANALYSIS:FRACTIONAL_HARDY`
- `EXT:GRAPH:SPECTRAL`
- `EXT:GRAPH:OLLIVIER_RICCI`
- `EXT:COBORDISM:BASE`
- `EXT:NUMERICAL:DGC`
- `EXT:STAT:ENSEMBLE_COMETRIC` — exact external-vs-project status unresolved
- `EXT:MEDIUM:RESPONSE_KERNEL` — exact external-vs-project status unresolved

Each remains `UNREVIEWED` or `SOURCE-UNRESOLVED` until its external identity, source, notation, and project mapping are separated.

---

# Immediate decision summary — 2026-09-21

**Advance as current candidates:** `EXT:LIE:SO4`, `EXT:DIFFGEO:FRENET_R4`, `EXT:CONSTRAINT:BOUMA95`.

**Reason:** all three can address a typed problem already present at the Hagalaz active edge—4D transformations, solver-independent curve diagnostics, and explicit geometric constraint architecture—without requiring us to adopt historical SAT ontological claims.

**Not yet adopted:** none of these has `ADOPT` status. The next step is an actual interface/test against live solver geometry.

**Source-recovery blocker:** the historical `H(s)H HEAVY TOOLBOX.txt` path is currently empty and requires genealogy/content recovery rather than inference.