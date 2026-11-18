# Morrow h926:s0 | O4 source-fidelity and worldtube-map audit

**Run key:** REVROT3-19-20261011:926:s0  
**Nominal:** 2026-11-18 14:00 UTC  
**Disposition:** ARCHIVE / SOURCE-FIDELITY ONLY. No theory integration, physical calculation, CODATA, new Lean theorem, or BEDROCK promotion.

## Executive finding

A recovered 2025 authoring conversation supports a distinction between the original O4 prediction-table module and a later user-directed topological-stability extension. The extension is explicitly requested, but its “stable 2/3, unstable 4+” proposition is not a theorem merely because it is presented in a formal-looking module.

The 2026 direct geometry describes a finite 4D tube/core, a 1D core, a 3D boundary, a possible mouth/interface to a timesheet, and a possible 2D worldsheet representation. The historical assistant's tubular-neighbourhood reconstruction is a conditional mathematical model, not a source-specified construction. Its maps and the core domain remain undefined.

## 1. O4 lineage and source status

- The recovered authoring conversation records the user's correction that O4 already existed and was not originally an exotic-particle module, followed by an explicit request to expand it with the proposed 2/3-filament stability and 4+-filament instability prediction.
- The original SATO_4D-Switchover.pdf bytes were not recovered. The conversation's file-search description of the baseline as a prediction table is therefore a locator, not byte-authenticated proof of the original module contents.
- SATOBLOC/SAT O4 4D.txt, SATOBLOC MISC/SAT O4 4D.txt, and SAT_O REWRITE/SAT 4D/SAT O4 4D.txt have the same Git blob SHA-1 32462848e839ad1d5b2ff9d913fae0735a6327b1. Three copies are one witness, not independent corroboration.
- The separate early-logged O4 TeX version has blob SHA-1 d63a7d5261974d092340e77c13a1ad901a3af984 and adds an n=1 case, phase-locking and cross-module claims. It is a distinct variant, not proof.
- The July SAT4D_3 and SAT4D_7 files label all modules “complete,” while SAT4D_9 still lists placeholder derivations and SAT4D_6 requires every formal statement to be derived or linked. Completion labels do not close this provenance/derivation gap.

## 2. Typed geometry map

M⁴  
  γ¹ (filament / core)  
    │ thickening T is unspecified  
    ▼  
  T⁴ (finite tube region)  
    ├── boundary ∂T³  
    ├── T⁴ ∩ Σ³ → 3D section (conditional)  
    └── ∂T³ ∩ Σ³ → 2D section (if transverse)  
                         │  
                    mouth/readout map P? [UNDEFINED]  
                         ▼  
                  curve/configuration C¹ ?  
                         │  
                  worldsheet W² ? [CANDIDATE]

Glossary: M⁴ ambient 4-manifold; γ¹ filament/core; T⁴ finite-core region; ∂T³ boundary; Σ³ timesheet/resolving hypersurface; P? mouth/readout/projection; C¹ possible curve readout; W² possible worldsheet; w fourth spatial coordinate in one direct variant; t proper/ordinary time, not assumed identical to w.

Conditional transverse dimensions in 4D are 1+3-4=0, 2+3-4=1, 3+3-4=2, and 4+3-4=3. These are dimension counts, not a selected physical mapping.

## 3. Original propositions versus assistant translation

| Source proposition | Translation / status |
|---|---|
| 4D tube around a 1D core, with 3D boundary | Direct description, but core domain, metric, thickness and construction unspecified |
| Possible mouth/interface to timesheet | Direct hypothesis; no extraction map or interface type |
| Worldsheet may simplify the 4D construction | Candidate representation, not equivalence |
| Pair-of-pants is a particular split | Direct correction; not a generic tube |
| Assistant proposes local D³ fibers and S² side-boundary fibers | Conditional tubular-neighbourhood model; requires regular core and chosen normal structure; finite interval also has end caps |
| Assistant suggests worldsheet may lose internal information | Speculation; direct source explicitly says loss is not necessary and depends on construction |
| w is proposed as a fourth spatial coordinate, with t possibly separate | Direct variant; not yet mapped to July R^(3,1) SAT-O1 |

## 4. O4 topology gate

Classical linking number for disjoint submanifolds K,L in R^n is defined by the usual degree construction when dim(K)+dim(L)=n-1. For two 1D curves this is the R³ case, not the ordinary R⁴ case. A 4D O4 stability claim therefore needs a declared 3D timesheet/projection, foliation constraint, or a separately defined 4D invariant.

The existing Alberr R4 Hopf-unlinking packet supplies an exact mathematical counterexample to treating 3D projected linking as an unrestricted ambient-R⁴ invariant. It is a geometry control, not a physical reconnection model. The Kestrel link-topology fidelity report already records the same source/typing issue and must not be duplicated.

## 5. Formal status and limits

- Existing conditional dimension gates were inspected: PR #1098 and PR #1133 built their new modules, but their full repository build failed on the unrelated MovingPlaneTraceGeometry noncomputable-definition errors. PR #873 has a successful exact-head build for a different moving-plane geometry theorem. None proves the O4 Hopf/Borromean stability claim.
- Local Lean/Lake/Elan are unavailable. No new Lean theorem or run was performed.
- No measured system, physical calculation, fit, CODATA score, or theory promotion.

## 6. Discrepancy ledger and next cursor

1. O4 baseline: original PDF bytes and authoring source still incomplete.
2. 4D linking: O4 invariant and ambient/leaf/projection not specified.
3. Worldtube: core domain and thickening map missing; endpoint caps omitted by the assistant's side-boundary shorthand.
4. Mouth: interface/readout type and map missing.
5. Worldsheet: candidate simplification, no projection/composition map.
6. w/t: fourth-spatial and spacetime variants remain separate.
7. Derivation status: module “complete” labels conflict with placeholder derivation index.

Next: recover the original O4 PDF and authoring source bytes; type the core, thickening, timesheet, mouth and worldsheet maps with domains/codomains and composition conditions; define the allowed ambient versus leaf-preserving topology and only then decide whether a precise proposition exists for formalization.

**Status:** SOURCE_FIDELITY / O4_BASELINE_PARTIAL / MAPS_UNSPECIFIED / LEAN_NOT_RUN / NO_PHYSICAL / NO_CODATA / NO_THEORY_PROMOTION.

## Source files read

- SAT.O1 4D: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O1%204D.txt
- SAT.O4 4D: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC/SAT%20O4%204D.txt
- SAT4D glossary, official directives, deployment modes, derivations index and action plans: https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/tree/main/SAT%204D%20Theory%20Work
- Topological Methods, section 13.1: https://www.math.vu.nl/~vdvorst/notes2.pdf. The classical linking-degree construction requires the dimensions of the linked submanifolds to sum to ambient dimension minus one.
- Direct user-source raw exports were inspected from Library, but are not published here. The public artifact contains no raw private conversation payload.
