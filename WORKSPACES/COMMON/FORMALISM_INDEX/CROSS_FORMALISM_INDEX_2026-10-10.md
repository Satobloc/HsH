# Cross-Formalism Index | 2026-10-10

**Status:** FEDERATED WORKING INDEX, not canonical SAT/H(s)H theory. **Coordinator:** Mercer Calder. **Primary mathematical translator:** Meridian, independent implementation/audit with Mercer. This index is a navigation and translation layer, not a replacement for the live symbol registry, toolbox ledger, source-index machinery or Mersearch.

## Three-repository boundary
- **SAT archive:** historical genealogy and original equation/source locators, including discarded proposals.
- **HsH:** active typed mathematical objects, solver contracts, map relationships, verification states and current work.
- **HSH_RESOURCES:** internal/private mathematical reference, toolkit, source and tool discovery. **Public HsH/SAT pages must not link to or depend on private HSH_RESOURCES URLs.** Use original external citations or public-safe extracts when needed.

## Object identity / translation rules
Every future record: `object_id`, `source_repository`, `source_path`, `source_locator`, `source_ref_or_blob_sha`, `original_notation`, `qualified_namespace`, `object_type`, `units_dimensions`, `metric_signature`, `domain`, `frame_or_orientation`, `claim_status`, `solver_ids`, `relation_edges`, `reviewed_at`. Missing values are explicitly `UNRESOLVED`, never fabricated.

Edge types: `SAME_GLYPH` (no semantic claim), `SAME_OBJECT`, `TRANSFORMABLE`, `EQUIVALENT_UNDER`, `SPECIALIZES`, `APPROXIMATES`, `MANY_TO_ONE`, `PHYSICALLY_IDENTIFIED_CANDIDATE`, `INCOMPATIBLE`. Edges must record assumptions, reversibility, loss of information, proof obligation, independent verification and provenance. No automatic promotion from a source citation to project adoption.

## Live cross-formalism routing table
| ID | Historical SAT / source route | Current HsH implementation or analysis | Mathematical contract / open gate |
|---|---|---|---|
| CF-001 SO4 | `H(s)H TOOLKIT.txt`; `H(s)H MATH TO DO.txt` | `WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_FRENET_SO4_RATE_MAP.md` | Six SO4 generators, two spectral rates; not Lorentz boosts |
| CF-002 UI | historical UI/Whirligig sources; `[[SAT26 TOOLBOX]]/SAT26 MATH ROUNDUP.txt` | `WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_GLOBAL_UI_NOGO_LOCAL_CONNECTION.md` | Global similarity cannot create new winding; local frame required |
| CF-003 Hagalaz | `[[SAT26 TOOLBOX]]/THE SPHERES.txt` (historical candidate, not origin proof) | `WORKSPACES/MERIDIAN/2026-10-05_FREE_BUILD_NORMAL_BUNDLE_HAGALAZ_LIFT.md` | Normal-bundle recursive lift; historical ᚼ operator identity unresolved |
| CF-004 Whirligig | historical Donut/ReDonut artifacts; `[[SAT26 TOOLBOX]]/SAT26 MATH ROUNDUP.txt` | `WORKSPACES/MERIDIAN/SANDBOX_2026-10-06_WHIRLIGIG_DERIVATIVE_PATH_COMMUTATOR.md` | Equation encoding/flow composition; restricted inverse needs witness |
| CF-005 Three Spheres | `[[SAT26 TOOLBOX]]/THE SPHERES.txt` | `WORKSPACES/MERIDIAN/SOLVER_HARNESS/run099_three_spheres.case.json` | Distinguish R, r_c, rho and G; independent frame channel |
| CF-006 3+3 shells | `[[SAT26 TOOLBOX]]/THE SPHERES.txt` | current dual-shell cosmology notes (exact current path unresolved) | NOT identical to Three-Spheres intersection |
| CF-007 finite-core tube | `RMS Spacetime Filaments.txt`, `SAT ALL TOGETHER SYNTHESIS.txt` | `WORKSPACES/RAVEL/SANDBOX_2026-10-09_STRAIGHT_VACUUM_COILING_GATE.md` | Timelike constraints, curvature and finite normal radius |
| CF-008 induced metric | `H(s)H TOOLKIT.txt`; historical metric proposals | `WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_BASIS_FREE_LORENTZ_RECOVERY.md` | g=I-2uuᵀ is Lorentzian, not GR field dynamics |
| CF-009 medium mechanics | `SAT ALL TOGETHER SYNTHESIS.txt`; `RMS Spacetime Filaments.txt` | Mercer/Ravel constitutive sandbox, precise current implementation pending | Distinguish material tension, geometric torsion, wavefront coupling |
| CF-010 topology | `H(s)H TOOLKIT.txt`; `[[SAT26 TOOLBOX]]/H(s)H STRUCTURAL SKETCH.txt` | current braid/Interbraid worker constructions, exact mapping pending | Embedding codimension, framing, topology and force not interchangeable |
| CF-011 variational methods | `H(s)H TOOLKIT.txt`; `[[SAT26 TOOLBOX]]/HsHtoolkit_manifest.csv` | `WORKSPACES/MERCER/MATH_AUDIT_HARNESS/README.md` | BV/AKSZ/symplectic candidates; no automatic adoption or lossless coarse-grain |
| CF-012 historical formalism toolbox | `[[SAT26 TOOLBOX]]/` nine-file package; `H(s)H HEAVY TOOLBOX.txt` | `WORKSPACES/COMMON/terminology/TOOLBOX_NAMESPACE_LEDGER.md` | Heavy toolbox content unresolved; validate blob size before assuming empty |
| CF-013 numerical verification | `H(s)H MATH TO DO.txt` | `WORKSPACES/MERIDIAN/SOLVER_HARNESS/`, `WORKSPACES/MERCER/MATH_AUDIT_HARNESS/` | Independent frozen fixture/evidence lanes |
| CF-014 Schwarzschild Householder director | `SAT ALL TOGETHER SYNTHESIS.txt`; `H(s)H TOOLKIT.txt` | `WORKSPACES/MERCER/SANDBOX_2026-10-11_HOUSEHOLDER_SCHWARZSCHILD_ELASTIC_GATE.md` | Exact Schwarzschild exterior via g=δ−2uu and vacuum Einstein input; naive quadratic director stiffness has logarithmically divergent far-field energy; physical action unresolved |

## First validated typing example (geometry, not physical theory)
Three equal R4 hyperspheres with equilateral center separation d and radius R: `r_c=d/sqrt(3)`, `rho=sqrt(R²-d²/3)`, `G=1-d²/(3R²)`. For d=R=1, `r_c=1/sqrt(3)`, `rho=sqrt(2/3)`, `G=2/3`. A bare 'carrier radius' field is invalid. Source: `WORKSPACES/COMMON/MERIDIAN_HANDOFFS/RUN099_QUANTITY_TYPING_DISCREPANCY_CALDER_2026-09-23.md` and typed solver case.

## Next steps / gaps
1. Populate exact section/line/record locators and source blob SHAs for historical entries using pinned three-repository Mersearch, respecting the shared request slot; this table is **not** a full corpus search.
2. Build a JSONL object-and-edge index with automated dimension, signature, and inverse-map checks. Mark uncertain genealogy `UNRESOLVED`.
3. Add direct historical document boundaries from the 134-document BigBook index and the SAT26 toolbox manifest, without assuming embedded assistant text is Nathan-authored.
4. Independently test Three-Spheres/Hagalaz RUN099 frame perturbation and a separate path-dependent transport/holonomy fixture.
5. Maintain each repository's own index and regenerate public-safe navigation; do not publish private reference paths or links.

## Authority and source restrictions
Start at `Satobloc/HsH/WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`; symbol controls `WORKSPACES/COMMON/NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`, `terminology/SYMBOL_REGISTRY.md`, `terminology/TOOLBOX_NAMESPACE_LEDGER.md`. Hypothesis H proper and directly Schreiber-authored material remain off limits. Other outside comparisons require internal-first source provenance and per-item permission. Nothing here is a physical claim.
