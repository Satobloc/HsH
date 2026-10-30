# Aster addendum | 2024–2026 time-surface and worldtube source evolution

**Status:** public-safe source-genealogy addendum to HsH issue #1079 and the December 14 P3 source/coverage docket (#566). This extends the earlier Aster report; it does not duplicate or replace it. No physical calculation, new Lean theorem, manuscript completion, or theory promotion is claimed.

## 1. Source custody

### Mersearch-first discovery

Reused Alberr's completed request `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212`; no shared request lane was overwritten and no new request was submitted.

- Production implementation: `Mercer_Searcher_1.0`, `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- Three searched repositories and pinned commits:
  - `Satobloc/SAT_THEORY_ARCHIVE_2023-25`: `50ce2aad8f8969275886ee5308669b6c2097c599`
  - `Satobloc/HsH`: `e694dd78fd4ee25775bfeb1f0455e6661f19f1a3`
  - `Satobloc/HSH_RESOURCES`: `8235284e46888075732d51d54518c5fb7b4715ec`
- `RUN_MANIFEST.json` Git blob: `15dc51969036c07aee88a837b0c048244a9d7a6f`.
- `SEARCH_RECEIPT.json` Git blob: `1ea0faee051b38e689ba434cefdc3fb15840e876`.
- `SEARCH_RECEIPT.md` Git blob: `5d3e2ba13c6959974c954dc0cf2c133a0e9d9c85`.
- Source-results SHA-256: `0e3a8aafdfce9080e1ba5146cbd22cef59b7c7da0ea7a3da6e2674cdb9e07d77`.
- Coverage recorded by the compact receipt: 15,592 files, 20,809,012 records, 3,276 hits, 444 distinct source paths (399 archive, 2,807 HsH, 70 resources).

The manifest preserves exclusions `QUARANTINE` and `PRIOR_ART`; the bridge separately excludes `mersearch_requests`. Raw `SEARCH_RESULTS` were withheld by the bridge and are not available in the published request folder. The compact receipt is a bounded locator, not an exhaustive inventory or evidence of a theory claim. Its top-source list includes the March 2024 DIMENSIONAL GRAVITY export and the October 20–21 Meridian Minkowski Ring Analysis export. The October 5–20 Meridian Free Build export was located separately through the HsH repository inventory, not claimed as a Mersearch top hit.

### Raw primary exports inspected

1. **2024 DIMENSIONAL GRAVITY**
   - Path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`
   - Git blob: `2cea1924266418e19b825b95ae51e6b7cbace7e1`
   - Conversation: `252d05c0-22ed-4ea2-a474-7966ab13145a`

2. **2026 Meridian Free Build**
   - Path: `LIVE CONVOS/26.10.05•26.10.20•Meridian Free Build — raw.json`
   - Git blob: `7af1561b321f4d9364da5eb111df689efc652827`
   - Conversation: `6ac45d1f-17b0-83ea-ad1f-fa524602378b`

3. **2026 Meridian Minkowski Ring Analysis**
   - Path: `LIVE CONVOS/26.10.20•26.10.21•Meridian Minkowski Ring Analysis — raw.json`
   - Git blob: `56a84cb85d5c386efa4ea11d322d11e95e2c7703`
   - Conversation: `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`

All geometry turns below are raw `author.role=user` nodes. That establishes their location in the archived conversation, not independent physical truth. Quoted or embedded assistant spans remain assistant-origin material.

## 2. Source chronology and status

### A. March 2024: moving-section heuristic, explicitly non-ontic

The March 22–23 source develops a moving plane / filament-intersection picture. User node `aaa28a9a-dcfc-4835-8359-e7da7b36911c` (2024-03-22 17:07:55.781Z) describes a three-dimensional time surface intersecting four-dimensional strings; the present is associated with the current intersection.

User node `aaa26f3d-e831-49cd-976e-a85c5e3b749d` (2024-03-23 03:44:26.423Z) adds an important epistemic boundary: spherical expansion is not required, other geometries may be accommodated, and the model is an abstraction / potential heuristic, not an assertion of the universe's true nature.

User node `aaa2ca24-b946-4878-a6e0-e74d235ab01c` (2024-03-23 07:27:08.324Z) edits a more explicit vocabulary: a four-dimensionally expanding time/spacetime wavefront whose experienced three-dimensional surface is “now,” with filaments intersecting that surface and particles associated with those intersections. This is a direct user edit. Later assistant summaries and the subsequent user-hosted repost are not interchangeable with this original wording; the existing Aster PR #905 separately formalizes the user-host versus phrase-origin distinction.

**Interpretation:** the 2024 construction is a geometric heuristic with an explicitly open choice of global geometry. It does not establish a spherical universe or a physical worldtube mechanism.

### B. October 9, 2026: worldtube/inertia relation and the bulk correction

In Meridian Free Build, user node `3c657387-b80b-4982-a61a-8e6d8568b8d1` (2026-10-09 01:50:55.112Z) states that resistance of a worldtube to changes in its motion is inertia, that at the classical limit particle motion is filament topology, and that worldtube curvature corresponds to inertia in the Newtonian/Minkowski description. The message uses `w=ct` as a time-length coordinate.

This is a Nathan Direct framework statement, not an independently established physical result.

The adjacent assistant node `2693b3db-3c47-4a3d-9ed3-3732cfe8ffad` (01:50:57.986Z) derives
`d²x/dw² = F/(m c²)`.
That equation is assistant reconstruction from Newtonian mechanics and `w=ct`; it is **not** a Nathan-authored SAT-O/Blockwave equation. The user later quotes assistant text in node `5a929b5e-515e-4f77-a32a-e49feef42812` (02:46:38.173Z). The quoted `d²x/dw²`-versus-intrinsic-curvature qualification is therefore not Nathan Direct merely because it appears inside a user-role message.

The unquoted Nathan-authored portion of `5a929b5e...` says SAT began as a four-dimensional visualization, treats inertia and worldtube bending as equivalent descriptions, and corrects the thin-sheet language: the time structure is a three-dimensional slice/bulk overlapping the spatial bulk as a four-dimensional structure. It also rejects a non-interacting “readout” interpretation of the time structure. This is a substantive terminology correction, not a derivation of a new field equation.

A separate user node `6f00a97a-aa84-45bf-9429-4ff70736014a` (2026-10-09 01:13:43.652Z) describes a pure second-order superhelix with one finite Kerr-like core and a larger hollow coil, while treating a soliton/responsive-medium effect as tentative. These are working proposals, not measurements.

A further user node `b5dee72d-e3e0-4e5f-9412-c8899cf192fc` (04:26:58.721Z) responds to an assistant-generated radial-dilution toy model and adds a conjectural late-time torsional contribution, including the phrase “Klein bottle torsional barygenesis.” The radial-dilution equations in its parent assistant message are not Nathan-authored equations. This October 9 conjecture is not enough to identify “Klein bottle torsional barygenesis” with the later “Klein Fabric” model.

### C. October 20, 2026: expanding-Minkowski working picture

In Meridian Minkowski Ring Analysis:

- User node `69e7e8b1-86e8-4dea-a38b-9193f7327fb5` (2026-10-20 23:27:04.725Z) corrects a visualization to say it is one instantaneous slice of the universe and asks to visualize its worldtube.
- User node `c1b42229-00a9-4119-aac3-cefa6cb97157` (23:34:44.617Z) develops the donut/cruller, internal rotation, filament/bridge/Kerr language, and a proposed relation between rotation and worldtube/particle generation. This is speculative construction language, not a derived generation law.
- User node `f658b2db-32f0-45cd-828b-140691cc9afb` (23:53:30.041Z) says the current global working picture is expanding-Minkowski rather than purely linear Minkowski, with small slices approximately equivalent; it proposes that four-dimensional donut curvature corresponds to acceleration, then explicitly labels this **a working hypothesis with no proof**.

**Reconciliation with 2024:** the later expanding-Minkowski/spherical-slice choice narrows the working model relative to the 2024 permission for other geometries. It does not convert the model into an empirically established ontology. The 2026 source itself preserves the “working hypothesis / no proof” status.

### D. October 21, 2026: direct correction to the older reciprocal model

User node `090f5160-1020-486d-9c42-df3d7dff2063` (2026-10-21 00:17:23.235Z) responds to an assistant-authored historical summary. The numbered description of reciprocal filament/timesheet deformation is assistant prose; Nathan's explicit correction is the final `>>` span: that reciprocal description is no longer the working model and has not been used since the Klein Fabric model became common.

This is a direct status correction. The message does **not** define Klein Fabric or establish its mathematical relation to the current responsive medium. Do not equate it automatically with the earlier “Klein-bottle torsional barygenesis” conjecture.

## 3. Current BEDROCK crosswalk

Current `BEDROCK.md` blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` records BR-006 as **ND + WB**, explicitly a framework-internal premise rather than demonstrated physics: worldtube geometry is the proposed physical mechanism; particle motion is worldtube topology; inertia is resistance to changing that geometry; Interbraid/back-tug is the mechanical constraint of interacting worldtubes.

BEDROCK attributes BR-006 to a Nathan Direct conversation dated 2026-10-17. That exact raw October 17 message was not independently recovered in this pass. The October 9 raw user message above is an earlier direct antecedent, not a substitute witness for the cited October 17 source.

BEDROCK's OC-002 separately leaves the temporal support of electromagnetic/electrogravity response open: wavefront-local update versus effects persisting elsewhere in the four-dimensional block. Do not conflate this open constitutive question with the older reciprocal “filament deforms timesheet / timesheet deforms filament” descriptions that Nathan later said were retired. Their relation to Klein Fabric still needs a primary-source crosswalk.

## 4. Formalization and equation boundary

The direct sources support a conceptual intersection relation, but they do not yet provide a complete typed construction for a nontrivial source-faithful theorem. Required definitions include:

1. the ambient four-dimensional manifold and metric;
2. a time function / foliation and the embedded three-dimensional slice `Σ_t`;
3. a filament curve versus finite-core worldtube, including the cross-section and regularity;
4. the intersection/readout map and whether a particle is a point, a surface, a volume, or a connected component;
5. explicit projection and composition maps between filament, worldtube, slice, responsive medium and observable readout;
6. the dynamical/constitutive law that turns geometry into force, inertia or measurable response.

The previous Aster report's candidate `R_i(τ)=F_i∩Σ_τ` remains a **derived representation of direct intersection language**, not a recovered Nathan-written equation. The assistant-derived `d²x/dw²=F/(mc²)` is a separate Newtonian-coordinate reconstruction, not a verbatim SAT-O/Blockwave equation. No corrected SAT-O/Blockwave equation is proposed in this addendum.

Existing Aster PR #905 remains open/draft on branch `research/aster-2024-pasted-prediction-origin-20261028t1412z`, head `f168f61839b2184fc1186af7831423d6389e2b9d`. Exact-head Lean 4 verification run #40980922900 completed successfully. Its `AsterPastedPredictionOrigin` theorem proves non-injectivity of a defined user-host projection in an explicit source-witness type. It does not authenticate the archived source facts, prove the worldtube construction, or validate any physical premise.

No new Lean module was appropriate here: the missing typed maps and object contracts would otherwise have to be invented. This is a formalization block, not a counterexample or failed compilation.

## 5. Physical and CODATA boundary

No measured system or observational dataset was used in this source-provenance pass. No physical calculation, fit, prediction, uncertainty propagation or CODATA comparison was performed. No measured/calibrated quantity is being inferred from the conversational geometry.

The next physical step must start with a named real system, raw/primary data, measurement method, units, uncertainties/correlations and a frozen prediction-versus-fit protocol. The current rope evidence remains a first-blush geometric heuristic, not a physical equivalence or universal law.

## 6. Next source and proof gates

1. Recover the original *Finding the Donut* material and the first explicit Klein Fabric construction. Compare the direct October 21 retirement statement with current BEDROCK OC-002 without assuming they are the same question.
2. Recover the exact raw October 17 source cited by BR-006.
3. Once the object and map contracts are source-grounded, formalize conditional geometry in Lean 4/Mathlib and record exact compile/run status, assumptions and any missing proofs.
4. Only after that, select an actual measured finite-core/contact/rotation/inspiral system for forward geometry-to-equation and reverse equation-to-geometry tests.

**Disposition:** additive source-genealogy correction; no SAT-O/Blockwave equation promotion, no new physical result, no new Lean proof, no BEDROCK change.